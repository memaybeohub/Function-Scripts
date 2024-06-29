warn('Loading Fast Attack...')
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local CombatFramework = require(Players.LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))
local CombatFrameworkR = getupvalues(CombatFramework)[2]
local AddAttack = function(Hit) 
    local ac = CombatFrameworkR.activeController
    if #Hit > 0 and ac and ac.equipped then
        local agrs1 = getupvalue(ac.attack, 5)
        local agrs2 = getupvalue(ac.attack, 6)
        local agrs3 = getupvalue(ac.attack, 4)
        local agrs4 = getupvalue(ac.attack, 7)
        local agrs5 = (agrs1 * 798405 + agrs3 * 727595) % agrs2
        local agrs6 = agrs3 * 798405

        agrs5 = (agrs5 * agrs2 + agrs6) % 1099511627776
        agrs1 = math.floor(agrs5 / agrs2)
        agrs3 = agrs5 - agrs1 * agrs2
        agrs4 = agrs4 + 1

        setupvalue(ac.attack, 5, agrs1)
        setupvalue(ac.attack, 6, agrs2)
        setupvalue(ac.attack, 4, agrs3)
        setupvalue(ac.attack, 7, agrs4)
        local Blade = ac.currentWeaponModel
        if Blade then
            ReplicatedStorage.RigControllerEvent:FireServer("weaponChange", Blade.Name)
            ac.animator.anims.basic[1]:Play(1, 1, 0.001)
            ReplicatedStorage.Remotes.Validator:FireServer(math.floor(agrs5 / 1099511627776 * 16777215), agrs4)
            ReplicatedStorage.RigControllerEvent:FireServer("hit", Hit, 1, "")
        end
    end
end
local AttackFunc = function()
    AddAttack(require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(game.Players.LocalPlayer.Character,{game.Players.LocalPlayer.Character.HumanoidRootPart},60)) 
end
local Tick = tick()
getgenv().DelayFast = getgenv().DelayFast or 0.21
local RunAttack = function()
    if getgenv().UseFAttack and (tick() - Tick) >= getgenv().DelayFast then
        AttackFunc()
        Tick = tick()
    end
end  
getgenv().UseFAttack = false
task.spawn(function()
    while task.wait() do 
        RunAttack()
    end
end) 
warn('Loaded Fast Attack!')
