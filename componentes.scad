//    # Released under MIT License
//
//    Copyright (c) 2020 Matias H. Senger
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

function diametro_tubo_germicida() = 15.8;
function longitud_tubo_germicida() = 265+2*11+2*7;

module tubo_germicida() {
    LONGITUD_VIDRIO = 265;
    DIAMETRO_VIDRIO = diametro_tubo_germicida();
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

function dimensiones_reactancia() = [85,41,28];

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

function dimensiones_zocalo_con_arrancador() = [45,27,42];

tubo_germicida();