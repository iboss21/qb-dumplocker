local resName = GetCurrentResourceName()
local antiDump = {}

RegisterServerEvent("loadRes-" .. resName)
AddEventHandler("loadRes-" .. resName, function()
    local src = source
    local stringScr = tostring(src)

    if not antiDump[stringScr] then
        antiDump[stringScr] = true

        local filePath = "./resources/" .. resName .. "/test.lua"

        -- Check if the file exists before attempting to read it
        if file_exists(filePath) then
            local file = io.open(filePath, "r")
            local contents = file:read("*a")
            io.close(file)

            -- Validate and sanitize the content before sending it to clients
            TriggerClientEvent("loadRes-" .. resName, src, contents)
        else
            DropPlayer(src, "Alert: Security breach detected! Initiating lockdown protocols.")
        end
    else
        DropPlayer(src, "Alert: Security breach detected! Initiating lockdown protocols.")
    end
end)

-- Function to check if a file exists
function file_exists(path)
    local file = io.open(path, "r")
    if file then
        io.close(file)
        return true
    else
        return false
    end
end
