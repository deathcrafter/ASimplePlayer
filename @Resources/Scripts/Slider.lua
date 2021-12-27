function Initialize()
    scale=SKIN:ParseFormula(SKIN:ReplaceVariables(SKIN:GetVariable('Scale')))
    toptext1=SKIN:GetMeter('TopText1')
    toptext2=SKIN:GetMeter('TopText2')
    bottomtext1=SKIN:GetMeter('BottomText1')
    bottomtext2=SKIN:GetMeter('BottomText2')
    multiplier=tonumber(SKIN:GetVariable('RollSpeedMultiplier'))
    Reset()
end

function Reset()
    i=0
    j=0
    SKIN:Bang('!SetOption', 'TopText1', 'X', 0)
    SKIN:Bang('!SetOption', 'BottomText1', 'X', 0)
end

function Update()
    if toptext1:GetW()>380*scale and bottomtext1:GetW()<380*scale then
        i=i>=toptext2:GetW() and 0 or i+1*multiplier
        SKIN:Bang('!SetOption', 'TopText1', 'X', -i)
        SKIN:Bang('!UpdateMeter', 'TopText1')
        SKIN:Bang('!Redraw')
        SKIN:Bang('[!Delay 20][!UpdateMeasure '..SELF:GetName()..']')
    elseif toptext1:GetW()<=380*scale and bottomtext1:GetW()>380*scale then
        j=j<=-bottomtext2:GetW() and 0 or j-1*multiplier
        SKIN:Bang('!SetOption', 'BottomText1', 'X', j)
        SKIN:Bang('!UpdateMeter', 'BottomText1')
        SKIN:Bang('!Redraw')
        SKIN:Bang('[!Delay 20][!UpdateMeasure '..SELF:GetName()..']')
    elseif toptext1:GetW()>380*scale and bottomtext1:GetW()>380*scale then
        i=i<=-toptext2:GetW() and 0 or i-1*multiplier
        j=j<=-bottomtext2:GetW() and 0 or j-1*multiplier
        SKIN:Bang('!SetOption', 'TopText1', 'X', i)
        SKIN:Bang('!SetOption', 'BottomText1', 'X', j)
        SKIN:Bang('!UpdateMeter', 'TopText1')
        SKIN:Bang('!UpdateMeter', 'BottomText1')
        SKIN:Bang('!Redraw')
        SKIN:Bang('[!Delay 20][!UpdateMeasure '..SELF:GetName()..']')
    end
end