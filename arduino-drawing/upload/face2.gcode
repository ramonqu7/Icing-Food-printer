;PancakePainter v1.0.0 GCODE header start
;Originally generated @ Wed Jun 29 2016 15:26:15 GMT-0400 (Eastern Daylight Time)
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
;Starting path #1/4, segments: 15, length: 113, color #1
G00 X202.821 Y62.22
M106 ;Pump on
G4 P0 ;Pause for 0 milliseconds
G00 X206.128 Y52.448
G00 X213.729 Y57.157
;Nearing path end, moving to preshutoff position
G00 X207.998 Y55.853
M107 ;Pump off
G00 X207.654 Y55.775
G4 P0 ;Pause for 0 milliseconds
;Completed path #1/4 on color #1
;Starting path #2/4, segments: 37, length: 1223, color #1
G00 X236.977 Y25.486
M106 ;Pump on
G4 P0 ;Pause for 0 milliseconds
G00 X223.072 Y25.018
G00 X209.153 Y25.431
G00 X196.156 Y30.148
G00 X185.171 Y38.261
G00 X174.781 Y47.388
G00 X167.261 Y58.887
G00 X160.432 Y70.917
G00 X157.942 Y84.59
G00 X157.475 Y98.459
G00 X161.978 Y111.474
G00 X169.551 Y123.009
G00 X178.99 Y133.045
G00 X191.067 Y139.794
G00 X204.417 Y143.741
G00 X218.024 Y146.149
G00 X231.809 Y148.056
G00 X245.671 Y147.19
G00 X259.3 Y144.592
G00 X272.849 Y142.01
G00 X283.955 Y133.739
G00 X293.661 Y123.922
G00 X300.128 Y111.608
G00 X303.741 Y98.306
G00 X305.034 Y84.455
G00 X303.512 Y70.774
G00 X298.65 Y57.996
G00 X291.258 Y46.268
G00 X281.455 Y36.597
G00 X269.696 Y29.733
G00 X256.586 Y25.742
;Nearing path end, moving to preshutoff position
G00 X243.129 Y24.864
M107 ;Pump off
G00 X242.777 Y24.842
G4 P0 ;Pause for 0 milliseconds
;Completed path #2/4 on color #1
;Starting path #3/4, segments: 19, length: 99, color #1
G00 X251.477 Y54.164
M106 ;Pump on
G4 P0 ;Pause for 0 milliseconds
G00 X245.401 Y55.193
G00 X251.954 Y49.566
;Nearing path end, moving to preshutoff position
G00 X256.467 Y58.042
M107 ;Pump off
G00 X256.633 Y58.353
G4 P0 ;Pause for 0 milliseconds
;Completed path #3/4 on color #1
;Starting path #4/4, segments: 14, length: 253, color #1
G00 X271.777 Y96.053
M106 ;Pump on
G4 P0 ;Pause for 0 milliseconds
G00 X260.18 Y100.743
G00 X247.87 Y103.264
G00 X235.239 Y104.125
G00 X222.817 Y103.18
G00 X210.288 Y101.173
G00 X197.8 Y99.502
;Nearing path end, moving to preshutoff position
G00 X186.084 Y96.464
M107 ;Pump off
G00 X185.743 Y96.375
G4 P0 ;Pause for 0 milliseconds
;Completed path #4/4 on color #1
;PancakePainter Footer Start
G4 P1000 ;Pause for 1000 milliseconds
G28 X0 Y0 ;Home All Axis
M84 ;Motors off
;PancakePainter Footer Complete
