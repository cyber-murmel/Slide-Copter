$fn=180;
screw_width=3;
drill_i=0.8;
drill_o=6.0;
boom_width=15;
padding=(boom_width)/2;
x=100;
y=300+boom_width;


difference(){
	minkowski(){square([x,y]);circle(drill_o/2);}
	rail();
	translate([x,0])mirror([1,0,0])rail();
	translate([x,y])rotate([0,0,180])rail();
	translate([0,y])rotate([0,0,180])mirror([1,0,0])rail();
}

%translate([(x-boom_width)/2,boom_width])
	color("Teal")rotate(180)
		square([(y-boom_width)/2, boom_width]);

%translate([(x+boom_width)/2,0])
	color("Teal")
		square([(y-boom_width)/2, boom_width]);

%translate([(x-boom_width)/2,y])
	color("Teal")rotate(180)
		square([(y-boom_width)/2, boom_width]);

%translate([(x+boom_width)/2,y-boom_width])
	color("Teal")
		square([(y-boom_width)/2, boom_width]);

%translate([0,(y-boom_width)/2])
    color("Navy")square([x, boom_width]);

%translate([(x-boom_width)/2,(y+boom_width)/2])
    color("Navy")square([boom_width, (y-boom_width)/2]);

%translate([(x-boom_width)/2,0])
    color("Navy")square([boom_width, (y-boom_width)/2]);


module rail(){
    hull(){
        translate([padding, padding])
            circle((screw_width-drill_i)/2);
        translate([x/2-1.5*padding, padding])
            circle((screw_width-drill_i)/2);
    }
    hull(){
        translate([x/2-2*padding, padding])
            circle((screw_width-drill_i)/2);
        translate([x/2-2*padding, y/2-2*padding])
            circle((screw_width-drill_i)/2);
    }
}