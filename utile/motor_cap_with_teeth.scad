use <mendel_misc.inc>
use <parametric_involute_gear_v5.0.scad>

h_cylinder = 3;
h_peripherical_legs = 10;
radius_peripherical_legs = 2.25;
radius_central_hole = 1.5;
radius_cylinder = 11.65;
marginal_distance = 1.2;
per_leg_trans = radius_cylinder-radius_peripherical_legs-marginal_distance;

module motor_cap() {
	difference() {
		union() {
		// Main cylinder
		//cylinder(h = h_cylinder, r = radius_cylinder, center = false);	
		gear (number_of_teeth=33,
			circular_pitch=122,
			gear_thickness = h_cylinder,
			rim_thickness = h_cylinder,
			rim_width = 0,
			hub_thickness = h_cylinder,
			hub_diameter = 25,
			bore_diameter = 0,
			circles=0);

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