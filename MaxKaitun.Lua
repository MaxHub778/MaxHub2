  local Script = function()
_G.Team = Marines -- Marines/Pirates
_G.AutoLevel = true -- true/false
_G.use2x = true -- true/false (2x xp)
_G.buymelee = true -- true/false (buy fighting styles)
_G.StatsKaitun = true -- true/false
_G.BringMob = true
_G.Random_Auto = true -- true/false (fruit farm)
_G.AutoStoreFruit = true -- true/false (store fruits)
_G.sea2quest = true -- true/false (second sea quest)
_G.Attackmode = Normal -- Normal/Fast/SuperFast (fast atack) 
_G.Autosaber = true -- true/false (auto saber quest)
_G.Autosoulguitar = true -- true/false (auto soul guitar quest)
_G.AutoCdk = true -- true/false (auto cdk quest)
_G.Fpsboost = true -- true/false (bost your fps)
_G.Katakurimax = true -- true/false (If level max = farm cake prince)


-- estilos [NAO MUDE NADA (se nao vou comer sua bunda)]
local uiestilo1 = true
local uiestilo2 = true
local uiestilo3 = true
local uiestilo4 = true
local uiestilo5 = true
local uiestilo6 = true
local uiestilo7 = true
local uiestilo8 = true
local uiestilo9 = true

-- kata spawner

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner", "true")

-- rejoin 

function rejoin() -- rejoin 1
    repeat wait() until game.CoreGui:FindFirstChild('RobloxPromptGui')
     
    local lp,po,ts = game:GetService('Players').LocalPlayer,game.CoreGui.RobloxPromptGui.promptOverlay,game:GetService('TeleportService')
     
    po.ChildAdded:connect(function(a)
        if a.Name == 'ErrorPrompt' then
            repeat
                ts:Teleport(game.PlaceId)
                wait(2)
            until false
        end
    end)-- rejoin 1
    
    game:GetService("GuiService").ErrorMessageChanged:Connect(function()  -- rejoin 2 
    wait (0.1) game:GetService("TeleportService"):Teleport(game.PlaceId) 
        end); -- rejoin 2 
end

-- fps

if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Death") then
    game:GetService("ReplicatedStorage").Effect.Container.Death:Destroy()
end
if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Respawn") then
    game:GetService("ReplicatedStorage").Effect.Container.Respawn:Destroy()
end

if _G.Fpsboost then
    local L_341_ = true
    local L_342_ = game
    local L_343_ = L_342_.Workspace
    local L_344_ = L_342_.Lighting
    local L_345_ = L_343_.Terrain
    sethiddenproperty(L_344_, "Technology", 2)
    sethiddenproperty(L_345_, "Decoration", false)
    L_345_.WaterWaveSize = 0
    L_345_.WaterWaveSpeed = 0
    L_345_.WaterReflectance = 0
    L_345_.WaterTransparency = 0
    L_344_.GlobalShadows = false
    L_344_.FogEnd = 9e9
    L_344_.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    for L_346_forvar0, L_347_forvar1 in pairs(L_342_:GetDescendants()) do
        if L_347_forvar1:IsA("Part") or L_347_forvar1:IsA("Union") or L_347_forvar1:IsA("CornerWedgePart") or L_347_forvar1:IsA("TrussPart") then
            L_347_forvar1.Material = "Plastic"
            L_347_forvar1.Reflectance = 0
        elseif L_347_forvar1:IsA("Decal") or L_347_forvar1:IsA("Texture") and L_341_ then
            L_347_forvar1.Transparency = 1
        elseif L_347_forvar1:IsA("ParticleEmitter") or L_347_forvar1:IsA("Trail") then
            L_347_forvar1.Lifetime = NumberRange.new(0)
        elseif L_347_forvar1:IsA("Explosion") then
            L_347_forvar1.BlastPressure = 1
            L_347_forvar1.BlastRadius = 1
        elseif L_347_forvar1:IsA("Fire") or L_347_forvar1:IsA("SpotLight") or L_347_forvar1:IsA("Smoke") or L_347_forvar1:IsA("Sparkles") then
            L_347_forvar1.Enabled = false
        elseif L_347_forvar1:IsA("MeshPart") then
            L_347_forvar1.Material = "Plastic"
            L_347_forvar1.Reflectance = 0
            L_347_forvar1.TextureID = 10385902758728957
        end
    end
    for L_348_forvar0, L_349_forvar1 in pairs(L_344_:GetChildren()) do
        if L_349_forvar1:IsA("BlurEffect") or L_349_forvar1:IsA("SunRaysEffect") or L_349_forvar1:IsA("ColorCorrectionEffect") or L_349_forvar1:IsA("BloomEffect") or L_349_forvar1:IsA("DepthOfFieldEffect") then
            L_349_forvar1.Enabled = false
        end
    end
end 

-- check

function Check_Sword(Sword_Name)
    for i, v in pairs(game:GetService("ReplicatedStorage").Remotes['CommF_']:InvokeServer("getInventory")) do
        if (v.Type == "Sword") then
            if v.Name == Sword_Name then
                return true
            end
        end
    end
end
rejoin() 
--Soul Guitar
function Check_Gun(Gun_Name)
    for i, v in pairs(game:GetService("ReplicatedStorage").Remotes['CommF_']:InvokeServer("getInventory")) do
        if (v.Type == "Gun") then
            if v.Name == Gun_Name then
                return true
            end
        end
    end
end

local function Check_Material(Material_Name)
    for i, v in pairs(game:GetService("ReplicatedStorage").Remotes['CommF_']:InvokeServer("getInventory")) do
        if v.Type == "Material" then
            if v.Name == Material_Name then
                return v.Count
            end
        end
    end
    return 0
end

function CheckTool(toolnam)
    lol = {
        game.Players.LocalPlayer.Character,
        game.Players.LocalPlayer.Backpack
    }
    for i, v in pairs(lol) do
        if v:FindFirstChild(toolnam) then
            return v:FindFirstChild(toolnam)
        end
    end
end

-- ui kaitan

local ScreenGui = Instance.new("ScreenGui");
local DropShadowHolder = Instance.new("Frame");
local DropShadow = Instance.new("ImageLabel");
local Main = Instance.new("Frame");
local UICorner = Instance.new("UICorner");
local UIStroke = Instance.new("UIStroke");
local UIGradient = Instance.new("UIGradient");
local Top = Instance.new("TextLabel");
local UIGradient1 = Instance.new("UIGradient");
local Under = Instance.new("TextLabel");
local UIGradient2 = Instance.new("UIGradient");

for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do 
    if v.Name == 'CoinCard' then 
        v:Destroy() 
    end
end

ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game:GetService("Players").LocalPlayer.PlayerGui
ScreenGui.Name = 'CoinCard'


local DiscordUrlTextLabel = Instance.new("TextLabel", ScreenGui);
DiscordUrlTextLabel["BorderSizePixel"] = 0;
DiscordUrlTextLabel["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
DiscordUrlTextLabel["TextSize"] = 16;
DiscordUrlTextLabel["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
DiscordUrlTextLabel["TextColor3"] = Color3.fromRGB(223, 115, 255);
DiscordUrlTextLabel["BackgroundTransparency"] = 1;
DiscordUrlTextLabel["AnchorPoint"] = Vector2.new(0.5, 0.5);
DiscordUrlTextLabel["Size"] = UDim2.new(0, 200, 0, 50);
DiscordUrlTextLabel["BorderColor3"] = Color3.fromRGB(142, 66, 133);
DiscordUrlTextLabel["Text"] = [[https://dsc.gg/toshyscript]];
DiscordUrlTextLabel["Position"] = UDim2.new(0.5, 0, -0.025, 0);

local DiscordUrlUiStroke = Instance.new("UIStroke", DiscordUrlTextLabel);
DiscordUrlUiStroke["Color"] = Color3.fromRGB(255, 255, 255);

local DiscordUrlUiGradient = Instance.new("UIGradient", DiscordUrlUiStroke);
GDiscordUrlUiGradient = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(225, 164, 194 )),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(142, 66, 133))
};



DropShadowHolder.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadowHolder.BackgroundTransparency = 1
DropShadowHolder.BorderSizePixel = 0
DropShadowHolder.Position = UDim2.new(0.5, 0, 0.1, 0)
DropShadowHolder.Size = UDim2.new(0, 500, 0, 68)
DropShadowHolder.ZIndex = 0
DropShadowHolder.Name = "DropShadowHolder"
DropShadowHolder.Parent = ScreenGui

DropShadow.Image = "rbxassetid://6015897843"
DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
DropShadow.ImageTransparency = 0.5
DropShadow.ScaleType = Enum.ScaleType.Slice
DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)
DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow.BackgroundTransparency = 1
DropShadow.BorderSizePixel = 0
DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
DropShadow.Size = UDim2.new(1, 47, 1, 47)
DropShadow.ZIndex = 0
DropShadow.Name = "DropShadow"
DropShadow.Parent = DropShadowHolder

Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Main.BackgroundTransparency = 0.5
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.Size = UDim2.new(1, -47, 1, -47)
Main.Name = "Main"
Main.Parent = DropShadow

UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = Main

UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Thickness = 2.5
UIStroke.Parent = Main

UIGradient.Color = ColorSequence.new{
ColorSequenceKeypoint.new(0, Color3.fromRGB(153, 102, 204)),
ColorSequenceKeypoint.new(1, Color3.fromRGB(223, 115, 255))
}
UIGradient.Parent = UIStroke

Top.Font = Enum.Font.GothamBold
Top.Text = "Let the music play"
Top.TextColor3 = Color3.fromRGB(255, 255, 255)
Top.TextSize = 16.5
Top.TextYAlignment = Enum.TextYAlignment.Bottom
Top.AnchorPoint = Vector2.new(0.5, 0)
Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Top.BackgroundTransparency = 0.9990000128746033
Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
Top.BorderSizePixel = 0
Top.Position = UDim2.new(0.5, 0, 0, 15)
Top.Size = UDim2.new(0, 500, 0, 18)
Top.Name = "Top"
Top.Parent = Main

UIGradient1.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(153, 102, 204)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(223, 115, 255))
}
UIGradient1.Parent = Top

Under.Font = Enum.Font.GothamBold
Under.Text = "Script started!"
Under.TextColor3 = Color3.fromRGB(255, 255, 255)
Under.TextSize = 18
Under.TextYAlignment = Enum.TextYAlignment.Bottom
Under.AnchorPoint = Vector2.new(0.5, 0)
Under.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Under.BackgroundTransparency = 0.9990000128746033
Under.BorderColor3 = Color3.fromRGB(0, 0, 0)
Under.BorderSizePixel = 0
Under.Position = UDim2.new(0.5, 0, 0, 35)
Under.Size = UDim2.new(0, 500, 0, 18)
Under.Name = "Under"
Under.Parent = Main

UIGradient2.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(153, 102, 204)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(223, 115, 255))
}
UIGradient2.Parent = Under
Top.Size = UDim2.new(0, Top.TextBounds.X, 0, 18)
Under.Size = UDim2.new(0, Under.TextBounds.X, 0, 18)
if Top.Size.X.Offset > Under.Size.X.Offset then
    DropShadowHolder.Size = UDim2.new(0, Top.TextBounds.X + 50, 0, 68)
else
    DropShadowHolder.Size = UDim2.new(0, Under.TextBounds.X + 50, 0, 68)
end
Top:GetPropertyChangedSignal("Text"):Connect(function()
    Top.Size = UDim2.new(0, Top.TextBounds.X, 0, 18)
    if Top.Size.X.Offset > Under.Size.X.Offset then
        DropShadowHolder.Size = UDim2.new(0, Top.TextBounds.X + 50, 0, 68)
    else
        DropShadowHolder.Size = UDim2.new(0, Under.TextBounds.X + 50, 0, 68)
    end
end)
Under:GetPropertyChangedSignal("Text"):Connect(function()
    Under.Size = UDim2.new(0, Under.TextBounds.X, 0, 18)
    if Top.Size.X.Offset > Under.Size.X.Offset then
        DropShadowHolder.Size = UDim2.new(0, Top.TextBounds.X + 50, 0, 68)
    else
        DropShadowHolder.Size = UDim2.new(0, Under.TextBounds.X + 50, 0, 68)
    end
end)

Top.Text = 'Auto Farm: None'
Under.Text = "Task: None" 
--[[ Top.Text = "Auto Farm: "..Content1
	Under.Text = "Task: "..Content2]]

-- id
	local L_82_ = game.PlaceId
	if L_82_ == 2753915549 then
		First_Sea = true;
	elseif L_82_ == 4442272183 then
		Second_Sea = true;
	elseif L_82_ == 7449423635 then
		Third_Sea = true
	elseif L_82_ == 623823800 then
        Third_Sea = true
	else
		game:Shutdown()
	end;

    if First_Sea == true then
        print("s1")
    elseif Second_Sea == true then
        print("s2")
    elseif Third_Sea == true then
        print("s3")
    end;
    
-- pos

posX = 10

posY = 30

posZ = 10
    
-- cdk
if _G.testecdk then
    AutoCdk()
