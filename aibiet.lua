local CommitID = '3da87f21cd4a2a09a7deaf4930c48a6d3d16b642'
function LoadSI(ScriptName,commit)
    if not commit then commit = CommitID end
    local scripturl = 'https://raw.githubusercontent.com/memaybeohub/Function-Scripts/'..commit..'/'..ScriptName
    loadstring(game:HttpGet(scripturl))()
end 
LoadSI('StatusGuiV2.lua')
LoadSI('EnviromentFunctionBF.lua')
task.spawn(function()
    LoadSI('FpsBoost.lua')
end)
if queue_on_teleport then 
    queue_on_teleport([[
        loadstring(game:HttpGet('https://raw.githubusercontent.com/memaybeohub/Function-Scripts/main/aibiet.lua'))()
    ]])	
end
while task.wait() do 
    if getgenv().ServerData['Server Bosses']['Thunder God'] then 
        KillBoss(getgenv().ServerData['Server Bosses']['Thunder God'])
    elseif getgenv().ServerData['PlayerData'].Level > 500 then 
        HopServer(9,true,10)
    end
end
