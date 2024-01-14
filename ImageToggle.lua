local CheckMobile = function()
    if
        game:GetService("UserInputService").TouchEnabled
     then
        return true 
    end
end 
IsMobile = CheckMobile()
Size11,Size22 = 600,460
if IsMobile then 
    Size11,Size22 = 500,290
    local ClickButton = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local ImageLabel = Instance.new("ImageLabel")
    local TextButton = Instance.new("TextButton") 
    local UICorner = Instance.new("UICorner") 
    local UICorner_2 = Instance.new("UICorner")
    if game.CoreGui:FindFirstChild("ClickButton") then 
        game.CoreGui:FindFirstChild("ClickButton"):Destroy()
    end
    ClickButton.Name = "ClickButton"
    ClickButton.Parent = game.CoreGui
    ClickButton.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ClickButton
    MainFrame.Active = true
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.BackgroundColor3 = Color3.new(1, 1, 1)
    MainFrame.BorderColor3 = Color3.new(0, 0, 0)
    MainFrame.BorderSizePixel = 0
    MainFrame.Transparency = 1
    MainFrame.Position = UDim2.new(0.187441245, 0, 0.476932675, 0)
    MainFrame.Size = UDim2.new(0, 45, 0, 45)
    
    UICorner.CornerRadius = UDim.new(0, 100)
    UICorner.Parent = MainFrame
    
    UICorner_2.CornerRadius = UDim.new(0, 100)
    UICorner_2.Parent = ImageLabel
    
    ImageLabel.Parent = MainFrame
    ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    ImageLabel.BackgroundColor3 = Color3.new(0, 0, 0)
    ImageLabel.BorderColor3 = Color3.new(0, 0, 0)
    ImageLabel.BorderSizePixel = 0
    ImageLabel.Position = UDim2.new(0.48888889, 0, 0.48888889, 0)
    ImageLabel.Size = UDim2.new(0, 45, 0, 45)
    local LogOid = loadstring(game:HttpGet("https://raw.githubusercontent.com/memaybeohub/Function-Scripts/main/TsuoHubLogo.lua"))()
    ImageLabel.Image = "rbxassetid://"..tostring(LogOid)
    
    TextButton.Parent = MainFrame
    TextButton.BackgroundColor3 = Color3.new(1, 1, 1)
    TextButton.BackgroundTransparency = 1
    TextButton.BorderColor3 = Color3.new(0, 0, 0)
    TextButton.BorderSizePixel = 0
    TextButton.Position = UDim2.new(3.3908421e-07, 0, 0, 0)
    TextButton.Size = UDim2.new(0, 45, 0, 45)
    TextButton.AutoButtonColor = false
    TextButton.Font = Enum.Font.SourceSans
    TextButton.Text = ""
    TextButton.TextColor3 = Color3.new(255, 255, 255)
    TextButton.TextSize = 15
    TextButton.MouseButton1Click:Connect(function()
        game:GetService("VirtualInputManager"):SendKeyEvent(true,"LeftControl",false,game)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,"LeftControl",false,game)
    end)
end         