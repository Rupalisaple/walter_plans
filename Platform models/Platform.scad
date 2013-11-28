include <iRobot.scad>
include <cilindru_ghidaj_suport_bara_filetata.scad>
include <motor_support_decupat.scad> //motor_support();
include <servo_wheel.scad>			//servo_wheel();
include <servo_body.scad>			//servo_body();
include <roata_mica_motor.scad>	    //motor_gear_m10(); - roata mica
										//ax_gear(); - roata mare

//global variables
    lungime_bara_verticala = 333.5;
    lungime_bara_orizontala = 267.5;

    grosime_bara_din_cadru = 15.1;
    pozitie_gaura = [-111.4650, 2.5960, 77.8];	// folosita la toate barele
    pozitie_bara = pozitie_gaura + [-23.5, -grosime_bara_din_cadru/2+1, 1]; // folosi a la barele verticale
    pozitie_bara_oriz = pozitie_gaura + [-22.5, -grosime_bara_din_cadru/2+2, 0];
    pozitie_bara_oriz_sp = pozitie_gaura + [-22.5, +grosime_bara_din_cadru/2 +2 +69.85, 0];
    pozitie_bara_oriz_sus_f =[pozitie_bara_oriz[0],
                            pozitie_bara_oriz[1]-1,
                                    pozitie_bara_oriz[2]+lungime_bara_verticala + 1];
    pozitie_bara_oriz_sus_sp =[pozitie_bara_oriz_sp[0],
                            pozitie_bara_oriz_sp[1]+1,
                                    pozitie_bara_oriz_sp[2]+lungime_bara_verticala + 1];
    dimensiuni_ghidaj = [82, 24.3, 6];
    distanta_cadru = 69.85 + grosime_bara_din_cadru +2; //distanta dintre cadru fata si cadru spate
    pozitie_ghidaj_cadru = 40; //distanta de la capat cadru la ghidaj
    raza_gaura_ghidaj_suport = 4;
    inaltime_bara_cilindrica = lungime_bara_verticala * 2.5;
    latime_ghidaj_suport_bara_filetata = 49.9;
    distanta_gaura = 3.5;      
    
    //primul cub 
    inaltime_cub1 = 4.6;  
    dimensiuni_cub2 = [36, 36, 11.3];

module bara(len=100){
    difference(){
        cube([grosime_bara_din_cadru, grosime_bara_din_cadru, len]);
        translate([1,1])
        cube([grosime_bara_din_cadru-1, grosime_bara_din_cadru-1, len]);
    }
}

module ghidaj_suport_bara_filetata(){
        
    translate ([-41,-10,0]) 	
    difference(){
        cube ([dimensiuni_ghidaj[0], latime_ghidaj_suport_bara_filetata, inaltime_cub1], center = false);
            
        //gaura fata stanga
        translate([distanta_gaura, distanta_gaura, 0])	
            cube([5, 7, 6], center = false);
        
        //gaura fata dreapta
        translate([distanta_gaura, latime_ghidaj_suport_bara_filetata - distanta_gaura, 0])
        rotate([90, 0, 0])
            cube([5, 7, 6], center = false);

        //gaura spate stanga
        translate([dimensiuni_ghidaj[0] - 7, distanta_gaura, 0])	
            cube([5, 7, 6], center = false);
        
        //gaura spate dreapta
        translate([dimensiuni_ghidaj[0] - 7, latime_ghidaj_suport_bara_filetata - distanta_gaura, 0])
        rotate([90, 0, 0])
            cube([5, 7, 6], center = false);

        //gaura bara
        translate([dimensiuni_ghidaj[0] / 2, latime_ghidaj_suport_bara_filetata / 2, 0])
        cylinder (r = raza_gaura_ghidaj_suport, h = 6, $fn = 50);
    }
    