end
local function AutoCDK()
    local Cursed, DoorProgress = WaitPart(Map, "Turtle", "Cursed")
    
    local function MasterySwords()
      local TushitaM, YamaM = ItemMastery("Tushita"), ItemMastery("Yama")
      
      if TushitaM and TushitaM < 350 then
        if not VerifyTool("Tushita") then
          FireRemote("LoadItem", "Tushita")
        end
      elseif YamaM and YamaM < 350 then
        if not VerifyTool("Yama") then
          FireRemote("LoadItem", "Yama")
        end
      else
        return false
      end;EquipToolTip("Sword")
      
      local Enemie = GetEnemies({"Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy"})
      if Enemie then
        PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function()ActiveHaki()BringNPC(Enemie, true)end)
      else
        PlayerTP(CFrame.new(-9513, 164, 5786))
      end
      return true
    end
    
    local function IndentifyQuest()
      if VerifyItem("Cursed Dual Katana") then return {"Finished"} end -- Virefica se o jogador possui a CDK
      if MasterySwords() then return {"MasterySwords"} end -- Verifica a maestria da Yama e a Tushita
      
      local Door = Cursed:FindFirstChild("Breakable")
      if Door and Door.CanCollide then
        local Prog = FireRemote("CDKQuest", "OpenDoor")
        if type(Prog) == "string" and Prog == "opened" then
          return {"OpenDoor"}
        else
          Door.CanCollide = false
        end
      end -- Verifica se a porta está aberta
      
      local Count = GetMaterial("Alucard Fragment") -- Pega a quantidade de material atual
      
      if Count == 6 then -- Verifica se é a ultima missão
        return {"FinalQuest"}
      elseif Count == 0 then
        FireRemote("CDKQuest", "Progress", "Evil")FireRemote("CDKQuest", "StartTrial", "Evil")
        return {"Yama", 1} -- Retorna a primeira missão
      elseif Map:FindFirstChild("HellDimension") then
        return {"Yama", 3} -- Retorna a dimensão da Yama
      elseif Map:FindFirstChild("HeavenlyDimension") then
        return {"Tushita", 3} -- Retorna a dimensão da Tushita
      elseif Player:FindFirstChild("QuestHaze") then
        return {"Yama", 2} -- Retorna a névoa da miseria
      end
      
      local Progress = FireRemote("CDKQuest", "Progress")
      local Good = Progress.Good
      local Evil = Progress.Evil
      
      if Evil and Evil >= 0 and Evil < 3 then
        FireRemote("CDKQuest", "Progress", "Evil")FireRemote("CDKQuest", "StartTrial", "Evil")
        if Evil == 0 then
          return {"Yama", 1}
        elseif Evil == 1 then
          return {"Yama", 2}
        elseif Evil == 2 then
          return {"Yama", 3}
        end
      elseif Good and Good >= 0 and Good < 3 then
        FireRemote("CDKQuest", "Progress", "Good")FireRemote("CDKQuest", "StartTrial", "Good")
        if Good == 0 then
          return {"Tushita", 1}
        elseif Good == 1 then
          return {"Tushita", 2}
        elseif Good == 2 then
          return {"Tushita", 3}
        end
      end
    end
    
    local function KillHazeEnemies()
      local QuestHaze = Player:FindFirstChild("QuestHaze")
      if QuestHaze then
        local Nearest, Enemie = math.huge
        for _,v in pairs(QuestHaze:GetChildren()) do
          if v.Value > 0 then
            local plrPP = Player.Character and Player.Character.PrimaryPart
            local EnemiePos = v:GetAttribute("Position")
            if v.Name == "Dragon Crew Warrior" then EnemiePos = Vector3.new(6431, 51, -1043)end
            if plrPP and EnemiePos and (EnemiePos - plrPP.Position).Magnitude <= Nearest then
              Nearest, Enemie = (EnemiePos - plrPP.Position).Magnitude, ({Name = v.Name, Position = EnemiePos})
            end
          end
        end
        
        if Enemie then
          local Enemies = GetEnemies({Enemie.Name})
          if Enemies and Enemies:FindFirstChild("HumanoidRootPart") then
            PlayerTP(Enemies.HumanoidRootPart.CFrame + getgenv().FarmPos)
            pcall(function()ActiveHaki()EquipTool()BringNPC(Enemies)end)
          else
            if Enemie.Position then
              PlayerTP(CFrame.new(Enemie.Position))
            end
          end;getgenv().CursedDualKatana = true
        else
          getgenv().CursedDualKatana = false
        end
      end
    end
    
    local function GetTorch(Dimension)
      if Dimension then
        local Torch1 = Dimension:FindFirstChild("Torch1")
        local Torch2 = Dimension:FindFirstChild("Torch2")
        local Torch3 = Dimension:FindFirstChild("Torch3")
        
        if Torch1 and Torch1:FindFirstChild("ProximityPrompt") then
          if Torch1.ProximityPrompt.Enabled then
            return Torch1
          end
        end
        if Torch2 and Torch2:FindFirstChild("ProximityPrompt") then
          if Torch2.ProximityPrompt.Enabled then
            return Torch2
          end
        end
        if Torch3 and Torch3:FindFirstChild("ProximityPrompt") then
          if Torch3.ProximityPrompt.Enabled then
            return Torch3
          end
        end
        return Dimension:FindFirstChild("Exit")
      end
    end
    
    local function InvokeSoulReaper()
      local HellDimension = Map:FindFirstChild("HellDimension")
      if HellDimension then
        local plrPP = Player.Character and Player.Character.PrimaryPart
        if plrPP and (plrPP.Position - HellDimension.WorldPivot.p).Magnitude < 2500 then
          local Enemies = GetEnemies({"Hell's Messenger", "Cursed Skeleton"}, 2500)
          local Torch = GetTorch(HellDimension)
          
          if Enemies then
            PlayerTP(Enemies.HumanoidRootPart.CFrame + getgenv().FarmPos)
            pcall(function()ActiveHaki()EquipTool()BringNPC(Enemies, true)end)
          elseif Torch then
            PlayerTP(Torch.CFrame)
            if (plrPP.Position - Torch.Position).Magnitude < 10 then
              if Torch:FindFirstChild("ProximityPrompt") and fireproximityprompt then
                fireproximityprompt(Torch.ProximityPrompt)task.wait(0.5)
              end
            end
          end;getgenv().CursedDualKatana = true
        else
          getgenv().CursedDualKatana = false
        end
      else
        local SoulReaper = GetEnemies({"Soul Reaper"})
        
        if SoulReaper and SoulReaper:FindFirstChild("HumanoidRootPart") then
          PlayerTP(SoulReaper.HumanoidRootPart.CFrame * CFrame.new(0, 2, 0))DisableTools()
        elseif VerifyTool("Hallow Essence") then
          EquipToolName("Hallow Essence")
          pcall(function()PlayerTP(Map["Haunted Castle"].Summoner.Detection.CFrame)end)
        else
          if GetMaterial("Bones") >= 50 then
            FireRemote("Bones", "Buy", 1, 1)
          end
          local Enemie = GetEnemies({"Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy"})
          if Enemie then
            PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
            pcall(function()ActiveHaki()EquipTool()BringNPC(Enemie, true)end)
          else
            PlayerTP(CFrame.new(-9513, 164, 5786))
          end
        end;getgenv().CursedDualKatana = true
      end
    end
    
    local function DieGhost()
      if not VerifyTool("Yama") then
        FireRemote("LoadItem", "Yama")
      else
        local NPC = GetEnemies({"Forest Pirate"})EquipToolName("Yama")
        
        if NPC and NPC:FindFirstChild("HumanoidRootPart") then
          PlayerTP(NPC.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2))
        else
          PlayerTP(CFrame.new(-13350, 332, -7645))
        end;getgenv().CursedDualKatana = true
      end
    end
    
    local function GetPirateRaidNPC()
      for _,npc in pairs(Enemies:GetChildren()) do
        if npc.Name ~= "rip_indra True Form" and IsAlive(npc) then
          if npc.PrimaryPart and (npc.PrimaryPart.Position - Vector3.new(-5556, 314, -2988)).Magnitude < 700 then
            return npc
          end
        end
      end
    end
    
    local function PirateRaid()
      if VerifyRaidPirate(true) then
        local Enemie = GetPirateRaidNPC()
        
        if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
          PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
          pcall(function()ActiveHaki()EquipTool()BringNPC(Enemie, true)end)
        else
          PlayerTP(CFrame.new(-5556, 314, -2988))
        end;getgenv().CursedDualKatana = true
      else
        getgenv().CursedDualKatana = false
      end
    end
    
    local function BigMoon()
      local HeavenlyDimension = Map:FindFirstChild("HeavenlyDimension")
      if HeavenlyDimension then
        local plrPP = Player.Character and Player.Character.PrimaryPart
        if plrPP and (plrPP.Position - HeavenlyDimension.WorldPivot.p).Magnitude < 2500 then
          local Enemies = GetEnemies({"Heaven's Guardian", "Cursed Skeleton"}, 2500)
          local Torch = GetTorch(HeavenlyDimension)
          
          if Enemies then
            PlayerTP(Enemies.HumanoidRootPart.CFrame + getgenv().FarmPos)
            pcall(function()ActiveHaki()EquipTool()BringNPC(Enemies, true)end)
          elseif Torch then
            PlayerTP(Torch.CFrame)
            if (plrPP.Position - Torch.Position).Magnitude < 10 then
              if Torch:FindFirstChild("ProximityPrompt") and fireproximityprompt then
                fireproximityprompt(Torch.ProximityPrompt)task.wait(0.5)
              end
            end
          end;getgenv().CursedDualKatana = true
        else
          getgenv().CursedDualKatana = false
        end
      else
        local Boss = GetEnemies({"Cake Queen"})
        
        if Boss and Boss:FindFirstChild("HumanoidRootPart") then
          PlayerTP(Boss.HumanoidRootPart.CFrame + getgenv().FarmPos)
          pcall(function()ActiveHaki()EquipTool()end)
        else
          PlayerTP(CFrame.new(-710, 382, -11150))
        end;getgenv().CursedDualKatana = true
      end
    end
    
    local Boat1, Boat2, Boat3
    local function TalkBoatsDealer()
      local plrPP = Player.Character and Player.Character.PrimaryPart
      local BoatDealer = NPCS:FindFirstChild("Luxury Boat Dealer")
      
      if plrPP then
        if not Boat1 then
          PlayerTP(CFrame.new(-9550, 21, 4638))getgenv().CursedDualKatana = true
          if BoatDealer and (plrPP.Position - Vector3.new(-9550, 21, 4638)).Magnitude < 5 then
            FireRemote("CDKQuest", "BoatQuest", BoatDealer)FireRemote("CDKQuest", "BoatQuest", BoatDealer, "Check")task.wait(1)Boat1 = true
          end
        elseif not Boat2 then
          PlayerTP(CFrame.new(-9531, 7, -8376))getgenv().CursedDualKatana = true
          if BoatDealer and (plrPP.Position - Vector3.new(-9531, 7, -8376)).Magnitude < 5 then
            FireRemote("CDKQuest", "BoatQuest", BoatDealer)FireRemote("CDKQuest", "BoatQuest", BoatDealer, "Check")task.wait(1)Boat2 = true
          end
        elseif not Boat3 then
          PlayerTP(CFrame.new(-4602, 16, -2880))getgenv().CursedDualKatana = true
          if BoatDealer and (plrPP.Position - Vector3.new(-4602, 16, -2880)).Magnitude < 5 then
            FireRemote("CDKQuest", "BoatQuest", BoatDealer)FireRemote("CDKQuest", "BoatQuest", BoatDealer, "Check")task.wait(1)Boat3 = true
          end
        else
          getgenv().CursedDualKatana = false
        end
      end
    end
    
    task.spawn(function()
      while getgenv().AutoCDK do task.wait()
        local Quest = IndentifyQuest()
        if Quest then
          getgenv().CurrentQuest = Quest
        end
      end
    end)
    
    while getgenv().AutoCDK do task.wait()
      if MyLevel.Value >= 2200 then
        local Quest = CurrentQuest
        if Quest then
          if Quest[1] == "Finished" then
            getgenv().CursedDualKatana = false
          elseif Quest[1] == "MasterySwords" then
            getgenv().CursedDualKatana = true
          elseif Quest[1] == "OpenDoor" then
            local plrPP = Player.Character and Player.Character.PrimaryPart
            if plrPP and (plrPP.Position - Vector3.new(-12131, 578, -6707)).Magnitude < 5 then
              FireRemote("CDKQuest", "OpenDoor")FireRemote("CDKQuest", "OpenDoor", true)
            else
              PlayerTP(CFrame.new(-12131, 578, -6707))getgenv().CursedDualKatana = true
            end
          elseif Quest[1] == "FinalQuest" then
            if not VerifyTool("Tushita") and not VerifyTool("Yama") then
              FireRemote("LoadItem", "Tushita")
            else
              if VerifyNPC("Cursed Skeleton Boss") then
                local Enemie = GetEnemies({"Cursed Skeleton Boss"})
                if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
                  PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
                  pcall(function()ActiveHaki()end)
                end;EquipToolTip("Sword")
              else
                local Pedestal1 = Cursed:FindFirstChild("Pedestal1")
                local Pedestal2 = Cursed:FindFirstChild("Pedestal2")
                local Pedestal3 = Cursed:FindFirstChild("Pedestal3")
                
                local Pedestal, Prompt
                if Pedestal3 and Pedestal3:FindFirstChild("ProximityPrompt") then
                  if Pedestal3.ProximityPrompt.Enabled then
                    Pedestal, Prompt = Pedestal3, Pedestal3.ProximityPrompt
                  end
                end
                if Pedestal2 and Pedestal2:FindFirstChild("ProximityPrompt") then
                  if Pedestal2.ProximityPrompt.Enabled then
                    Pedestal, Prompt = Pedestal2, Pedestal2.ProximityPrompt
                  end
                end
                if Pedestal1 and Pedestal1:FindFirstChild("ProximityPrompt") then
                  if Pedestal1.ProximityPrompt.Enabled then
                    Pedestal, Prompt = Pedestal1, Pedestal1.ProximityPrompt
                  end
                end
                
                if DialogVisible() then
                  VirtualUser:ClickButton1(Vector2.new(1e4, 1e4))
                else
                  if Pedestal then
                    local plrPP = Player.Character and Player.Character.PrimaryPart
                    if plrPP and (plrPP.Position - Pedestal.Position).Magnitude < 10 then
                      if Prompt and fireproximityprompt then
                        fireproximityprompt(Prompt)task.wait(0.5)
                      end
                    else
                      PlayerTP(Pedestal.CFrame)
                    end
                  else
                    PlayerTP(CFrame.new(-12344, 603, -6551))
                  end
                end
              end
            end;getgenv().CursedDualKatana = true
          elseif Quest[1] == "Tushita" then
            getgenv().ClickRequest = true
            if Quest[2] == 1 then
              TalkBoatsDealer()
            elseif Quest[2] == 2 then
              PirateRaid()
            else BigMoon() end
          elseif Quest[1] == "Yama" then
            if Quest[2] == 1 then
              DieGhost()getgenv().ClickRequest = false
            elseif Quest[2] == 2 then
              KillHazeEnemies()getgenv().ClickRequest = true
            else InvokeSoulReaper() end
          else
            getgenv().CursedDualKatana = false
          end
        end
      else
        getgenv().CursedDualKatana = false
      end
    end
    
    getgenv().ClickRequest = true
    getgenv().CursedDualKatana = false
  end
-- select team
spawn(function()
    while task.wait() do
        if game.Players.LocalPlayer.Team == nil then
            pcall(function()
                if _G.Team == "Pirates" then
                    game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Size = UDim2.new(10000,1000,10000,1000)
                    game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Position = UDim2.new(-4,0,-5,0)
                    wait(.5)
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(605,394,0,true,game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton,0)
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(605,394,0,false,game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton,0)
                elseif _G.Team == "Marines" then
                    game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.Size = UDim2.new(10000,1000,10000,1000)
                    game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.Position = UDim2.new(-4,0,-5,0)
                    wait(.5)
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(605,394,0,true,game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton,0)
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(605,394,0,false,game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton,0)
                else
                    game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Size = UDim2.new(10000,1000,10000,1000)
                    game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Position = UDim2.new(-4,0,-5,0)
                    wait(.5)
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(605,394,0,true,game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton,0)
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(605,394,0,false,game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton,0)
                end
            end)
        end
    end
end)

