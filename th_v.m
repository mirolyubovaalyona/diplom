i1=1
i2=0
i3=1
k2=0.9
w2=1
k=sqrt(k2)
w=sqrt(w2)
m=9
n=10
h=465.062
l=456.820

t=l
o=h-l

if i1==1
    th0_1=0
else
    th0_1=pi/2
end

if i2==1
    th0_2= pi+m*pi
    th0_3=0
else
    th0_2= pi/2+m*pi
    th0_3= pi/2
end

if i3==1
    th0_4=pi+(n-m)*pi
else
    th0_4=pi/2+(n-m)*pi
end

c1=1/2
c2=(1+k.^(-2))/2

%================_____th_____=====================
th_1_L=ode45(@(x, th) ODE_th_1_L( x, th, w, k, o, t), [0, 1/2], th0_1)
figure
plot(th_1_L.x,th_1_L.y)
title('th_1_L')

th_1_R=ode45(@(x, th) ODE_th_1_R( x, th, w, k, o, t), [1, 1/2], th0_2)
figure
plot(th_1_R.x,th_1_R.y)
title('th_1_R')

th_2_L=ode45(@(x, th) ODE_th_2_L( x, th, w, k, o, t, v2_3(x, w, k, o, t), v_3(x, w, k, o, t), diff_v_3(x, w, k, o, t)), [1,  (1+(k.^(-2)))/2], th0_3)
figure
plot(th_2_L.x,th_2_L.y)
title('th_2_L')


th_2_R=ode45(@(x, th) ODE_th_2_R( x, th, w, k, o, t, v2_4(x, w, k, o, t), v_4(x, w, k, o, t), diff_v_4(x, w, k, o, t)), [(k.^(-2)),  (1+(k.^(-2)))/2], th0_4)
figure
plot(th_2_R.x,th_2_R.y)
title('th_2_R')


th_1=deval(th_1_L,c1)
th_2=deval(th_1_R,c1)
th_3=deval(th_2_L,c2)
th_4=deval(th_2_R,c2)

th_2_1=deval(th_1_R,1)
th_3_1=deval(th_2_L,1)




