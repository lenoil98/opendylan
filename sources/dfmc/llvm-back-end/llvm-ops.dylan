Module: dfmc-llvm-back-end
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              Additional code is Copyright 2009-2013 Gwydion Dylan Maintainers
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND

/// Support

// Cast an integer as an i8 integer constant
define inline function i8
    (value :: <integer>) => (llvm-value :: <llvm-integer-constant>)
  current-back-end().%byte-character-constants[value]
end function;

// Cast an integer as an i32 integer constant
define inline function i32
    (value :: <abstract-integer>) => (llvm-value :: <llvm-integer-constant>)
  make(<llvm-integer-constant>, type: $llvm-i32-type, integer: value)
end function;

// Cast an integer as an i64 integer constant
define inline function i64
    (value :: <abstract-integer>) => (llvm-value :: <llvm-integer-constant>)
  make(<llvm-integer-constant>, type: $llvm-i64-type, integer: value)
end function;

// Get a pointer to the named slot of the given class
define method op--getslotptr
    (be :: <llvm-back-end>, x :: <llvm-value>,
     class :: <&class>, slot-name :: <symbol>, #rest indices)
 => (pointer :: <llvm-value>);
  let slot-descriptor :: <&slot-descriptor>
    = ^slot-descriptor(class, dylan-value(slot-name));
  let header-words = dylan-value(#"$number-header-words");
  let gep = apply(ins--gep-inbounds, be, x, 0,
                  i32(header-words + ^slot-offset(slot-descriptor, class)),
                  indices);
  llvm-value-type(gep);
  gep
end method;

// Same, but with the class name given as a symbol
define method op--getslotptr
    (be :: <llvm-back-end>, x :: <llvm-value>,
     class-name :: <symbol>, slot-name :: <symbol>, #rest indices)
 => (pointer :: <llvm-value>);
  apply(op--getslotptr, be, x, dylan-value(class-name), slot-name,
        indices)
end method;

// Cast a pointer as a pointer to the given pointer's struct type
define method op--object-pointer-cast
    (be :: <llvm-back-end>, x :: <llvm-value>, class :: <&class>)
 => (pointer :: <llvm-value>);
  let class-type = llvm-class-type(be, class);
  ins--bitcast(be, x, llvm-pointer-to(be, class-type))
end method;

// Same, but with the class name given as a symbol
define method op--object-pointer-cast
    (be :: <llvm-back-end>, x :: <llvm-value>, class-name :: <symbol>)
 => (pointer :: <llvm-value>);
  op--object-pointer-cast(be, x, dylan-value(class-name))
end method;

// Cast a pointer to <raw-pointer> type
define function op--raw-pointer-cast
    (be :: <llvm-back-end>, x :: <llvm-value>)
 => (pointer :: <llvm-value>);
  ins--bitcast(be, x, llvm-reference-type(be, dylan-value(#"<raw-pointer>")))
end function;

define function op--memcpy
    (be :: <llvm-back-end>, dst :: <llvm-value>, src :: <llvm-value>,
     byte-count :: <llvm-value>, is-volatile :: <llvm-value>,
     #key dst-alignment :: <integer> = 0, src-alignment :: <integer> = 0)
 => ();
  let dst-attribute
    = llvm-attribute-merge($llvm-attribute-nocapture,
                           llvm-attribute-alignment(dst-alignment));
  let src-attribute
    = llvm-attribute-merge($llvm-attribute-nocapture,
                           llvm-attribute-alignment(src-alignment));
  let attribute-list
    = make(<llvm-attribute-list>,
           function-attributes: $llvm-attribute-nounwind,
           parameter-attributes: vector(dst-attribute,
                                        src-attribute,
                                        $llvm-attribute-none,
                                        $llvm-attribute-none));
  let args = vector(dst, src, byte-count, is-volatile);
  let function :: <llvm-function>
    = llvm-builder-declare-intrinsic(be, "llvm.memcpy", args);
  ins--call(be, function, args, attribute-list: attribute-list)
end function;

define method op--integer-cast
    (be :: <llvm-back-end>, x :: <llvm-value>, type :: <llvm-integer-type>,
     #key sext? :: <boolean> = #f)
 => (integer :: <llvm-value>);
  let x-type = llvm-type-forward(x.llvm-value-type);
  if (type.llvm-integer-type-width < x-type.llvm-integer-type-width)
    ins--trunc(be, x, type)
  elseif (type.llvm-integer-type-width > x-type.llvm-integer-type-width)
    if (sext?)
      ins--sext(be, x, type)
    else
      ins--zext(be, x, type)
    end if
  else
    x
  end if
end method;

// Tag a raw value (known to fit) as an integer)
define method op--tag-integer
    (be :: <llvm-back-end>, integer-value :: <llvm-value>)
 => (result :: <llvm-value>);
  let shifted = ins--shl(be, integer-value, $dylan-tag-bits);
  let tagged = ins--or(be, shifted, $dylan-tag-integer);
  ins--inttoptr(be, tagged, $llvm-object-pointer-type)
end method;

define method op--tag-integer
    (be :: <llvm-back-end>, integer-value :: <abstract-integer>)
 => (result :: <llvm-value>);
  element(be.%direct-object-table, integer-value, default: #f)
    | begin
        let raw-tagged
          = generic/logior(generic/ash(integer-value, $dylan-tag-bits),
                           $dylan-tag-integer);
        let tagged = make(<llvm-integer-constant>,
                          type: be.%type-table["iWord"],
                          integer: raw-tagged);
        element(be.%direct-object-table, integer-value)
          := make(<llvm-cast-constant>,
                  operator: #"INTTOPTR",
                  type: $llvm-object-pointer-type,
                  operands: vector(tagged))
      end
end method;

// Extract an integer value from an integer-tagged object reference
define method op--untag-integer
    (be :: <llvm-back-end>, x :: <llvm-value>)
 => (integer-value :: <llvm-value>);
  let type = llvm-reference-type(be, dylan-value(#"<raw-integer>"));
  let word = ins--ptrtoint(be, x, type);
  ins--ashr(be, word, $dylan-tag-bits)
end method;

define method op--tag-character
    (be :: <llvm-back-end>, x :: <llvm-value>)
 => (character-value :: <llvm-value>);
  let shifted = ins--shl(be, x, $dylan-tag-bits);
  let tagged = ins--or(be, shifted, $dylan-tag-character);
  ins--inttoptr(be, tagged, $llvm-object-pointer-type)
end method;

define method op--tag-character
    (be :: <llvm-back-end>, char :: <character>)
 => (character-value :: <llvm-value>);
  element(be.%direct-object-table, char, default: #f)
    | begin
        let raw-tagged
          = logior(ash(as(<integer>, char), $dylan-tag-bits),
                   $dylan-tag-character);
        let tagged = make(<llvm-integer-constant>,
                          type: be.%type-table["iWord"],
                          integer: raw-tagged);
        element(be.%direct-object-table, char)
          := make(<llvm-cast-constant>,
                  operator: #"INTTOPTR",
                  type: $llvm-object-pointer-type,
                  operands: vector(tagged))
      end
end method;

define method op--untag-character
    (be :: <llvm-back-end>, x :: <llvm-value>)
 => (integer-value :: <llvm-value>);
  let type = llvm-reference-type(be, dylan-value(#"<raw-integer>"));
  let word = ins--ptrtoint(be, x, type);
  ins--ashr(be, word, $dylan-tag-bits)
end method;

// Return #t or #f for an i1 value (such as an icmp/fcmp result)
define function op--boolean
    (be :: <llvm-back-end>, x :: <llvm-value>)
 => (boolean :: <llvm-value>);
  let module = be.llvm-builder-module;
  ins--select(be, x,
              emit-reference(be, module, &true),
              emit-reference(be, module, &false))
end function;

// Round a byte count up to the next full word
define method op--round-up-to-word
    (be :: <llvm-back-end>, val) => (aligned-val :: <llvm-value>);
  let word-size = back-end-word-size(be);
  let add = ins--add(be, val, word-size - 1);
  ins--and(be, add, -word-size)
end method;

// Stack allocate a vector
define method op--stack-allocate-vector
    (back-end :: <llvm-back-end>, count)
 => (new-vector :: <llvm-value>);
  let module = back-end.llvm-builder-module;
  let header-words = dylan-value(#"$number-header-words");

  let class :: <&class> = dylan-value(#"<simple-object-vector>");

  let instance-bytes = instance-storage-bytes(back-end, class);
  let repeated-bytes
    = ins--mul(back-end, count,
               slot-storage-bytes(back-end, dylan-value(#"<object>")));
  let byte-size = ins--add(back-end, instance-bytes, repeated-bytes);
  let new-vector = ins--alloca(back-end, $llvm-i8-type, byte-size,
                               alignment: back-end-word-size(back-end));

  // Initialize the wrapper and size slots
  let vector-cast = op--object-pointer-cast(back-end, new-vector, class);
  let wrapper-slot-ptr = ins--gep-inbounds(back-end, vector-cast, 0, i32(0));
  let wrapper-name = emit-name(back-end, module, ^class-mm-wrapper(class));
  let wrapper = llvm-builder-global(back-end, wrapper-name);
  ins--store(back-end, wrapper, wrapper-slot-ptr);

  let size-slot-ptr = op--getslotptr(back-end, vector-cast, class, #"size");
  let size-ref = op--tag-integer(back-end, count);
  ins--store(back-end, size-ref, size-slot-ptr);

  new-vector
end method;

define method op--object-mm-wrapper
    (back-end :: <llvm-back-end>, object)
 => (wrapper :: <llvm-value>);
  let word-size = back-end-word-size(back-end);
  let module = back-end.llvm-builder-module;

  // Check tag to determine if this is a heap object
  let object-word
    = ins--ptrtoint(back-end, object, back-end.%type-table["iWord"]);
  let tag-bits
    = ins--and(back-end, object-word, ash(1, $dylan-tag-bits) - 1);
  let cmp = ins--icmp-eq(back-end, tag-bits, $dylan-tag-pointer);
  ins--if (back-end, cmp)
    // Retrieve the <mm-wrapper> object from the object header
    let x = op--object-pointer-cast(back-end, object, #"<object>");
    let wrapper-slot-ptr = ins--gep-inbounds(back-end, x, 0, i32(0));
    ins--load(back-end, wrapper-slot-ptr, alignment: word-size)
  ins--else
    // Look up the wrapper for this tag value in $direct-object-mm-wrappers
    let wrappers-binding = dylan-binding(#"$direct-object-mm-wrappers");
    let wrappers-constant = emit-reference(back-end, module, wrappers-binding);
    let wrappers-type = llvm-pointer-to(back-end, $llvm-i8*-type);
    let wrappers-constant-cast
      = ins--bitcast(back-end, wrappers-constant,
                     llvm-pointer-to(back-end, wrappers-type));
    let wrappers-vector
      = ins--load(back-end, wrappers-constant-cast, alignment: word-size);
    let wrappers-vector-slot-ptr
      = ins--gep-inbounds(back-end, wrappers-vector, tag-bits);
    let wrappers-element
      = ins--load(back-end, wrappers-vector-slot-ptr, alignment: word-size);
    op--object-pointer-cast(back-end, wrappers-element, #"<mm-wrapper>")
  end ins--if
end method;

define method op--likely
    (be :: <llvm-back-end>, cmp :: <llvm-value>) => (cmp :: <llvm-value>);
  ins--call-intrinsic(be, "llvm.expect", vector(cmp, $llvm-true));
  cmp
end method;

define method op--unlikely
    (be :: <llvm-back-end>, cmp :: <llvm-value>) => (cmp :: <llvm-value>);
  ins--call-intrinsic(be, "llvm.expect", vector(cmp, $llvm-false));
  cmp
end method;


/// Overflow trap

define method op--overflow-trap
    (be :: <llvm-back-end>) => ();
  op--call-error-iep(be, #"machine-word-overflow");
end method;


/// IEP calls

define method iep-function
    (back-end :: <llvm-back-end>, iep :: <llvm-value>,
     function-type :: <llvm-function-type>)
 => (function :: <llvm-value>)
  ins--bitcast(back-end, iep, llvm-pointer-to(back-end, function-type))
end method;

define method iep-function
    (back-end :: <llvm-back-end>, iep :: <llvm-constant-value>,
     function-type :: <llvm-function-type>)
 => (function :: <llvm-value>)
  llvm-constrain-type(iep.llvm-value-type,
                      llvm-pointer-to(back-end, function-type));
  iep
end method;

define method op--call-iep
    (back-end :: <llvm-back-end>, iep :: <llvm-value>,
     arguments :: <sequence>,
     #key function-type :: false-or(<llvm-function-type>),
          next :: <llvm-value> = $object-pointer-undef,
          function :: <llvm-value> = $object-pointer-undef,
          calling-convention :: <integer>
            = llvm-back-end-calling-convention-fast(back-end),
          tail-call? = #f)
 => (call :: <llvm-value>);
  let word-size = back-end-word-size(back-end);
  let return-type = llvm-reference-type(back-end, back-end.%mv-struct-type);

  let (arguments, function-type)
    = if (arguments.size > $entry-point-argument-count)
        let extra
          = ins--alloca(back-end, $llvm-object-pointer-type,
                        arguments.size - $entry-point-argument-count,
                        alignment: word-size);
        for (i from $entry-point-argument-count below arguments.size)
          let ptr = ins--gep(back-end, extra, i - $entry-point-argument-count);
          ins--store(back-end, arguments[i], ptr, alignment: word-size);
        end for;
        let arguments
          = concatenate(copy-sequence(arguments,
                                      end: $entry-point-argument-count),
                        vector(extra));
        let parameter-types
          = make(<simple-object-vector>,
                 size: $entry-point-argument-count + 3,
                 fill: $llvm-object-pointer-type);
        parameter-types[$entry-point-argument-count]
          := llvm-pointer-to(back-end, $llvm-object-pointer-type);
        let function-type
          = make(<llvm-function-type>,
                 return-type: return-type,
                 parameter-types: parameter-types,
                 varargs?: #f);
        values(arguments, function-type)
      else
        let function-type
          = function-type
          | make(<llvm-function-type>,
                 return-type: return-type,
                 parameter-types: make(<simple-object-vector>,
                                       size: arguments.size + 2,
                                       fill: $llvm-object-pointer-type),
                 varargs?: #f);
        values(arguments, function-type)
      end if;
  op--call(back-end, iep-function(back-end, iep, function-type),
           concatenate(arguments, vector(next, function)),
           type: return-type,
           calling-convention: calling-convention,
           tail-call?: tail-call?)
end method;

define method op--call-error-iep
    (back-end :: <llvm-back-end>, name :: <symbol>, #rest arguments) => ();
  let module = back-end.llvm-builder-module;

  let err-iep = dylan-value(name).^iep;
  let err-name = emit-name(back-end, module, err-iep);
  let err-global = llvm-builder-global(back-end, err-name);
  op--call-iep(back-end, err-global, arguments,
               function-type: llvm-lambda-type(back-end, err-iep),
               calling-convention: llvm-calling-convention(back-end, err-iep));
  ins--unreachable(back-end);
end method;
