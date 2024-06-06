repeat task.wait() until game:IsLoaded() and game.Players.LocalPlayer 
getgenv().ServerData = {} 
function Join(v2) 
    v2 = tostring(v2) or "Pirates"
    v2 = string.find(v2,"Marine") and "Marines" or "Pirates"
    for i, v in pairs(
        getconnections(
            game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container[v2].Frame.TextButton.Activated
        )
    ) do
        v.Function()
    end
end
if not game.Players.LocalPlayer.Team then 
    repeat
        pcall(
            function()
                task.wait()
                if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main"):FindFirstChild("ChooseTeam") then 
                    Join(getgenv().Team)
                end
            end
        )
    until game.Players.LocalPlayer.Team ~= nil 
end
local RunService= game:GetService("RunService")
function RemoveLevelTitle(v)
    return tostring(tostring(v):gsub(" %pLv. %d+%p", ""):gsub(" %pRaid Boss%p", ""):gsub(" %pBoss%p", ""))
end 
if game.Workspace:FindFirstChild("MobSpawns") then
    for i, v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "MobSpawns" then
            v:Destroy()
        end
    end
end
loadstring(game:HttpGet('https://raw.githubusercontent.com/memaybeohub/Function-Scripts/main/FastAttackLoading.lua'))()
loadstring(game:HttpGet('https://raw.githubusercontent.com/memaybeohub/Function-Scripts/main/HopLoader.lua'))()
function GetDistance(target1, taget2)
    if not taget2 then
        taget2 = game.Players.LocalPlayer.Character.HumanoidRootPart
    end
    local bbos, bbos2 =
        pcall(
        function()
            a = target1.Position
            a2 = taget2.Position
        end
    )
    if bbos then
        a = target1.Position
        a2 = taget2.Position
        return (a - a2).Magnitude
    end
end
local MobSpawnsFolder = Instance.new("Folder")
MobSpawnsFolder.Parent = game.Workspace
MobSpawnsFolder.Name = "MobSpawns"
MobSpawnsFolder.ChildAdded:Connect(function(v)
    wait(1)
    v.Name = RemoveLevelTitle(v.Name)
end)
local AllMobInGame = {}
for i, v in next, require(game:GetService("ReplicatedStorage").Quests) do
    for i1, v1 in next, v do
        for i2, v2 in next, v1.Task do
            if v2 > 1 then
                table.insert(AllMobInGame, i2)
            end
        end
    end
end
local MobOutFolder = {}
for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
    v.Name = RemoveLevelTitle(v.Name)
    table.insert(MobOutFolder, v)
end
for i, v in pairs(getnilinstances()) do
    if table.find(AllMobInGame, RemoveLevelTitle(v.Name)) then
        table.insert(MobOutFolder, v)
    end
end

function ReCreateMobFolder()
    local l1 = {}
    local MobNew
    for i,v in pairs(MobOutFolder) do 
        if v then
            if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") then
                MobNew = Instance.new("Part")
                MobNew.CFrame = v.PrimaryPart.CFrame
                MobNew.Name = v.Name
                MobNew.Parent = game.Workspace.MobSpawns
            elseif v:IsA("Part") then
                MobNew = v:Clone()
                MobNew.Parent = game.Workspace.MobSpawns
                MobNew.Transparency = 1
            end
            if not table.find(l1,v.Name) then 
                table.insert(l1,tostring(v.Name))
            end 
        end
    end
    warn('Created: '..tostring(#game.Workspace.MobSpawns:GetChildren()).." ("..tostring(#l1).."/"..#AllMobInGame..") Mob Spawns")
end
ReCreateMobFolder()
local MobSpawnClone = {}
local function getMid(vName,gg)
    local total = 0
    local allplus 
    for i,v in pairs(gg) do
        if v.Name == vName then 
            if not allplus then 
                allplus = v.Position
            else
                allplus = allplus+v.Position 
            end
            total = total+1
        end
    end
    if allplus then return allplus/total end 
end
local lss = 0
for i,v in pairs(game.Workspace.MobSpawns:GetChildren()) do 
    if not MobSpawnClone[v.Name] then 
        MobSpawnClone[v.Name] = CFrame.new(getMid(v.Name,game.Workspace.MobSpawns:GetChildren()))
        lss = lss +1
    end 
end
warn('Loaded total',lss,' mobs middle spawns')
getgenv().MobSpawnClone = MobSpawnClone
function GetMobSpawnList(a)
    local a = RemoveLevelTitle(a)
    k = {}
    for i, v in pairs(game.Workspace.MobSpawns:GetChildren()) do
        if v.Name == a then
            table.insert(k, v)
        end
    end
    return k
end

local BlackListLocation = {}
function CheckNearestTeleporter(vcs)
    vcspos = vcs.Position
    min = math.huge
    min2 = math.huge
    local placeId = game.PlaceId
    if placeId == 2753915549 then
        OldWorld = true
    elseif placeId == 4442272183 then
        NewWorld = true
    elseif placeId == 7449423635 then
        ThreeWorld = true
    end
    local chooseis
    if ThreeWorld then
        TableLocations = {
            ["Caslte On The Sea"] = Vector3.new(-5058.77490234375, 314.5155029296875, -3155.88330078125),
            ["Hydra"] = Vector3.new(5756.83740234375, 610.4240112304688, -253.9253692626953),
            ["Mansion"] = Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125),
            ["Great Tree"] = Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586),
            ["Ngu1"] = Vector3.new(-11993.580078125, 334.7812805175781, -8844.1826171875),
            ["ngu2"] = Vector3.new(5314.58203125, 25.419387817382812, -125.94227600097656),
            ["Temple Of Time"] = Vector3.new(2957.833740234375, 2286.495361328125, -7217.05078125)
        }
    elseif NewWorld then
        TableLocations = {
            ["Mansion"] = Vector3.new(-288.46246337890625, 306.130615234375, 597.9988403320312),
            ["Flamingo"] = Vector3.new(2284.912109375, 15.152046203613281, 905.48291015625),
            ["122"] = Vector3.new(923.21252441406, 126.9760055542, 32852.83203125),
            ["3032"] = Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422)
        }
    elseif OldWorld then
        TableLocations = {
            ["1"] = Vector3.new(-7894.6201171875, 5545.49169921875, -380.2467346191406),
            ["2"] = Vector3.new(-4607.82275390625, 872.5422973632812, -1667.556884765625),
            ["3"] = Vector3.new(61163.8515625, 11.759522438049316, 1819.7841796875),
            ["4"] = Vector3.new(3876.280517578125, 35.10614013671875, -1939.3201904296875)
        }
    end
    local mmbb = {}
    for i2, v2 in pairs(TableLocations) do
        if not table.find(BlackListLocation, i2) then
            mmbb[i2] = v2
        end
    end
    local TableLocations = mmbb
    local TableLocations2 = {}
    for i, v in pairs(TableLocations) do
        if typeof(v) ~= "table" then
            TableLocations2[i] = (v - vcspos).Magnitude
        else
            TableLocations2[i] = (v["POS"] - vcspos).Magnitude
        end
    end
    for i, v in pairs(TableLocations2) do
        if v < min then
            min = v
            min2 = v
        end
    end
    for i, v in pairs(TableLocations2) do
        if v < min then
            min = v
            min2 = v
        end
    end
    for i, v in pairs(TableLocations2) do
        if v <= min then
            choose = TableLocations[i]
            chooseis = i
        end
    end
    min3 = (vcspos - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if min2 + 100 <= min3 then
        return choose, chooseis
    end
end
function requestEntrance(vector3, fr)
    if not fr or fr ~= "Temple Of Time" and fr ~= "Dismension" then
        args = {
            "requestEntrance",
            vector3
        }
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
        oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        char = game.Players.LocalPlayer.Character.HumanoidRootPart
        char.CFrame = CFrame.new(oldcframe.X, oldcframe.Y + 50, oldcframe.Z)
        task.wait(0.5)
    else
        pcall(
            function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                    "requestEntrance",
                    Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586)
                )
                if GetDistance(CFrame.new(28282.5703125, 14896.8505859375, 105.1042709350586)) > 10 then
                    return
                end
                game.Players.LocalPlayer.Character:MoveTo(
                    CFrame.new(
                        28390.7812,
                        14895.8574,
                        106.534714,
                        0.0683786646,
                        1.44424162e-08,
                        -0.997659445,
                        7.52342522e-10,
                        1,
                        1.45278642e-08,
                        0.997659445,
                        -1.74397752e-09,
                        0.0683786646
                    ).Position
                )
                AllNPCS = getnilinstances()
                for i, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
                    table.insert(AllNPCS, v)
                end
                for i, v in pairs(AllNPCS) do
                    if v.Name == "Mysterious Force" then
                        TempleMysteriousNPC1 = v
                    end
                    if v.Name == "Mysterious Force3" then
                        TempleMysteriousNPC2 = v
                    end
                end
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                    TempleMysteriousNPC2.HumanoidRootPart.CFrame
                wait(0.3)
                if
                    (TempleMysteriousNPC2.HumanoidRootPart.Position -
                        game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 15
                 then
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "TeleportBack")
                end
                wait(0.75)
            end
        )
    end
