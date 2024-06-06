repeat task.wait() until getgenv().EnLoaded 
getgenv().CurrentTask = ""
task.delay(.1,function()
    while task.wait() do 
        task.wait()
        if getgenv().CurrentTask == '' then 
            if getgenv().ServerData['PlayerData'].Level > 200  and not getgenv().ServerData["Inventory Items"]["Saber"] then 
                getgenv().CurrentTask = 'Saber Quest'
            elseif getgenv().ServerData['PlayerData'].Level > 150 
            and not getgenv().ServerData["Inventory Items"]["Pole (1st Form)"] 
            and (getgenv().ServerData['Server Bosses']['Thunder God']) then --or getgenv().ServerData['PlayerData'].Level > 500 then 
                getgenv().CurrentTask = 'Pole Quest'
            elseif getgenv().ServerData['PlayerData'].Level >= 700 and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Dressrosa") ~= 0 then 
                getgenv().CurrentTask = 'Sea 2 Quest'
            end 
        end
    end
end)


AutoSea2 = function()  
    --getgenv().ServerData["PlayerBackpack"]['Cup']
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
            local args = {
                [1] = "TravelDressrosa"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        elseif getgenv().ServerData['PlayerData'].Level >= 700 then 
            HopServer(9,true)
        end
    end
end






















AutoPole = function()
    if getgenv().ServerData["Inventory Items"]["Pole (1st Form)"] then 
        getgenv().CurrentTask = ''
        return
    end 
    if getgenv().ServerData['Server Bosses']['Thunder God'] then 
        KillBoss(getgenv().ServerData['Server Bosses']['Thunder God'])
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
    task.wait()
    local RichSonProgress = -999
    if getgenv().ServerData["Inventory Items"]["Saber"] then 
        getgenv().CurrentTask = ''
        wait(1)
        return
    end
    if IsUnlockedSaberDoor() then 
        warn('Killing Shanks...')
        if getgenv().ServerData['Server Bosses']['Saber Expert'] then 
            KillBoss(getgenv().ServerData['Server Bosses']['Saber Expert']) 
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
