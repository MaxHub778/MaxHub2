  local Script = function()
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local Window = Fluent:CreateWindow({
    Title = "Max Hub",
    SubTitle = "Dev by Reedev",
    TabWidth = 160,
    Size = UDim2.fromOffset(470, 250),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--<>----<>----<>----<>----<>----<>----<>--

--<>----<>----<>----<>----<>----<>----<>--
local Workspace = game:GetService('Workspace');
local ReplicatedStorage = game:GetService('ReplicatedStorage');
local Players = game:GetService('Players');
local Client = Players.LocalPlayer;
local RunService = game:GetService('RunService');
local Workspace = game:GetService("Workspace");
local Lighting = game:GetService("Lighting");
local UIS = game:GetService("UserInputService");
local Teams = game:GetService("Teams");
local ScriptContext = game:GetService("ScriptContext");
local CoreGui = game:GetService("CoreGui");
local Camera = Workspace.CurrentCamera;
local Mouse = Client:GetMouse();
local Terrain = Workspace.Terrain;
local VirtualUser = game:GetService("VirtualUser");
--<>----<>----<>----<>----<>----<>----<>--
local Modules = ReplicatedStorage.Modules;
local EmoteModule = Modules.EmoteModule;
local Emotes = Client.PlayerGui.MainGUI.Game:FindFirstChild("Emotes");
local EmoteList = {"headless","zombie","zen","ninja","floss","dab"};
local CanGrab 
CanGrab = false;

local Origins = {{2,0,0},{-2,0,0},{0,2,0},{0,-2,0},{0,0,1},{0,0,-1}};

local GunHighlight = Instance.new("Highlight");
local GunHandleAdornment = Instance.new("SphereHandleAdornment");

GunHighlight.FillColor = Color3.fromRGB(248, 241, 174);
GunHighlight.Adornee = Workspace:FindFirstChild("GunDrop");
GunHighlight.OutlineTransparency = 1;
GunHighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop;
GunHighlight.RobloxLocked = true;

GunHandleAdornment.Color3 = Color3.fromRGB(248, 241, 174);
GunHandleAdornment.Transparency = 0.2;
GunHandleAdornment.Adornee = Workspace:FindFirstChild("GunDrop");
GunHandleAdornment.AlwaysOnTop = true;
GunHandleAdornment.AdornCullingMode = Enum.AdornCullingMode.Never;
GunHandleAdornment.RobloxLocked = true;

GunHighlight.Parent = CoreGui;
GunHandleAdornment.Parent = CoreGui;
local IsMobile = CheckMobile()
local Size11,Size22 = 600,460 
pcall(function()
    if IsMobile then 
        Size11,Size22 = 500,290
        local Players = game:GetService("Players")
        local localPlayer = Players.LocalPlayer

        -- Create the UI elements directly, avoiding the G2L table
        local screenGui = Instance.new("ScreenGui", localPlayer:WaitForChild("PlayerGui"))
        screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

        local imageButton = Instance.new("ImageButton", screenGui)
        imageButton.BorderSizePixel = 0
        imageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        imageButton.AnchorPoint = Vector2.new(0.5, 0.5)
        imageButton.Image = "rbxassetid://79390122443146"
        imageButton.Size = UDim2.new(0, 63, 0, 63)
        imageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
        imageButton.Position = UDim2.new(0.5, 0, 0.10324, 0)

        Instance.new("UICorner", imageButton)  -- No need to store this reference

        local uiStroke = Instance.new("UIStroke", imageButton)
        uiStroke.Thickness = 2
        uiStroke.Color = Color3.fromRGB(133, 21, 124)

        imageButton.MouseButton1Click:Connect(function()
            game:GetService("VirtualInputManager"):SendKeyEvent(true,"LeftControl",false,game)
            game:GetService("VirtualInputManager"):SendKeyEvent(false,"LeftControl",false,game)
        end)
    end 
end) 
local TeleportDict = {
    ["Lobby"] = Vector3.new(-121.12338256836, 138.27394104004, 38.946128845215),
    ["Map"] = Vector3.new(-107.90824127197266, 138.34988403320312, -10.622464179992676),
};
local TeleportTable = {}
for i, v in pairs(TeleportDict) do
    table.insert(TeleportTable,i);
end;

local Murderer, Sheriff = nil, nil;

function GetMurderer()
    for i,v in pairs(Players:GetChildren()) do 
        if v.Backpack:FindFirstChild("Knife") or v.Character:FindFirstChild("Knife") and v.Name == "Tool" then
            return v.Name;
        end;
    end;
    return nil;
end;

function GetSheriff()
    for i,v in pairs(Players:GetChildren()) do 
        if v.Backpack:FindFirstChild("Gun") or v.Character:FindFirstChild("Gun") and v.Name == "Tool" then
            return v.Name;
        end;
        return nil;
    end;
end;
--<>----<>----<>----<>----<>----<>----<>--
local Character = nil;
local RootPart = nil;
local Humanoid = nil;

getgenv().WS = 16
getgenv().JP = 50
function SetCharVars()
	Character = Client.Character;
	Humanoid = Character:FindFirstChild("Humanoid") or Character:WaitForChild("Humanoid");
	RootPart = Character:FindFirstChild("HumanoidRootPart") or Character:WaitForChild("HumanoidRootPart");
	if getgenv().Speed then
		Humanoid.WalkSpeed = getgenv().WS;
	end;
	Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
		if getgenv().Speed then
			Humanoid.WalkSpeed = getgenv().WS;
		end;
	end);
    if getgenv().Jump then
		Humanoid.WalkSpeed = getgenv().JP;
	end;
	Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
		if getgenv().Jump then
			Humanoid.WalkSpeed = getgenv().JP;
		end;
	end);
