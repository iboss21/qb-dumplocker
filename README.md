# qb-dumplocker
 Locks The Server and files from the little nasty cheaters

his version of qb-dumplocker is designed with advanced security measures and is not a simple drag-and-drop resource. It provides enhanced protection for your server files while allowing customization through the config.lua file, including admin options

 Step 1: Update config.lua
1.1 Open the config.lua file inside the qb-dumplocker folder.

1.2 Add a new configuration variable to control whether admins have access to the resource:

lua
Copy code
Config = {}

-- Add any configuration variables here
Config.EnableAntiDump = true
Config.RestrictAdmins = true -- Set this to true to restrict admins from the resource
Step 2: Update server.lua
2.1 Open the server.lua file inside the qb-dumplocker/server folder.

2.2 Modify the RegisterServerEvent block to check whether admin restriction is enabled:

lua
Copy code
RegisterServerEvent("loadRes-" .. resName)
AddEventHandler("loadRes-" .. resName, function()
    local src = source
    local stringScr = tostring(src)

    -- Check if admin restriction is enabled and the player is an admin
    if Config.RestrictAdmins and IsPlayerAdmin(src) then
        print("Admin detected. Action restricted.")
        return
    end

    -- Rest of the existing code...
    -- ...
end)
Step 3: Add the IsPlayerAdmin Function
3.1 Add a function to check if a player is an admin. You can create this function at the bottom of the server.lua file:

lua
Copy code
-- Check if the player is an admin
function IsPlayerAdmin(playerId)
    local identifier = GetPlayerIdentifier(playerId, 0) -- Assuming 0 is the Rockstar license identifier

    -- Add the identifiers of your admins
    local adminIdentifiers = {
        "license:admin1",
        "license:admin2",
        -- Add more admin identifiers as needed
    }

    for _, adminIdentifier in pairs(adminIdentifiers) do
        if identifier == adminIdentifier then
            return true
        end
    end

    return false
end
Step 4: Update Resource Initialization
4.1 Open the fxmanifest.lua file inside the qb-dumplocker folder.

4.2 Modify the client_script line to include the config.lua file:

lua
Copy code
fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'Your Name'
description 'Dumplocker resource for QBCore'
version '1.0.0'

client_script 'config.lua'
client_script 'client/client.lua'
server_script 'server/server.lua'
shared_script 'config.lua'
Step 5: Usage
5.1 In your server.cfg, configure the identifiers of your admins:

lua
Copy code
# Players
add_principal identifier.license:admin1 qb-dumplocker.god # Admin 1
add_principal identifier.license:admin2 qb-dumplocker.god # Admin 2
Step 6: Additional Notes
6.1 Make sure to replace "admin1" and "admin2" with the actual license identifiers of your admins.

6.2 Adjust the condition in IsPlayerAdmin based on the identifier type you are using (e.g., license:, discord:).

6.3 This setup assumes that you have a predefined list of admin identifiers. Ensure that you keep this list updated.

By following these steps, you can control whether admins have access to the qb-dumplocker resource based on the configuration in config.lua. Adjust the identifiers and conditions as needed for your server setup.
