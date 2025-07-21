require "openCFunctions"
require "GUI"

--Clock
enableClock = true
clock = thread.create(function()
    while enableClock == true do
        local timeInfo = stringSplit(os.date(), " ")
        local date = timeInfo[1]
        local time = timeInfo[2]
        gpu.set(width - 10, height - 1, time)
        gpu.set(width - 10, height - 1, date)
    end
end)