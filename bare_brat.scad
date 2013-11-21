lungime_suport = 95;
latime_suport = 28;
inaltime_suport = 20;

diametru_gaura_suport = 20;
pozitie_gaura_suport = [6.5+diametru_gaura_suport/2, latime_suport/2, 0];

distanta_suport_filet = 40;
diametru_filet = 22;
pozitie_filet = [pozitie_gaura_suport[0] + distanta_suport_filet+(diametru_gaura_suport+diametru_filet)/2, latime_suport/2, 0];

difference() {
	cube([lungime_suport, latime_suport, inaltime_suport]);
	translate(pozitie_gaura_suport)
	cylinder(h = 80, r=diametru_gaura_suport/2, $fn=15);
	translate(pozitie_filet)
	cylinder(h = 80, r=diametru_filet/2, $fn=15);

}