end
function AntiLowHealth(NewY)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
        CFrame.new(
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
        NewY,
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
    )
    wait()
end
function GetMidPoint(MobName, b2)
    if MobName == "Ship Officer [Lv. 1325]" then
        return b2.CFrame
    end
    if 1 > 1 then
        return b2.CFrame
    end
    local totalpos
    allid = 0
    for i, v in pairs(game.workspace.Enemies:GetChildren()) do
        if
            v.Name == MobName and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                (b2 and GetDistance(v.HumanoidRootPart, b2) <= 475)
         then
            if not totalpos then
                totalpos = v.HumanoidRootPart.Position
            elseif totalpos then
                totalpos = totalpos + v.HumanoidRootPart.Position
            end
            allid = allid + 1
        end
    end
    if totalpos then
        return totalpos / allid
    end
end 
function TweenObject(TweenCFrame,obj,ts)
    if not ts then ts = 350 end
    local tween_s = game:service "TweenService"
    local info =
        TweenInfo.new(
        (TweenCFrame.Position -
            obj.Position).Magnitude /
            ts,
        Enum.EasingStyle.Linear
    )
    getgenv().TweenObject =
        tween_s:Create(
            obj,
        info,
        {CFrame = TweenCFrame}
    )
    getgenv().TweenObject:Play() 
end
function IsPlayerAlive(player)
    if not player then
        player = game.Players.LocalPlayer
    end

    -- Kiểm tra xem đối tượng player có tồn tại và là một người chơi hợp lệ không
    if not player or not player:IsA("Player") then
        return false -- Trả về false nếu không phải là người chơi
    end

    -- Kiểm tra trạng thái nhân vật của người chơi
    local character = player.Character or player:FindFirstChild('Character')
    if not character then
        return false -- Trả về false nếu không có nhân vật
    end

    -- Kiểm tra thanh máu của nhân vật (Humanoid)
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid or humanoid.Health <= 0 then
        return false -- Trả về false nếu không có Humanoid hoặc máu bằng 0
    end

    -- Nếu tất cả các điều kiện trên đều thỏa mãn, người chơi còn sống
    return true 
end
function CheckPlayerAlive()
    local a2,b2 = pcall(function() return game:GetService("Players").LocalPlayer.Character.Humanoid.Health > 0 end)
    task.wait()
    if a2 then return b2 end 
