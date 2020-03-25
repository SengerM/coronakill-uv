use <componentes.scad>

ESPESOR_MINIMO = 4;
EXCESO_LONGITUDINAL = 2;
SEPARACION_BASE_TUBO = 5;
POSICION_ARRANCADOR_X = 220;
POSICION_REACTANCIA_X = 100;
LUZ_COMPONENTES_PAREDES = 1;
LONGITUD_EXPUESTA_TUBO = longitud_tubo_germicida()-2*11-2*7-10;
LUZ_PORTA_TUBOS = 1;
DIAMETRO_CABLE_ALIMENTACION = 4;
ALTURA_SOLAPA_TAPA = ESPESOR_MINIMO;
LUZ_SOLAPAS_BASE_TAPA = 1;

module base() {
    translate ([
        /*x*/ESPESOR_MINIMO+EXCESO_LONGITUDINAL+longitud_tubo_germicida()/2-LONGITUD_EXPUESTA_TUBO/2,
        /*y*/diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO,
        /*z*/-dimensiones_zocalo_con_arrancador()[2]/2-LUZ_COMPONENTES_PAREDES/2
    ]) cube([
        /*x*/LONGITUD_EXPUESTA_TUBO,
        /*y*/ESPESOR_MINIMO,
        /*z*/dimensiones_zocalo_con_arrancador()[2]+LUZ_COMPONENTES_PAREDES/2
    ]);
//    translate ([
//        /*x*/0,
//        /*y*/diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO+ESPESOR_MINIMO-SEPARACION_BASE_TUBO-2*diametro_tubo_germicida(),
//        /*z*/-ESPESOR_MINIMO-dimensiones_zocalo_con_arrancador()[2]/2-LUZ_COMPONENTES_PAREDES/2
//    ]) cube ([
//        /*x*/2*ESPESOR_MINIMO+longitud_tubo_germicida()+2*EXCESO_LONGITUDINAL, 
//        /*y*/ESPESOR_MINIMO+dimensiones_reactancia()[1]+2*LUZ_COMPONENTES_PAREDES+SEPARACION_BASE_TUBO+2*diametro_tubo_germicida(), 
//        /*z*/ESPESOR_MINIMO
//    ]);
    translate ([
        /*x*/0,
        /*y*/diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO+ESPESOR_MINIMO+2*LUZ_COMPONENTES_PAREDES+dimensiones_reactancia()[1],
        /*z*/-dimensiones_zocalo_con_arrancador()[2]/2-LUZ_COMPONENTES_PAREDES/2,
    ]) cube ([
        /*x*/2*ESPESOR_MINIMO+longitud_tubo_germicida()+2*EXCESO_LONGITUDINAL, 
        /*y*/ESPESOR_MINIMO,
        /*z*/dimensiones_zocalo_con_arrancador()[2]+LUZ_COMPONENTES_PAREDES/2
    ]);
    difference() {
            translate ([
            /*x*/0,
            /*y*/diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO+ESPESOR_MINIMO+2*LUZ_COMPONENTES_PAREDES+dimensiones_reactancia()[1] -(dimensiones_reactancia()[1]+2*LUZ_COMPONENTES_PAREDES+SEPARACION_BASE_TUBO+2*diametro_tubo_germicida()) ,
            /*z*/-dimensiones_zocalo_con_arrancador()[2]/2-LUZ_COMPONENTES_PAREDES/2,
        ]) cube ([
            /*x*/ESPESOR_MINIMO, 
            /*y*/dimensiones_reactancia()[1]+2*LUZ_COMPONENTES_PAREDES+SEPARACION_BASE_TUBO+2*diametro_tubo_germicida(),
            /*z*/dimensiones_zocalo_con_arrancador()[2]+LUZ_COMPONENTES_PAREDES/2
        ]);
        translate ([
        /*x*/-ESPESOR_MINIMO,
        /*y*/diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO+ESPESOR_MINIMO+LUZ_COMPONENTES_PAREDES+dimensiones_reactancia()[1]/2+DIAMETRO_CABLE_ALIMENTACION,
        /*z*/-dimensiones_zocalo_con_arrancador()[2]/2-LUZ_COMPONENTES_PAREDES/2+DIAMETRO_CABLE_ALIMENTACION/3*2
    ]) rotate(a=90,v=[0,1,0]) cylinder(h=3*ESPESOR_MINIMO,d=DIAMETRO_CABLE_ALIMENTACION);
    }
    
