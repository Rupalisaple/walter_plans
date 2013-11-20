latime = 47.4;
lungime = 30.7;
inaltime = 15;
latime_parte_centrala = 8;
cut_size = (latime-latime_parte_centrala)/2;
inaltime_parte_centrala = 10;

grosime_surub = 2.625/2;
poz_surub_x = 4.05;
poz_surub_y = 2.25;
distanta_surub_x = 33.76;
distanta_surub_y = 11.22;

grosime_surub_lego = 4.82/2;
poz_surub_lego_x = 7;
distante_surub_lego = 3.2 +2*grosime_surub_lego;
inaltime_surub_lego = inaltime - grosime_surub_lego - 1.33;
difference(){
  cube([latime, lungime, inaltime]);
	translate([0,0,inaltime-inaltime_parte_centrala])
	cube([cut_size,lungime, inaltime_parte_centrala]);
	translate([latime-cut_size,0,inaltime-inaltime_parte_centrala])
	cube([cut_size,lungime, inaltime_parte_centrala]);

	translate([poz_surub_x+grosime_surub, poz_surub_y+grosime_surub,0])
	cylinder(h = 10, r=grosime_surub, $fn=15);
	translate([poz_surub_x+grosime_surub, poz_surub_y+3*grosime_surub+distanta_surub_y,0])
	cylinder(h = 10, r=grosime_surub,$fn=15);
	translate([poz_surub_x+3*grosime_surub+distanta_surub_x,  poz_surub_y+grosime_surub,0])
	cylinder(h = 10, r=grosime_surub, $fn=15);
	translate([poz_surub_x+3*grosime_surub+distanta_surub_x, poz_surub_y+3*grosime_surub+distanta_surub_y,0])
	cylinder(h = 10, r=grosime_surub,$fn=15);

	rotate([0,90,0])
	translate([-inaltime_surub_lego,poz_surub_lego_x,0])
	cylinder(h = 100, r=grosime_surub_lego,$fn=15);
	rotate([0,90,0])
	translate([-inaltime_surub_lego,poz_surub_lego_x + distante_surub_lego,0])
	cylinder(h = 100, r=grosime_surub_lego,$fn=15);
	rotate([0,90,0])
	translate([-inaltime_surub_lego,poz_surub_lego_x + 2*distante_surub_lego,0])
	cylinder(h = 100, r=grosime_surub_lego,$fn=15);

	translate([cut_size-1,0,inaltime-inaltime_parte_centrala])
	cube([10,3, inaltime_parte_centrala]);
	translate([cut_size-1,lungime-4,inaltime-inaltime_parte_centrala])
	cube([10,4, inaltime_parte_centrala]);
}