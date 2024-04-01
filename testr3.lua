---- Settings -----
local HttpService = game:GetService("HttpService")
local HubSetting = {}
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
print('Loading config...')
local Config = {}
print('Loaded Configs')
local Icons = {}
local Success, Response =
    pcall(
    function()
        Icons =
        game:GetService("HttpService"):JSONDecode(
            game:HttpGet(
                "https://raw.githubusercontent.com/evoincorp/lucideblox/master/src/modules/util/icons.json"
            )
        ).icons
    end
)
print('Creating window....')
local Window =
    Fluent:CreateWindow(
    {
        Title = "Tsuo Hub",
        SubTitle = "Develope by vMh~ (discord.gg/tsuoscripts)",
        TabWidth = 160,
        Size = UDim2.fromOffset(500, 290),
        Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
        Theme = "Amethyst",
        MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
    }
)
function Window:NewTab(mmb)
    local domain
    local newmm = Window:AddTab(mmb)
    local domain = newmm
    function newmm:NewParagraph(cf)
        local paragraphnew
        local newTitle = cf.Title or "Tsuo Hub"
        local newContent = cf.Content or "MMB"
        local paragraphnew =
            domain:AddParagraph(
            {
                Content = newContent,
                Title = newTitle
            }
        )
        function paragraphnew:Set(cf2)
            newTitle = cf2.Title or "Tsuo Hub"
            newContent = cf2.Content or "MMB"
            paragraphnew:SetTitle(newTitle)
            paragraphnew:SetDesc(newContent)
        end
        return paragraphnew
    end
    function newmm:NewButton(cf)
        local cfreal = {}
        cfreal.Title = cf.Title or "Button"
        cfreal.Description = cf.Description or ""
        cfreal.Callback = cf.Callback or function()
            end
        for i, v in pairs(cfreal) do
            cf[i] = v
        end

        cfreal.V = domain:AddButton(cf)
        return cfreal.V
    end
    function newmm:NewDialog(cf)
        local cfreal = {}
        cfreal.Title = cf.Title or ""
        cfreal.Content = cf.Content or ""
        cfreal.Buttons = cf.Buttons or {}
        for i, v in pairs(cfreal) do
            cf[i] = v
        end
        return Window:Dialog(cf)
    end
    function newmm:NewToggle(sv, cf)
        local cfreal = {}
        cfreal.Title = cf.Title or "Toggle"
        cfreal.Description = cf.Description or ""
        cfreal.Default = Config[sv] and not cfreal.DontSave or false
        cfreal.Callback = cf.Callback or function()end
        for i, v in pairs(cfreal) do
            cf[i] = v
        end
        cf.Callback = function(v)
            cfreal.Callback(v)
            Save()
        end
        local fake = domain:AddToggle(sv, cf) 
        function cfreal:Set(bo)
            z(sv,"set value",bo)
            fake:SetValue(bo)
        end
        for i, v in pairs(fake) do
            if not cfreal[i] then
                cfreal[i] = v
            else
                table.insert(cfreal, v)
            end
        end
        return fake
    end
    function newmm:NewSlider(scriptitle, cf)
        local DFConfig = {
            Title = "Slider",
            Description = "",
            Min = 5,
            Max = 150,
            Default = (5 + 150) / 2,
            Rounding = 1,
            Callback = function(v)
            end
        }
        if not Config[scriptitle] then 
            Config[scriptitle] = cf.Min 
        end
        if Config[scriptitle] then 
            cf.Default = Config[scriptitle]
        elseif cf.Default then 
            cf.Default = cf.Default
        else
            cf.Default = DFConfig.Default
        end
        DFConfig.Callback = cf.Callback or function(v)
        end
        for i, v in pairs(DFConfig) do
            if not cf[i] then
                cf[i] = v
            end
        end  
        cf.Callback = function(v)
            DFConfig.Callback(v)
            Save()
        end
        local DFSCRIPT = domain:AddSlider(scriptitle, cf)
        function DFSCRIPT:Set(v)
            DFSCRIPT:SetValue(v)
        end
        return DFSCRIPT
    end
    function newmm:NewDropdown(title, cf)
        local DefaultConfigDropdown = {
            Title = "Drodown",
            Values = {"MMB", "TSUO"},
            Multi = false,
            Default = nil
        }
        if cf.Multi then
            if not Config[title] then
                Config[title] = {}
                for i, v in pairs(cf.Values) do
                    Config[title][v] = false
                end
            end
        end
        cf.Default = Config[title]
        local dropdown
        local dropdown = domain:AddDropdown(title, cf)
        dropdown:OnChanged(
            function(cv)
                pcall(
                    function(cv)
                        Save()
                    end
                )
            end
        )
        function dropdown:Set(v)
            dropdown:SetValue(v)
        end
        return dropdown
    end
    function newmm:NewColorPicker(title, cf)
        local DFConfig = {
            Title = "Colorpicker",
            Default = Color3.fromRGB(96, 205, 255)
        }
        for i, v in pairs(DefaultConfig) do
            if not cf[i] then
                cf[i] = v
            end
        end
        cf.Callback = function(v)
            DefaultConfig.Callback(v)
            Save()
        end
        cf.Defualt = Config[title] or Color3.fromRGB(96, 205, 255)
        local cl = domain:AddColorpicker(title, cf)
        function cl:Set(v)
            cl:SetValueRGB(v)
        end
        return cl
    end
    function newmm:NewKeyBind(title, cf)
        local DFConfig = {
            Title = "gg",
            Mode = "Toggle",
            Default = "LeftControl"
        }
        for i, v in pairs(DFConfig) do
            if not cf[i] then
                cf[i] = v
            end
        end
        cf.Callback = function(v)
            DFConfig.Callback(v)
            Save()
        end
        DFConfig.Defualt = Config[title]
        local kb = domain:AddKeybind(title, cf)
        return kb
    end
    function newmm:NewInput(title, cf)
        local DefaultConfig = {
            Title = "Input",
            Default = "",
            Placeholder = "Paste Here",
            Numeric = false, -- Only allows numbers
            Finished = true, -- Only calls callback when you press enter
            Callback = function(Value)
            end
        }
        DefaultConfig.Defualt = Config[title]
        for i, v in pairs(DefaultConfig) do
            if not cf[i] then
                cf[i] = v
            end
        end
        local ip = domain:AddInput(title, cf)
        return ip
    end
    return newmm
