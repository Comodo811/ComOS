require "openCFunctions"
require "GUI"
require "Threads"

running = true
clockEnabled = true

if clockEnabled == true then
    clock:resume()
end

while running == true do
    gpu.setBackground(white)
    gpu.setForeground(black)
    gpu.fill(1, 1, width, height, " ")
    drawLogoT3()
    drawTaskbar()
    --if clockEnabled == true then
    --    clock:resume()
    --end

end