    translate ([
        /*x*/ESPESOR_MINIMO+longitud_tubo_germicida()+2*EXCESO_LONGITUDINAL,
        /*y*/diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO+ESPESOR_MINIMO+2*LUZ_COMPONENTES_PAREDES+dimensiones_reactancia()[1] -(dimensiones_reactancia()[1]+2*LUZ_COMPONENTES_PAREDES+SEPARACION_BASE_TUBO+2*diametro_tubo_germicida()) ,
        /*z*/-dimensiones_zocalo_con_arrancador()[2]/2-LUZ_COMPONENTES_PAREDES/2,
    ]) cube ([
        /*x*/ESPESOR_MINIMO, 
        /*y*/dimensiones_reactancia()[1]+2*LUZ_COMPONENTES_PAREDES+SEPARACION_BASE_TUBO+2*diametro_tubo_germicida(),
        /*z*/dimensiones_zocalo_con_arrancador()[2]+LUZ_COMPONENTES_PAREDES/2
    ]);
    difference() {
        union() {
            translate ([
                /*x*/ESPESOR_MINIMO+EXCESO_LONGITUDINAL+longitud_tubo_germicida()/2-LONGITUD_EXPUESTA_TUBO/2,
                /*y*/diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO+ESPESOR_MINIMO+2*LUZ_COMPONENTES_PAREDES+dimensiones_reactancia()[1] -(dimensiones_reactancia()[1]+2*LUZ_COMPONENTES_PAREDES+SEPARACION_BASE_TUBO+2*diametro_tubo_germicida()),
                /*z*/-dimensiones_zocalo_con_arrancador()[2]/2-LUZ_COMPONENTES_PAREDES/2,
            ]) cube ([
                /*x*/ESPESOR_MINIMO, 
                /*y*/diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO - (diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO+ESPESOR_MINIMO-SEPARACION_BASE_TUBO-2*diametro_tubo_germicida()),
                /*z*/dimensiones_zocalo_con_arrancador()[2]+LUZ_COMPONENTES_PAREDES/2
            ]);
            translate ([
                /*x*/EXCESO_LONGITUDINAL+longitud_tubo_germicida()/2+LONGITUD_EXPUESTA_TUBO/2,
                /*y*/diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO+ESPESOR_MINIMO+2*LUZ_COMPONENTES_PAREDES+dimensiones_reactancia()[1] -(dimensiones_reactancia()[1]+2*LUZ_COMPONENTES_PAREDES+SEPARACION_BASE_TUBO+2*diametro_tubo_germicida()),
                /*z*/-dimensiones_zocalo_con_arrancador()[2]/2-LUZ_COMPONENTES_PAREDES/2,
            ]) cube ([
                /*x*/ESPESOR_MINIMO, 
                /*y*/diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO - (diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO+ESPESOR_MINIMO-SEPARACION_BASE_TUBO-2*diametro_tubo_germicida()),
                /*z*/dimensiones_zocalo_con_arrancador()[2]+LUZ_COMPONENTES_PAREDES/2
            ]);
        }
        translate([ESPESOR_MINIMO+EXCESO_LONGITUDINAL,0,0]) rotate(a=90,v=[0,1,0]) cylinder(h=longitud_tubo_germicida(),d=diametro_tubo_germicida()+LUZ_PORTA_TUBOS);
        translate ([
        /*x*/ESPESOR_MINIMO+EXCESO_LONGITUDINAL,
        /*y*/-diametro_tubo_germicida()/2-LUZ_PORTA_TUBOS/2,
        /*z*/0,
    ]) cube([
        /*x*/longitud_tubo_germicida(),
        /*y*/diametro_tubo_germicida()+LUZ_PORTA_TUBOS,
        /*z*/dimensiones_zocalo_con_arrancador()[2]+LUZ_COMPONENTES_PAREDES/2]);
    }
    difference() {
        translate ([
            /*x*/ESPESOR_MINIMO,
            /*y*/diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO+ESPESOR_MINIMO+2*LUZ_COMPONENTES_PAREDES+dimensiones_reactancia()[1] -(dimensiones_reactancia()[1]+2*LUZ_COMPONENTES_PAREDES+SEPARACION_BASE_TUBO+2*diametro_tubo_germicida()),
            /*z*/-dimensiones_zocalo_con_arrancador()[2]/2-LUZ_COMPONENTES_PAREDES/2,
        ]) cube ([
            /*x*/longitud_tubo_germicida()+2*EXCESO_LONGITUDINAL, 
            /*y*/ESPESOR_MINIMO,
            /*z*/dimensiones_zocalo_con_arrancador()[2]+LUZ_COMPONENTES_PAREDES/2
        ]);
        translate ([
        /*x*/ESPESOR_MINIMO+EXCESO_LONGITUDINAL+longitud_tubo_germicida()/2-LONGITUD_EXPUESTA_TUBO/2,
        /*y*/diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO+ESPESOR_MINIMO+2*LUZ_COMPONENTES_PAREDES+dimensiones_reactancia()[1] -(dimensiones_reactancia()[1]+2*LUZ_COMPONENTES_PAREDES+SEPARACION_BASE_TUBO+2*diametro_tubo_germicida())-ESPESOR_MINIMO,
        /*z*/-dimensiones_zocalo_con_arrancador()[2]/2-LUZ_COMPONENTES_PAREDES/2-ESPESOR_MINIMO
        ]) cube([
            /*x*/LONGITUD_EXPUESTA_TUBO,
            /*y*/3*ESPESOR_MINIMO,
            /*z*/dimensiones_zocalo_con_arrancador()[2]+LUZ_COMPONENTES_PAREDES/2+2*ESPESOR_MINIMO
        ]);
    }
    
