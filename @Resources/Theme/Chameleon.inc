[AAColor]
Measure=Plugin
Plugin=Chameleon
DynamicVariables=1
Type=File
Path=[Art[#LastPlugin]]
FallbackFG1=ffffff
FallbackFG2=ffffff
FallbackBG1=000000
FallbackBG2=000000
Group=A|Art

[aAVG]
Measure=Plugin
Plugin=Chameleon
Parent=AAColor
Color=Average
Format=Dec
Group=A|Art
[aFG2]
Measure=Plugin
Plugin=Chameleon
Parent=AAColor
Color=Light2
Format=Dec
Group=A|Art
[aD1]
Measure=Plugin
Plugin=Chameleon
Parent=AAColor
Color=Dark1
Format=Dec
Group=A|Art

[Variables]
BackgroundColor=[aD1]

TopTextColor=[aFG2]
BottomTextColor=[aFG2]

ProgressColor=[aFG2]
ProgressBackgroundColor=[aFG2],140

AlbumTint=20,20,20
ControlsColor=254,254,254