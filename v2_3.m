function v2 =v2_3(xi, w, k, o, t)
    syms x
    q=o*(k^(-2))-2*((x-1)^2)*(((k^2)-1)^(-1))*t*(k^(-2))+(w^2)*((1+2*((x-1)^2)/((k^(-2))-1))^2)
    v2=(((abs(q)/4)^(1/2))-1)*exp(-4/abs(q))+1
    v2=double(subs(v2, x, xi))
end