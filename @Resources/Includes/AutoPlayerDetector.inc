[Audio]
Measure=Plugin
Plugin=AudioLevel
IfCondition=Audio<0.001
IfTrueAction=[!DisableMeasure AutoMagick]
IfFalseAction=[!EnableMeasure AutoMagick][!UpdateMeasure AutoMagick]

[AutoMagick]
Measure=Script
ScriptFile=#@#Scripts\AutoMagick.lua
UpdateDivider=2
Disabled=1

[State0]
Measure=Plugin
Plugin=NowPlaying
PlayerName=CAD
PlayerType=State

[State1]
Measure=Plugin
Plugin=WebNowPlaying
PlayerType=State