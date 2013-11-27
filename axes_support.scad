module axes_support() {
   difference() {
	// basic structure
	color("yellow") cube([19, 66, 10], center=true);
	color("red") translate([0, 21, 0]) cylinder(h = 10, r=7.5, $fn=100, center=true);
	color("blue") translate([0, -21, 0]) cylinder(h = 10, r=7.5, $fn=6, center=true);
   }
}

axes_support();