// Copyright 2020, Marc Wouts & Kids
// Under https://creativecommons.org/licenses/by-nc-sa/4.0/

// Height of a triangle of side 2 is sqrt(3)
// Height of a tetrahedron of side 2 is 2 sqrt(6) / 3
H = sqrt(3);
T = 2 * sqrt(6) / 3;

module tetrahedron() {
    polyhedron(
    points=[
    [-1,0,0],
    [1,0,0],
    [0,H,0],
    [0,H/3,T]],
    // faces: points enumerated clockwise when looking at the face from the outside inwards
    faces=[
    [0,1,2],
    [3,2,1],
    [3,1,0],
    [3,0,2],
    ]);
};