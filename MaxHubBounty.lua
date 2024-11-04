Players = Game.Players 
LocalPlayer = Players.LocalPlayer 
for i,v in pairs(game.Workspace:GetChildren()) do
    if v.Name == "Script" then
        v:Destroy()
    end
end
game.Workspace.ChildAdded:Connect(function(child)
    if child.Name == "Script" then
        child:Destroy()
    end
end)

print("run hi")
getgenv().remilia = remilia or {Data={
    Safezones = {}, 
    NPCs = {["Set Home Point"] = {}}, 
    Sea = (function()
        return ({Zou = 3, Dressrosa = 2, Main = 1})[getsenv(game.ReplicatedStorage.GuideModule)["_G"]["CurrentWorld"]]
    end)() 
}, Cache={}} 

Config = Config or {
    ['Team'] = "Pirates", 
    ['Webhook'] = '',--doesnt done yet
    ['Panic Mode'] = {true, 3000, 5500}, -- enabled, from, to
    ['Ultra Gay Gun Mode'] = true, -- spamming gun when enemy is holding skill, etc (recm to use long-range gun like acidum rifle ( DONT USE KABUCHA PLEASE))
    ['Weapon'] = {
        ["Melee"] = {
            ["Enable"] = true,
            ["Z"] = {true,0.7,0}, -- enable, hold (3rd field doesnt done yet)
            ["X"] = {true,0.4,0},
            ["C"] = {true,0.3,0}
        },
        ["Blox Fruit"] = { 
            ["Enable"] = true,
            ["Z"] = {true,.1,0},
            ["X"] = {true,0,0},
            ["C"] = {true,0,1},
            ["V"] = {false,0,1},
            ["F"] = {true,0,1}
        },
        ["Gun"] = {
            ["Enable"] = false,
            ["Z"] = {true,0,1},
            ["X"] = {true,0,1}
        },
        ["Sword"] = {
            ["Enable"] = false,
            ["Z"] = {true,1,0},
            ["X"] = {true,1,0}
        }
    }, 
    ["Stun Moves"] = {
        ["Melee"] = {"Z"}, --DOESNT DONE
        ["Stunning Before Fight"] = true
    }
}

local sitinklib = loadstring(game:HttpGet("https://raw.githubusercontent.com/MaxHub778/MaxHub2/refs/heads/main/MaxHubAutoBounty"))()

getgenv().alert = function(title, desc) 

    sitinklib:Notify({




	["Title"] = "Max Hub",
	["Description"] = title or "",
	["Color"] = Color3.fromRGB(127.00000002980232, 146.00000649690628, 242.00000077486038),
	["Content"] = desc or "",
	["Time"] = 1,
	["Delay"] = 10
 
        
    })
end 
local sitinkgui = sitinklib:Start({

    ["Name"] = "bi xam 1234",
    ["Description"] = "- cac cac cac cac cac cac ?????",
    ["Info Color"] = Color3.fromRGB(5.000000176951289, 59.00000028312206, 113.00000086426735),
    ["Logo Info"] = "",
    ["Logo Player"] = "",
    ["Name Info"] = "[ User Info ]",
    ["Name Player"] = "nil",
    ["Info Description"] = "Type: ".. "nil"..", Time Left: ".. "nil",
    ["Tab Width"] = 75,
    ["Color"] = Color3.fromRGB(127.00000002980232, 146.00000649690628, 242.00000077486038),
    ["CloseCallBack"] = function() end
})
local MainTab = sitinkgui:MakeTab("Co Moi 1 Tab A")
local Section = MainTab:Section({
    ["Title"] = "Script Configuration",
    ["Content"] = "Watch / Config What Script Will Do"
})

local Seperator = Section:Seperator("hi folks")
local ScriptTask = Section:Paragraph({
    ["Title"] = "Enemy",
    ["Content"] = "Loading..."
}) 
local ScriptTask2 = Section:Paragraph({
    ["Title"] = "Status",
    ["Content"] = "Loading..."
}) 
local ScriptTask3 = Section:Paragraph({
    ["Title"] = "Status 2",
    ["Content"] = "Loading..."
}) 
Section:Button({
    ["Title"] = "Hop Server",
    ["Content"] = "Hopping Served (Usually Using If Script Got Paused / Idle) ",
    ["Callback"] = function()
        Hop()
    end
})

