-- Max Hub Loading 😈
-- Ant-Afk ❄️
    game:GetService("Players").LocalPlayer.Idled:connect(function()
     	game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
		wait(1)
		game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
	end)
 print("Ant-Afk")
-- Copy Discord ⛩️
setclipboard("https://discord.gg/espVN5ym")
-- List Of Games Script 👾
local MenuUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/ZoiIntra/SetUIY/main/One.lua"))()
MenuUI:WindowCreate("Max Sea","rbxassetid://12158615170","discord.gg/espVN5ym")
MenuUI:ButtonAdd("Blox Fruits Hub✅",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MaxHub778/MaxHub2/refs/heads/main/MaxHubMeme"))()
    MenuUI:WindowDelete()
end)
MenuUI:ButtonAdd("Blox Fruits Kaitun❌",function()
    
    MenuUI:WindowDelete()
end)
--open source niggas