end 
local function LoadPlayer() 
    if not IsPlayerAlive() then repeat task.wait(.1) until IsPlayerAlive() end
    if IsPlayerAlive() then
        if not game.Players.LocalPlayer.Character:FindFirstChild("Fast Attack") then
            local FastAttackIn = Instance.new("BoolValue")
            FastAttackIn.Parent = game.Players.LocalPlayer.Character
            FastAttackIn.Value = false
            FastAttackIn.Name = 'Fast Attack'
        end
        if not game.Players.LocalPlayer.Character:FindFirstChild("Fast Attack Delay") then
            local FastAttackDelayIn = Instance.new("NumberValue")
            FastAttackDelayIn.Name = 'Fast Attack Delay'
            FastAttackDelayIn.Parent = game.Players.LocalPlayer.Character
            FastAttackDelayIn.Value = 0.3
        end
        if not game.Players.LocalPlayer.Character:FindFirstChild("Aimbot") then 
            local AimBot_Togg = Instance.new("BoolValue")
            AimBot_Togg.Parent = game.Players.LocalPlayer.Character
            AimBot_Togg.Value = false
            AimBot_Togg.Name = 'Aimbot'
        end
        if not game.Players.LocalPlayer.Character:FindFirstChild("Aimbot Position") then
            local vector3Value = Instance.new("Vector3Value")
            vector3Value.Name = "Aimbot Position"
            vector3Value.Parent = game.Players.LocalPlayer.Character
            vector3Value.Value = Vector3.new(1, 2, 3)
        end
        getgenv().ServerData["PlayerBackpack"] = {}
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do 
            if not getgenv().ServerData["PlayerBackpack"][v.Name] then 
                getgenv().ServerData["PlayerBackpack"][v.Name] = v 
            end
        end 
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
            if not getgenv().ServerData["PlayerBackpack"][v.Name] then 
                getgenv().ServerData["PlayerBackpack"][v.Name] = v 
            end
        end 
        if not game.Players.LocalPlayer.Character:FindFirstChild("Teleport Access") then 
            wait(1)
            if not game.Players.LocalPlayer.Character:FindFirstChild("Teleport Access") then
                local TweenAccess = Instance.new("IntValue")
                TweenAccess.Name = "Teleport Access"
                TweenAccess.Parent = game.Players.LocalPlayer.Character 
                game.Players.LocalPlayer.Character.ChildAdded:Connect(function()
                    getgenv().ServerData["PlayerBackpack"] = {}
                    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do 
                        if not getgenv().ServerData["PlayerBackpack"][v.Name] then 
                            getgenv().ServerData["PlayerBackpack"][v.Name] = v 
                        end
                    end 
                    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
                        if not getgenv().ServerData["PlayerBackpack"][v.Name] then 
                            getgenv().ServerData["PlayerBackpack"][v.Name] = v 
                        end
                    end 
                    wait(.5)
                    if IsPlayerAlive() and game.Players.LocalPlayer.Character:FindFirstChildOfClass('Tool') then 
                        local bozo = require(game:GetService("ReplicatedStorage").ClientWeapons).divineart
                        for i,v in pairs(bozo) do 
                            if typeof(v) == 'function' then 
                                bozo[i] = function() end 
                            end
                        end
                        getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))[2].activeController.data = bozo
                    end
                end)
            end
            task.spawn(function()
                if EquipAllWeapon then 
                    EquipAllWeapon() 
                end
            end)
        end

    end
