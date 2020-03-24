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
        color([1,1,1], alpha=.2)
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

tubo_germicida();