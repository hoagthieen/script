repeat task.wait() until game:IsLoaded() and game.Players.LocalPlayer

local PlaceId = game.PlaceId
local HttpService = game:GetService("HttpService")

local GameScripts = {
    [2753915549] = "https://raw.githubusercontent.com/hoagthieen/script/refs/heads/main/Dolce-Hub/Bloxfruits.lua",
    [4442272183] = "https://raw.githubusercontent.com/hoagthieen/script/refs/heads/main/Dolce-Hub/Bloxfruits.lua",
    [7449423635] = "https://raw.githubusercontent.com/hoagthieen/script/refs/heads/main/Dolce-Hub/Bloxfruits.lua",
    ["Universal"] = "https://raw.githubusercontent.com/thieengw9990/Astra-Hub/refs/heads/main/GameHub/unknown-game"
}

local scriptUrl = GameScripts[PlaceId] or GameScripts["Universal"]

print("[Dolce Hub] Router active. Detected PlaceId: " .. tostring(PlaceId))
print("[Dolce hub] Routing to branch...")

local success, err = pcall(function()
    loadstring(game:HttpGet(scriptUrl))()
end)

if not success then
    warn("[Dolce Hub] Failed to load game branch: " .. tostring(err))
    
    if scriptUrl ~= GameScripts["Universal"] then
        loadstring(game:HttpGet(GameScripts["Universal"]))()
    end
end
