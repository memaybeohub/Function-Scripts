warn('Loading Hops...')
local Settings2 = {}
local SaveFileName2 = "!Blacklist_Servers.json"
local HopGui = Instance.new("ScreenGui");
local HopFrame = Instance.new("Frame");
local NameHub = Instance.new("TextLabel");
local UIStroke = Instance.new("UIStroke");
local HopIn = Instance.new("TextLabel");
local DropShadowHolder = Instance.new("Frame");
local DropShadow = Instance.new("ImageLabel");
local Reason = Instance.new("TextLabel");
local ClickTo = Instance.new("TextLabel");
local ButtonCall = Instance.new("TextButton");

HopGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
HopGui.Name = "HopGui"
HopGui.Parent = game:GetService("CoreGui")
HopGui.Enabled = false 

HopFrame.AnchorPoint = Vector2.new(0.5, 0.5)
HopFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
HopFrame.BackgroundTransparency = 0.9990000128746033
HopFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
HopFrame.BorderSizePixel = 0
HopFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
HopFrame.Size = UDim2.new(1, 0, 1, 0)
HopFrame.Name = "HopFrame"
HopFrame.Parent = HopGui

NameHub.Font = Enum.Font.Gotham
NameHub.Text = "Tsuo Hub"
NameHub.TextColor3 = Color3.fromRGB(175.00000476837158, 187.00000405311584, 230.00000149011612)
NameHub.TextSize = 85
NameHub.AnchorPoint = Vector2.new(0.5, 0.5)
NameHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NameHub.BackgroundTransparency = 0.9990000128746033
NameHub.BorderColor3 = Color3.fromRGB(0, 0, 0)
NameHub.BorderSizePixel = 0
NameHub.Position = UDim2.new(0.5, 0, 0.5, -45)
NameHub.Size = UDim2.new(0, 200, 0, 80)
NameHub.Name = "NameHub"
NameHub.Parent = HopFrame

UIStroke.Color = Color3.fromRGB(175.00000476837158, 187.00000405311584, 230.00000149011612)
UIStroke.Thickness = 1.5
UIStroke.Parent = NameHub

HopIn.Font = Enum.Font.Gotham
HopIn.Text = "Hopping server in 0s"
HopIn.TextColor3 = Color3.fromRGB(255, 255, 255)
HopIn.TextSize = 20
HopIn.AnchorPoint = Vector2.new(0.5, 0.5)
HopIn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HopIn.BackgroundTransparency = 0.9990000128746033
HopIn.BorderColor3 = Color3.fromRGB(0, 0, 0)
HopIn.BorderSizePixel = 0
HopIn.Position = UDim2.new(0.5, 0, 0.5, 0)
HopIn.Size = UDim2.new(0, 200, 0, 30)
HopIn.Name = "HopIn"
HopIn.Parent = HopFrame

DropShadowHolder.BackgroundTransparency = 1
DropShadowHolder.BorderSizePixel = 0
DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
DropShadowHolder.ZIndex = 0
DropShadowHolder.Name = "DropShadowHolder"
DropShadowHolder.Parent = HopFrame

DropShadow.Image = "rbxassetid://6015897843"
DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
DropShadow.ImageTransparency = 0.999
DropShadow.ScaleType = Enum.ScaleType.Slice
DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)
DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow.BackgroundTransparency = 1
DropShadow.BorderSizePixel = 0
DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
DropShadow.Size = UDim2.new(1, 47, 1, 47)
DropShadow.ZIndex = 0
DropShadow.Name = "DropShadow"
DropShadow.Parent = DropShadowHolder

Reason.Font = Enum.Font.Gotham
Reason.Text = "Reason: Find New Server"
Reason.TextColor3 = Color3.fromRGB(255, 255, 255)
Reason.TextSize = 16
Reason.AnchorPoint = Vector2.new(0.5, 0.5)
Reason.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Reason.BackgroundTransparency = 0.9990000128746033
Reason.BorderColor3 = Color3.fromRGB(0, 0, 0)
Reason.BorderSizePixel = 0
Reason.Position = UDim2.new(0.5, 0, 0.5, 32)
Reason.Size = UDim2.new(0, 200, 0, 16)
Reason.Name = "Reason"
Reason.Parent = HopFrame

ClickTo.Font = Enum.Font.Gotham
ClickTo.Text = "Click to this frame to abort the process"
ClickTo.TextColor3 = Color3.fromRGB(255, 255, 255)
ClickTo.TextSize = 16
ClickTo.TextTransparency = 0.5
ClickTo.AnchorPoint = Vector2.new(0.5, 0.5)
ClickTo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ClickTo.BackgroundTransparency = 0.9990000128746033
ClickTo.BorderColor3 = Color3.fromRGB(0, 0, 0)
ClickTo.BorderSizePixel = 0
ClickTo.Position = UDim2.new(0.5, 0, 0.5, 50)
ClickTo.Size = UDim2.new(1, 0, 1, 0)
ClickTo.Name = "ClickTo"
ClickTo.Parent = HopFrame

ButtonCall.Font = Enum.Font.SourceSans
ButtonCall.Text = ""
ButtonCall.TextColor3 = Color3.fromRGB(0, 0, 0)
ButtonCall.TextSize = 14
ButtonCall.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ButtonCall.BackgroundTransparency = 0.9990000128746033
ButtonCall.BorderColor3 = Color3.fromRGB(0, 0, 0)
ButtonCall.BorderSizePixel = 0
ButtonCall.Size = UDim2.new(1, 0, 1, 0)
ButtonCall.Name = "ButtonCall"
ButtonCall.Parent = HopFrame

local Blur = Instance.new("BlurEffect")
Blur.Size = 50
Blur.Parent = game.Lighting
Blur.Enabled = false  
SetNewReason = function(reasonreal,time)
    if not reasonreal then reasonreal = '' end 
    if reasonreal == '' then
        HopGui.Enabled = false  
        Blur.Enabled = false
        return 
    end   
    if not time then time = 3 end 
    HopGui.Enabled = true   
    Blur.Enabled = true 
    Reason.Text = "Reason: "..reasonreal
    for t1 = time,1,-1 do 
        HopIn.Text = "Hopping server in "..t1.."s"
        wait(1) 
    end  
    HopIn.Text = "Hopping server in 0s"
end
---- Events 
ButtonCall.MouseButton1Click:Connect(function()
    getgenv().CancelHop = true  
    SetNewReason()
end)     

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