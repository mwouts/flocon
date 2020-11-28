// Copyright 2020, Marc Wouts & Kids
// Under https://creativecommons.org/licenses/by-nc-sa/4.0/

// Height of a triangle of side 2 is sqrt(3)
// Height of a tetrahedron of side 2 is 2 sqrt(6) / 3
H = sqrt(3);

module triangle() {
polyhedron(
    points=[
    [-1,0,0],
    [1,0,0],
    [0,H,0]],
    faces=[[0,1,2]]);
};

module face_flocon(n) {
    if(n>0)
    {
        translate([0,H/3,0])
        scale(1/2)
        for (angle = [0,120,240])
            {
                rotate([0,0,angle])
                translate([0,H/3,0])
                {   
                    face_flocon(n-1);
                    rotate([109.5,0,0]) mirror([0,0,1]) face_flocon(n-1);
                 };
             };
     }
     else
         triangle();
};

face_flocon(5);