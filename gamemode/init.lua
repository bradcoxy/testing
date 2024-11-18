AddCSLuaFile("cl_init.lua")
DeriveGamemode("nutscript")


function PlayerInit(client)
    
    local char = client:getChar()
    
    local attribs = char:getAttribs()
    
    local strength = attribs.str or char:getAttribs("Strength") or 0 
    local endurance = attribs["end"] or char:getAttribs("Endurance") or 0 
    local stamina = attribs.stm or char:getAttribs("Stamina") 

    print(strength)
    local defaultHealth = 100
    local defaultSpeed = 130

    local newHealth = defaultHealth + strength*1.25
    local newSpeed = defaultSpeed + stamina*1.25

    client:SetMaxHealth(newHealth)
    client:SetMaxSpeed(newSpeed)
    
end


function GM:PlayerLoadedChar(client, character, lastChar)
    PlayerInit(client)
end


--[[
for i,v in pairs(player.GetAll()) do

    PlayerInit(v)

    for _,attr in pairs(nut.attribs.list) do
        --print(i,v)
        PrintTable(attr)
        print("--")
        print(v:GetPos())
        v:Give("weapon_pistol")
        v:SetAmmo(500, "Pistol") 
        
local zombie = ents.Create("npc_fastzombie")
print("zombie..")
-- Check if the entity was successfully created
if (IsValid(zombie)) then
    print("woww!")
    print(zombie)
    -- Set the position of the zombie
    zombie:SetPos(Vector(838.665283, 638.338867, -12287.968750))
    
    -- Spawn the zombie into the world
    zombie:Spawn()
end
        end
end
]]

-- Loop through all entities of a specific class (e.g., doors)
for _, ent in pairs(ents.GetAll()) do
    --print(ent:GetClass())
    -- Check if the entity is a door (using its class)
    if ent:GetClass() == "prop_door_rotating" then
        -- Perform some action on the door
        print("Found a Door!", ent:GetClass(), ent:GetPos())
        
        -- Example: You can manipulate the door here
        -- ent:SetColor(Color(255, 0, 0)) -- Change color to red, for example
    end
end
