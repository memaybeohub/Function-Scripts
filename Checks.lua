repeat task.wait(1) until getgenv().ServerData 
getgenv().CurrentTask = ""
task.delay(1,function()
    while task.wait() do 
        if getgenv().CurrentTask == '' then 
            if getgenv().ServerData['PlayerData'].Level.Value > 200  and not getgenv().ServerData["Inventory Items"]["Saber"] then 
                getgenv().CurrentTask = 'Saber Quest'
            elseif getgenv().ServerData['PlayerData'].Level.Value > 150 
            and not getgenv().ServerData["Inventory Items"]["Pole (1st Form)"] 
            and getgenv().ServerData['Server Bosses']['Thunder God'] then 
                getgenv().CurrentTask = 'Pole Quest'
            end 
        end
    end
end)
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
function AutoSaber()
    local RichSonProgress = -999
    if getgenv().ServerData["Inventory Items"]["Saber"] then 
        getgenv().CurrentTask = ''
        return
    end
    warn('getgenv().CurrentTask',getgenv().CurrentTask)
    if IsUnlockedSaberDoor() then 
        warn('Killing Shanks...')
        if getgenv().ServerData['Server Bosses']['Saber Expert'] then 
            KillBoss(getgenv().ServerData['Server Bosses']['Saber Expert']) 
        elseif getgenv().ServerData['PlayerData'].Level.Value > 500 then 
            HopServer()
        end 
    elseif game:GetService("Workspace").Map.Jungle.QuestPlates.Door.CanCollide then 
        warn('Touching Templatess...')
        local Template = SaberTouchTemplate()
        if Template then 
            Tweento(Template.Part.CFrame)
            if GetDistance(Template.Part) < 10 then 
                firetouchinterest(Template.Button.TouchInterest,game.Players.LocalPlayer.Character.HumanoidRootPart,1)
                firetouchinterest(Template.Button.TouchInterest,game.Players.LocalPlayer.Character.HumanoidRootPart,0)
            end
        end
    elseif CupDoor() then 
        RichSonProgress = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
        warn('Getting Cup for open door...')
        if RichSonProgress ~= 0 and RichSonProgress ~= 1 then
            if not getgenv().ServerData["PlayerBackpack"]['Cup'] then 
                Tweento(CFrame.new(1113.66992,7.5484705,4365.27832,-0.78613919,-2.19578524e-08,-0.618049502,1.02977182e-09,1,-3.68374984e-08,0.618049502,-2.95958493e-08,-0.78613919)) 
                if GetDistance(CFrame.new(1113.66992,7.5484705,4365.27832,-0.78613919,-2.19578524e-08,-0.618049502,1.02977182e-09,1,-3.68374984e-08,0.618049502,-2.95958493e-08,-0.78613919)) < 10 then 
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,game:GetService("Workspace").Map.Desert.Cup,1)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,game:GetService("Workspace").Map.Desert.Cup,0)
                    wait(1)
                end 
            else
                EquipWeaponName('Cup')
                task.wait(.1)
                if getgenv().ServerData["PlayerBackpack"]['Cup'].Handle:FindFirstChild('TouchInterest') then 
                    Tweento(CFrame.new(1395.77307,37.4733238,-1324.34631,-0.999978602,-6.53588605e-09,0.00654155109,-6.57083277e-09,1,-5.32077493e-09,-0.00654155109,-5.3636442e-09,-0.999978602))  
                else
                    Tweento(CFrame.new(1457.8768310547, 88.377502441406, -1390.6892089844))
                    if GetDistance(CFrame.new(1457.8768310547, 88.377502441406, -1390.6892089844)) < 10 then 
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                            "ProQuestProgress",
                            "SickMan"
                        )
                        task.wait(1)
                    end
                end
            end
        elseif RichSonProgress == 0 then
            if getgenv().ServerData['Server Bosses']['Mob Leader'] then 
                KillBoss(getgenv().ServerData['Server Bosses']['Mob Leader']) 
            elseif getgenv().ServerData['PlayerData'].Level.Value > 500 then 
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
            if GetDistance(CFrame.new(1115.23499,4.92147732,4349.36963,-0.670654476,-2.18307523e-08,0.74176991,-9.06980624e-09,1,2.1230365e-08,-0.74176991,7.51052998e-09,-0.670654476)) < 10 then 
                firetouchinterest(game:GetService("Workspace").Map.Desert.Burn.Fire,game.Players.LocalPlayer.Character.Torch.Handle,1)
                firetouchinterest(game:GetService("Workspace").Map.Desert.Burn.Fire,game.Players.LocalPlayer.Character.Torch.Handle,0)
            end
        end  
    end
end