-- lv check
	function CheckLevel()
		local L_120_ = game:GetService("Players").LocalPlayer.Data.Level.Value
		if First_Sea then
			if L_120_ == 1 or L_120_ <= 9 or SelectMonster == "Bandit" or SelectArea == "" then -- Bandit
				Ms = "Bandit"
				NameQuest = "BanditQuest1"
				QuestLv = 1
				NameMon = "Bandit"
				CFrameQ = CFrame.new(1060.9383544922, 16.455066680908, 1547.7841796875)
				CFrameMon = CFrame.new(1038.5533447266, 41.296249389648, 1576.5098876953)
			elseif L_120_ == 10 or L_120_ <= 14 or SelectMonster == "Monkey" or SelectArea == "Jungle" then -- Monkey
				Ms = "Monkey"
				NameQuest = "JungleQuest"
				QuestLv = 1
				NameMon = "Monkey"
				CFrameQ = CFrame.new(- 1601.6553955078, 36.85213470459, 153.38809204102)
				CFrameMon = CFrame.new(- 1448.1446533203, 50.851993560791, 63.60718536377)
			elseif L_120_ == 15 or L_120_ <= 29 or SelectMonster == "Gorilla" or SelectArea == "Jungle" then -- Gorilla
				Ms = "Gorilla"
				NameQuest = "JungleQuest"
				QuestLv = 2
				NameMon = "Gorilla"
				CFrameQ = CFrame.new(- 1601.6553955078, 36.85213470459, 153.38809204102)
				CFrameMon = CFrame.new(- 1142.6488037109, 40.462348937988, - 515.39227294922)
			elseif L_120_ == 30 or L_120_ <= 39 or SelectMonster == "Pirate" or SelectArea == "Buggy" then -- Pirate
				Ms = "Pirate"
				NameQuest = "BuggyQuest1"
				QuestLv = 1
				NameMon = "Pirate"
				CFrameQ = CFrame.new(- 1140.1761474609, 4.752049446106, 3827.4057617188)
				CFrameMon = CFrame.new(- 1201.0881347656, 40.628940582275, 3857.5966796875)
			elseif L_120_ == 40 or L_120_ <= 59 or SelectMonster == "Brute" or SelectArea == "Buggy" then -- Brute
				Ms = "Brute"
				NameQuest = "BuggyQuest1"
				QuestLv = 2
				NameMon = "Brute"
				CFrameQ = CFrame.new(- 1140.1761474609, 4.752049446106, 3827.4057617188)
				CFrameMon = CFrame.new(- 1387.5324707031, 24.592035293579, 4100.9575195313)
			elseif L_120_ == 60 or L_120_ <= 74 or SelectMonster == "Desert Bandit" or SelectArea == "Desert" then -- Desert Bandit
				Ms = "Desert Bandit"
				NameQuest = "DesertQuest"
				QuestLv = 1
				NameMon = "Desert Bandit"
				CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
				CFrameMon = CFrame.new(984.99896240234, 16.109552383423, 4417.91015625)
			elseif L_120_ == 75 or L_120_ <= 89 or SelectMonster == "Desert Officer" or SelectArea == "Desert" then -- Desert Officer
				Ms = "Desert Officer"
				NameQuest = "DesertQuest"
				QuestLv = 2
				NameMon = "Desert Officer"
				CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
				CFrameMon = CFrame.new(1547.1510009766, 14.452038764954, 4381.8002929688)
			elseif L_120_ == 90 or L_120_ <= 99 or SelectMonster == "Snow Bandit" or SelectArea == "Snow" then -- Snow Bandit
				Ms = "Snow Bandit"
				NameQuest = "SnowQuest"
				QuestLv = 1
				NameMon = "Snow Bandit"
				CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, - 1298.3576660156)
				CFrameMon = CFrame.new(1356.3028564453, 105.76865386963, - 1328.2418212891)
			elseif L_120_ == 100 or L_120_ <= 119 or SelectMonster == "Snowman" or SelectArea == "Snow" then -- Snowman
				Ms = "Snowman"
				NameQuest = "SnowQuest"
				QuestLv = 2
				NameMon = "Snowman"
				CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, - 1298.3576660156)
				CFrameMon = CFrame.new(1218.7956542969, 138.01184082031, - 1488.0262451172)
			elseif L_120_ == 120 or L_120_ <= 149 or SelectMonster == "Chief Petty Officer" or SelectArea == "Marine" then -- Chief Petty Officer
				Ms = "Chief Petty Officer"
				NameQuest = "MarineQuest2"
				QuestLv = 1
				NameMon = "Chief Petty Officer"
				CFrameQ = CFrame.new(- 5035.49609375, 28.677835464478, 4324.1840820313)
				CFrameMon = CFrame.new(- 4931.1552734375, 65.793113708496, 4121.8393554688)
			elseif L_120_ == 150 or L_120_ <= 174 or SelectMonster == "Sky Bandit" or SelectArea == "Sky" then -- Sky Bandit
				Ms = "Sky Bandit"
				NameQuest = "SkyQuest"
				QuestLv = 1
				NameMon = "Sky Bandit"
				CFrameQ = CFrame.new(- 4842.1372070313, 717.69543457031, - 2623.0483398438)
				CFrameMon = CFrame.new(- 4955.6411132813, 365.46365356445, - 2908.1865234375)
			elseif L_120_ == 175 or L_120_ <= 189 or SelectMonster == "Dark Master" or SelectArea == "Sky" then -- Dark Master
				Ms = "Dark Master"
				NameQuest = "SkyQuest"
				QuestLv = 2
				NameMon = "Dark Master"
				CFrameQ = CFrame.new(- 4842.1372070313, 717.69543457031, - 2623.0483398438)
				CFrameMon = CFrame.new(- 5148.1650390625, 439.04571533203, - 2332.9611816406)
			elseif L_120_ == 190 or L_120_ <= 209 or SelectMonster == "Prisoner" or SelectArea == "Prison" then -- Prisoner
				Ms = "Prisoner"
				NameQuest = "PrisonerQuest"
				QuestLv = 1
				NameMon = "Prisoner"
				CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, - 0.999846935, 0, 0.0175017118)
				CFrameMon = CFrame.new(4937.31885, 0.332031399, 649.574524, 0.694649816, 0, - 0.719348073, 0, 1, 0, 0.719348073, 0, 0.694649816)
			elseif L_120_ == 210 or L_120_ <= 249 or SelectMonster == "Dangerous Prisoner" or SelectArea == "Prison" then -- Dangerous Prisoner
				Ms = "Dangerous Prisoner"
				NameQuest = "PrisonerQuest"
				QuestLv = 2
				NameMon = "Dangerous Prisoner"
				CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, - 0.999846935, 0, 0.0175017118)
				CFrameMon = CFrame.new(5099.6626, 0.351562679, 1055.7583, 0.898906827, 0, - 0.438139856, 0, 1, 0, 0.438139856, 0, 0.898906827)
			elseif L_120_ == 250 or L_120_ <= 274 or SelectMonster == "Toga Warrior" or SelectArea == "Colosseum" then -- Toga Warrior
				Ms = "Toga Warrior"
				NameQuest = "ColosseumQuest"
				QuestLv = 1
				NameMon = "Toga Warrior"
				CFrameQ = CFrame.new(- 1577.7890625, 7.4151420593262, - 2984.4838867188)
				CFrameMon = CFrame.new(- 1872.5166015625, 49.080215454102, - 2913.810546875)
			elseif L_120_ == 275 or L_120_ <= 299 or SelectMonster == "Gladiator" or SelectArea == "Colosseum" then -- Gladiator
				Ms = "Gladiator"
				NameQuest = "ColosseumQuest"
				QuestLv = 2
				NameMon = "Gladiator"
				CFrameQ = CFrame.new(- 1577.7890625, 7.4151420593262, - 2984.4838867188)
				CFrameMon = CFrame.new(- 1521.3740234375, 81.203170776367, - 3066.3139648438)
			elseif L_120_ == 300 or L_120_ <= 324 or SelectMonster == "Military Soldier" or SelectArea == "Magma" then -- Military Soldier
				Ms = "Military Soldier"
				NameQuest = "MagmaQuest"
				QuestLv = 1
				NameMon = "Military Soldier"
				CFrameQ = CFrame.new(- 5316.1157226563, 12.262831687927, 8517.00390625)
				CFrameMon = CFrame.new(- 5369.0004882813, 61.24352645874, 8556.4921875)
			elseif L_120_ == 325 or L_120_ <= 374 or SelectMonster == "Military Spy" or SelectArea == "Magma" then -- Military Spy
				Ms = "Military Spy"
				NameQuest = "MagmaQuest"
				QuestLv = 2
				NameMon = "Military Spy"
				CFrameQ = CFrame.new(- 5316.1157226563, 12.262831687927, 8517.00390625)
				CFrameMon = CFrame.new(- 5787.00293, 75.8262634, 8651.69922, 0.838590562, 0, - 0.544762194, 0, 1, 0, 0.544762194, 0, 0.838590562)
			elseif L_120_ == 375 or L_120_ <= 399 or SelectMonster == "Fishman Warrior" or SelectArea == "Fishman" then -- Fishman Warrior
				Ms = "Fishman Warrior"
				NameQuest = "FishmanQuest"
				QuestLv = 1
				NameMon = "Fishman Warrior"
				CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
				CFrameMon = CFrame.new(60844.10546875, 98.462875366211, 1298.3985595703)
				if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
				end
			elseif L_120_ == 400 or L_120_ <= 449 or SelectMonster == "Fishman Commando" or SelectArea == "Fishman" then -- Fishman Commando
				Ms = "Fishman Commando"
				NameQuest = "FishmanQuest"
				QuestLv = 2
				NameMon = "Fishman Commando"
				CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
				CFrameMon = CFrame.new(61738.3984375, 64.207321166992, 1433.8375244141)
				if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
				end
			elseif L_120_ == 10 or L_120_ <= 474 or SelectMonster == "God.s Guard" or SelectArea == "Sky Island" then -- God.s Guard
				Ms = "God.s Guard"
				NameQuest = "SkyExp1Quest"
				QuestLv = 1
				NameMon = "God.s Guard"
				CFrameQ = CFrame.new(- 4721.8603515625, 845.30297851563, - 1953.8489990234)
				CFrameMon = CFrame.new(- 4628.0498046875, 866.92877197266, - 1931.2352294922)
				if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 4607.82275, 872.54248, - 1667.55688))
				end
			elseif L_120_ == 475 or L_120_ <= 524 or SelectMonster == "Shanda" or SelectArea == "Sky Island" then -- Shanda
				Ms = "Shanda"
				NameQuest = "SkyExp1Quest"
				QuestLv = 2
				NameMon = "Shanda"
				CFrameQ = CFrame.new(- 7863.1596679688, 5545.5190429688, - 378.42266845703)
				CFrameMon = CFrame.new(- 7685.1474609375, 5601.0751953125, - 441.38876342773)
				if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 7894.6176757813, 5547.1416015625, - 380.29119873047))
				end
			elseif L_120_ == 525 or L_120_ <= 549 or SelectMonster == "Royal Squad" or SelectArea == "Sky Island" then -- Royal Squad
				Ms = "Royal Squad"
				NameQuest = "SkyExp2Quest"
				QuestLv = 1
				NameMon = "Royal Squad"
				CFrameQ = CFrame.new(- 7903.3828125, 5635.9897460938, - 1410.923828125)
				CFrameMon = CFrame.new(- 7654.2514648438, 5637.1079101563, - 1407.7550048828)
			elseif L_120_ == 550 or L_120_ <= 624 or SelectMonster == "Royal Soldier" or SelectArea == "Sky Island" then -- Royal Soldier
				Ms = "Royal Soldier"
				NameQuest = "SkyExp2Quest"
				QuestLv = 2
				NameMon = "Royal Soldier"
				CFrameQ = CFrame.new(- 7903.3828125, 5635.9897460938, - 1410.923828125)
				CFrameMon = CFrame.new(- 7760.4106445313, 5679.9077148438, - 1884.8112792969)
			elseif L_120_ == 625 or L_120_ <= 649 or SelectMonster == "Galley Pirate" or SelectArea == "Fountain" then -- Galley Pirate
				Ms = "Galley Pirate"
				NameQuest = "FountainQuest"
				QuestLv = 1
				NameMon = "Galley Pirate"
				CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
				CFrameMon = CFrame.new(5557.1684570313, 152.32717895508, 3998.7758789063)
			elseif L_120_ >= 650 or SelectMonster == "Galley Captain" or SelectArea == "Fountain" then -- Galley Captain
				Ms = "Galley Captain"
				NameQuest = "FountainQuest"
				QuestLv = 2
				NameMon = "Galley Captain"
				CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
				CFrameMon = CFrame.new(5677.6772460938, 92.786109924316, 4966.6323242188)
			end
		end
		if Second_Sea then
			if L_120_ == 700 or L_120_ <= 724 or SelectMonster == "Raider" or SelectArea == "Area 1" then -- Raider
				Ms = "Raider"
				NameQuest = "Area1Quest"
				QuestLv = 1
				NameMon = "Raider"
				CFrameQ = CFrame.new(- 427.72567749023, 72.99634552002, 1835.9426269531)
				CFrameMon = CFrame.new(68.874565124512, 93.635643005371, 2429.6752929688)
			elseif L_120_ == 725 or L_120_ <= 774 or SelectMonster == "Mercenary" or SelectArea == "Area 1" then -- Mercenary
				Ms = "Mercenary"
				NameQuest = "Area1Quest"
				QuestLv = 2
				NameMon = "Mercenary"
				CFrameQ = CFrame.new(- 427.72567749023, 72.99634552002, 1835.9426269531)
				CFrameMon = CFrame.new(- 864.85009765625, 122.47104644775, 1453.1505126953)
			elseif L_120_ == 775 or L_120_ <= 799 or SelectMonster == "Swan Pirate" or SelectArea == "Area 2" then -- Swan Pirate
				Ms = "Swan Pirate"
				NameQuest = "Area2Quest"
				QuestLv = 1
				NameMon = "Swan Pirate"
				CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
				CFrameMon = CFrame.new(1065.3669433594, 137.64012145996, 1324.3798828125)
			elseif L_120_ == 800 or L_120_ <= 874 or SelectMonster == "Factory Staff" or SelectArea == "Area 2" then -- Factory Staff
				Ms = "Factory Staff"
				NameQuest = "Area2Quest"
				QuestLv = 2
				NameMon = "Factory Staff"
				CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
				CFrameMon = CFrame.new(533.22045898438, 128.46876525879, 355.62615966797)
			elseif L_120_ == 875 or L_120_ <= 899 or SelectMonster == "Marine Lieutenan" or SelectArea == "Marine" then -- Marine Lieutenant
				Ms = "Marine Lieutenant"
				NameQuest = "MarineQuest3"
				QuestLv = 1
				NameMon = "Marine Lieutenant"
				CFrameQ = CFrame.new(- 2440.9934082031, 73.04190826416, - 3217.7082519531)
				CFrameMon = CFrame.new(- 2489.2622070313, 84.613594055176, - 3151.8830566406)
			elseif L_120_ == 900 or L_120_ <= 949 or SelectMonster == "Marine Captain" or SelectArea == "Marine" then -- Marine Captain
				Ms = "Marine Captain"
				NameQuest = "MarineQuest3"
				QuestLv = 2
				NameMon = "Marine Captain"
				CFrameQ = CFrame.new(- 2440.9934082031, 73.04190826416, - 3217.7082519531)
				CFrameMon = CFrame.new(- 2335.2026367188, 79.786659240723, - 3245.8674316406)
			elseif L_120_ == 950 or L_120_ <= 974 or SelectMonster == "Zombie" or SelectArea == "Zombie" then -- Zombie
				Ms = "Zombie"
				NameQuest = "ZombieQuest"
				QuestLv = 1
				NameMon = "Zombie"
				CFrameQ = CFrame.new(- 5494.3413085938, 48.505931854248, - 794.59094238281)
				CFrameMon = CFrame.new(- 5536.4970703125, 101.08577728271, - 835.59075927734)
			elseif L_120_ == 975 or L_120_ <= 999 or SelectMonster == "Vampire" or SelectArea == "Zombie" then -- Vampire
				Ms = "Vampire"
				NameQuest = "ZombieQuest"
				QuestLv = 2
				NameMon = "Vampire"
				CFrameQ = CFrame.new(- 5494.3413085938, 48.505931854248, - 794.59094238281)
				CFrameMon = CFrame.new(- 5806.1098632813, 16.722528457642, - 1164.4384765625)
			elseif L_120_ == 1000 or L_120_ <= 1049 or SelectMonster == "Snow Trooper" or SelectArea == "Snow Mountain" then -- Snow Trooper
				Ms = "Snow Trooper"
				NameQuest = "SnowMountainQuest"
				QuestLv = 1
				NameMon = "Snow Trooper"
				CFrameQ = CFrame.new(607.05963134766, 401.44781494141, - 5370.5546875)
				CFrameMon = CFrame.new(535.21051025391, 432.74209594727, - 5484.9165039063)
			elseif L_120_ == 1050 or L_120_ <= 1099 or SelectMonster == "Winter Warrior" or SelectArea == "Snow Mountain" then -- Winter Warrior
				Ms = "Winter Warrior"
				NameQuest = "SnowMountainQuest"
				QuestLv = 2
				NameMon = "Winter Warrior"
				CFrameQ = CFrame.new(607.05963134766, 401.44781494141, - 5370.5546875)
				CFrameMon = CFrame.new(1234.4449462891, 456.95419311523, - 5174.130859375)
			elseif L_120_ == 1100 or L_120_ <= 1124 or SelectMonster == "Lab Subordinate" or SelectArea == "Ice Fire" then -- Lab Subordinate
				Ms = "Lab Subordinate"
				NameQuest = "IceSideQuest"
				QuestLv = 1
				NameMon = "Lab Subordinate"
				CFrameQ = CFrame.new(- 6061.841796875, 15.926671981812, - 4902.0385742188)
				CFrameMon = CFrame.new(- 5720.5576171875, 63.309471130371, - 4784.6103515625)
			elseif L_120_ == 1125 or L_120_ <= 1174 or SelectMonster == "Horned Warrior" or SelectArea == "Ice Fire" then -- Horned Warrior
				Ms = "Horned Warrior"
				NameQuest = "IceSideQuest"
				QuestLv = 2
				NameMon = "Horned Warrior"
				CFrameQ = CFrame.new(- 6061.841796875, 15.926671981812, - 4902.0385742188)
				CFrameMon = CFrame.new(- 6292.751953125, 91.181983947754, - 5502.6499023438)
			elseif L_120_ == 1175 or L_120_ <= 1199 or SelectMonster == "Magma Ninja" or SelectArea == "Ice Fire" then -- Magma Ninja
				Ms = "Magma Ninja"
				NameQuest = "FireSideQuest"
				QuestLv = 1
				NameMon = "Magma Ninja"
				CFrameQ = CFrame.new(- 5429.0473632813, 15.977565765381, - 5297.9614257813)
				CFrameMon = CFrame.new(- 5461.8388671875, 130.36347961426, - 5836.4702148438)
			elseif L_120_ == 1200 or L_120_ <= 1249 or SelectMonster == "Lava Pirate" or SelectArea == "Ice Fire" then -- Lava Pirate
				Ms = "Lava Pirate"
				NameQuest = "FireSideQuest"
				QuestLv = 2
				NameMon = "Lava Pirate"
				CFrameQ = CFrame.new(- 5429.0473632813, 15.977565765381, - 5297.9614257813)
				CFrameMon = CFrame.new(- 5251.1889648438, 55.164535522461, - 4774.4096679688)
			elseif L_120_ == 1250 or L_120_ <= 1274 or SelectMonster == "Ship Deckhand" or SelectArea == "Ship" then -- Ship Deckhand
				Ms = "Ship Deckhand"
				NameQuest = "ShipQuest1"
				QuestLv = 1
				NameMon = "Ship Deckhand"
				CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
				CFrameMon = CFrame.new(921.12365722656, 125.9839553833, 33088.328125)
				if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
				end
			elseif L_120_ == 1275 or L_120_ <= 1299 or SelectMonster == "Ship Engineer" or SelectArea == "Ship" then -- Ship Engineer
				Ms = "Ship Engineer"
				NameQuest = "ShipQuest1"
				QuestLv = 2
				NameMon = "Ship Engineer"
				CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
				CFrameMon = CFrame.new(886.28179931641, 40.47790145874, 32800.83203125)
				if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
				end
			elseif L_120_ == 1300 or L_120_ <= 1324 or SelectMonster == "Ship Steward" or SelectArea == "Ship" then -- Ship Steward
				Ms = "Ship Steward"
				NameQuest = "ShipQuest2"
				QuestLv = 1
				NameMon = "Ship Steward"
				CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
				CFrameMon = CFrame.new(943.85504150391, 129.58183288574, 33444.3671875)
				if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
				end
			elseif L_120_ == 1325 or L_120_ <= 1349 or SelectMonster == "Ship Officer" or SelectArea == "Ship" then -- Ship Officer
				Ms = "Ship Officer"
				NameQuest = "ShipQuest2"
				QuestLv = 2
				NameMon = "Ship Officer"
				CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
				CFrameMon = CFrame.new(955.38458251953, 181.08335876465, 33331.890625)
				if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
				end
			elseif L_120_ == 1350 or L_120_ <= 1374 or SelectMonster == "Arctic Warrior" or SelectArea == "Frost" then -- Arctic Warrior
				Ms = "Arctic Warrior"
				NameQuest = "FrostQuest"
				QuestLv = 1
				NameMon = "Arctic Warrior"
				CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, - 6484.6005859375)
				CFrameMon = CFrame.new(5935.4541015625, 77.26016998291, - 6472.7568359375)
				if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 6508.5581054688, 89.034996032715, - 132.83953857422))
				end
			elseif L_120_ == 1375 or L_120_ <= 1424 or SelectMonster == "Snow Lurker" or SelectArea == "Frost" then -- Snow Lurker
				Ms = "Snow Lurker"
				NameQuest = "FrostQuest"
				QuestLv = 2
				NameMon = "Snow Lurker"
				CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, - 6484.6005859375)
				CFrameMon = CFrame.new(5628.482421875, 57.574996948242, - 6618.3481445313)
			elseif L_120_ == 1425 or L_120_ <= 1449 or SelectMonster == "Sea Soldier" or SelectArea == "Forgotten" then -- Sea Soldier
				Ms = "Sea Soldier"
				NameQuest = "ForgottenQuest"
				QuestLv = 1
				NameMon = "Sea Soldier"
				CFrameQ = CFrame.new(- 3054.5827636719, 236.87213134766, - 10147.790039063)
				CFrameMon = CFrame.new(- 3185.0153808594, 58.789089202881, - 9663.6064453125)
			elseif L_120_ >= 1450 or SelectMonster == "Water Fighter" or SelectArea == "Forgotten" then -- Water Fighter
				Ms = "Water Fighter"
				NameQuest = "ForgottenQuest"
				QuestLv = 2
				NameMon = "Water Fighter"
				CFrameQ = CFrame.new(- 3054.5827636719, 236.87213134766, - 10147.790039063)
				CFrameMon = CFrame.new(- 3262.9301757813, 298.69036865234, - 10552.529296875)
			end
		end
		if Third_Sea then
			if L_120_ == 1500 or L_120_ <= 1524 or SelectMonster == "Pirate Millionaire" or SelectArea == "Pirate Port" then -- Pirate Millionaire
				Ms = "Pirate Millionaire"
				NameQuest = "PiratePortQuest"
				QuestLv = 1
				NameMon = "Pirate Millionaire"
				CFrameQ = CFrame.new(- 289.61752319336, 43.819011688232, 5580.0903320313)
				CFrameMon = CFrame.new(- 435.68109130859, 189.69866943359, 5551.0756835938)
			elseif L_120_ == 1525 or L_120_ <= 1574 or SelectMonster == "Pistol Billionaire" or SelectArea == "Pirate Port" then -- Pistol Billoonaire
				Ms = "Pistol Billionaire"
				NameQuest = "PiratePortQuest"
				QuestLv = 2
				NameMon = "Pistol Billionaire"
				CFrameQ = CFrame.new(- 289.61752319336, 43.819011688232, 5580.0903320313)
				CFrameMon = CFrame.new(- 236.53652954102, 217.46676635742, 6006.0883789063)
			elseif L_120_ == 1575 or L_120_ <= 1599 or SelectMonster == "Dragon Crew Warrior" or SelectArea == "Amazon" then -- Dragon Crew Warrior
				Ms = "Dragon Crew Warrior"
				NameQuest = "AmazonQuest"
				QuestLv = 1
				NameMon = "Dragon Crew Warrior"
				CFrameQ = CFrame.new(5833.1147460938, 51.60498046875, - 1103.0693359375)
				CFrameMon = CFrame.new(6301.9975585938, 104.77153015137, - 1082.6075439453)
			elseif L_120_ == 1600 or L_120_ <= 1624 or SelectMonster == "Dragon Crew Archer" or SelectArea == "Amazon" then -- Dragon Crew Archer
				Ms = "Dragon Crew Archer"
				NameQuest = "AmazonQuest"
				QuestLv = 2
				NameMon = "Dragon Crew Archer"
				CFrameQ = CFrame.new(5833.1147460938, 51.60498046875, - 1103.0693359375)
				CFrameMon = CFrame.new(6831.1171875, 441.76708984375, 446.58615112305)
			elseif L_120_ == 1625 or L_120_ <= 1649 or SelectMonster == "Female Islander" or SelectArea == "Amazon" then -- Female Islander
				Ms = "Female Islander"
				NameQuest = "AmazonQuest2"
				QuestLv = 1
				NameMon = "Female Islander"
				CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
				CFrameMon = CFrame.new(5792.5166015625, 848.14392089844, 1084.1818847656)
			elseif L_120_ == 1650 or L_120_ <= 1699 or SelectMonster == "Giant Islander" or SelectArea == "Amazon" then -- Giant Islander
				Ms = "Giant Islander"
				NameQuest = "AmazonQuest2"
				QuestLv = 2
				NameMon = "Giant Islander"
				CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
				CFrameMon = CFrame.new(5009.5068359375, 664.11071777344, - 40.960144042969)
			elseif L_120_ == 1700 or L_120_ <= 1724 or SelectMonster == "Marine Commodore" or SelectArea == "Marine Tree" then -- Marine Commodore
				Ms = "Marine Commodore"
				NameQuest = "MarineTreeIsland"
				QuestLv = 1
				NameMon = "Marine Commodore"
				CFrameQ = CFrame.new(2179.98828125, 28.731239318848, - 6740.0551757813)
				CFrameMon = CFrame.new(2198.0063476563, 128.71075439453, - 7109.5043945313)
			elseif L_120_ == 1725 or L_120_ <= 1774 or SelectMonster == "Marine Rear Admiral" or SelectArea == "Marine Tree" then -- Marine Rear Admiral
				Ms = "Marine Rear Admiral"
				NameQuest = "MarineTreeIsland"
				QuestLv = 2
				NameMon = "Marine Rear Admiral"
				CFrameQ = CFrame.new(2179.98828125, 28.731239318848, - 6740.0551757813)
				CFrameMon = CFrame.new(3294.3142089844, 385.41125488281, - 7048.6342773438)
			elseif L_120_ == 1775 or L_120_ <= 1799 or SelectMonster == "Fishman Raider" or SelectArea == "Deep Forest" then -- Fishman Raide
				Ms = "Fishman Raider"
				NameQuest = "DeepForestIsland3"
				QuestLv = 1
				NameMon = "Fishman Raider"
				CFrameQ = CFrame.new(- 10582.759765625, 331.78845214844, - 8757.666015625)
				CFrameMon = CFrame.new(- 10553.268554688, 521.38439941406, - 8176.9458007813)
			elseif L_120_ == 1800 or L_120_ <= 1824 or SelectMonster == "Fishman Captain" or SelectArea == "Deep Forest" then -- Fishman Captain
				Ms = "Fishman Captain"
				NameQuest = "DeepForestIsland3"
				QuestLv = 2
				NameMon = "Fishman Captain"
				CFrameQ = CFrame.new(- 10583.099609375, 331.78845214844, - 8759.4638671875)
				CFrameMon = CFrame.new(- 10789.401367188, 427.18637084961, - 9131.4423828125)
			elseif L_120_ == 1825 or L_120_ <= 1849 or SelectMonster == "Forest Pirate" or SelectArea == "Deep Forest" then -- Forest Pirate
				Ms = "Forest Pirate"
				NameQuest = "DeepForestIsland"
				QuestLv = 1
				NameMon = "Forest Pirate"
				CFrameQ = CFrame.new(- 13232.662109375, 332.40396118164, - 7626.4819335938)
				CFrameMon = CFrame.new(- 13489.397460938, 400.30349731445, - 7770.251953125)
			elseif L_120_ == 1850 or L_120_ <= 1899 or SelectMonster == "Mythological Pirate" or SelectArea == "Deep Forest" then -- Mythological Pirate
				Ms = "Mythological Pirate"
				NameQuest = "DeepForestIsland"
				QuestLv = 2
				NameMon = "Mythological Pirate"
				CFrameQ = CFrame.new(- 13232.662109375, 332.40396118164, - 7626.4819335938)
				CFrameMon = CFrame.new(- 13508.616210938, 582.46228027344, - 6985.3037109375)
			elseif L_120_ == 1900 or L_120_ <= 1924 or SelectMonster == "Jungle Pirate" or SelectArea == "Deep Forest" then -- Jungle Pirate
				Ms = "Jungle Pirate"
				NameQuest = "DeepForestIsland2"
				QuestLv = 1
				NameMon = "Jungle Pirate"
				CFrameQ = CFrame.new(- 12682.096679688, 390.88653564453, - 9902.1240234375)
				CFrameMon = CFrame.new(- 12267.103515625, 459.75262451172, - 10277.200195313)
			elseif L_120_ == 1925 or L_120_ <= 1974 or SelectMonster == "Musketeer Pirate" or SelectArea == "Deep Forest" then -- Musketeer Pirate
				Ms = "Musketeer Pirate"
				NameQuest = "DeepForestIsland2"
				QuestLv = 2
				NameMon = "Musketeer Pirate"
				CFrameQ = CFrame.new(- 12682.096679688, 390.88653564453, - 9902.1240234375)
				CFrameMon = CFrame.new(- 13291.5078125, 520.47338867188, - 9904.638671875)
			elseif L_120_ == 1975 or L_120_ <= 1999 or SelectMonster == "Reborn Skeleton" or SelectArea == "Haunted Castle" then
				Ms = "Reborn Skeleton"
				NameQuest = "HauntedQuest1"
				QuestLv = 1
				NameMon = "Reborn Skeleton"
				CFrameQ = CFrame.new(- 9480.80762, 142.130661, 5566.37305, - 0.00655503059, 4.52954225e-08, - 0.999978542, 2.04920472e-08, 1, 4.51620679e-08, 0.999978542, - 2.01955679e-08, - 0.00655503059)
				CFrameMon = CFrame.new(- 8761.77148, 183.431747, 6168.33301, 0.978073597, - 1.3950732e-05, - 0.208259016, - 1.08073925e-06, 1, - 7.20630269e-05, 0.208259016, 7.07080399e-05, 0.978073597)
			elseif L_120_ == 2000 or L_120_ <= 2024 or SelectMonster == "Living Zombie" or SelectArea == "Haunted Castle" then
				Ms = "Living Zombie"
				NameQuest = "HauntedQuest1"
				QuestLv = 2
				NameMon = "Living Zombie"
				CFrameQ = CFrame.new(- 9480.80762, 142.130661, 5566.37305, - 0.00655503059, 4.52954225e-08, - 0.999978542, 2.04920472e-08, 1, 4.51620679e-08, 0.999978542, - 2.01955679e-08, - 0.00655503059)
				CFrameMon = CFrame.new(- 10103.7529, 238.565979, 6179.75977, 0.999474227, 2.77547141e-08, 0.0324240364, - 2.58006327e-08, 1, - 6.06848474e-08, - 0.0324240364, 5.98163865e-08, 0.999474227)
			elseif L_120_ == 2025 or L_120_ <= 2049 or SelectMonster == "Demonic Soul" or SelectArea == "Haunted Castle" then
				Ms = "Demonic Soul"
				NameQuest = "HauntedQuest2"
				QuestLv = 1
				NameMon = "Demonic Soul"
				CFrameQ = CFrame.new(- 9516.9931640625, 178.00651550293, 6078.4653320313)
				CFrameMon = CFrame.new(- 9712.03125, 204.69589233398, 6193.322265625)
			elseif L_120_ == 2050 or L_120_ <= 2074 or SelectMonster == "Posessed Mummy" or SelectArea == "Haunted Castle" then
				Ms = "Posessed Mummy"
				NameQuest = "HauntedQuest2"
				QuestLv = 2
				NameMon = "Posessed Mummy"
				CFrameQ = CFrame.new(- 9516.9931640625, 178.00651550293, 6078.4653320313)
				CFrameMon = CFrame.new(- 9545.7763671875, 69.619895935059, 6339.5615234375)
			elseif L_120_ == 2075 or L_120_ <= 2099 or SelectMonster == "Peanut Scout" or SelectArea == "Nut Island" then
				Ms = "Peanut Scout"
				NameQuest = "NutsIslandQuest"
				QuestLv = 1
				NameMon = "Peanut Scout"
				CFrameQ = CFrame.new(- 2105.53198, 37.2495995, - 10195.5088, - 0.766061664, 0, - 0.642767608, 0, 1, 0, 0.642767608, 0, - 0.766061664)
				CFrameMon = CFrame.new(- 2150.587890625, 122.49767303467, - 10358.994140625)
			elseif L_120_ == 2100 or L_120_ <= 2124 or SelectMonster == "Peanut President" or SelectArea == "Nut Island" then
				Ms = "Peanut President"
				NameQuest = "NutsIslandQuest"
				QuestLv = 2
				NameMon = "Peanut President"
				CFrameQ = CFrame.new(- 2105.53198, 37.2495995, - 10195.5088, - 0.766061664, 0, - 0.642767608, 0, 1, 0, 0.642767608, 0, - 0.766061664)
				CFrameMon = CFrame.new(- 2150.587890625, 122.49767303467, - 10358.994140625)
			elseif L_120_ == 2125 or L_120_ <= 2149 or SelectMonster == "Ice Cream Chef" or SelectArea == "Ice Cream Island" then
				Ms = "Ice Cream Chef"
				NameQuest = "IceCreamIslandQuest"
				QuestLv = 1
				NameMon = "Ice Cream Chef"
				CFrameQ = CFrame.new(- 819.376709, 64.9259796, - 10967.2832, - 0.766061664, 0, 0.642767608, 0, 1, 0, - 0.642767608, 0, - 0.766061664)
				CFrameMon = CFrame.new(- 789.941528, 209.382889, - 11009.9805, - 0.0703101531, 0, - 0.997525156, 0, 1.00000012, 0, 0.997525275, 0, - 0.0703101456)
			elseif L_120_ == 2150 or L_120_ <= 2199 or SelectMonster == "Ice Cream Commander" or SelectArea == "Ice Cream Island" then
				Ms = "Ice Cream Commander"
				NameQuest = "IceCreamIslandQuest"
				QuestLv = 2
				NameMon = "Ice Cream Commander"
				CFrameQ = CFrame.new(- 819.376709, 64.9259796, - 10967.2832, - 0.766061664, 0, 0.642767608, 0, 1, 0, - 0.642767608, 0, - 0.766061664)
				CFrameMon = CFrame.new(- 789.941528, 209.382889, - 11009.9805, - 0.0703101531, 0, - 0.997525156, 0, 1.00000012, 0, 0.997525275, 0, - 0.0703101456)
			elseif L_120_ == 2200 or L_120_ <= 2224 or SelectMonster == "Cookie Crafter" or SelectArea == "Cake Island" then
				Ms = "Cookie Crafter"
				NameQuest = "CakeQuest1"
				QuestLv = 1
				NameMon = "Cookie Crafter"
				CFrameQ = CFrame.new(- 2022.29858, 36.9275894, - 12030.9766, - 0.961273909, 0, - 0.275594592, 0, 1, 0, 0.275594592, 0, - 0.961273909)
				CFrameMon = CFrame.new(- 2321.71216, 36.699482, - 12216.7871, - 0.780074954, 0, 0.625686109, 0, 1, 0, - 0.625686109, 0, - 0.780074954)
			elseif L_120_ == 2225 or L_120_ <= 2249 or SelectMonster == "Cake Guard" or SelectArea == "Cake Island" then
				Ms = "Cake Guard"
				NameQuest = "CakeQuest1"
				QuestLv = 2
				NameMon = "Cake Guard"
				CFrameQ = CFrame.new(- 2022.29858, 36.9275894, - 12030.9766, - 0.961273909, 0, - 0.275594592, 0, 1, 0, 0.275594592, 0, - 0.961273909)
				CFrameMon = CFrame.new(- 1418.11011, 36.6718941, - 12255.7324, 0.0677844882, 0, 0.997700036, 0, 1, 0, - 0.997700036, 0, 0.0677844882)
			elseif L_120_ == 2250 or L_120_ <= 2274 or SelectMonster == "Baking Staff" or SelectArea == "Cake Island" then
				Ms = "Baking Staff"
				NameQuest = "CakeQuest2"
				QuestLv = 1
				NameMon = "Baking Staff"
				CFrameQ = CFrame.new(- 1928.31763, 37.7296638, - 12840.626, 0.951068401, 0, - 0.308980465, 0, 1, 0, 0.308980465, 0, 0.951068401)
				CFrameMon = CFrame.new(- 1980.43848, 36.6716766, - 12983.8418, - 0.254443765, 0, - 0.967087567, 0, 1, 0, 0.967087567, 0, - 0.254443765)
			elseif L_120_ == 2275 or L_120_ <= 2299 or SelectMonster == "Head Baker" or SelectArea == "Cake Island" then
				Ms = "Head Baker"
				NameQuest = "CakeQuest2"
				QuestLv = 2
				NameMon = "Head Baker"
				CFrameQ = CFrame.new(- 1928.31763, 37.7296638, - 12840.626, 0.951068401, 0, - 0.308980465, 0, 1, 0, 0.308980465, 0, 0.951068401)
				CFrameMon = CFrame.new(- 2251.5791, 52.2714615, - 13033.3965, - 0.991971016, 0, - 0.126466095, 0, 1, 0, 0.126466095, 0, - 0.991971016)
			elseif L_120_ == 2300 or L_120_ <= 2324 or SelectMonster == "Cocoa Warrior" or SelectArea == "Choco Island" then
				Ms = "Cocoa Warrior"
				NameQuest = "ChocQuest1"
				QuestLv = 1
				NameMon = "Cocoa Warrior"
				CFrameQ = CFrame.new(231.75, 23.9003029, - 12200.292, -1, 0, 0, 0, 1, 0, 0, 0, -1)
				CFrameMon = CFrame.new(167.978516, 26.2254658, - 12238.874, - 0.939700961, 0, 0.341998369, 0, 1, 0, - 0.341998369, 0, - 0.939700961)
			elseif L_120_ == 2325 or L_120_ <= 2349 or SelectMonster == "Chocolate Bar Battler" or SelectArea == "Choco Island" then
				Ms = "Chocolate Bar Battler"
				NameQuest = "ChocQuest1"
				QuestLv = 2
				NameMon = "Chocolate Bar Battler"
				CFrameQ = CFrame.new(231.75, 23.9003029, - 12200.292, -1, 0, 0, 0, 1, 0, 0, 0, -1)
				CFrameMon = CFrame.new(701.312073, 25.5824986, - 12708.2148, - 0.342042685, 0, - 0.939684391, 0, 1, 0, 0.939684391, 0, - 0.342042685)
			elseif L_120_ == 2350 or L_120_ <= 2374 or SelectMonster == "Sweet Thief" or SelectArea == "Choco Island" then
				Ms = "Sweet Thief"
				NameQuest = "ChocQuest2"
				QuestLv = 1
				NameMon = "Sweet Thief"
				CFrameQ = CFrame.new(151.198242, 23.8907146, - 12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, - 0.906319618, 0, 0.422592998)
				CFrameMon = CFrame.new(- 140.258301, 25.5824986, - 12652.3115, 0.173624337, 0, - 0.984811902, 0, 1, 0, 0.984811902, 0, 0.173624337)
			elseif L_120_ == 2375 or L_120_ <= 2400 or SelectMonster == "Candy Rebel" or SelectArea == "Choco Island" then
				Ms = "Candy Rebel"
				NameQuest = "ChocQuest2"
				QuestLv = 2
				NameMon = "Candy Rebel"
				CFrameQ = CFrame.new(151.198242, 23.8907146, - 12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, - 0.906319618, 0, 0.422592998)
				CFrameMon = CFrame.new(47.9231453, 25.5824986, - 13029.2402, - 0.819156051, 0, - 0.573571265, 0, 1, 0, 0.573571265, 0, - 0.819156051)
			elseif L_120_ == 2400 or L_120_ <= 2424 or SelectMonster == "Candy Pirate" or SelectArea == "Candy Island" then
				Ms = "Candy Pirate"
				NameQuest = "CandyQuest1"
				QuestLv = 1
				NameMon = "Candy Pirate"
				CFrameQ = CFrame.new(- 1149.328, 13.5759039, - 14445.6143, - 0.156446099, 0, - 0.987686574, 0, 1, 0, 0.987686574, 0, - 0.156446099)
				CFrameMon = CFrame.new(- 1437.56348, 17.1481285, - 14385.6934, 0.173624337, 0, - 0.984811902, 0, 1, 0, 0.984811902, 0, 0.173624337)
			elseif L_120_ == 2425 or L_120_ <= 2449 or SelectMonster == "Snow Demon" or SelectArea == "Candy Island" then
				Ms = "Snow Demon"
				NameQuest = "CandyQuest1"
				QuestLv = 2
				NameMon = "Snow Demon"
				CFrameQ = CFrame.new(- 1149.328, 13.5759039, - 14445.6143, - 0.156446099, 0, - 0.987686574, 0, 1, 0, 0.987686574, 0, - 0.156446099)
				CFrameMon = CFrame.new(- 916.222656, 17.1481285, - 14638.8125, 0.866007268, 0, 0.500031412, 0, 1, 0, - 0.500031412, 0, 0.866007268)
			elseif L_120_ == 2450 or L_120_ <= 2474 or SelectMonster == "Isle Outlaw" or SelectArea == "Tiki Outpost" then
				Ms = "Isle Outlaw"
				NameQuest = "TikiQuest1"
				QuestLv = 1
				NameMon = "Isle Outlaw"
				CFrameQ = CFrame.new(- 16549.890625, 55.68635559082031, - 179.91360473632812)
				CFrameMon = CFrame.new(- 16162.8193359375, 11.6863374710083, - 96.45481872558594)
			elseif L_120_ == 2475 or L_120_ <= 2524 or SelectMonster == "Island Boy" or SelectArea == "Tiki Outpost" then
				Ms = "Island Boy"
				NameQuest = "TikiQuest1"
				QuestLv = 2
				NameMon = "Island Boy"
				CFrameQ = CFrame.new(- 16549.890625, 55.68635559082031, - 179.91360473632812)
				CFrameMon = CFrame.new(- 16912.130859375, 11.787443161010742, - 133.0850830078125)
			elseif L_120_ >= 2525 or SelectMonster == "Isle Champion" or SelectArea == "Tiki Outpost" then
				Ms = "Isle Champion"
				NameQuest = "TikiQuest2"
				QuestLv = 2
				NameMon = "Isle Champion"
				CFrameQ = CFrame.new(- 16542.447265625, 55.68632888793945, 1044.41650390625)
				CFrameMon = CFrame.new(- 16848.94140625, 21.68633460998535, 1041.4490966796875)
			end
		end
	end

