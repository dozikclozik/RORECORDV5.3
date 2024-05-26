local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:FindFirstChildOfClass("Humanoid")
local uis = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
-- VERSION == 5.1
---
local onRecording = false
---

---
local onPlaying = false
---


---
local isOpen = true
---

---
local FR = 0
---


---
local FRAMES = {}
---

local screenGui = Instance.new("ScreenGui", game.CoreGui)
screenGui.Name = "RORecord(CHEAT)"

local audioID = "rbxassetid://5294253171"
local audioID2 = "rbxassetid://4940109913"

local audio = Instance.new("Sound", screenGui)
audio.Name = "OnReverseAudio"
audio.SoundId = audioID
audio.PlaybackSpeed = 0.7

local audio2 = Instance.new("Sound", screenGui)
audio2.Name = "OnRecordSound"
audio2.SoundId = audioID2
audio2.PlaybackSpeed = 1

local record_button2 = Instance.new("TextButton", screenGui) local uiCorner = Instance.new("UICorner", record_button2)
record_button2.Name = "RecordButtonREAL"
record_button2.Position = UDim2.new(0.303, 0,0, 0)
record_button2.Size = UDim2.new(0.125, 0,0.08, 0)
record_button2.TextColor = BrickColor.new("Really red")
record_button2.Text = "Record"
record_button2.TextScaled = true
record_button2.Style = Enum.ButtonStyle.RobloxButton

local play_button = Instance.new("TextButton", screenGui) local uiCorner2 = Instance.new("UICorner", play_button)
play_button.Name = "Play_Button"
play_button.Position = UDim2.new(0.572, 0,0, 0)
play_button.Size = UDim2.new(0.125, 0,0.08, 0)
play_button.TextColor = BrickColor.new("Lime green")
play_button.Text = "Play"
play_button.TextScaled = true
play_button.Style = Enum.ButtonStyle.RobloxButton

local clear_button = Instance.new("TextButton", screenGui) local uiCorner5 = Instance.new("UICorner", clear_button)
clear_button.Name = "clear button"
clear_button.Position = UDim2.new(0.475, 0,0.092, 0)
clear_button.Size = UDim2.new(0, 79,0, 32)
clear_button.TextColor = BrickColor.new("Really red")
clear_button.Text = "Clear frames"
clear_button.TextScaled = true
clear_button.Style = Enum.ButtonStyle.RobloxButton

local closeopen_button = Instance.new("TextButton", screenGui) local uiCorner9 = Instance.new("UICorner", closeopen_button)
closeopen_button.Name = "close or open button"
closeopen_button.Position = UDim2.new(0.22, 0,0, 0)
closeopen_button.Size = UDim2.new(0.077, 0,0.048, 0)
closeopen_button.TextColor = BrickColor.new("Really red")
closeopen_button.BackgroundColor = BrickColor.new("Really black")
closeopen_button.Text = "Close"
closeopen_button.TextScaled = true

local remove_button = Instance.new("TextButton", screenGui) local uiCorner10 = Instance.new("UICorner", remove_button)
remove_button.Name = "Remove labels"
remove_button.Position = UDim2.new(0.707, 0,0, 0)
remove_button.Size = UDim2.new(0.077, 0,0.048, 0)
remove_button.TextColor = BrickColor.new("Really black")
remove_button.BackgroundColor = BrickColor.new("Really red")
remove_button.Text = "Remove all"
remove_button.TextScaled = true

local enter_speed_reverse = Instance.new("TextBox", screenGui) local uiCorner3 = Instance.new("UICorner", enter_speed_reverse)
enter_speed_reverse.Name = "Reverse Speed"
enter_speed_reverse.Position = UDim2.new(0.437, 0,0, 0)
enter_speed_reverse.Size = UDim2.new(0.125, 0,0.08, 0)
enter_speed_reverse.TextColor = BrickColor.new("Lime green")
enter_speed_reverse.BackgroundColor = BrickColor.new("Dark grey")
enter_speed_reverse.Text = 1
enter_speed_reverse.PlaceholderText = "Number"
enter_speed_reverse.TextScaled = true

local time_recording_label = Instance.new("TextLabel", screenGui) local uiCorner4 = Instance.new("UICorner", time_recording_label)
time_recording_label.Name = "time_recording"
time_recording_label.BackgroundTransparency = 0.5
time_recording_label.BackgroundColor = BrickColor.new("Really black")
time_recording_label.Position = UDim2.new(0.317, 0,0.092, 0)
time_recording_label.Size = UDim2.new(0.097, 0,0.066, 0)
time_recording_label.TextColor = BrickColor.new("Grey")
time_recording_label.Text = 0
time_recording_label.Visible = false
time_recording_label.TextScaled = true

local InfoKey1 = Instance.new("TextLabel", screenGui) local uiCorner6 = Instance.new("UICorner", InfoKey1)
InfoKey1.Name = "InfoKey1"
InfoKey1.BackgroundTransparency = 0.5
InfoKey1.BackgroundColor = BrickColor.new("Grey")
InfoKey1.Position = UDim2.new(0.339, 0,0.072, 0)
InfoKey1.Size = UDim2.new(0.054, 0,0.041, 0)
InfoKey1.TextColor = BrickColor.new("White")
InfoKey1.Text = "Or press <R>"
InfoKey1.TextScaled = true

