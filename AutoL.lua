local namequest
local BlackListedKillPlayers = {} 
function AutoL()
    if getgenv().QuestKillPlayer and not game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("Quest").Visible then 
        getgenv().QuestKillPlayer = false 
    end 
    local BOSSCP = getgenv().ServerData['Server Bosses']['rip_indra True Form'] or getgenv().ServerData['Server Bosses']['Dark Beard'] or getgenv().ServerData['Server Bosses']['Cake Prince'] or getgenv().ServerData['Server Bosses']['Dough King']
    if game.PlaceId == 2753915549 and not getgenv().QuestKillPlayer and game.Players.LocalPlayer.Data.Level.Value >= 35 and game.ReplicatedStorage.Remotes["CommF_"]:InvokeServer("PlayerHunter") ~="I don't have anything for you right now. Come back later." then 
        namequest =
            string.gsub(
            game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,
            "Defeat ",
            ""
        )
        namequest = string.gsub(namequest, " %p(0/1)%p", "") 
        if
            game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("Quest").Visible and
                namequest and
                game:GetService("Workspace").Characters:FindFirstChild(namequest)
            then
                getgenv().QuestKillPlayer = true
        end
    elseif game.PlaceId == 2753915549 and game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("Quest").Visible and getgenv().QuestKillPlayer then 
        namequest =
            string.gsub(
            game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,
            "Defeat ",
            ""
        )
        namequest = string.gsub(namequest, " %p(0/1)%p", "") 
        if #BlackListedKillPlayers >= 6 then 
            repeat 
                warn('Start Hop Server')
                HopServer() 
                CancelKillPlayer() 
                task.wait(5) 
            until 5 > 6
        end
        if game.Players.LocalPlayer.PlayerGui.Main.PvpDisabled.Visible then 
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
        else
            if
            game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("Quest").Visible and
                not game:GetService("Workspace").Characters:FindFirstChild(namequest)
            then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                warn('Cancel: not found')
            end
            if
                game.Players[namequest].Data.Level.Value < 20 or
                    game.Players[namequest].Data.Level.Value > game.Players.LocalPlayer.Data.Level.Value +122
            then
                table.insert(BlackListedKillPlayers, namequest)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                getgenv().QuestKillPlayer = false 
                warn('Cancel: not enough requirements |',namequest)
            end 
            if game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("Quest").Visible then
                if KillPlayer(namequest) then 
                    getgenv().QuestKillPlayer = false 
                else
                    table.insert(BlackListedKillPlayers, namequest)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    getgenv().QuestKillPlayer = false
                end
            end
        end
        
    elseif not getgenv().QuestKillPlayer and game.PlaceId == 2753915549 and game.Players.LocalPlayer.Data.Level.Value < 120 and game.Players.LocalPlayer.Data.Level.Value >= 10 then 
        KillMobList({"Royal Squad [Lv. 525]", "Shanda [Lv. 475]"}) 
    elseif Sea2 and getgenv().ServerData["PlayerBackpack"]['Hidden Key'] and not getgenv().ServerData["Inventory Items"]["Rengoku"] then 
        EquipWeaponName('Hidden Key')
        Tweento(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875)) 
    elseif Sea2 and (getgenv().ServerData["PlayerBackpack"]['Library Key'] and not getgenv().Config.IceCastleDoorPassed) or getgenv().ServerData["PlayerBackpack"]['Water Key'] then 
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
        else 
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySharkmanKarate", true) 
        end
    elseif Sea2 and getgenv().ServerData['PlayerData'].Level >= 1350 and not getgenv().Config.IceCastleDoorPassed and getgenv().ServerData['PlayerData'].Level < 1425 and getgenv().ServerData['Server Bosses']['Awakened Ice Admiral'] then
        KillBoss(getgenv().ServerData['Server Bosses']['Awakened Ice Admiral']) 
    elseif Sea2 and getgenv().ServerData['PlayerData'].Level >= 1425 and not getgenv().Config.WaterkeyPassed and getgenv().ServerData['Server Bosses']['Tide Keeper'] then 
        KillBoss(getgenv().ServerData['Server Bosses']['Tide Keeper'])
    elseif BOSSCP then 
        KillBoss(BOSSCP)
    elseif not getgenv().QuestKillPlayer and getgenv().ServerData['PlayerData'].Level < 2550 then
        FarmMobByLevel()
    else 
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CakePrinceSpawner")
        if not game.Players.LocalPlayer.PlayerGui.Main:FindFirstChild("Quest").Visible then 
            FarmMobByLevel((function()
                local a = {2200,2250}
                return a[math.random(1,2)]
            end)())
        else 
            KillMobList({
                "Cookie Crafter",
                "Cake Guard",
                "Head Baker",
                "Baking Staff"
            })
        end
    end
end