--// Select Monster
	if First_Sea then
		tableMon = {
			"Bandit",
			"Monkey",
			"Gorilla",
			"Pirate",
			"Brute",
			"Desert Bandit",
			"Desert Officer",
			"Snow Bandit",
			"Snowman",
			"Chief Petty Officer",
			"Sky Bandit",
			"Dark Master",
			"Prisoner",
			"Dangerous Prisoner",
			"Toga Warrior",
			"Gladiator",
			"Military Soldier",
			"Military Spy",
			"Fishman Warrior",
			"Fishman Commando",
			"God.s Guard",
			"Shanda",
			"Royal Squad",
			"Royal Soldier",
			"Galley Pirate",
			"Galley Captain"
		}
	elseif Second_Sea then
		tableMon = {
			"Raider",
			"Mercenary",
			"Swan Pirate",
			"Factory Staff",
			"Marine Lieutenant",
			"Marine Captain",
			"Zombie",
			"Vampire",
			"Snow Trooper",
			"Winter Warrior",
			"Lab Subordinate",
			"Horned Warrior",
			"Magma Ninja",
			"Lava Pirate",
			"Ship Deckhand",
			"Ship Engineer",
			"Ship Steward",
			"Ship Officer",
			"Arctic Warrior",
			"Snow Lurker",
			"Sea Soldier",
			"Water Fighter"
		}
	elseif Third_Sea then
		tableMon = {
			"Pirate Millionaire",
			"Dragon Crew Warrior",
			"Dragon Crew Archer",
			"Female Islander",
			"Giant Islander",
			"Marine Commodore",
			"Marine Rear Admiral",
			"Fishman Raider",
			"Fishman Captain",
			"Forest Pirate",
			"Mythological Pirate",
			"Jungle Pirate",
			"Musketeer Pirate",
			"Reborn Skeleton",
			"Living Zombie",
			"Demonic Soul",
			"Posessed Mummy",
			"Peanut Scout",
			"Peanut President",
			"Ice Cream Chef",
			"Ice Cream Commander",
			"Cookie Crafter",
			"Cake Guard",
			"Baking Staff",
			"Head Baker",
			"Cocoa Warrior",
			"Chocolate Bar Battler",
			"Sweet Thief",
			"Candy Rebel",
			"Candy Pirate",
			"Snow Demon",
			"Isle Outlaw",
			"Island Boy",
			"Isle Champion"
		}
	end

