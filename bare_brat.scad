lungime_suport = 95;
latime_suport = 40;
inaltime_suport = 20;

diametru_gaura_suport = 20;
pozitie_gaura_suport = [6.5+diametru_gaura_suport/2, latime_suport/2+5, 0];

distanta_suport_filet = 40;
diametru_filet = 19.5656;
pozitie_filet = [pozitie_gaura_suport[0] + distanta_suport_filet+(diametru_gaura_suport+diametru_filet)/2, latime_suport/2 +5, 0];

// Legaturile cu barele (TODO: IMPORT FROM axes_support!!!)

difference() {
	cube([lungime_suport, latime_suport, inaltime_suport]);
	translate(pozitie_gaura_suport)
	cylinder(h = 80, r=diametru_gaura_suport/2, $fn=15);
	translate(pozitie_filet)
	cylinder(h = 80, r=diametru_filet/2, $fn=6);

}
translate([0,0,60])
difference() {
	cube([lungime_suport, latime_suport, inaltime_suport]);
	translate(pozitie_gaura_suport)
	cylinder(h = 80, r=diametru_gaura_suport/2, $fn=15);
	translate(pozitie_filet)
	cylinder(h = 80, r=diametru_filet/2, $fn=6);
}


origine_gauri = [20, -1, 30];
difference() {
translate([0,0,20])
cube([lungime_suport, 10, 40]);

//gauri TODO: measure

//rotate([0,90,0])
translate(origine_gauri)
{
rotate([-90,0,0])
cylinder(h=80, r=5, $fn=15);

translate([40, 0, 0])
rotate([-90,0,0])
cylinder(h=80, r=5, $fn=15);

translate([0, 0, 20])
rotate([-90,0,0])
cylinder(h=80, r=5, $fn=15);

translate([40, 0, 20])
rotate([-90,0,0])
cylinder(h=80, r=5, $fn=15);

}
}