function diff_v =diff_v_1(xi, w, k, o, t)
    syms x
    q=o*(k^(-2))+(1-2*(x^2))*t*(k^(-2))+4*(w^2)*(x^4)
    v2=(((abs(q)/4)^(1/2))-1)*exp(-4/abs(q))+1
    v=v2^(1/2)
    diff_v=diff(v, x, 1)
    diff_v=double(subs(diff_v, x, xi))
end