    //al doilea cub
    translate ([-41,-10,0]) 	
    difference(){
        translate([dimensiuni_ghidaj[0] / 2 - dimensiuni_cub2[0] / 2, latime_ghidaj_suport_bara_filetata / 2 - dimensiuni_cub2[0]/ 2, 0])
        cube(dimensiuni_cub2);

    //gaura bara cub2
        translate([dimensiuni_ghidaj[0] / 2, latime_ghidaj_suport_bara_filetata / 2, 0])
        cylinder (r = (dimensiuni_cub2[0]- 2 * 7.9) / 2, h =dimensiuni_cub2[1] + 6, $fn = 50);
    
    //gaura surub cub2 stanga fata
    translate([dimensiuni_ghidaj[0] / 2 - dimensiuni_cub2[0] / 2 + 3, latime_ghidaj_suport_bara_filetata / 2 - dimensiuni_cub2[0]/ 2 + 3, 0])
        cube([5, 7, dimensiuni_cub2[2]], center = false);

    //gaura surub cub2 dreapta fata	
    translate([dimensiuni_ghidaj[0] / 2 - dimensiuni_cub2[0] / 2 + 3, latime_ghidaj_suport_bara_filetata / 2 - dimensiuni_cub2[0]/ 2 - 7 - 3 + dimensiuni_cub2[1], 0])
        cube([5, 7, dimensiuni_cub2[2]], center = false);

    //gaura surub cub2 stanga spate
    translate([dimensiuni_cub2[0] -7 - 3 + dimensiuni_ghidaj[0] / 2 - dimensiuni_cub2[0] / 2 + 3, latime_ghidaj_suport_bara_filetata / 2 - dimensiuni_cub2[0]/ 2 + 3, 0])
        cube([5, 7, dimensiuni_cub2[2]], center = false);

    //gaura surub cub2 dreapta spate	
    translate([dimensiuni_cub2[0] -7 - 3 + dimensiuni_ghidaj[0] / 2 - dimensiuni_cub2[0] / 2 + 3, 
    latime_ghidaj_suport_bara_filetata / 2 - dimensiuni_cub2[0]/ 2 - 7 - 3 + dimensiuni_cub2[1], 0])
        cube([5, 7, dimensiuni_cub2[2]], center = false);
    
    //TODO: daca este nevoie se pot face gauri si in cubul de sub
    
    //end difference
    }
}


module ghidaj_suport()
{
    difference(){
        translate ([-41,-10,0]) cube (dimensiuni_ghidaj, center = false);
        cylinder (r = raza_gaura_ghidaj_suport, h = 6, center = false, $fn = 50);
        translate([33.5, -4, 0]) cube([5, 7, 6], center = false);
        translate([-38.5, -4, 0]) cube([5, 7, 6], center = false);
        translate([0,0,3])rotate([-90,0,0]) cylinder(h = 12, r = 1.5, $fn = 30);
    }
}


module ghidaje_suport_sus_jos(){
    translate(pozitie_bara_oriz_sus_sp)
    rotate([0, 0, 90])
    translate([-distanta_cadru / 2, -dimensiuni_ghidaj[1] / 2 - pozitie_ghidaj_cadru, 1])
        ghidaj_suport();

    translate(pozitie_bara_oriz_sp)
    rotate([0, 0, 90])
    translate([-distanta_cadru / 2, -dimensiuni_ghidaj[1] / 2 - pozitie_ghidaj_cadru, 1])
        ghidaj_suport();

    teava_ghidaj();
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
    translate([ -pozitie_bara[0] - 1, pozitie_bara[1] + 59.85 + grosime_bara_din_cadru +2, pozitie_bara[2] + lungime_bara_verticala / 2])
    rotate([45, 0, 0])
    cube([1, 15, 100]);

    //Bara suport stanga
    translate([ pozitie_bara[0] + 1, pozitie_bara[1] + 59.85 + grosime_bara_din_cadru +2, pozitie_bara[2] + lungime_bara_verticala / 2])
    rotate([45, 0, 0])
    cube([1, 15, 100]);
    
}

module teava_ghidaj(){
    translate(pozitie_bara_oriz_sp)
    rotate([0, 0, 90])
    translate([-distanta_cadru / 2, -dimensiuni_ghidaj[1] / 2 - pozitie_ghidaj_cadru, 1])

        cylinder(r = raza_gaura_ghidaj_suport, h = inaltime_bara_cilindrica);
}

