-- Make by Flontinum
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local autofarm = Instance.new("TextLabel")
local status = Instance.new("TextLabel")
local doing = Instance.new("TextLabel")
local doing_2 = Instance.new("TextLabel")
local ImageLabel = Instance.new("ImageLabel")
local UICorner_2 = Instance.new("UICorner")
local TextBox = Instance.new("TextBox")
local UICorner_3 = Instance.new("UICorner")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.5, 0, 0.127530351, 0)
Frame.Size = UDim2.new(0.4779661, 0, 0.145344153, 0)

UICorner.Parent = Frame

autofarm.Name = "auto farm"
autofarm.Parent = Frame
autofarm.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
autofarm.BackgroundTransparency = 1.000
autofarm.BorderColor3 = Color3.fromRGB(0, 0, 0)
autofarm.BorderSizePixel = 0
autofarm.Position = UDim2.new(-0.0425531901, 0, -0.111420594, 0)
autofarm.Size = UDim2.new(0, 200, 0, 50)
autofarm.Font = Enum.Font.FredokaOne
autofarm.Text = "Auto Farm:"
autofarm.TextColor3 = Color3.fromRGB(97, 255, 184)
autofarm.TextSize = 18.000

status.Name = "status"
status.Parent = Frame
status.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
status.BackgroundTransparency = 1.000
status.BorderColor3 = Color3.fromRGB(0, 0, 0)
status.BorderSizePixel = 0
status.Position = UDim2.new(-0.0425531901, 0, 0.292479128, 0)
status.Size = UDim2.new(0, 200, 0, 50)
status.Font = Enum.Font.FredokaOne
status.Text = "Status:"
status.TextColor3 = Color3.fromRGB(97, 255, 184)
status.TextSize = 18.000

doing.Name = "doing"
doing.Parent = Frame
doing.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
doing.BackgroundTransparency = 1.000
doing.BorderColor3 = Color3.fromRGB(0, 0, 0)
doing.BorderSizePixel = 0
doing.Position = UDim2.new(0.31205675, 0, -0.111420542, 0)
doing.Size = UDim2.new(0, 200, 0, 50)
doing.Font = Enum.Font.FredokaOne
doing.Text = "What is your doing"
doing.TextColor3 = Color3.fromRGB(208, 36, 220)
doing.TextSize = 18.000
doing.TextWrapped = true

doing_2.Name = "doing"
doing_2.Parent = Frame
doing_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
doing_2.BackgroundTransparency = 1.000
doing_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
doing_2.BorderSizePixel = 0
doing_2.Position = UDim2.new(0.31205675, 0, 0.292479128, 0)
doing_2.Size = UDim2.new(0, 200, 0, 50)
doing_2.Font = Enum.Font.FredokaOne
doing_2.Text = "What is your doing"
doing_2.TextColor3 = Color3.fromRGB(208, 36, 220)
doing_2.TextSize = 18.000
doing_2.TextWrapped = true

ImageLabel.Parent = Frame
ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.5, 0, -0.126740858, 0)
ImageLabel.Size = UDim2.new(0, 36, 0, 36)
ImageLabel.Image = "http://www.roblox.com/asset/?id=17140528880"

UICorner_2.Parent = ImageLabel

TextBox.Parent = Frame
TextBox.AnchorPoint = Vector2.new(0.5, 0.5)
TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.49911347, 0, 1.66991627, 0)
TextBox.Size = UDim2.new(0.759574473, 0, 0.519999921, 0)
TextBox.Font = Enum.Font.FredokaOne
TextBox.PlaceholderColor3 = Color3.fromRGB(197, 25, 77)
TextBox.PlaceholderText = "Paste Job ID for Join Here"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextSize = 14.000

UICorner_3.Parent = TextBox

function ContentSet(Content1, Content2)
	if not Content1 then Content1 = 'None (Not Found)' end 
	if not Content2 or Content2 = '' then Content2 = 'Farming Level (or None)' end 
	doing.Text = Content1
	doing_2.Text = Content2
end