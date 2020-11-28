// Copyright 2020, Marc Wouts & Kids
// Under https://creativecommons.org/licenses/by-nc-sa/4.0/

// Height of a triangle of side 2 is sqrt(3)
// Height of a tetrahedron of side 2 is 2 sqrt(6) / 3
H = sqrt(3);

module triangle_epais(h) {
polyhedron(
    points=[
    [-1,0,h], [1,0,h], [0,H,h],
    [-1,0,-h], [1,0,-h], [0,H,-h]],
    // sommets dans l'ordre des aiguilles d'une montre vu de l'extérieur
    faces=[[0,1,2], [1,0,3,4], [2,1,4,5], [0,2,5,3], [5,4,3]]);
};

module face_flocon(n, h=0.01) {
    if(n>0)
    {
        translate([0,H/3,0])
        scale(1/2)
        for (angle = [0,120,240])
            {
                rotate([0,0,angle])
                translate([0,H/3,0])
                {   
                    face_flocon(n-1, 2*h);
                    rotate([109.5,0,0]) mirror([0,0,1]) face_flocon(n-1, 2*h);
                 };
             };
     }
     else
         triangle_epais(h);
};

face_flocon(3, 0.01);