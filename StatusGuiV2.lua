local ScreenGui = Instance.new("ScreenGui");
local DropShadowHolder = Instance.new("Frame");
local DropShadow = Instance.new("ImageLabel");
local Main = Instance.new("Frame");
local UICorner = Instance.new("UICorner");
local UIStroke = Instance.new("UIStroke");
local UIGradient = Instance.new("UIGradient");
local Top = Instance.new("TextLabel");
local UIGradient1 = Instance.new("UIGradient");
local Under = Instance.new("TextLabel");
local UIGradient2 = Instance.new("UIGradient");

ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game:GetService("Players").LocalPlayer.PlayerGui

DropShadowHolder.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadowHolder.BackgroundTransparency = 1
DropShadowHolder.BorderSizePixel = 0
DropShadowHolder.Position = UDim2.new(0.5, 0, 0.1, 0)
DropShadowHolder.Size = UDim2.new(0, 500, 0, 68)
DropShadowHolder.ZIndex = 0
DropShadowHolder.Name = "DropShadowHolder"
DropShadowHolder.Parent = ScreenGui

DropShadow.Image = "rbxassetid://6015897843"
DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
DropShadow.ImageTransparency = 0.5
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

Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Main.BackgroundTransparency = 0.5
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.Size = UDim2.new(1, -47, 1, -47)
Main.Name = "Main"
Main.Parent = DropShadow

UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = Main

UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Thickness = 2.5
UIStroke.Parent = Main

UIGradient.Color = ColorSequence.new{
ColorSequenceKeypoint.new(0, Color3.fromRGB(131.00000739097595, 181.0000044107437, 255)),
ColorSequenceKeypoint.new(1, Color3.fromRGB(224.000001847744, 162.00000554323196, 255))
}
UIGradient.Parent = UIStroke

Top.Font = Enum.Font.GothamBold
Top.Text = "Let the music play"
Top.TextColor3 = Color3.fromRGB(255, 255, 255)
Top.TextSize = 16.5
Top.TextYAlignment = Enum.TextYAlignment.Bottom
Top.AnchorPoint = Vector2.new(0.5, 0)
Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Top.BackgroundTransparency = 0.9990000128746033
Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
Top.BorderSizePixel = 0
Top.Position = UDim2.new(0.5, 0, 0, 15)
Top.Size = UDim2.new(0, 500, 0, 18)
Top.Name = "Top"
Top.Parent = Main

UIGradient1.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(131.00000739097595, 181.0000044107437, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(224.000001847744, 162.00000554323196, 255))
}
UIGradient1.Parent = Top

Under.Font = Enum.Font.GothamBold
Under.Text = "Script started!"
Under.TextColor3 = Color3.fromRGB(255, 255, 255)
Under.TextSize = 18
Under.TextYAlignment = Enum.TextYAlignment.Bottom
Under.AnchorPoint = Vector2.new(0.5, 0)
Under.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Under.BackgroundTransparency = 0.9990000128746033
Under.BorderColor3 = Color3.fromRGB(0, 0, 0)
Under.BorderSizePixel = 0
Under.Position = UDim2.new(0.5, 0, 0, 35)
Under.Size = UDim2.new(0, 500, 0, 18)
Under.Name = "Under"
Under.Parent = Main

UIGradient2.Color = ColorSequence.new{
ColorSequenceKeypoint.new(0, Color3.fromRGB(131.00000739097595, 181.0000044107437, 255)),
ColorSequenceKeypoint.new(1, Color3.fromRGB(224.000001847744, 162.00000554323196, 255))
}
UIGradient2.Parent = Under
Top.Size = UDim2.new(0, Top.TextBounds.X, 0, 18)
Under.Size = UDim2.new(0, Under.TextBounds.X, 0, 18)
if Top.Size.X.Offset > Under.Size.X.Offset then
    DropShadowHolder.Size = UDim2.new(0, Top.TextBounds.X + 50, 0, 68)
else
    DropShadowHolder.Size = UDim2.new(0, Under.TextBounds.X + 50, 0, 68)
end
Top:GetPropertyChangedSignal("Text"):Connect(function()
    Top.Size = UDim2.new(0, Top.TextBounds.X, 0, 18)
    if Top.Size.X.Offset > Under.Size.X.Offset then
        DropShadowHolder.Size = UDim2.new(0, Top.TextBounds.X + 50, 0, 68)
    else
        DropShadowHolder.Size = UDim2.new(0, Under.TextBounds.X + 50, 0, 68)
    end
end)
Under:GetPropertyChangedSignal("Text"):Connect(function()
    Under.Size = UDim2.new(0, Under.TextBounds.X, 0, 18)
    if Top.Size.X.Offset > Under.Size.X.Offset then
        DropShadowHolder.Size = UDim2.new(0, Top.TextBounds.X + 50, 0, 68)
    else
        DropShadowHolder.Size = UDim2.new(0, Under.TextBounds.X + 50, 0, 68)
    end
end)


Under.Text = "thua55555555555555555555555555555555555555555555555555555555555555555555" 
function ContentSet(Content1, Content2)
	if not Content1 then Content1 = 'None (Not Found)' end 
	if not Content2 or Content2 == '' then Content2 = 'Farming Level (or None)' end 
	Top.Text = "Auto Farm: "..Content1
	Under.Text = "Task:"..Content2 
end