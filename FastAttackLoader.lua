local old = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
local com = getupvalue(old, 2)
require(game.ReplicatedStorage.Util.CameraShaker):Stop()
spawn(
    function()
        game:GetService("RunService").Stepped:Connect(
            function()
                pcall(
                    function()
                        com.activeController.hitboxMagnitude = 60
                        if UseFastAttack or Config["Fast Attack Aura"] then
                            com.activeController.hitboxMagnitude = 60
                            com.activeController.active = false
                            com.activeController.blocking = false
                            com.activeController.focusStart = 0
                            com.activeController.hitSound = nil
                            com.activeController.increment = 0
                            com.activeController.timeToNextAttack = 0
                            com.activeController.timeToNextBlock = 0
                            com.activeController:attack()
                        end
                    end
                )
            end
        )
    end
)

local ply = game.Players.LocalPlayer

local Combatfram1 = debug.getupvalues(require(ply.PlayerScripts.CombatFramework))
local Combatfram2 = Combatfram1[2]

function GetCurrentBlade()
    local p13 = Combatfram2.activeController
    local ret = p13.blades[1]
    if not ret then
        return
    end
    while ret.Parent ~= game.Players.LocalPlayer.Character do
        ret = ret.Parent
    end
    return ret
end

function blademon(Sizes)
    local Hits = {}
    local Client = game.Players.LocalPlayer
    local Enemies = game:GetService("Workspace").Enemies:GetChildren()
    for i = 1, #Enemies do
        local v = Enemies[i]
        local Human = v:FindFirstChildOfClass("Humanoid")
        if
            Human and Human.RootPart and Human.Health > 0 and
                Client:DistanceFromCharacter(Human.RootPart.Position) < Sizes + 5
         then
            table.insert(Hits, Human.RootPart)
        end
    end
    return Hits
end

function Attack()
    pcall(
        function()
            local a = game.Players.LocalPlayer
            local b = getupvalues(require(a.PlayerScripts.CombatFramework))[2]
            function GetCurrentBlade()
                local c = b.activeController
                local d = c.blades[1]
                if not d then
                    return
                end
                while d.Parent ~= game.Players.LocalPlayer.Character do
                    d = d.Parent
                end
                return d
            end
            local e = b.activeController
            for f = 1, 1 do
                local g =
                    require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
                    a.Character,
                    {a.Character.HumanoidRootPart},
                    60
                )
                local h = {}
                local i = {}
                for j, k in pairs(g) do
                    if k.Parent:FindFirstChild("HumanoidRootPart") and not i[k.Parent] then
                        table.insert(h, k.Parent.HumanoidRootPart)
                        i[k.Parent] = true
                    end
                end
                g = h
                if #g > 0 then
                    local l = debug.getupvalue(e.attack, 5)
                    local m = debug.getupvalue(e.attack, 6)
                    local n = debug.getupvalue(e.attack, 4)
                    local o = debug.getupvalue(e.attack, 7)
                    local p = (l * 798405 + n * 727595) % m
                    local q = n * 798405
                    (function()
                        p = (p * m + q) % 1099511627776
                        l = math.floor(p / m)
                        n = p - l * m
                    end)()
                    o = o + 1
                    debug.setupvalue(e.attack, 5, l)
                    debug.setupvalue(e.attack, 6, m)
                    debug.setupvalue(e.attack, 4, n)
                    debug.setupvalue(e.attack, 7, o)
                    pcall(
                        function()
                            if a.Character:FindFirstChildOfClass("Tool") and e.blades and e.blades[1] then
                                e.animator.anims.basic[1]:Play(0.01, 0.01, 0.01)
                                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer(
                                    "weaponChange",
                                    tostring(GetCurrentBlade())
                                )
                                game.ReplicatedStorage.Remotes.Validator:FireServer(
                                    math.floor(p / 1099511627776 * 16777215),
                                    o
                                )
                                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", g, f, "")
                            end
                        end
                    )
                end
            end
            b.activeController.timeToNextAttack = -math.huge
            b.activeController.attacking = false
            b.activeController.timeToNextBlock = 0
            b.activeController.humanoid.AutoRotate = 80
            b.activeController.increment = 4
            b.activeController.blocking = false
            b.activeController.hitboxMagnitude = 200
        end
    )
end
if not Config then
    Config = {}
end
Config["Fast Attack Delay"] = Config["Fast Attack Delay"] or 0.2
spawn(
    function()
        while task.wait(Config["Fast Attack Delay"]) do
            if UseFastAttack or Config["Fast Attack Aura"] then
                pcall(
                    function()
                        Attack()
                    end
                )
            end
        end
    end
)