Section:Button({

    ["Title"] = "Skip Player",

    ["Content"] = "Skipping Current Enemy ",
    ["Callback"] = function()
        FindEnemy()
    end
})
Section:Toggle({
    ["Title"]= "Pause Script",
	["Content"] = "Pausing All Of The Process That Script Is Processing",
	["Default"] = false,
	["Callback"] = function(v) 
	    pcall(function()
	    	getgenv().StopTask = v
        end)
	end
}) 

Section:Toggle({
    ["Title"]= "Spectate",
	["Content"] = "Spectating Enemy",
	["Default"] = true,
	["Callback"] = function(v) 
	    pcall(function()
	    	spectate = v
        end)
	end
}) 
alert("Auto Bounty", "loaded")
repeat wait() 
pcall(function() 
    for i, v in pairs(getconnections(LocalPlayer.PlayerGui.Main.ChooseTeam.Container[Config.Team or 'Pirates'].Frame.TextButton.Activated)) do
          v.Function()
    end 
end) 
until tostring(LocalPlayer.Team) == Config.Team


function FireRemotes(type, ...)
    gg0 = ({"CommF_", "Redeem"})[type]

    return game:GetService("ReplicatedStorage").Remotes[gg0]:InvokeServer(unpack({...}))
end

v = remilia.Data.Sea == 3 or FireRemotes(1, "TravelZou")
function PositionParser(type, ooooooo)
    return loadstring("return " .. type .. ".new(" .. ooooooo.x .. "," .. ooooooo.y .. "," .. ooooooo.z .. ")")() -- vai
end

function cho(c, o)
    c = o or c
    if tostring(c) == "Set Home Point" then  
        print("Found")
        pcall(function() 
            
            table.insert( remilia.Data.NPCs['Set Home Point'], c:GetModelCFrame()) 
        end)
    end
end 


table.foreach(game.Workspace.NPCs:GetChildren(), cho)
table.foreach(getnilinstances(), cho)

table.foreach(workspace._WorldOrigin.SafeZones:GetChildren(), function(_, v) table.insert(getgenv().remilia.Data.Safezones, {v.CFrame, v.Mesh.Scale}) 
end) 

function FetchingPlayerData(p) 
    v1 = {} 
    p = p or LocalPlayer 
    if p.Data then 
        for v2, v3 in p.Data:GetChildren() do 
            pcall(function() 
                v1[v3.Name] = v3.Value
            end)
        end
    end 
    return v1 
end 


function CheckIsPositionOnSafezone(pos)
    for _, v in getgenv().remilia.Data.Safezones do
        if CaculateDistance(v[1], pos) < (v[2].Magnitude)then
            return true
        end
    end
end  

function Hi(p) 
    v6 = {} 
    v6.player = p 
    function v6.IsAlive(self) 
        
        return self.player.Character and self.player.Character:FindFirstChild("Humanoid") and self.player.Character.Humanoid.Health > 0
    end  
    function v6.GetHumanoid(self)  
        return self:IsAlive() and self.player.Character.Humanoid
    end 
    function v6.GetHumanoidRootPart(self)  
        return self:IsAlive() and self.player.Character.HumanoidRootPart
    end
    function v6.GetPosition(self, type) 
        
        v7 = self:GetHumanoidRootPart() 
        return v7 and PositionParser(type or "CFrame", v7.Position)
    end 
    
    function v6.IsOnSafezone(self) 
        return self:GetPosition() and CheckIsPositionOnSafezone(self:GetPosition())
    end  
    function v6.getData(self, key) 
        v9 = FetchingPlayerData(self.player) 
        return v9 and ( v9[key] or v9 )
    end 
    function v6.CheckIsPlayerLevelInRange(self) 
        local v8 = remilia.LocalPlayer:getData("Level") 
        local v10 = self:getData("Level") 
        return v8-v10 < 450
    end 
    
    function v6.GetVelocity(self) 
        return self:GetHumanoidRootPart() and self:GetHumanoidRootPart().Velocity 
    end   
    
    function v6.getDistance(self, v14) 
        return CaculateDistance(self:GetPosition(), v14)
    end
    function v6.getSize(self) 
        return self:GetHumanoidRootPart() and self:GetHumanoidRootPart().Size 
    end 
    
    function v6.isV4Enabled(self) 
        return self.player.Character:FindFirstChild("RaceTransformed") and self.player.Character:FindFirstChild("RaceTransformed").Value
    end 
    
    function v6.isDamaged(self)  
        if v47 and os.time()-v47 < 2 then return end 
        v47 = os.time() 
        if not v6:GetHumanoid() then return end 
        v45 = v6:GetHumanoid() 
        if not OldH then 
           OldH = v45.Health 
           return 
        end
         v46 = v45.Health > 10 and OldH > v45.Health and OldH - v45.Health  
         self.damaged = (self.damaged == true and true) or (v46 or 0) > 1000
         OldH = v45.Health  
         
         return v46
    end 
    
    function v6.isDamagedBefore(self) 
        self.passed1 = (self.passed1 == true) or self:GetHumanoid() and (self:GetHumanoid().Health < self:GetHumanoid().MaxHealth) 
        return self.passed1
    end 
    
    return v6
