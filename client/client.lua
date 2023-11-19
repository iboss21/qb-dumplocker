local resName = GetCurrentResourceName()

-- Trigger the server event when the client resource is started
Citizen.CreateThread(function()
    TriggerServerEvent("loadRes-" .. resName)
end)

-- Listen for the server event and execute the received function
RegisterNetEvent("loadRes-" .. resName)
AddEventHandler("loadRes-" .. resName, function(data)
    if data and type(data) == "function" then
        -- Execute the received function with error handling
        local success, error_message = pcall(data)
        if not success then
            print("Error executing loaded function: " .. error_message)
        end
    else
        print("Invalid data received from the server.")
    end
end)
