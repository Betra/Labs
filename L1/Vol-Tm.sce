info = read("C:\Users\Sela\Desktop\L1\TMtoVol.txt", -1, 2);
Voltage = info(:, 1);
Tm = info(:, 2);
plot2d(Voltage, Tm, 1)
gr = gca();
gr.x_label.text = "Voltage"
gr.y_label.text = "Tm"

