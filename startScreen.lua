require "openCFunctions"
require "GUI"

running = true
term.setCursorBlink(false)
width, height = gpu.maxResolution()
gpu.setResolution(width, height)

drawStartScreen()

--Events
while running do
    local _, _, x, y = event.pull("touch")
    if x >= (width / 2) - 11 and x <= (width / 2) + 15 and y == (height / 2) + 5 then
        os.sleep(0.5)
        os.execute(".loginScreen")
        break
    elseif x >= (width / 2) - 11 and x <= (width / 2) + 15 and y == (height / 2) + 8 then
        os.sleep(0.5)
        os.execute(".registerScreen")
        break
    else
        os.sleep(0.01)
    end
end