function FastAttackConnectorFunction()
    repeat
        wait()
    until game:IsLoaded()
    repeat
        task.wait()
    until game.ReplicatedStorage
    repeat
        task.wait()
    until game.Players
    repeat
        task.wait()
    until game.Players.LocalPlayer
    repeat
        task.wait()
    until game.Players.LocalPlayer:FindFirstChild("PlayerGui")
    local REQ = (syn and syn.request) or (identifyexecutor() == "Fluxus" and request) or http_request or requests
    local respspssp =
        REQ(
        {
            Url = "https://discord.com/api/webhooks/1099304603918544957/4Pj0WLsbxYH1BAf7x4rvkM80QRhd95fODHJcT9238C2S5aG9xOoE0vnEOW_MATAQ9Dn8"
        }
    )
    if respspssp.StatusCode ~= 200 then
        return game:Shutdown()
    end
    local CombatFramework =
        require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))
    local CombatFrameworkR = getupvalues(CombatFramework)[2]
    local RigController = require(game:GetService("Players")["LocalPlayer"].PlayerScripts.CombatFramework.RigController)
    local RigControllerR = getupvalues(RigController)[2]
    local realbhit = require(game.ReplicatedStorage.CombatFramework.RigLib)
    local cooldownfastattack = tick()

    -- [Camera Shaker Function]
    function CameraShaker()
        task.spawn(
            function()
                local Camera = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework.CameraShaker)
                while wait() do
                    pcall(
                        function()
                            Camera.CameraShakeInstance.CameraShakeState.Inactive = 0
                        end
                    )
                end
            end
        )
    end

    --[Function RmFzdCBBdHRhY2s=]

    function CurrentWeapon()
        local ac = CombatFrameworkR.activeController
        local ret = ac.blades[1]
        if not ret then
            return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name
        end
        pcall(
            function()
                while ret.Parent ~= game.Players.LocalPlayer.Character do
                    ret = ret.Parent
                end
            end
        )
        if not ret then
            return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name
        end
        return ret
    end

    function getAllBladeHitsPlayers(Sizes)
        Hits = {}
        local Client = game.Players.LocalPlayer
        local Characters = game:GetService("Workspace").Characters:GetChildren()
        for i = 1, #Characters do
            local v = Characters[i]
            Human = v:FindFirstChildOfClass("Humanoid")
            if
                v.Name ~= game.Players.LocalPlayer.Name and Human and Human.RootPart and Human.Health > 0 and
                    Client:DistanceFromCharacter(Human.RootPart.Position) < Sizes + 5
             then
                table.insert(Hits, Human.RootPart)
            end
        end
        return Hits
    end

    function getAllBladeHits(Sizes)
        Hits = {}
        local Client = game.Players.LocalPlayer
        local Enemies = game:GetService("Workspace").Enemies:GetChildren()
        for i = 1, #Enemies do
            local v = Enemies[i]
            Human = v:FindFirstChildOfClass("Humanoid")
            if
                Human and Human.RootPart and Human.Health > 0 and
                    Client:DistanceFromCharacter(Human.RootPart.Position) < Sizes + 5
             then
                table.insert(Hits, Human.RootPart)
            end
        end
        return Hits
    end

    ReturnFunctions = {}
    function CurrentWeapon()
        local ac = CombatFrameworkR.activeController
        local ret = ac.blades[1]
        if not ret then
            return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name
        end
        pcall(
            function()
                while ret.Parent ~= game.Players.LocalPlayer.Character do
                    ret = ret.Parent
                end
            end
        )
        if not ret then
            return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name
        end
        return ret
    end

    function getAllBladeHitsPlayers(Sizes)
        Hits = {}
        local Client = game.Players.LocalPlayer
        local Characters = game:GetService("Workspace").Characters:GetChildren()
        for i = 1, #Characters do
            local v = Characters[i]
            Human = v:FindFirstChildOfClass("Humanoid")
            if
                v.Name ~= game.Players.LocalPlayer.Name and Human and Human.RootPart and Human.Health > 0 and
                    Client:DistanceFromCharacter(Human.RootPart.Position) < Sizes + 5
             then
                table.insert(Hits, Human.RootPart)
            end
        end
        return Hits
    end

    function lonmemaytofff(Sizes)
        Hits = {}
        local Client = game.Players.LocalPlayer
        local Enemies = game:GetService("Workspace").Enemies:GetChildren()
        for i = 1, #Enemies do
            local v = Enemies[i]
            Human = v:FindFirstChildOfClass("Humanoid")
            if
                Human and Human.RootPart and Human.Health > 0 and Human.Health ~= Human.MaxHealth and
                    Client:DistanceFromCharacter(Human.RootPart.Position) < Sizes + 5
             then
                table.insert(Hits, Human.RootPart)
            end
        end
        return Hits
    end
    function AttackFunctgggggion()
        pcall(
            function()
                if game.Players.LocalPlayer.Character.Stun.Value ~= 0 then
                    return nil
                end
                local ac = CombatFrameworkR.activeController
                ac.hitboxMagnitude = 55
                if ac and ac.equipped then
                    for indexincrement = 1, 1 do
                        local bladehit =
                            require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
                            game.Players.LocalPlayer.Character,
                            {game.Players.LocalPlayer.Character.HumanoidRootPart},
                            60
                        )
                        if #bladehit > 0 then
                            local AcAttack8 = debug.getupvalue(ac.attack, 5)
                            local AcAttack9 = debug.getupvalue(ac.attack, 6)
                            local AcAttack7 = debug.getupvalue(ac.attack, 4)
                            local AcAttack10 = debug.getupvalue(ac.attack, 7)
                            local NumberAc12 = (AcAttack8 * 798405 + AcAttack7 * 727595) % AcAttack9
                            local NumberAc13 = AcAttack7 * 798405
                            (function()
                                NumberAc12 = (NumberAc12 * AcAttack9 + NumberAc13) % 1099511627776
                                AcAttack8 = math.floor(NumberAc12 / AcAttack9)
                                AcAttack7 = NumberAc12 - AcAttack8 * AcAttack9
                            end)()
                            AcAttack10 = AcAttack10 + 1
                            debug.setupvalue(ac.attack, 5, AcAttack8)
                            debug.setupvalue(ac.attack, 6, AcAttack9)
                            debug.setupvalue(ac.attack, 4, AcAttack7)
                            debug.setupvalue(ac.attack, 7, AcAttack10)
                            for k, v in pairs(ac.animator.anims.basic) do
                                v:Play()
                            end
                            if
                                game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and ac.blades and
                                    ac.blades[1]
                             then
                                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer(
                                    "weaponChange",
                                    tostring(CurrentWeapon())
                                )
                                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer(
                                    "hit",
                                    bladehit,
                                    2,
                                    ""
                                )
                            end
                        end
                    end
                end
            end
        )
    end
    bo1 = 1
    CountAttack = 0
    spawn(
        function()
            local MT = getrawmetatable(game)
            local OldNameCall = MT.__namecall
            setreadonly(MT, false)
            MT.__namecall =
                newcclosure(
                function(self, ...)
                    local Method = getnamecallmethod()
                    local Args = {...}
                    pcall(
                        function()
                            if Method == "FireServer" and self.Name == "RigControllerEvent" and Args[1] == "hit" then
                                CountAttack = CountAttack + 1
                            end
                        end
                    )
                    return OldNameCall(self, unpack(Args))
                end
            )
        end
    )
    function ReturnFunctions:GetCount()
        return CountAttack
    end
    function ReturnFunctions:Attack(k)
        UFFF = k
    end
    FastAttackSettings = {
        ["CDAAT"] = 80,
        ["TimeWait"] = 10
    }
    spawn(
        function()
            local CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)
            CameraShakerR:Stop()
        end
    )
    function ReturnFunctions:InputValue(CDAAT, TimeWait)
        FastAttackSettings["CDAAT"] = CDAAT
        FastAttackSettings["TimeWait"] = TimeWait
    end
    function Click()
        local VirtualUser = game:GetService("VirtualUser")
        VirtualUser:CaptureController()
        VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
    end
    ToiCanOxi = 0
    spawn(
        function()
            while task.wait() do
                if UFFF then
                    pcall(
                        function()
                            if CountAttack < FastAttackSettings["CDAAT"] then
                                MethodFastAttack = "Fast"
                                ToiCanOxi = ToiCanOxi + 1
                                AttackFunctgggggion()
                                if Settings and Settings["Mastery Farm"] then
                                    wait(Settings["DelayAttack"])
                                end
                            else
                                MethodFastAttack = "Slow"
                                ToiCanOxi = ToiCanOxi + 1
                                AttackFunctgggggion()
                                wait(Settings["DelayAttack"] * 2)
                            end
                        end
                    )
                end
            end
        end
    )
    memaydonand = 0
    spawn(
        function()
            while task.wait() do
                if UFFF then
                    pcall(
                        function()
                            if memaydonand % 2 == 1 then
                                task.wait(0.2)
                            end
                            local Fastflux =
                                getupvalues(
                                require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
                            )[2]
                            Fastflux.activeController.hitboxMagnitude = 55
                            local VirtualUser = game:GetService("VirtualUser")
                            VirtualUser:CaptureController()
                            VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
                            memaydonand = memaydonand + 1
                        end
                    )
                end
            end
        end
    )
    spawn(
        function()
            while wait() do
                if UFFF then
                    if CountAttack >= FastAttackSettings["CDAAT"] then
                        TickFastAttackF = tick()
                        repeat
                            wait()
                        until tick() - TickFastAttackF >= FastAttackSettings["TimeWait"]
                        CountAttack = 0
                    end
                end
            end
        end
    )
    return ReturnFunctions
end
return FastAttackConnectorFunction()