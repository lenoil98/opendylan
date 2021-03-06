Module:    apple-dylan-test-suite
Filename:  test-iteration.dylan
Summary:   Apple Dylan test suite, test-iteration
Version:   29-Oct-93
Copyright: (c) 1993 Apple Computer, Inc.

/*---------------------------------------------
Modified by: Shri Amit(amit)
Date: August 24 1996
Summary: Converted to new testworks protocol
Copyright: (c) 1996 Functional Objects, Inc.
           All rights reserved.
----------------------------------------------*/

// iteration protocol, page 122

define test initial-state-type ()
  check-true("", instance?(initial-state, <generic-function>));
end test initial-state-type;

// empty collections
define test initial-state-empty-collections ()
  check-true("", every?
    (method (class)
       #f = make(class).initial-state
     end method,
     list(<table>,
          <array>,
          <vector>,
          <stretchy-vector>,
          <string>,
          <byte-string>,
          <unicode-string>,
          <list>,
          <deque>)));
end test initial-state-empty-collections;

// empty range
define test initial-state-range ()
  check-true("", #f = make(<range>, size: 0).initial-state);
end test initial-state-range;

// This returns as an instance of <test> looks buggy
//
define test final-state-type ()
  check-true("", instance?(final-state, <generic-function>));
end test final-state-type;

// vector, deque
define test final-state ()
  check-false("", #f = deque-instance(1, 2, 3).final-state);
  check-false("", #f = vector(1, 2, 3).final-state);
  check-false("", #f = vector(1, 2, 3).final-state);
  check-false("", #f = final-state("abc"));
end test final-state;

// gets the last elt of various collections the hard way
define test final-state-1 ()
  check-true("", every?
    (method (x)
       let elt = x.first;
       let collection = x.second;
       elt = current-element(collection, collection.final-state)
     end method,
     list(list(9, vector(7, 8, 9)),
          list(9, deque-instance(7, 8, 9)),
          list(9, vector(7, 8, 9)),
          list('c', "abc"))));
end test final-state-1;

define test next-state-0 ()
  check-true("", instance?(next-state, <generic-function>));
end test next-state-0;

// gets the 3rd elt of various collections the hard way
define test iteration-protocol ()
  check-true("", every?
    (method (x)
       let elt = x.first;
       let collection = x.second;
       elt
       = current-element
           (collection,
            next-state
              (collection, next-state(collection, collection.initial-state)))
     end method,
     list(list(9, #(7, 8, 9)),
          list(9, vector(7, 8, 9)),
          list(9, deque-instance(7, 8, 9)),
          list('c', "abc"),
          list(9, range(from: 7, size: 3)))));
end test iteration-protocol;

// gets the 2nd elt using next-state and previous-state
define test next-previous-state ()
  check-true("", every?
    (method (x)
       let elt = x.first;
       let collection = x.second;
       elt
       = current-element
           (collection,
            previous-state
              (collection,
               next-state
                 (collection,
                  next-state(collection, collection.initial-state))))
     end method,
     list(list(8, vector(7, 8, 9)),
          list(8, deque-instance(7, 8, 9)),
          list('b', "abc"))));
end test next-previous-state;

// gets the 2nd elt using final-state and previous-state
define test final-previous-state ()
  check-true("", every?
    (method (x)
       let elt = x.first;
       let collection = x.second;
       elt
       = current-element
           (collection, previous-state(collection, collection.final-state))
     end method,
     list(list(8, vector(7, 8, 9)),
          list(8, deque-instance(7, 8, 9)),
          list('b', "abc"))));
end test final-previous-state;

define test current-element-0 ()
  check-true("", instance?(current-element, <generic-function>));
end test current-element-0;

define test copy-state ()
  check-true("", instance?(copy-state, <generic-function>));
end test copy-state;

define suite test-iteration-suite ()
  test initial-state-type;
  test initial-state-empty-collections;
  test initial-state-range;
  test final-state-type;
  test final-state;
  test final-state-1;
  test next-state-0;
  test iteration-protocol;
  test next-previous-state;
  test final-previous-state;
  test current-element-0;
end suite;
