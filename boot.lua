require "openCFunctions"
require "GUI"

term.setCursorBlink(false)
width, height = gpu.maxResolution()
gpu.setResolution(width, height)

--Tier 2
function drawBootLogoTier2() 
    gpu.setBackground(white)
    gpu.setForeground(black)
    gpu.fill(1, 1, width, height, " ")
    gpu.setBackground(gray)
    gpu.fill((width / 2) - 15, 18, 25, 1, " ")
    gpu.set((width / 2) - 15, 19, " ")
    gpu.set((width / 2) + 9, 19, " ")
    gpu.fill((width / 2) - 15, 20, 25, 1, " ")
end

function drawLoadingBarTier2()
    gpu.setBackground(lightGray)
    for i=(width / 2) - 14, (width / 2) + 8 do
        gpu.set(i, 19, " ")
        os.sleep(0.1)
    end
end

drawBootScreen()
os.sleep(1)
shell.execute(".startScreen")