latime_suport = 57.1;
lungime_suport =  57.1;
grosime_suport = 1.59;
inaltime_suport = 23.62;

raza_gaura = 8/2;
distanta_gauri_x = 27.85;
distanta_gauri_y = 14.87;
poz_gaura_x = 8.53;
poz_gaura_y = 13.30;
latime_picior = 8;
union() {

difference() {
	cube([latime_suport, lungime_suport, grosime_suport]);
	translate([poz_gaura_x + raza_gaura, poz_gaura_y+raza_gaura, 0])
	cylinder(h=10, r = raza_gaura);

	translate([poz_gaura_x + 3*raza_gaura + distanta_gauri_x, poz_gaura_y+raza_gaura, 0])
	cylinder(h=10, r = raza_gaura);

	translate([poz_gaura_x + raza_gaura, poz_gaura_y+3*raza_gaura+distanta_gauri_y, 0])
	cylinder(h=10, r = raza_gaura);

	translate([poz_gaura_x + 3*raza_gaura + distanta_gauri_x,  poz_gaura_y+3*raza_gaura+distanta_gauri_y, 0])
	cylinder(h=10, r = raza_gaura);
}


cube([latime_picior,grosime_suport, inaltime_suport]);
translate([latime_suport - latime_picior, 0, 0])
cube([latime_picior,grosime_suport, inaltime_suport]);

translate([0, lungime_suport-grosime_suport, 0])
cube([latime_picior,grosime_suport, inaltime_suport]);

translate([latime_suport - latime_picior, lungime_suport-grosime_suport, 0])
cube([latime_picior,grosime_suport, inaltime_suport]);
}