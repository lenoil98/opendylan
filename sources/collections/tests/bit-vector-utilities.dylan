Module:       collections-test-suite
Synopsis:     Define bit-vector test suite
Author:       Keith Dennison
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND

// Rationale: tiny is less than one byte,
// huge is greater than a machine word,
// small is intermediate.
define constant $tiny-size = 4;
define constant $small-size = 14;
define constant $huge-size = 117;
define constant $multiple-word-size = 96;

//
// Print a bit-vector
//
// define method print-bit-vector(vector :: <bit-vector>)
//  format-out("Bit-vector size is %=, word-size is %=\n",
//              size(vector), word-size(vector));
// //  for (i from 0 below word-size(vector))
// //    format-out("Word %=: %=\n", i,
// //        primitive-wrap-machine-word(bit-vector-word(vector, i)));
// //  end for;
//   for (i from 0 below size(vector))
//     format-out("%=", element(vector, i));
//   end for;
//   format-out("\n");
// end method;


//
// Set the bits at the given indices to zero
//
define method unset-bits(vector :: <bit-vector>, bits :: <sequence>) => ()
  do(method(bit) vector[bit] := 0 end, bits);
end method;


//
// Set the bits at the given indices to one
//
define method set-bits(vector :: <bit-vector>, bits :: <sequence>) => ()
  do(method(bit) vector[bit] := 1 end, bits);
end method;


//
//
//
define method compute-not-bits(bits :: <sequence>, size :: <integer>)
 => (not-bits :: <sequence>)
  let not-bits = #();
  for (i from 0 below size)
    if (~member?(i, bits))
      not-bits := pair(i, not-bits);
    end if;
  end for;
  not-bits;
end method;

//
// Generate a deterministic but unpredictable set of element
// indices used to initialize a bit-vector. Derives a seed from
// the size, or one can be provided (for example if two different
// sequences are required)
// Note: don't use 0 for seed as RNG will always return zero in
// that case.
//
define method random-elements(size :: <integer>, #key seed)
  => (elements :: <sequence>)
  // A pseudo-random source
  local method lehmer(v :: <integer>) => (vo :: <integer>)
	  modulo(v * 75, 65537);
        end;
  // initial seed
  let rnd-val = seed | begin
			 // run a few iterations first
			 let v = size + 1;
			 for (i from 1 to 10)
			   v := lehmer(v);
			 end for;
			 v
		       end;
  assert-not-equal(rnd-val, 0);
  // Now generate approx 50% set, 50% unset
  let elements = list();
  for (i from 0 below size)
    rnd-val := lehmer(rnd-val);
    if (logbit?(1, rnd-val))
      elements := pair(i, elements);
    end if;
  end for;
  elements
end method;

//
// Return #t if a bit-vector's elements are all zero.
//
define method all-zeros(vector :: <bit-vector>) => (result :: <boolean>)
//  every?(curry(\=, 0), vector);
  let result = #t;
  for (i from 0 below vector.size)
    result := (result & (vector[i] = 0));
  end for;
  result;
end method;


//
// Return #f if a bit-vector's elements are all one.
//
define method all-ones(vector :: <bit-vector>) => (result :: <boolean>)
//  every?(curry(\=, 1), vector);
  let result = #t;
  for (i from 0 below vector.size)
    result := (result & (vector[i] = 1));
  end for;
  result;
end method;


//
// Return #t if the only elements in the bit-vector which are one are
// those indicated in the supplied sequence.
//
define method check-elements
    (vector :: <bit-vector>, set-bits :: <sequence>) => (result :: <boolean>)
  let result :: <boolean> = #t;
  for (i from 0 below vector.size)
    if (vector[i] = 0)
      result := (result & ~member?(i, set-bits));
    else
      result := (result & member?(i, set-bits));
    end if;
  end for;
  result;
end method;


//
// Consistency check for bit-vectors.
//
define method bit-vector-consistency-checks
    (prefix :: <string>, vector :: <bit-vector>, expected-size :: <integer>,
     expected-elements)
 => ()
  check-equal(concatenate(prefix, ": expected size"),
    size(vector), expected-size);
  if (expected-elements = #"all-zeros")
    check(concatenate(prefix, ": expect all elements to be zero"),
      all-zeros, vector);
  elseif (expected-elements = #"all-ones")
    check(concatenate(prefix, ": expect all elements to be one"),
      all-ones, vector);
  else
    check(concatenate(prefix, ": expected elements"),
      check-elements, vector, expected-elements);
  end if;
end method;

define method bit-vector-checks
    (vector :: <bit-vector>, pad :: <bit>, prefix :: <string>,
     expected-size :: <integer>, expected-elements, expected-pad :: <bit>)
 => ()
  check-equal(concatenate(prefix, ": expected size"),
    vector.size, expected-size);
  if (expected-elements = #"all-zeros")
    check(concatenate(prefix, ": expect all elements to be zero"),
      all-zeros, vector);
  elseif (expected-elements = #"all-ones")
    check(concatenate(prefix, ": expect all elements to be one"),
      all-ones, vector);
  else
    check(concatenate(prefix, ": expected elements"),
      check-elements, vector, expected-elements);
  end if;
  check-equal(concatenate(prefix, ": expected pad value"), pad, expected-pad);
end method;
