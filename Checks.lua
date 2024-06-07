repeat task.wait() until getgenv().EnLoaded 
getgenv().CurrentTask = ""
function refreshTask()
    if getgenv().CurrentTask == '' then 
        if getgenv().SnipeFruit and getgenv().FruitSniping and checkFruittoEat(getgenv().FruitSniping,getgenv().IncludeStored) then 
            getgenv().CurrentTask = 'Eat Fruit'
        elseif #getgenv().ServerData['Workspace Fruits'] > 0 then 
            getgenv().CurrentTask = 'Collect Fruit'
        elseif getgenv().ServerData['PlayerData'].Level > 200  and not getgenv().ServerData["Inventory Items"]["Saber"] then 
            getgenv().CurrentTask = 'Saber Quest'
        elseif getgenv().ServerData['PlayerData'].Level > 150 
        and not getgenv().ServerData["Inventory Items"]["Pole (1st Form)"] 
        and (getgenv().ServerData['Server Bosses']['Thunder God']) then --or getgenv().ServerData['PlayerData'].Level > 500 then 
            getgenv().CurrentTask = 'Pole Quest'
        elseif Sea1 and getgenv().ServerData['PlayerData'].Level >= 700 and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Dressrosa") ~= 0 then 
            getgenv().CurrentTask = 'Sea 2 Quest'
        elseif Sea2 and getgenv().ServerData['PlayerData'].Level >= 850 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") ~= 3 then
            getgenv().CurrentTask = 'Bartilo Quest'
        elseif Sea2 and getgenv().ServerData['PlayerData'].Beli >= 500000 and getgenv().ServerData["Inventory Items"]["Warrior Helmet"] and getgenv().ServerData['PlayerData'].RaceVer == 'V1' then 
            getgenv().CurrentTask = 'Race V2 Quest'
        end 
    end
end
task.delay(.1,function()
    while task.wait() do 
        task.wait()
        refreshTask()
    end
end)

AutoRaceV2 = function()
    if getgenv().ServerData["PlayerBackpack"]['Flower 1'] and getgenv().ServerData["PlayerBackpack"]['Flower 2'] and getgenv().ServerData["PlayerBackpack"]['Flower 3'] then 
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "3")
        wait(5)
        getgenv().CurrentTask = ''
        return
    else
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1")
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "2") 
        if not getgenv().ServerData["PlayerBackpack"]['Flower 1'] then 
            if workspace.Flower1.Transparency ~= 1 then
                Tweento(workspace.Flower1.CFrame)
            else 
                HopServer(10,true)
            end
        elseif not getgenv().ServerData["PlayerBackpack"]['Flower 2'] then
            Tweento(workspace.Flower2.CFrame)
        else
            KillMobList({"Swan Pirate"})
        end
    end
end

AutoBartiloQuest = function()
    local QuestBartiloId = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo")
    if QuestBartiloId == 0 then 
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
        if getgenv().ServerData['Server Bosses']['Jeremy'] then 
            KillBoss(getgenv().ServerData['Server Bosses']['Jeremy'])
            getgenv().CurrentTask = ''
        elseif getgenv().ServerData['PlayerData'].Level > 500 then 
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
        end
    end
end
AutoSea2 = function()  
    if game.Workspace.Map.Ice.Door.CanCollide then
        if not getgenv().ServerData["PlayerBackpack"]['Key'] then 
            Tweento(CFrame.new(4852.2895507813, 5.651451587677, 718.53070068359))
            if GetDistance(CFrame.new(4852.2895507813, 5.651451587677, 718.53070068359)) < 5 then
                game.ReplicatedStorage.Remotes["CommF_"]:InvokeServer("DressrosaQuestProgress", "Detective")
                if getgenv().ServerData["PlayerBackpack"]['Key'] then EquipWeaponName("Key") end
            end 
        else
            EquipWeaponName("Key")
            if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Key") then
                Tweento(game.Workspace.Map.Ice.Door.CFrame)
            end
        end
    else
        if getgenv().ServerData['Server Bosses']['Ice Admiral'] then 
            KillBoss(getgenv().ServerData['Server Bosses']['Ice Admiral']) 
            refreshTask()
            local args = {
                [1] = "TravelDressrosa"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) 
            getgenv().CurrentTask = ''
        elseif getgenv().ServerData['PlayerData'].Level >= 700 then 
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
        warn('Killing Shanks...')
        if getgenv().ServerData['Server Bosses']['Saber Expert'] then 
            KillBoss(getgenv().ServerData['Server Bosses']['Saber Expert']) 
            getgenv().CurrentTask = ''
        elseif getgenv().ServerData['PlayerData'].Level > 500 then 
            HopServer(9,true)
        end 
    elseif game:GetService("Workspace").Map.Jungle.QuestPlates.Door.CanCollide then 
        warn('Touching Templatess...')
        local Template = SaberTouchTemplate()
        if Template then 
            Tweento(Template.Part.CFrame)
        end
    elseif CupDoor() then 
        RichSonProgress = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
        warn('Getting Cup for open door...')
        if RichSonProgress ~= 0 and RichSonProgress ~= 1 then
            if not getgenv().ServerData["PlayerBackpack"]['Cup'] then 
                Tweento(CFrame.new(1113.66992,7.5484705,4365.27832,-0.78613919,-2.19578524e-08,-0.618049502,1.02977182e-09,1,-3.68374984e-08,0.618049502,-2.95958493e-08,-0.78613919)) 
            else
                EquipWeaponName('Cup')
                if getgenv().ServerData["PlayerBackpack"]['Cup'].Handle:FindFirstChild('TouchInterest') then 
                    Tweento(CFrame.new(1395.77307,37.4733238,-1324.34631,-0.999978602,-6.53588605e-09,0.00654155109,-6.57083277e-09,1,-5.32077493e-09,-0.00654155109,-5.3636442e-09,-0.999978602))  
                else
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
            if getgenv().ServerData['Server Bosses']['Mob Leader'] then 
                KillBoss(getgenv().ServerData['Server Bosses']['Mob Leader']) 
            elseif getgenv().ServerData['PlayerData'].Level > 500 then 
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
        if not getgenv().ServerData["PlayerBackpack"]['Torch'] then  
            Tweento(game:GetService("Workspace").Map.Jungle.Torch.CFrame)
        else  
            EquipWeaponName("Torch") 
            Tweento(CFrame.new(1115.23499,4.92147732,4349.36963,-0.670654476,-2.18307523e-08,0.74176991,-9.06980624e-09,1,2.1230365e-08,-0.74176991,7.51052998e-09,-0.670654476))
        end  
    end
end
