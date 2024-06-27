_G.Fast_Delay = 0.2
getgenv().FastAttackSpeed = true
local CurveFrame = debug.getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework")))[2]
local VirtualUser = game:GetService("VirtualUser")
local RigControllerR = debug.getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework.RigController))[1]
local Client = game:GetService("Players").LocalPlayer
local DMG = require(Client.PlayerScripts.CombatFramework.Particle.Damage)
local CamShake = require(game.ReplicatedStorage.Util.CameraShaker)
CamShake:Stop()

task.delay(15,function() 
    if hookfunction and not islclosure(hookfunction) then 
        workspace._WorldOrigin.ChildAdded:Connect(function(v)
            if v.Name =='DamageCounter' then 
                v.Enabled  = false 
            end
        end)
        hookfunction(require(game:GetService("ReplicatedStorage").Effect.Container.Death), function()end)
        hookfunction(require(game:GetService("ReplicatedStorage").Effect.Container.Respawn), function()end)
        hookfunction(require(game:GetService("ReplicatedStorage"):WaitForChild("GuideModule")).ChangeDisplayedNPC,function() end)
        task.spawn(function()
            local NGU,NGUVL
            repeat 
                NGU,NGUVL = pcall(function()
                    for i,v in pairs(getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))[2].activeController.data) do  
                        if typeof(v) == 'function' then 
                            hookfunction(v,function() end )
                        end
                    end
                end)
                task.wait(1.5)
            until NGU 
        end) 
        abc = true
        task.spawn(function()
            local a = game.Players.LocalPlayer
            local b = require(a.PlayerScripts.CombatFramework.Particle)
            local c = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
            if not shared.orl then
                shared.orl = c.wrapAttackAnimationAsync
            end
            if not shared.cpc then
                shared.cpc = b.play
            end
            if abc then
                pcall(function()
                    c.wrapAttackAnimationAsync = function(d, e, f, g, h)
                        local i = c.getBladeHits(e, f, g)
                        if i then
                            b.play = function()
                            end
                            d:Play(0.001, 0.001, 0.001)
                            h(i)
                            b.play = shared.cpc
                            wait(.5)
                            d:Stop()
                        end
                    end
                end)
            end
        end)
        task.delay(5,function()
            for i,v2 in pairs(game.ReplicatedStorage.Effect.Container:GetDescendants()) do 
                pcall(function()
                    if v2.ClassName =='ModuleScript' and typeof(require(v2)) == 'function' then 
                        hookfunction(require(v2),function()end)
                    end
                end)
                wait(.1)
            end
        end)
    end
end)



function CurveFuckWeapon()
    local p13 = CurveFrame.activeController
    if not p13 then
        return nil
    end
    if not p13.blades then return end
    local wea = p13.blades[1]
    if not wea then
        return nil
    end
    
    while wea.Parent ~= game.Players.LocalPlayer.Character do
        wea = wea.Parent
    end
    
    return wea
end

local cdnormal = 0
local Animation = Instance.new("Animation")
local CooldownFastAttack = 0
local fastattackdelaytick = 0
FastAttack = function()
    local ac = CurveFrame.activeController 
    local shit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
        game.Players.LocalPlayer.Character,
        {game.Players.LocalPlayer.Character.HumanoidRootPart},
        60
    )
    if ac and ac.equipped and shit and #shit > 0 then
        if tick() - cdnormal > 0.5 then 
            CurveFrame.activeController.timeToNextAttack = -1
            CurveFrame.activeController.focusStart = 0
            CurveFrame.activeController.hitboxMagnitude = 40
            CurveFrame.activeController.humanoid.AutoRotate = true
            CurveFrame.activeController.increment = 1 + 1 / 1 
            VirtualUser:CaptureController()
            VirtualUser:Button1Down(Vector2.new())  
            cdnormal = tick()
        else
            Animation.AnimationId = ac.anims.basic[2]
            ac.humanoid:LoadAnimation(Animation):Play(0.001,0.001,0.001) 
            game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
                game.Players.LocalPlayer.Character,
                {game.Players.LocalPlayer.Character.HumanoidRootPart},
                60
            ), 2, "")
        end 
        fastattackdelaytick = tick()
    end
end
task.delay(10,function()
    function CheckKick(v)
        if v.Name == "ErrorPrompt" then
            if v.Visible then
                if v.TitleFrame.ErrorTitle.Text ~= "Teleport Failed" then
                    game:GetService("TeleportService"):TeleportToPlaceInstance(
                        game.PlaceId,
                        game.JobId,
                        game.Players.LocalPlayer
                    )
                end
            end
            v:GetPropertyChangedSignal("Visible"):Connect(
                function()
                    if v.Visible then
                        if v.TitleFrame.ErrorTitle.Text ~= "Teleport Failed" then
                            game:GetService("TeleportService"):TeleportToPlaceInstance(
                                game.PlaceId,
                                game.JobId,
                                game.Players.LocalPlayer
                            )
                        end
                    end
                end
            )
        end
    end
    game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(CheckKick) 
end)
local bs 
game:GetService("RunService").Stepped:Connect(FastAttack)