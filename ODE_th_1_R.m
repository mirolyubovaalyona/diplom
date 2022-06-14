function ode_th =ODE_th_1_R( x, th, w, k, o, t)
    v2 =exp(-4/abs(w^2*(2*(x - 1)^2 - 1)^2 + o/k^2 + (2*t*(x - 1)^2)/k^2))*((abs(w^2*(2*(x - 1)^2 - 1)^2 + o/k^2 + (2*t*(x - 1)^2)/k^2)/4)^(1/2) - 1) + 1
    v =(exp(-4/abs(w^2*(2*(x - 1)^2 - 1)^2 + o/k^2 + (2*t*(x - 1)^2)/k^2))*((abs(w^2*(2*(x - 1)^2 - 1)^2 + o/k^2 + (2*t*(x - 1)^2)/k^2)/4)^(1/2) - 1) + 1)^(1/2)
    diff_v =((exp(-4/abs(w^2*(2*(x - 1)^2 - 1)^2 + o/k^2 + (2*t*(x - 1)^2)/k^2))*sign(w^2*(2*(x - 1)^2 - 1)^2 + o/k^2 + (2*t*(x - 1)^2)/k^2)*(2*w^2*(4*x - 4)*(2*(x - 1)^2 - 1) + (2*t*(2*x - 2))/k^2))/(8*(abs(w^2*(2*(x - 1)^2 - 1)^2 + o/k^2 + (2*t*(x - 1)^2)/k^2)/4)^(1/2)) + (4*exp(-4/abs(w^2*(2*(x - 1)^2 - 1)^2 + o/k^2 + (2*t*(x - 1)^2)/k^2))*sign(w^2*(2*(x - 1)^2 - 1)^2 + o/k^2 + (2*t*(x - 1)^2)/k^2)*(2*w^2*(4*x - 4)*(2*(x - 1)^2 - 1) + (2*t*(2*x - 2))/k^2)*((abs(w^2*(2*(x - 1)^2 - 1)^2 + o/k^2 + (2*t*(x - 1)^2)/k^2)/4)^(1/2) - 1))/abs(w^2*(2*(x - 1)^2 - 1)^2 + o/k^2 + (2*t*(x - 1)^2)/k^2)^2)/(2*(exp(-4/abs(w^2*(2*(x - 1)^2 - 1)^2 + o/k^2 + (2*t*(x - 1)^2)/k^2))*((abs(w^2*(2*(x - 1)^2 - 1)^2 + o/k^2 + (2*t*(x - 1)^2)/k^2)/4)^(1/2) - 1) + 1)^(1/2))
    f=(1-2*((1-x)^2))*((k^(-2))-1+2*((1-x)^2))/8
    q=o*(k^(-2))+2*t*(k^(-2))*((1-x)^2)+(w^2)*((1-2*((1-x)^2))^2)
    ode_th=(v2/(f^(1/2)))*((cos(th))^2)+(q/(4*v2*(f^(1/2))))*((sin(th))^2)+(diff_v/v)*(sin(2*th))
end