    difference() {
        translate ([
            /*x*/EXCESO_LONGITUDINAL+ESPESOR_MINIMO+POSICION_REACTANCIA_X-ESPESOR_MINIMO-LUZ_COMPONENTES_PAREDES,
            /*y*/diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO+ESPESOR_MINIMO+LUZ_COMPONENTES_PAREDES-ESPESOR_MINIMO-LUZ_COMPONENTES_PAREDES,
            /*z*/-dimensiones_zocalo_con_arrancador()[2]/2-LUZ_COMPONENTES_PAREDES/2
        ]) cube ([
            /*x*/dimensiones_reactancia()[0]+2*ESPESOR_MINIMO+2*LUZ_COMPONENTES_PAREDES, 
            /*y*/dimensiones_reactancia()[1]+2*ESPESOR_MINIMO+2*LUZ_COMPONENTES_PAREDES,
            /*z*/ESPESOR_MINIMO
        ]);
        translate ([
            /*x*/EXCESO_LONGITUDINAL+ESPESOR_MINIMO+POSICION_REACTANCIA_X-LUZ_COMPONENTES_PAREDES,
            /*y*/diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO+ESPESOR_MINIMO+LUZ_COMPONENTES_PAREDES-LUZ_COMPONENTES_PAREDES,
            /*z*/-dimensiones_zocalo_con_arrancador()[2]/2-LUZ_COMPONENTES_PAREDES/2-ESPESOR_MINIMO
        ]) cube ([
            /*x*/dimensiones_reactancia()[0]+2*LUZ_COMPONENTES_PAREDES, 
            /*y*/dimensiones_reactancia()[1]+2*LUZ_COMPONENTES_PAREDES,
            /*z*/3*ESPESOR_MINIMO
        ]);
    }
    module porta_zocalo_arrancador() {
        difference () {
            translate ([
                /*x*/-LUZ_COMPONENTES_PAREDES-ESPESOR_MINIMO,
                /*y*/-LUZ_COMPONENTES_PAREDES-ESPESOR_MINIMO,
                /*z*/0,
            ]) cube ([
                /*x*/45+2*LUZ_COMPONENTES_PAREDES+2*ESPESOR_MINIMO,
                /*y*/9+2*LUZ_COMPONENTES_PAREDES+2*ESPESOR_MINIMO,
                /*z*/ESPESOR_MINIMO*2
            ]);
            translate ([
                /*x*/45/2,
                /*y*/9/2,
                /*z*/0
            ]) cylinder  (h=ESPESOR_MINIMO*2,d=27+2*LUZ_COMPONENTES_PAREDES+2*ESPESOR_MINIMO);
            translate ([
                /*x*/-LUZ_COMPONENTES_PAREDES,
                /*y*/-LUZ_COMPONENTES_PAREDES,
                /*z*/0,
            ]) cube ([
                /*x*/45+2*LUZ_COMPONENTES_PAREDES,
                /*y*/9+2*LUZ_COMPONENTES_PAREDES,
                /*z*/ESPESOR_MINIMO*2
            ]);
            translate ([
                /*x*/45/2,
                /*y*/9/2,
                /*z*/0
            ]) cylinder  (h=ESPESOR_MINIMO*2,d=27+2*LUZ_COMPONENTES_PAREDES);
        }
    }
    translate ([
        /*x*/EXCESO_LONGITUDINAL+ESPESOR_MINIMO+POSICION_ARRANCADOR_X,
        /*y*/diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO+ESPESOR_MINIMO+LUZ_COMPONENTES_PAREDES+-9/2+dimensiones_reactancia()[1]/2,
        /*z*/-dimensiones_zocalo_con_arrancador()[2]/2-LUZ_COMPONENTES_PAREDES/2
    ]) porta_zocalo_arrancador();
    module trabacable() {
        for (i = [0:3]) {
            translate ([
                /*x*/i*3*DIAMETRO_CABLE_ALIMENTACION,
                /*y*/0,
                /*z*/0,
            ]) cylinder(h=DIAMETRO_CABLE_ALIMENTACION*2, d=2*DIAMETRO_CABLE_ALIMENTACION);
        }
    }
    translate ([
        /*x*/ESPESOR_MINIMO+2*DIAMETRO_CABLE_ALIMENTACION,
        /*y*/diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO+ESPESOR_MINIMO+LUZ_COMPONENTES_PAREDES+dimensiones_reactancia()[1]/2,
        /*z*/-dimensiones_zocalo_con_arrancador()[2]/2-LUZ_COMPONENTES_PAREDES/2,
    ]) trabacable();
//    translate ([
//        /*x*/0,
//        /*y*/0,
//        /*z*/0,
//    ]) cube ([
//        /*x*/0, 
//        /*y*/0,
//        /*z*/0
//    ]);
}

