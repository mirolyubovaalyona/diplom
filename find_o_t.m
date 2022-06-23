function [o1, t1]=find_o_t(th0_1, th0_2, th0_3, th0_4 ,o1, t1, c1, c2, w, k, v, delta_o, delta_t, e)
    
    th_1_L=ode45(@(x, th) ODE_th_1_L( x, th, v,  o1, t1, k , w), [0, 1/2], th0_1)
    th_1_R=ode45(@(x, th) ODE_th_1_R( x, th, v,  o1, t1, k , w), [1,1/2], th0_2)
    th_2_L=ode45(@(x, th) ODE_th_2_L( x, th, v,  o1, t1, k , w), [1, (1+(k.^(-2)))/2],th0_3)
    th_2_R=ode23tb(@(x, th) ODE_th_2_R( x, th, v,  o1, t1, k , w), [k.^(-2),(1+(k.^(-2)))/2], th0_4)

    th_1_L=deval(th_1_L,c1)
    th_1_R=deval(th_1_R,c1)
    th_2_L=deval(th_2_L,c2)
    th_2_R=deval(th_2_R,c2)
    
    %1
    if (th_1_L-th_1_R)>=0 & (th_2_L-th_2_R)>=0
        delta_t=delta_t/2
        t1=t1+delta_t
        if (delta_o<=e) & (delta_t<=e)
            o=o1
            t=t1
            return
        else
            [o, t]=find_o_t(th0_1, th0_2, th0_3, th0_4 ,o1, t1, c1, c2, w, k, v, delta_o, delta_t, e)
        end
    end
 
    %2
    if (th_1_L-th_1_R)<=0 & (th_2_L-th_2_R)>=0
        delta_o=delta_o/2
        o1=o1-delta_o
        if (delta_o<=e) & (delta_t<=e)
            o=o1
            t=t1
            return
        else
            [ o, t]=find_o_t(th0_1, th0_2, th0_3, th0_4 ,o1, t1, c1, c2, w, k, v, delta_o, delta_t, e)
        end
    end

    %3
    if (th_1_L-th_1_R)<=0 & (th_2_L-th_2_R)<=0
        delta_t=delta_t/2
        t1=t1-delta_t
        if (delta_o<=e) & (delta_t<=e)
            o=o1
            t=t1
            return
        else
            [ o, t]=find_o_t(th0_1, th0_2, th0_3, th0_4 ,o1, t1, c1, c2, w, k, v, delta_o, delta_t, e)
        end
    end
  
    %4
    if (th_1_L-th_1_R)>=0 & (th_2_L-th_2_R)<=0
        delta_o=delta_o/2
        o1=o1+delta_o
        if (delta_o<=e) & (delta_t<=e)
            o=o1
            t=t1
            return
        else
            [ o, t]=find_o_t(th0_1, th0_2, th0_3, th0_4 ,o1, t1, c1, c2, w, k, v, delta_o, delta_t, e)
        end
    end
  


end