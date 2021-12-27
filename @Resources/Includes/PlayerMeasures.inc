[Title0]
Measure=Plugin
Plugin=NowPlaying
PlayerName=[State0]
PlayerType=Title
Substitute="":"Nothing playing"
UpdateDivider=1
[Title1]
Measure=Plugin
Plugin=WebNowPlaying
PlayerType=Title
Substitute="":"Nothing playing"
UpdateDivider=1

[Artist0]
Measure=Plugin
Plugin=NowPlaying
PlayerName=[State0]
PlayerType=Artist
Substitute="":"No One"
UpdateDivider=1
[Artist1]
Measure=Plugin
Plugin=WebNowPlaying
PlayerType=Artist
Substitute="":"No One"
UpdateDivider=1

[ChangeDetect]
Measure=String
String=[Title[#LastPlugin]][Artist[#LastPlugin]]
DynamicVariables=1
UpdateDivider=1
OnChangeAction=[!UpdateMeasure *][!CommandMeasure SliderScript "Reset()"][!UpdateMeter *][!Update][!UpdateMeasure SliderScript]

[Album0]
Measure=Plugin
Plugin=NowPlaying
PlayerName=[State0]
PlayerType=Album
[Album1]
Measure=Plugin
Plugin=WebNowPlaying
PlayerType=Album

[Number]
Measure=Plugin
Plugin=NowPlaying
PlayerName=[State0]
PlayerType=Number

[Position0]
Measure=Plugin
Plugin=NowPlaying
PlayerName=[State0]
PlayerType=Position
UpdateDivider=1
[Position1]
Measure=Plugin
Plugin=WebNowPlaying
PlayerType=Position
UpdateDivider=1

[Duration0]
Measure=Plugin
Plugin=NowPlaying
PlayerName=[State0]
PlayerType=Duration
UpdateDivider=1
[Duration1]
Measure=Plugin
Plugin=WebNowPlaying
PlayerType=Duration
UpdateDivider=1

[Progress0]
Measure=Plugin
Plugin=NowPlaying
PlayerName=[State0]
PlayerType=PROGRESS
Decimals=10
Substitute="":"0"
UpdateDivider=1
[Progress1]
Measure=Plugin
Plugin=WebNowPlaying
PlayerType=Progress
Substitute="":"0"
UpdateDivider=1

[Art0]
Measure=Plugin
Plugin=NowPlaying
PlayerName=[State0]
PlayerType=Cover
Substitute="":"#@#Cover\default.png"
DynamicVariables=1
UpdateDivider=1
[Art1]
Measure=Plugin
Plugin=WebNowPlaying
PlayerType=Cover
CoverPath=#@#Cover\cover_wnp.png
Substitute="":"#@#Cover\default.png"
DynamicVariables=1
UpdateDivider=1