--// Select Island
	if First_Sea then
		AreaList = {
			"Jungle",
			"Buggy",
			"Desert",
			"Snow",
			"Marine",
			"Sky",
			"Prison",
			"Colosseum",
			"Magma",
			"Fishman",
			"Sky Island",
			"Fountain"
		}
	elseif Second_Sea then
		AreaList = {
			"Area 1",
			"Area 2",
			"Zombie",
			"Marine",
			"Snow Mountain",
			"Ice fire",
			"Ship",
			"Frost",
			"Forgotten"
		}
	elseif Third_Sea then
		AreaList = {
			"Pirate Port",
			"Amazon",
			"Marine Tree",
			"Deep Forest",
			"Haunted Castle",
			"Nut Island",
			"Ice Cream Island",
			"Cake Island",
			"Choco Island",
			"Candy Island",
			"Tiki Outpost"
		}
	end

--// Check Boss Quest
	function CheckBossQuest()
		if First_Sea then
			if SelectBoss == "The Gorilla King" then
				BossMon = "The Gorilla King"
				NameBoss = "The Gorrila King"
				NameQuestBoss = "JungleQuest"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$2,000\n7,000 Exp."
				CFrameQBoss = CFrame.new(- 1601.6553955078, 36.85213470459, 153.38809204102)
				CFrameBoss = CFrame.new(- 1088.75977, 8.13463783, - 488.559906, - 0.707134247, 0, 0.707079291, 0, 1, 0, - 0.707079291, 0, - 0.707134247)
			elseif SelectBoss == "Bobby" then
				BossMon = "Bobby"
				NameBoss = "Bobby"
				NameQuestBoss = "BuggyQuest1"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$8,000\n35,000 Exp."
				CFrameQBoss = CFrame.new(- 1140.1761474609, 4.752049446106, 3827.4057617188)
				CFrameBoss = CFrame.new(- 1087.3760986328, 46.949409484863, 4040.1462402344)
			elseif SelectBoss == "The Saw" then
				BossMon = "The Saw"
				NameBoss = "The Saw"
				CFrameBoss = CFrame.new(- 784.89715576172, 72.427383422852, 1603.5822753906)
			elseif SelectBoss == "Yeti" then
				BossMon = "Yeti"
				NameBoss = "Yeti"
				NameQuestBoss = "SnowQuest"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$10,000\n180,000 Exp."
				CFrameQBoss = CFrame.new(1386.8073730469, 87.272789001465, - 1298.3576660156)
				CFrameBoss = CFrame.new(1218.7956542969, 138.01184082031, - 1488.0262451172)
			elseif SelectBoss == "Mob Leader" then
				BossMon = "Mob Leader"
				NameBoss = "Mob Leader"
				CFrameBoss = CFrame.new(- 2844.7307128906, 7.4180502891541, 5356.6723632813)
			elseif SelectBoss == "Vice Admiral" then
				BossMon = "Vice Admiral"
				NameBoss = "Vice Admiral"
				NameQuestBoss = "MarineQuest2"
				QuestLvBoss = 2
				RewardBoss = "Reward:\n$10,000\n180,000 Exp."
				CFrameQBoss = CFrame.new(- 5036.2465820313, 28.677835464478, 4324.56640625)
				CFrameBoss = CFrame.new(- 5006.5454101563, 88.032081604004, 4353.162109375)
			elseif SelectBoss == "Saber Expert" then
				NameBoss = "Saber Expert"
				BossMon = "Saber Expert"
				CFrameBoss = CFrame.new(- 1458.89502, 29.8870335, - 50.633564)
			elseif SelectBoss == "Warden" then
				BossMon = "Warden"
				NameBoss = "Warden"
				NameQuestBoss = "ImpelQuest"
				QuestLvBoss = 1
				RewardBoss = "Reward:\n$6,000\n850,000 Exp."
				CFrameBoss = CFrame.new(5278.04932, 2.15167475, 944.101929, 0.220546961, - 4.49946401e-06, 0.975376427, - 1.95412576e-05, 1, 9.03162072e-06, - 0.975376427, - 2.10519756e-05, 0.220546961)
				CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, - 0.731384635, 0, 0.681965172, 0, 1, 0, - 0.681965172, 0, - 0.731384635)
			elseif SelectBoss == "Chief Warden" then
				BossMon = "Chief Warden"
				NameBoss = "Chief Warden"
				NameQuestBoss = "ImpelQuest"
				QuestLvBoss = 2
				RewardBoss = "Reward:\n$10,000\n1,000,000 Exp."
				CFrameBoss = CFrame.new(5206.92578, 0.997753382, 814.976746, 0.342041343, - 0.00062915677, 0.939684749, 0.00191645394, 0.999998152, - 2.80422337e-05, - 0.939682961, 0.00181045406, 0.342041939)
				CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, - 0.731384635, 0, 0.681965172, 0, 1, 0, - 0.681965172, 0, - 0.731384635)
			elseif SelectBoss == "Swan" then
				BossMon = "Swan"
				NameBoss = "Swan"
				NameQuestBoss = "ImpelQuest"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$15,000\n1,600,000 Exp."
				CFrameBoss = CFrame.new(5325.09619, 7.03906584, 719.570679, - 0.309060812, 0, 0.951042235, 0, 1, 0, - 0.951042235, 0, - 0.309060812)
				CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, - 0.731384635, 0, 0.681965172, 0, 1, 0, - 0.681965172, 0, - 0.731384635)
			elseif SelectBoss == "Magma Admiral" then
				BossMon = "Magma Admiral"
				NameBoss = "Magma Admiral"
				NameQuestBoss = "MagmaQuest"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$15,000\n2,800,000 Exp."
				CFrameQBoss = CFrame.new(- 5314.6220703125, 12.262420654297, 8517.279296875)
				CFrameBoss = CFrame.new(- 5765.8969726563, 82.92064666748, 8718.3046875)
			elseif SelectBoss == "Fishman Lord" then
				BossMon = "Fishman Lord"
				NameBoss = "Fishman Lord"
				NameQuestBoss = "FishmanQuest"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$15,000\n4,000,000 Exp."
				CFrameQBoss = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
				CFrameBoss = CFrame.new(61260.15234375, 30.950881958008, 1193.4329833984)
			elseif SelectBoss == "Wysper" then
				BossMon = "Wysper"
				NameBoss = "Wysper"
				NameQuestBoss = "SkyExp1Quest"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$15,000\n4,800,000 Exp."
				CFrameQBoss = CFrame.new(- 7861.947265625, 5545.517578125, - 379.85974121094)
				CFrameBoss = CFrame.new(- 7866.1333007813, 5576.4311523438, - 546.74816894531)
			elseif SelectBoss == "Thunder God" then
				BossMon = "Thunder God"
				NameBoss = "Thunder God"
				NameQuestBoss = "SkyExp2Quest"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$20,000\n5,800,000 Exp."
				CFrameQBoss = CFrame.new(- 7903.3828125, 5635.9897460938, - 1410.923828125)
				CFrameBoss = CFrame.new(- 7994.984375, 5761.025390625, - 2088.6479492188)
			elseif SelectBoss == "Cyborg" then
				BossMon = "Cyborg"
				NameBoss = "Cyborg"
				NameQuestBoss = "FountainQuest"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$20,000\n7,500,000 Exp."
				CFrameQBoss = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
				CFrameBoss = CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813)
			elseif SelectBoss == "Ice Admiral" then
				BossMon = "Ice Admiral"
				NameBoss = "Ice Admiral"
				CFrameBoss = CFrame.new(1266.08948, 26.1757946, - 1399.57678, - 0.573599219, 0, - 0.81913656, 0, 1, 0, 0.81913656, 0, - 0.573599219)
			elseif SelectBoss == "Greybeard" then
				BossMon = "Greybeard"
				NameBoss = "Greybeard"
				CFrameBoss = CFrame.new(- 5081.3452148438, 85.221641540527, 4257.3588867188)
			end
		end
		if Second_Sea then
			if SelectBoss == "Diamond" then
				BossMon = "Diamond"
				NameBoss = "Diamond"
				NameQuestBoss = "Area1Quest"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$25,000\n9,000,000 Exp."
				CFrameQBoss = CFrame.new(- 427.5666809082, 73.313781738281, 1835.4208984375)
				CFrameBoss = CFrame.new(- 1576.7166748047, 198.59265136719, 13.724286079407)
			elseif SelectBoss == "Jeremy" then
				BossMon = "Jeremy"
				NameBoss = "Jeremy"
				NameQuestBoss = "Area2Quest"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$25,000\n11,500,000 Exp."
				CFrameQBoss = CFrame.new(636.79943847656, 73.413787841797, 918.00415039063)
				CFrameBoss = CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109)
			elseif SelectBoss == "Fajita" then
				BossMon = "Fajita"
				NameBoss = "Fajita"
				NameQuestBoss = "MarineQuest3"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$25,000\n15,000,000 Exp."
				CFrameQBoss = CFrame.new(- 2441.986328125, 73.359344482422, - 3217.5324707031)
				CFrameBoss = CFrame.new(- 2172.7399902344, 103.32216644287, - 4015.025390625)
			elseif SelectBoss == "Don Swan" then
				BossMon = "Don Swan"
				NameBoss = "Don Swan"
				CFrameBoss = CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875)
			elseif SelectBoss == "Smoke Admiral" then
				BossMon = "Smoke Admiral"
				NameBoss = "Smoke Admiral"
				NameQuestBoss = "IceSideQuest"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$20,000\n25,000,000 Exp."
				CFrameQBoss = CFrame.new(- 5429.0473632813, 15.977565765381, - 5297.9614257813)
				CFrameBoss = CFrame.new(- 5275.1987304688, 20.757257461548, - 5260.6669921875)
			elseif SelectBoss == "Awakened Ice Admiral" then
				BossMon = "Awakened Ice Admiral"
				NameBoss = "Awakened Ice Admiral"
				NameQuestBoss = "FrostQuest"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$20,000\n36,000,000 Exp."
				CFrameQBoss = CFrame.new(5668.9780273438, 28.519989013672, - 6483.3520507813)
				CFrameBoss = CFrame.new(6403.5439453125, 340.29766845703, - 6894.5595703125)
			elseif SelectBoss == "Tide Keeper" then
				BossMon = "Tide Keeper"
				NameBoss = "Tide Keeper"
				NameQuestBoss = "ForgottenQuest"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$12,500\n38,000,000 Exp."
				CFrameQBoss = CFrame.new(- 3053.9814453125, 237.18954467773, - 10145.0390625)
				CFrameBoss = CFrame.new(- 3795.6423339844, 105.88877105713, - 11421.307617188)
			elseif SelectBoss == "Darkbeard" then
				BossMon = "Darkbeard"
				NameBoss = "Darkbeard"
				CFrameMon = CFrame.new(3677.08203125, 62.751937866211, - 3144.8332519531)
			elseif SelectBoss == "Cursed Captain" then
				BossMon = "Cursed Captain"
				NameBoss = "Cursed Captain"
				CFrameBoss = CFrame.new(916.928589, 181.092773, 33422)
			elseif SelectBoss == "Order" then
				BossMon = "Order"
				NameBoss = "Order"
				CFrameBoss = CFrame.new(- 6217.2021484375, 28.047645568848, - 5053.1357421875)
			end
		end
		if Third_Sea then
			if SelectBoss == "Stone" then
				BossMon = "Stone"
				NameBoss = "Stone"
				NameQuestBoss = "PiratePortQuest"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$25,000\n40,000,000 Exp."
				CFrameQBoss = CFrame.new(- 289.76705932617, 43.819011688232, 5579.9384765625)
				CFrameBoss = CFrame.new(- 1027.6512451172, 92.404174804688, 6578.8530273438)
			elseif SelectBoss == "Island Empress" then
				BossMon = "Island Empress"
				NameBoss = "Island Empress"
				NameQuestBoss = "AmazonQuest2"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$30,000\n52,000,000 Exp."
				CFrameQBoss = CFrame.new(5445.9541015625, 601.62945556641, 751.43792724609)
				CFrameBoss = CFrame.new(5543.86328125, 668.97399902344, 199.0341796875)
			elseif SelectBoss == "Kilo Admiral" then
				BossMon = "Kilo Admiral"
				NameBoss = "Kilo Admiral"
				NameQuestBoss = "MarineTreeIsland"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$35,000\n56,000,000 Exp."
				CFrameQBoss = CFrame.new(2179.3010253906, 28.731239318848, - 6739.9741210938)
				CFrameBoss = CFrame.new(2764.2233886719, 432.46154785156, - 7144.4580078125)
			elseif SelectBoss == "Captain Elephant" then
				BossMon = "Captain Elephant"
				NameBoss = "Captain Elephant"
				NameQuestBoss = "DeepForestIsland"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$40,000\n67,000,000 Exp."
				CFrameQBoss = CFrame.new(- 13232.682617188, 332.40396118164, - 7626.01171875)
				CFrameBoss = CFrame.new(- 13376.7578125, 433.28689575195, - 8071.392578125)
			elseif SelectBoss == "Beautiful Pirate" then
				BossMon = "Beautiful Pirate"
				NameBoss = "Beautiful Pirate"
				NameQuestBoss = "DeepForestIsland2"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$50,000\n70,000,000 Exp."
				CFrameQBoss = CFrame.new(- 12682.096679688, 390.88653564453, - 9902.1240234375)
				CFrameBoss = CFrame.new(5283.609375, 22.56223487854, - 110.78285217285)
			elseif SelectBoss == "Cake Queen" then
				BossMon = "Cake Queen"
				NameBoss = "Cake Queen"
				NameQuestBoss = "IceCreamIslandQuest"
				QuestLvBoss = 3
				RewardBoss = "Reward:\n$30,000\n112,500,000 Exp."
				CFrameQBoss = CFrame.new(- 819.376709, 64.9259796, - 10967.2832, - 0.766061664, 0, 0.642767608, 0, 1, 0, - 0.642767608, 0, - 0.766061664)
				CFrameBoss = CFrame.new(- 678.648804, 381.353943, - 11114.2012, - 0.908641815, 0.00149294338, 0.41757378, 0.00837114919, 0.999857843, 0.0146408929, - 0.417492568, 0.0167988986, - 0.90852499)
			elseif SelectBoss == "Longma" then
				BossMon = "Longma"
				NameBoss = "Longma"
				CFrameBoss = CFrame.new(- 10238.875976563, 389.7912902832, - 9549.7939453125)
			elseif SelectBoss == "Soul Reaper" then
				BossMon = "Soul Reaper"
				NameBoss = "Soul Reaper"
				CFrameBoss = CFrame.new(- 9524.7890625, 315.80429077148, 6655.7192382813)
			elseif SelectBoss == "rip_indra True Form" then
				BossMon = "rip_indra True Form"
				NameBoss = "rip_indra True Form"
				CFrameBoss = CFrame.new(- 5415.3920898438, 505.74133300781, - 2814.0166015625)
			end
		end
	end

