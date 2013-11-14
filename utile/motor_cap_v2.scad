h_cylinder = 3;
h_peripherical_legs = 11;
radius_peripherical_legs = 2.325;
radius_central_hole = 1.5;
radius_cylinder = 11.65;
marginal_distance = 1.4;
per_leg_trans = radius_cylinder-radius_peripherical_legs-marginal_distance;

module motor_cap() {
	difference() {
		union() {
		// Main cylinder
		cylinder(h = h_cylinder, r = radius_cylinder, center = false);	

		// Peripherical legs
		translate([per_leg_trans, 0, 0]) color("black") cylinder(h = h_peripherical_legs, r = radius_peripherical_legs, center = false, $fn = 100);
		translate([-per_leg_trans, 0, 0]) color("black") cylinder(h = h_peripherical_legs, r = radius_peripherical_legs, center = false, $fn = 100);
		translate([0, per_leg_trans, 0]) color("black") cylinder(h = h_peripherical_legs, r = radius_peripherical_legs, center = false, $fn = 100);
		translate([0, -per_leg_trans, 0]) color("black") cylinder(h = h_peripherical_legs, r = radius_peripherical_legs, center = false, $fn = 100);
		}
		// Central hole
		cylinder(h = h_cylinder, r = radius_central_hole, center = false, $fn = 100);
	}
}

 motor_cap();