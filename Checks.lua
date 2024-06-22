repeat task.wait() until getgenv().EnLoaded 
getgenv().CurrentTask = "" 
getgenv().TaskUpdateTick = tick()  
getgenv().PirateRaidTick = 0
function refreshTask() 
    if tick()-getgenv().TaskUpdateTick >= 60 then 
        getgenv().CurrentTask = ''
    end
    if getgenv().CurrentTask == '' then  
        if getgenv().ServerData["PlayerBackpack"]['Special Microchip'] or CheckIsRaiding() then 
            getgenv().CurrentTask = 'Auto Raid'
        elseif getgenv().ServerData['PlayerData'].DevilFruit == '' and getgenv().SnipeFruit and getgenv().FruitSniping and checkFruittoEat(getgenv().FruitSniping,getgenv().IncludeStored) then 
            getgenv().CurrentTask = 'Eat Fruit'
        elseif #getgenv().ServerData['Workspace Fruits'] > 0 then 
            getgenv().CurrentTask = 'Collect Fruit' 
        elseif Sea3 and getgenv().CurrentElite then 
            getgenv().CurrentTask = 'Hunting Elite'  
        elseif Sea3 and getgenv().ServerData['PlayerData'].Level >= 2000 and not getgenv().ServerData["Inventory Items"]["Tushita"] and (getgenv().ServerData['Server Bosses']['rip_indra'] or (not game:GetService("Workspace").Map.Turtle:FindFirstChild("TushitaGate"))) then 
            getgenv().CurrentTask = 'Getting Tushita'
        elseif Sea3 and not getgenv().ServerData["Inventory Items"]["Yama"] and (getgenv().ServerData['PlayerData']["Elite Hunted"] >= 30 or getgenv().ServerData['PlayerData'].Level >= 2100) then 
            getgenv().CurrentTask = 'Getting Yama' 
        elseif getgenv().ServerData['PlayerData'].Level > 200  and not getgenv().ServerData["Inventory Items"]["Saber"] then 
            getgenv().CurrentTask = 'Saber Quest'
        elseif getgenv().ServerData['PlayerData'].Level > 150 
        and not getgenv().ServerData["Inventory Items"]["Pole (1st Form)"] 
        and (getgenv().ServerData['Server Bosses']['Thunder God']) then 
            getgenv().CurrentTask = 'Pole Quest'
        elseif Sea1 and getgenv().ServerData['PlayerData'].Level >= 700 and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Dressrosa") ~= 0 then 
            getgenv().CurrentTask = 'Sea 2 Quest'
        elseif (Sea2 or Sea3) and (getgenv().ServerData['Server Bosses']['Core'] or (Sea3 and getgenv().PirateRaidTick and tick()-getgenv().PirateRaidTick < 60)) then 
            getgenv().CurrentTask = '3rd Sea Event'
        elseif Sea2 and getgenv().ServerData['PlayerData'].Level >= 850 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") ~= 3 then
            getgenv().CurrentTask = 'Bartilo Quest'
        elseif Sea2 and getgenv().ServerData['PlayerData'].Level >= 1500 and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Zou") ~= 0 then 
            getgenv().CurrentTask = 'Auto Sea 3'
        elseif Sea2 and getgenv().ServerData['PlayerData'].Beli >= 500000 and getgenv().ServerData["Inventory Items"]["Warrior Helmet"] and getgenv().ServerData['PlayerData'].RaceVer == 'V1' then 
            getgenv().CurrentTask = 'Race V2 Quest'
        end  
        getgenv().TaskUpdateTick = tick()
    end