-- tween
	function Tween(L_255_arg0)
		Distance = (L_255_arg0.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
		if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
			game.Players.LocalPlayer.Character.Humanoid.Sit = false
		end
		pcall(function()
			tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Distance / 300, Enum.EasingStyle.Linear), {
				CFrame = L_255_arg0
			})
		end)
		tween:Play()
		if Distance <= 300 then
			tween:Cancel()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = L_255_arg0
		end
		if _G.StopTween == true then
			tween:Cancel()
			_G.Clip = false
		end
	print("tween")
	end
  
-- atack no cd 
	local L_88_ = game.Players.LocalPlayer
	local L_89_ = getupvalues(require(L_88_.PlayerScripts.CombatFramework))
	local L_90_ = L_89_[2]
	function GetCurrentBlade()
		local L_282_ = L_90_.activeController
		local L_283_ = L_282_.blades[1]
		if not L_283_ then
			return
		end
		while L_283_.Parent ~= game.Players.LocalPlayer.Character do
			L_283_ = L_283_.Parent
		end
		return L_283_
	end
	function AttackNoCD()
		if not AutoFarmMasDevilFruit or AutoFarmMasGun then
			if not Auto_Raid then
				local L_284_ = L_90_.activeController
				for L_285_forvar0 = 1, 1 do
					local L_286_ = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
                        L_88_.Character, {
						L_88_.Character.HumanoidRootPart
					}, 60)
					local L_287_ = {}
					local L_288_ = {}
					for L_289_forvar0, L_290_forvar1 in pairs(L_286_) do
						if L_290_forvar1.Parent:FindFirstChild("HumanoidRootPart") and not L_288_[L_290_forvar1.Parent] then
							table.insert(L_287_, L_290_forvar1.Parent.HumanoidRootPart)
							L_288_[L_290_forvar1.Parent] = true
						end
					end
					L_286_ = L_287_
					if # L_286_ > 0 then
						local L_291_ = debug.getupvalue(L_284_.attack, 5)
						local L_292_ = debug.getupvalue(L_284_.attack, 6)
						local L_293_ = debug.getupvalue(L_284_.attack, 4)
						local L_294_ = debug.getupvalue(L_284_.attack, 7)
						local L_295_ = (L_291_ * 798405 + L_293_ * 727595) % L_292_
						local L_296_ = L_293_ * 798405
						(function()
							L_295_ = (L_295_ * L_292_ + L_296_) % 1099511627776
							L_291_ = math.floor(L_295_ / L_292_)
							L_293_ = L_295_ - L_291_ * L_292_
						end)()
						L_294_ = L_294_ + 1
						debug.setupvalue(L_284_.attack, 5, L_291_)
						debug.setupvalue(L_284_.attack, 6, L_292_)
						debug.setupvalue(L_284_.attack, 4, L_293_)
						debug.setupvalue(L_284_.attack, 7, L_294_)
						pcall(function()
							if L_88_.Character:FindFirstChildOfClass("Tool") and L_284_.blades and L_284_.blades[1] then
								L_284_.animator.anims.basic[1]:Play(0.01, 0.01, 0.01)
								game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange", tostring(GetCurrentBlade()))
								game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(L_295_ / 1099511627776 * 16777215), L_294_)
								game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", L_286_, L_285_forvar0, "")
							end
						end)
					end
				end
			end
		end
    print("nocd")
	end

-- bringmob

_G.BringNormal = true

spawn(function()
	while task.wait() do
		pcall(function()
			if _G.BringNormal and BringMobFarmGuitar then
				for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
					PositionMon = 750
					if not string.find(v.Name,"Boss") and (v.HumanoidRootPart.Position - PosMon.Position).magnitude <= PositionMon then
						if InMyNetWork2(v.HumanoidRootPart) then
							v.HumanoidRootPart.CFrame = PosMon
							v.Humanoid.JumpPower = 0
							v.Humanoid.WalkSpeed = 0
							v.HumanoidRootPart.Size = Vector3.new(60,60,60)
							v.HumanoidRootPart.Transparency = 1
							v.HumanoidRootPart.CanCollide = false
							v.Head.CanCollide = false
							if v.Humanoid:FindFirstChild("Animator") then
								v.Humanoid.Animator:Destroy()
							end
							v.Humanoid:ChangeState(11)
							v.Humanoid:ChangeState(14)
							sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
						end
					end
				end
			end
		end)
	end
end)

-- auto haki
	function AutoHaki()
		if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
		end
	end

-- fast atack delay

		if _G.Attackmode == "Fast" then
			_G.Fast_Delay = 0.10
		elseif _G.Attackmode == "Normal" then
			_G.Fast_Delay = 0.25
		elseif _G.Attackmode == "SuperFast" then
			_G.Fast_Delay = 0.02
		end

-- use melee
function EquipWeapon(ToolSe)
	if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
		local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
		wait(.4)
		game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
	end
end
					
-- level
	spawn(function()
		while task.wait() do
			if _G.AutoLevel then
				pcall(function()
					CheckLevel()
					if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
						if BypassTP then
							if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQ.Position).Magnitude > 2500 then
								BTP(CFrameQ)
							elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQ.Position).Magnitude < 2500 then
								Tween(CFrameQ)
							end
						else
							Tween(CFrameQ)
						end
						if (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
						end
					elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
						for L_316_forvar0, L_317_forvar1 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if L_317_forvar1:FindFirstChild("Humanoid") and L_317_forvar1:FindFirstChild("HumanoidRootPart") and L_317_forvar1.Humanoid.Health > 0 then
								if L_317_forvar1.Name == Ms then
									if level <= 2550 then
                                        repeat
										    wait(_G.Fast_Delay)
										    AttackNoCD()
										    bringmob = true
										    AutoHaki()
                                            Top.Text = "Auto Farm: Farming"
									    	EquipTool(Melee)
									    	Tween(L_317_forvar1.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
										    L_317_forvar1.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
										    L_317_forvar1.HumanoidRootPart.Transparency = 1
										    L_317_forvar1.Humanoid.JumpPower = 0
									    	L_317_forvar1.Humanoid.WalkSpeed = 0
									     	L_317_forvar1.HumanoidRootPart.CanCollide = false
										    FarmPos = L_317_forvar1.HumanoidRootPart.CFrame
									    	MonFarm = L_317_forvar1.Name
          --Click
									    until not _G.AutoLevel or not L_317_forvar1.Parent or L_317_forvar1.Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(L_317_forvar1.Name) or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
									    bringmob = false
                                    elseif level == 2550 and _G.Katakurimax then
                                        spawn(function()
                                            while wait() do
                                                    pcall(function()
                                                        local L_371_ = CFrame.new(- 2142.66821, 71.2588654, - 12327.4619, 0.996939838, - 4.33107843e-08, 0.078172572, 4.20252917e-08, 1, 1.80894251e-08, - 0.078172572, - 1.47488439e-08, 0.996939838)
                                                        if BypassTP then
                                                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - L_371_.Position).Magnitude > 2000 then
                                                                BTP(L_371_)
                                                                wait(3)
                                                            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - L_371_.Position).Magnitude < 2000 then
                                                                Tween(L_371_)
                                                            end
                                                        end
                                                        if game.ReplicatedStorage:FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                                                            if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                                                                for L_372_forvar0, L_373_forvar1 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                                                    if L_373_forvar1.Name == "Cake Prince" then
                                                                        repeat
                                                                            wait(_G.Fast_Delay)
                                                                            AttackNoCD()
                                                                            AutoHaki()
                                                                            EquipTool(Melee)
                                                                            L_373_forvar1.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                                                                            L_373_forvar1.HumanoidRootPart.CanCollide = false
                                                                            Tween(L_373_forvar1.HumanoidRootPart.CFrame * Pos)
                                                                        --Click
                                                                        until _G.CakePrince == false or not L_373_forvar1.Parent or L_373_forvar1.Humanoid.Health <= 0
                                                                        bringmob = false
                                                                    end
                                                                end
                                                            else
                                                                Tween(CFrame.new(- 2009.2802734375, 4532.97216796875, - 14937.3076171875))
                                                            end
                                                        else
                                                            if game.Workspace.Enemies:FindFirstChild("Baking Staff") or game.Workspace.Enemies:FindFirstChild("Head Baker") or game.Workspace.Enemies:FindFirstChild("Cake Guard") or game.Workspace.Enemies:FindFirstChild("Cookie Crafter") then
                                                                for L_374_forvar0, L_375_forvar1 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                                                    if (L_375_forvar1.Name == "Baking Staff" or L_375_forvar1.Name == "Head Baker" or L_375_forvar1.Name == "Cake Guard" or L_375_forvar1.Name == "Cookie Crafter") and L_375_forvar1.Humanoid.Health > 0 then
                                                                        repeat
                                                                            wait(_G.Fast_Delay)
                                                                            AttackNoCD()
                                                                            AutoHaki()
                                                                            bringmob = true
                                                                            EquipTool(SelectWeapon)
                                                                            L_375_forvar1.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                                                                            FarmPos = L_375_forvar1.HumanoidRootPart.CFrame
                                                                            MonFarm = L_375_forvar1.Name
                                                                            Tween(L_375_forvar1.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                                                                        until _G.CakePrince == false or game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") or not L_375_forvar1.Parent or L_375_forvar1.Humanoid.Health <= 0
                                                                        bringmob = false
                                                                    end
                                                                end
                                                            else
                                                                Tween(L_371_)
                                                            end
                                                        end
                                                    end)
                                            end
                                        end)
                                    end
								end
							end
						end
						for L_318_forvar0, L_319_forvar1 in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
							if string.find(L_319_forvar1.Name, NameMon) then
								if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - L_319_forvar1.Position).Magnitude >= 10 then
									Tween(L_319_forvar1.CFrame * CFrame.new(posX, posY, posZ))
								end
							end
						end
					end
				end)
			end
		end
	end)



-- 2x xp
function UseCode(Text) -- theres no button.
    game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Text)
end

local usexp = coroutine.create(function()
    while _G.use2x do
        if L_120_ == 1 or L_120_ <= 399 then
            UseCode("minus400")
        elseif L_120_ == 400 or L_120_ <= 424 then
            UseCode("Enyu_is_Pro")
        elseif L_120_ == 700 or L_120_ <= 724 then
            UseCode("Magicbus")
            UseCode("JCWK")
        elseif L_120_ == 1000 or L_120_ <= 1024 then
            UseCode("Starcodeheo")
            UseCode("Bluxxy")
        elseif L_120_ == 1500 or L_120_ <= 1524 then
            UseCode("Sub2OfficialNoobie")
            UseCode("SUB2GAMERROBOT_EXP1")
        elseif L_120_ == 1900 or L_120_ <= 1924 then
            UseCode("THEGREATACE")
            UseCode("SUB2NOOBMASTER123")
            UseCode("Sub2CaptainMaui")
        elseif L_120_ == 2200 or L_120_ <= 2225 then
            UseCode("Axiore")
            UseCode("Sub2CaptainMaui")
        elseif L_120_ == 2400 or L_120_ <= 2424 then
            UseCode("TantaiGaming")
            UseCode("STRAWHATMAINE")
        elseif L_120_ == 2500 or L_120_ <= 2524 then
            UseCode("Sub2Daigrock")
            UseCode("DEVSCOOKING")
        end
    end
end)

coroutine.resume(usexp)