module tapa() {
    altura_interna = -dimensiones_zocalo_con_arrancador()[2]/2-LUZ_COMPONENTES_PAREDES/2+dimensiones_zocalo_con_arrancador()[2]+LUZ_COMPONENTES_PAREDES/2;
    translate ([
        /*x*/0,
        /*y*/diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO+ESPESOR_MINIMO-SEPARACION_BASE_TUBO-2*diametro_tubo_germicida(),
        /*z*/altura_interna
    ]) cube ([
        /*x*/2*ESPESOR_MINIMO+longitud_tubo_germicida()+2*EXCESO_LONGITUDINAL, 
        /*y*/ESPESOR_MINIMO+dimensiones_reactancia()[1]+2*LUZ_COMPONENTES_PAREDES+SEPARACION_BASE_TUBO+2*diametro_tubo_germicida(), 
        /*z*/ESPESOR_MINIMO
    ]);
    translate ([
        /*x*/ESPESOR_MINIMO+LUZ_SOLAPAS_BASE_TAPA,
        /*y*/diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO+2*LUZ_COMPONENTES_PAREDES+dimensiones_reactancia()[1]-LUZ_SOLAPAS_BASE_TAPA,
        /*z*/altura_interna-ALTURA_SOLAPA_TAPA
    ]) cube ([
        /*x*/longitud_tubo_germicida()+2*EXCESO_LONGITUDINAL-2*LUZ_SOLAPAS_BASE_TAPA, 
        /*y*/ESPESOR_MINIMO,
        /*z*/ALTURA_SOLAPA_TAPA
    ]);
    translate ([
        /*x*/ESPESOR_MINIMO+LUZ_SOLAPAS_BASE_TAPA,
        /*y*/diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO+ESPESOR_MINIMO+2*LUZ_COMPONENTES_PAREDES+dimensiones_reactancia()[1] -(dimensiones_reactancia()[1]+2*LUZ_COMPONENTES_PAREDES+SEPARACION_BASE_TUBO+2*diametro_tubo_germicida())+ESPESOR_MINIMO+LUZ_SOLAPAS_BASE_TAPA,
        /*z*/altura_interna-ALTURA_SOLAPA_TAPA
    ]) cube ([
        /*x*/ESPESOR_MINIMO, 
        /*y*/dimensiones_reactancia()[1]+2*LUZ_COMPONENTES_PAREDES+SEPARACION_BASE_TUBO+2*diametro_tubo_germicida()-2*ESPESOR_MINIMO-2*LUZ_SOLAPAS_BASE_TAPA,
        /*z*/ALTURA_SOLAPA_TAPA
    ]);
    translate ([
        /*x*/longitud_tubo_germicida()+2*EXCESO_LONGITUDINAL-LUZ_SOLAPAS_BASE_TAPA,
        /*y*/diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO+ESPESOR_MINIMO+2*LUZ_COMPONENTES_PAREDES+dimensiones_reactancia()[1] -(dimensiones_reactancia()[1]+2*LUZ_COMPONENTES_PAREDES+SEPARACION_BASE_TUBO+2*diametro_tubo_germicida())+ESPESOR_MINIMO+LUZ_SOLAPAS_BASE_TAPA,
        /*z*/altura_interna-ALTURA_SOLAPA_TAPA
    ]) cube ([
        /*x*/ESPESOR_MINIMO, 
        /*y*/dimensiones_reactancia()[1]+2*LUZ_COMPONENTES_PAREDES+SEPARACION_BASE_TUBO+2*diametro_tubo_germicida()-2*ESPESOR_MINIMO-2*LUZ_SOLAPAS_BASE_TAPA,
        /*z*/ALTURA_SOLAPA_TAPA
    ]);
    difference() {
        translate ([
            /*x*/ESPESOR_MINIMO+LUZ_SOLAPAS_BASE_TAPA,
            /*y*/diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO+ESPESOR_MINIMO+2*LUZ_COMPONENTES_PAREDES+dimensiones_reactancia()[1] -(dimensiones_reactancia()[1]+2*LUZ_COMPONENTES_PAREDES+SEPARACION_BASE_TUBO+2*diametro_tubo_germicida())+ESPESOR_MINIMO+LUZ_SOLAPAS_BASE_TAPA,
            /*z*/altura_interna-ALTURA_SOLAPA_TAPA
        ]) cube ([
            /*x*/longitud_tubo_germicida()+2*EXCESO_LONGITUDINAL-2*LUZ_SOLAPAS_BASE_TAPA, 
            /*y*/ESPESOR_MINIMO,
            /*z*/ALTURA_SOLAPA_TAPA
        ]);
        translate ([
        /*x*/ESPESOR_MINIMO+EXCESO_LONGITUDINAL+longitud_tubo_germicida()/2-LONGITUD_EXPUESTA_TUBO/2-LUZ_SOLAPAS_BASE_TAPA,
        /*y*/diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO+ESPESOR_MINIMO+2*LUZ_COMPONENTES_PAREDES+dimensiones_reactancia()[1] -(dimensiones_reactancia()[1]+2*LUZ_COMPONENTES_PAREDES+SEPARACION_BASE_TUBO+2*diametro_tubo_germicida())-ESPESOR_MINIMO+ESPESOR_MINIMO+LUZ_SOLAPAS_BASE_TAPA,
        /*z*/-dimensiones_zocalo_con_arrancador()[2]/2-LUZ_COMPONENTES_PAREDES/2-ESPESOR_MINIMO
        ]) cube([
            /*x*/LONGITUD_EXPUESTA_TUBO+2*LUZ_SOLAPAS_BASE_TAPA,
            /*y*/3*ESPESOR_MINIMO,
            /*z*/dimensiones_zocalo_con_arrancador()[2]+LUZ_COMPONENTES_PAREDES/2+2*ESPESOR_MINIMO
        ]);
    }
    difference() {
        union() {
            translate ([
                /*x*/ESPESOR_MINIMO+EXCESO_LONGITUDINAL+longitud_tubo_germicida()/2-LONGITUD_EXPUESTA_TUBO/2-ESPESOR_MINIMO-LUZ_SOLAPAS_BASE_TAPA,
                /*y*/diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO+ESPESOR_MINIMO+2*LUZ_COMPONENTES_PAREDES+dimensiones_reactancia()[1] -(dimensiones_reactancia()[1]+2*LUZ_COMPONENTES_PAREDES+SEPARACION_BASE_TUBO+2*diametro_tubo_germicida())+ESPESOR_MINIMO+LUZ_SOLAPAS_BASE_TAPA,
                /*z*/0
            ]) cube ([
                /*x*/ESPESOR_MINIMO, 
                /*y*/diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO - (diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO+ESPESOR_MINIMO-SEPARACION_BASE_TUBO-2*diametro_tubo_germicida()),
                /*z*/altura_interna
            ]);
            translate ([
                /*x*/EXCESO_LONGITUDINAL+longitud_tubo_germicida()/2+LONGITUD_EXPUESTA_TUBO/2+ESPESOR_MINIMO+LUZ_SOLAPAS_BASE_TAPA,
                /*y*/diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO+ESPESOR_MINIMO+2*LUZ_COMPONENTES_PAREDES+dimensiones_reactancia()[1] -(dimensiones_reactancia()[1]+2*LUZ_COMPONENTES_PAREDES+SEPARACION_BASE_TUBO+2*diametro_tubo_germicida())+ESPESOR_MINIMO+LUZ_SOLAPAS_BASE_TAPA,
                /*z*/0
            ]) cube ([
                /*x*/ESPESOR_MINIMO, 
                /*y*/diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO - (diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO+ESPESOR_MINIMO-SEPARACION_BASE_TUBO-2*diametro_tubo_germicida()),
                /*z*/altura_interna
            ]);
        }
        translate([ESPESOR_MINIMO+EXCESO_LONGITUDINAL,0,0]) rotate(a=90,v=[0,1,0]) cylinder(h=longitud_tubo_germicida(),d=diametro_tubo_germicida()+LUZ_PORTA_TUBOS);
    }
    translate ([
        /*x*/POSICION_REACTANCIA_X+dimensiones_reactancia()[0]*(1/2-0.4/2),
        /*y*/diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO+ESPESOR_MINIMO+LUZ_COMPONENTES_PAREDES+dimensiones_reactancia()[1]*(1/2-0.4/2),
        /*z*/altura_interna-(dimensiones_zocalo_con_arrancador()[2]+LUZ_COMPONENTES_PAREDES/2-dimensiones_reactancia()[2]-LUZ_COMPONENTES_PAREDES),
    ]) cube ([
        /*x*/dimensiones_reactancia()[0]*0.4, 
        /*y*/dimensiones_reactancia()[1]*0.4,
        /*z*/dimensiones_zocalo_con_arrancador()[2]+LUZ_COMPONENTES_PAREDES/2-dimensiones_reactancia()[2]-LUZ_COMPONENTES_PAREDES
    ]);
}
////////////////////////////////////////////////////////

translate([EXCESO_LONGITUDINAL+ESPESOR_MINIMO,0,0]) {
    translate([
        /*x*/0,
        /*y*/diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO+ESPESOR_MINIMO+LUZ_COMPONENTES_PAREDES,
        /*z*/-dimensiones_zocalo_con_arrancador()[2]/2-LUZ_COMPONENTES_PAREDES/2
        ]) {
        translate([POSICION_ARRANCADOR_X,-9/2+dimensiones_reactancia()[1]/2,0])
            zocalo_con_arrancador();
        translate([POSICION_REACTANCIA_X,0,0])
            reactancia();
    }
    rotate(a=90, v=[0,1,0])
        tubo_germicida();
}
color([.5,.1,.1])tapa();
color(alpha=0.5) base();
