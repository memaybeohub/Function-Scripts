for i = 1,3 do 
    if not loadstring(game:HttpGet("https://raw.githubusercontent.com/memaybeohub/Function-Scripts/main/status"..i..".lua"))() then 
        repeat task.wait() print("Status Down") until wearkoiewrhguehgrehgrthgyu
    end
end
new = {}
function new.KillMob(Mob, kkk)
    if type(Mob) == "table" and kkk then
        if CheckMob(Mob) then
            MobSLC = CheckMob(Mob)
            if
                MobSLC and MobSLC:FindFirstChild("Humanoid") and MobSLC:FindFirstChild("HumanoidRootPart") and
                    MobSLC.Humanoid.Health > 0
             then
                LockCFrame = MobSLC.HumanoidRootPart.CFrame
                repeat
                    task.wait()
                    if
                        MobSLC and MobSLC:FindFirstChild("Humanoid") and MobSLC:FindFirstChild("HumanoidRootPart") and
                            MobSLC.Humanoid.Health > 0
                     then
                        NoClip = true
                        spawn(
                            function()
                                BringMobChoosen = MobSLC
                            end
                        )
                        spawn(
                            function()
                                BringMobCFrame = MobSLC.HumanoidRootPart.CFrame
                            end
                        )
                        spawn(EquipWeapon(), 1)
                        spawn(EnableBuso(), 1)
                        StartBringMob = true
                        spawn(pcall(Tweento(MobSLC.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0)), 1), 1)
                        UseFastAttack = true
                    else
                        task.wait()
                    end
                until not MobSLC or not MobSLC:FindFirstChild("Humanoid") or
                    not MobSLC:FindFirstChild("HumanoidRootPart") or
                    MobSLC.Humanoid.Health <= 0
                UseFastAttack = false
                NoClip = false
                return true
            end
        else
            MobSLCSpawnssss = {}
            if string.find(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()[1].Name, "Lv.") then
                MobSLCSpawnssss = Mob
            else
                for i, v in pairs(Mob) do
                    table.insert(MobSLCSpawnssss, tostring(v:gsub(" %pLv. %d+%p", "")))
                end
            end
            for i, v in pairs(MobSLCSpawnssss) do
                if game.Workspace.MobSpawns:FindFirstChild(v) then
                    MobSpawn = game.Workspace.MobSpawns[v]
                    if not CheckMob(Mob) and MobSpawn then
                        EnableBuso()
                        EquipWeapon()
                        if MobSpawn:IsA("Part") then
                            Tweento(MobSpawn.CFrame * CFrame.new(0, 20, 8))
                        elseif MobSpawn:FindFirstChild("HumanoidRootPart") then
                            Tweento(MobSpawn.HumanoidRootPart.CFrame * CFrame.new(0, 8, 8))
                        end
                    end
                else
                    FunctionFoldermob()
                end
            end
        end
    else
        if Mob and Mob:FindFirstChild("Humanoid") and Mob:FindFirstChild("HumanoidRootPart") and Mob.Humanoid.Health > 0 then
            LockCFrame = Mob.HumanoidRootPart.CFrame
            repeat
                task.wait()
                if
                    Mob and Mob:FindFirstChild("Humanoid") and Mob:FindFirstChild("HumanoidRootPart") and
                        Mob.Humanoid.Health > 0
                 then
                    NoClip = true
                    spawn(
                        function()
                            BringMobChoosen = Mob
                        end
                    )
                    spawn(
                        function()
                            BringMobCFrame = Mob.HumanoidRootPart.CFrame
                        end
                    )
                    spawn(EquipWeapon(), 1)
                    spawn(EnableBuso(), 1)
                    StartBringMob = true
                    spawn(pcall(Tweento(Mob.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0)), 1), 1)
                    UseFastAttack = true
                else
                    task.wait()
                end
            until not Mob or not Mob:FindFirstChild("Humanoid") or not Mob:FindFirstChild("HumanoidRootPart") or
                Mob.Humanoid.Health <= 0
            UseFastAttack = false
            NoClip = false
            return true
        end
    end
end
return new