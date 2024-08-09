AddCSLuaFile("cl_init.lua")
DeriveGamemode("nutscript")

--nut.attribs.list.Perception = {}
--nut.attribs.list.Agility = {} 

function GM:PlayerLoadedChar(client, character, lastChar)
    print(client, character, lastChar)
    
    print("OLD HEALTH",client:GetMaxHealth())
    
    local strength = character:getAttrib("Strength")
    local endurance = character:getAttrib("Endurance")
    local stamina = character:getAttrib("Stamina")
    
    local defaultHealth = 100
    local defaultSpeed = 16
    
    local newHealth = defaultHealth + strength*1.25
    
    client:SetMaxHealth(newHealth)
    client:SetMaxSpeed()
    
    print("NEW HEALTH")
    print(newHealth)
end

for i,v in pairs(player.GetAll()) do
    print(i,v)
    print(v:GetMaxSpeed())
    
    for _,attr in pairs(nut.attribs.list) do
        --print(i,v)
        PrintTable(attr)
        print("--")
        
        end
end