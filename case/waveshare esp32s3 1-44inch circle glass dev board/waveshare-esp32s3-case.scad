// Waveshare ESP32-S3-Touch-LCD-1.46 slim adhesive back cover — v2
// Revised after physical fit: full 44.77 mm glass/bezel footprint and larger rear cavity.
$fn=240;

outer_d = 44.75;       // essentially flush with 44.77 mm front glass
inner_d = 42.35;       // generous cavity for PCB/components; 1.20 mm radial wall
back_t  = 1.20;        // flat adhesive surface
cavity_h = 10.15;      // increased rear-component clearance
wall_h = back_t + cavity_h;

usb_w = 14.5;          // generous cable/connector opening
usb_h = 7.5;
side_slot_w = 10.0;    // relief for side controls/components
side_slot_h = 6.5;

module shell() {
  difference() {
    cylinder(d=outer_d, h=wall_h);
    translate([0,0,back_t]) cylinder(d=inner_d, h=cavity_h+0.3);

    // USB-C radial opening
    translate([-usb_w/2, -outer_d/2-1.5, back_t+0.5])
      cube([usb_w, 7, usb_h]);

    // Broad side reliefs to avoid fouling controls/components.
    translate([outer_d/2-3.5, -side_slot_w/2, back_t+0.8])
      cube([7, side_slot_w, side_slot_h]);
    translate([-outer_d/2-3.5, -side_slot_w/2, back_t+0.8])
      cube([7, side_slot_w, side_slot_h]);
  }
}

shell();
