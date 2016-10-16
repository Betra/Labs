name = "20";
pos = 4;

results = read("/Users/Robo/Documents/Git/Labs/L1/Data/"+name+".txt", -1, 2);
qlines=size(:,1);

angle=results(:,2); //Angle
angle=angle*%pi/180; 

time=results(:,1)/1000; //Time
time=time-time(1);

plot2d(time, angle, 2); //Time - Angle

aim=[time,angle]; //Approximation 
aim=aim';

deff(   'e=func(k,z)','e=z(2)-k(1)*(z(1)-k(2)*(1-exp(-z(1)/k(2))))' );

att=[15;0.06];
[koeffs,errs]=datafit(func,aim,att);

Wnls=koeffs(1);
Tm=koeffs(2);

model=Wnls*(time-Tm*(1-exp(-time/Tm))); 

plot(time, model, 'g--'); // Time - Model

J=0.0023; // NXT

Mst=(J*Wnls)/(Tm);

importXcosDiagram("/Users/Robo/Documents/Git/Labs/L1/Scripts/Scheme.zcos");
xcos_simulate(scs_m,4);

plot(A.time,A.values, 'r:');

legend('Experiment','$\theta(t)=\omega_{nls}t-\omega_{nls}T_m+ \omega_{nls}T_m\,exp\bigl(-\frac{t}{T_m}\bigr)$','Model',2, opt=pos);

graph = gca();
p = get("model");
graph.x_label.text = "t, c";
graph.x_label.font_size = 3;
graph.y_label.text = 'Θ, рад';
graph.y_label.font_size = 3;
graph.children.children.thickness = 2;
p.thickness = 4;
xs2gif(0, name+".gif");
