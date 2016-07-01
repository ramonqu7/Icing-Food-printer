;PancakePainter v1.0.0 GCODE header start
;Originally generated @ Tue Jun 21 2016 16:02:35 GMT-0400 (Eastern Daylight Time)
;Settings used to generate this file:
;----------------------------------------
;flattenResolution: 15
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
;Starting path #1/1, segments: 9, length: 117, color #1
G00 X147.668 Y38.281
M106 ;Pump on
G4 P0 ;Pause for 0 milliseconds
G00 X147.734 Y43.416
G00 X148.261 Y48.526
G00 X149.715 Y53.423
G00 X151.158 Y58.148
G00 X151.46 Y63.278
G00 X152.597 Y68.288
G00 X154.138 Y73.177
;Nearing path end, moving to preshutoff position
G00 X154.877 Y77.707
M107 ;Pump off
G00 X154.934 Y78.055
G4 P0 ;Pause for 0 milliseconds
;Completed path #1/1 on color #1
;PancakePainter Footer Start
G4 P1000 ;Pause for 1000 milliseconds
G28 X0 Y0 ;Home All Axis
M84 ;Motors off
;PancakePainter Footer Complete
