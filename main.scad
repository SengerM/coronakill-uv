module tubo_germicida() {
    LONGITUD_VIDRIO = 265;
    DIAMETRO_VIDRIO = 18.8;
    LONGITUD_METAL = 11;
    DIAMETRO_METAL = 15;
    LONGITUD_PIN = 7;
    DIAMETRO_PIN = 2.5;
    SEPARACION_PIN = 4.5;
    module pin() {
        cylinder(h=LONGITUD_PIN, d=DIAMETRO_PIN);
    }
    module metalsito() {
        color([1,1,1]*.8)
        cylinder(h=LONGITUD_METAL, d=DIAMETRO_METAL);
    }
    module tubo_de_vidrio() {
        color([1,1,1], alpha=.4)
        cylinder(h=LONGITUD_VIDRIO, d=DIAMETRO_VIDRIO);
    }
    
    translate([-SEPARACION_PIN/2,0,0])
        pin();
    translate([SEPARACION_PIN/2,0,0])
        pin();
    translate([-SEPARACION_PIN/2,0,2*LONGITUD_METAL+LONGITUD_VIDRIO+LONGITUD_PIN])
        pin();
    translate([SEPARACION_PIN/2,0,2*LONGITUD_METAL+LONGITUD_VIDRIO+LONGITUD_PIN])
        pin();
    
    translate([0,0,LONGITUD_METAL+LONGITUD_PIN])
        tubo_de_vidrio();

    translate([0,0,LONGITUD_METAL+LONGITUD_VIDRIO+LONGITUD_PIN])
        metalsito();
    translate([0,0,LONGITUD_PIN])
        metalsito();
}

module reactancia() {
    module ranura() {
        translate([0,0,-1]) {
            cube([9-4.5/2,4.5,3]);
            translate([9-4.5/2,4.5/2,0])
                cylinder(h=3,d=4.5);
        }
    }
    module agujero() {
        translate([0,0,-1])
            cylinder(h=3,d=5);
    }
    color([1,1,1]) {
        difference() {
            cube([85,41,1]);
            translate([0,41/2-4.5/2,0])
                ranura();
            translate([85,41/2+4.5/2,0])
                rotate(a=180,v=[0,0,1])
                    ranura();
            translate([76.5+5/2,5+5/2,0])
                agujero();
            translate([76.5+5/2,41-5-5/2,0])
                agujero();
        }
        translate([16.5,0,0])
            cube([35,41,28]);
        translate([63,41/2-21/2,3])
            cube([18,21,12]);
        translate([51,(41-31)/2,3])
            cube([12,31,25]);
        translate([16.5-9,(41-31)/2,3])
            cube([9,31,22]);
    }
}

module arrancador() {
    color([.3,.4,1], alpha=.5)
        cylinder(h=35,d=21);
}

module zocalo_arrancador() {
    color([1,1,1]) {
        difference() {
            cube([45,9,12.5]);
            translate([45/2-37/2,9/2,-1])
                cylinder(h=15,d=4);
            translate([45/2+37/2,9/2,-1])
                cylinder(h=15,d=4);
        }
        translate([45/2,9/2,0])
            cylinder(h=12.5,d=27);
    }
}

module zocalo_con_arrancador() {
    zocalo_arrancador();
    translate([45/2,9/2,42-35])
        arrancador();
}

///////////////////////////////////////////////////////////

DIAMETRO_TUBO = 19;
LONGITUD_TUBO = 265+2*11+2*7;
ESPESOR_MINIMO = 4;
EXCESO_LONGITUDINAL = 2;
ANCHO_INTERNO_Y = 44;
ALTO_INTERNO_Z = 45;
ESPESOR_BASE = 8;
SEPARACION_BASE_TUBO = 5;
DISTANCIA_CUBRIR_TUBO = 11+7+10;
LUZ_TAPA_BASE = 1;
POSICION_ARRANCADOR_X = 220;
POSICION_REACTANCIA_X = 100;

