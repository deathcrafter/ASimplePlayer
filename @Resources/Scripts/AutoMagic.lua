function Initialize()
    dofile(SKIN:GetVariable('@')..[[Scripts\Functions.lua]])
end

playerTable={'AIMP', 'Winamp', 'CAD', 'iTunes', 'WLM', 'WMP'}
tries=0

function Update()
    if Get.Value('State0', 0)==1 then
        if Get.NumberVariable('LastPlugin')~=0 then
            SKIN:Bang('!WriteKeyValue', 'Variables', 'LastPlugin', '0')
        end
        SKIN:Bang('!SetVariable', 'LastPlugin', 0)
        SKIN:Bang('!UpdateMeterGroup', 'SongInfo')
        tries=0
        return
    end
    if Get.Value('State1', 1)==1 then
        if Get.NumberVariable('LastPlugin')~=1 then
            SKIN:Bang('!WriteKeyValue', 'Variables', 'LastPlugin', '1')
        end
        SKIN:Bang('!SetVariable', 'LastPlugin', 1)
        SKIN:Bang('!UpdateMeterGroup', 'SongInfo')
        tries=0
        return
    end
    if tries<=5 then
        if CheckPlayers() then
            return 0
        end
        tries=tries+1
        return
    end
end

function CheckPlayers()
    for i=1, #playerTable do
        SKIN:Bang('!SetOption', 'State0', 'PlayerName', playerTable[i])
        SKIN:Bang('!UpdateMeasure', 'State0')
        if Get.Value('State0', 0)==1 then
            tries=0
            return true
        end
    end
end

function Animation(n)
    if Get.Variable('Animation') == '1' then
        return n+2
    else
        return n
    end
end