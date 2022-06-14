function res =ODE_H_2_R( x, H, w, k, o, t)
    v2 =exp(-4/abs(w^2*((2*x - 2/k^4)/(1/k^2 - 1) - 1/k^2)^2 + o/k^2 + (t*((2*(x - 1/k^2)^2)/(1/k^2 - 1) - 1/k^2 + 1))/k^2))*((abs(w^2*((2*x - 2/k^4)/(1/k^2 - 1) - 1/k^2)^2 + o/k^2 + (t*((2*(x - 1/k^2)^2)/(1/k^2 - 1) - 1/k^2 + 1))/k^2)/4)^(1/2) - 1) + 1
    v =(exp(-4/abs(w^2*((2*x - 2/k^4)/(1/k^2 - 1) - 1/k^2)^2 + o/k^2 + (t*((2*(x - 1/k^2)^2)/(1/k^2 - 1) - 1/k^2 + 1))/k^2))*((abs(w^2*((2*x - 2/k^4)/(1/k^2 - 1) - 1/k^2)^2 + o/k^2 + (t*((2*(x - 1/k^2)^2)/(1/k^2 - 1) - 1/k^2 + 1))/k^2)/4)^(1/2) - 1) + 1)^(1/2)
    diff_v =((sign(w^2*((2*x - 2/k^4)/(1/k^2 - 1) - 1/k^2)^2 + o/k^2 + (t*((2*(x - 1/k^2)^2)/(1/k^2 - 1) - 1/k^2 + 1))/k^2)*exp(-4/abs(w^2*((2*x - 2/k^4)/(1/k^2 - 1) - 1/k^2)^2 + o/k^2 + (t*((2*(x - 1/k^2)^2)/(1/k^2 - 1) - 1/k^2 + 1))/k^2))*((4*w^2*((2*x - 2/k^4)/(1/k^2 - 1) - 1/k^2))/(1/k^2 - 1) + (2*t*(2*x - 2/k^2))/(k^2*(1/k^2 - 1))))/(8*(abs(w^2*((2*x - 2/k^4)/(1/k^2 - 1) - 1/k^2)^2 + o/k^2 + (t*((2*(x - 1/k^2)^2)/(1/k^2 - 1) - 1/k^2 + 1))/k^2)/4)^(1/2)) + (4*sign(w^2*((2*x - 2/k^4)/(1/k^2 - 1) - 1/k^2)^2 + o/k^2 + (t*((2*(x - 1/k^2)^2)/(1/k^2 - 1) - 1/k^2 + 1))/k^2)*exp(-4/abs(w^2*((2*x - 2/k^4)/(1/k^2 - 1) - 1/k^2)^2 + o/k^2 + (t*((2*(x - 1/k^2)^2)/(1/k^2 - 1) - 1/k^2 + 1))/k^2))*((abs(w^2*((2*x - 2/k^4)/(1/k^2 - 1) - 1/k^2)^2 + o/k^2 + (t*((2*(x - 1/k^2)^2)/(1/k^2 - 1) - 1/k^2 + 1))/k^2)/4)^(1/2) - 1)*((4*w^2*((2*x - 2/k^4)/(1/k^2 - 1) - 1/k^2))/(1/k^2 - 1) + (2*t*(2*x - 2/k^2))/(k^2*(1/k^2 - 1))))/abs(w^2*((2*x - 2/k^4)/(1/k^2 - 1) - 1/k^2)^2 + o/k^2 + (t*((2*(x - 1/k^2)^2)/(1/k^2 - 1) - 1/k^2 + 1))/k^2)^2)/(2*(exp(-4/abs(w^2*((2*x - 2/k^4)/(1/k^2 - 1) - 1/k^2)^2 + o/k^2 + (t*((2*(x - 1/k^2)^2)/(1/k^2 - 1) - 1/k^2 + 1))/k^2))*((abs(w^2*((2*x - 2/k^4)/(1/k^2 - 1) - 1/k^2)^2 + o/k^2 + (t*((2*(x - 1/k^2)^2)/(1/k^2 - 1) - 1/k^2 + 1))/k^2)/4)^(1/2) - 1) + 1)^(1/2))
    f=((k^(-2))*((k^(-2))-1)-2*(((k^(-2))-x)^2))*(((k^(-2))-1-2*((x-(k^(-2)))^2)*((k^(-2))-1))^(-1))/8
    q=o*(k^(-2))-t*(k^(-2))*((k^(-2))-1-2*((x-(k^(-2)))^2)*(((k^(-2))-1)^(-1)))+(w^2)*(((k^(-2))-2*(((x-(k^(-2)))^2))/((k^(-2))-1))^2)
    ode_th=(v2/((-f)^(1/2)))*((cos(H(1)))^2)-(q/(4*v2*((-f)^(1/2))))*((sin(H(1)))^2)+(diff_v/v)*(sin(2*H(1)))
    ode_H=2*(((-q/(4*v2*((-f)^(1/2))))-(v2/((-f)^(1/2))))*(sin(2*H(1)))/2)*H(2)+((sin(H(1)))^2)/(v2*((-f)^(1/2)))
    res =[ode_th; ode_H]
end