module gabinete_base() {
    difference() {
        union() {
            translate([-EXCESO_LONGITUDINAL,-ANCHO_INTERNO_Y/2,SEPARACION_BASE_TUBO+DIAMETRO_TUBO/2])
                cube([LONGITUD_TUBO+2*EXCESO_LONGITUDINAL,ANCHO_INTERNO_Y, ESPESOR_BASE]);
            
            difference() {
                translate([0,-ANCHO_INTERNO_Y/2,DIAMETRO_TUBO/2+SEPARACION_BASE_TUBO-(DIAMETRO_TUBO/2+SEPARACION_BASE_TUBO+DIAMETRO_TUBO)]) {
                    translate([-EXCESO_LONGITUDINAL,0,0])
                        cube([EXCESO_LONGITUDINAL+DISTANCIA_CUBRIR_TUBO,ANCHO_INTERNO_Y,DIAMETRO_TUBO/2+SEPARACION_BASE_TUBO+DIAMETRO_TUBO]);
                    translate([LONGITUD_TUBO+EXCESO_LONGITUDINAL-(EXCESO_LONGITUDINAL+DISTANCIA_CUBRIR_TUBO),0,0])
                        cube([EXCESO_LONGITUDINAL+DISTANCIA_CUBRIR_TUBO,ANCHO_INTERNO_Y,DIAMETRO_TUBO/2+SEPARACION_BASE_TUBO+DIAMETRO_TUBO]);
                }
                translate([-EXCESO_LONGITUDINAL-1,0,0])
                rotate(a=90,v=[0,1,0])
                    cylinder(h=LONGITUD_TUBO+2*EXCESO_LONGITUDINAL+2,d=DIAMETRO_TUBO);
            }
        }
        translate([0,-DIAMETRO_TUBO/2,0]) {
        translate([-EXCESO_LONGITUDINAL,0,0])
            cube([EXCESO_LONGITUDINAL+DISTANCIA_CUBRIR_TUBO/2,DIAMETRO_TUBO,DIAMETRO_TUBO/2+SEPARACION_BASE_TUBO+ESPESOR_BASE]);
        translate([LONGITUD_TUBO+EXCESO_LONGITUDINAL-(EXCESO_LONGITUDINAL+DISTANCIA_CUBRIR_TUBO/2),0,0])
            cube([EXCESO_LONGITUDINAL+DISTANCIA_CUBRIR_TUBO/2,DIAMETRO_TUBO,DIAMETRO_TUBO/2+SEPARACION_BASE_TUBO+ESPESOR_BASE]);
        }
    }
}

module gabinete_tapa() {
    altura_tapa = SEPARACION_BASE_TUBO+3/2*DIAMETRO_TUBO+ESPESOR_BASE+ALTO_INTERNO_Z;
    offset_z = -DIAMETRO_TUBO/2-DIAMETRO_TUBO/2;
    translate([-LUZ_TAPA_BASE-EXCESO_LONGITUDINAL,-LUZ_TAPA_BASE-ANCHO_INTERNO_Y/2-ESPESOR_MINIMO,offset_z])
        cube([2*LUZ_TAPA_BASE+2*EXCESO_LONGITUDINAL+LONGITUD_TUBO,ESPESOR_MINIMO,altura_tapa]);
    translate([-LUZ_TAPA_BASE-EXCESO_LONGITUDINAL,LUZ_TAPA_BASE+ANCHO_INTERNO_Y/2,offset_z])
        cube([2*LUZ_TAPA_BASE+2*EXCESO_LONGITUDINAL+LONGITUD_TUBO,ESPESOR_MINIMO,altura_tapa]);
    translate([-EXCESO_LONGITUDINAL-ESPESOR_MINIMO-LUZ_TAPA_BASE,-LUZ_TAPA_BASE-ANCHO_INTERNO_Y/2-ESPESOR_MINIMO,offset_z])
        cube([ESPESOR_MINIMO,2*LUZ_TAPA_BASE+2*ESPESOR_MINIMO+ANCHO_INTERNO_Y,altura_tapa]);
    translate([LUZ_TAPA_BASE+EXCESO_LONGITUDINAL+LONGITUD_TUBO,-LUZ_TAPA_BASE-ANCHO_INTERNO_Y/2-ESPESOR_MINIMO,offset_z])
        cube([ESPESOR_MINIMO,2*LUZ_TAPA_BASE+2*ESPESOR_MINIMO+ANCHO_INTERNO_Y,altura_tapa]);
    translate((ESPESOR_MINIMO+LUZ_TAPA_BASE)*[-1,-1,0]+[-EXCESO_LONGITUDINAL,-ANCHO_INTERNO_Y/2,offset_z+altura_tapa])
		cube(2*(ESPESOR_MINIMO+LUZ_TAPA_BASE)*[1,1,0]+[2*EXCESO_LONGITUDINAL+LONGITUD_TUBO,ANCHO_INTERNO_Y,ESPESOR_MINIMO]);
}

gabinete_base();
translate([0,0,SEPARACION_BASE_TUBO+DIAMETRO_TUBO/2+ESPESOR_BASE]) {
    translate([POSICION_ARRANCADOR_X,-9/2,0])
        zocalo_con_arrancador();
    translate([POSICION_REACTANCIA_X,-41/2,0])
        reactancia();
}
rotate(a=90, v=[0,1,0])
    tubo_germicida();

color(alpha=.5) gabinete_tapa();
