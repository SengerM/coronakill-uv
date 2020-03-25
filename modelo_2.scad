use <componentes.scad>

ESPESOR_MINIMO = 4;
EXCESO_LONGITUDINAL = 2;
SEPARACION_BASE_TUBO = 5;
POSICION_ARRANCADOR_X = 220;
POSICION_REACTANCIA_X = 100;
LUZ_COMPONENTES_PAREDES = 2;
LONGITUD_EXPUESTA_TUBO = longitud_tubo_germicida()-2*11-2*7-10;

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
    translate ([
        /*x*/0,
        /*y*/diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO+ESPESOR_MINIMO-SEPARACION_BASE_TUBO-2*diametro_tubo_germicida(),
        /*z*/-ESPESOR_MINIMO-dimensiones_zocalo_con_arrancador()[2]/2-LUZ_COMPONENTES_PAREDES/2
    ]) cube ([
        /*x*/2*ESPESOR_MINIMO+longitud_tubo_germicida()+2*EXCESO_LONGITUDINAL, 
        /*y*/ESPESOR_MINIMO+dimensiones_reactancia()[1]+2*LUZ_COMPONENTES_PAREDES+SEPARACION_BASE_TUBO+2*diametro_tubo_germicida(), 
        /*z*/ESPESOR_MINIMO
    ]);
    translate ([
        /*x*/0,
        /*y*/diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO+ESPESOR_MINIMO+2*LUZ_COMPONENTES_PAREDES+dimensiones_reactancia()[1],
        /*z*/-dimensiones_zocalo_con_arrancador()[2]/2-LUZ_COMPONENTES_PAREDES/2,
    ]) cube ([
        /*x*/2*ESPESOR_MINIMO+longitud_tubo_germicida()+2*EXCESO_LONGITUDINAL, 
        /*y*/ESPESOR_MINIMO,
        /*z*/dimensiones_zocalo_con_arrancador()[2]+LUZ_COMPONENTES_PAREDES/2
    ]);
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
        translate([ESPESOR_MINIMO+EXCESO_LONGITUDINAL,0,0]) rotate(a=90,v=[0,1,0]) cylinder(h=longitud_tubo_germicida(),d=diametro_tubo_germicida()*1.05);
        translate ([
        /*x*/ESPESOR_MINIMO+EXCESO_LONGITUDINAL,
        /*y*/-diametro_tubo_germicida()*1.05/2,
        /*z*/0,
    ]) cube([
        /*x*/longitud_tubo_germicida(),
        /*y*/diametro_tubo_germicida()*1.05,
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
base();