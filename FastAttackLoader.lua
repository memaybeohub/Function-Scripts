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
    local active = Combatfram2.activeController
    ishowspeed = .1
    for i = 1, 1 do
        bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
            game.Players.LocalPlayer.Character,
            {game.Players.LocalPlayer.Character.HumanoidRootPart},
            60
        )
        if #bladehit > 0 then
            local u8 = debug.getupvalue(active.attack, 5)
            local u9 = debug.getupvalue(active.attack, 6)
            local u7 = debug.getupvalue(active.attack, 4)
            local u10 = debug.getupvalue(active.attack, 7)
            local u12 = (u8 * 798405 + u7 * 727595) % u9
            local u13 = u7 * 798405
            (function()
                u12 = (u12 * u9 + u13) % 1099511627776
                u8 = math.floor(u12 / u9)
                u7 = u12 - u8 * u9
            end)()
            u10 = u10 + 1
            debug.setupvalue(active.attack, 5, u8)
            debug.setupvalue(active.attack, 6, u9)
            debug.setupvalue(active.attack, 4, u7)
            debug.setupvalue(active.attack, 7, u10)
            pcall(
                function()
                    for k, v in pairs(active.animator.anims.basic) do
                        v:Play()
                    end
                end
            )
            if ply.Character:FindFirstChildOfClass("Tool") and active.blades and active.blades[1] then
                task.wait(ishowspeed)
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer(
                    "weaponChange",
                    tostring(GetCurrentBlade())
                )
                game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                task.wait()
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, 3, "")
            end
        end
    end
end
if not Config then Config = {} end
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
