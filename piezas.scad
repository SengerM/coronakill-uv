//    # Released under MIT License
//
//    Copyright (c) 2020 Matias H. Senger
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


use <componentes.scad>

$fn = 50;

ESPESOR_MINIMO = 4;
EXCESO_LONGITUDINAL = 2;
SEPARACION_BASE_TUBO = 5;
POSICION_ARRANCADOR_X = 220;
POSICION_REACTANCIA_X = 100;
LUZ_COMPONENTES_PAREDES = 1;
LONGITUD_EXPUESTA_TUBO = longitud_tubo_germicida()-2*11-2*7-10;
LUZ_PORTA_TUBOS = 1;
DIAMETRO_CABLE_ALIMENTACION = 5.5;
ALTURA_SOLAPA_TAPA = ESPESOR_MINIMO;
LUZ_SOLAPAS_BASE_TAPA = 1;
DIAMETRO_TORNILLOS = 2.5;
DIAMETRO_CABEZA_TORNILLOS = 5;

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
    module porta_tornillo() {
        difference () {
            translate ([
                /*x*/0,
                /*y*/0,
                /*z*/-dimensiones_zocalo_con_arrancador()[2]/2-LUZ_COMPONENTES_PAREDES/2,
            ]) cylinder(h=dimensiones_zocalo_con_arrancador()[2]+LUZ_COMPONENTES_PAREDES/2, d=2*ESPESOR_MINIMO+DIAMETRO_TORNILLOS);
            translate ([
                /*x*/0,
                /*y*/0,
                /*z*/-dimensiones_zocalo_con_arrancador()[2]/2-LUZ_COMPONENTES_PAREDES/2,
            ]) cylinder(h=dimensiones_zocalo_con_arrancador()[2]+LUZ_COMPONENTES_PAREDES/2, d=DIAMETRO_TORNILLOS);
        }
    }
    translate ([
        /*x*/0,
        /*y*/diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO+2*(DIAMETRO_TORNILLOS>ESPESOR_MINIMO?DIAMETRO_TORNILLOS:ESPESOR_MINIMO),
        /*z*/0,
    ]) {
        translate ([
            /*x*/(2*ESPESOR_MINIMO+longitud_tubo_germicida()+2*EXCESO_LONGITUDINAL)/2-70,
            /*y*/0,
            /*z*/0,
        ]) porta_tornillo();
        translate ([
            /*x*/(2*ESPESOR_MINIMO+longitud_tubo_germicida()+2*EXCESO_LONGITUDINAL)/2+70,
            /*y*/0,
            /*z*/0,
        ]) porta_tornillo();
    }
}

module tapa() {
    altura_interna = -dimensiones_zocalo_con_arrancador()[2]/2-LUZ_COMPONENTES_PAREDES/2+dimensiones_zocalo_con_arrancador()[2]+LUZ_COMPONENTES_PAREDES/2;
    module agujero_pa_tornillos() {
        translate ([
            /*x*/0,
            /*y*/0,
            /*z*/altura_interna-ESPESOR_MINIMO,
        ]) cylinder(h=ESPESOR_MINIMO*3,d=DIAMETRO_TORNILLOS*1.3);
        translate ([
            /*x*/0,
            /*y*/0,
            /*z*/altura_interna+ESPESOR_MINIMO*(2/3),
        ]) cylinder(h=ESPESOR_MINIMO*3,d=DIAMETRO_CABEZA_TORNILLOS*1.1);
    }
    difference () {
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
            /*x*/0,
            /*y*/diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO+2*(DIAMETRO_TORNILLOS>ESPESOR_MINIMO?DIAMETRO_TORNILLOS:ESPESOR_MINIMO),
            /*z*/0,
        ]) {
            translate ([
                /*x*/(2*ESPESOR_MINIMO+longitud_tubo_germicida()+2*EXCESO_LONGITUDINAL)/2-70,
                /*y*/0,
                /*z*/0,
            ]) agujero_pa_tornillos();
            translate ([
                /*x*/(2*ESPESOR_MINIMO+longitud_tubo_germicida()+2*EXCESO_LONGITUDINAL)/2+70,
                /*y*/0,
                /*z*/0,
            ]) agujero_pa_tornillos();
        }
    }
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
    translate ([
        /*x*/ESPESOR_MINIMO+DIAMETRO_CABLE_ALIMENTACION,
        /*y*/diametro_tubo_germicida()/2+SEPARACION_BASE_TUBO+ESPESOR_MINIMO+LUZ_COMPONENTES_PAREDES+dimensiones_reactancia()[1]/2-DIAMETRO_CABLE_ALIMENTACION,
        /*z*/altura_interna-(dimensiones_zocalo_con_arrancador()[2]+LUZ_COMPONENTES_PAREDES/2-2*DIAMETRO_CABLE_ALIMENTACION),
    ]) cube ([
        /*x*/(3*4-1)*DIAMETRO_CABLE_ALIMENTACION, 
        /*y*/2*DIAMETRO_CABLE_ALIMENTACION,
        /*z*/dimensiones_zocalo_con_arrancador()[2]+LUZ_COMPONENTES_PAREDES/2-2*DIAMETRO_CABLE_ALIMENTACION
    ]);
}
////////////////////////////////////////////////////////

translate([EXCESO_LONGITUDINAL+ESPESOR_MINIMO,0,0]) {
    rotate(a=90, v=[0,1,0])
        tubo_germicida();
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
    
}

base();
color(alpha=.5)tapa();