-- [Auto Buy Items]
spawn(function() -- Melee
    while wait(.5) do
        if _G.buymelee and game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
                local args = {
                    [1] = "BuyBlackLeg"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                Under.Text = Under.Text.. "| Black Leg 400"
            end   
            if game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                SelectToolWeapon = "Superhuman"
            end  
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 400 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                SelectToolWeapon = "Black Leg"
            end
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                SelectToolWeapon = "Electro"
            end
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 400 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                SelectToolWeapon = "Fishman Karate"
            end
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 400 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                SelectToolWeapon = "Dragon Claw"
            end
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 400 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                local args = {
                    [1] = "BuyElectro"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and uiestilo1 then
                   Under.Text = Under.Text.. "|  400"
                   local uiestilo1 = false 
                end
            end
            if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 400 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                local args = {
                    [1] = "BuyElectro"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and uiestilo2 then
                   Under.Text = Under.Text.. "|  400"
                   local uiestilo2 = false 
                end
            end
            
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                local args = {
                    [1] = "BuyFishmanKarate"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and uiestilo1 then
                   Under.Text = Under.Text.. "| Fishman Karate 400"
                   local uiestilo3 = false 
                end
            end
            if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                local args = {
                    [1] = "BuyFishmanKarate"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and uiestilo4 == true then
					Under.Text = Under.Text.. "| Fishman Karate 400"
					local uiestilo4 = false 
				end
            end
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 400 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                local args = {
                    [1] = "BlackbeardReward",
                    [2] = "DragonClaw",
                    [3] = "2"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and uiestilo5 then
					Under.Text = Under.Text.. "| Dragon Claw 400"
					local uiestilo5 = false 
				end
            end
            if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 400 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                local args = {
                    [1] = "BlackbeardReward",
                    [2] = "DragonClaw",
                    [3] = "2"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and uiestilo16 then
					Under.Text = Under.Text.. "| Dragon Claw 400"
					local uiestilo6 = false 
				end
            end
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 400 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                local args = {
                    [1] = "BuySuperhuman"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") and uiestilo7 then
					Under.Text = Under.Text.. "| Superhuman 400"
					local uiestilo7 = false 
				end
            end
            if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 400 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                local args = {
                    [1] = "BuySuperhuman"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") and uiestilo8 then
					Under.Text = Under.Text.. "| Superhuman 400"
					local uiestilo8 = false 
				end
            end 
        end
    end
end)

-- kaitun stats

spawn(function() -- only for sea 1, co the se lam cho sea 2 va 3 vi tui thay great tree ma nang moi melee la chet.
    while wait() do
        if _G.StatsKaitun then
            if game:GetService("Players").LocalPlayer.Data.Stats.Melee.Level.Value < 2550 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Melee")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Defense")
            else
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Sword")			
            end
        end
    end
end)

-- no stun 

if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
	game.Players.LocalPlayer.Character.Stun.Changed:connect(function()
		pcall(function()
			if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
				game.Players.LocalPlayer.Character.Stun.Value = 0
			end
		end)
	end)
end

--select weapon
  
  ChooseWeapon = Melee
	task.spawn(function()
		while wait() do
			pcall(function()
				if ChooseWeapon == "Melee" then
					for L_307_forvar0 , L_308_forvar1 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
						if L_308_forvar1.ToolTip == "Melee" then
							if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(L_308_forvar1.Name)) then
								SelectWeapon = L_308_forvar1.Name
							end
						end
					end
				elseif ChooseWeapon == "Sword" then
					for L_309_forvar0 , L_310_forvar1 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
						if L_310_forvar1.ToolTip == "Sword" then
							if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(L_310_forvar1.Name)) then
								SelectWeapon = L_310_forvar1.Name
							end
						end
					end
				elseif ChooseWeapon == " Blox Fruit" then
					for L_311_forvar0 , L_312_forvar1 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
						if L_312_forvar1.ToolTip == "Blox Fruit" then
							if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(L_312_forvar1.Name)) then
								SelectWeapon = L_312_forvar1.Name
							end
						end
					end
				else
					for L_313_forvar0 , L_314_forvar1 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
						if L_314_forvar1.ToolTip == "Melee" then
							if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(L_314_forvar1.Name)) then
								SelectWeapon = L_314_forvar1.Name
							end
						end
					end
				end
			end)
		end
	end)
	
-- bringmob

task.spawn(function()
	while true do wait()
		if setscriptable then
			setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
		end
		if sethiddenproperty then
			sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
		end
	end
end)

spawn(function()
    while wait() do
        pcall(function()
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if _G.BringMob and bringmob then
                    if v.Name == MonFarm and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        if v.Name == "Factory Staff" then
                            if (v.HumanoidRootPart.Position - FarmPos.Position).Magnitude <= 250 then
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                v.HumanoidRootPart.CFrame = FarmPos
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                            end
                        elseif v.Name == MonFarm then
                            if (v.HumanoidRootPart.Position - FarmPos.Position).Magnitude <= 250 then
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                v.HumanoidRootPart.CFrame = FarmPos
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                    end
                end
            end
        end)
     end
end)
--[[
    task.spawn(function()
        while task.wait() do
     if _G.BringMob and bringmob then
    pcall(function()
        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
        if v.Name == MonFarm and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 250 then
        if InMyNetWork(v.HumanoidRootPart) then
        v.HumanoidRootPart.CFrame = FarmPos
        v.Humanoid.JumpPower = 0
        v.Humanoid.WalkSpeed = 0
        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
        v.HumanoidRootPart.CanCollide = false
        v.Head.CanCollide = false
        end
        end
        end
        end)
      end
      end
      end)
            task.spawn(function()
              while true do wait()
              if setscriptable then
              setscriptable(game.Players.LocalPlayer,"SimulationRadius",true)
              end
              if sethiddenproperty then
              sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
              end
              end
              end)
            
            function InMyNetWork(object)
            if isnetworkowner then
            return isnetworkowner(object)
            else
              if (object.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 250 then
            return true
            end
            return false
            end
            end
     ]]
-- fruit random

spawn(function()
    pcall(function()
        while wait(.1) do
            if _G.Random_Auto then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
            end 
        end
    end)
end)

-- store fruit

spawn(function()
    while task.wait() do
        if _G.AutoStoreFruit then
            pcall(function()
                if _G.AutoStoreFruit then
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bomb Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Bomb-Bomb",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spike Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spike-Spike",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Chop Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Chop-Chop",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spring Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spring-Spring",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rocket Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kilo Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Rocket-Rocket",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kilo Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Smoke Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Smoke-Smoke",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spin Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spin-Spin",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flame Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Flame-Flame",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Falcon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Falcon Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Bird-Bird: Falcon",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Falcon Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ice Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Ice-Ice",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sand Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Sand-Sand",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dark Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Dark-Dark",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ghost Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Revive Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Ghost-Ghost",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Revive Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Diamond Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Diamond-Diamond",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Light Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Light-Light",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Love Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Love-Love",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rubber Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Rubber-Rubber",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Barrier Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Barrier-Barrier",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Magma Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Magma-Magma",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Portal Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Door Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Door-Door",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Portal Fruit"))
                    end

                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Quake Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Quake-Quake",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Human-Human: Buddha Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Human-Human: Buddha",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Human-Human: Buddha Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spider Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spider Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spider-Spider",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spider Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Phoenix Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Phoenix Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Bird-Bird: Phoenix",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Phoenix Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rumble Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Rumble-Rumble",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Pain Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Paw Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Pain-Pain",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Paw Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Gravity Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Gravity-Gravity",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dough Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Dough-Dough",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Shadow Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Shadow-Shadow",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Venom-Venom",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Control Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Control-Control",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spirit Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Soul Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Soul-Soul",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spirit Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Dragon-Dragon",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit"))
					end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Leopard Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Leopard Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Leopard-Leopard",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Leopard Fruit"))
                    end
                    if game:GetService("Platers").LocalPlayer.Character:FindFirstChild("Kitsune Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kitsune Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Kitsune-Kitsune",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kitsune Fruit"))
                    end
                end
            end)
        end
        wait(0.3)
    end
end)

        
-- webhook

-- yeah , nothing here

-- lv 700

    spawn(function()
        while wait(.1) do
            if _G.sea2quest then
                local L_120_ = game.Players.LocalPlayer.Data.Level.Value
                if L_120_ >= 700 and First_Sea then
                    _G.AutoLevel = false
                    Under.Text = "Task: Second Sea Quest"
                    if game.Workspace.Map.Ice.Door.CanCollide == true and game.Workspace.Map.Ice.Door.Transparency == 0 then
                        TP2(CFrame.new(4851.8720703125, 5.6514348983765, 718.47094726563))
                        wait(.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")
                        EquipWeapon("Key")
                        TP2(CFrame.new(1347.7124, 37.3751602, -1325.6488))
                        wait(3)
                    elseif game.Workspace.Map.Ice.Door.CanCollide == false and game.Workspace.Map.Ice.Door.Transparency == 1 then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Ice Admiral [Lv. 700] [Boss]") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Ice Admiral [Lv. 700] [Boss]" and v.Humanoid.Health > 0 then
                                    repeat game:GetService("RunService").Heartbeat:wait()
                                        pcall(function()
                                            EquipWeapon(SelectToolWeapon)
                                            TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 10))
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                            v.HumanoidRootPart.Transparency = .8
                                            game:GetService("VirtualUser"):CaptureController()
                                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 870),workspace.CurrentCamera.CFrame)
                                        end)
                                    until v.Humanoid.Health <= 0 or not v.Parent
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                                end
                            end
                        else
                            TP2(CFrame.new(1347.7124, 37.3751602, -1325.6488))
                        end
                    else
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                    end
                end
            end
        end
    end)
    
--No CLip Auto Farm
	spawn(function()
		pcall(function()
			game:GetService("RunService").Stepped:Connect(function()
				if _G.AutoLevel then
					for L_277_forvar0, L_278_forvar1 in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
						if L_278_forvar1:IsA("BasePart") then
							L_278_forvar1.CanCollide = false
						end
					end
				end
			end)
		end)
	end)
	
-- [Body Gyro]
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.TeleportIsland or _G.AutoEvoRace or AutoFarmChest or _G.chestsea2 or _G.chestsea3 or _G.CastleRaid or _G.CollectAzure or _G.TweenToKitsune or _G.AutoCandy or _G.GhostShip or _G.Ship or _G.SailBoat or _G.Auto_Holy_Torch or _G.FindMirageIsland or _G.TeleportPly or _G.Tweenfruit or _G.AutoFishCrew or _G.AutoShark or _G.AutoCakeV2 or _G.AutoMysticIsland or _G.AutoQuestRace or _G.AutoBuyBoat or _G.dao or _G.AutoMirage or AutoFarmAcient or _G.AutoQuestRace or Auto_Law or _G.AutoAllBoss or AutoTushita or _G.AutoHolyTorch or _G.AutoTerrorshark or _G.farmpiranya or _G.DriveMytic or _G.AutoCakeV2V2 or PirateShip or _G.AutoSeaBeast or _G.AutoNear or _G.BossRaid or _G.GrabChest or AutoCitizen or _G.Ectoplasm or AutoEvoRace or AutoBartilo or AutoFactory or BringChestz or BringFruitz or _G.AutoLevel or _G.Clip2 or AutoFarmNoQuest or _G.AutoBone or AutoFarmSelectMonsterQuest or AutoFarmSelectMonsterNoQuest or _G.AutoBoss or AutoFarmBossQuest or AutoFarmMasGun or AutoFarmMasDevilFruit or AutoFarmSelectArea or AutoSecondSea or AutoThirdSea or AutoDeathStep or AutoSuperhuman or AutoSharkman or AutoElectricClaw or AutoDragonTalon or AutoGodhuman or AutoRengoku or AutoBuddySword or AutoPole or AutoHallowSycthe or AutoCavander or AutoTushita or AutoDarkDagger or _G.CakePrince or _G.AutoElite or AutoRainbowHaki or AutoSaber or AutoFarmKen or AutoKenHop or AutoKenV2 or _G.AutoKillPlayerMelee or _G.AutoKillPlayerGun or _G.AutoKillPlayerFruit or AutoDungeon or AutoNextIsland or AutoAdvanceDungeon or Musketeer or RipIndra or Auto_Serpent_Bow or AutoTorch or AutoSoulGuitar or Auto_Cursed_Dual_Katana or _G.AutoMaterial or Auto_Quest_Yama_1 or Auto_Quest_Yama_2 or Auto_Quest_Yama_3 or Auto_Quest_Tushita_1 or Auto_Quest_Tushita_2 or Auto_Quest_Tushita_3 or _G.Factory or _G.SwanGlasses or AutoBartilo or AutoEvoRace or _G.Ectoplasm then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000,100000,100000)
                    Noclip.Velocity = Vector3.new(0,0,0)
                end
            else
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
            end
        end)
    end
end)


--No CLip Auto Farm
spawn(function()
  pcall(function()
    game:GetService("RunService").Stepped:Connect(function()
      if _G.Autolevel or _G.sea2quest or _G.BringMob or _G.Autosaber or _G.Autosoulguitar then
      for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
      if v:IsA("BasePart") then
      v.CanCollide = false
      end
      end
      end
      end)
    end)
  end)

--Flag Player
	function AntiBan()
		for L_116_forvar0, L_117_forvar1 in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
			if L_117_forvar1:IsA("LocalScript") then
				if L_117_forvar1.Name == "General" or L_117_forvar1.Name == "Shiftlock" or L_117_forvar1.Name == "FallDamage" or L_117_forvar1.Name == "4444" or L_117_forvar1.Name == "CamBob" or L_117_forvar1.Name == "JumpCD" or L_117_forvar1.Name == "Looking" or L_117_forvar1.Name == "Run" then
					L_117_forvar1:Destroy()
				end
			end
		end
		for L_118_forvar0, L_119_forvar1 in pairs(game:GetService("Players").LocalPlayer.PlayerScripts:GetDescendants()) do
			if L_119_forvar1:IsA("LocalScript") then
				if L_119_forvar1.Name == "RobloxMotor6DBugFix" or L_119_forvar1.Name == "Clans" or L_119_forvar1.Name == "Codes" or L_119_forvar1.Name == "CustomForceField" or L_119_forvar1.Name == "MenuBloodSp" or L_119_forvar1.Name == "PlayerList" then
					L_119_forvar1:Destroy()
				end
			end
		end
	end
	AntiBan()
-- Saber
spawn(function()
	while task.wait() do
		pcall(function()
			if _G.AutoLevel and _G.Autosaber and game.Players.LocalPlayer.Data.Level.Value >= 200 and Check_Sword("Saber") == nil and Third_Sea then
				_G.AutoLevel = false
				Level_SD:Set("Stats : Saber")
                Under.Text = "Task: Saber"
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
				if game:GetService("Workspace").Map.Jungle.Final.Part.Transparency == 0 then
					if game:GetService("Workspace").Map.Jungle.QuestPlates.Door.Transparency == 0 then
						if (CFrame.new(-1480.06018, 47.9773636, 4.53454018, -0.386713833, 1.11673025e-07, 0.922199786, 7.96717785e-08, 1, -8.76847395e-08, -0.922199786, 3.95643944e-08, -0.386713833).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
							toposition(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
							task.wait(1)
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate1.Button.CFrame
							task.wait(1)
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate2.Button.CFrame
							task.wait(1)
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate3.Button.CFrame
							task.wait(1)
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate4.Button.CFrame
							task.wait(1)
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate5.Button.CFrame
							task.wait(1) 
						end
					local CFrameSaber = CFrame.new(-1480.06018, 47.9773636, 4.53454018, -0.386713833, 1.11673025e-07, 0.922199786, 7.96717785e-08, 1, -8.76847395e-08, -0.922199786, 3.95643944e-08, -0.386713833)
					if _G.AutoLevel and _G.Autosaber and (CFrameSaber.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1200 then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
						toposition(CFrameSaber)
					end
					toposition(CFrameSaber)
				else
					if game:GetService("Workspace").Map.Desert.Burn.Part.Transparency == 0 then
						if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch") then
							EquipWeapon("Torch")
							toposition(CFrame.new(1113.7229, 5.04679585, 4350.33691, -0.541527212, 5.27007726e-09, 0.840683222, 8.74004868e-08, 1, 5.00303372e-08, -0.840683222, 1.00568911e-07, -0.541527212))
							UnEquipWeapon("Torch")
							EquipWeapon("Torch")
							task.wait(0.5)
						else
							toposition(CFrame.new(-1610.56824, 12.1773882, 162.830322, -0.907543361, -2.88120088e-08, -0.419958383, -4.66550922e-08, 1, 3.22163096e-08, 0.419958383, 4.88308949e-08, -0.907543361))                 
						end
					else
						if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") ~= 0 then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","GetCup")
							task.wait(0.5)
							EquipWeapon("Cup")
							task.wait(0.5)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","FillCup",game:GetService("Players").LocalPlayer.Character.Cup)
							task.wait(0)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") 
						else
							if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == nil then
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
							elseif  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 0 then
								if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader [Lv. 120] [Boss]") or game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader [Lv. 120] [Boss]") then
									for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
										if v.Name == "Mob Leader [Lv. 120] [Boss]" then
											if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
												repeat task.wait()
													EquipWeapon(_G.Select_Weapon)
													v.HumanoidRootPart.CanCollide = false
													v.Humanoid.WalkSpeed = 0
													v.Head.CanCollide = false
													v.HumanoidRootPart.Size = Vector3.new(100,100,100)
													v.HumanoidRootPart.Transparency = 1
													EquipWeapon(_G.Select_Weapon)
													toposition(v.HumanoidRootPart.CFrame * CFrame.new(0,35,5))
													if not _G.FastAttack or not _G.FastAttackO or _G.FastAttack or _G.FastAttackO or _G.SuperFastAttack then game:GetService'VirtualUser':CaptureController() game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672)) end
												until v.Humanoid.Health <= 0 or _G.AutoSaber == false
											end
										else
											for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
												if v.Name == "Mob Leader [Lv. 120] [Boss]" then
													toposition(v.HumanoidRootPart.CFrame * CFrame.new(0,35,5))
												end
											end
										end
									end
								end
						elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 1 then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
							task.wait(0.5)
							EquipWeapon("Relic")
							task.wait(0.5)
							toposition(CFrame.new(-1406.37512, 29.9773273, 4.45027685, 0.877344251, -3.82776442e-08, 0.479861468, 4.93218133e-09, 1, 7.07504668e-08, -0.479861468, -5.9705755e-08, 0.877344251))
						end
					end
				end
			end
				else
					if game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert [Lv. 200] [Boss]") or game:GetService("ReplicatedStorage"):FindFirstChild("Saber Expert [Lv. 200] [Boss]") then
						for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if v.Name == "Saber Expert [Lv. 200] [Boss]" then
								repeat task.wait()
									EquipWeapon(_G.Select_Weapon)
									v.HumanoidRootPart.Size = Vector3.new(60,60,60)
									v.HumanoidRootPart.Transparency = 1
									toposition(v.HumanoidRootPart.CFrame * CFrame.new(0,30,5))
									if not _G.FastAttack or not _G.FastAttackO or _G.FastAttack or _G.FastAttackO or _G.SuperFastAttack then game:GetService'VirtualUser':CaptureController() game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672)) end
								until v.Humanoid.Health <= 0 or _G.AutoSaber == false
								_G.Start_Saber = false
								_G.StartFarm = true
								if v.Humanoid.Health <= 0 then
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","PlaceRelic")
								end
							else
								toposition(game:GetService("ReplicatedStorage"):FindFirstChild("Saber Expert [Lv. 200] [Boss]").HumanoidRootPart.CFrame * CFrame.new(0,30,5))
							end
						end
					else 
						repeat task.wait()
							_G.Autosaber = false
							_G.AutoLevel = true
						until _G.Autosaber == true or game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert [Lv. 200] [Boss]")
						_G.Autosaber = true
						_G.AutoLevel = false
					end
				end
			elseif _G.AutoLevel and _G.Autosaber and Check_Sword("Saber") == true then
				_G.Autosaber = false
			end
		end)
	end