module servo(){
    servo_wheel();
    servo_body();
}

module bloc_motor(){
	motor_pos = [37, 35, 25];
        motor_support();
    translate(motor_pos)
        rotate([0,-90,-90])
        servo();
	translate(motor_pos + [-50.1, +7, -7-24])
	{
   		cylinder(r=12, h=17.7);
		translate([0,0, -10])
		motor_gear_m10();
	}

}

module ghidaje_filet() {
//cilindru ghidaj suport bara filetata jos
translate(pozitie_bara_oriz_sp)
rotate([0, 0, 90])
translate([-distanta_cadru / 2, -dimensiuni_ghidaj[1] / 2 - pozitie_ghidaj_cadru - latime_ghidaj_suport_bara_filetata - 2.5, 1])
translate ([-41,-10,0]) 	
translate([dimensiuni_ghidaj[0] / 2, latime_ghidaj_suport_bara_filetata / 2, dimensiuni_cub2[2]])
    cilindru_ghidaj_suport_bara_filetata();
    

    //bara filetata
translate(pozitie_bara_oriz_sp)
rotate([0, 0, 90])
translate([-distanta_cadru / 2, -dimensiuni_ghidaj[1] / 2 - pozitie_ghidaj_cadru - latime_ghidaj_suport_bara_filetata - 2.5, 1])
    translate ([-41,-10,0]) 	
translate([dimensiuni_ghidaj[0] / 2, latime_ghidaj_suport_bara_filetata / 2, dimensiuni_cub2[2]])
    cylinder (r = 5, h = inaltime_bara_cilindrica, $fn = 50);


//ghidaj suport bara filetata jos
translate(pozitie_bara_oriz_sp)
rotate([0, 0, 90])
translate([-distanta_cadru / 2, -dimensiuni_ghidaj[1] / 2 - pozitie_ghidaj_cadru - latime_ghidaj_suport_bara_filetata - 2.5, 1])
ghidaj_suport_bara_filetata();

//ghidaj suport bara filetata sus
translate(pozitie_bara_oriz_sus_sp)
rotate([0, 0, 90])
translate([-distanta_cadru / 2, -dimensiuni_ghidaj[1] / 2 - pozitie_ghidaj_cadru - latime_ghidaj_suport_bara_filetata - 2.5, 1])
ghidaj_suport_bara_filetata();

        
//cilindru ghidaj suport bara filetata sus
translate(pozitie_bara_oriz_sus_sp)
rotate([0, 0, 90])
translate([-distanta_cadru / 2, -dimensiuni_ghidaj[1] / 2 - pozitie_ghidaj_cadru - latime_ghidaj_suport_bara_filetata - 2.5, -1])
translate ([-41,-10,0]) 	
translate([dimensiuni_ghidaj[0] / 2, latime_ghidaj_suport_bara_filetata / 2, 0])
rotate([0, 180, 0])
    cilindru_ghidaj_suport_bara_filetata();
}

module motor() {

pozitie_suport_motor = pozitie_bara_oriz_sp + [lungime_bara_orizontala-105, -2-80, 0];
translate(pozitie_suport_motor)
bloc_motor();
// ax_gear(); // TODO: Make this work (a doua rotita)
}


// suport tava
module suport_tava() {
pozitie_suport = 180;
lungime_suport = 333.3;
translate(pozitie_bara_oriz_sus_f)
translate([pozitie_suport,0,0])
bara(lungime_suport);
translate(pozitie_bara_oriz_sus_f)
translate([pozitie_suport,0,0])
translate([89, 0, 0])
rotate([0,0,90])
bara(lungime_suport);
translate(pozitie_bara_oriz_sus_sp)
translate([pozitie_suport,0,0])
translate([89, 0, 0])
rotate([0,0,180])
bara(lungime_suport);
}

module oval(w,h, height, center = false) {
  scale([1, h/w, 1]) cylinder(h=height, r=w, center=center);
}

module tava() {
	translate([100,-10,745])
	oval(80, 150);
}

//irobot();
cadru();
ghidaje_suport_sus_jos();
ghidaje_filet();
motor();
suport_tava();
tava();