end;
SetCharVars();
Client.CharacterAdded:Connect(SetCharVars);

local Ws;
Ws = hookmetamethod(game, "__index", function(self, Value)
    if tostring(self) == "Humanoid" and tostring(Value) == "WalkSpeed" then
        return 16;
    end;
    return Ws(self, Value);
end);

local Jp;
Jp = hookmetamethod(game, "__index", function(self, Value)
    if tostring(self) == "Humanoid" and tostring(Value) == "WalkSpeed" then
        return 16;
    end;
    return Jp(self, Value);
end);

--<>----<>----<>----<>----<>----<>----<>--


--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Info = Window:AddTab({ Title = "Info", Icon = "info" }),
    Main = Window:AddTab({ Title = "Main", Icon = "home" }),
    Farms = Window:AddTab({ Title = "Farms", Icon = "box" }),
    
}

--<>----<>----<>----<>----<>----<>----<>--

Tabs.Info:AddButton({
    Title = "Discord:",
    Description = "https://dsc.gg/toshyscript",
    Callback = function()
      setclipboard("https://dsc.gg/toshyscript")
      game:GetService("StarterGui"):SetCore("SendNotification", { 
	Title = "Copied";
	Text = "Copied To Clipboard";
	Icon = "rbxassetid://18700386948"})
      end
})
Tabs.Info:AddParagraph({
    Title = "Developer: ToshysTeam",
    Content = ""
})

Tabs.Info:AddParagraph({
    Title = "Support Device:",
    Content = "Pc/Mobile"
}
)

--<>----<>----<>----<>----<>----<>----<>--


local ToggleKillAll = Tabs.Main:AddToggle("ToggleKillAll", {Title = "Kill All", Default = false })

    ToggleKillAll:OnChanged(function(state)
      pcall(function()
            local Knife = Client.Backpack:FindFirstChild("Knife") or Client.Character:FindFirstChild("Knife");
            if Knife.Parent.Name == "Backpack" then
                Humanoid:EquipTool(Knife);
            end;
            if Knife then
                if Knife:IsA("Tool") then
                    for i, v in ipairs(Players:GetPlayers()) do
                        if v ~= Client and v.Character ~= nil and not table.find(getgenv().Whitelisted,v.Name) then
                            local EnemyRoot = v.Character.HumanoidRootPart;
                            local EnemyPosition = EnemyRoot.Position;
                            VirtualUser:ClickButton1(Vector2.new());
                            firetouchinterest(EnemyRoot, Knife.Handle, 1);
                            firetouchinterest(EnemyRoot, Knife.Handle, 0);
                            lastAttack = tick();
                        end;
                    end;
                end;
            end;
        end);
      end)

local Section = Tabs.Main:AddSection("Basics")

local SliderWS = Tabs.Main:AddSlider("WS", {
        Title = "WalkSpeed",
        Description = "",
        Default = 16,
        Min = 16,
        Max = 200,
        Rounding = 1,
        Callback = function(val)
          getgenv().WS = tonumber(val)--tonumber(val / 10) or 0;
        Humanoid.WalkSpeed = val;
        end
    })

