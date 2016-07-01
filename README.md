# Icing-Food-printer
Arduino - WPF C# 2D- GCode interpreter Food Printer 


Arduino code - please refer to the website https://www.marginallyclever.com/2013/08/how-to-build-an-2-axis-arduino-cnc-gcode-interpreter/
Also, we used an Arduino library (including in the folder)  AH_EasyDriver

Command list:

(If you use the arduino serial monitor, send any text first(do not starting with "S") then input your command or points.

Command list

CH    - Home
CS+number    - Rotate servo certain degree
CT     - Stop servo
CE+number    - Back home and reverse serov certain time(millyseconds)

P+number+,+number    - move to certain points.

Please use arduino to load and then use WPF to import and communicate with Arduino board.
WPF file  arduino_drawing.exe     is under bin folder. Close it after you print everytime.

The wiriing details, please see the report in the folder.