end 
if hookfunction then 
    hookfunction(require(game.ReplicatedStorage.Notification).new,function(v1,v2) 
        v1 = tostring(v1):gsub("<Color=[^>]+>", "") 
        if v1:find('spotted') then  
            warn('Pirate raid FOUND!')
            getgenv().PirateRaidTick = tick()
        elseif v1:find('Good job') then 
            warn('Pirate raid Cancelled!')
            getgenv().PirateRaidTick = 0 
        elseif v1:find('attack') then 
            getgenv().AttackedSafe = true 
        elseif v1:find('rare item') then 
            getgenv().Config.FireEssencePassed = typeof(game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon", true))~= 'string' 
        elseif v1:find('legendary item') then 
            getgenv().HallowEssence = true
        end
        local FakeLOL = {}
        function FakeLOL.Display(p18)
            return true;
        end; 
        function FakeLOL.Dead()
        end
        return FakeLOL
    end)  
end 
local rF1,rF2 
task.delay(.1,function()
    while task.wait(.5) do 
        task.wait()
        rF1,rF2  = pcall(function()
            refreshTask() 
        end)
        if not rF1 then 
            warn('Refreshing task error:',rF2)
        end
    end
end)

AutoTushita = function()
    if not getgenv().ServerData["Inventory Items"]["Tushita"] then
        if not game:GetService("Workspace").Map.Turtle:FindFirstChild("TushitaGate") then 
            if getgenv().ServerData['Server Bosses']['Longma'] then 
                KillBoss(getgenv().ServerData['Server Bosses']['Longma'])
                getgenv().CurrentTask = '' 
            else
                HopServer(9,true)
            end
        elseif getgenv().ServerData['Server Bosses']['rip_indra'] then  
            if getgenv().ServerData["PlayerBackpack"]['Holy Torch'] then
                EquipWeaponName("Holy Torch")
                if (function() 
                    for i = 1,5,1 do 
                        if not game:GetService("Workspace").Map.Turtle.QuestTorches['Torch'..tostring(i)].Particles.Main.Enabled then 
                            return game:GetService("Workspace").Map.Turtle.QuestTorches['Torch'..tostring(i)]
                        end 
                    end
                end)() then
                    Tweento((function() 
                        for i = 1,5,1 do 
                            if not game:GetService("Workspace").Map.Turtle.QuestTorches['Torch'..tostring(i)].Particles.Main.Enabled then 
                                return game:GetService("Workspace").Map.Turtle.QuestTorches['Torch'..tostring(i)]
                            end 
                        end
                    end)().CFrame)
                end
            else
                repeat 
                    Tweento(game:GetService("Workspace").Map.Waterfall.SecretRoom.Room.Door.Door.Hitbox.CFrame)
                    task.wait(1)
                until getgenv().ServerData["PlayerBackpack"]['Holy Torch']
            end
        end 
    end
end
AutoYama = function()
    if Sea3 then 
        if getgenv().ServerData['PlayerData']["Elite Hunted"] >= 30 then  
            if GetDistance(game.Workspace.Map.Waterfall.SealedKatana.Handle.CFrame) > 50 then
                Tweento(game.Workspace.Map.Waterfall.SealedKatana.Handle.CFrame * CFrame.new(0, 20, 0))
            else
                repeat 
                    task.wait()
                    repeat 
                        task.wait()
                        for i,v in pairs(workspace.Enemies:GetChildren()) do 
                            if v:FindFirstChildOfClass('Humanoid') then 
                                v:FindFirstChildOfClass('Humanoid').Health = 0 
                            end 
                        end  
                    until not game.Workspace.Enemies:FindFirstChild("Ghost [Lv. 1500]")
                    if not game.Workspace.Enemies:FindFirstChild("Ghost [Lv. 1500]") then
                        fireclickdetector(game.Workspace.Map.Waterfall.SealedKatana.Handle.ClickDetector)
                    end
                until getgenv().ServerData["Inventory Items"]["Yama"]
            end 
        else 
            
            HopServer(9,true)
        end
    end
end
AutoElite = function() 
    if getgenv().CurrentElite then  
        if
            not string.find(
                game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,
                getgenv().CurrentElite.Name
            ) or
                not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
            then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                "AbandonQuest"
            )
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                "EliteHunter"
            )
        else
            KillBoss(getgenv().CurrentElite)
            getgenv().CurrentTask = ''
        end
    end
