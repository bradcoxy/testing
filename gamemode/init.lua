AddCSLuaFile("cl_init.lua")
DeriveGamemode("nutscript")


function PlayerInit(client)
    
    local char = client:getChar()
    
    local attribs = char:getAttribs()
    
    local strength = attribs.str or char:getAttribs("Strength")
    local endurance = attribs["end"] or char:getAttribs("Endurance")
    local stamina = attribs.stm or char:getAttribs("Stamina")
    
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
