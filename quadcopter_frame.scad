$fn=180;
screw_width=3.3;
boom_width=20;
padding=(boom_width)/2;
x=100;
y=300+boom_width;

difference(){
    square([x,y]);
    /*translate([5,10]){
        cylinder(fs=0.01, d=3);
    }*/
    rail();
    translate([x,0])mirror([1,0,0])rail();
    translate([x,y])rotate([0,0,180])rail();
    translate([0,y])rotate([0,0,180])mirror([1,0,0])rail();
}

%translate([(-x-boom_width)/2,0])
    color("Teal")square([(y-boom_width)/2, boom_width]);
%translate([(x+boom_width)/2,0])
    color("Teal")square([(y-boom_width)/2, boom_width]);
%translate([(-x-boom_width)/2,y-boom_width])
    color("Teal")square([(y-boom_width)/2, boom_width]);
%translate([(x+boom_width)/2,y-boom_width])
    color("Teal")square([(y-boom_width)/2, boom_width]);
%translate([0,(y-boom_width)/2])
    color("Navy")square([(y-boom_width)/2, boom_width]);


module rail(){
    hull(){
        translate([padding, padding])
            circle(d=screw_width);
        translate([x/2-1*padding, padding])
            circle(d=screw_width);
    }
    hull(){
        translate([x/2-1.5*padding, padding])
            circle(d=screw_width);
        translate([x/2-1.5*padding, y/2-2*padding])
            circle(d=screw_width);
    }
}