local SliderJP = Tabs.Main:AddSlider("JP", {
        Title = "JumpPower",
        Description = "",
        Default = 50,
        Min = 50,
        Max = 200,
        Rounding = 1,
        Callback = function(val)
          getgenv().JP = tonumber(val)--tonumber(val / 10) or 0;
        Humanoid.JumpPower = val;
        end
    })
  
  Tabs.Main:AddButton({
    Title = "God Mode",
    Description = "",
    Callback = function()
      GodMode()
		end
})

local accessories = {}
function GodMode()
    if game.Players.LocalPlayer.Character then
        if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            for _, accessory in pairs(game.Players.LocalPlayer.Character.Humanoid:GetAccessories()) do
                table.insert(accessories, accessory:Clone())
            end
            game.Players.LocalPlayer.Character.Humanoid.Name = "boop"
        end
        local v = game.Players.LocalPlayer.Character["boop"]:Clone()
        v.Parent = game.Players.LocalPlayer.Character
        v.Name = "Humanoid"
        wait(0.1)
        game.Players.LocalPlayer.Character["boop"]:Destroy()
        workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
        for _, accessory in pairs(accessories) do
            game.Players.LocalPlayer.Character.Humanoid:AddAccessory(accessory)
        end
        game.Players.LocalPlayer.Character.Animate.Disabled = true
        wait(0.1)
        game.Players.LocalPlayer.Character.Animate.Disabled = false
    end
end

--<>----<>----<>----<>----<>----<>----<>--

local Section = Tabs.Main:AddSection("World")

local folder = Instance.new("Folder",CoreGui);
folder.Name = "ESP Holder";
	
local function AddBillboard(player)
    local billboard = Instance.new("BillboardGui",folder);
    billboard.Name = player.Name;
    billboard.AlwaysOnTop = true;
    billboard.Size = UDim2.fromOffset(200,50);
    billboard.ExtentsOffset = Vector3.new(0,3,0);
    billboard.Enabled = false

    local textLabel = Instance.new("TextLabel",billboard);
    textLabel.TextSize = 20;
    textLabel.Text = player.Name;
    textLabel.Font = Enum.Font.SourceSans;
    textLabel.BackgroundTransparency = 1;
    textLabel.Size = UDim2.fromScale(1,1);

    if getgenv().AllEsp then
        billboard.Enabled = true
    end
    repeat
        wait()
        pcall(function()
            billboard.Adornee = player.Character.Head;
            if player.Character:FindFirstChild("Knife") or player.Backpack:FindFirstChild("Knife") then
                textLabel.TextColor3 = Color3.new(1,0,0);
                if not billboard.Enabled and getgenv().MurderEsp then
                    billboard.Enabled = true
                end
            elseif player.Character:FindFirstChild("Gun") or player.Backpack:FindFirstChild("Gun") then
                textLabel.TextColor3 = Color3.new(0,0,1);
                if not billboard.Enabled and getgenv().SheriffEsp then
                    billboard.Enabled = true
                end
            else
                textLabel.TextColor3 = Color3.new(0,1,0);
            end;
        end);
    until not player.Parent;
end;

for _,player in pairs(Players:GetPlayers()) do
    if player ~= Client then
        coroutine.wrap(AddBillboard)(player);
    end;
end;
Players.PlayerAdded:Connect(AddBillboard);

Players.PlayerRemoving:Connect(function(player)
    folder[player.Name]:Destroy();
end);

local ToggleESPPlayers = Tabs.Main:AddToggle("ToggleESPPlayers", {Title = "ESP Players", Default = false })

    ToggleESPPlayers:OnChanged(function(state)
        getgenv().AllEsp = state;
        for i, v in pairs(folder:GetChildren()) do
            if v:IsA("BillboardGui") and Players[tostring(v.Name)] then
                if getgenv().AllEsp then
                    v.Enabled = true;
                else
                    v.Enabled = false;
                end;
            end;
        end;
    end)
local ToggleESPMurder = Tabs.Main:AddToggle("ToggleESPMurder", {Title = "ESP Murder", Default = false })

    ToggleESPMurder:OnChanged(function(state)
        getgenv().MurderEsp = state;
        while getgenv().MurderEsp do
            wait()
            pcall(function()
                for i, v in pairs(folder:GetChildren()) do
                    if v:IsA("BillboardGui") and Players[tostring(v.Name)] then
                        if Players[tostring(v.Name)].Character:FindFirstChild("Knife") or Players[tostring(v.Name)].Backpack:FindFirstChild("Knife")  then
                            if getgenv().MurderEsp then
                                v.Enabled = true;
                            else
                                v.Enabled = false;
                            end;
                        end
                    end;
                end;
            end);
        end;
    end)

