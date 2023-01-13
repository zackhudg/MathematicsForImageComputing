function quatprod = quatmultiply(p, q)
    quatprod = [0, 0, 0, 0];
    quatprod(1) = p(1)*q(1)-p(2)*q(2)-p(3)*q(3)-p(4)*q(4);
    quatprod(2) = p(1)*q(2)+p(2)*q(1)+p(3)*q(4)-p(4)*q(3);
    quatprod(3) = p(1)*q(3)-p(2)*q(4)+p(3)*q(1)+p(4)*q(2);
    quatprod(4) = p(1)*q(4)+p(2)*q(3)-p(3)*q(2)+p(4)*q(1);
end