end  


remilia.LocalPlayer = Hi(LocalPlayer)
function GetPlayersAsSortedDistance() 
    v4 = {} 
    for _, v5 in game.Players:GetChildren() do 
        if v5.Character and v5.Character:FindFirstChild("HumanoidRootPart") then 
            
            table.insert(v4, v5)
        else 
            alert("removed", tostring(v5))
        end 
    end
    table.sort(v4, function(aL, aM)
        return CaculateDistance(aL.Character.HumanoidRootPart.Position) < CaculateDistance (aM.Character.HumanoidRootPart.Position)
    end) 
    
    return v4
end 


remilia.Cache.Blacklist = {[tostring(LocalPlayer)] = true}
function FindEnemy() 
    pcall(function() 
        oe = remilia.Enemy.player
    end) 
    found = false
    for _, v11 in GetPlayersAsSortedDistance() do 
        v12 = Hi(v11) 
        print(1, remilia.Cache.Blacklist[v11.Name] , v12:IsAlive() , v12:CheckIsPlayerLevelInRange() , not v12:IsOnSafezone())
        if not remilia.Cache.Blacklist[v11.Name] and v12:IsAlive() and v12:CheckIsPlayerLevelInRange() and  (function() 
            for _, v in remilia.Data.NPCs["Set Home Point"] do 
                
                if v11:DistanceFromCharacter(v.p) < 2000 then
                    print(3)
                    return true end
            end
            return false
        end)() and (function() 
        local pdf = v11 and v11:FindFirstChild("Data") and v11.Data:FindFirstChild('DevilFruit') and v11.Data.DevilFruit.Value
        for _, v in {"Buddha-Buddha", "Portal-Portal", "Kitsune-Kitsune"} do 
            if tostring(v) == tostring(pdf) then 
                print(v, pdf)
                return false 
            end
        end 
        print(4)
        return true
        end)() and v12:GetPosition() and v12:GetPosition().Y < 3000
        then 
            
            print(5)
            if tostring(LocalPlayer.Team) == "Pirates" or tostring(v11.Team) == "Pirates" then 
                print(6)
                remilia.Cache.Blacklist[v11.Name] = true
                remilia.Enemy = v12
                warn("Found Enemy")
                found = true 
                break
            end
        end 
    end
    
    alert("Next Player", tostring((remilia.Enemy or {}).player))
    wait()
    if found == false then 
        alert("Hop Server", "Due No Enemy Left")
        Hop() 
        
    end 
end 


    
    spawn(function()
        local gg = getrawmetatable(game)
        local old = gg.__namecall
        setreadonly(gg, false)
        gg.__namecall = newcclosure(function(...)
            local method = getnamecallmethod()
            local args = {...}
            if tostring(method) == "FireServer" then
                if tostring(args[1]) == "RemoteEvent" then
                    if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                        if remilia and remilia.Enemy and remilia.Enemy:GetHumanoidRootPart() then
                            args[2] = remilia.Enemy:GetHumanoidRootPart().Position
                            return old(unpack(args))
                        end
                    end
                end
            end
            return old(...)
        end)
    end)
local old; 
old = hookfunction(require(game.ReplicatedStorage.Notification).new, function(a, b) 
    v13 = tostring(a) .. tostring(b)
    
    if string.find(string.lower(v13), "player") then if remilia.Enemy and remilia.Enemy:getDistance() < 100 then 
            alert("Remilia", "Skip Player Cuz Enemy Doesnt Enabled PvP")
            FindEnemy() 
        end 
    end 
    return old(a, b)
end)


