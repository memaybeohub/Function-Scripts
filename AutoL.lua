local namequest
local BlackListedKillPlayers = {} 
function AutoL()
    if getgenv().QuestKillPlayer and not game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("Quest").Visible then 
        getgenv().QuestKillPlayer = false 
    end
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
    elseif not getgenv().QuestKillPlayer then
        FarmMobByLevel()
    end
end