local ToggleESPSheriff = Tabs.Main:AddToggle("ToggleESPSheriff", {Title = "ESP Sheriff", Default = false })

    ToggleESPSheriff:OnChanged(function(state)
        getgenv().SheriffEsp = state;
        while getgenv().SheriffEsp do
            wait()
            pcall(function()
                for i, v in pairs(folder:GetChildren()) do
                    if v:IsA("BillboardGui") and Players[tostring(v.Name)] then
                        if Players[tostring(v.Name)].Character:FindFirstChild("Gun") or Players[tostring(v.Name)].Backpack:FindFirstChild("Gun")  then
                            if getgenv().SheriffEsp then
                                v.Enabled = true;
                            else
                                v.Enabled = false;
                            end;
                        end
                    end;
                end;
            end);
        end;
    end)

local SectionGun = Tabs.Farms:AddSection("Gun")

local ToggleESPGun = Tabs.Farms:AddToggle("ToggleESPGun", {Title = "ESP Gun", Default = false })

    ToggleESPGun:OnChanged(function(state)
      getgenv().GunESP = state;
    end)
    
    coroutine.wrap(function()
    RunService.RenderStepped:Connect(function()
        pcall(function()
            if getgenv().GunESP then
                local gundrop = Workspace:FindFirstChild("GunDrop");
                GunHighlight.Adornee = gundrop;
                GunHandleAdornment.Adornee = gundrop;
                if gundrop then 
                    GunHandleAdornment.Size = gundrop.Size + Vector3.new(0.05, 0.05, 0.05) ;
                end;
        
                GunHighlight.Enabled = getgenv().GunESP;
                GunHandleAdornment.Visible = getgenv().GunESP;
            end;
        end);
    end);
end)();

local Keybind = Tabs.Farms:AddKeybind("Get Gun", {
        Title = "Get Gun",
        Mode = "Toggle", -- Always, Toggle, Hold
        Default = "Y", -- String as the name of the keybind (MB1, MB2 for mouse buttons)

        -- Occurs when the keybind is clicked, Value is `true`/`false`
        Callback = function(Value)
            if not CanGrab then return end
        local gundrop = Workspace:FindFirstChild("GunDrop");
        if gundrop and not lastCFrame then
            lastCFrame = RootPart.CFrame;
            pcall(function()
                repeat
                    RootPart.CFrame = gundrop.CFrame;
                    RunService.Stepped:Wait();
                until not gundrop:IsDescendantOf(Workspace);
                RootPart.CFrame = lastCFrame;
                lastCFrame = false;
            end);
        end;
        end
        })
      
      Fluent:Notify({
        Title = "Success",
        Content = "Toshy Hub",
        SubContent = "The Script Was Loading Completely",
        Duration = 8
    })
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

--Properties:

ScreenGui.Parent = gethui()
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(184, 3, 255)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.191516548, 0, 0.183660999, 0)
Frame.Size = UDim2.new(0.616465867, 0, 0.631049335, 0)

Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(20, 20, 29)
Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(0.0249483362, 0, 0.0464165136, 0)
Frame_2.Size = UDim2.new(1.04042542, 0, 1.09398484, 0)

TextBox.Parent = Frame_2
TextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
TextBox.BorderColor3 = Color3.fromRGB(74, 71, 71)
TextBox.Position = UDim2.new(0.157464445, 0, 0.384879768, 0)
TextBox.Size = UDim2.new(0.671841919, 0, 0.230402336, 0)
TextBox.Font = Enum.Font.SourceSansBold
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 25.000

UICorner.Parent = TextBox

UIAspectRatioConstraint.Parent = TextBox
UIAspectRatioConstraint.AspectRatio = 4.900

UICorner_2.Parent = Frame_2

TextButton.Parent = Frame_2
TextButton.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.572690427, 0, 0.754724443, 0)
TextButton.Size = UDim2.new(0.36334303, 0, 0.154369563, 0)
TextButton.Font = Enum.Font.SourceSansBold
TextButton.Text = "Get Key"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextScaled = true
TextButton.TextSize = 40.000
TextButton.TextWrapped = true

UICorner_3.Parent = TextButton

UIAspectRatioConstraint_2.Parent = TextButton
UIAspectRatioConstraint_2.AspectRatio = 3.955

UITextSizeConstraint.Parent = TextButton
UITextSizeConstraint.MaxTextSize = 40