function getPortal(check2)
    local check3 = check2.Position
    local gQ =
        ({
        {
            Vector3.new(-7894.6201171875, 5545.49169921875, -380.246346191406),
            Vector3.new(-4607.82275390625, 872.5422973632812, -1667.556884765625),
            Vector3.new(61163.8515625, 11.759522438049316, 1819.7841796875),
            Vector3.new(3876.280517578125, 35.10614013671875, -1939.3201904296875)
        },
        {
            Vector3.new(-288.46246337890625, 306.130615234375, 597.9988403320312),
            Vector3.new(2284.912109375, 15.152046203613281, 905.48291015625),
            Vector3.new(923.21252441406, 126.9760055542, 32852.83203125),
            Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422)
        },
        {
            Vector3.new(-5058.77490234375, 314.5155029296875, -3155.88330078125),
            Vector3.new(5756.83740234375, 610.4240112304688, -253.9253692626953),
            Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125),
            Vector3.new(-11993.580078125, 334.7812805175781, -8844.1826171875),
            Vector3.new(5314.58203125, 25.419387817382812)
        }
    })[getgenv().remilia.Data.Sea]

    local aM, aN = Vector3.new(0, 0, 0), math.huge
    for _, aL in pairs(gQ) do
        if (aL - check3).Magnitude < aN and aM ~= aL then
            aM, aN = aL, (aL - check3).Magnitude
        end
    end
    return aM
end

function shizukuhuhu(is)
    wait(.5)
    pcall(function()
    repeat
        task.wait()
        game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(15)
        LocalPlayer.Character.HumanoidRootPart.CFrame = is
    until LocalPlayer.Character.PrimaryPart.CFrame == is
    game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid", 9):ChangeState(15)
    LocalPlayer.Character:SetPrimaryPartCFrame(is)
    wait(0.1)
    LocalPlayer.Character.Head:Destroy()
    repeat
        task.wait()
    until LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0
    repeat
        task.wait()
    until LocalPlayer.Character:FindFirstChild("Head")
    wait(0.5)
    end)
end

function getSpawn(pos)
    pos = Vector3.new(pos.X, pos.Y, pos.Z)
    local lll, mmm = nil, math.huge
    for i, v in pairs(getgenv().remilia.Data["NPCs"]["Set Home Point"]) do
        if (v.p - pos).Magnitude < mmm then
            lll = v
            mmm = (v.p - pos).Magnitude
        end
    end
    return lll
end


function CaculateDistance(I, II)
    if not II then
        II = game.Players.LocalPlayer.Character.PrimaryPart.CFrame
    end

    return (Vector3.new(I.X, I.Y, I.Z) - Vector3.new(II.X, I.Y, II.Z)).Magnitude
end

local v69 = { ["Last Resort"]=1, ["Agility"]=1, ["Water Body"]=1, ["Heavenly Blood"]=1, ["Heightened Senses"]=1, ["Energy Core"]=1 } 

function tablefind(t, g) 
  for _, v in t do 
    if v == g then 
      return true 
    end 
  end 
end 

function CheckIsResetable()
    for _, v in LocalPlayer.Character:GetChildren() do
        if v:IsA("Tool") and (not v.ToolTip or v.ToolTip == "") then
            if not (v69[tostring(v)]) then
                 return false
            end
        end
    end
    for _, v in LocalPlayer.Backpack:GetChildren() do
        if v:IsA("Tool") and (not v.ToolTip or v.ToolTip == "") then
            if not (v69[tostring(v)]) then
                 return false
            end
        end
    end
    return true
end

