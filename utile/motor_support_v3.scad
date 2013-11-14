module motor_support() {
   difference() {
	// 3-level structure:
	color("yellow") cube([80, 80, 15.5], center=false);
	color("red") translate([20, 0, 7]) cube([13, 80, 8.5], center=false);
	translate([33, 0, 4]) cube([47, 80, 11.5], center=false);

	// holes:
	color("blue") translate([4, 4, 0]) cube([5, 7, 15.5], center=false);
	color("blue") translate([4, 69, 0]) cube([5, 7, 15.5], center=false);
	color("blue") translate([61, 4, 0]) cube([5, 7, 4], center=false);
	color("blue") translate([61, 69, 0]) cube([5, 7, 4], center=false);

	color("black") translate([60, 50, 0]) cylinder(h=4, r=2);
	color("black") translate([43, 50, 0]) cylinder(h=4, r=2);
	color("black") translate([9, 24.6, 0]) cylinder(h=15.5, r=2);
   }
}

motor_support();