end)
--soul g
_G.Poo = 1500
spawn(function()
	while wait() do
		pcall(function()
			if _G.Autosoulguitar and _G.AutoLevel and game.Players.localPlayer.Data.Level.value >= 2300 and Check_Gun("Soul Guitar") == nil then
				local data = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check")
				if data == nil then
					if game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149431" then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2)
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2, true)
						_G.AutoLevel = false
                        Top.Text = "Auto Farm: Off"
					elseif data == nil then
						return
					end
				end
				for i, v in pairs(data) do
					if i == "Swamp" then
						if v == false then
							_G.AutoLevel = false
							Top.Text = "Auto Farm: Off"
							if game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Living Zombie [Lv. 2000]" then
                                        Under.Text = "Task: Auto Soul Guitar"
										if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
											repeat wait()
												PosMon = CFrame.new(-10164.7588, 138.652451, 5935.78418, -0.999782741, -8.01260214e-08, -0.0208426975, -7.95026338e-08, 1, -3.07377839e-08, 0.0208426975, -2.90740569e-08, -0.999782741)
												EquipWeapon(_G.Select_Weapon)
												v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)  
												BringMobFarmGuitar = true
												toposition(CFrame.new(-10164.7588, 138.652451, 5935.78418, -0.999782741, -8.01260214e-08, -0.0208426975, -7.95026338e-08, 1, -3.07377839e-08, 0.0208426975, -2.90740569e-08, -0.999782741) * CFrame.new(0, 30, 5))
											until not _G.Autosoulguitar or v.Humanoid.Health <= 0 or not v.Parent or v.Humanoid.Health <= 0 
										end
									end
								end
							else
								toposition(CFrame.new(-10164.7588, 138.652451, 5935.78418, -0.999782741, -8.01260214e-08, -0.0208426975, -7.95026338e-08, 1, -3.07377839e-08, 0.0208426975, -2.90740569e-08, -0.999782741))
							end
						else
							for _i,_v in pairs(data) do
								if _i == "Gravestones" then
									if _v == false then
										_G.StartFarm = false
										wait(0.2)
										fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard7.Left.ClickDetector)
										wait(0.2)
										fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard6.Left.ClickDetector)
										wait(0.2)
										fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard5.Left.ClickDetector)
										wait(0.2)
										fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard4.Right.ClickDetector)
										wait(0.2)
										fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard3.Left.ClickDetector)
										wait(0.2)
										fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard2.Right.ClickDetector)
										wait(0.2)
										fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard1.Right.ClickDetector)
									else
										for _i1,_v1 in pairs(data) do
											if _i1 == "Ghost" then
												if _v1 == false then
													_G.AutoLevel = false
													game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Ghost")
													game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Ghost", true)
												else
													for _i2,_v2 in pairs(data) do
														if _i2 == "Trophies" then
															if _v2 == false then
																_G.AutoLevel = false
																repeat wait()
																	fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment2:FindFirstChild("ClickDetector"))
																until game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment2.Line.Position.Y == -1000 or not _G.Auto_Soul_Guitar
																repeat wait()
																	fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment5:FindFirstChild("ClickDetector"))
																until game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment5.Line.Position.Y == -1000 or not _G.Auto_Soul_Guitar
																repeat wait()
																	fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment6:FindFirstChild("ClickDetector"))
																until game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment6.Line.Position.Y == -1000 or not _G.Auto_Soul_Guitar
																repeat wait()
																	fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment8:FindFirstChild("ClickDetector"))
																until game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment8.Line.Position.Y == -1000 or not _G.Auto_Soul_Guitar
																repeat wait()
																	fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment9:FindFirstChild("ClickDetector"))
																until game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment9.Line.Position.Y == -1000 or not _G.Auto_Soul_Guitar
																if getTrophies(1)[1] then
																	repeat wait()
																		fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment1:FindFirstChild("ClickDetector"))
																	until game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment1.Line.Rotation.Z == getTrophies(1)[2] or game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment1.Line.Rotation.Z == getTrophies(1)[3] or not _G.Auto_Soul_Guitar or game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check").Trophies == true
																end
																if getTrophies(2)[1] then
																	repeat wait()
																		fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment3:FindFirstChild("ClickDetector"))
																	until game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment3.Line.Rotation.Z == getTrophies(2)[2] or game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment3.Line.Rotation.Z == getTrophies(1)[3] or not _G.Auto_Soul_Guitar or game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check").Trophies == true
																end
																if getTrophies(3)[1] then
																	repeat wait()
																		fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment4:FindFirstChild("ClickDetector"))
																	until game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment4.Line.Rotation.Z == getTrophies(3)[2] or game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment4.Line.Rotation.Z == getTrophies(1)[3] or not _G.Auto_Soul_Guitar or game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check").Trophies == true
																end
																if getTrophies(4)[1] then
																	repeat wait()
																		fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment7:FindFirstChild("ClickDetector"))
																	until game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment7.Line.Rotation.Z == getTrophies(4)[2] or game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment7.Line.Rotation.Z == getTrophies(1)[3] or not _G.Auto_Soul_Guitar or game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check").Trophies == true
																end
																if getTrophies(5)[1] then
																	repeat wait()
																		fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment10:FindFirstChild("ClickDetector"))
																	until game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment10.Line.Rotation.Z == getTrophies(5)[2] or  game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment10.Line.Rotation.Z == getTrophies(1)[3] or not _G.Auto_Soul_Guitar or game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check").Trophies == true
																end
															else
																for _i3,_v3 in pairs(data) do
																	if _i3 == "Pipes" then
																		if _v3 == false then
																			_G.AutoLevel = false
																			repeat task.wait() toposition(CFrame.new(-9628.02734375, 6.13064432144165, 6157.47802734375)) until not _G.Auto_Soul_Guitar or (CFrame.new(-9628.02734375, 6.13064432144165, 6157.47802734375).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10               
																			fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
																			wait()
																			fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
																			wait()
																			fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
																			wait()
																			fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.ClickDetector)
																			wait()
																			fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
																			wait()
																			fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
																			wait()
																			fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
																			wait()
																			fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
																			wait()
																			fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
																			wait()
																			fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.ClickDetector)
																		else
																			for _i4,_v4 in pairs(data) do
																				if _i4 == "CraftedOnce" then
																					if _v4 == false then
																						_G.AutoLevel = false
																						Top.Text = "Auto Farm: Off"
																						if Check_Material("Bones") < 500 and Third_Sea then
																							for _, _Boss in ipairs(BoneTabel["Boss"]) do
																								local _Item = BoneTabel["Item"]
																								if game:GetService("Workspace").Enemies:FindFirstChild(_Boss) or game:GetService("ReplicatedStorage"):FindFirstChild(_Boss) then
																									for _, _v1 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
																										if _v1.Name == _Boss then
																											if _v1:FindFirstChild("Humanoid") and _v1:FindFirstChild("HumanoidRootPart") and _v1.Humanoid.Health > 0 then
																												repeat wait()
																													EquipWeapon(_G.Select_Weapon)
																													_v1.HumanoidRootPart.Size = Vector3.new(60, 60, 60)  
																													BringMobFarm = true
																													toposition(_v1.HumanoidRootPart.CFrame * CFrame.new(0, 30, 5))
																													if (_v1.HumanoidRootPart.CFrame.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 50 then
																														game:GetService("VirtualUser"):CaptureController()
																														game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
																													end
																												until not _G.Auto_Soul_Guitar or v.Humanoid.Health <= 0 or not v.Parent or v.Humanoid.Health <= 0
																												BringMobFarm = false
																											end
																										end
																									end
																								else
																									if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(_Item) or game:GetService("Players").LocalPlayer.Character:FindFirstChild(_Item) then
																										EquipWeapon(_Item)
																										toposition(workspace.Map["Haunted Castle"].Summoner.Detection.CFrame)
																									else
																										for _, _Mon in next, BoneTabel["Mon"] do
																											if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul [Lv. 2025]") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy [Lv. 2050]") then
																												print(_Mon)
																												for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
																													if v.Name == _Mon then
																														if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
																															repeat wait()
																																PosMon = v.HumanoidRootPart.CFrame
																																EquipWeapon(_G.Select_Weapon)
																																v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)  
																																BringMobFarm = true
																																toposition(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 5))
																																if (v.HumanoidRootPart.CFrame.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 50 then
																																	game:GetService("VirtualUser"):CaptureController()
																																	game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
																																end
																															until not _G.Autosoulguitar or v.Humanoid.Health <= 0 or not v.Parent or v.Humanoid.Health <= 0
																														else
																															toposition(GetBone_CFrame_Mon()[SetCFarmeBone] * CFrame.new(0,30,5))
																															if (GetBone_CFrame_Mon()[SetCFarmeBone].Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 50 then
																																if SetCFarmeBone == nil or SetCFarmeBone == '' then
																																	SetCFarmeBone = 1
																																elseif SetCFarmeBone >= #GetBone_CFrame_Mon() then
																																	SetCFarmeBone = 1
																																end
																																SetCFarmeBone =  SetCFarmeBone + 1
																							
																																print(SetCFarmeBone)
																																wait(0.5)
																															end
																														end
																													end
																												end
																											else
																												toposition(GetBone_CFrame_Mon()[SetCFarmeBone] * CFrame.new(0,30,5))
																												if (GetBone_CFrame_Mon()[SetCFarmeBone].Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 50 then
																													if SetCFarmeBone == nil or SetCFarmeBone == '' then
																														SetCFarmeBone = 1
																													elseif SetCFarmeBone >= #GetBone_CFrame_Mon() then
																														SetCFarmeBone = 1
																													end
																													SetCFarmeBone =  SetCFarmeBone + 1
																				
																													print(SetCFarmeBone)
																													wait(0.5)
																												end
																											end
																										end
																									end
																								end
																							end
																						else
																							if Check_Material("Bones") > 500 then
																								if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm","Check") < 250 then
																									if not Second_Sea then
																										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
																									else
																										if game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand [Lv. 1250]") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer [Lv. 1275]") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward [Lv. 1300]") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer [Lv. 1325]") then
																											for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
																												if string.find(v.Name, "Ship") then
																													repeat wait()
																														--AutoHaki()
																														EquipWeapon(_G.Select_Weapon)
																														PosMonEctoplasm = v.HumanoidRootPart.CFrame
																														v.HumanoidRootPart.CanCollide = false
																														v.HumanoidRootPart.Size = Vector3.new(50,50,50)
																														toposition(v.HumanoidRootPart.CFrame * CFrame.new(0,30,5))
																														MagnetEctoplasm = true
																														game:GetService'VirtualUser':CaptureController()
																														game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
																													until _G.Autosoulguitar == false or not v.Parent or v.Humanoid.Health <= 0
																													MagnetEctoplasm = false
																												else
																													MagnetEctoplasm = false
																													toposition(CFrame.new(904.4072265625, 181.05767822266, 33341.38671875))
																												end
																											end
																										else 
																											MagnetEctoplasm = false
																											local Distance = (Vector3.new(904.4072265625, 181.05767822266, 33341.38671875) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
																											if Distance > 20000 then
																												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
																											end
																											toposition(CFrame.new(904.4072265625, 181.05767822266, 33341.38671875))
																										end
																									end
																								elseif Check_Material("Dark Fragment") < 1 then
																									if not Second_Sea then
																										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
																									end
																									if game.ReplicatedStorage:FindFirstChild("Darkbeard [Lv. 1000] [Raid Boss]") or game.Workspace.Enemies:FindFirstChild("Darkbeard [Lv. 1000] [Raid Boss]") then
																										toposition(CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375))
																										for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
																											if v.Name == "Darkbeard [Lv. 1000] [Raid Boss]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
																												repeat wait()  
																													EquipWeapon(_G.Select_Weapon)
																													v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)  
																													toposition(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 5))
																													if (v.HumanoidRootPart.CFrame.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 50 then
																														game:GetService("VirtualUser"):CaptureController()
																														game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
																													end
																												until not _G.Autosoulguitar or v.Humanoid.Health <= 0 or not v.Parent
																											end
																										end
																									else
																										if game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Character:FindFirstChild("Fist of Darkness") then
																											EquipWeapon("Fist of Darkness")
																											toposition(CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375) * CFrame.new(0,-10,0))
																										else
																											if not Second_Sea then
																												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
																											end
																											for i,v in pairs(game:GetService("Workspace"):GetChildren()) do 
																												if v.Name:find("Chest") then
																													if game:GetService("Workspace"):FindFirstChild(v.Name) then
																														if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000+_G.Poo then
																															repeat task.wait()
																																if game:GetService("Workspace"):FindFirstChild(v.Name) then
																																	toposition(v.CFrame)
																																	if (v.CFrame.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1 then
																																		UnEquipWeapon(_G.Select_Weapon)
																																	else
																																		EquipWeapon(_G.Select_Weapon)
																																	end
																																else
																																	_G.Poo = _G.Poo + 1000
																																end
																															until _G.Auto_Soul_Guitar  == false or not v.Parent
																															_G.Poo = _G.Poo + 1000
																															break
																														else
																															_G.Poo = _G.Poo + 1000
																														end
																													end
																												end
																											end
																										end
																									end
																								else
																									if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm","Check") > 250 and Check_Material("Dark Fragment") > 1 then
																										if Third_Sea then
																											print("Buy")
																											_G.Autosoulguitar = false
																											_G.AutoLevel = true
																											Top.Text = "Auto Farm: farm"
																										else
																											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
																										end
																									end
																								end
																							end
																						end
																					end
																				end
																			end
																		end
																	end
																end
															end
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end 
		end)
	end
end)
    end

local Notif = loadstring(game:HttpGet("https://raw.githubusercontent.com/MaGiXxScripter0/keysystemv2api/master/ui/notify_ui.lua"))()
local SpecialKey = "Toshy Hub" --// will be used to unlock your info
local RNG = math.random(100,1000)
local repo = "https://raw.githubusercontent.com/Panda-Repositories/PandaKS_Libraries/main/library/LuaLib/ROBLOX/"
local FalseKey = math.random(1,1000)

local GRTV = function(...)
    local T = {...}
    return tostring(T)
end

RNG = GRTV(RNG)

local suc,lib = pcall(function()
    local request = request or syn.request
    local library = nil
    if request then
        library = request({Url = repo.."PandaSVALLib.lua", Method = "GET"}).Body
    else
        warn("SWITCHING TO UNSECURED")
        library = game:HttpGet(repo.."PandaSVALLib.lua")
    end

    if library ~= nil then
        return loadstring(library)()
    else
        warn("NOT SUPPORTED EXECUTOR")
    end
end)

local info = setmetatable({
    [RNG] = function(Key)
        if Key == SpecialKey then
            return {
                Service = "toshy",                   -- Your service name
                DisplayName = "Toshy Hub",      -- Display name
                API_Key = "xLc0o7Kl65Ue78jv",             -- Your API key
                IsDebug = false,                           -- Enable debug mode (optional)
                Allow_BlacklistUsers = false,             -- Allow blacklisted users (optional)
                Save_Key = false,                          -- Save the key to the user's data (optional)
                Initialized = false,                       -- Track initialization status (optional)
                DiagnosticLogs = true,                     -- Enable diagnostic logs (optional)
                GUIVersion = false,                        -- Enable new GUI version (optional)
            }
        end
    end
}, {
    __Index = function()
        warn("ERROR [1] Dont Found")
    end
})

-- Frame to Lua
-- Version: 3.2
-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local UICorner = Instance.new("UICorner")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local UICorner_2 = Instance.new("UICorner")
local TextButton = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
local TextButton_2 = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")
local TextLabel = Instance.new("TextLabel")
local UITextSizeConstraint_3 = Instance.new("UITextSizeConstraint")
local UICorner_5 = Instance.new("UICorner")
local UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")
local TextButton_3 = Instance.new("TextButton")
local UICorner_6 = Instance.new("UICorner")
local UIAspectRatioConstraint_5 = Instance.new("UIAspectRatioConstraint")
local UIAspectRatioConstraint_6 = Instance.new("UIAspectRatioConstraint")
local UICorner_7 = Instance.new("UICorner")
local DropShadowHolder = Instance.new("Frame")
local DropShadow = Instance.new("ImageLabel")
local UIAspectRatioConstraint_7 = Instance.new("UIAspectRatioConstraint")
local UIAspectRatioConstraint_8 = Instance.new("UIAspectRatioConstraint")
end)
