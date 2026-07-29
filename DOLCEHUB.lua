local placeId = game.PlaceId
local HttpService = game:GetService("HttpService")

local UniverseID
pcall(function()
    UniverseID = HttpService:JSONDecode(game:HttpGet("https://apis.roblox.com/universes/v1/places/"..placeId.."/universe")).universeId
end)

local function run(url)
    loadstring(game:HttpGet(url))()
end

if placeId == 7449423635 or placeId == 2753915549 or placeId == 4442272183 or placeId == 122478697296975 or UniverseID == 994732206 then
    run("https://raw.githubusercontent.com/hoagthieen/script/refs/heads/main/Dolce-Hub/Bloxfruits.lua")
else
    print("No support this game !")
end
