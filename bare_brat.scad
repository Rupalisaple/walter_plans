
lungime_suport = 95;
latime_suport = 32;
inaltime_suport = 10;

diametru_gaura_suport = 21;
pozitie_gaura_suport = [6.5+diametru_gaura_suport/2, latime_suport/2+3, 0];

distanta_suport_filet = 41.4;
diametru_filet = 19;
pozitie_filet = [pozitie_gaura_suport[0] + distanta_suport_filet+(diametru_gaura_suport+diametru_filet)/2, latime_suport/2 +3, 0];

// Legaturile cu barele (TODO: IMPORT FROM axes_support!!!)


difference() {
	cube([lungime_suport, latime_suport, inaltime_suport]);
	translate(pozitie_gaura_suport)
	cylinder(h = 80, r=diametru_gaura_suport/2, $fn=60);
	translate(pozitie_filet)
	cylinder(h = 80, r=diametru_filet/2, $fn=6);

}

translate([0,0,60])
difference() {
	cube([lungime_suport, latime_suport, inaltime_suport]);
	translate(pozitie_gaura_suport)
	cylinder(h = 80, r=diametru_gaura_suport/2, $fn=60);
	translate(pozitie_filet)
	cylinder(h = 80, r=diametru_filet/2, $fn=6);
}


origine_gauri = [30, -1, 28];

// distanta dintre centrele gaurilor
dist_gauri_lun = 35.695;
dist_gauri_lat = 22.635;      

difference() {
translate([0,0,20])
cube([lungime_suport, 5, 60]);

//gauri TODO: measure
//rotate([0,90,0])
translate(origine_gauri)
{
rotate([-90,0,0])
cylinder(h=80, r=4, $fn=60);	

translate([dist_gauri_lun, 0, 0])
rotate([-90,0,0])
cylinder(h=80, r=4, $fn=60);

translate([0, 0, dist_gauri_lat])
rotate([-90,0,0])
cylinder(h=80, r=4, $fn=60);

translate([dist_gauri_lun, 0, dist_gauri_lat])
rotate([-90,0,0])
cylinder(h=80, r=4, $fn=60);

}
}


