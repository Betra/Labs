info = read("C:\Users\Sela\Desktop\L1\Vol-Wnls.txt", -1, 2);
Voltage = info(:, 1);
Wnls = info(:, 2);
plot2d(Voltage, Wnls, 1)
gr = gca();
gr.x_label.text = "Voltage, %"
gr.y_label.text = "Wnls, рад\с"

