task.delay(10,function()
    warn('Fast')
    local Players = game:GetService("Players")
    local Workspace = game:GetService("Workspace")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    local CombatFramework = require(Players.LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))
    local CombatFrameworkR = getupvalues(CombatFramework)[2]

    local _getupvalue = (debug.getupvalue or getupvalue or getupvalues or function(...)return ... end)
    local _setupvalue = (debug.setupvalue or setupvalue or setupvalues or function(...)return ... end)
    AddAttack = function(Hit)
        local ac = CombatFrameworkR.activeController
        if ac and ac.equipped then
            if #Hit > 0 then 
                local agrs1 = _getupvalue(ac.attack, 5)
                local agrs2 = _getupvalue(ac.attack, 6)
                local agrs3 = _getupvalue(ac.attack, 4)
                local agrs4 = _getupvalue(ac.attack, 7)
                local agrs5 = (agrs1 * 798405 + agrs3 * 727595) % agrs2
                local agrs6 = agrs3 * 798405

                agrs5 = (agrs5 * agrs2 + agrs6) % 1099511627776
                agrs1 = math.floor(agrs5 / agrs2)
                agrs3 = agrs5 - agrs1 * agrs2
                agrs4 = agrs4 + 1

                _setupvalue(ac.attack, 5, agrs1)
                _setupvalue(ac.attack, 6, agrs2)
                _setupvalue(ac.attack, 4, agrs3)
                _setupvalue(ac.attack, 7, agrs4)
                local Blade = ac.currentWeaponModel
                ac.animator.anims.basic[1]:Play(0.01, 0.01, 0.01)
                if Blade then
                    pcall(function()
                        ReplicatedStorage.RigControllerEvent:FireServer("weaponChange", Blade.Name)
                        ReplicatedStorage.Remotes.Validator:FireServer(math.floor(agrs5 / 1099511627776 * 16777215), agrs4)
                        ReplicatedStorage.RigControllerEvent:FireServer("hit", Hit, 1, "")
                    end)
                end
            end
        end
    end

    AttackFunc = function()
        AddAttack(require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
            game.Players.LocalPlayer.Character,
            {game.Players.LocalPlayer.Character.HumanoidRootPart},
            60
        ))
    end

    task.spawn(function()
        while task.wait(.15) do 
            task.spawn(AttackFunc)
        end
    end)
end)