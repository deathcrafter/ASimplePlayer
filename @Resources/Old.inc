
[Status0A]
Measure=Plugin
Plugin=NowPlaying
PlayerName=AIMP
PlayerType=STATE
OnChangeAction=[!UpdateMeasure StatusChangeCheck]
Group=B
[Status0B]
Measure=Plugin
Plugin=NowPlaying
PlayerName=CAD
PlayerType=STATE
OnChangeAction=[!UpdateMeasure StatusChangeCheck]
Group=B
[Status0C]
Measure=Plugin
Plugin=NowPlaying
PlayerName=iTunes
PlayerType=STATE
OnChangeAction=[!UpdateMeasure StatusChangeCheck]
Group=B
[Status0D]
Measure=Plugin
Plugin=NowPlaying
PlayerName=MediaMonkey
PlayerType=STATE
OnChangeAction=[!UpdateMeasure StatusChangeCheck]
Group=B
[Status0E]
Measure=Plugin
Plugin=NowPlaying
PlayerName=Winamp
PlayerType=STATE
OnChangeAction=[!UpdateMeasure StatusChangeCheck]
Group=B
[Status0F]
Measure=Plugin
Plugin=NowPlaying
PlayerName=WLM
PlayerType=STATE
OnChangeAction=[!UpdateMeasure StatusChangeCheck]
Group=B
[Status0G]
Measure=Plugin
Plugin=NowPlaying
PlayerName=WMP
PlayerType=STATE
OnChangeAction=[!UpdateMeasure StatusChangeCheck]
Group=B

[Status1]
Measure=Plugin
Plugin=WebNowPlaying
PlayerType=State
OnChangeAction=[!UpdateMeasure StatusChangeCheck]
Group=A

[StatusChangeCheck]
Measure=String
String=[Status0A][Status0B][Status0C][Status0D][Status0E][Status0F][Status0G][Status1]
OnChangeAction=[!UpdateMeasure StatusChangeSwitch][!Redraw]
DynamicVariables=1

[StatusChangeSwitch]
Measure=Calc
IfCondition=(Status0A=1)
IfTrueAction=[!WriteKeyValue Variables LastPlayer AIMP][!SetOption Status0 PlayerName AIMP]
IfCondition2=(Status0A<>1)&&(Status0B=1)
IfTrueAction2=[!WriteKeyValue Variables LastPlayer CAD][!SetOption Status0 PlayerName CAD]
IfCondition3=(Status0A<>1)&&(Status0B<>1)&&(Status0C=1)
IfTrueAction3=[!WriteKeyValue Variables LastPlayer iTunes][!SetOption Status0 PlayerName iTunes]
IfCondition4=(Status0A<>1)&&(Status0B<>1)&&(Status0C<>1)&&(Status0D=1)
IfTrueAction4=[!WriteKeyValue Variables LastPlayer MediaMonkey][!SetOption Status0 PlayerName MediaMonkey]
IfCondition5=(Status0A<>1)&&(Status0B<>1)&&(Status0C<>1)&&(Status0D<>1)&&(Status0E=1)
IfTrueAction5=[!WriteKeyValue Variables LastPlayer Winamp][!SetOption Status0 PlayerName Winamp
IfCondition6=(Status0A<>1)&&(Status0B<>1)&&(Status0C<>1)&&(Status0D<>1)&&(Status0E<>1)&&(Status0F=1)
IfTrueAction6=[!WriteKeyValue Variables LastPlayer WLM][!SetOption Status0 PlayerName WLM]
IfCondition7=(Status0A<>1)&&(Status0B<>1)&&(Status0C<>1)&&(Status0D<>1)&&(Status0E<>1)&&(Status0F<>1)&&(Status0G=1)
IfTrueAction7=[!WriteKeyValue Variables LastPlayer WMP][!SetOption Status0 PlayerName WMP]
IfCondition8=(Status0A<>1)&&(Status0B<>1)&&(Status0C<>1)&&(Status0D<>1)&&(Status0E<>1)&&(Status0F<>1)&&(Status0G<>1)&&(Status1<>0)
IfTrueAction8=[!WriteKeyValue Variables CurrentPlugin 1][!SetVariable CurrentPlugin 1]
IfCondition9=(Status0A<>1)&&(Status0B<>1)&&(Status0C<>1)&&(Status0D<>1)&&(Status0E<>1)&&(Status0F<>1)&&(Status0G<>1)&&(Status1=0)
IfTrueAction9=[!WriteKeyValue Variables CurrentPlugin 0][!SetOption Status0 PlayerName #LastPlayer#][!SetVariable CurrentPlugin 0]
IfCondition10=((Status0A=1)|(Status0B=1)|(Status0C=1)|(Status0D=1)|(Status0E=1)|(Status0F=1)|(Status0G=1))&&(Status1<>1)
IfTrueAction10=[!WriteKeyValue Variables CurrentPlugin 0][!SetVariable CurrentPlugin 0]
IfConditionMode=0
DynamicVariables=1
UpdateDivider=-1