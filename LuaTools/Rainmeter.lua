Get = {
    Variable=function(name, defValue) -- string, string | string
        return SKIN:GetVariable(name) or defValue or ''
    end,

    NumberVariable=function(name, defValue) -- string, number | number
        return tonumber(SKIN:GetVariable(name)) or defValue or 0
    end,

    Option=function(name, option, defValue) -- string, string, string | string
        local section=SKIN:GetMeasure(name) or SKIN:GetMeter(name)

        if not section then 
            Log(string.format("Section %s doesn't exist", name), 4)
        end

        return section:GetOption(option) or defValue or ''
    end,

    NumberOption=function(name, option, defValue) -- string, string, number | number
        local section=SKIN:GetMeasure(name) or SKIN:GetMeter(name)

        if not section then 
            Log(string.format("Section %s doesn't exist", name), 4)
        end

        return tonumber(section:GetOption(option)) or defValue or 0
    end,

    Value=function(name, defValue) -- string, number | number
        return tonumber(SKIN:GetMeasure(name):GetValue()) or defValue or 0
    end,

    StringValue=function(name, defValue) -- string, string | string
        return SKIN:GetMeasure(name):GetStringValue() or defValue or ''
    end,

    Dimensions=function(name, defValues) -- string, table | table
        local meter=SKIN:GetMeter('name')
        if meter then
            return {
                X=meter:GetX(),
                Y=meter:GetY(),
                W=meter:GetW(),
                H=meter:GetH()
            }
        else
            if type(defValues)=='table' then
                return defValues
            else
                Log(SELF:GetName()..'(Get.Dimensions): Meter "'..meter..'" doesn\'t exist. Default value 0 returned for all dimensions.', 4)
                return {X=0, Y=0, W=0, H=0}
            end
        end
    end
}

function Log(string, level)
    if type(string)~='string' then
        SKIN:Bang('!Log', string.format('function Log(string): String expected, got %s', type(string)), 'Error')
        return
    end

    if type(level)=='number' then
        local t={'debug', 'notice', 'warning', 'error'}
        level=level<=4 and t[level] or 'notice'
    elseif type(level)~='string' then
        level='notice'
    else
        level=level:upper()
    end

    SKIN:Bang('!Log', string, level)
end

---------------------------------
-- String functions
---------------------------------

function string.split(inString, inPattern)

	local outTable = {}
	local findPattern = '(.-)' .. inPattern
	local lastEnd = 1

	local currentStart, currentEnd, foundString = inString:find(findPattern, 1)

	while currentStart do
		if currentStart ~= 1 or foundString ~= '' then
			table.insert(outTable, foundString)
		end
		lastEnd = currentEnd + 1
		currentStart, currentEnd, foundString = inString:find(findPattern, lastEnd)
	end

	if lastEnd <= #inString then
		foundString = inString:sub(lastEnd)
		table.insert(outTable, foundString)
	end

	return outTable
end

function TruncWhiteSpace(string)
    return string:gsub('^%s*(.-)%s*$', '%1')
end

---------------------------------
-- Math functions
---------------------------------

function math.round(num, idp)
	assert(tonumber(num), 'Round expects a number.')
	local mult = 10 ^ (idp or 0)
    local n
	if num >= 0 then
		n=math.floor(num * mult + 0.5) / mult
	else
		n=math.ceil(num * mult - 0.5) / mult
	end
    n=tostring(n)
    local m
    if n:find('%.') then
        m=n:gsub('^%d+%.(%d+)$', '%1')
    end

    m=m and #m or 0
    idp=idp or 0

    if idp > 0 and m < idp then
        if m==0 then 
            n=n..'.0'
            for i=2,idp-m do n=n..0 end
        else
            for i=1,idp-m do n=n..0 end
        end
    end
    return n
end

---------------------------------
-- Color functions
---------------------------------

function HSVtoRGB(h, s, v, a)
    local r,g,b

    local c=v*s
    local h1=h/60
    local x=c*(1-((h1%2-1)>0 and (h1%2-1) or -(h1%2-1)))

    if 0<=h1 and h1<=1 then
        r,g,b = c,x,0
    elseif 1<h1 and h1<=2 then
        r,g,b = x,c,0
    elseif 2<h1 and h1<=3 then
        r,g,b = 0,c,x
    elseif 3<h1 and h1<=4 then
        r,g,b = 0,x,c
    elseif 4<h1 and h1<=5 then
        r,g,b = x,0,c
    else
        r,g,b = c,0,x
    end

    local m=v-c
    
    local rgb={(r+m)*255, (g+m)*255, (b+m)*255, (a)*255}

    return rgb
end

