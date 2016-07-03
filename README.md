# Icing-Food-printer

Group Project for Rose-Hulman Institution of Technology Operation Catapult


Jake Zhang             Solon High School
Jake Zuckerman        Dunlap High School
Luke Cesario       	Downers Grove North High School
Yiren Qu            Lyndon Institute


Arduino - WPF C# 2D- GCode interpreter Food Printer


Arduino code - please refer to the website https://www.marginallyclever.com/2013/08/how-to-build-an-2-axis-arduino-cnc-gcode-interpreter/
Also, we used an Arduino library (including in the folder)  AH_EasyDriver

Command list:

(If you use the arduino serial monitor, send any text first(do not starting with "S") then input your command or points.

Pancake painter setting:
Flatten resolution 30  (can be modified)
line end pre-shutoff distance: 1
line start pump on wait time 0     - please change it in arduino
line end pump off wait time 0
fill line spacing in 20-40 recommended
fill angle 23-45



Command list:

CH    - Home
CS+number    - Rotate servo certain degree
CT     - Stop servo
CE+number    - Back home and reverse serov certain time(millyseconds)

P+number+,+number    - move to certain points.

Please use arduino to load and then use WPF to import and communicate with Arduino board.
WPF file  arduino_drawing.exe     is under bin folder. Close it after you print everytime.

The wiriing details, please see the report in the folder.
