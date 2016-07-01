;PancakePainter v1.0.0 GCODE header start
;Originally generated @ Wed Jun 22 2016 14:28:36 GMT-0400 (Eastern Daylight Time)
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
;Starting path #1/1, segments: 4, length: 217, color #1
G00 X444.826 Y188.2
M106 ;Pump on
G4 P0 ;Pause for 0 milliseconds
G00 X448.808 Y191.39
G00 X453.302 Y193.823
G00 X458.065 Y195.68
G00 X462.971 Y197.129
G00 X467.959 Y198.308
G00 X472.957 Y199.335
G00 X477.912 Y200.569
G00 X482.574 Y202.657
G00 X486.942 Y205.313
G00 X491.143 Y208.233
G00 X495.338 Y211.155
G00 X499.668 Y213.826
G00 X504.046 Y216.488
G00 X508.348 Y219.29
;Nearing path end, moving to preshutoff position
G00 X511.871 Y222.388
M107 ;Pump off
G00 X512.135 Y222.621
G4 P0 ;Pause for 0 milliseconds
;Completed path #1/1 on color #1
;PancakePainter Footer Start
G4 P1000 ;Pause for 1000 milliseconds
G28 X0 Y0 ;Home All Axis
M84 ;Motors off
;PancakePainter Footer Complete