local InfoKey2 = Instance.new("TextLabel", screenGui) local uiCorner7 = Instance.new("UICorner", InfoKey2)
InfoKey2.Name = "InfoKey2"
InfoKey2.BackgroundTransparency = 0.5
InfoKey2.BackgroundColor = BrickColor.new("Grey")
InfoKey2.Position = UDim2.new(0.608, 0,0.069, 0)
InfoKey2.Size = UDim2.new(0.054, 0,0.041, 0)
InfoKey2.TextColor = BrickColor.new("White")
InfoKey2.Text = "Or press <X>"
InfoKey2.TextScaled = true

local InfoKey3 = Instance.new("TextLabel", screenGui) local uiCorner8 = Instance.new("UICorner", InfoKey3)
InfoKey3.Name = "InfoKey3"
InfoKey3.BackgroundTransparency = 0.5
InfoKey3.BackgroundColor = BrickColor.new("Grey")
InfoKey3.Position = UDim2.new(0.477, 0,0.14, 0)
InfoKey3.Size = UDim2.new(0.045, 0,0.038, 0)
InfoKey3.TextColor = BrickColor.new("White")
InfoKey3.Text = "Or press <V>"
InfoKey3.TextScaled = true

enter_speed_reverse:GetPropertyChangedSignal("Text"):Connect(function()
	pcall(function()
		if tonumber(enter_speed_reverse.Text) > 50 then
			enter_speed_reverse.TextColor = BrickColor.new("Really red")
		else
			enter_speed_reverse.TextColor = BrickColor.new("Lime green")
		end
	end)
end)

closeopen_button.MouseButton1Click:Connect(function()
	if isOpen then
		isOpen = false
		onRecording = false
		closeopen_button.Text = "Open"
		closeopen_button.TextColor = BrickColor.new("Lime green")
		for _, allBL in pairs(screenGui:GetChildren()) do
			if allBL:IsA("TextButton") or allBL:IsA("TextLabel") or allBL:IsA("TextBox") then
			allBL.Visible = false
			closeopen_button.Visible = true
			end
		end
	else
		isOpen = true
		closeopen_button.Text = "Close"
		closeopen_button.TextColor = BrickColor.new("Really red")
		for _, allBL in pairs(screenGui:GetChildren()) do
			if allBL:IsA("TextButton") or allBL:IsA("TextLabel") or allBL:IsA("TextBox") then
				allBL.Visible = true
				closeopen_button.Visible = true
				time_recording_label.Visible = false
			end
		end
	end
end)

remove_button.MouseButton1Click:Connect(function()
screenGui:Destroy()
end)

record_button2.MouseButton1Click:Connect(function()
	if onRecording then
		onRecording = false
		time_recording_label.Visible = false
		audio2:Play()
		InfoKey1.Visible = true
		record_button2.Text = "Record"
	else
		onRecording = true
		time_recording_label.Visible = true
		InfoKey1.Visible = false
		audio2:Play()
		record_button2.Text = "Recording"
	end
end)

game:GetService("RunService").RenderStepped:Connect(function()
	if onRecording then
		table.insert(FRAMES, character:FindFirstChild("HumanoidRootPart").CFrame)
		FR += 1
		time_recording_label.Text = "Frames: " .. FR
	end
end)

play_button.MouseButton1Click:Connect(function()
	if tonumber(enter_speed_reverse.Text) <= 50 then

		play_button.Text = "Playing"
		onPlaying = true
		onRecording = false
		audio:Play()
		record_button2.Text = "Record"
		for i = #FRAMES, 1, -tonumber(enter_speed_reverse.Text) do
			task.wait()
			character:FindFirstChild("HumanoidRootPart").CFrame = FRAMES[i]
		end
	end
	play_button.Text = "Play"
	onPlaying = false
	audio:Stop()
end)

uis.InputBegan:Connect(function(input, proccess)
	if proccess then
		return
	end
	if input.KeyCode == Enum.KeyCode.R and isOpen then
		if onRecording then
			onRecording = false
			time_recording_label.Visible = false
			InfoKey1.Visible = true
			audio2:Play()
			record_button2.Text = "Record"
		else
			onRecording = true
			time_recording_label.Visible = true
			InfoKey1.Visible = false
			audio2:Play()
			record_button2.Text = "Recording"
		end
	end
end)

uis.InputBegan:Connect(function(input, proccess)
	if proccess then
		return
	end
	if input.KeyCode == Enum.KeyCode.X and isOpen then
		if tonumber(enter_speed_reverse.Text) <= 50 then

			play_button.Text = "Playing"
			onPlaying = true
			onRecording = false
			audio:Play()
			record_button2.Text = "Record"
			for i = #FRAMES, 1, -tonumber(enter_speed_reverse.Text) do
				task.wait()
				character:FindFirstChild("HumanoidRootPart").CFrame = FRAMES[i]
			end
		end
		play_button.Text = "Play"
		onPlaying = false
		audio:Stop()
		end
end)

uis.InputBegan:Connect(function(input, proccess)
	if proccess then
		return
	end
	if input.KeyCode == Enum.KeyCode.V and isOpen then
		if onPlaying ~= true then
			table.clear(FRAMES)
			FR = 0
			time_recording_label.Text = 0
		end
		end
end)

clear_button.MouseButton1Click:Connect(function()
	if onPlaying ~= true then
		table.clear(FRAMES)
		FR = 0
		time_recording_label.Text = 0
	end
end)
