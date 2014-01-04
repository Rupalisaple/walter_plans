
lungime_suport = 95;
latime_suport = 32;
inaltime_suport = 15;

diametru_gaura_suport = 21;
pozitie_gaura_suport = [6.5+diametru_gaura_suport/2, latime_suport/2+3, 0];

distanta_suport_filet = 41.4;


//TODO: SET DIAMETER TO 22 !! but not sure what happens!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
diametru_filet = 19;


pozitie_filet = [pozitie_gaura_suport[0] + distanta_suport_filet+(diametru_gaura_suport+diametru_filet)/2, latime_suport/2 +3, 0];

// Legaturile cu barele

difference() {
	cube([lungime_suport, latime_suport, inaltime_suport]);
	translate(pozitie_filet)
	cylinder(h = 80, r=diametru_gaura_suport/2, $fn=100);
	translate(pozitie_gaura_suport)
	cylinder(h = 80, r=diametru_filet/2, $fn=6);
	cube([60,40,30]);
}

translate([0,0,65])
difference() {
	cube([lungime_suport, latime_suport, inaltime_suport]);
	translate(pozitie_filet)
	cylinder(h = 80, r=diametru_gaura_suport/2, $fn=100);
	translate(pozitie_gaura_suport)
	cylinder(h = 80, r=diametru_filet/2, $fn=6);
}


origine_gauri = [60, -1, 22.5];

// distanta dintre centrele gaurilor
dist_gauri_lun = 35.695;
dist_gauri_lat = 22.635;      

difference() {
translate([0,0,15])
cube([lungime_suport, 5, 60]);

//gauri TODO: measure

translate(origine_gauri)
rotate([0,-90,0])
{
	rotate([-90,0,0])
	cylinder(h=80, r=4, $fn=100);	

	translate([dist_gauri_lun, 0, 0])
	rotate([-90,0,0])
	cylinder(h=80, r=4, $fn=100);

	translate([0, 0, dist_gauri_lat])
	rotate([-90,0,0])
	cylinder(h=80, r=4, $fn=100);

	translate([dist_gauri_lun, 0, dist_gauri_lat])
	rotate([-90,0,0])
	cylinder(h=80, r=4, $fn=100);

	// Gauri pt evitat exces de material

}
}


