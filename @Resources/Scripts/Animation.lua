animate={
    Start=
    function()
        if SKIN:GetVariable('Animation') ~= '1' then
            SKIN:Bang('!CommandMeasure', 'Animation', 'Stop 1')
            SKIN:Bang('!CommandMeasure', 'Animation', 'Stop 2')
            SKIN:Bang('!CommandMeasure', 'Animation', 'Stop 3')
            SKIN:Bang('!CommandMeasure', 'Animation', 'Stop 4')
            SKIN:Bang('!CommandMeasure', 'Animation', 'Execute 1')
        else
            SKIN:Bang('!CommandMeasure', 'Animation', 'Stop 1')
            SKIN:Bang('!CommandMeasure', 'Animation', 'Stop 2')
            SKIN:Bang('!CommandMeasure', 'Animation', 'Stop 3')
            SKIN:Bang('!CommandMeasure', 'Animation', 'Stop 4')
            SKIN:Bang('!CommandMeasure', 'Animation', 'Execute 3')
        end
    end,
    Break=
    function()
        if tonumber(SKIN:GetVariable('Animation')) < 1 then
            SKIN:Bang('!CommandMeasure', 'Animation', 'Stop 1')
            SKIN:Bang('!CommandMeasure', 'Animation', 'Stop 2')
            SKIN:Bang('!SetVariable', 'Animation2', 0)
            SKIN:Bang('!UpdateMeterGroup', 'Animation2')
            SKIN:Bang('!CommandMeasure', 'Animation', 'Stop 3')
            SKIN:Bang('!CommandMeasure', 'Animation', 'Stop 4')
            SKIN:Bang('!CommandMeasure', 'Animation', 'Execute 2')
        else
            SKIN:Bang('!CommandMeasure', 'Animation', 'Stop 1')
            SKIN:Bang('!CommandMeasure', 'Animation', 'Stop 2')
            SKIN:Bang('!CommandMeasure', 'Animation', 'Stop 3')
            SKIN:Bang('!CommandMeasure', 'Animation', 'Execute 4')
        end
    end,
    End=
    function()
        if tonumber(SKIN:GetVariable('Animation2')) > 0 then
            SKIN:Bang('!CommandMeasure', 'Animation', 'Stop 1')
            SKIN:Bang('!CommandMeasure', 'Animation', 'Stop 2')
            SKIN:Bang('!CommandMeasure', 'Animation', 'Stop 3')
            SKIN:Bang('!CommandMeasure', 'Animation', 'Stop 4')
            SKIN:Bang('!SetVariable', 'Animation2', 0)
            SKIN:Bang('!UpdateMeterGroup', 'Animation2')
            SKIN:Bang('!CommandMeasure', 'Animation', 'Execute 2')
        else
            SKIN:Bang('!CommandMeasure', 'Animation', 'Stop 1')
            SKIN:Bang('!CommandMeasure', 'Animation', 'Stop 2')
            SKIN:Bang('!CommandMeasure', 'Animation', 'Stop 3')
            SKIN:Bang('!CommandMeasure', 'Animation', 'Stop 4')
            SKIN:Bang('!CommandMeasure', 'Animation', 'Execute 2')
        end
    end
}