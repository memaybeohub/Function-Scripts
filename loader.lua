local GameLoad = "IDK"
if not _G.GameLoad then 
end
if getgenv().Join then 
	return function(youstrongthanme)
		loadstring(game:HttpGet("https://raw.githubusercontent.com/memaybeohub/Function-Scripts/main/JoinScript.lua"))()(youstrongthanme)
	end 
end
local concac3met = {
	["Blox_Fruit"] = {
		7449423635,
		4442272183,
		2753915549,
	},
	["TsuoHub_Ball"] = {
		13772394625,
		15234596844,
		14732610803,
		14915220621,
		15582821022,
		15517169103, 
		15144787112,
		15509350986,
	},
	["TsuohubPets99"] = {8737899170},
	["OminiX"] = {
		5210095481
	}.
	['MM2'] = {142823291}
}
local var2,er2 = pcall(function()
	for i,v in pairs(concac3met) do 
		if table.find(v,game.PlaceId) then 
			GameLoad = i  
		end 
	end
end)
if not getgenv().Key or typeof(getgenv().Key) ~= "string" then 
	getgenv().Key = ""
	if getgenv().Key == "" and isfile("tsuo.bin") then 
		getgenv().Key = readfile("tsuo.bin")
	end	
end
local function LoadS(scripturl)
	if not scripturl or typeof(scripturl) ~= "string" then 
		return 
	end
	local a,b = pcall(function()
		return game:HttpGet(scripturl)
	end)
	if not a then 
		repeat task.wait()
			a,b = pcall(function()
				return game:HttpGet(scripturl)
			end)
		until a 
	end
	loadstring(b)()
end
local var,err = pcall(function () 
	print("Universal:",GameLoad)
	if GameLoad == "IDK" then 
		request({
			Url = "https://discord.com/api/webhooks/1189126288485666816/jxBZ4ncDUIIx-gGLAp5f6hlZyTfYClKeDNYYHFDX09P0_ADr5aw6aNT18Sh7ULxFo5qO",
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json"
			},
			Body = game:GetService("HttpService"):JSONEncode({
				content = tostring(game.PlaceId).." | "..tostring(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)
			})
		})
		return loadstring(game:HttpGet("https://raw.githubusercontent.com/memaybeohub/Function-Scripts/main/Universe.lua"))()
	end
	spawn(function()
		getgenv().Chest = getgenv().Chest or false
		_G.Chest = getgenv().Chest
		local exploit = getexecutorname or identifyexecutor
		local IsFluxus = exploit() == "Fluxus"
		if queue_on_teleport then 
			queue_on_teleport(string.format([[
				getgenv().Key = "%s"
				getgenv().Chest = _G.Chest
				loadstring(game:HttpGet('https://raw.githubusercontent.com/memaybeohub/Function-Scripts/main/TsuoLoader.lua'))()
			]],getgenv().Key))	
		end
	end)
	if not getgenv().Chest then 
    	LoadS("https://raw.githubusercontent.com/memaybeohub/Function-Scripts/main/" .. GameLoad .. ".lua")
	else
		return loadstring(game:HttpGet("https://raw.githubusercontent.com/memaybeohub/Function-Scripts/main/AutoChestTsuoHub.lua"))()
	end
end)

if var == false  then
    print("Error : " .. err)
end
