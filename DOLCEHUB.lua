local HttpService = game:GetService("HttpService")

-- Lấy UniverseID
local UniverseID
local success, result = pcall(function()
    return HttpService:JSONDecode(game:HttpGet("https://apis.roblox.com/universes/v1/places/"..game.PlaceId.."/universe")).universeId
end)
if success then
    UniverseID = result
end

local placeId = game.PlaceId

-- Hàm load script cho gọn
local function load(url)
    loadstring(game:HttpGet(url))()
end

-- Bee Swarm Simulator
if placeId == 1537690962 or placeId == 4079902982 then
    if getgenv().betabss then
        load("https://raw.githubusercontent.com/hlamx/huhu/master/bssrewrite-obfuscated.lua")
    else
        load("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BSS-BananaCat.lua")
    end

-- Sea Piece
elseif placeId == 10260193230 then 
    load("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/Seahuhu-BananaCat.lua")

-- Blox Fruits
elseif placeId == 7449423635 or placeId == 2753915549 or placeId == 4442272183 or placeId == 122478697296975 or UniverseID == 994732206 then
    load("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BF-BananaCat.lua")

-- King Legacy
elseif placeId == 4520749081 or placeId == 6381829480 or placeId == 15759515082 or placeId == 5931540094 then 
    repeat task.wait() until game.Players.LocalPlayer and game.Players.LocalPlayer:FindFirstChild("DataLoaded") and game.Players.LocalPlayer:FindFirstChild("DataLoaded").Value
    load("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/KL-BananaCat.lua")

-- Pets Go
elseif placeId == 18901165922 or placeId == 19006211286 then 
    load("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/refs/heads/main/PetsGo.lua")

-- Fisch
elseif placeId == 16732694052 then 
    load("https://raw.githubusercontent.com/AhmadV99/Banana-Cat-Hub/main/Fisch.lua")

-- Các game theo UniverseID
elseif UniverseID == 5844593548 then 
    load("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/AnimeReborn.lua")
elseif UniverseID == 6325068386 then
    load("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/refs/heads/main/Bluelock.lua")
elseif UniverseID == 7074860883 then 
    load("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/Arise.lua")
elseif UniverseID == 7018190066 then 
    load("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/refs/heads/main/Bananacat-Deadrails.lua")
elseif UniverseID == 7436755782 then 
    load("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/refs/heads/main/GrowAGraden.lua")
elseif UniverseID == 7709344486 then 
    load("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/refs/heads/main/BananaCat-Brainrot.lua")
elseif UniverseID == 7671049560 then
    load("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/refs/heads/main/theforge.lua")
elseif UniverseID == 9186719164 then
    load("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/refs/heads/main/SailorPiece.lua")
elseif UniverseID == 4658598196 then 
    load("https://raw.githubusercontent.com/TannyIsDeveloper/LittleTemplate/main/Banana-AOTR.lua")
elseif UniverseID == 10200395747 then
    load("https://raw.githubusercontent.com/tmuseAI/bnnc/refs/heads/main/gag2main.lua")

-- Game mặc định
else
    load("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/AV-BananaCat.lua")
end
