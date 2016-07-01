;PancakePainter v1.0.0 GCODE header start
;Originally generated @ Wed Jun 29 2016 16:20:27 GMT-0400 (Eastern Daylight Time)
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
;Starting path #1/5, segments: 5, length: 211, color #1
G00 X106.153 Y56.42
M106 ;Pump on
G4 P0 ;Pause for 0 milliseconds
G00 X106.672 Y68.801
G00 X107.114 Y81.179
G00 X106.779 Y93.57
G00 X106.924 Y105.961
G00 X109.033 Y118.159
;Nearing path end, moving to preshutoff position
G00 X109.366 Y130.179
M107 ;Pump off
G00 X109.375 Y130.531
G4 P0 ;Pause for 0 milliseconds
;Completed path #1/5 on color #1
;Starting path #2/5, segments: 18, length: 523, color #1
G00 X167.054 Y131.176
M106 ;Pump on
G4 P0 ;Pause for 0 milliseconds
G00 X159.747 Y120.469
G00 X149.089 Y112.921
G00 X139.377 Y104.034
G00 X128.427 Y97.072
G00 X116.827 Y90.862
G00 X118.928 Y89.278
G00 X132.046 Y88.664
G00 X144.805 Y85.497
G00 X154.888 Y77.421
G00 X155.357 Y64.888
G00 X145.128 Y56.816
G00 X132.754 Y52.878
G00 X119.666 Y54.108
;Nearing path end, moving to preshutoff position
G00 X107.143 Y56.671
M107 ;Pump off
G00 X106.798 Y56.742
G4 P0 ;Pause for 0 milliseconds
;Completed path #2/5 on color #1
;Starting path #3/5, segments: 8, length: 321, color #1
G00 X200.888 Y93.798
M106 ;Pump on
G4 P0 ;Pause for 0 milliseconds
G00 X189.461 Y97.45
G00 X184.644 Y108.851
G00 X185.556 Y121.199
G00 X195.214 Y128.759
G00 X207.417 Y128.777
G00 X215.061 Y119.233
G00 X216.124 Y106.806
G00 X211.038 Y96.125
;Nearing path end, moving to preshutoff position
G00 X201.231 Y93.876
M107 ;Pump off
G00 X200.888 Y93.798
G4 P0 ;Pause for 0 milliseconds
;Completed path #3/5 on color #1
;Starting path #4/5, segments: 9, length: 267, color #1
G00 X245.677 Y132.142
M106 ;Pump on
G4 P0 ;Pause for 0 milliseconds
G00 X259.151 Y132.456
G00 X272.217 Y129.436
G00 X274.203 Y119.298
G00 X263.835 Y110.964
G00 X251.568 Y105.547
G00 X253.81 Y95.296
;Nearing path end, moving to preshutoff position
G00 X265.334 Y90.077
M107 ;Pump off
G00 X265.655 Y89.931
G4 P0 ;Pause for 0 milliseconds
;Completed path #4/5 on color #1
;Starting path #5/5, segments: 13, length: 493, color #1
G00 X305.611 Y112.809
M106 ;Pump on
G4 P0 ;Pause for 0 milliseconds
G00 X318.934 Y111.654
G00 X331.605 Y107.471
G00 X343.581 Y101.535
G00 X349.769 Y90.717
G00 X339.542 Y84.134
G00 X327.085 Y88.194
G00 X316.574 Y96.445
G00 X309.346 Y107.581
G00 X310.581 Y120.508
G00 X319.565 Y130.215
G00 X332.35 Y132.966
G00 X345.608 Y132.961
;Nearing path end, moving to preshutoff position
G00 X358.426 Y132.164
M107 ;Pump off
G00 X358.778 Y132.142
G4 P0 ;Pause for 0 milliseconds
;Completed path #5/5 on color #1
;PancakePainter Footer Start
G4 P1000 ;Pause for 1000 milliseconds
G28 X0 Y0 ;Home All Axis
M84 ;Motors off
;PancakePainter Footer Complete
