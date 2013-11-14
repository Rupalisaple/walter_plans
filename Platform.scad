

include <iRobot.scad>
include <motor_support_decupat.scad> //motor_support();

//global variables
	lungime_bara_verticala = 333.5;
	lungime_bara_orizontala = 267.5;

	
	pozitie_gaura = [-111.4650, 2.5960, 77.8];	// folosita la toate barele
	pozitie_bara = pozitie_gaura + [-23.5, -15.1/2+1, 1]; // folosi a la barele verticale
	pozitie_bara_oriz = pozitie_gaura + [-22.5, -15.1/2+2, 0];
	pozitie_bara_oriz_sp = pozitie_gaura + [-22.5, +15.1/2 +2 +69.85, 0];
	pozitie_bara_oriz_sus_f =[pozitie_bara_oriz[0],
	                           pozitie_bara_oriz[1]-1,
									  pozitie_bara_oriz[2]+lungime_bara_verticala + 1];
	pozitie_bara_oriz_sus_sp =[pozitie_bara_oriz_sp[0],
	                           pozitie_bara_oriz_sp[1]+1,
									  pozitie_bara_oriz_sp[2]+lungime_bara_verticala + 1];
dimensiuni_ghidaj = [82, 20, 6];
distanta_cadru = 69.85 + 15.1 +2; //distanta dintre cadru fata si cadru spate
pozitie_ghidaj_cadru = 40; //distanta de la capat cadru la ghidaj
raza_gaura_ghidaj_suport = 4;
inaltime_bara_cilindrica = lungime_bara_verticala * 2.5;

module screws(){
}
// Default diameter: 329.95
//irobot(329.95);

module bara(len=100){
	difference(){
		cube([15.1, 15.1, len]);
		translate([1,1])
		cube([14.1, 14.1, len]);
	}
}


module ghidaj_support()
{
        difference(){
                translate ([-41,-10,0]) cube (dimensiuni_ghidaj, center = false);
                cylinder (r = raza_gaura_ghidaj_suport, h = 6, center = false, $fn = 50);
                translate([33.5, -4, 0]) cube([5, 7, 6], center = false);
                translate([-38.5, -4, 0]) cube([5, 7, 6], center = false);
                translate([0,0,3])rotate([-90,0,0]) cylinder(h = 12, r = 1.5, $fn = 30);
        }
}


module cadru(){	

	// Bara verticala dreapta fata
	translate(pozitie_bara)
	bara(lungime_bara_verticala);
	
	// Bara verticala stanga fata
	
	translate([ -pozitie_bara[0], pozitie_bara[1], pozitie_bara[2]])
	rotate([0,0,90])
	bara(lungime_bara_verticala);
	
	// Bara verticala stanga spate
	// adunam pe y distanta dintre centrele suruburilor
	translate([ -pozitie_bara[0], pozitie_bara[1] + distanta_cadru, pozitie_bara[2]])
	rotate([0,0,180])
	bara(lungime_bara_verticala);

	// Bara verticala dreapta spate
	translate([ pozitie_bara[0], pozitie_bara[1] + distanta_cadru, pozitie_bara[2]])
	rotate([0,0, -90])
	bara(lungime_bara_verticala);


	// Bara orizontala fata
	translate(pozitie_bara_oriz)
	rotate([90,0,0])
	rotate([0,90,0])
	bara(lungime_bara_orizontala);

	// Bara orizontala spate
	translate(pozitie_bara_oriz_sp)
	rotate([180,0,0])
	rotate([0,90,0])
	bara(lungime_bara_orizontala);
	
	// Bara sus fata
	
	translate(pozitie_bara_oriz_sus_f)
	rotate([90,0,0])
	rotate([0,90,0])
	bara(lungime_bara_orizontala);


	// Bara sus spate
	
	translate(pozitie_bara_oriz_sus_sp)
	
	rotate([180,0,0])
	rotate([0,90,0])
	bara(lungime_bara_orizontala);
	
	
	//Bara suport dreapta
	translate([ -pozitie_bara[0] - 1, pozitie_bara[1] + 59.85 + 15.1 +2, pozitie_bara[2] + lungime_bara_verticala / 2])
	rotate([45, 0, 0])
	cube([1, 15, 100]);

	//Bara suport stanga
	translate([ pozitie_bara[0] + 1, pozitie_bara[1] + 59.85 + 15.1 +2, pozitie_bara[2] + lungime_bara_verticala / 2])
	rotate([45, 0, 0])
	cube([1, 15, 100]);
	
}

module teava_ghidaj(){
	translate(pozitie_bara_oriz_sp)
	rotate([0, 0, 90])
	translate([-distanta_cadru / 2, -dimensiuni_ghidaj[1] / 2 - pozitie_ghidaj_cadru, 1])

		cylinder(r = raza_gaura_ghidaj_suport, h = inaltime_bara_cilindrica);
}



irobot();
cadru();
translate(pozitie_bara_oriz_sus_sp)
rotate([0, 0, 90])
translate([-distanta_cadru / 2, -dimensiuni_ghidaj[1] / 2 - pozitie_ghidaj_cadru, 1])
ghidaj_support();

translate(pozitie_bara_oriz_sp)
rotate([0, 0, 90])
translate([-distanta_cadru / 2, -dimensiuni_ghidaj[1] / 2 - pozitie_ghidaj_cadru, 1])
ghidaj_support();

teava_ghidaj();

translate(pozitie_bara_oriz_sp + [lungime_bara_orizontala-105, -2-80, 0])
		motor_support();

