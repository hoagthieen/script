repeat task.wait() until game:IsLoaded() and game.Players.LocalPlayer

local PlaceId = game.PlaceId
local HttpService = game:GetService("HttpService")

local GameScripts = {
    [2753915549] = "https://raw.githubusercontent.com/hoagthieen/script/refs/heads/main/Veltrix-bloxfruits.lua",
    [4442272183] = "https://raw.githubusercontent.com/hoagthieen/script/refs/heads/main/Veltrix-bloxfruits.lua",
    [7449423635] = "https://raw.githubusercontent.com/hoagthieen/script/refs/heads/main/Veltrix-bloxfruits.lua",
    ["Universal"] = "https://raw.githubusercontent.com/hoagthieen/script/refs/heads/main/Unknow-game.lua"
}

local scriptUrl = GameScripts[PlaceId] or GameScripts["Universal"]

print("[Veltrix X HUB] Router active. Detected PlaceId: " .. tostring(PlaceId))
print("[Veltrix X HUB] Routing to branch...")

local success, err = pcall(function()
    loadstring(game:HttpGet(scriptUrl))()
end)

if not success then
    warn("[VELTRIX X HUB] Failed to load game branch: " .. tostring(err))
    
    if scriptUrl ~= GameScripts["Universal"] then
        loadstring(game:HttpGet(GameScripts["Universal"]))()
    end
end