TextButton_2.Parent = Frame_2
TextButton_2.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
TextButton_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.BorderSizePixel = 0
TextButton_2.Position = UDim2.new(0.064208582, 0, 0.754724443, 0)
TextButton_2.Size = UDim2.new(0.36334303, 0, 0.154369563, 0)
TextButton_2.Font = Enum.Font.SourceSansBold
TextButton_2.Text = "Submit"
TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton_2.TextScaled = true
TextButton_2.TextSize = 40.000
TextButton_2.TextWrapped = true

UICorner_4.Parent = TextButton_2

UIAspectRatioConstraint_3.Parent = TextButton_2
UIAspectRatioConstraint_3.AspectRatio = 3.955

UITextSizeConstraint_2.Parent = TextButton_2
UITextSizeConstraint_2.MaxTextSize = 40

TextLabel.Parent = Frame_2
TextLabel.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.161481246, 0, 0.0639243796, 0)
TextLabel.Size = UDim2.new(0.663615227, 0, 0.284982085, 0)
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.Text = "Toshy Hub"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 100.000
TextLabel.TextWrapped = true

UITextSizeConstraint_3.Parent = TextLabel
UITextSizeConstraint_3.MaxTextSize = 72

UICorner_5.Parent = TextLabel

UIAspectRatioConstraint_4.Parent = TextLabel
UIAspectRatioConstraint_4.AspectRatio = 3.913

TextButton_3.Parent = Frame_2
TextButton_3.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
TextButton_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_3.BorderSizePixel = 0
TextButton_3.Position = UDim2.new(0.919061065, 0, 0.0400654525, 0)
TextButton_3.Size = UDim2.new(0.0589575544, 0, 0.0990730077, 0)
TextButton_3.Font = Enum.Font.SourceSans
TextButton_3.Text = "X"
TextButton_3.TextColor3 = Color3.fromRGB(255, 0, 4)
TextButton_3.TextSize = 30.000

UICorner_6.Parent = TextButton_3

UIAspectRatioConstraint_5.Parent = TextButton_3

UIAspectRatioConstraint_6.Parent = Frame_2
UIAspectRatioConstraint_6.AspectRatio = 1.680

UICorner_7.Parent = Frame

DropShadowHolder.Name = "DropShadowHolder"
DropShadowHolder.Parent = Frame
DropShadowHolder.BackgroundTransparency = 1.000
DropShadowHolder.BorderSizePixel = 0
DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
DropShadowHolder.ZIndex = 0

DropShadow.Name = "DropShadow"
DropShadow.Parent = DropShadowHolder
DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow.BackgroundTransparency = 1.000
DropShadow.BorderSizePixel = 0
DropShadow.Position = UDim2.new(0.5, 0, 0.501110137, 0)
DropShadow.Size = UDim2.new(1, 47, 1, 47)
DropShadow.ZIndex = 0
DropShadow.Image = "rbxassetid://6015897843"
DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
DropShadow.ImageTransparency = 0.500
DropShadow.ScaleType = Enum.ScaleType.Slice
DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

UIAspectRatioConstraint_7.Parent = DropShadowHolder
UIAspectRatioConstraint_7.AspectRatio = 1.767

UIAspectRatioConstraint_8.Parent = Frame
UIAspectRatioConstraint_8.AspectRatio = 1.767

local UserInputService = game:GetService("UserInputService")

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

Frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = Frame.Position
		
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

Frame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

if suc and info and type(info[RNG]) == "function" then
     print("Sucess in starting!")
else
    return warn("EXITING!")
end

local ValidateKey = function()
    local Info = info[RNG](SpecialKey)
    lib:Initialize(Info)
    if lib:ValidateKey(FalseKey) then
        return "Cracking"
    elseif lib:ValidateKey(TextBox.Text) then
        return "Sucess"
    end
end

TextButton_2.MouseButton1Click:Connect(function()
    if ValidateKey() == "Sucess" then
          Notif.New("Valid Key!", 5)
         print("Validated!")
        ScreenGui:Destroy()
            Script()
    elseif ValidateKey == "Cracking" then
        warn("Attempt to crack");while true do end
    else
         print("Invalid Key!")
           Notif.New("Invalid Key!", 5)
    end
  end)

TextButton.MouseButton1Click:Connect(function()
     setclipboard(lib:GetKey())
      Notif.New("Copied, Into Your Browser", 5)
end)

TextButton_3.MouseButton1Click:Connect(function()
     ScreenGui:Destroy()
end)
