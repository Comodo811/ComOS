require "openCFunctions"
require "GUI"

running = true
term.setCursorBlink(true)
width, height = gpu.maxResolution()
gpu.setResolution(width, height)

drawRegisterScreen()
maxUsers = 4

while running do
    term.setCursor((width / 2) + 1, (height / 2) + 5)
    enteredUsername = term.read()
    term.setCursor((width / 2) + 1, (height / 2) + 8)
    enteredPassword = term.read(nil, nil, nil, "*")
    term.setCursor((width / 2) + 1, (height / 2) + 11)
    reEnteredPassword = term.read(nil, nil, nil, "*")

    registrations = io.open(".registrations", "r")
        registeredUsers = registrations:read("*a")
    registrations:close()

    registeredUsers = tonumber(registeredUsers)
    usernameLength = string.len(enteredUsername)
    passwordLength = string.len(enteredPassword)
    gpu.setBackground(white)
    gpu.setForeground(black)

    if enteredPassword == reEnteredPassword and registeredUsers <= maxUsers and usernameLength <= 10 and passwordLength <= 10 then
        users = io.open(".users", "a")
            users:write(enteredUsername)
            users:write(" ")
        users:close()
        passwords = io.open(".passwords", "a")
            passwords:write(enteredPassword)
            passwords:write(" ")
        passwords:close()

        term.setCursor((width / 2) - 1, (height / 2) + 14)
        printWidthCentered("Registering", (height / 2) + 14)
        slowPrint("...", 1)
        os.sleep(1)
        term.clearLine()
        printWidthCentered("Done", (height / 2) + 14)
        os.sleep(1)

        registeredUsers = registeredUsers + 1
        registrations = io.open(".registrations", "w")
            registrations:write(registeredUsers)
        registrations:close()

        shell.execute(".startScreen")
        break
        
    elseif reEnteredPassword ~= enteredPassword then
        local x = gpu.getForeground()
        gpu.setForeground(red)
        printWidthCentered("Passwords are not equal", (height / 2) + 14)
        os.sleep(1)
        term.clearLine()
        gpu.setForeground(x)
        drawRegisterScreen()

    elseif usernameLength > 10 or passwordLength > 10 then
        local x = gpu.getForeground()
        gpu.setForeground(red)
        printWidthCentered("Password or username must not be longer than 10 characters", (height / 2) + 14)
        os.sleep(1)
        term.clearLine()
        gpu.setForeground(x) 
        drawRegisterScreen()

    else 
        shell.execute(".startScreen")
        break
    end
end