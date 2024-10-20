-- sh_customcommands.lua

local KEYCARD_CLEARANCE = {}
KEYCARD_CLEARANCE.name = "setcl" -- The name of the command (used when typing in chat or console).
KEYCARD_CLEARANCE.description = "Set a player’s clearance level." -- A description of the command.
KEYCARD_CLEARANCE.adminOnly = true -- Only admins can use this command (set to false if anyone can use it).
COMMAND.arguments = {nut.type.player, nut.type.string}

local keycardLevels = {
    "guthscp_keycard_lvl_1",
    "guthscp_keycard_lvl_2",
    "guthscp_keycard_lvl_3",
    "guthscp_keycard_lvl_4"
}

-- This function gets called when the command is executed.
function COMMAND:OnRun(client, arguments)
    local maxLvl = 4
    local plr = arguments[1] 
    local level = math.Clamp(tostring(arguments[2]),1,maxLvl)

    client:ChatPrint("Set Clearance level!")
    client:ChatPrint("Updated Keycard SWEP!")

    --find
    local inventory = plr:getChar():getInv()
    local hasKeycard = false

    for _, item in pairs(inventory:getItems()) do
        if table.HasValue(keycardLevels, item.uniqueID) then
            inventory:removeItem(item.id, true) 
        end
    end

    plr:Give("guthscp_keycard_lvl_"..level)

end

-- Register the command with NutScript
nut.command.add(KEYCARD_CLEARANCE.name, KEYCARD_CLEARANCE)
