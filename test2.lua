new = {}
function FastAttackConnectorFunction()
    repeat wait() until game:IsLoaded()
    repeat task.wait() until game.ReplicatedStorage
    repeat task.wait() until game.Players
    repeat task.wait() until game.Players.LocalPlayer
    repeat task.wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")
    local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))
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
        if game.Players.LocalPlayer.Character.Stun.Value ~= 0 then
            return nil
        end
        local ac = CombatFrameworkR.activeController
        ac.hitboxMagnitude = 55
        if ac and ac.equipped then
            for indexincrement = 1, 1 do
                local bladehit =require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(game.Players.LocalPlayer.Character,{game.Players.LocalPlayer.Character.HumanoidRootPart},60)
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
                    if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and ac.blades and ac.blades[1] then
                        game:GetService("ReplicatedStorage").RigControllerEvent:FireServer(
                            "weaponChange",
                            tostring(CurrentWeapon())
                        )
                        game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, 2, "")
                    end
                end
            end
        end
    end
    bo1 = 1
    CountAttack = 0 
    spawn(function()
        local MT = getrawmetatable(game)
        local OldNameCall = MT.__namecall
        setreadonly(MT, false)
        MT.__namecall = newcclosure(function(self, ...)
            local Method = getnamecallmethod()
            local Args = {...}
            if Method == 'FireServer' and self.Name == "RigControllerEvent" and  Args[1] == "hit"  then
                CountAttack = CountAttack + 1 
            end
            return OldNameCall(self, unpack(Args))
        end)
        setreadonly(MT, true)
    end)
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
    spawn(function()
        local CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)
        CameraShakerR:Stop()
    end)
    function ReturnFunctions:InputValue(CDAAT,TimeWait)
        FastAttackSettings["CDAAT"] = CDAAT
        FastAttackSettings["TimeWait"] = TimeWait
    end
    function Click()
        local VirtualUser = game:GetService("VirtualUser")
        VirtualUser:CaptureController()
        VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
    end
    ToiCanOxi = 0
    spawn(function()
        while task.wait() do 
            if UFFF then 
                if Settings and type(Settings) == "table" then 
                    if Settings and Settings["Mastery Farm"] then 
                        ToiCanOxi = 2 
                        AttackFunctgggggion()
                        if Settings["DelayAttack"] and type(Settings["DelayAttack"]) == "number" and Settings["DelayAttack"] >= 0.1 then 
                            wait(Settings["DelayAttack"])
                        else
                            Settings["DelayAttack"] = 0.2 
                            wait(Settings["DelayAttack"])
                        end
                    elseif CountAttack < FastAttackSettings["CDAAT"] then 
                        ToiCanOxi = ToiCanOxi +1
                        AttackFunctgggggion()\
                    elseif CountAttack >= FastAttackSettings["CDAAT"] then 
                        if Settings["DelayAttack"] and type(Settings["DelayAttack"]) == "number" and Settings["DelayAttack"] >= 0.1 then 
                            wait(Settings["DelayAttack"]*2)
                        else
                            Settings["DelayAttack"] = 0.2 
                            wait(Settings["DelayAttack"]*2)
                        end
                    end
                end
            end
        end
    end)
    spawn(function()
        while task.wait() do 
            if UFFF then 
                pcall(function()
                    if ToiCanOxi % 2 == 1 then 
                        repeat task.wait() until ToiCanOxi % 2 == 0 
                    end
                    local Fastflux = getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))[2]
                    Fastflux.activeController.hitboxMagnitude = 55
                    Fastflux.activeController.timeToNextAttack = 0
                    Fastflux.activeController.attacking = false
                    Fastflux.activeController.increment = 3
                    Fastflux.activeController.blocking = false
                    Fastflux.activeController.timeToNextBlock = 0
                    local VirtualUser = game:GetService("VirtualUser")
                    VirtualUser:CaptureController()
                    VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
                    task.wait(0.2)
                end)
            end
        end
    end)
    spawn(function()
        while wait() do 
            if UFFF then  
                if CountAttack >= FastAttackSettings["CDAAT"] then 
                    TickFastAttackF = tick()
                    repeat wait() until tick()-TickFastAttackF >= FastAttackSettings["TimeWait"]
                    CountAttack = 0
                end
            end
        end
    end)
    return ReturnFunctions
end
return FastAttackConnectorFunction()