end
game.workspace.Characters.ChildAdded:Connect(LoadPlayer)
getgenv().Ticktp = tick()
function Tweento(targetCFrame)
    if CheckPlayerAlive() then
        if not game.Players.LocalPlayer.Character:FindFirstChild("Teleport Access") then
            return warn('I cant tween right now: Teleport Perm Missing')
        end
        if not TweenSpeed or type(TweenSpeed) ~= "number" then
            TweenSpeed = 325
        end
        if AntiLowHealthting then
            return
        end
        
        local TargetY = targetCFrame.Y
        local targetCFrameWithDefualtY = CFrame.new(targetCFrame.X, DefualtY, targetCFrame.Z)
        local targetPos = targetCFrame.Position
        local oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        local Distance =
            (targetPos -
            game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude
        if Distance <= 300 and tick() - getgenv().Ticktp >= 0.01 then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetCFrame
            getgenv().Ticktp = tick()
            return
        end
        local bmg, bmg2 = CheckNearestTeleporter(targetCFrame)
        if bmg then
            local timetry = 0
            repeat
                pcall(
                    function()
                        getgenv().tween:Cancel()
                    end
                )
                wait()
                requestEntrance(bmg, bmg2)
                timetry = timetry + 1
            until not CheckNearestTeleporter(targetCFrame) or timetry >= 10
            if timetry >= 10 and CheckNearestTeleporter(targetCFrame) then
                if bmg2 == "Temple Of Time" then
                    table.insert(BlackListLocation, bmg2)
                end
                game.Players.LocalPlayer.Character.Humanoid.Health = 0
            end
        end
        local b1 =
            CFrame.new(
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
            DefualtY,
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
        )
        if DoNotTweenInThisTime then
            CancelTween()
            return
        end 
        local tweenfunc = {}
        local tween_s = game:service "TweenService"
        local info =
            TweenInfo.new(
            (targetPos -
                game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude /
                TweenSpeed,
            Enum.EasingStyle.Linear
        )
        getgenv().tween =
            tween_s:Create(
            game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"],
            info,
            {CFrame = targetCFrame}
        )
        getgenv().tween:Play()
        function tweenfunc:Stop()
            getgenv().tween:Cancel()
        end
        getgenv().TweenStats = getgenv().tween.PlaybackState
        tween.Completed:Wait()
        getgenv().TweenStats = getgenv().tween.PlaybackState
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
            TargetY,
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
        )
        return tweenfunc 
    end
end  
function GetCFrameADD(v2)
    task.wait()
    if game.Players.LocalPlayer.Character.Humanoid.Sit then 
        SendKey('Space',.5) 
    end
    return CFrame.new(0,40,0)
end 
local TweenK
local function TweenKill(v)
    if not CheckPlayerAlive() then return end
    if v and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then  
        local DISCC = GetDistance(v.HumanoidRootPart)
        if DISCC > 1000 then 
            Tweento(v.HumanoidRootPart.CFrame * GetCFrameADD())
        elseif DISCC > 3 then
            local tweenfunc = {}
            local tween_s = game:service "TweenService"
            local info =
                TweenInfo.new(
                GetDistance(v.HumanoidRootPart) /
                    300,
                Enum.EasingStyle.Linear
            )
            if GetDistance(v.HumanoidRootPart) < 200 then 
                if getgenv().tween then 
                    getgenv().tween:Cancel()
                    TweenK = nil 
                end
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * GetCFrameADD() 
            else 
                getgenv().tween =
                    tween_s:Create(
                    game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"],
                    info,
                    {CFrame = v.HumanoidRootPart.CFrame * GetCFrameADD()}
                )
                getgenv().tween:Play() 
            end
        end
    end
    task.wait()
end
function IsBoss(nv,raidb)
    if typeof(nv) == "string" then 
        nv = CheckBoss(nv).Name
        if nv:find("Friend") then 
            return true 
        end
    end
    if nv then 
        local Bossb = raidb and "Raid Boss" or not raidb and "Boss"
        local a,b = pcall(function()
            if nv.Humanoid.DisplayName and string.find(nv.Humanoid.DisplayName,Bossb)  then 
                return true 
            end 
            return false
        end)
        if a then return b end
    end
end
function GetMidPointPart(tbpart)
    local pascal
    local allpas = 0
    for i, v in pairs(tbpart) do
        pcall(
            function()
                if not pascal then
                    pascal = v.Position
                else
                    pascal = pascal + v.Position
                end
                allpas = allpas + 1
            end
        )
    end
    return pascal / allpas
end
function EnableBuso()
    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
        NoClip = true
        local args = {
            [1] = "Buso"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        NoClip = false
    end
end  
function GetWeapon(wptype)
    local s = ""
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") and v.ToolTip == wptype then
            s = v.Name
        end
    end
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") and v.ToolTip == wptype then
            s = v.Name
        end
    end
    return s
end
function EquipWeapon(ToolSe)
    if TickBuyMelee and tick() - TickBuyMelee < 5 then
        MMBStatus = "Waitting times to equipweapon"
        return MMBStatus
    end
    if gggggg then
        return
    end
    if lonmemayto == "" or lonmemayto == nil then
        lonmemayto = "Melee"
    end
    ToolSe = GetWeapon(lonmemayto)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
        wait(.4)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
    end
end 
function AddBodyVelocity(enable)
    if not enable then  
        if game.Players.LocalPlayer.Character.Head:FindFirstChildOfClass("BodyVelocity") then 
            game.Players.LocalPlayer.Character.Head:FindFirstChildOfClass("BodyVelocity"):Destroy()
        end
        return
    end
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do 
        if v:IsA("BasePart") or v:IsA("Part") then 
            v.CanCollide = false 
        end
    end
    if not game.Players.LocalPlayer.Character.Head:FindFirstChild("NEWQL") then 
        local OV = Instance.new("BodyVelocity",game.Players.LocalPlayer.Character.Head)
        OV.Velocity = Vector3.new(0, 0, 0)
        OV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        OV.P = 15000
        OV.Name = "NEWQL"
    end
end
local Elites = {
    "Deandre [Lv. 1750]",
    "Urban [Lv. 1750]",
    "Diablo [Lv. 1750]"
}
local KillingBoss
local KillingMobTick = tick()-10
local MobUsingSkill = false
function KillNigga(MobInstance) 
    local LS,LS2 = pcall(function()
        if IsPlayerAlive() and
        MobInstance and MobInstance:FindFirstChild("Humanoid") and
        MobInstance.Humanoid.Health > 0
        then
            local mmas = GetMidPoint(MobInstance.Name, MobInstance.HumanoidRootPart)
            local LockCFrame
            if mmas and not string.find(MobInstance.Name, "Boss") and MobInstance.Humanoid.MaxHealth < 130000 then
                LockCFrame = CFrame.new(mmas)
            else
                LockCFrame = MobInstance.HumanoidRootPart.CFrame
                KillingBoss = true
            end
            local N_Name = MobInstance.Humanoid.Name
            if string.find(N_Name, "Boss") or table.find(Elites, N_Name) then
                if not string.find(N_Name, "Boss") then
                    for i, v in pairs(Elites) do
                        if RemoveLevelTitle(v) == RemoveLevelTitle(N_Name) then
                            KillingBoss = true
                        end
                    end
                else
                    KillingBoss = true
                end
            end
            if IsBoss(MobInstance) then 
                KillingBoss = true 
            end
            if not KillingBoss then
                --CheckReqHop(Nasga.HumanoidRootPart.CFrame,Nasga)
            end
            for i, v in pairs({
                "Deandre [Lv. 1750]",
                "Urban [Lv. 1750]",
                "Diablo [Lv. 1750]"
            }) do
                if RemoveLevelTitle(v) == RemoveLevelTitle(MobInstance.Name) then
                    KillingBoss = true
                end
            end
            task.delay(.1 ,function()
                repeat task.wait() until GetDistance(MobInstance.PrimaryPart) < 100
                BringMob(MobInstance, LockCFrame) 
            end)            
            repeat
                task.wait()
                if IsPlayerAlive() then 
                    KillingMob = true
                    KillingMobTick = tick()
                    AddBodyVelocity(true)
                    EquipWeapon()
                    TweenKill(MobInstance)
                    game.Players.LocalPlayer.Character:FindFirstChild("Fast Attack").Value = true 
                else 
                    game.Players.LocalPlayer.Character:FindFirstChild("Fast Attack").Value = false
                    wait(1)
                end
            until not MobInstance or not MobInstance:FindFirstChild("Humanoid") or not MobInstance:FindFirstChild("HumanoidRootPart") or
            MobInstance.Humanoid.Health <= 0 or not IsPlayerAlive() or 
                CheckIsRaiding()
            KillingMobTick = 0
            game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
            KillingMob = false
            game.Players.LocalPlayer.Character:FindFirstChild("Fast Attack").Value = false
            game.Players.LocalPlayer.Character:FindFirstChild("Fast Attack").Value = false 
            game.Players.LocalPlayer.Character['Aimbot'].Value = false
            AddBodyVelocity(false)
        end
    end)
    if not LS then print('ls',LS2) end
end  
function CheckMob(mobormoblist,rep)
    if typeof(mobormoblist) == 'table' then 
        for i,v in pairs(mobormoblist) do 
            for __,v2 in pairs(game.workspace.Enemies:GetChildren()) do 
                if RemoveLevelTitle(v) == RemoveLevelTitle(v2.Name) and v2:FindFirstChild('Humanoid') and v2.Humanoid.Health > 0 then 
                    return v2
                end
            end
        end
        if rep then 
            for i,v in pairs(mobormoblist) do 
                for __,v2 in pairs(game.ReplicatedStorage:GetChildren()) do 
                    if RemoveLevelTitle(v) == RemoveLevelTitle(v2.Name) and v2:FindFirstChild('Humanoid') and v2.Humanoid.Health > 0 then 
                        return v2
                    end
                end
            end
        end
    else
        for i,v in pairs(game.workspace.Enemies:GetChildren()) do 
            if RemoveLevelTitle(v.Name) == RemoveLevelTitle(mobormoblist) and v:FindFirstChild('Humanoid') and v.Humanoid.Health > 0 then 
                return v
            end
        end
        if rep then 
            for i,v in pairs(game.ReplicatedStorage:GetChildren()) do 
                if RemoveLevelTitle(v.Name) == RemoveLevelTitle(mobormoblist) and v:FindFirstChild('Humanoid') and v.Humanoid.Health > 0 then 
                    return v
                end
            end
        end
    end
end
function getMobSpawnbyList(MobList)
    local Returner = {}
    for i,v in pairs(MobList) do 
        if MobSpawnClone[v] then 
            table.insert(Returner,MobSpawnClone[v])
        end
    end
    return Returner  
end
function KillMobList(MobList)
    for i,v in pairs(MobList) do 
        MobList[i] = RemoveLevelTitle(v)
    end
    local NM = CheckMob(MobList)
    if NM then 
        KillNigga(NM)
    else
        local MS = getMobSpawnbyList(MobList) 
        if MS then 
            for i,v in pairs(MS) do 
                if not CheckMob(MobList) and v then 
                    Tweento(v * CFrame.new(0,50,0))
                    wait(1)
                end
            end
        end
    end
end
function KillBoss(BossInstance)
    if not BossInstance:FindFirstChild('Humanoid') then return end 
    warn('Killing boss:',BossInstance.Name)
    if not game.Workspace.Enemies:FindFirstChild(BossInstance.Name) then 
        Tweento(BossInstance.PrimaryPart.CFrame * CFrame.new(0,50,0))
    end
    KillNigga(BossInstance)
end
function BringMob(TAR,V5)
    if not TAR then 
        return
    end
    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 3000+300)
    if not TAR:FindFirstChild("Bringed") then 
        local Bringed = Instance.new("IntValue",TAR)
        Bringed.Name = "Bringed" 
    else
        return
    end
    V6 = TAR.HumanoidRootPart.CFrame
    if V5 then 
        V6 = V5 
    end  
    if TAR then
        for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
            if
                RemoveLevelTitle(v.Name) == RemoveLevelTitle(TAR.Name) and
                    (V6.Position - v.HumanoidRootPart.Position).Magnitude < 340 and
                    (isnetworkowner2(v.HumanoidRootPart) or isnetworkowner(v.HumanoidRootPart)) and
                    v.Humanoid.MaxHealth < 100000
            then
                task.spawn(function()
                    for i,__ in pairs(v:GetDescendants()) do 
                        if __:IsA('BasePart') then 
                            __.CanCollide = false 
                            __.Transparency = 1
                        end
                    end
                    TweenObject(V6,v.PrimaryPart,1000)
                    v.HumanoidRootPart.CanCollide = false
                    v.PrimaryPart.CanCollide = false
                    v.Head.CanCollide = false
                    v.Humanoid.WalkSpeed = 0
                    v.Humanoid.JumpPower = 0
                    if v.Humanoid:FindFirstChild("Animator") then
                        v.Humanoid.Animator:Destroy()
                    end
                    for i,__ in pairs(v:GetDescendants()) do 
                        if __:IsA('BasePart') then 
                            __.CanCollide = false 
                        end
                    end
                end)
            end
        end
    end
end  
function GetNearestPlayer(pos)
    local ner = math.huge
    local ner2
    for i, v in pairs(game.Players:GetChildren()) do
        if
            v.Character and v.Character:FindFirstChild("HumanoidRootPart") and
                (v.Character.HumanoidRootPart.Position - pos).Magnitude < ner
         then
            ner = (v.Character.HumanoidRootPart.Position - pos).Magnitude
        end
    end
    for i, v in pairs(game.Players:GetChildren()) do
        if
            v.Character and v.Character:FindFirstChild("HumanoidRootPart") and
                (v.Character.HumanoidRootPart.Position - pos).Magnitude <= ner
         then
            ner2 = v.Name
        end
    end
    if game.Players.LocalPlayer.Name == ner2 then
        return true
    end
end
function isnetworkowner2(p1)
    local A = gethiddenproperty(game.Players.LocalPlayer, "SimulationRadius")
    local B = game.Players.LocalPlayer.Character or Wait(game.Players.LocalPlayer.CharacterAdded)
    local C = game.WaitForChild(B, "HumanoidRootPart", 300)
    if C then
        if p1.Anchored then
            return false
        end
        if game.IsDescendantOf(p1, B) or (C.Position - p1.Position).Magnitude <= A and GetNearestPlayer(p1.Position) then
            return true
        end
    end
end 
function IsIslandRaid(nu)
    if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island " .. nu) then
        local min = 4500
        for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            if
                v.Name == "Island " .. nu and
                    (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < min
             then
                min = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            end
        end
        for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            if
                v.Name == "Island " .. nu and
                    (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= min
             then
                return v
            end
        end
    end
end
function getNextIsland()
    local v
    for v = 5,1,-1 do 
        if
            IsIslandRaid(v) and
                (IsIslandRaid(v).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                    4500
         then
            return IsIslandRaid(v)
        end
    end
end
function Click()
    local VirtualUser = game:GetService("VirtualUser")
    VirtualUser:CaptureController()
    VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
end
local cancelKill = false 
function CancelKillPlayer()
    cancelKill = true 
end 
function CheckSafeZone(p)
    for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].SafeZones:GetChildren()) do
        if v:IsA("Part") then
            if
                GetDistance(v,p.PrimaryPart) <= 400 and
                    p.Humanoid.Health / p.Humanoid.MaxHealth >= 90 / 100
             then
                return true
            end
        end
    end
    for i,k in pairs(game.Players.LocalPlayer.PlayerGui.Notifications:GetDescendants()) do
        if k:IsA("TextLabel") then
            if string.find(k.Text,"attack") and not k:FindFirstChild(v.Name) then
                return true
            end
        end
    end
end
function KillPlayer(PlayerName)
    warn('KillPlayer',PlayerName)
    local t = game:GetService("Workspace").Characters:FindFirstChild(PlayerName)
    local tRoot = t.PrimaryPart or t:FindFirstChild('HumanoidRootPart')
    local tHumanoid = t:FindFirstChild('Humanoid')
    local getNeartick = tick()-5555
    local totRoot = GetDistance(tRoot)
    local StartKillTick = tick()
    local IsSafeZone = false
    repeat 
        task.wait()
        if IsPlayerAlive() then
            EquipWeapon() 
            IsSafeZone = CheckSafeZone(t)
            if game.Players.LocalPlayer.PlayerGui.Main.PvpDisabled.Visible then 
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
            end
            totRoot = GetDistance(tRoot)
            game.Players.LocalPlayer.Character.PrimaryPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.PrimaryPart.CFrame.X,tRoot.CFrame.Y,game.Players.LocalPlayer.Character.PrimaryPart.CFrame.Z)
            if totRoot < 50 then 
                if tick()-getNeartick > 100 then 
                    getNeartick = tick()
                    repeat 
                        task.wait()
                        game.Players.LocalPlayer.Character.PrimaryPart.CFrame = tRoot.CFrame * CFrame.new(0,100,10)
                        game.Players.LocalPlayer.Character['Fast Attack'].Value = false
                    until tick()-getNeartick > 5 and tick()-getNeartick < 100
                    game.Players.LocalPlayer.Character.PrimaryPart.CFrame = tRoot.CFrame * CFrame.new(0,0,10)
                elseif tick()-getNeartick > 5 and tick()-getNeartick < 100 then 
                    KillingMob = true
                    EquipWeapon()
                    if t:FindFirstChildOfClass('Tool') and t:FindFirstChildOfClass('Tool'):FindFirstChild('Holding') and t:FindFirstChildOfClass('Tool'):FindFirstChild('Holding').Value then 
                        game.Players.LocalPlayer.Character.PrimaryPart.CFrame = tRoot.CFrame * CFrame.new(0,50,15)
                    else
                        task.spawn(function()
                            game.Players.LocalPlayer.Character.PrimaryPart.CFrame = tRoot.CFrame * CFrame.new(0,0,2.5)
                        end)
                        Click()
                        game.Players.LocalPlayer.Character['Fast Attack'].Value = true
                        game.Players.LocalPlayer.Character['Aimbot Position'].Value = tRoot.Position
                        game.Players.LocalPlayer.Character['Aimbot'].Value = true
                        SendKey('Z')
                        SendKey("Q")
                        SendKey('X')
                        SendKey("Q")
                    end
                end
            else
                Tweento(tRoot.CFrame * CFrame.new(0,30,0))
            end 
        else
            getNeartick = tick()-5555
        end
    until cancelKill or IsSafeZone or tick()-StartKillTick > 80 or not t or not t.Parent or not game:GetService("Workspace").Characters:FindFirstChild(PlayerName) or not tRoot or not tRoot.Parent or not tHumanoid or tHumanoid.Health <= 0 
    cancelKill = false 
    KillingMob = false
    StartKillTick = tick()
    game.Players.LocalPlayer.Character['Fast Attack'].Value = false
    game.Players.LocalPlayer.Character['Aimbot Position'].Value = Vector3.new(0,0,0)
    game.Players.LocalPlayer.Character['Aimbot'].Value = false
    if IsSafeZone or tick()-StartKillTick > 80 then 
        warn('Kill Failed:',PlayerName)
        return false 
    else 
        warn('Kill Success:',PlayerName)
        return true 
    end
end
function CheckIsRaiding()
    local checkraid2 = getNextIsland()
    local checkraid1 = game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == true
    if getNextIsland() then
        return getNextIsland()
    end     
    --[[
        if not ALLCHECK_Func["Auto Trial Stage 1"]() and game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible and not GetSeaBeastTrial() and GetDistance(CFrame.new(28282.5703125, 14896.8505859375, 105.1042709350586)) > 3000 then
        return true
    end
    ]]
end
local lplr = game.Players.LocalPlayer
if not isnetworkowner then
    isnetworkowner = function(part)
        if isnetworkowner2(part) then
            return isnetworkowner2(part)
        end
        return part.ReceiveAge == 0 and GetNearestPlayer(part.Position)
    end
else
    z("your exploit already can use isnetworkowner (or you executed this twice lmao)") -- bruh
end
function FlyBoat(e,b,h)
    if not b then return end 
    if not h then h = 200 end 
    local fakevh = b.Engine
    local vh = b:FindFirstChildOfClass('VehicleSeat')
    if e then 
        vh.Name = 'L'
        local bodyV = vh:WaitForChild('BodyVelocity',.1)
        if bodyV then 
            bodyV.Parent = fakevh 
        end
        local bodyP = vh:WaitForChild('BodyPosition')
        bodyP.Position = Vector3.new(0,h,0)
        vh:GetPropertyChangedSignal('Position'):Connect(function()
            bodyP.Position = Vector3.new(0,h,0)
        end)
    else 
        local bodyV = fakevh:WaitForChild('BodyVelocity',.1)
        if bodyV then 
            bodyV.Parent = vh 
        end
        vh.Name = 'VehicleSeat'
        local bodyP = vh:WaitForChild('BodyPosition')
        bodyP.Position = Vector3.new(0,b.WaterOrigin.Value ,0)
    end
end
workspace._WorldOrigin.ChildAdded:Connect(function(v)
    if v.Name =='DamageCounter' then 
        v.Enabled  = false 
    end
end)
hookfunction(require(game:GetService("ReplicatedStorage").Effect.Container.Death), function()end)
hookfunction(require(game:GetService("ReplicatedStorage").Effect.Container.Respawn), function()end)
function EquipWeaponName(fff)
    if not fff then
        return
    end
    NoClip = true
    local ToolSe = fff
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
        wait(.4)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
    end
end
function IsWpSKillLoaded(ki)
    if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Skills:FindFirstChild(ki) then
        return true
    end
end
function EquipAllWeapon()
    local u3 = {
        "Melee",
        "Blox Fruit",
        "Sword",
        "Gun"
    }
    local u3_2 = {}
    for i, v in pairs(u3) do
        u3_3 = GetWeapon(v)
        if u3_3 and u3_3 ~= "" then table.insert(u3_2, u3_3) end
    end
    for i, v in pairs(u3_2) do
        if not IsWpSKillLoaded(v) then
            EquipWeaponName(v)
        end
    end
end
local GuideModule = require(game:GetService("ReplicatedStorage").GuideModule)
local Quest = require(game:GetService("ReplicatedStorage").Quests) 
local v17 = require(game.ReplicatedStorage:WaitForChild("GuideModule"))
local CFrameByLevelQuest = {} 
local UselessQuest = {
    "BartiloQuest",
    "Trainees",
    "MarineQuest",
    "CitizenQuest"
}
for i,v in pairs(GuideModule["Data"].NPCList) do
	for i1,v1 in pairs(v["Levels"]) do
		if not CFrameByLevelQuest[v1] then 
            CFrameByLevelQuest[v1] = i.CFrame 
        end
	end
end  
function IsHavingQuest()
    for i, v in next, v17.Data do
        if i == "QuestData" then
            return true
        end
    end
    return false
end 
function CheckCurrentQuestMob()
    local a
    if IsHavingQuest() then
        for i, v in next, v17.Data.QuestData.Task do
            a = i
        end
    end
    return a
end
function CheckQuestByLevel(cq)
    local cq = cq or {} 
    local lvlPl = cq.Level or game.Players.LocalPlayer.Data.Level.Value 
    local LevelMaxReq = 99999
    local DoubleQuest = cq.DoubleQuest or false 
    local Returner = {
        ["LevelReq"] = 0,
        ["Mob"] = "",
        ["QuestName"] = "",
        ["QuestId"] = 0,
    }
    if game.PlaceId == 2753915549 then 
        LevelMaxReq = 699
    elseif game.PlaceId ==4442272183 then 
        LevelMaxReq = 1475
    end
    for i, v in pairs(Quest) do
        for i1, v1 in pairs(v) do
            local lvlreq = v1.LevelReq
            for i2, v2 in pairs(v1.Task) do
                if
                    lvlPl >= lvlreq and lvlreq >= Returner["LevelReq"] and lvlreq <= LevelMaxReq and v1.Task[i2] > 1 and
                        not table.find(UselessQuest, tostring(i))
                then
                    Returner["LevelReq"] = lvlreq 
                    Returner["Mob"] = tostring(i2) 
                    Returner["QuestName"] = i 
                    Returner["QuestId"] = i1
                end
            end
        end
    end
    if DoubleQuest and IsHavingQuest() then 
        local CurrentMob = Returner["Mob"]
        if
        lvlPl >= 10 and IsHavingQuest() and
            CheckCurrentQuestMob() == Returner["Mob"]
        then
            for i, v in pairs(Quest) do
                for i1, v1 in pairs(v) do
                    for i2, v2 in pairs(v1.Task) do
                        if tostring(i2) == tostring(CurrentMob) then
                            for quest1, quest2 in next, v do
                                for quest3, quest4 in next, quest2.Task do
                                    if tostring(quest3) ~= tostring(CurrentMob) and quest4 > 1 then
                                        if quest2.LevelReq <= lvlPl then
                                            Returner["Mob"]  = tostring(quest3)
                                            Returner["QuestName"]  = i
                                            Returner["QuestId"] = quest1 
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
    Returner["QuestCFrame"] = CFrameByLevelQuest[Returner["LevelReq"]]
    return Returner
end
local function TweenKillInstant(POS) 
    local tweenfunc = {}
    local tween_s = game:service "TweenService"
    local info =
        TweenInfo.new(
        GetDistance(POS) /
            300,
        Enum.EasingStyle.Linear
    )
    if GetDistance(POS) < 200 then 
        if getgenv().tween then 
            getgenv().tween:Cancel()
            getgenv().tween = nil 
        end
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = POS 
    else 
        getgenv().tween =
            tween_s:Create(
            game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"],
            info,
            {CFrame = POS}
        )
        getgenv().tween:Play() 
    end
end
function GetQuest(QuestTables) 
    if game.Players.LocalPlayer.PlayerGui.Main:FindFirstChild("Quest").Visible then
        return
    end 
    if not QuestTables or not QuestTables["Mob"] or not QuestTables["QuestName"] or not QuestTables["LevelReq"] or not QuestTables["QuestId"] or not QuestTables["QuestCFrame"] then 
        QuestTables = CheckQuestByLevel()
    end
    if QuestTables.QuestCFrame and GetDistance(QuestTables.QuestCFrame) <= 8 then 
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", tostring(QuestTables["QuestName"]), QuestTables["QuestId"])
        wait(1.75)
    else
        if GetDistance(QuestTables["QuestCFrame"] * CFrame.new(0,0,-2)) < 1000 then 
            TweenKillInstant(QuestTables["QuestCFrame"] * CFrame.new(0,0,-2))
        else 
            Tweento(QuestTables["QuestCFrame"] * CFrame.new(0,0,-2))
        end
        task.wait(1)
    end
end
function FarmMobByLevel(level)
    if not level then level = game.Players.LocalPlayer.Data.Level.Value end

    local NewQuest = CheckQuestByLevel({
        Level = level,
        DoubleQuest = true 
    }) 
    if level <= game.Players.LocalPlayer.Data.Level.Value and not game.Players.LocalPlayer.PlayerGui.Main:FindFirstChild("Quest").Visible then 
        GetQuest(NewQuest)
    elseif CheckMob(CheckCurrentQuestMob()) then 
        KillNigga(CheckMob(CheckCurrentQuestMob()))
    elseif getgenv().MobSpawnClone and getgenv().MobSpawnClone[CheckCurrentQuestMob()] then 
        Tweento(getgenv().MobSpawnClone[CheckCurrentQuestMob()] * CFrame.new(0,60,0))
    end
end
FruitsID = loadstring(game:HttpGet("https://raw.githubusercontent.com/memaybeohub/Function-Scripts/main/Magnetism.lua"))()
function ReturnFruitNameWithId(v)
    local SH = v:WaitForChild("Fruit",15):WaitForChild("Fruit",1)
    if not SH then 
        SH = v:WaitForChild("Fruit",15):WaitForChild("Retopo_Cube.001",1) 
    end
    for i,v in pairs(FruitsID) do 
        if v == SH.MeshId then 
            return i 
        end
    end   
    return v.Name
end
function ReturnToShowFruit(v)
    local OC = ReturnFruitNameWithId(v):split('-')
    if #OC >= 3 then 
        local OC2 = {} 
        for i,v in pairs(OC) do 
            table.insert(OC2,v)
            if #OC2 >= #OC/2 then break end 
        end
        return unpack(OC2)
    else
        return OC[1]
    end
end
function CheckNatural(v)
    return not v:GetAttribute("OriginalName")
end
function getPriceFruit(z5)
    for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
        "GetFruits",
        game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitShop:GetAttribute("Shop2")
    )) do 
        if v.Name == z5 then 
            return v.Price 
        end
    end
    return 0 
