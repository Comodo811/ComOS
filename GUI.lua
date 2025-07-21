require "openCFunctions"
-- T3: 160 x 50; T2: 80 x 25; T1: 50 x 16

--Colors
white       = 0xFFFFFF
black       = 0x000000
gray        = 0x4B4B4B
lightGray   = 0x878787
lighterGray = 0xA5A5A5
darkGray    = 0x2D2D2D
green       = 0x009200
cactusGreen = 0x004900
red         = 0xFF0000

width, height = gpu.maxResolution()
gpu.setResolution(width, height)

function drawLogoT3()
    local x = gpu.getBackground()
    --Kopf und Körper
    gpu.setBackground(green)
    gpu.fill((width / 2) - 5, 4, 10, 6, " ")
    gpu.fill((width / 2) - 3, 10, 6, 1, " ")
    gpu.fill((width / 2) - 5, 11, 10, 9, " ")
    -- Obere Beine
    gpu.fill((width / 2) - 7, 13, 2, 2, " ")
    gpu.fill((width / 2) - 9, 11, 2, 2, " ")
    gpu.fill((width / 2) + 5, 13, 2, 2, " ")
    gpu.fill((width / 2) + 7, 11, 2, 2, " ")
    --Untere Beine
    gpu.fill((width / 2) - 7, 18, 2, 2, " ")
    gpu.fill((width / 2) - 9, 16, 2, 2, " ")
    gpu.fill((width / 2) + 5, 18, 2, 2, " ")
    gpu.fill((width / 2) + 7, 16, 2, 2, " ")
    --Schwanz
    gpu.fill((width / 2) - 1, 20, 2, 2, " ")
    gpu.fill((width / 2) - 3, 22, 4, 2, " ")
    gpu.fill((width / 2) - 5, 24, 4, 2, " ")
    --Augen
    gpu.setBackground(red)
    gpu.set((width / 2) - 3, 5, " ")
    gpu.set((width / 2) + 2, 5, " ")

    gpu.setBackground(x)
end

function drawLogoT2()
    local x = gpu.getBackground()
    --Kopf und Körper
    gpu.setBackground(green)
    gpu.fill((width / 2) - 5, 4, 10, 6, " ")
    gpu.fill((width / 2) - 3, 10, 6, 1, " ")
    gpu.fill((width / 2) - 5, 11, 10, 9, " ")
    -- Obere Beine
    gpu.fill((width / 2) - 7, 13, 2, 2, " ")
    gpu.fill((width / 2) - 9, 11, 2, 2, " ")
    gpu.fill((width / 2) + 5, 13, 2, 2, " ")
    gpu.fill((width / 2) + 7, 11, 2, 2, " ")
    --Untere Beine
    gpu.fill((width / 2) - 7, 18, 2, 2, " ")
    gpu.fill((width / 2) - 9, 16, 2, 2, " ")
    gpu.fill((width / 2) + 5, 18, 2, 2, " ")
    gpu.fill((width / 2) + 7, 16, 2, 2, " ")
    --Schwanz
    gpu.fill((width / 2) - 1, 20, 2, 2, " ")
    gpu.fill((width / 2) - 3, 22, 4, 2, " ")
    gpu.fill((width / 2) - 5, 24, 4, 2, " ")
    --Augen
    gpu.setBackground(red)
    gpu.set((width / 2) - 3, 5, " ")
    gpu.set((width / 2) + 2, 5, " ")

    gpu.setBackground(x)
end

function drawLogoT1()
    local x = gpu.getBackground()
    --Kopf und Körper
    gpu.setBackground(green)
    gpu.fill((width / 2) - 2, 2, 5, 3, " ")
    gpu.fill((width / 2) - 5, 5, 1, 1, " ")
    gpu.fill((width / 2) - 5, 6, 5, 4, " ")
    -- Obere Beine
    gpu.set((width / 2) - 1, 7, " ")
    gpu.set((width / 2) + 2, 7, " ")
    --Untere Beine
    gpu.set((width / 2) - 1, 9, " ")
    gpu.set((width / 2) + 2, 9, " ")
    --Schwanz
    gpu.set((width / 2), 10, " ")
    gpu.set((width / 2) - 1, 11, " ")
    gpu.set((width / 2) - 2, 12, " ")
    --Augen
    gpu.setBackground(red)
    gpu.set((width / 2) - 1, 3, " ")
    gpu.set((width / 2) + 1, 3, " ")

    gpu.setBackground(x)
end

function drawBootScreen()
    getScreenTier()
    if screenTier == 3 then
        gpu.setBackground(white)
        gpu.setForeground(black)
        gpu.fill(1, 1, width, height, " ")
        gpu.setBackground(gray)
        gpu.fill((width / 2) - 25, 37, 50, 1, " ")
        gpu.set((width / 2) - 25, 38, " ")
        gpu.set((width / 2) + 24, 38, " ")
        gpu.fill((width / 2) - 25, 39, 50, 1, " ")

        drawLogoT3()

        gpu.setBackground(lightGray)
        for i=(width / 2) - 24, (width / 2) + 23 do
            gpu.set(i, 38, " ")
            os.sleep(0.05)
        end

    elseif screenTier == 2 then

        drawLogoT2()
    else 
        gpu.setBackground(white)
        gpu.setForeground(black)
        gpu.fill(1, 1, width, height, " ")
        gpu.setBackground(gray)
        gpu.fill((width / 2) - 7, 10, 12, 1, " ")
        gpu.set((width / 2) - 7, 11, " ")
        gpu.set((width / 2) + 9, 11, " ")
        gpu.fill((width / 2) - 15, 12, 12, 1, " ")

        drawLogoT1()

        gpu.setBackground(lightGray)
        for i=(width / 2) - 7, (width / 2) + 4 do
            gpu.set(i, 11, " ")
            os.sleep(0.2)
        end
    end
end

function drawStartScreen()
    getScreenTier()
    if screenTier == 3 then

        gpu.setBackground(white)
        gpu.fill(1, 1, width, height, " ")

        drawLogoT3()

        gpu.setBackground(lightGray)
        gpu.set((width / 2) - 11, (height / 2) + 5, "         Login          ")
        gpu.set((width / 2) - 11, (height / 2) + 8, "        Register        ")

    elseif screenTier == 2 then

        drawLogoT2()
    else

        drawLogoT1()
    end
end

function drawLoginScreen()
    getScreenTier()
    if screenTier == 3 then

        gpu.setBackground(white)
        gpu.fill(1, 1, width, height, " ")

        drawLogoT3()

        gpu.setBackground(lightGray)
        gpu.set((width / 2) - 11, (height / 2) + 5, "Username:           ")
        gpu.set((width / 2) - 11, (height / 2) + 8, "Password:           ")

    elseif screenTier == 2 then

        drawLogoT2()
    else

        drawLogoT1()
    end
end

function drawRegisterScreen()
    getScreenTier()
    if screenTier == 3 then

        gpu.setBackground(white)
        gpu.fill(1, 1, width, height, " ")

        drawLogoT3()

        gpu.setBackground(lighterGray)
        gpu.set((width / 2) - 15, (height / 2) + 5,  "Username       :           ")
        gpu.set((width / 2) - 15, (height / 2) + 8,  "Password       :           ")
        gpu.set((width / 2) - 15, (height / 2) + 11, "Repeat Password:           ")

    elseif screenTier == 2 then

        drawLogoT2()
    else

        drawLogoT1()
    end
end

function drawTaskbar()
    local x = gpu.getBackground()
    gpu.setBackground(cactusGreen)
    gpu.fill(0, height - 1, width, 2, " ")
    gpu.setBackground(x)
end