// Wade's Extruder Gears using Parametric Involute Bevel and Spur Gears by GregFrost
// by Nicholas C. Lewis (A RepRap Breeding Program)
//
// It is licensed under the Creative Commons - GNU GPL license.
// © 2010 by Nicholas C. Lewis
// http://www.thingiverse.com/thing:4305

use <mendel_misc.inc>
use <parametric_involute_gear_v5.0.scad>

//motor_gear_m10();
//ax_gear(); //this module call will make the large gear
//translate ([38,0,0])
//WadesS();  //this module call will make the small gear

module motor_gear_m10(){
	//Large WADE's Gear
rotate([0,0,-90])
	difference(){
		gear (number_of_teeth=33,
			circular_pitch=253,
			gear_thickness = 10,
			rim_thickness = 10,
			rim_width = 0,
			hub_thickness = 10,
			hub_diameter = 25,
			bore_diameter = 0,
			circles=0);

			cube ([5.5, 2.5, 40], center=true);
			cube ([2.5, 5.5, 40], center=true);

		translate([0,0,15]) rotate([-90,0,0])cylinder (r = 2, h =20, $fn = 30, center = false);
		translate([0,6,15]) rotate([-90,0,0])cylinder (r = 4, h =3, $fn = 6, center = false);
		translate([-4,6,15]) cube (size = ([8,3,20]), center = false);
	} 
}

module motor_gear(){
	//Large WADE's Gear
	difference(){
		gear (number_of_teeth=34,
			circular_pitch=243,
			gear_thickness = 10,
			rim_thickness = 10,
			rim_width = 0,
			hub_thickness = 20,
			hub_diameter = 25,
			bore_diameter = 0,
			circles=0);
		difference(){
			cylinder (r = 4.5, h = 40, $fn = 100, center = true);
			translate([-4,3,-20]) cube(size = ([8,8,40]), center = false);
		}
		translate([0,0,15]) rotate([-90,0,0])cylinder (r = 2, h =20, $fn = 30, center = false);
		translate([0,6,15]) rotate([-90,0,0])cylinder (r = 4, h =3, $fn = 6, center = false);
		translate([-4,6,15]) cube (size = ([8,3,20]), center = false);
	}
}

module ax_gear(){
	//Large WADE's Gear
	difference(){
		gear (number_of_teeth=50,
			circular_pitch=26,
			gear_thickness = 10,
			rim_thickness = 10,
			rim_width = 0,
			hub_thickness = 13,
			hub_diameter = 0,
			bore_diameter = 12,
			circles=0);
/*
		translate([0,0,6])rotate([180,0,0])m8_hole_vert_with_hex(100);

		for (i=[1:5])
		{
		rotate([0,0,360/5*i])
		translate([18,0,-1])
		drop ();
		}
*/
	}
}


module drop()
{
cylinder(r=5,h=10);
rotate([0,0,45])
cube([5,5,10]);
}

module WadesS(){
	//small WADE's Gear
	difference(){
		gear (number_of_teeth=11,
			circular_pitch=268,
			gear_thickness = 9,
			rim_thickness = 9,
			hub_thickness = 16,
			hub_diameter = 20,
			bore_diameter = 5.5,
			circles=0);
		translate([0,0,10]) cylinder($fn=6,r=11.5/2,h=7);
		translate([0,0,12.5])rotate([0,90,-90])rotate([0,0,360/16])cylinder(,$fn=8,r=1.7,h=15);
		translate([0,-7.5,12.5])rotate([0,90,-90])rotate([0,0,360/16])cylinder($fn=8,r=3,h=5);
	}
}
