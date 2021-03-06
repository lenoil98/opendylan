Module:       duim-test-suite
Synopsis:     DUIM test suite
Author:       Andy Armstrong
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND

/// Geometry

define interface-specification-suite duim-geometry-specification-suite ()
  // Coordinates
  constant $largest-coordinate :: <integer>;
  constant $smallest-coordinate :: <integer>;
  // TODO(cgay): 
  //function do-coordinates (<function>, limited(<sequence>, of: <integer>)) => ();
  //function do-endpoint-coordinates (<function>, limited(<sequence>, of: <integer>)) => ();
  function fix-coordinate (<real>) => (<integer>);

  // Bounding boxes
  open abstract instantiable class <bounding-box> (<region>);
  function bounding-box (<object>, #"key", #"into") => (<bounding-box>);
  function bounding-box? (<object>) => (<boolean>);
  // TODO(cgay): https://github.com/dylan-lang/opendylan/issues/1295
  // open generic function box-edges
  //      (<bounding-box>)
  //   => (<integer>, <integer>, <integer>, <integer>);
  // open generic function set-box-edges
  //      (<bounding-box>, <integer>, <integer>, <integer>, <integer>)
  //   => (<bounding-box>);
  // open generic function box-position
  //      (<bounding-box>) => (<integer>, <integer>);
  // open generic function set-box-position
  //      (<bounding-box>, <integer>, <integer>) => (<bounding-box>);
  // open generic function box-size
  //      (<bounding-box>) => (<integer>, <integer>);
  // open generic function set-box-size
  //      (<bounding-box>, <integer>, <integer>) => (<bounding-box>);
  // function box-left   (<bounding-box>) => (<integer>);
  // function box-top    (<bounding-box>) => (<integer>);
  // function box-right  (<bounding-box>) => (<integer>);
  // function box-bottom (<bounding-box>) => (<integer>);
  // function box-width  (<bounding-box>) => (<integer>);
  // function box-height (<bounding-box>) => (<integer>);
  function make-bounding-box
      (<real>, <real>, <real>, <real>) => (<bounding-box>);

  // Regions
  constant $everywhere :: <region>;
  constant $nowhere    :: <region>;
  open abstract class <region> (<object>);
  open abstract class <area> (<region>);
  open abstract class <path> (<region>);
  open abstract class <region-set> (<region>);
  open abstract instantiable class <point> (<region>);
  sealed instantiable class <standard-point> (<point>);

  // Transforms
  constant $identity-transform :: <transform>;
  open abstract instantiable class <transform> (<object>);
  open abstract class <transform-error> (<error>);
  sealed instantiable class <singular-transform> (<transform-error>);
end duim-geometry-specification-suite;


/// DCs

define interface-specification-suite duim-dcs-specification-suite ()
  // Colors
  constant $foreground :: <ink>;
  constant $background :: <ink>;
  constant $black :: <color>;
  constant $blue :: <color>;
  constant $cyan :: <color>;
  constant $green :: <color>;
  constant $magenta :: <color>;
  constant $red :: <color>;
  constant $white :: <color>;
  constant $yellow :: <color>;
  open abstract instantiable class <color> (<ink>);
  open abstract instantiable class <contrasting-color> (<color>);
  open generic function color-ihs (<color>) => (<real>, <real>, <real>, <real>);
  open generic function color-rgb (<color>) => (<real>, <real>, <real>, <real>);
  open generic function color-luminosity (<color>) => (<real>);
  function color? (<object>) => (<boolean>);
  function contrasting-colors-limit (<object>) => (<integer>);
  function make-contrasting-colors (<integer>, #"key", #"k") => (<object>);
  function make-gray-color (<real>, #"key", #"opacity") => (<color>);
  function make-ihs-color
      (<real>, <real>, <real>, #"key", #"opacity") => (<color>);
  function make-rgb-color
      (<real>, <real>, <real>, #"key", #"opacity") => (<color>);

  open abstract instantiable class <brush> (<object>);
  sealed instantiable class <color-not-found> (<error>);
  open abstract instantiable class <device-font> (<text-style>);
  open abstract instantiable class <dynamic-color> (<color>);
  open abstract class <image> (<ink>);
  open abstract class <ink> (<object>);
  sealed instantiable class <palette-full> (<error>);
  open abstract instantiable class <palette> (<object>);
  open abstract instantiable class <pattern> (<stencil>);
  open abstract instantiable class <pen> (<object>);
  open abstract instantiable class <stencil> (<image>);
  open abstract instantiable class <text-style> (<object>);
end duim-dcs-specification-suite;


/// DUIM-Sheets classes

define interface-specification-suite duim-events-specification-suite ()
  open abstract class <event> (<object>);
  open abstract class <sheet-event> (<event>);
  open abstract class <device-event> (<sheet-event>);
  open abstract class <pointer-event> (<device-event>);
  sealed instantiable class <pointer-motion-event> (<pointer-event>);
  sealed instantiable class <pointer-drag-event> (<object>);
  sealed instantiable class <port-terminated-event> (<frame-event>);
  sealed instantiable class <pointer-boundary-event> (<pointer-motion-event>);
  sealed instantiable class <pointer-enter-event> (<object>);
  sealed instantiable class <pointer-exit-event> (<pointer-event>);
  open abstract class <pointer-button-event> (<pointer-event>);
  sealed instantiable class <button-press-event> (<pointer-button-event>);
  sealed instantiable class <button-release-event> (<pointer-button-event>);
  sealed instantiable class <double-click-event> (<pointer-button-event>);
  open abstract class <keyboard-event> (<device-event>);
  sealed instantiable class <key-press-event> (<keyboard-event>);
  sealed instantiable class <key-release-event> (<keyboard-event>);
  open abstract class <window-event> (<sheet-event>);
  sealed instantiable class <window-configuration-event> (<window-event>);
  sealed instantiable class <window-repaint-event> (<window-event>);
  open abstract class <frame-event> (<event>);
  sealed instantiable class <timer-event> (<frame-event>);
end duim-events-specification-suite;

define interface-specification-suite duim-sheets-specification-suite ()
  open abstract class <caret> (<object>);
  open abstract class <display> (<sheet>);
  open abstract class <clipboard> (<object>);
  open abstract class <frame> (<object>);
  open abstract class <frame-manager> (<object>);
  // TODO(cgay): https://github.com/dylan-lang/opendylan/issues/1295
  //open abstract instantiable class <medium> (<object>);
  open abstract instantiable class <pointer> (<object>);
  open abstract class <port> (<object>);
  open abstract class <sheet> (<object>);
  sealed instantiable class <undefined-text-style-mapping> (<error>);

  suite duim-events-specification-suite;
end duim-sheets-specification-suite;


/// Graphics

define interface-specification-suite duim-graphics-specification-suite ()
  // TODO(cgay): https://github.com/dylan-lang/opendylan/issues/1295
  //open abstract instantiable class <pixmap> (<image>);
  //open abstract instantiable class <pixmap-medium> (<medium>);
end duim-graphics-specification-suite;

// There's a warning for this if all the specs in a suite are commented
// out. Remove this after the above TODO is todone.
ignore($duim-graphics-specification-suite-spec);


/// Layouts

define interface-specification-suite duim-layouts-specification-suite ()
  open abstract class <layout> (<abstract-sheet>);
  open abstract class <leaf-pane> (<sheet>);
  open abstract class <basic-composite-pane> (<sheet>);
  open abstract class <single-child-composite-pane> (<basic-composite-pane>);
  open abstract class <multiple-child-composite-pane> (<basic-composite-pane>);
  sealed instantiable class <null-pane> (<leaf-pane>);
  open abstract instantiable class <drawing-pane> (<sheet>);
  open abstract instantiable class <simple-pane> (<sheet>);
  open abstract instantiable class <top-level-sheet> (<sheet>);
  open abstract instantiable class <column-layout> (<layout>);
  open abstract instantiable class <fixed-layout> (<layout>);
  open abstract instantiable class <pinboard-layout> (<layout>);
  open abstract instantiable class <row-layout> (<layout>);
  open abstract instantiable class <stack-layout> (<layout>);
  open abstract instantiable class <table-layout> (<layout>);
  open abstract instantiable class <grid-layout> (<table-layout>);
end duim-layouts-specification-suite;


/// Gadget classes

define interface-specification-suite duim-gadgets-specification-suite ()
  open abstract class <gadget> (<object>);
  open abstract class <action-gadget> (<gadget>);
  open abstract class <collection-gadget> (<value-gadget>);
  open abstract class <text-gadget> (<value-gadget>);
  open abstract class <value-gadget> (<gadget>);
  open abstract class <value-range-gadget> (<value-gadget>);
  open abstract instantiable class <label> (<gadget>);
  open abstract instantiable class <password-field> (<text-gadget>);
  open abstract instantiable class <slider> (<value-range-gadget>);
  open abstract instantiable class <text-editor> (<text-gadget>);
  open abstract instantiable class <text-field> (<text-gadget>);
  open abstract instantiable class <button-box> (<collection-gadget>);
  open abstract instantiable class <button> (<value-gadget>);
  open abstract instantiable class <check-box> (<button-box>);
  open abstract instantiable class <check-button> (<button>);
  open abstract instantiable class <check-menu-button> (<button>);
  open abstract instantiable class <check-menu-box> (<menu-box>);
  open abstract instantiable class <list-box> (<collection-gadget>);
  open abstract instantiable class <menu-bar> (<value-gadget>);
  open abstract instantiable class <menu-button> (<button>);
  open abstract instantiable class <menu-box> (<collection-gadget>);
  open abstract instantiable class <menu> (<gadget>);
  open abstract instantiable class <option-box> (<collection-gadget>);
  open abstract instantiable class <combo-box> (<collection-gadget>);
  open abstract instantiable class <push-box> (<button-box>);
  open abstract instantiable class <push-button> (<button>);
  open abstract instantiable class <push-menu-button> (<button>);
  open abstract instantiable class <push-menu-box> (<menu-box>);
  open abstract instantiable class <radio-box> (<button-box>);
  open abstract instantiable class <radio-button> (<button>);
  open abstract instantiable class <radio-menu-button> (<button>);
  open abstract instantiable class <radio-menu-box> (<menu-box>);
  open abstract instantiable class <spin-box> (<collection-gadget>);
  // TODO(cgay): https://github.com/dylan-lang/opendylan/issues/1295
  //open abstract instantiable class <status-bar> (<value-gadget>);
  open abstract instantiable class <tool-bar> (<gadget>);
  open abstract instantiable class <scroll-bar> (<value-range-gadget>);
  open abstract instantiable class <scroller> (<gadget>);
  open abstract instantiable class <viewport> (<gadget>);
  open abstract instantiable class <border> (<gadget>);
  open abstract instantiable class <group-box> (<gadget>);
  open abstract instantiable class <separator> (<gadget>);
  open abstract instantiable class <spacing> (<gadget>);
  open abstract instantiable class <splitter> (<gadget>);
  open abstract instantiable class <tab-control> (<value-gadget>);
  // TODO(cgay): https://github.com/dylan-lang/opendylan/issues/1295
  //open abstract instantiable class <page> (<gadget>);
  open abstract instantiable class <tab-control-page> (<page>);
  open abstract instantiable class <list-control> (<collection-gadget>);
  // TODO(cgay): https://github.com/dylan-lang/opendylan/issues/1295
  //open abstract instantiable class <list-item> (<object>);
  open abstract instantiable class <tree-control> (<collection-gadget>);
  // TODO(cgay): https://github.com/dylan-lang/opendylan/issues/1295
  //open abstract instantiable class <tree-node> (<object>);
  open abstract instantiable class <table-control> (<collection-gadget>);
  // TODO(cgay): https://github.com/dylan-lang/opendylan/issues/1295
  //open abstract instantiable class <table-item> (<object>);
  open abstract instantiable class <progress-bar> (<value-range-gadget>);
end duim-gadgets-specification-suite;


/// Frames

define interface-specification-suite duim-commands-specification-suite ()
  open abstract class <command> (<object>);
  // TODO(cgay): https://github.com/dylan-lang/opendylan/issues/1295
  //sealed instantiable class <functional-command> (<command>);
  open abstract instantiable class <command-decorator> (<object>);
  open abstract instantiable class <command-table> (<object>);
end duim-commands-specification-suite;

define interface-specification-suite duim-frame-events-specification-suite ()
  sealed instantiable class <frame-created-event> (<frame-event>);
  sealed instantiable class <frame-destroyed-event> (<frame-event>);
  sealed instantiable class <frame-exit-event> (<frame-event>);
  sealed instantiable class <frame-exited-event> (<frame-event>);
  sealed instantiable class <frame-mapped-event> (<frame-event>);
  sealed instantiable class <frame-unmapped-event> (<frame-event>);
  sealed instantiable class <application-exited-event> (<frame-exited-event>);
end duim-frame-events-specification-suite;

define interface-specification-suite duim-frames-specification-suite ()
  open abstract instantiable class <simple-frame> (<frame>);
  open abstract instantiable class <dialog-frame> (<simple-frame>);
  open instantiable class <property-frame> (<dialog-frame>);
  open instantiable class <property-page> (<page>);
  open instantiable class <wizard-frame> (<dialog-frame>);
  open instantiable class <wizard-page> (<page>);

  suite duim-commands-specification-suite;
  suite duim-frame-events-specification-suite;
end duim-frames-specification-suite;


/// Extended Geometry

//---*** This should be in a separate test suite
define interface-specification-suite duim-extended-geometry-specification-suite ()
  open abstract instantiable class <ellipse> (<area>);
  open abstract instantiable class <elliptical-arc> (<path>);
  open abstract instantiable class <line> (<path>);
  open abstract instantiable class <polygon> (<area>);
  open abstract instantiable class <polyline> (<path>);
  open abstract instantiable class <rectangle> (<area>);
end duim-extended-geometry-specification-suite;


/// Gadget panes

/*---*** This should be in a separate test suite
define interface-specification-suite duim-gadget-panes-specification-suite ()
  sealed instantiable class <border-pane> (<border>);
  sealed instantiable class <group-box-pane> (<group-box>);
  sealed instantiable class <spacing-pane> (<spacing>);
  sealed instantiable class <spin-box-pane> (<spin-box>);
  sealed instantiable class <tab-control-pane> (<tab-control>);
  sealed instantiable class <list-control-pane> (<list-control>);
  sealed instantiable class <list-item-pane> (<list-item>);
  sealed instantiable class <table-control-pane> (<table-control>);
  sealed instantiable class <table-item-pane> (<table-item>);
  sealed instantiable class <tree-control-pane> (<tree-control>);
  sealed instantiable class <tree-node-pane> (<tree-node>);
end duim-gadget-panes-specification-suite;
*/


/// The DUIM library specification

define suite duim-test-suite ()
  suite duim-geometry-specification-suite;
  suite duim-dcs-specification-suite;
  suite duim-sheets-specification-suite;
  suite duim-graphics-specification-suite;
  suite duim-layouts-specification-suite;
  suite duim-gadgets-specification-suite;
  suite duim-frames-specification-suite;
  suite duim-extended-geometry-specification-suite;
end suite;
