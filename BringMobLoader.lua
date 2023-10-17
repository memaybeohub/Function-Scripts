function BringMob()
    if not BringMobChoosen then
        repeat
            task.wait()
        until BringMobChoosen
    end
    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
    if LockCFrame and BringMobChoosen then
        for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
            if
                v.Name == BringMobChoosen.Name and (LockCFrame.Position - v.HumanoidRootPart.Position).Magnitude < 340 and
                    (LockCFrame.Position - v.HumanoidRootPart.Position).Magnitude > 3 and
                    (chodonandngu(v.HumanoidRootPart) or isnetworkowner(v.HumanoidRootPart)) and
                    v.Humanoid.MaxHealth < 100000
             then
                v.HumanoidRootPart.CFrame = LockCFrame
                spawn(
                    function()
                        pcall(
                            function()
                                SizePart(v, LockCFrame, BringMobChoosen.Name)
                            end
                        )
                    end
                )
            end
        end
    end
    if BringMobChoosen then
        for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
            if
                v.Name == BringMobChoosen.Name and
                    (BringMobChoosen.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude < 340 and
                    (BringMobChoosen.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude > 3 and
                    (chodonandngu(v.HumanoidRootPart) or isnetworkowner(v.HumanoidRootPart)) and
                    v.Humanoid.MaxHealth < 100000
             then
                v.HumanoidRootPart.CFrame = BringMobChoosen.HumanoidRootPart.CFrame
                spawn(
                    function()
                        if BringMobChoosen then
                            SizePart(v, BringMobChoosen.HumanoidRootPart.CFrame, BringMobChoosen.Name)
                        end
                    end
                )
            end
        end
    end
end
task.spawn(
    function()
        while task.wait() do
            if StartBringMob then
                pcall(
                    function()
                        BringMob()
                    end
                )
            end
        end
    end
) 
task.spawn(
        function()
            while task.wait() do
                if StartBringMob then 
                    for i,v in pairs(game.workspace.Enemies:GetChildren()) do 
                        if
                            StartBringMob and v:FindFirstChild("lockmmb") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                v.Humanoid.Health > 0 and
                                not string.find(v.Name, "Boss") and
                                not table.find(Elites, v.Name)
                        then
                            if not v:FindFirstChild("TickCheck") then
                                TickCheck = Instance.new("IntValue")
                                TickCheck.Name = "TickCheck"
                                TickCheck.Parent = v
                                TickCheck.Value = tick()
                            elseif
                                v:FindFirstChild("TickCheck") and
                                    ((tick() - v.TickCheck.Value >= 90 and v.Humanoid.Health == v.Humanoid.MaxHealth) or
                                        (tick() - v.TickCheck.Value >= 90))
                            then
                                v.Humanoid.Health = 0
                            end
                            task.wait(.5)
                        else
                            break
                        end
                    end
                end
            end
        end
    )
function SizePart(v, CFRmg, namemob1)
    if v:FindFirstChild("lockmmb") then
        return
    end
    if namemob1 and v.Name ~= namemob1 then
        print("khac name")
        return
    end
    if not v:FindFirstChild("HumanoidRootPart") then
        return
    end
    if not v.HumanoidRootPart:FindFirstChild("lockmmb") then
        local lock = Instance.new("BodyVelocity")
        lock.Parent = v.HumanoidRootPart
        lock.Name = "lockmmb"
        lock.MaxForce = Vector3.new(100000, 100000, 100000)
        lock.Velocity = Vector3.new(0, 0, 0)
        if not CFRmg then
            return
        end
        if IsBoss(v.Name) then
            return
        end
        if isnetworkowner(v.HumanoidRootPart) and v.Humanoid.MaxHealth <= 500000 and not IsBoss(v.Name) then  
            spawn(
                function()
                    pcall(
                        function()
                            if v and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                for i, sk in pairs(v:GetDescendants()) do
                                    if sk:IsA("BasePart") or sk:IsA("Part") then
                                        sk.CanCollide = false
                                    end
                                end
                                v.Humanoid.WalkSpeed = 0
                                v.Humanoid.JumpPower = 0
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                            end
                        end
                    )
                end
            )
        else
            return 
        end
    end
end 