end
function getRandomIcon()
    idicon = math.random(1, 555)
    idcount = 0
    for i, v in pairs(Icons) do
        if v then
            if idcount == idicon then
                return v
            else
                idcount = idcount + 1
            end
        end
    end
    return "rbxassetid://7733954058"
end
local DefaultTab = Window:NewTab({Title = "Default", Icon = getRandomIcon()})
local FarmTab = Window:NewTab({Title = "Farm", Icon = getRandomIcon()}) 
local ServerTab = Window:NewTab({Title = "Server & Info", Icon = getRandomIcon()})
local NoelTab
if game.workspace:FindFirstChild("Countdown") then 
    NoelTab = Window:NewTab({Title = "Noel Event",Icon = getRandomIcon()})
end
local PlRTAB = Window:NewTab({Title = "Local Player", Icon = getRandomIcon()}) 
local WeaponTab = Window:NewTab({Title = "Weapon", Icon = getRandomIcon()}) 
local ShopTab = Window:NewTab({Title = "Shop",Icon = getRandomIcon()})
local RaidTab = Window:NewTab({Title = "Fruits & Raid", Icon = getRandomIcon()})
if not Sea1 then 
    SeaBeastTab = Window:NewTab({Title = "Sea Beast",Icon = getRandomIcon()})
end 
local SettingTab = Window:NewTab({Title = "Setting",Icon = getRandomIcon()}) 
DefaultTab:AddSection("Missing Kim Tho 😒")
DefaultTab:NewButton({
    Title = "Cancel Tween",
    Description = "Cancel the tween and remove noclip effects.",
    Callback = function()
        CancelTween()
    end
})
