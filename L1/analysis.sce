results = read("C:\Users\Sela\Desktop\L1\Data\-20.txt", -1, 2);
qlines=size(:,1) 
angle=results(:,2) 
angle=angle*%pi/180 
time=results(:,1)/1000 
time=time-time(1) 
plot2d(time, angle, 2) 

aim=[time,angle] 
aim=aim' 
deff('e=func(k,z)','e=z(2)-k(1)*(z(1)-k(2)*(1-exp(-z(1)/k(2))))') 
att=[-15;0.06] 
[koeffs,errs]=datafit(func,aim,att) 
Wnls=koeffs(1) 
Tm=koeffs(2) 
model=Wnls*(time-Tm*(1-exp(-time/Tm))) 
plot2d(time, model, 3) 

J=0.0023 

Mst=(J*Wnls)/(Tm) 

importXcosDiagram("C:\Users\Sela\Desktop\L1\Data\CHEVO.zcos") 
xcos_simulate(scs_m,4) 

plot2d(A.time,A.values,5) 

legend('Experiment','$\theta(t)=\omega_{nls}t-\omega_{nls}T_m+ \omega_{nls}T_m\,exp\bigl(-\frac{t}{T_m}\bigr)$','Model',2, opt=3)
