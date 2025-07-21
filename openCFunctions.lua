require "APIs"
require "components"

--functions
function splitString(inputStr, sep)
    if sep == nil then
            sep = "%s"
    end
    local i = 1
    local t={}
    for str in string.gmatch(inputStr, "([^"..sep.."]+)") do
            table.insert(t, i, str)
            i = i + 1
    end
    return t
end

function printCentered(str, w, h)
    local str = tostring(str)
    local width, height = gpu.getResolution()
    term.setCursor((width + w - string.len(str)) / 2, (height - h) / 2)
    term.write(str)
end

function printWidthCentered(str, h)
    local width, height = gpu.getResolution()
    local str = tostring(str)
    term.setCursor((width - string.len(str)) / 2, h)
    term.write(str)
end

function slowPrint(str, time)
    local str = tostring(str)
    local length = string.len(str)
    for i=0, length do
        term.write(string.sub(str, i, i))
        os.sleep(time)
    end
end

function getScreenTier()
    local width, height = gpu.maxResolution()
    if width == 160 and height == 50 then
        screenTier = 3
    elseif width == 80 and height == 25 then
        screenTier = 2
    elseif width == 50 and height == 16 then
        screenTier = 1
    end
    return screenTier
end