end
AutoSea3 = function()
    if Sea2 and getgenv().ServerData['PlayerData'].Level >= 1000 then  
        local v135 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TalkTrevor", "1")
        if v135 and v135 ~= 0 then 
            if checkFruit1M() then 
                EquipWeaponName(checkFruit1M().Name)
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TalkTrevor", "1")
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TalkTrevor", "2")
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TalkTrevor", "3")  
                return 
            end
            local v136666 = checkFruit1M(true) 
            if v136666 then 
                EquipWeaponName(v136666.Name)
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TalkTrevor", "1")
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TalkTrevor", "2")
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TalkTrevor", "3")  
            elseif checkFruit1MWS() then  
                SetContent('Picking up '..getRealFruit(checkFruit1MWS()))
                Tweento(v.Handle.CFrame)
                task.wait(.1) 
                getgenv().CurrentTask = ''
            else
                SetContent('Hoping for 1M Fruit',5)
                HopServer(9,math.random(1,2) == 1)
            end
        elseif v135 == 0 then
            local ZQuestProgress = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check")
            if not ZQuestProgress then 
                if getgenv().ServerData['Server Bosses']['Don Swan'] then 
                    KillBoss(getgenv().ServerData['Server Bosses']['Don Swan'])
                else 
                    SetContent('Hopping for Don Swan',5)
                    HopServer(9,true)
                end
            elseif ZQuestProgress == 0 and GetDistance(game:GetService("Workspace").Map.IndraIsland.Part) > 1000 then
                local RedHeadCFrame =
                    CFrame.new(
                    -1926.78772,
                    12.1678171,
                    1739.80884,
                    0.956294656,
                    -0,
                    -0.292404652,
                    0,
                    1,
                    -0,
                    0.292404652,
                    0,
                    0.956294656
                )
                if GetDistance(RedHeadCFrame) <= 50 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress", "Begin")
                else
                    Tweento(RedHeadCFrame)
                end
            elseif getgenv().ServerData['Server Bosses']['rip_indra'] then 
                KillBoss(getgenv().ServerData['Server Bosses']['rip_indra'])
                local args = {
                    [1] = "TravelZou"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end 
        end
    end
end














AutoRaid = function()
    if getgenv().ServerData['Nearest Raid Island'] then 
        local RaidDis = GetDistance(getgenv().ServerData['Nearest Raid Island'])
        if RaidDis < 5000 then
            Tweento(getgenv().ServerData['Nearest Raid Island'].CFrame  *CFrame.new(0,60,0)) 
            task.wait(.1)
        end
    elseif getgenv().ServerData["PlayerBackpack"]['Special Microchip'] then
        SetContent('Firing raid remote...',3)
        if Sea2 then
            fireclickdetector(Workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
        elseif Sea3 then
            fireclickdetector(Workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
        end
        wait(10)
    end
    SetContent('Doing raid') 
    if not getgenv().KillAuraConnection then 
        getgenv().KillAuraConnection = workspace.Enemies.ChildAdded:Connect(function(v) 
            local V5Hum = v:FindFirstChildOfClass('Humanoid') or v:WaitForChild('Humanoid')
            if V5Hum then 
                V5Hum.Health = 0 
                V5Hum.Health = 0 
            end
        end) 
    end
end
Auto3rdEvent = function() 
    if Sea2 then
        KillBoss(getgenv().ServerData['Server Bosses']['Core']) 
    else 
        local CastleCFrame = CFrame.new(-5543.5327148438, 313.80062866211, -2964.2585449219)
        if GetDistance(CastleCFrame) > 1500 then 
            Tweento(CastleCFrame * CFrame.new(0,-100,0))
        else
            for i,v in pairs(game.workspace.Enemies:GetChildren()) do 
                if v:FindFirstChildOfClass("Humanoid") and v.Humanoid.Health > 0 and GetDistance(v.PrimaryPart,CastleCFrame) <= 1500 then 
                    KillNigga(v)
                end
            end
        end
    end
end
AutoMeleeFunc = function()
    if getgenv().MeleeTask == 'Find Ice' then
        if not Sea2 then TeleportWorld(2) end  
        if getgenv().ServerData["PlayerBackpack"]['Library Key'] then 
            EquipWeaponName('Library Key')
            Tweento(CFrame.new(
                6375.9126,
                296.634583,
                -6843.14062,
                -0.849467814,
                1.5493983e-08,
                -0.527640462,
                3.70608895e-08,
                1,
                -3.0301031e-08,
                0.527640462,
                -4.5294577e-08,
                -0.849467814
            ))
        elseif getgenv().ServerData['Server Bosses']['Awakened Ice Admiral'] then 
            KillBoss(getgenv().ServerData['Server Bosses']['Awakened Ice Admiral'])  
            if getgenv().ServerData["PlayerBackpack"]['Library Key'] then 
                EquipWeaponName('Library Key')
                Tweento(CFrame.new(
                    6375.9126,
                    296.634583,
                    -6843.14062,
                    -0.849467814,
                    1.5493983e-08,
                    -0.527640462,
                    3.70608895e-08,
                    1,
                    -3.0301031e-08,
                    0.527640462,
                    -4.5294577e-08,
                    -0.849467814
                )) 
            end
            getgenv().MeleeTask = ''
        else  
            SetContent('Hopping for Ice Admiral',5)
            HopServer(10,true)
        end
    elseif getgenv().MeleeTask == 'Find Waterkey' then  
        if not Sea2 then TeleportWorld(2) end  
        if getgenv().ServerData["PlayerBackpack"]['Water Key'] then 
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySharkmanKarate", true) 
        elseif getgenv().ServerData['Server Bosses']['Tide Keeper'] then 
            KillBoss(getgenv().ServerData['Server Bosses']['Tide Keeper']) 
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)  
            getgenv().MeleeTask = ''
        else   
            SetContent('Hopping for Tide Keeper',5)
            HopServer(10,true)
        end 
    elseif getgenv().MeleeTask == 'Previous Hero Puzzle' then   
        if not Sea3 then TeleportWorld(3) end
        Tweento(GetNPC('Previous Hero').PrimaryPart.CFrame * CFrame.new(0,0,-2.5))
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start")
        Tweento(CFrame.new(-12548.8, 332.378, -7617.77)) 
        getgenv().MeleeTask = '' 
    elseif getgenv().MeleeTask == 'Find Fire Essence' then 
        if getgenv().ServerData['PlayerData'].Level >= 2000 then  
            if not game.Players.LocalPlayer.PlayerGui.Main:FindFirstChild("Quest").Visible then 
                FarmMobByLevel(2000)
            else 
                KillMobList({
                    "Reborn Skeleton [Lv. 1975]",
                    "Living Zombie [Lv. 2000]",
                    "Demonic Soul [Lv. 2025]",
                    "Posessed Mummy [Lv. 2050]"
                })
            end
        else 
            KillMobList({
                "Reborn Skeleton [Lv. 1975]",
                "Living Zombie [Lv. 2000]",
                "Demonic Soul [Lv. 2025]",
                "Posessed Mummy [Lv. 2050]"
            })
        end
    end
end   
AutoMeleeMasteryCheck = function() 
    task.spawn(function()
        getgenv().FragmentNeeded = false
        getgenv().MeleeTask = 'None' 
        getgenv().MeleeWait = ''
        repeat task.wait() until getgenv().Config and getgenv().Config["Melee Level Values"] 
        while task.wait(1) do 
            local MLLV = getgenv().Config["Melee Level Values"]
            if MLLV["Superhuman"] == 0 then 
                BuyMelee('Superhuman')
                if MLLV["Black Leg"] < 300 then 
                    BuyMelee('Black Leg') 
                    SetMeleeWait('Black Leg',300)
                elseif MLLV["Fishman Karate"] < 300 then 
                    BuyMelee('Fishman Karate')  
                    SetMeleeWait('Fishman Karate',300)
                elseif MLLV["Electro"] < 300 then 
                    BuyMelee('Electro')    
                    SetMeleeWait('Electro',300)
                elseif MLLV["Dragon Claw"] < 300 then 
                    if MLLV['Dragon Claw'] == 0 then 
                        if getgenv().ServerData['PlayerData'].Fragments < 1500 then 
                            getgenv().FragmentNeeded = true 
                        else 
                            getgenv().FragmentNeeded = false 
                        end
                    else 
                        BuyMelee('Dragon Claw') 
                        SetMeleeWait('Dragon Claw',300)
                    end 
                else
                    BuyMelee('Superhuman')
                end 
            elseif MLLV['Sharkman Karate'] == 0 or MLLV['Death Step'] == 0 or MLLV['Electric Claw'] == 0 or MLLV['Dragon Talon'] == 0 then 
                if MLLV['Fishman Karate'] < 400 then 
                    BuyMelee('Fishman Karate')   
                    SetMeleeWait('Fishman Karate',400)
                elseif MLLV['Black Leg'] < 400 then 
                    BuyMelee('Black Leg') 
                    SetMeleeWait('Black Leg',400)
                elseif MLLV['Electro'] < 400 then 
                    BuyMelee('Electro') 
                    SetMeleeWait('Electro',400)
                elseif MLLV['Dragon Claw'] < 400 then 
                    BuyMelee('Dragon Claw')  
                    SetMeleeWait('Dragon Claw',400)  
                elseif MLLV['Superhuman'] < 400 then
                    BuyMelee('Superhuman')
                    SetMeleeWait('Superhuman',400)
                elseif MLLV['Sharkman Karate'] < 400 then 
                    BuyMelee('Sharkman Karate')  
                    SetMeleeWait('Sharkman Karate',400)
                elseif MLLV['Death Step'] < 400 then 
                    BuyMelee('Death Step')  
                    SetMeleeWait('Death Step',400)
                elseif MLLV['Electric Claw'] < 400 then 
                    BuyMelee('Electric Claw')  
                    SetMeleeWait('Electric Claw',400)
                elseif MLLV['Dragon Talon'] < 400 then 
                    SetMeleeWait('Dragon Talon',400)
                    BuyMelee('Dragon Talon')
                end   
                if MLLV['Sharkman Karate'] == 0 then 
                    BuyMelee('Sharkman Karate')  
                elseif MLLV['Death Step'] == 0 then 
                    BuyMelee('Death Step')  
                elseif MLLV['Electric Claw'] == 0 then 
                    BuyMelee('Electric Claw')  
                elseif MLLV['Dragon Talon'] == 0 then 
                    BuyMelee('Dragon Talon')   
                end  
            elseif MLLV['Superhuman'] < 400 then
                BuyMelee('Superhuman')
                SetMeleeWait('Superhuman',400)
            elseif MLLV['Sharkman Karate'] < 400 then 
                BuyMelee('Sharkman Karate')  
                SetMeleeWait('Sharkman Karate',400)
            elseif MLLV['Death Step'] < 400 then 
                BuyMelee('Death Step')  
                SetMeleeWait('Death Step',400)
            elseif MLLV['Electric Claw'] < 400 then 
                BuyMelee('Electric Claw')  
                SetMeleeWait('Electric Claw',400)
            elseif MLLV['Dragon Talon'] < 400 then 
                SetMeleeWait('Dragon Talon',400)
                BuyMelee('Dragon Talon')
            end  
        end
    end)
end 
AutoMeleeMasteryCheck()
AutoMeleeCheck = function()
    task.spawn(function()
        getgenv().FragmentNeeded = false
        getgenv().MeleeTask = 'None'
        repeat task.wait() until getgenv().Config and getgenv().Config["Melee Level Values"] 
        while task.wait(1) do 
            local MLLV = getgenv().Config["Melee Level Values"] 
            local v316, v317, v318, v319 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Bones", "Check")
            if MLLV['Sharkman Karate'] == 0 or MLLV['Death Step'] == 0 or MLLV['Electric Claw'] == 0 or MLLV['Dragon Talon'] == 0  then 
                pcall(function() 
                    if not getgenv().Config.WaterkeyPassed then 
                        if MLLV['Sharkman Karate'] > 0 then 
                            getgenv().Config.WaterkeyPassed = true; 
                        else 
                            local v178 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
                            getgenv().Config.WaterkeyPassed = typeof(v178) ~= 'string'; 
                        end
                    end 
                    if not getgenv().Config.PreviousHeroPassed then
                        getgenv().Config.PreviousHeroPassed = typeof(game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyElectricClaw", true))~= 'string'
                    end 
                    if not getgenv().Config.FireEssencePassed then 
                        getgenv().Config.FireEssencePassed = typeof(game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon", true))~= 'string' 
                    end
                    if not getgenv().Config.IceCastleDoorPassed then 
                        getgenv().Config.IceCastleDoorPassed = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("OpenLibrary")   
                    end
                end) 
                if (not getgenv().Config.IceCastleDoorPassed) and (getgenv().ServerData["PlayerBackpack"]['Library Key'] or getgenv().ServerData['Server Bosses']['Awakened Ice Admiral'] or getgenv().ServerData['PlayerData'].Level >= 1450) then 
                    getgenv().MeleeTask = 'Find Ice'
                elseif not getgenv().Config.WaterkeyPassed and (getgenv().ServerData["PlayerBackpack"]['Water Key'] or getgenv().ServerData['Server Bosses']['Tide Keeper'] or getgenv().ServerData['PlayerData'].Level >= 1450) then 
                    getgenv().MeleeTask = 'Find Waterkey' 
                elseif Sea3 and not getgenv().Config.PreviousHeroPassed then  
                    getgenv().MeleeTask = 'Previous Hero Puzzle' 
                elseif Sea3 and v318 and v318 > 0 then  
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                    if v316 and v316 < v318*50 then 
                        getgenv().MeleeTask = 'Find Fire Essence' 
                    else
                        getgenv().MeleeTask = ''
                    end
                end 
            else  
                getgenv().MeleeTask = ''
            end
        end
    end)
end
AutoMeleeCheck()
AutoRaceV2 = function()
    if getgenv().ServerData["PlayerBackpack"]['Flower 1'] and getgenv().ServerData["PlayerBackpack"]['Flower 2'] and getgenv().ServerData["PlayerBackpack"]['Flower 3'] then 
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "3")
        wait(5)
        getgenv().CurrentTask = '' 
        SetContent('Upgraded V2 Race | Returning task...')
        return
    else
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1")
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "2") 
        if not getgenv().ServerData["PlayerBackpack"]['Flower 1'] then 
            SetContent('Getting Blue Flower (Flower 1)')
            if workspace.Flower1.Transparency ~= 1 then
                Tweento(workspace.Flower1.CFrame)
            else  
                SetContent('Hopping for Blue Flower',5)
                HopServer(10,true)
            end
        elseif not getgenv().ServerData["PlayerBackpack"]['Flower 2'] then 
            SetContent('Getting Red Flower (Flower 2)')
            Tweento(workspace.Flower2.CFrame)
        else 
            SetContent('Getting Yellow Flower (Flower 3)')
            KillMobList({"Swan Pirate"})
        end
    end
end

AutoBartiloQuest = function()
    local QuestBartiloId = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo")
    if QuestBartiloId == 0 then 
        SetContent('First Bartilo task...')
        if game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text:find("Swan Pirate") and game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text:find("50") and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible then 
            KillMobList({"Swan Pirate"})
        else
            Tweento(CFrame.new(-456.28952, 73.0200958, 299.895966))
            if GetDistance(CFrame.new(-456.28952, 73.0200958, 299.895966)) < 10 then 
                local args = {
                    [1] = "StartQuest",
                    [2] = "BartiloQuest",
                    [3] = 1
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        end 
    elseif QuestBartiloId == 1 then 
        SetContent('Finding Jeremy...')
        if getgenv().ServerData['Server Bosses']['Jeremy'] then 
            KillBoss(getgenv().ServerData['Server Bosses']['Jeremy'])
            getgenv().CurrentTask = ''
        elseif getgenv().ServerData['PlayerData'].Level > 500 then  
            SetContent('Hopping for Bartilo',5)
            HopServer(9,true)
        end
    elseif QuestBartiloId == 2 then 
        local StartCFrame =
        CFrame.new(
        -1837.46155,
        44.2921753,
        1656.19873,
        0.999881566,
        -1.03885048e-22,
        -0.0153914848,
        1.07805858e-22,
        1,
        2.53909284e-22,
        0.0153914848,
        -2.55538502e-22,
        0.999881566
    )
        if GetDistance(StartCFrame) > 400 then 
            SetContent('Starting templates puzzle...')
            Tweento(StartCFrame)
        else
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(-1836, 11, 1714)
                task.wait(.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(-1850.49329, 13.1789551, 1750.89685)
                task.wait(.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(-1858.87305, 19.3777466, 1712.01807)
            task.wait(.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(-1803.94324, 16.5789185, 1750.89685)
                task.wait(.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(-1858.55835, 16.8604317, 1724.79541)
                task.wait(.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(-1869.54224, 15.987854, 1681.00659)
                task.wait(.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(-1800.0979, 16.4978027, 1684.52368)
                task.wait(.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(-1819.26343, 14.795166, 1717.90625)
                task.wait(.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(-1813.51843, 14.8604736, 1724.79541)
                getgenv().CurrentTask = ''
                SetContent('Done task | Returning task...')
        end
    end
end
AutoSea2 = function()  
    if game.Workspace.Map.Ice.Door.CanCollide then
        if not getgenv().ServerData["PlayerBackpack"]['Key'] then  
            SetContent('Getting key to pass the door...')
            Tweento(CFrame.new(4852.2895507813, 5.651451587677, 718.53070068359))
            if GetDistance(CFrame.new(4852.2895507813, 5.651451587677, 718.53070068359)) < 5 then
                game.ReplicatedStorage.Remotes["CommF_"]:InvokeServer("DressrosaQuestProgress", "Detective")
                if getgenv().ServerData["PlayerBackpack"]['Key'] then EquipWeaponName("Key") end
            end 
        else 
            SetContent('Opening door...')
            EquipWeaponName("Key")
            if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Key") then
                Tweento(game.Workspace.Map.Ice.Door.CFrame)
            end
        end
    else 
        SetContent('Finding Ice Admiral...')
        if getgenv().ServerData['Server Bosses']['Ice Admiral'] then 
            KillBoss(getgenv().ServerData['Server Bosses']['Ice Admiral']) 
            refreshTask()
            task.delay(10,function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa") 
            end)
            getgenv().CurrentTask = ''
        elseif getgenv().ServerData['PlayerData'].Level >= 700 then  
            SetContent('Hopping for Ice Admiral',5)
            HopServer(9,true)
        end
    end
end
AutoPole = function()
    if not Sea1 then 
        TeleportWorld(1)
    end
    if getgenv().ServerData["Inventory Items"]["Pole (1st Form)"] then 
        refreshTask()
        return
    end 
        if getgenv().ServerData['Server Bosses']['Thunder God'] then 
            KillBoss(getgenv().ServerData['Server Bosses']['Thunder God'])
            getgenv().CurrentTask = ''
        elseif getgenv().ServerData['PlayerData'].Level > 500 then  
            SetContent('Hopping for Thunder God',5)
            HopServer(9,true)
        end
end
local function IsUnlockedSaberDoor()
    for i, v in next, game:GetService("Workspace").Map.Jungle.Final:GetChildren() do
        if v:IsA("Part") and not v.CanCollide then
            return true
        end
    end
end  
local function SaberTouchTemplate()
    for i, v in next, game:GetService("Workspace").Map.Jungle.QuestPlates:GetChildren() do
        if v:IsA("Model") then
            if v.Button:FindFirstChild("TouchInterest") then
                return v
            end
        end
    end
end 
local function CupDoor()
    return workspace.Map.Desert.Burn.Part.CanCollide == false
end
AutoSaber = function()
    if not Sea1 then 
        TeleportWorld(1)
    end
    task.wait()
    local RichSonProgress = -999
    if getgenv().ServerData["Inventory Items"]["Saber"] then 
        getgenv().CurrentTask = ''
        return
    end
    if IsUnlockedSaberDoor() then 
        SetContent('Finding Saber Expert...')
        if getgenv().ServerData['Server Bosses']['Saber Expert'] then 
            KillBoss(getgenv().ServerData['Server Bosses']['Saber Expert']) 
            getgenv().CurrentTask = ''
        elseif getgenv().ServerData['PlayerData'].Level > 200 then  
            SetContent('Hopping for Shanks',5)
            HopServer(9,true)
        end 
    elseif game:GetService("Workspace").Map.Jungle.QuestPlates.Door.CanCollide then 
        SetContent('Touching templates in jungle...')
        local Template = SaberTouchTemplate()
        if Template then 
            Tweento(Template.Part.CFrame)
        end
    elseif CupDoor() then 
        RichSonProgress = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
        if RichSonProgress ~= 0 and RichSonProgress ~= 1 then
            if not getgenv().ServerData["PlayerBackpack"]['Cup'] then 
                Tweento(CFrame.new(1113.66992,7.5484705,4365.27832,-0.78613919,-2.19578524e-08,-0.618049502,1.02977182e-09,1,-3.68374984e-08,0.618049502,-2.95958493e-08,-0.78613919)) 
                SetContent('Getting cup')
            else
                EquipWeaponName('Cup')
                if getgenv().ServerData["PlayerBackpack"]['Cup'].Handle:FindFirstChild('TouchInterest') then 
                    SetContent('Filling cup with water...')
                    Tweento(CFrame.new(1395.77307,37.4733238,-1324.34631,-0.999978602,-6.53588605e-09,0.00654155109,-6.57083277e-09,1,-5.32077493e-09,-0.00654155109,-5.3636442e-09,-0.999978602))  
                else 
                    SetContent('Feeding sick man...')
                    Tweento(CFrame.new(1457.8768310547, 88.377502441406, -1390.6892089844))
                    if GetDistance(CFrame.new(1457.8768310547, 88.377502441406, -1390.6892089844)) < 10 then 
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                            "ProQuestProgress",
                            "SickMan"
                        )
                    end
                end
            end
        elseif RichSonProgress == 0 then
            SetContent('Finding Mob Leader...')
            if getgenv().ServerData['Server Bosses']['Mob Leader'] then 
                KillBoss(getgenv().ServerData['Server Bosses']['Mob Leader']) 
            elseif getgenv().ServerData['PlayerData'].Level > 500 then  
                SetContent('Hopping for Mob Leader',5)
                HopServer()  
            end
        elseif RichSonProgress == 1 then
            if getgenv().ServerData["PlayerBackpack"]['Relic'] then 
                EquipWeaponName("Relic") 
                Tweento(CFrame.new(-1405.3677978516, 29.977333068848, 4.5685839653015))
            else
                Tweento(CFrame.new(-1404.07996,29.8520069,5.26677656,0.888123989,-4.0340602e-09,0.459603906,7.5884703e-09,1,-5.8864642e-09,-0.459603906,8.71560069e-09,0.888123989))
                if GetDistance(CFrame.new(-1404.07996,29.8520069,5.26677656,0.888123989,-4.0340602e-09,0.459603906,7.5884703e-09,1,-5.8864642e-09,-0.459603906,8.71560069e-09,0.888123989)) < 10 then 
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
                end
            end
        end
    else 
        SetContent('Getting torch...')
        if not getgenv().ServerData["PlayerBackpack"]['Torch'] then  
            Tweento(game:GetService("Workspace").Map.Jungle.Torch.CFrame)
        else  
            EquipWeaponName("Torch") 
            Tweento(CFrame.new(1115.23499,4.92147732,4349.36963,-0.670654476,-2.18307523e-08,0.74176991,-9.06980624e-09,1,2.1230365e-08,-0.74176991,7.51052998e-09,-0.670654476))
        end  
    end
end