end
function getRealFruit(v)
    local kf = CheckNatural(v) and " (Spawned)" or ""
    return ReturnFruitNameWithId(v) .. " ("..tostring(getPriceFruit(ReturnFruitNameWithId(v))).."$) ".. tostring(kf)
end 
function SendKey(key, holdtime,mmb)
    if key and (not mmb or (mmb)) then
        if not holdtime then
            game:service("VirtualInputManager"):SendKeyEvent(true, key, false, game)
            task.wait()
            game:service("VirtualInputManager"):SendKeyEvent(false, key, false, game)
        elseif holdtime then
            game:service("VirtualInputManager"):SendKeyEvent(true, key, false, game)
            task.wait(holdtime)
            game:service("VirtualInputManager"):SendKeyEvent(false, key, false, game)
        end
    end
end
function collectAllFruit_Store()
    if getgenv().ServerData['Workspace Fruits'] then 
        for i,v in pairs(getgenv().ServerData['Workspace Fruits']) do 
            Tweento(v.Handle.CFrame)
            if GetDistance(v.Handle) < 10 then 
                SendKey('Space',.5)
            end
        end
    end
end
function LoadBoss(v) 
    local Root = v:WaitForChild('HumanoidRootPart')
    local Hum = v:WaitForChild('Humanoid')
    if Hum and Root and v:FindFirstChild('Humanoid') and v.Humanoid.Health > 0 and v.Humanoid.DisplayName:find('Boss') and not getgenv().ServerData['Server Bosses'][v.Name] then 
        getgenv().ServerData['Server Bosses'][v.Name] = v 
    else
        return
    end
    v.Humanoid:GetPropertyChangedSignal('Health'):Connect(function()
        if v.Humanoid.Health <= 0 then  
            local index = getgenv().ServerData['Server Bosses'][v.Name]
            if index then
                getgenv().ServerData['Server Bosses'][v.Name] = nil
            end            
            return
        end
    end)
