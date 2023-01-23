repeat wait() until game:IsLoaded() 

local index = getrawmetatable(game).__index
setreadonly(getrawmetatable(game),false)
getrawmetatable(game).__index = newcclosure(function(tilininsano,nosequeponer)
	if nosequeponer == "WalkSpeed" then
		return getrenv()._G.CurrentWS
	end
	return index(tilininsano, nosequeponer)
end)

wait(1)

local Atlas = loadstring(game:HttpGet("https://itots.tk/atlas.lua"))()

local UI = Atlas.new({
	Name = "🐲 STEEP STEPS  |  Dante#9679";
	FullName = "🐲 STEEP STEPS  |  Dante#9679";
	Credit = "Made with: Dante#9679";
	ConfigFolder = nil;
	Color = Color3.fromRGB(48, 217, 10);
	Bind = "RightControl";
})

local MyPage = UI:CreatePage("Main")
local TeleportsSection = MyPage:CreateSection("Main")

local HumanModCons = {}
local HumanModConss = {}

TeleportsSection:CreateSlider({
	Name = "WalkSpeed Set ";
	Flag = "WalkSpeed";
	Min = 1;
	Max = 100;
	AllowOutOfRange = false;
	Digits = nil;
	Default = 16;
	Callback = function(newValue)
		local Char = game.Players.LocalPlayer.Character or workspace:FindFirstChild(game.Players.LocalPlayer.Name)
		local Human = Char and Char:FindFirstChildWhichIsA("Humanoid")
		local function WalkSpeedChange()
			if Char and Human then
				Human.WalkSpeed = newValue
			end
		end
		WalkSpeedChange()
		HumanModCons.wsLoop = (HumanModCons.wsLoop and HumanModCons.wsLoop:Disconnect() and false) or Human:GetPropertyChangedSignal("WalkSpeed"):Connect(WalkSpeedChange)
		HumanModCons.wsCA = (HumanModCons.wsCA and HumanModCons.wsCA:Disconnect() and false) or game.Players.LocalPlayer.CharacterAdded:Connect(function(nChar)
			Char, Human = nChar, nChar:WaitForChild("Humanoid")
			WalkSpeedChange()
			HumanModCons.wsLoop = (HumanModCons.wsLoop and HumanModCons.wsLoop:Disconnect() and false) or Human:GetPropertyChangedSignal("WalkSpeed"):Connect(WalkSpeedChange)
		end)
	end;
})

TeleportsSection:CreateSlider({
	Name = "JumpPower Set ";
	Flag = "JumpPower";
	Min = 1;
	Max = 150;
	AllowOutOfRange = false;
	Digits = nil;
	Default = 50;
	Callback = function(newValue)
		local Char = game.Players.LocalPlayer.Character or workspace:FindFirstChild(game.Players.LocalPlayer.Name)
		local Human = Char and Char:FindFirstChildWhichIsA("Humanoid")
		local function JumpPowerChange()
			if Char and Human then
				Human.JumpPower = newValue
			end
		end
		JumpPowerChange()
		HumanModConss.wsLoop = (HumanModConss.wsLoop and HumanModConss.wsLoop:Disconnect() and false) or Human:GetPropertyChangedSignal("JumpPower"):Connect(JumpPowerChange)
		HumanModCons.wsCA = (HumanModConss.wsCA and HumanModConss.wsCA:Disconnect() and false) or game.Players.LocalPlayer.CharacterAdded:Connect(function(nChar)
			Char, Human = nChar, nChar:WaitForChild("Humanoid")
			JumpPowerChange()
			HumanModConss.wsLoop = (HumanModConss.wsLoop and HumanModConss.wsLoop:Disconnect() and false) or Human:GetPropertyChangedSignal("JumpPower"):Connect(JumpPowerChange)
		end)
	end;
})

TeleportsSection:CreateButton({
	Name = "Destroy UI ";
	Callback = function()
		game:GetService("CoreGui").Atlas:Destroy()
	end
})

game:GetService("CoreGui").Atlas.Main.Size = UDim2.new(0, 364, 0, 437)
