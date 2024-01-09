function F = equilibriumPoints(x, b1, d1, a11, a12, a13, d2, a21, a22, a23, d3, a31, a32, a33)
    F(1) = x(1)*(b1 - d1 - a11*x(1) - a12*x(2) - a13*x(3));
    F(2) = x(2)*(-d2 + a21*x(1) - a22*x(2) - a23*x(3));
    F(3) = x(3)*(-d3 + a31*x(1) + a32*x(2) - a33*x(3));
end