end 
getgenv().ServerData["Inventory Items"] = {}
getgenv().ServerData['Skill Loaded'] = {}
getgenv().ServerData['Workspace Fruits'] = {}
getgenv().ServerData['Server Bosses'] = {}
getgenv().ServerData['PlayerData'] = {}
getgenv().ServerData["PlayerBackpack"] = {}
for i,v in pairs(game.workspace.Enemies:GetChildren()) do 
    LoadBoss(v) 
end
for i,v in pairs(game.ReplicatedStorage:GetChildren()) do 
    if v:FindFirstChild('Humanoid') then 
        task.spawn(function()
            LoadBoss(v)
        end)
    end
end
workspace.Enemies.ChildAdded:Connect(LoadBoss)
RunService.Heartbeat:Connect(function()
    if IsPlayerAlive() then 
        getgenv().ServerData['Workspace Fruits'] = {}
        EnableBuso()
        _G.Fast_Delay = game.Players.LocalPlayer.Character:FindFirstChild('Fast Attack Delay').Value 
        getgenv().FastAttackSpeed = game.Players.LocalPlayer.Character:FindFirstChild('Fast Attack').Value 
        if tick()-getgenv().Ticktp < 0.5 or KillingMob or (getgenv().tween and getgenv().tween.PlaybackState and tostring(string.gsub(tostring(getgenv().tween.PlaybackState), "Enum.PlaybackState.", "")) == 'Playing') or (getgenv().TweenStats and tostring(string.gsub(tostring(getgenv().TweenStats), "Enum.PlaybackState.", "")) == 'Playing') then 
            AddBodyVelocity(true)
            for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do 
                if v:IsA("BasePart") or v:IsA("Part") then 
                    v.CanCollide = false 
                end
            end
        else
            AddBodyVelocity(false)
        end
        for i,v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")) do 
            if not getgenv().ServerData["Inventory Items"][v.Name] then 
                getgenv().ServerData["Inventory Items"][v.Name] = v 
            end 
        end
        for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills:GetChildren()) do 
            if not table.find({'Title','Container','Level','StarContainer','Rage'},v.Name) then 
                if not getgenv().ServerData['Skill Loaded'][v.Name] then 
                    getgenv().ServerData['Skill Loaded'][v.Name] = {}
                end 
                for i2,v2 in pairs(v:GetChildren()) do 
                    if v2:IsA("Frame") then
                        if v2.Name ~= "Template" and v2.Title.TextColor3 == Color3.new(1, 1, 1) and (v2.Cooldown.Size == UDim2.new(0, 0, 1, -1) or v2.Cooldown.Size == UDim2.new(1, 0, 1, -1))
                         then
                            getgenv().ServerData['Skill Loaded'][v2.Name] = true 
                        end
                    end
                end
            end
        end 
        for i,v in pairs(game.workspace:GetChildren()) do 
            if v.Name:find('Fruit') then 
                table.insert(getgenv().ServerData['Workspace Fruits'],{
                    Name = ReturnFruitNameWithId(v),
                    Fruit = v 
                })
            end
        end
        for i,v in pairs(game.Players.LocalPlayer.Data:GetChildren()) do 
            if tostring(v.ClassName):find('Value') then 
                if not getgenv().ServerData['PlayerData'][v.Name] then 
                    getgenv().ServerData['PlayerData'][v.Name] = v.Value 
                end
            end
        end  
    end