FireRemotes(1, "BuyDragonTalon")
FireRemotes(1, "TravelZou")
function TweenTo(vg1, ne)
    
    (function()
        
    
    ne = (not ne); 
        pcall(
            function()
                tweenses:Cancel()
            end
        )
    
        
        if not LocalPlayer.Character:FindFirstChild("Humanoid") or LocalPlayer.Character.Humanoid.Health < 1 then
            wait(1)
            return
        end
    
        if LocalPlayer.Character.Humanoid.Sit then
            
            LocalPlayer.Character.Humanoid:ChangeState("Jumping")
        end
        
        if vg1.Y < 4 then 
            vg1 = CFrame.new(vg1.x, 6, vg1.z)
        end
    
     pos = PositionParser("CFrame", vg1)
     poshair = PositionParser("CFrame", vg1)
        local portal = getPortal(pos)
     
        if CaculateDistance(portal, pos) < CaculateDistance(pos) and CaculateDistance(portal) > 1000 then
            wait()
            FireRemotes(1, "requestEntrance", portal)
            wait(.5)
        end
        local bypasspos = getSpawn(pos)
        if CaculateDistance(pos) - CaculateDistance(bypasspos, pos) > 1000 and
                CaculateDistance(bypasspos) > 2500 and
                not CheckInCombat() and
                true
         then
            shizukuhuhu(bypasspos)
    
            return
        end
    
        for a, b in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if b:IsA "BasePart" then
                b.CanCollide = false
            end
        end
        if not game.Players.LocalPlayer.Character:WaitForChild "Head":FindFirstChild "eltrul" then
            local ngu = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.Head)
            ngu.Name = "eltrul"
            ngu.MaxForce = Vector3.new(0, math.huge, 0)
            ngu.Velocity = Vector3.new(0, 0, 0)
        end
        if ne and  CaculateDistance(pos) < 80 then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
            return
        end
    
        local plpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        local v52 = CaculateDistance(poshair) 
        if v52 > 350 then 
          v53 = 330
        elseif v52 > 250 then 
          v53 = 400 
        else 
          v53 = 500 
        end 
        divY = 0
        --[[if CaculateDistance(poshair) > 320 then 
            
            LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(GetPlayerCFrame().x, poshair.y+300, GetPlayerCFrame().Z))
            divY = 300
        end ]]
        tweenses =
            game:GetService("TweenService"):Create(
            game.Players.LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(CaculateDistance(pos) / v53, Enum.EasingStyle.Linear),
            {CFrame = CFrame.new(poshair.X, poshair.Y+divY, poshair.Z)}
        )
        tweenses:Play()
    end)()

end
 
 
 function CheckInCombat() 
     return LocalPlayer.PlayerGui.Main.InCombat.Visible and LocalPlayer.PlayerGui.Main.InCombat.Text and (string.find(string.lower(LocalPlayer.PlayerGui.Main.InCombat.Text),"risk"))
 end 
 
 
 function BigHitbox() 
     pcall(function()
        local old = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
        local com = getupvalue(old, 2)
        com.activeController.hitboxMagnitude = 6000
    end) 
 end

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("FX").OnClientEvent:Connect(function(a, b, c)
    f = b 
    for d, e in c do 
       f[d] = e 
    end 
    
    
    if not f.CFrame then return end 
    if tostring(f.Name) == "RingWind" then return end
   
    if game.Players.LocalPlayer:DistanceFromCharacter(f.CFrame.Position) < 100 then 
        remilia.Cache.DashTick = os.time() 
        print("Dashed")
    end
end )
function NoStun() 
    for _, v in LocalPlayer.Character.HumanoidRootPart:GetChildren() do 
        if v.Name == "BodyGyro" or v.Name == "BodyPosition" then 
            v:Destroy() 
            
        end 
    end 
end 


v15 = LocalPlayer.PlayerGui.Main.Skills


function EquipTool(name)
    for _, v in game.Players.LocalPlayer.Backpack:GetChildren() do
        
        if v:IsA("Tool") and tostring(v) == name or v.ToolTip == name then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v) 
            CurrentTool = tostring(v)
        end
    end
end 

function GetToolNameByToolTip(tp) 
    
    for _, v in LocalPlayer.Character:GetChildren() do 
        if v and v:IsA("Tool") and v.ToolTip == tp then 
            return v.Name
        end 
    end 
    for _, v in LocalPlayer.Backpack:GetChildren() do 
        if v and v:IsA("Tool") and v.ToolTip == tp then 
            return v.Name
        end 
    end 
end 

LocalPlayer.CharacterAdded:Connect(function() 
    wait()
    FireRemotes(1, "Buso")
end)
FireRemotes(1, "Buso")

function QueryWeapon() 
    v15 = LocalPlayer.PlayerGui.Main.Skills
    for v18, v19 in Config.Weapon do
        if v19.Enable then
        CurrentTool = GetToolNameByToolTip(v18)
        for v20, v21 in v19 do 
            if v20 == "Enable" then
            else
            v16 = not CurrentTool or not game.Players.LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(CurrentTool) or game.Players.LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(CurrentTool)[v20].Cooldown.AbsoluteSize.X < 5 
            if v16 and v21[1] then
                
                return {v18, v20, v21}
                end
            end
        end
        end
    end 
