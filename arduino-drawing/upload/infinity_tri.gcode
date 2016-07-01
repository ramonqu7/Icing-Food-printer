;PancakePainter v1.0.0 GCODE header start
;Originally generated @ Thu Jun 30 2016 14:43:47 GMT-0400 (Eastern Daylight Time)
;Settings used to generate this file:
;----------------------------------------
;flattenResolution: 40
;lineEndPreShutoff: 1
;startWait: 0
;endWait: 0
;shadeChangeWait: 35
;fillSpacing: 15
;fillAngle: 23
;fillGroupThreshold: 27
;----------------------------------------
W1 X42 Y210 L485 T0 ;Define Workspace of this file
G21 ;Set units to MM
G1 F5600 ;Set Speed
M107 ;Pump off
G4 P1000 ;Pause for 1000 milliseconds
M84 ;Motors off
G28 X0 Y0 ;Home All Axis
;PancakePainter header complete
;Starting path #1/2, segments: 14, length: 3188, color #1
G00 X232.143 Y14.853
M106 ;Pump on
G4 P0 ;Pause for 0 milliseconds
G00 X155.131 Y165.654
G00 X174.143 Y185.954
G00 X239.877 Y58.031
G00 X281.444 Y133.109
G00 X228.599 Y131.498
G00 X251.477 Y79.298
G00 X214.421 Y162.109
G00 X345.567 Y158.243
G00 X315.278 Y102.498
G00 X269.844 Y12.597
G00 X234.399 Y11.953
G00 X305.933 Y134.72
;Nearing path end, moving to preshutoff position
G00 X281.796 Y132.815
M107 ;Pump off
G00 X281.444 Y132.787
G4 P0 ;Pause for 0 milliseconds
;Completed path #1/2 on color #1
;Starting path #2/2, segments: 3, length: 542, color #1
G00 X346.856 Y160.176
M106 ;Pump on
G4 P0 ;Pause for 0 milliseconds
G00 X335.9 Y185.954
;Nearing path end, moving to preshutoff position
G00 X172.884 Y186.919
M107 ;Pump off
G00 X172.532 Y186.921
G4 P0 ;Pause for 0 milliseconds
;Completed path #2/2 on color #1
;PancakePainter Footer Start
G4 P1000 ;Pause for 1000 milliseconds
G28 X0 Y0 ;Home All Axis
M84 ;Motors off
;PancakePainter Footer Complete
