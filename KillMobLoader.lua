function KillMob(Mob, kkk)
    momobe, momobe2 =
        pcall(
        function()
            Mob3 = Mob
            if type(Mob3) == "table" and kkk then
                if CheckMob(Mob3) then
                    Mob = CheckMob(Mob3)
                    if
                        Mob and Mob:FindFirstChild("Humanoid") and Mob:FindFirstChild("HumanoidRootPart") and
                            Mob.Humanoid.Health > 0
                     then
                        mmas = GetMidPoint(Mob.Name, Mob.HumanoidRootPart)
                        if not string.find(Mob.Name, "Boss") then
                            KillingBoss = false
                            LockCFrame = CFrame.new(mmas.X, mmas.Y, mmas.Z)
                        else
                            LockCFrame = Mob.HumanoidRootPart.CFrame
                            KillingBoss = true
                        end
                        if string.find(Mob.Name, "Boss") or table.find(Elites, Mob.Name) then
                            if not string.find(Mob.Name, "Boss") then
                                for i, v in pairs(Elites) do
                                    if RemoveLevelTitle(v) == RemoveLevelTitle(Mob.Name) then
                                        KillingBoss = true
                                        CreateGameNotify("Elite Boss", 30)
                                    end
                                end
                            else
                                KillingBoss = true
                            end
                        end
                        for i, v in pairs(Elites) do
                            if RemoveLevelTitle(v) == RemoveLevelTitle(Mob.Name) then
                                KillingBoss = true
                                CreateGameNotify("Elite Boss", 30)
                            end
                        end
                        repeat
                            task.wait()
                            if
                                Mob and Mob:FindFirstChild("Humanoid") and Mob:FindFirstChild("HumanoidRootPart") and
                                    Mob.Humanoid.Health > 0
                             then
                                spawn(
                                    function()
                                        BringMobChoosen = Mob
                                    end
                                )
                                spawn(
                                    function()
                                        pcall(
                                            function()
                                                BringMobCFrame = Mob.HumanoidRootPart.CFrame
                                            end
                                        )
                                    end
                                )
                                spawn(
                                    function()
                                        EquipWeapon()
                                    end
                                )
                                spawn(
                                    function()
                                        EnableBuso()
                                    end
                                )
                                SizePart(Mob, LockCFrame, Mob.Name)
                                spawn(
                                    function()
                                        bbc, bbc2 =
                                            pcall(
                                            function()
                                                MMBStatus =
                                                    "Killing " ..
                                                    Mob.Name .. " | Health Remaining: " .. math.floor(Mob.Humanoid.Health)
                                                if Mob:FindFirstChild("TickCheck") then
                                                    MMBStatus =
                                                        MMBStatus ..
                                                        " | Delete Mob In: " ..
                                                            math.floor(
                                                                tonumber(
                                                                    90 - (tick() - Mob:FindFirstChild("TickCheck").Value)
                                                                )
                                                            ) ..
                                                                "s"
                                                end
                                            end
                                        )
                                    end
                                )
                                StartBringMob = true
                                spawn(
                                    function()
                                        Tweento(Mob.HumanoidRootPart.CFrame * GetCFrameADD(Mob.HumanoidRootPart))
                                    end
                                )
                                NoClip = true
                                if not Config["%HealthSendSkill"] then
                                    Config["%HealthSendSkill"] = 50
                                end
                                CanMasteryFarm =
                                    Mob.Humanoid.Health <= (Mob.Humanoid.MaxHealth * Config["%HealthSendSkill"]) / 100
                                if
                                    Config["Mastery Farm"] and CheckOnlyV4() and Config["Mastery Farm"] and
                                        Mob.Humanoid.MaxHealth < 500000 and
                                        CanMasteryFarm
                                 then
                                    if
                                        CheckOnlyV4() and Config["Mastery Farm"] and Mob.Humanoid.MaxHealth < 500000 and
                                            CanMasteryFarm
                                     then
                                        repeat
                                            task.wait()
                                            UseFastAttack = false
                                            Tweento(Mob.HumanoidRootPart.CFrame * GetCFrameADD(Mob.HumanoidRootPart))
                                            spawn(
                                                function()
                                                    bbc, bbc2 =
                                                        pcall(
                                                        function()
                                                            MMBStatus =
                                                                "Killing " ..
                                                                Mob.Name ..
                                                                    " | Health Remaining: " ..
                                                                        math.floor(Mob.Humanoid.Health)
                                                            if Mob:FindFirstChild("TickCheck") then
                                                                MMBStatus =
                                                                    MMBStatus ..
                                                                    " | Delete Mob In: " ..
                                                                        math.floor(
                                                                            tonumber(
                                                                                90 -
                                                                                    (tick() -
                                                                                        Mob:FindFirstChild("TickCheck").Value)
                                                                            )
                                                                        ) ..
                                                                            "s"
                                                            end
                                                        end
                                                    )
                                                end
                                            )
                                            StartBringMob = true
                                            NoClip = true
                                            AimBotSkillPosition = Mob.HumanoidRootPart.Position
                                            AimbotDiThangNgu = true
                                            NameItemSkill, SKill = CheckSkillMastery()
                                            spawn(
                                                function()
                                                    Tweento(
                                                        Mob.HumanoidRootPart.CFrame * GetCFrameADD(Mob.HumanoidRootPart)
                                                    )
                                                end
                                            )
                                            if NameItemSkill and SKill then
                                                Tweento(Mob.HumanoidRootPart.CFrame * GetCFrameADD(Mob.HumanoidRootPart))
                                                EquipWeaponName(NameItemSkill)
                                                Tweento(Mob.HumanoidRootPart.CFrame * GetCFrameADD(Mob.HumanoidRootPart))
                                                SendKey(SKill, Config["Hold Time " .. tostring(SKill)])
                                                task.wait(.2)
                                            end
                                            spawn(
                                                function()
                                                    Tweento(
                                                        Mob.HumanoidRootPart.CFrame * GetCFrameADD(Mob.HumanoidRootPart)
                                                    )
                                                end
                                            )
                                            if Config["TypeMasteryFarm Normal"] == "Gun" and CheckSkillMastery() then
                                                EquipWeaponName(NameItemSkill)
                                                Tweento(Mob.HumanoidRootPart.CFrame * GetCFrameADD(Mob.HumanoidRootPart))
                                                spawn(
                                                    function()
                                                        GunAimbot(Mob.HumanoidRootPart, NameItemSkill)
                                                    end
                                                )
                                            end
                                            spawn(
                                                function()
                                                    Tweento(
                                                        Mob.HumanoidRootPart.CFrame * GetCFrameADD(Mob.HumanoidRootPart)
                                                    )
                                                end
                                            )
                                        until not Mob or not Mob.Parent or not Mob:FindFirstChild("Humanoid") or
                                            Mob.Humanoid.Health <= 0 or
                                            not CheckOnlyV4() or
                                            not Config["Mastery Farm Normal"] or
                                            Mob.Humanoid.Health >
                                                (Mob.Humanoid.MaxHealth * Config["%HealthSendSkill"]) / 100
                                        UseFastAttack = false
                                        NoClip = false
                                        AimbotDiThangNgu = false
                                        StartBringMob = false
                                        AimBotSkillPosition = nil
                                        LockCFrame = nil
                                        BringMobChoosen = nil
                                        BringMobCFrame = nil
                                    elseif GetDistance(Mob.HumanoidRootPart) < 300 then
                                        spawn(
                                            function()
                                                EquipWeapon()
                                            end
                                        )
                                        spawn(
                                            function()
                                                EnableBuso()
                                            end
                                        )
                                        UseFastAttack = true
                                    else
                                        UseFastAttack = false
                                    end
                                elseif GetDistance(Mob.HumanoidRootPart) < 300 then
                                    spawn(
                                        function()
                                            EquipWeapon()
                                        end
                                    )
                                    spawn(
                                        function()
                                            EnableBuso()
                                        end
                                    )
                                    UseFastAttack = true
                                else
                                    UseFastAttack = false
                                end
                                spawn(
                                    function()
                                        EquipWeapon()
                                    end
                                )
                                spawn(
                                    function()
                                        EnableBuso()
                                    end
                                ) 
                            else
                                task.wait()
                            end
                        until not Mob or not Mob:FindFirstChild("Humanoid") or
                            not Mob:FindFirstChild("HumanoidRootPart") or
                            Mob.Humanoid.Health <= 0 or
                            CheckIsRaiding()
                        pcall(
                            function()
                                if Mob.Humanoid.Health <= 0 then
                                    if string.find(Mob.Name, "Boss") or table.find(Elites, Mob.Name) then
                                        if Config["WebhookRaidBoss"] then
                                            CreateGameNotify("Posting Raid boss webhook", 10)
                                            PostWebhook(Config["WebhookUrl"], GetMsgRaidBoss(Mob.Name))
                                        end
                                    end
                                end
                            end
                        )
                        MMBStatus = "Killed " .. Mob.Name
                        UseFastAttack = false
                        NoClip = false
                        AimbotDiThangNgu = false
                        StartBringMob = false
                        AimBotSkillPosition = nil
                        LockCFrame = nil
                        BringMobChoosen = nil
                        BringMobCFrame = nil
                    end
                else
                    MMBStatus = "Waitting mob"
                    MobSLCSpawnssss = Mob
                    condcmm = GetListMobSpawn(Mob3)
                    if condcmm then
                        for i, v in pairs(condcmm) do
                            MobSpawn = v
                            if MobSpawn:IsA("Part") and not CheckMob(Mob3) then
                                Tweento(MobSpawn.CFrame * CFrame.new(0, 20, 8))
                            elseif MobSpawn:FindFirstChild("HumanoidRootPart") and not CheckMob(Mob3) then
                                Tweento(MobSpawn.HumanoidRootPart.CFrame * CFrame.new(0, 8, 8))
                            end
                        end
                    else
                        for i, v in pairs(MobSLCSpawnssss) do
                            if GetMobSpawn(v) and not CheckMob(Mob3) then
                                MobSpawn = GetMobSpawn(v)
                                EnableBuso()
                                EquipWeapon()
                                if MobSpawn:IsA("Part") and not CheckMob(Mob3) then
                                    Tweento(MobSpawn.CFrame * CFrame.new(0, 20, 8))
                                elseif MobSpawn:FindFirstChild("HumanoidRootPart") and not CheckMob(Mob3) then
                                    Tweento(MobSpawn.HumanoidRootPart.CFrame * CFrame.new(0, 8, 8))
                                end
                            end
                        end
                    end
                end
            else
                if
                    Mob and Mob:FindFirstChild("Humanoid") and Mob:FindFirstChild("HumanoidRootPart") and
                        Mob.Humanoid.Health > 0
                 then
                    mmas = GetMidPoint(Mob.Name, Mob.HumanoidRootPart)
                    if not string.find(Mob.Name, "Boss") then
                        KillingBoss = false
                        LockCFrame = CFrame.new(mmas.X, mmas.Y, mmas.Z)
                    else
                        LockCFrame = Mob.HumanoidRootPart.CFrame
                        KillingBoss = true
                    end
                    if string.find(Mob.Name, "Boss") or table.find(Elites, Mob.Name) then
                        if not string.find(Mob.Name, "Boss") then
                            for i, v in pairs(Elites) do
                                if RemoveLevelTitle(v) == RemoveLevelTitle(Mob.Name) then
                                    KillingBoss = true
                                    CreateGameNotify("Elite Boss", 30)
                                end
                            end
                        else
                            KillingBoss = true
                        end
                    end
                    for i, v in pairs(Elites) do
                        if RemoveLevelTitle(v) == RemoveLevelTitle(Mob.Name) then
                            KillingBoss = true
                            CreateGameNotify("Elite Boss", 30)
                        end
                    end
                    repeat
                        task.wait()
                        if
                            Mob and Mob:FindFirstChild("Humanoid") and Mob:FindFirstChild("HumanoidRootPart") and
                                Mob.Humanoid.Health > 0
                         then
                            spawn(
                                function()
                                    BringMobChoosen = Mob
                                end
                            )
                            spawn(
                                function()
                                    pcall(
                                        function()
                                            BringMobCFrame = Mob.HumanoidRootPart.CFrame
                                        end
                                    )
                                end
                            )
                            spawn(
                                function()
                                    EquipWeapon()
                                end
                            )
                            spawn(
                                function()
                                    EnableBuso()
                                end
                            )
                            SizePart(Mob, LockCFrame, Mob.Name)
                            spawn(
                                function()
                                    bbc, bbc2 =
                                        pcall(
                                        function()
                                            MMBStatus =
                                                "Killing " ..
                                                Mob.Name .. " | Health Remaining: " .. math.floor(Mob.Humanoid.Health)
                                            if Mob:FindFirstChild("TickCheck") then
                                                MMBStatus =
                                                    MMBStatus ..
                                                    " | Delete Mob In: " ..
                                                        math.floor(
                                                            tonumber(
                                                                90 - (tick() - Mob:FindFirstChild("TickCheck").Value)
                                                            )
                                                        ) ..
                                                            "s"
                                            end
                                        end
                                    )
                                end
                            )
                            StartBringMob = true
                            spawn(
                                function()
                                    Tweento(Mob.HumanoidRootPart.CFrame * GetCFrameADD(Mob.HumanoidRootPart))
                                end
                            )
                            NoClip = true
                            if not Config["%HealthSendSkill"] then
                                Config["%HealthSendSkill"] = 50
                            end
                            CanMasteryFarm =
                                Mob.Humanoid.Health <= (Mob.Humanoid.MaxHealth * Config["%HealthSendSkill"]) / 100
                            if
                                Config["Mastery Farm"] and CheckOnlyV4() and Config["Mastery Farm"] and
                                    Mob.Humanoid.MaxHealth < 500000 and
                                    CanMasteryFarm
                             then
                                if
                                    CheckOnlyV4() and Config["Mastery Farm"] and Mob.Humanoid.MaxHealth < 500000 and
                                        CanMasteryFarm
                                 then
                                    repeat
                                        task.wait()
                                        UseFastAttack = false
                                        Tweento(Mob.HumanoidRootPart.CFrame * GetCFrameADD(Mob.HumanoidRootPart))
                                        spawn(
                                            function()
                                                bbc, bbc2 =
                                                    pcall(
                                                    function()
                                                        MMBStatus =
                                                            "Killing " ..
                                                            Mob.Name ..
                                                                " | Health Remaining: " ..
                                                                    math.floor(Mob.Humanoid.Health)
                                                        if Mob:FindFirstChild("TickCheck") then
                                                            MMBStatus =
                                                                MMBStatus ..
                                                                " | Delete Mob In: " ..
                                                                    math.floor(
                                                                        tonumber(
                                                                            90 -
                                                                                (tick() -
                                                                                    Mob:FindFirstChild("TickCheck").Value)
                                                                        )
                                                                    ) ..
                                                                        "s"
                                                        end
                                                    end
                                                )
                                            end
                                        )
                                        StartBringMob = true
                                        NoClip = true
                                        AimBotSkillPosition = Mob.HumanoidRootPart.Position
                                        AimbotDiThangNgu = true
                                        NameItemSkill, SKill = CheckSkillMastery()
                                        spawn(
                                            function()
                                                Tweento(
                                                    Mob.HumanoidRootPart.CFrame * GetCFrameADD(Mob.HumanoidRootPart)
                                                )
                                            end
                                        )
                                        if NameItemSkill and SKill then
                                            Tweento(Mob.HumanoidRootPart.CFrame * GetCFrameADD(Mob.HumanoidRootPart))
                                            EquipWeaponName(NameItemSkill)
                                            Tweento(Mob.HumanoidRootPart.CFrame * GetCFrameADD(Mob.HumanoidRootPart))
                                            SendKey(SKill, Config["Hold Time " .. tostring(SKill)])
                                            task.wait(.2)
                                        end
                                        spawn(
                                            function()
                                                Tweento(
                                                    Mob.HumanoidRootPart.CFrame * GetCFrameADD(Mob.HumanoidRootPart)
                                                )
                                            end
                                        )
                                        if Config["TypeMasteryFarm Normal"] == "Gun" and CheckSkillMastery() then
                                            EquipWeaponName(NameItemSkill)
                                            Tweento(Mob.HumanoidRootPart.CFrame * GetCFrameADD(Mob.HumanoidRootPart))
                                            spawn(
                                                function()
                                                    GunAimbot(Mob.HumanoidRootPart, NameItemSkill)
                                                end
                                            )
                                        end
                                        spawn(
                                            function()
                                                Tweento(
                                                    Mob.HumanoidRootPart.CFrame * GetCFrameADD(Mob.HumanoidRootPart)
                                                )
                                            end
                                        )
                                    until not Mob or not Mob.Parent or not Mob:FindFirstChild("Humanoid") or
                                        Mob.Humanoid.Health <= 0 or
                                        not CheckOnlyV4() or
                                        not Config["Mastery Farm Normal"] or
                                        Mob.Humanoid.Health >
                                            (Mob.Humanoid.MaxHealth * Config["%HealthSendSkill"]) / 100
                                    UseFastAttack = false
                                    NoClip = false
                                    AimbotDiThangNgu = false
                                    StartBringMob = false
                                    AimBotSkillPosition = nil
                                    LockCFrame = nil
                                    BringMobChoosen = nil
                                    BringMobCFrame = nil
                                elseif GetDistance(Mob.HumanoidRootPart) < 300 then
                                    spawn(
                                        function()
                                            EquipWeapon()
                                        end
                                    )
                                    spawn(
                                        function()
                                            EnableBuso()
                                        end
                                    )
                                    UseFastAttack = true
                                else
                                    UseFastAttack = false
                                end
                            elseif GetDistance(Mob.HumanoidRootPart) < 300 then
                                spawn(
                                    function()
                                        EquipWeapon()
                                    end
                                )
                                spawn(
                                    function()
                                        EnableBuso()
                                    end
                                )
                                UseFastAttack = true
                            else
                                UseFastAttack = false
                            end
                            spawn(
                                function()
                                    EquipWeapon()
                                end
                            )
                            spawn(
                                function()
                                    EnableBuso()
                                end
                            ) 
                        else
                            task.wait()
                        end
                    until not Mob or not Mob:FindFirstChild("Humanoid") or not Mob:FindFirstChild("HumanoidRootPart") or
                        Mob.Humanoid.Health <= 0 or
                        CheckIsRaiding()
                    pcall(
                        function()
                            if Mob.Humanoid.Health <= 0 then
                                if string.find(Mob.Name, "Boss") or table.find(Elites, Mob.Name) then
                                    if Config["WebhookRaidBoss"] then
                                        CreateGameNotify("Posting Raid boss webhook", 10)
                                        PostWebhook(Config["WebhookUrl"], GetMsgRaidBoss(Mob.Name))
                                    end
                                end
                            end
                        end
                    )
                    MMBStatus = "Killed " .. Mob.Name
                    UseFastAttack = false
                    NoClip = false
                    AimbotDiThangNgu = false
                    StartBringMob = false
                    AimBotSkillPosition = nil
                    LockCFrame = nil
                    BringMobChoosen = nil
                    BringMobCFrame = nil
                end
            end
        end
    )
    if not momobe then
        print(momobe2)
    end
end