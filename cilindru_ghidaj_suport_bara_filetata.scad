module cilindru_ghidaj_suport_bara_filetata() {
	union() {
		difference() {
			color("black") cylinder(h=4, r=10, center=false);
			color("red") cylinder(h=4, r=5.3, center=false);
		}

		translate([0, 0, 4]) difference() {
			cylinder(h=10, r=13, center=false);
			color("red") cylinder(h=10, r=5.3, center=false);
			translate([0, 8.5, 7.95]) color("gray") cube([6.8, 3, 5.95], center=true);
			translate([0, 8.5, 5]) rotate([-90, 0, 0]) color("green") cylinder(h=3, r=3.4, $fn=6, center=true);
			translate([0,  5, 5]) rotate([-90, 0, 0]) color("blue") cylinder(h=8, r=1.5, $fn=30);
		}
		
	}
}


