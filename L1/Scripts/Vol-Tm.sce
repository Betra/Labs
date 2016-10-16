info = read("/Users/Robo/Documents/Git/Labs/L1/Data/TMtoVol.txt", -1, 2);
Voltage = info(:, 1);
Tm = info(:, 2);
plot2d(Voltage, Tm, 1)
gr = gca();
gr.x_label.text = "Voltage, %"
gr.y_label.text = "Tm, c"
gr.y_label.font_size = 3;
gr.x_label.font_size = 3;
