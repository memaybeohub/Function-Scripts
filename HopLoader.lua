warn('Loading Hops...')
local Settings2 = {}
local SaveFileName2 = "!Blacklist_Servers.json"
local HOPGUI = Instance.new("ScreenGui")
local hoptext = Instance.new("TextLabel")
local reason = Instance.new("TextLabel")
local second = Instance.new("TextLabel")
--Properties:
local Blur = Instance.new("BlurEffect")
Blur.Size = 25
Blur.Parent = game.Lighting
Blur.Enabled = false 
HOPGUI.Enabled = false 
HOPGUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
HOPGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
HOPGUI.Name = 'Hop Gui'

hoptext.Name = "hoptext"
hoptext.Parent = HOPGUI
hoptext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
hoptext.BackgroundTransparency = 1.000
hoptext.BorderColor3 = Color3.fromRGB(0, 0, 0)
hoptext.BorderSizePixel = 0
hoptext.Position = UDim2.new(0.307627112, 0, 0.218623489, 0)
hoptext.Size = UDim2.new(0, 453, 0, 50)
hoptext.Font = Enum.Font.GothamBold
hoptext.Text = "Tsuo Hub - Hop Server"
hoptext.TextColor3 = Color3.fromRGB(255, 44, 153)
hoptext.TextSize = 25.000

reason.Name = "reason"
reason.Parent = HOPGUI
reason.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
reason.BackgroundTransparency = 1.000
reason.BorderColor3 = Color3.fromRGB(0, 0, 0)
reason.BorderSizePixel = 0
reason.Position = UDim2.new(0.157627121, 0, 0.358299583, 0)
reason.Size = UDim2.new(0, 453, 0, 50)
reason.Font = Enum.Font.GothamBold
reason.Text = "For Reason:"
reason.TextColor3 = Color3.fromRGB(255, 255, 255)
reason.TextSize = 25.000

second.Name = "second"
second.Parent = HOPGUI
second.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
second.BackgroundTransparency = 1.000
second.BorderColor3 = Color3.fromRGB(0, 0, 0)
second.BorderSizePixel = 0
second.Position = UDim2.new(0.307627112, 0, 0.568825901, 0)
second.Size = UDim2.new(0, 453, 0, 50)
second.Font = Enum.Font.GothamBold
second.Text = "Hopping to new Server in: 5s"
second.TextColor3 = Color3.fromRGB(255, 255, 255)
second.TextSize = 25.000  
function SetNewReason(reasonreal,time)
    if not reasonreal then reasonreal = '' end 
    if reasonreal == '' then
        HOPGUI.Enabled = false  
        Blur.Enabled = false
        return 
    end   
    if not time then time = 3 end 
    HOPGUI.Enabled = true   
    Blur.Enabled = true 
    reason.Text = reasonreal
    task.spawn(function()
        for t1 = time,1,1 do 
            second.Text = "Hopping to new Server in: "..t1.."s" 
        end 
    end)
end

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
function HopServer(CountTarget, hoplowallow,reasontohop)
    SetContent('Start hopping...') 
    delay = 3 
    if not reasontohop then 
        reasontohop = 'None'
    end
    SetNewReason(reasontohop,delay)
    local timeplased = tick()+delay
    for d = 1,delay do 
        if timeplased <= tick() then break; end
        SetContent('Waitting '..tostring(math.floor(timeplased-tick())).." to hop...") 
    end
    if hoplowallow and getgenv().TimeTryHopLow < 3 then
        for i = 1, 3 - getgenv().TimeTryHopLow do
            if getgenv().TimeTryHopLow < 3 then
                local a2,b2 = pcall(function()
                    HopLow()
                end)
                if not a2 then SetContent('hop fail') end
                getgenv().TimeTryHopLow = getgenv().TimeTryHopLow + 1
                warn('Hop low times: ',getgenv().TimeTryHopLow)
                SetContent('Low Server hopping times: '..tostring(getgenv().TimeTryHopLow))
                wait(delay/2)
            end
        end
    end
    if not CountTarget then
        CountTarget = 10
    end
    wait(delay)
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
                        SetContent('Hopping normal server...')
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