end

function getDirection(Origin, Position)
    return (Position - Origin).Unit * 10
end


do 
local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(...)
    local Method = (getnamecallmethod())
    local Arguments = {...}
    local self = Arguments[1]
    local callingscript = string.lower(tostring(getcallingscript())) 
 
    if false and tostring(self) == "Workspace" or tostring(self) == "workspace" and not checkcaller() then
        if callingscript == "mouse" and Method == "FindPartOnRayWithIgnoreList" and remilia and remilia.Enemy then 
            
          
          Arguments[2] = Ray.new(remilia.Enemy.player.Character.Head.Position, 1)  
          
        end 
    end 
   return oldNamecall(unpack(Arguments)) 
end))
end

function SendKey(key, hold)
    pcall(function()
    set_thread_identity(8) 
    game:service("VirtualInputManager"):SendKeyEvent(true, key, false, game)
    task.wait(hold)
    game:service("VirtualInputManager"):SendKeyEvent(false, key, false, game)
end) end 
 
 
function GetNearbyPlayer(v109)  
    v109 = v109 or 1000 
    for _, v in Players:GetPlayers() do 
        if tostring(v) ~= tostring(LocalPlayer) then
        v110 = Hi(v)()
            if v110 and CaculateDistance(v110) < v109 then 
                return v 
            end
        end
    end
end


  
  
  
  local Mouse = game.Players.LocalPlayer:GetMouse()
  Cac = hookmetamethod(game, "__index", newcclosure(function( self, Index )
      if self == Mouse then
          if Index == "Hit" or Index == "hit" and remilia.Enemy and remilia.Enemy:IsAlive() and remilia.Enemy:GetPosition() then
              return remilia.Enemy:GetPosition()
          end
      end
      return Cac(self, Index)
  end))





  local v30 = game:GetService("UserInputService")
  v31 = game.Players.LocalPlayer:GetMouse()
  v32 = (v30.TouchEnabled and v30.TouchTapInWorld) or v31.Button1Down 
  
  function BanGunChiuChiuChiu() 
      for _, v4 in getconnections(v32) do
          if type(v4.Function) == "function" and debug.getinfo(v4.Function).name == "inputAndReload" then
              v4.Function()
          end
      end 
  end
  
  
angle = 0 
function Circle(Pos, Size, Speed) 
    if false then 
        return Pos 
    end 
    
    angle = angle + Speed
    return pos + Vector3.new(math.sin(math.rad(angle)) * Size, 0, math.cos(math.rad(angle)) * Size)
end

task.spawn(function() 
    while wait() do 
        SendKey("Q") 
        SendKey("Y") 
        SendKey("T")
        CurrentWeaponData = QueryWeapon()
    end 
end)
 
 local function predictPosition(part, timeInterval)
    return part.Position + part.Velocity * timeInterval
end 

function Hop() 
    function bQ(v)
        if v.Name == "ErrorPrompt" then
            if v.Visible then
                if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                    v.Visible = false
                end
            end
            v:GetPropertyChangedSignal("Visible"):Connect(function()
                if v.Visible then
                    if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                        v.Visible = false
                    end
                end
            end)
        end
    end
    for i, v in game.CoreGui.RobloxPromptGui.promptOverlay:GetChildren() do
        bQ(v) 
    end
    game.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(bQ)
    
    while wait() do
        TweenTo(CFrame.new(0, math.random(1000,5000), 0)) 
        if not CheckInCombat() then
            LocalPlayer.PlayerGui.ServerBrowser.Frame.Filters.SearchRegion.TextBox.Text = "Singapore"
            for r = 1, math.huge do
                for k, v in game.ReplicatedStorage.__ServerBrowser:InvokeServer(r) do
                    if k ~= game.JobId and v["Count"] <= 10 then
                        game.ReplicatedStorage.__ServerBrowser:InvokeServer("teleport", k)
                    end
                end
            end
        end
    end
end
function disp_time(time, cc)

            time = tonumber(time)

            if not time then return "[err]" end
            local days = math.floor(time/86400)
            local hours = math.floor(math.fmod(time, 86400)/3600)
            local minutes = math.floor(math.fmod(time,3600)/60)
            local seconds = math.floor(math.fmod(time,60))
            if cc then return  (days.."day, "..hours.."hrs, "..minutes.."min, "..seconds.."sec.") end
            return (days.."day, "..hours.."hrs.")