end)
loadstring([[
    local gg = getrawmetatable(game)
    local old = gg.__namecall
    setreadonly(gg, false)
    gg.__namecall =
        newcclosure(
        function(...)
            local method = getnamecallmethod()
            local args = {...}
            if not game.Players.LocalPlayer.Character['Aimbot'].Value then return end
            if tostring(method) == "FireServer" then
                if tostring(args[1]) == "RemoteEvent" then
                    if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                        if (game.Players.LocalPlayer.Character['Aimbot'].Value) and (game.Players.LocalPlayer.Character['Aimbot Position'].Value) then
                            if game.Players.LocalPlayer.Character['Aimbot Position'].Value then 
                                args[2] = game.Players.LocalPlayer.Character['Aimbot Position'].Value
                                warn('Hook Success') 
                            end
                        end
                        return old(unpack(args))
                    end
                end
            end
            return old(...)
        end
    )

]]) 
loadstring([[
    local gt = getrawmetatable(game)
    local old = gt.__namecall
    setreadonly(gt,false)
    gt.__namecall = newcclosure(function(...)
        local args = {...}
        if not game.Players.LocalPlayer.Character['Aimbot'].Value or not game.Players.LocalPlayer.Character['Aimbot Position'].Value then return end
        if getnamecallmethod() == "InvokeServer" then 
            if tostring(args[2]) == "TAP" then
                if (game.Players.LocalPlayer.Character['Aimbot'].Value) and (game.Players.LocalPlayer.Character['Aimbot Position'].Value) then
                    if game.Players.LocalPlayer.Character['Aimbot Position'].Value then 
                        args[3] = game.Players.LocalPlayer.Character['Aimbot Position'].Value 
                    end
                end
            end
        end
        return old(unpack(args))
    end)
]])
task.delay(10,function()
    local lee = 0
    for i,v2 in pairs(game.ReplicatedStorage.Effect.Container:GetDescendants()) do 
        if v2.ClassName =='ModuleScript' and typeof(require(v2)) == 'function' then 
            hookfunction(require(v2),function()end)
            lee +=1
        end
    end
    warn('Disabled',lee,"effects")
end)
warn('Loaded Success Full!')
getgenv().EnLoaded = true   
LoadPlayer()