warn('Loading Hops...')
local Settings2 = {}
local SaveFileName2 = "!Blacklist_Servers.json"

function SaveSettings2()
    local HttpService = game:GetService("HttpService")
    if not isfolder("Tsuo Hub") then
        makefolder("Tsuo Hub")
    end
    writefile(SaveFileName2, HttpService:JSONEncode(Settings2))
end

function ReadSetting2()
    local s, e =
        pcall(
        function()
            local HttpService = game:GetService("HttpService")
            if not isfolder("Tsuo Hub") then
                makefolder("Tsuo Hub")
            end
            return HttpService:JSONDecode(readfile(SaveFileName2))
        end
    )
    if s then
        return e
    else
        SaveSettings2()
        return ReadSetting2()
    end
end
function CheckX2Exp()
    a2, b2 =
        pcall(
        function()
            if LocalPlayerLevelValue < 2450 then
                if string.find(game.Players.LocalPlayer.PlayerGui.Main.Level.Exp.Text, "ends in") then
                    return true
                end
            end
        end
    )
    if a2 then
        return b2
    end
end
local lessfoundAnything = ""
function HopLow()
    if lessfoundAnything == "" then
        SiteHopServerLess =
            game.HttpService:JSONDecode(
            game:HttpGet(
                "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
            )
        )
    else
        SiteHopServerLess =
            game.HttpService:JSONDecode(
            game:HttpGet(
                "https://games.roblox.com/v1/games/" ..
                    game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. lessfoundAnything
            )
        )
    end
    if
        SiteHopServerLess.nextPageCursor and SiteHopServerLess.nextPageCursor ~= "null" and
            SiteHopServerLess.nextPageCursor ~= nil
     then
        lessfoundAnything = SiteHopServerLess.nextPageCursor
    end
    for i, v in pairs(SiteHopServerLess.data) do
        if v.playing and tonumber(v.playing) <= 4 and v.id ~= game.JobId then
            game:GetService("TeleportService"):TeleportToPlaceInstance(
                game.PlaceId,
                tostring(v.id),
                game.Players.LocalPlayer
            )
        end
    end
end
local Settings2 = ReadSetting2()
getgenv().TimeTryHopLow = 0
function HopServer(CountTarget, hoplowallow)
    if hoplowallow and 1 >0 and getgenv().TimeTryHopLow < 3 then
        for i = 1, 3 - getgenv().TimeTryHopLow do
            if getgenv().TimeTryHopLow < 3 then
                HopLow()
                getgenv().TimeTryHopLow = getgenv().TimeTryHopLow + 1
            end
        end
    end
    if not CountTarget then
        CountTarget = 10
    end

    ticklon = tick()
    pcall(
        function()
            repeat
                task.wait()
            until tick() - ticklon >= 1
        end
    )
    local function Hop()
        for i = 1, 100 do
            if ChooseRegion == nil or ChooseRegion == "" then
                ChooseRegion = "Singapore"
            else
                game:GetService("Players").LocalPlayer.PlayerGui.ServerBrowser.Frame.Filters.SearchRegion.TextBox.Text =
                    ChooseRegion
            end
            local huhu = game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer(i)
            for k, v in pairs(huhu) do
                if k ~= game.JobId and v["Count"] < CountTarget then
                    if not Settings2[k] or tick() - Settings2[k].Time > 60 * 10 then
                        Settings2[k] = {
                            Time = tick()
                        }
                        SaveSettings2()
                        if
                            game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Bottom.Visible and
                                game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible
                         then
                            repeat
                                wait()
                                AntiLowHealthting = true
                                AntiLowHealth(math.random(8500, 10000))
                            until not game:GetService("Players").LocalPlayer or
                                (not game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Bottom.Visible and
                                    not game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible)
                            AntiLowHealthting = false
                        else
                        end
                        game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", k)
                        return true
                    elseif tick() - Settings2[k].Time > 60 * 60 then
                        Settings2[k] = nil
                    end
                end
            end
        end
        return false
    end 
    if not getgenv().Loaded then
        local function child(v)
            if v.Name == "ErrorPrompt" then
                if v.Visible then
                    if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                        HopServer()
                        v.Visible = false
                    end
                end
                v:GetPropertyChangedSignal("Visible"):Connect(
                    function()
                        if v.Visible then
                            if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                                HopServer()
                                v.Visible = false
                            end
                        end
                    end
                )
            end
        end
        for k, v in pairs(game.CoreGui.RobloxPromptGui.promptOverlay:GetChildren()) do
            child(v)
        end
        game.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(child)
    end
    Hop()
    SaveSettings2()
end