require "openCFunctions"
require "GUI"

running = true
term.setCursorBlink(true)
width, height = gpu.maxResolution()
gpu.setResolution(width, height)

drawLoginScreen()

while running do
    term.setCursor((width / 2) - 1, (height / 2) + 5)
    local enteredUsername = term.read()
    term.setCursor((width / 2) - 1, (height / 2) + 8)
    local enteredPassword = term.read(nil, nil, nil, "*")

    users = io.open(".users", "r")
        username = users:read("*a")
    users:close()
    passwords = io.open(".passwords", "r")
        password = passwords:read("*a")
    passwords:close()
    registrations = io.open(".registrations", "r")
        registratedUsers = registrations:read("*a")
    registrations:close() 

    registratedUsers = tonumber(registratedUsers)
    username = splitString(username, " ")
    password = splitString(password, " ")

    for i = 1, registratedUsers do    --Array indexing starts at 1 in LUA
        if enteredUsername == username[i] and enteredPassword == password[i] then
            printWidthCentered("Logging in", (height / 2) + 10)
            slowPrint("...", 1)
            shell.execute(".desktop")
            break
        elseif i == registratedUsers and enteredUsername ~= username[i] and enteredPassword ~= password[i] then
            local x = gpu.getForeground()
            gpu.setForeground(red)
            printWidthCentered("Password or Username incorrect", (height / 2) + 10)
            os.sleep(2)
            gpu.setForeground(x)
            drawLoginScreen()
        end
    end
end