function RGBtoHSV(r, g, b, a)
    a=a or 255
    r, g, b, a = r / 255, g / 255, b / 255, a / 255
    local max, min = math.max(r, g, b), math.min(r, g, b)
    local h, s, v
    v = max
  
    local d = max - min
    if max == 0 then s = 0 else s = d / max end
  
    if max == min then
      h = 0 -- achromatic
    else
      if max == r then
      h = (g - b) / d
      if g < b then h = h + 6 end
      elseif max == g then h = (b - r) / d + 2
      elseif max == b then h = (r - g) / d + 4
      end
      h = h*60
    end
  
    return {h, s, v, a}
end

function HSLtoRGB(h, s, l, a)
    local r, g, b
  
    if s == 0 then
      r, g, b = l, l, l -- achromatic
    else
      function hue2rgb(p, q, t)
        if t < 0   then t = t + 1 end
        if t > 1   then t = t - 1 end
        if t < 1/6 then return p + (q - p) * 6 * t end
        if t < 1/2 then return q end
        if t < 2/3 then return p + (q - p) * (2/3 - t) * 6 end
        return p
      end
  
      local q
      if l < 0.5 then q = l * (1 + s) else q = l + s - l * s end
      local p = 2 * l - q
  
      r = hue2rgb(p, q, h + 1/3)
      g = hue2rgb(p, q, h)
      b = hue2rgb(p, q, h - 1/3)
    end
    a=a or 1
    return {r * 255, g * 255, b * 255, a * 255}
end

function RGBtoHSL(r, g, b, a)
    r, g, b = r / 255, g / 255, b / 255
  
    local max, min = math.max(r, g, b), math.min(r, g, b)
    local h, s, l
  
    l = (max + min) / 2
  
    if max == min then
      h, s = 0, 0 -- achromatic
    else
      local d = max - min
      if l > 0.5 then s = d / (2 - max - min) else s = d / (max + min) end
      if max == r then
        h = (g - b) / d
        if g < b then h = h + 6 end
      elseif max == g then h = (b - r) / d + 2
      elseif max == b then h = (r - g) / d + 4
      end
      h = h / 6
    end
    return {h, s, l, a or 255}
end

function RGBtoHEX(r, g, b, a)
	local hex = {}
    local color={r,g,b,a}
	for _, v in pairs(color)  do
		table.insert(hex, ('%02X'):format(tonumber(v)))
	end
	return hex
end

function HEXtoRGB(color)
    local rgb = {}
	for hex in color:gmatch('..') do
		table.insert(rgb, tonumber(hex, 16))
	end
	return rgb
end

ConvertColor={
    RGB=function(string, outputType)
        local rgb=string.split(string, ',')

        if table.maxn(rgb)==3 then
            table.insert(rgb, 255)
        end

        local t=outputType and outputType:lower() or 'hex'

        if t=='hsv' then
            return table.concat(RGBtoHSV(rgb[1], rgb[2], rgb[3], rgb[4]), ',')
        elseif t=='hsl' then
            return table.concat(RGBtoHSL(rgb[1], rgb[2], rgb[3], rgb[4]), ',')
        else
            return table.concat(RGBtoHEX(rgb[1], rgb[2], rgb[3], rgb[4]))
        end
    end,

    HSV=function(string, outputType)
        local hsv=string.split(string, ',')

        if table.maxn(hsv)==3 then
            table.insert(hsv, 1)
        end
        outpytType=outputType and outputType:lower() or 'rgb'

        local rgb=table.concat(HSVtoRGB(hsv[1], hsv[2], hsv[3], hsv[4]), ',')

        if outputType=='hex' or outputType=='hsl' then
            return ConvertColor.RGB(rgb, outputType)
        else
            return rgb
        end
    end,

    HSL=function(string, outputType)
        local hsl = string.split(string, ',')

        if table.maxn(hsl)==3 then
            table.insert(hsl, 1)
        end
        local t=outputType and outputType:lower() or 'rgb'

        local rgb=table.concat(HSLtoRGB(hsl[1], hsl[2], hsl[3], hsl[4]), ',')
        
        if string.find('hsv|hex', t) then
            return ConvertColor.RGB(rgb, t)
        else
            return rgb
        end
    end,

    HEX=function(string, outputType)
        local t=outputType and outputType:lower() or 'rgb'
        local rgb=table.concat(HEXtoRGB(string), ',')

        if string.find('hsv|hsl', t) then
            return ConvertColor.RGB(rgb, t)
        else
            return rgb
        end
    end
}

---------------------------------
-- Extra functions
---------------------------------

TableContains={
    Key=function(table, key)
        if type(table)~='table' then
            Log(string.format('TableContains: Table expected, got %s.', type(table)), 4)
            return false
        end
        if table[key]~=nil then
            return true
        end
        return false
    end,

    Value=function(table, value)
        if type(table)~='table' then
            Log(string.format('TableContains: Table expected, got %s.', type(table)), 4)
            return
        end
        for k,v in pairs(table) do
            if v==value then
                return true
            end
        end
        return false
    end
}