[Animation]
Measure=Plugin
Plugin=ActionTimer

ActionList1=Repeat Tint, 2, 20 | Repeat Show,2,20
ActionList2=Repeat Hide, 2, 20
ActionList3=Repeat Tint, 2, 20
ActionList4=Repeat Fade, 2, 20


Show=[!SetVariable Animation "(Clamp(#Animation#+0.05, 0, 1))"][!UpdateMeasureGroup Animation][!UpdateMeterGroup Animation][!Redraw][!Delay 5][!UpdateMeasure #CURRENTSECTION#]
Hide=[!SetVariable Animation "(Clamp(#Animation#-0.05, 0, 1))"][!UpdateMeasureGroup Animation][!UpdateMeterGroup Animation][!Redraw][!Delay 5][!UpdateMeasure #CURRENTSECTION#]

Tint=[!SetVariable Animation2 "(Clamp(#Animation2#+0.05, 0, 1))"][!UpdateMeasureGroup Animation2][!UpdateMeterGroup Animation2][!Redraw]
Fade=[!SetVariable Animation2 "(Clamp(#Animation2#-0.05, 0, 1))"][!UpdateMeasureGroup Animation2][!UpdateMeterGroup Animation2][!Redraw]


DynamicVariables=1
UpdateDivider=-1
IgnoreWarnings=1
Group=Animation | Animation2

[Slider]
Measure=Calc
Formula=[#Animation]
Group=Animation
DynamicVariables=1
IfCondition=Slider=1
IfTrueAction=[!EnableMeasure SliderScript][!Delay 500][!UpdateMeasure SliderScript]
IfFalseAction=[!DisableMeasure SliderScript][!CommandMeasure SliderScript "Reset()"]

[SliderScript]
Measure=Script
ScriptFile=#@#Scripts\Slider.lua
UpdateDivider=-1
Disabled=1

[AlbumArtAni]
Measure=Calc
Formula=[#Animation]**3
DynamicVariables=1
UpdateDivider=-1
Group=Animation

[Animlua]
Measure=Script
ScriptFile=#@#Scripts\Animation.lua
Group=Animation | Animation2