local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
local mainFrame = Instance.new("Frame")
local coletarButton = Instance.new("TextButton")
local farmarButton = Instance.new("TextButton")

-- Configurações do ScreenGui
screenGui.Name = "BloxFruitsMenu"
screenGui.Parent = player.PlayerGui

-- Configurações do Frame
mainFrame.Size = UDim2.new(0.3, 0, 0.5, 0)
mainFrame.Position = UDim2.new(0.35, 0, 0.25, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.Parent = screenGui

-- Configurações do botão de coletar frutas
coletarButton.Size = UDim2.new(0.8, 0, 0.2, 0)
coletarButton.Position = UDim2.new(0.1, 0, 0.1, 0)
coletarButton.Text = "Coletar Frutas"
coletarButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
coletarButton.Parent = mainFrame

-- Configurações do botão de farmar XP
farmarButton.Size = UDim2.new(0.8, 0, 0.2, 0)
farmarButton.Position = UDim2.new(0.1, 0, 0.4, 0)
farmarButton.Text = "Farmar XP"
farmarButton.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
farmarButton.Parent = mainFrame

-- Função para coletar frutas
local function coletarFrutas()
    for _, fruta in pairs(workspace:GetChildren()) do
        if fruta:IsA("Fruit") then
            fruta:PickUp()  -- Coleta a fruta
            wait(1)  -- Espera um segundo entre as coletas
        end
    end
end