end 
OldPos = nil
function CaculateEnemyVelocity() 
    if not remilia.Enemy:IsAlive() then return end 
    OldPos = OldPos or remilia.Enemy:GetPosition().p
    dig = (remilia.Enemy:GetPosition().p-OldPos)*3
    OldPos = remilia.Enemy:GetPosition().p
    return dig
end

function ChangeStatus(txt)
    ScriptTask2:Set({Title="Script Status", Content=txt})
end 

phuoc = 0
phuoc2 = 0
pcall(function() 
    phuoc = tonumber(readfile("autobounty-"..tostring(LocalPlayer))) 
    phuoc2 = tonumber(readfile("autobounty2-"..tostring(LocalPlayer))) 
end)
StartTime  = os.time()
StartBty = game.Players.LocalPlayer.leaderstats["Bounty/Honor"].Value

game:GetService("RunService").Stepped:Connect(NoStun)
gay = function () 
    a, b = pcall(function() 
    while task.wait() do 
        if LocalPlayer:FindFirstChild("PlayerGui") and LocalPlayer.PlayerGui:FindFirstChild("ScreenGui") and LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
            else
                game:service("VirtualUser"):CaptureController()
                game:service("VirtualUser"):SetKeyDown("0x65")
                game:service("VirtualUser"):SetKeyUp("0x65")
            end 
        BigHitbox()
        NoStun()
        LocalPlayer.Character:SetAttribute("DashLength", 100)
        if not remilia.Enemy or not remilia.Enemy:IsAlive() or remilia.Enemy:GetHumanoid().Health < 0 then 
            alert("Remilia", "Skip Player Cuz Enemy Doesnt Exists Or Died") 
            FindEnemy() 
        end 
        if (elapsed and elapsed ~= 0 and os.time()-elapsed > 10 and not getsenv(game.ReplicatedStorage.GuideModule)["_G"]["InCombat"]) then 
            alert("Remilia", "Skip Player Cuz Enemy Doesnt Enabled PvP 2 ") 
            FindEnemy()
        end 
        if remilia.Enemy:isV4Enabled() then
            alert("Remilia", "Skip Player Cuz Enemy Is A V4 User")
            FindEnemy()
        end
        if elapsed and elapsed ~= 0 and os.time()-elapsed > 10 and remilia.Enemy and remilia.Enemy.player.Character:GetAttribute("InCombat") == false then 
               FindEnemy() 
        end
        
        if spectate then 
            workspace.CurrentCamera.CameraSubject = remilia.Enemy.player.Character 
            else 
                workspace.CurrentCamera.CameraSubject = LocalPlayer.Character 
        end 
            
        if ScriptTask then 
            ScriptTask:Set({
                Title = "Enemy", 
                Content = [[ Name: ]] .. tostring(remilia.Enemy.player) .. [[
 Health: ]] .. tostring(remilia.Enemy:GetHumanoid().Health) .. " / ".. tostring(remilia.Enemy:GetHumanoid().MaxHealth) ..[[
 Distance: ]] .. tostring(remilia.Enemy:getDistance())
            }) 
        end 
        pcall(function()
        writefile("autobounty-"..tostring(LocalPlayer), tostring((os.time()-StartTime)+phuoc)) 
        writefile("autobounty2-"..tostring(LocalPlayer), tostring((game.Players.LocalPlayer.leaderstats["Bounty/Honor"].Value-StartBty+phuoc2) or 0))
        end)
        if ScriptTask3 then 
            ScriptTask3:Set({Title = "Script Status", Content = [[ Elapsed: ]].. disp_time((os.time()-StartTime)+phuoc, 1).." Total Earned: "..game.Players.LocalPlayer.leaderstats["Bounty/Honor"].Value-StartBty+phuoc2})
        end 
        
        if LocalPlayer.PlayerGui.Main.PvpDisabled.Visible then
            ChangeStatus("Enabling PvP")
                FireRemotes(1, "EnablePvp")
        end 
        local v49 = remilia.LocalPlayer:GetHumanoid() 
        if v49 then 
            v17 = Config["Panic Mode"]
            if v17[1] and ( v49.Health < v17[2] or ( v20 and v49.Health < v17[3] ) ) then 
                v20 = true 
                local v21 = remilia.Enemy:GetPosition() 
                if v21 then 
                    v22 = v21.Y
                    if true and (500) then 
                        v22 = math.random(1000, 100000) 
                    end
                
                    TweenTo(CFrame.new(v21.X, v22, v21.Z+300))
                end 
                ChangeStatus("Hiding Cuz Low Health")
            elseif remilia.Enemy:getDistance() > 400 then
                TweenTo(remilia.Enemy:GetPosition(), true) 
                elapsed = 0
                ChangeStatus("Tweening To Enemy")
            else
                v57 = remilia.LocalPlayer:isDamaged()
                v58 = v57 and ( v57 or 0)  > 1000 
                if v58 then 
                    remilia.Enemy.damaged = true 
                end
                
                if remilia.Enemy.player.Character.Busy.Value or ( remilia.Cache.DashTick and ( (os.time() - remilia.Cache.DashTick or 50) < 2 ) ) or v58 then
                    TweenTo(remilia.Enemy:GetPosition()+Vector3.new(0,80*2,30))
                    ChangeStatus("Move Dashing")
                    if Config["Ultra Gay Gun Mode"] then 
                        EquipTool("Gun"); 
                        
                        BanGunChiuChiuChiu(); 
                    end 
                    if false then 
                        task.wait() 
                        BanGunChiuChiuChiu()
                        v23 = false 
                    end  
                
                elseif CurrentWeaponData then 
                    
                    repeat task.wait()  
                        velocity = remilia.Enemy:GetVelocity()/1.75
                        velocity2 = CaculateEnemyVelocity()
                        if velocity and velocity.magnitude == 0 then
                            print("Use sec velocity", velocity2)
                            velocity = velocity2
                        end
                        
                    TweenTo((remilia.Enemy:GetPosition()*CFrame.new(((math.random(1, 2) == 1 and 0) or -10),4,0))+(velocity/1.5))
                    
                    until remilia.Enemy:getDistance() < 70 
                    if elapsed == 0 then elapsed = os.time() end 
                    tuanbel = true
                    ChangeStatus("Send Skill: ".. tostring(CurrentWeaponData[1])..""..tostring(CurrentWeaponData[2]))
                    spawn(function()
                        while task.wait() and tuanbel and ( not remilia.Enemy.player.Character.Busy.Value or ( remilia.Cache.DashTick and ( (os.time() - remilia.Cache.DashTick or 50) >2 ) ) or not(v57 and ( v57 or 0)  > 1000) ) do
                            game:GetService"VirtualUser":ClickButton1(Vector2.new(1999, 1999)) 
                            
                            remilia.Enemy:GetHumanoidRootPart().Size = Vector3.new(100,100,100)
                            velocity = remilia.Enemy:GetVelocity() / 2
                                                    velocity2 = CaculateEnemyVelocity() 
                                                    
                                                        
                                                    if velocity2 and velocity2.magnitude < 0.2 then
                                                        velocity = velocity2
                                                    end
                                                 if velocity.magnitude == 0 then
                                                        TweenTo(remilia.Enemy:GetPosition()*CFrame.new(0, (math.random(1,2) == 2 and 20) or -5, (math.random(0,1) == 1 and 0) or 5))
                                                        else
                                                TweenTo(remilia.Enemy:GetPosition()+(velocity/3)+Vector3.new(0,(math.random(0,1) == 1 and -5) or 20,0))
end
                        end 
                    end) 
                    
                    --SuperBigHitbox()
                    EquipTool(CurrentWeaponData[1]) 
                    SendKey(CurrentWeaponData[2], CurrentWeaponData[3][2]) 
                   repeat wait() until not LocalPlayer.Character.Busy.Value  
                   
                    remilia.Cache.DashTick = 0
                    tuanbel = nil
                else 
                    if remilia.Enemy:GetHumanoid() and remilia.Enemy:GetHumanoid().Health < 2000 then 
                        TweenTo(remilia.Enemy:GetPosition()*CFrame.new(0,0,-6)) 
                        EquipTool("Melee") 
                        game:GetService"VirtualUser":ClickButton1(Vector2.new(1999, 1999)) 
                    else
                    TweenTo(remilia.Enemy:GetPosition() + Vector3.new(0,50,-50))
                    EquipTool("Gun") 
                    BanGunChiuChiuChiu()
                    end
                end
            end
        end 
    end  
end) 
if not a then warn(b) return gay() end end
gay()
