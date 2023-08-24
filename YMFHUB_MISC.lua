spawn(function() 
    repeat
        task.wait()
    until game:IsLoaded()
    repeat
        task.wait()
    until game.Players
    repeat
        task.wait()
    until game.Players.LocalPlayer and game.Players.LocalPlayer.Team ~= nil 
    wait(1.5)
    require(game.ReplicatedStorage.Notification).new("<Color=Cyan>To Everyone Who Want Use This Hub!<Color=/>"):Display()
    require(game.ReplicatedStorage.Notification).new("<Color=Orange>If You Wanna Script Update Please:!<Color=/>"):Display()
    require(game.ReplicatedStorage.Notification).new("<Color=Purple>Donate to: MOMO/CARDVIP/TSR: 0395277909 PHAN THI DON/VO MINH HUNG!<Color=/>"):Display()
    require(game.ReplicatedStorage.Notification).new("<Color=Red>If enough 400K VND (20$) I'll Update More Haha: 100/400<Color=/>"):Display()
end)
spawn(function()
    loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/memaybeohub/Function-Scripts/main/erth.lua"
    ))()
end)
