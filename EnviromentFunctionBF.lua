if not Config then Config = {} end
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
        if game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 then
        --TableLocations["Dismension"] = Vector3.new(-1990.672607421875, 4532.99951171875, -14973.6748046875)
        end
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
                TweenTemple()
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
function AntiLowHealth(yc5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
        CFrame.new(
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
        yc5,
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
    )
    wait()
end
function GetMidPoint(MobName, b2)
    if not Config["Smart Bring"] or Mob.Name == "Ship Officer [Lv. 1325]" then
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
    tween =
        tween_s:Create(
            obj,
        info,
        {CFrame = TweenCFrame}
    )
    tween:Play() 
end
function CheckPlayerAlive()
    local a2,b2 = pcall(function() return game:GetService("Players").LocalPlayer.Character.Humanoid.Health > 0 end)
    task.wait()
    if a2 then return b2 end 
end
function Tweento(targetCFrame)
    local bbc11, bbc12 =
        pcall(
        function()
            if CheckPlayerAlive()
             then
                if not game.Players.LocalPlayer.Character:FindFirstChild("Tween Access") then
                    return z("not tween access")
                end
                if not TweenSpeed or type(TweenSpeed) ~= "number" then
                    TweenSpeed = 325
                end
                if AntiLowHealthting then
                    return
                end
                tween = nil
                local DefualtY = targetCFrame.Y
                if DefualtY < 50 then
                    DefualtY = 75
                end
                if Config["Auto Beta"] then
                    DefualtY = DefualtY + 100
                end
                local TargetY = targetCFrame.Y
                local targetCFrameWithDefualtY = CFrame.new(targetCFrame.X, DefualtY, targetCFrame.Z)
                local targetPos = targetCFrame.Position
                local oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                local Distance =
                    (targetPos -
                    game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude
                if Distance <= 300 and tick() - ticktp >= 0.01 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetCFrame
                    ticktp = tick()
                    return
                end
                local bmg, bmg2 = CheckNearestTeleporter(targetCFrame)
                if bmg then
                    timetry = 0
                    repeat
                        pcall(
                            function()
                                tween:Cancel()
                            end
                        )
                        wait()
                        requestEntrance(bmg, bmg2)
                        timetry = timetry + 1
                    until not CheckNearestTeleporter(targetCFrame) or timetry >= 10
                    if timetry >= 10 and CheckNearestTeleporter(targetCFrame) then
                        if bmg2 == "Temple Of Time" then
                            z("insert blacklist temple")
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
                if Config["Same Y"] and (b1.Position - targetCFrameWithDefualtY.Position).Magnitude > 5 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
                        DefualtY,
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
                    )
                    local tweenfunc = {}
                    local tween_s = game:service "TweenService"
                    local info =
                        TweenInfo.new(
                        (targetPos -
                            game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude /
                            TweenSpeed,
                        Enum.EasingStyle.Linear
                    )
                    tween =
                        tween_s:Create(
                        game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"],
                        info,
                        {CFrame = targetCFrameWithDefualtY}
                    )
                    tween:Play()
                    function tweenfunc:Stop()
                        tween:Cancel()
                    end
                    TweenStats = tween.PlaybackState
                    tween.Completed:Wait()
                    TweenStats = tween.PlaybackState
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
                        TargetY,
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
                    )
                else
                    local tweenfunc = {}
                    local tween_s = game:service "TweenService"
                    local info =
                        TweenInfo.new(
                        (targetPos -
                            game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude /
                            TweenSpeed,
                        Enum.EasingStyle.Linear
                    )
                    tween =
                        tween_s:Create(
                        game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"],
                        info,
                        {CFrame = targetCFrame}
                    )
                    tween:Play()
                    function tweenfunc:Stop()
                        tween:Cancel()
                    end
                    TweenStats = tween.PlaybackState
                    tween.Completed:Wait()
                    TweenStats = tween.PlaybackState
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
                        TargetY,
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
                    )
                end
                if not tween then
                    return tween
                end
                return tweenfunc
            end
            task.wait()
        end
    )
end 
function KillNigga(Nasga) 
    if
        Nasga and Nasga:FindFirstChild("Humanoid") and Nasga:FindFirstChild("HumanoidRootPart") and
            Nasga.Humanoid.Health > 0 --and CheckPlayerAlive()
     then
        local NameItemSkill, SKill
        UpdateTPCFrame()
        local KillingBoss
        local LockCFrame
        local mmas = GetMidPoint(Nasga.Name, Nasga.HumanoidRootPart)
        if not string.find(Nasga.Name, "Boss") and Nasga.Humanoid.MaxHealth < 130000 then
            KillingBoss = false
            LockCFrame = CFrame.new(mmas.X, mmas.Y, mmas.Z)
        else
            LockCFrame = Nasga.HumanoidRootPart.CFrame
            KillingBoss = true
        end
        local N_Name = Nasga.Humanoid.Name
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
        if IsBoss(Nasga) then 
            KillingBoss = true 
        end
        if not KillingBoss then
            CheckReqHop(Nasga.HumanoidRootPart.CFrame,Nasga)
        end
        for i, v in pairs(Elites) do
            if RemoveLevelTitle(v) == RemoveLevelTitle(Nasga.Name) then
                KillingBoss = true
            end
        end
        BringMob(Nasga, LockCFrame) 
        
        repeat
            TargetedMob = Nasga
            spawn(
                function()
                    EquipWeapon()
                end
            )
            spawn(
                function()
                    EnableBuso()
                end
            )
            KillingTick = tick()
            if not Config["%HealthSendSkill"] then
                Config["%HealthSendSkill"] = 50
            end 
            OnlyVelocity(true)
            TweenKill(Nasga)
            local CanMasteryFarm
            if Config["Mastery Farm"] then CanMasteryFarm = Nasga.Humanoid.Health <= (Nasga.Humanoid.MaxHealth * Config["%HealthSendSkill"]) / 100 end
            if
                Config["Mastery Farm"] and CheckOnlyV4() and Config["Mastery Farm"] and
                    Nasga.Humanoid.MaxHealth < 500000 and
                    CanMasteryFarm
                then
                if Config["Mastery Farm"] and CheckOnlyV4() and Nasga.Humanoid.MaxHealth < 500000 and CanMasteryFarm then
                    repeat
                        KillingTick = tick()
                        UseFastAttack = false
                        AimBotSkillPosition = Nasga.HumanoidRootPart.Position
                        AimbotDiThangNgu = true
                        NameItemSkill, SKill = CheckSkillMastery()
                        TweenKill(Nasga)                        
                        if NameItemSkill and SKill then
                            EquipWeaponName(NameItemSkill)
                            SendKey(SKill, Config["Hold Time " .. tostring(SKill)])
                            task.wait(.2)
                        end
                        if Config["TypeMasteryFarm"] == "Gun" then
                            local QDANCE = getItemByToolTip("Gun")
                            EquipWeaponName(QDANCE)
                            GunAimbot(Nasga.HumanoidRootPart, QDANCE)
                            task.wait(.1)
                        end
                    until not Nasga or not Nasga.Parent or not Nasga:FindFirstChild("Humanoid") or
                        Nasga.Humanoid.Health <= 0 or
                        not CheckOnlyV4() or
                        not Config["Mastery Farm"] or
                        Nasga.Humanoid.Health > (Nasga.Humanoid.MaxHealth * Config["%HealthSendSkill"]) / 100
                    UseFastAttack = false
                    AimbotDiThangNgu = false
                    AimBotSkillPosition = nil
                    LockCFrame = nil 
                elseif GetDistance(Nasga.HumanoidRootPart) < 100 then
                    UseFastAttack = true
                else
                    UseFastAttack = false
                end
            elseif GetDistance(Nasga.HumanoidRootPart) < 100 then
                UseFastAttack = true
            else
                UseFastAttack = false
            end
        until not Nasga or not Nasga:FindFirstChild("Humanoid") or not Nasga:FindFirstChild("HumanoidRootPart") or
            Nasga.Humanoid.Health <= 0 or
            CheckIsRaiding() or not Config[usingfunction]
        UseFastAttack = false 
        LockCFrame = nil 
        AimbotDiThangNgu = false
        AimBotSkillPosition = nil
        LockCFrame = nil 
    end
end  
function SizePart(v, CFRmg, namemob1)
    if not v or v:FindFirstChild("lockmmb") then
        return
    end 
    if namemob1 then 
        local namemob1 = RemoveLevelTitle(namemob1)
        v.Name = RemoveLevelTitle(v.Name)
        if namemob1 and v.Name ~= namemob1 then
            return
        end
    end
    if not v:FindFirstChild("HumanoidRootPart") then
        return
    end
    if not v.HumanoidRootPart:FindFirstChild("lockmmb") then
        local lock = Instance.new("BodyVelocity")
        lock.Parent = v.HumanoidRootPart
        lock.Name = "lockmmb"
        lock.MaxForce = Vector3.new(100000, 100000, 100000)
        lock.Velocity = Vector3.new(0, 0, 0)
        if IsBoss(v.Name) then
            return
        end
        if (isnetworkowner(v.HumanoidRootPart) or isnetworkowner2(v.HumanoidRootPart)) and v.Humanoid.MaxHealth <= 500000 and not IsBoss(v.Name) then  
            print('Creating part...',v.Name)
            pcall(
                function()
                    if v and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        for i, sk in pairs(v:GetDescendants()) do
                            if sk:IsA("BasePart") or sk:IsA("Part") then
                                sk.CanCollide = false
                            end
                        end
                        v.Humanoid.WalkSpeed = 0
                        v.Humanoid.JumpPower = 0
                        if v.Humanoid:FindFirstChild("Animator") then
                            v.Humanoid.Animator:Destroy()
                        end
                    end
                end
            )
        else
            return 
        end
    end
end 
workspace.Enemies.ChildAdded:Connect(function(v)
    local q = v:WaitForChild("HumanoidRootPart",9e9)
    if GetDistance(q) > 1500 then return end
    SizePart(v)
end)
function BringMob(TAR,V5)
    if not TAR then
        return
    end
    --if IsFluxus then 
        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
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
                    TweenObject(V6,v.HumanoidRootPart,1000)
                end
            end
        end
    --[[
        else
        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
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
                    TweenObject(V6,v.HumanoidRootPart,1000)
                end
            end
        end
    end
    ]]
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
