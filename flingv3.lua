-- z0nxx Fling GUI v3.0
-- Premium Edition with Highlighting and Stop Fling

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

-- Modern UI Library
local function Create(class, props)
    local instance = Instance.new(class)
    for prop, value in pairs(props) do
        if prop == "Parent" then
            instance.Parent = value
        else
            instance[prop] = value
        end
    end
    return instance
end

-- Main GUI
local ScreenGui = Create("ScreenGui", {
    Name = "z0nxxFlingGUI",
    Parent = LocalPlayer:WaitForChild("PlayerGui"),
    ResetOnSpawn = false
})

-- Main Container with gradient
local MainFrame = Create("Frame", {
    Name = "MainFrame",
    Size = UDim2.new(0, 500, 0, 400),
    Position = UDim2.new(0.5, -250, 0.5, -200),
    BackgroundColor3 = Color3.fromRGB(20, 20, 25),
    BorderSizePixel = 0,
    Parent = ScreenGui,
    Active = true,
    Draggable = true
})

local UICorner = Create("UICorner", {
    CornerRadius = UDim.new(0, 8),
    Parent = MainFrame
})

local Gradient = Create("UIGradient", {
    Rotation = 90,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 40)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 30))
    }),
    Parent = MainFrame
})

-- Title Bar
local TitleBar = Create("Frame", {
    Name = "TitleBar",
    Size = UDim2.new(1, 0, 0, 35),
    BackgroundColor3 = Color3.fromRGB(35, 35, 45),
    BorderSizePixel = 0,
    Parent = MainFrame
})

Create("UICorner", {
    CornerRadius = UDim.new(0, 8),
    Parent = TitleBar
})

Create("TextLabel", {
    Name = "Title",
    Size = UDim2.new(1, -40, 1, 0),
    Position = UDim2.new(0, 15, 0, 0),
    BackgroundTransparency = 1,
    Text = "z0nxx FLING TOOL v3.0",
    TextColor3 = Color3.fromRGB(220, 220, 255),
    TextXAlignment = Enum.TextXAlignment.Left,
    Font = Enum.Font.GothamBold,
    TextSize = 16,
    Parent = TitleBar
})

local CloseButton = Create("TextButton", {
    Name = "CloseButton",
    Size = UDim2.new(0, 35, 0, 35),
    Position = UDim2.new(1, -35, 0, 0),
    BackgroundColor3 = Color3.fromRGB(200, 60, 60),
    BorderSizePixel = 0,
    Text = "×",
    TextColor3 = Color3.new(1, 1, 1),
    TextSize = 24,
    Font = Enum.Font.GothamBold,
    Parent = TitleBar
})

Create("UICorner", {
    CornerRadius = UDim.new(0, 8),
    Parent = CloseButton
})

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Player List
local PlayerListFrame = Create("Frame", {
    Name = "PlayerListFrame",
    Size = UDim2.new(0, 180, 1, -45),
    Position = UDim2.new(0, 0, 0, 35),
    BackgroundColor3 = Color3.fromRGB(30, 30, 40),
    BorderSizePixel = 0,
    Parent = MainFrame
})

Create("UICorner", {
    CornerRadius = UDim.new(0, 8),
    Parent = PlayerListFrame
})

Create("TextLabel", {
    Name = "PlayerListTitle",
    Size = UDim2.new(1, 0, 0, 30),
    BackgroundColor3 = Color3.fromRGB(40, 40, 55),
    BorderSizePixel = 0,
    Text = "PLAYER LIST",
    TextColor3 = Color3.fromRGB(220, 220, 255),
    Font = Enum.Font.GothamBold,
    TextSize = 14,
    Parent = PlayerListFrame
})

local PlayerListScrolling = Create("ScrollingFrame", {
    Name = "PlayerListScrolling",
    Size = UDim2.new(1, -10, 1, -40),
    Position = UDim2.new(0, 5, 0, 35),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ScrollBarThickness = 6,
    ScrollBarImageColor3 = Color3.fromRGB(100, 100, 120),
    CanvasSize = UDim2.new(0, 0, 0, 0),
    Parent = PlayerListFrame
})

-- Search Box
local SearchBox = Create("TextBox", {
    Name = "SearchBox",
    Size = UDim2.new(1, -20, 0, 35),
    Position = UDim2.new(0, 10, 0, 5),
    BackgroundColor3 = Color3.fromRGB(40, 40, 55),
    BorderSizePixel = 0,
    PlaceholderText = "Search players...",
    PlaceholderColor3 = Color3.fromRGB(150, 150, 180),
    Text = "",
    TextColor3 = Color3.fromRGB(220, 220, 255),
    Font = Enum.Font.Gotham,
    TextSize = 14,
    Parent = PlayerListScrolling
})

Create("UICorner", {
    CornerRadius = UDim.new(0, 6),
    Parent = SearchBox
})

-- Main Content
local ContentFrame = Create("Frame", {
    Name = "ContentFrame",
    Size = UDim2.new(1, -185, 1, -45),
    Position = UDim2.new(0, 180, 0, 35),
    BackgroundColor3 = Color3.fromRGB(30, 30, 40),
    BorderSizePixel = 0,
    Parent = MainFrame
})

Create("UICorner", {
    CornerRadius = UDim.new(0, 8),
    Parent = ContentFrame
})

-- Target Info
local TargetInfo = Create("Frame", {
    Name = "TargetInfo",
    Size = UDim2.new(1, -20, 0, 100),
    Position = UDim2.new(0, 10, 0, 15),
    BackgroundColor3 = Color3.fromRGB(40, 40, 55),
    BorderSizePixel = 0,
    Parent = ContentFrame
})

Create("UICorner", {
    CornerRadius = UDim.new(0, 8),
    Parent = TargetInfo
})

Create("TextLabel", {
    Name = "TargetTitle",
    Size = UDim2.new(1, 0, 0, 30),
    BackgroundColor3 = Color3.fromRGB(50, 50, 70),
    BorderSizePixel = 0,
    Text = "SELECTED TARGET",
    TextColor3 = Color3.fromRGB(220, 220, 255),
    Font = Enum.Font.GothamBold,
    TextSize = 14,
    Parent = TargetInfo
})

local TargetName = Create("TextLabel", {
    Name = "TargetName",
    Size = UDim2.new(1, -10, 0, 30),
    Position = UDim2.new(0, 10, 0, 35),
    BackgroundTransparency = 1,
    Text = "No target selected",
    TextColor3 = Color3.fromRGB(220, 220, 255),
    Font = Enum.Font.Gotham,
    TextSize = 16,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = TargetInfo
})

local TargetDistance = Create("TextLabel", {
    Name = "TargetDistance",
    Size = UDim2.new(1, -10, 0, 30),
    Position = UDim2.new(0, 10, 0, 65),
    BackgroundTransparency = 1,
    Text = "Distance: -",
    TextColor3 = Color3.fromRGB(200, 200, 230),
    Font = Enum.Font.Gotham,
    TextSize = 14,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = TargetInfo
})

-- Fling Controls
local ControlsFrame = Create("Frame", {
    Name = "ControlsFrame",
    Size = UDim2.new(1, -20, 0, 150),
    Position = UDim2.new(0, 10, 0, 125),
    BackgroundColor3 = Color3.fromRGB(40, 40, 55),
    BorderSizePixel = 0,
    Parent = ContentFrame
})

Create("UICorner", {
    CornerRadius = UDim.new(0, 8),
    Parent = ControlsFrame
})

Create("TextLabel", {
    Name = "ControlsTitle",
    Size = UDim2.new(1, 0, 0, 30),
    BackgroundColor3 = Color3.fromRGB(50, 50, 70),
    BorderSizePixel = 0,
    Text = "FLING SETTINGS",
    TextColor3 = Color3.fromRGB(220, 220, 255),
    Font = Enum.Font.GothamBold,
    TextSize = 14,
    Parent = ControlsFrame
})

local FlingButton = Create("TextButton", {
    Name = "FlingButton",
    Size = UDim2.new(1, -20, 0, 45),
    Position = UDim2.new(0, 10, 0, 40),
    BackgroundColor3 = Color3.fromRGB(200, 60, 60),
    BorderSizePixel = 0,
    Text = "🚀 LAUNCH FLING",
    TextColor3 = Color3.new(1, 1, 1),
    Font = Enum.Font.GothamBold,
    TextSize = 16,
    Parent = ControlsFrame
})

Create("UICorner", {
    CornerRadius = UDim.new(0, 6),
    Parent = FlingButton
})

local StopFlingButton = Create("TextButton", {
    Name = "StopFlingButton",
    Size = UDim2.new(1, -20, 0, 45),
    Position = UDim2.new(0, 10, 0, 95),
    BackgroundColor3 = Color3.fromRGB(80, 80, 100),
    BorderSizePixel = 0,
    Text = "🛑 STOP FLING",
    TextColor3 = Color3.new(1, 1, 1),
    Font = Enum.Font.GothamBold,
    TextSize = 16,
    Parent = ControlsFrame
})

Create("UICorner", {
    CornerRadius = UDim.new(0, 6),
    Parent = StopFlingButton
})

-- Status Bar
local StatusBar = Create("Frame", {
    Name = "StatusBar",
    Size = UDim2.new(1, -20, 0, 35),
    Position = UDim2.new(0, 10, 1, -45),
    BackgroundColor3 = Color3.fromRGB(40, 40, 55),
    BorderSizePixel = 0,
    Parent = ContentFrame
})

Create("UICorner", {
    CornerRadius = UDim.new(0, 6),
    Parent = StatusBar
})

local StatusText = Create("TextLabel", {
    Name = "StatusText",
    Size = UDim2.new(1, -10, 1, 0),
    Position = UDim2.new(0, 10, 0, 0),
    BackgroundTransparency = 1,
    Text = "Ready to fling!",
    TextColor3 = Color3.fromRGB(220, 220, 255),
    Font = Enum.Font.Gotham,
    TextSize = 14,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = StatusBar
})

-- Highlighting
local Highlight = Instance.new("Highlight")
Highlight.Name = "z0nxxHighlight"
Highlight.FillColor = Color3.fromRGB(255, 100, 100)
Highlight.FillTransparency = 0.5
Highlight.OutlineColor = Color3.fromRGB(255, 150, 150)
Highlight.OutlineTransparency = 0
Highlight.Parent = nil

-- Player List Functions
local SelectedPlayer = nil
local IsFlinging = false
local FlingConnection = nil
local CurrentHighlight = nil

local function UpdatePlayerList(searchTerm)
    PlayerListScrolling.CanvasSize = UDim2.new(0, 0, 0, 0)
    
    -- Clear existing buttons (except search box)
    for _, child in ipairs(PlayerListScrolling:GetChildren()) do
        if child.Name ~= "SearchBox" then
            child:Destroy()
        end
    end
    
    -- Add players
    local yOffset = 45
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            if searchTerm == "" or string.find(string.lower(player.Name), string.lower(searchTerm)) then
                local playerButton = Create("TextButton", {
                    Name = player.Name,
                    Size = UDim2.new(1, -10, 0, 30),
                    Position = UDim2.new(0, 5, 0, yOffset),
                    BackgroundColor3 = Color3.fromRGB(50, 50, 70),
                    BorderSizePixel = 0,
                    Text = player.Name,
                    TextColor3 = Color3.fromRGB(220, 220, 255),
                    Font = Enum.Font.Gotham,
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = PlayerListScrolling
                })
                
                Create("UICorner", {
                    CornerRadius = UDim.new(0, 4),
                    Parent = playerButton
                })
                
                playerButton.MouseButton1Click:Connect(function()
                    -- Remove old highlight
                    if CurrentHighlight then
                        CurrentHighlight:Destroy()
                        CurrentHighlight = nil
                    end
                    
                    SelectedPlayer = player
                    TargetName.Text = player.Name
                    StatusText.Text = "Selected: " .. player.Name
                    StatusText.TextColor3 = Color3.fromRGB(120, 220, 120)
                    
                    -- Add new highlight
                    if player.Character then
                        local highlight = Highlight:Clone()
                        highlight.Adornee = player.Character
                        highlight.Parent = player.Character
                        CurrentHighlight = highlight
                    end
                    
                    -- Immediately update distance
                    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and
                       LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local distance = (LocalPlayer.Character.HumanoidRootPart.Position - 
                                        player.Character.HumanoidRootPart.Position).Magnitude
                        TargetDistance.Text = string.format("Distance: %.1f studs", distance)
                    else
                        TargetDistance.Text = "Distance: -"
                    end
                end)
                
                yOffset = yOffset + 35
                PlayerListScrolling.CanvasSize = UDim2.new(0, 0, 0, yOffset)
            end
        end
    end
end

SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
    UpdatePlayerList(SearchBox.Text)
end)

-- Initialize player list
UpdatePlayerList("")

-- Fling Logic
local function CalculateDistance(pos1, pos2)
    return (pos1 - pos2).Magnitude
end

local function UpdateDistance()
    if SelectedPlayer and SelectedPlayer.Character and SelectedPlayer.Character:FindFirstChild("HumanoidRootPart") and
       LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local distance = CalculateDistance(
            LocalPlayer.Character.HumanoidRootPart.Position,
            SelectedPlayer.Character.HumanoidRootPart.Position
        )
        TargetDistance.Text = "Distance: " .. string.format("%.1f", distance) .. " studs"
    else
        TargetDistance.Text = "Distance: -"
    end
end

local function StopFling()
    if FlingConnection then
        FlingConnection:Disconnect()
        FlingConnection = nil
    end
    
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = 16
            humanoid.JumpPower = 50
        end
        
        for _, obj in ipairs(LocalPlayer.Character.HumanoidRootPart:GetChildren()) do
            if obj:IsA("BodyVelocity") or obj:IsA("BodyAngularVelocity") then
                obj:Destroy()
            end
        end
    end
    
    IsFlinging = false
    StatusText.Text = "Fling stopped!"
    StatusText.TextColor3 = Color3.fromRGB(220, 120, 120)
end

local function FlingPlayer()
    if IsFlinging then 
        StatusText.Text = "Already flinging someone!"
        StatusText.TextColor3 = Color3.fromRGB(220, 120, 120)
        return 
    end
    
    if not SelectedPlayer then
        StatusText.Text = "Please select a player first!"
        StatusText.TextColor3 = Color3.fromRGB(220, 120, 120)
        return
    end
    
    local target = SelectedPlayer
    if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then
        StatusText.Text = "Error: Target not found or disconnected!"
        StatusText.TextColor3 = Color3.fromRGB(220, 120, 120)
        return
    end

    local localChar = LocalPlayer.Character
    if not localChar or not localChar:FindFirstChild("HumanoidRootPart") then
        StatusText.Text = "Error: Your character not loaded!"
        StatusText.TextColor3 = Color3.fromRGB(220, 120, 120)
        return
    end

    local targetHrp = target.Character.HumanoidRootPart
    local localHrp = localChar.HumanoidRootPart
    local humanoid = localChar:FindFirstChild("Humanoid")

    -- Disable movement
    if humanoid then
        humanoid.WalkSpeed = 0
        humanoid.JumpPower = 0
    end

    -- Create physics effects
    local bav = Instance.new("BodyAngularVelocity")
    bav.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    bav.AngularVelocity = Vector3.new(0, 100, 0)
    bav.Parent = localHrp

    local bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bv.Velocity = Vector3.new(0, 0, 0)
    bv.Parent = localHrp

    -- Fling settings
    local startTime = tick()
    local duration = 7
    local baseRadius = 1
    local lastPosition = targetHrp.Position
    local lastUpdate = tick()

    IsFlinging = true
    StatusText.Text = "Flinging " .. target.Name .. "..."
    StatusText.TextColor3 = Color3.fromRGB(220, 220, 120)

    -- Fling loop with movement prediction
    FlingConnection = RunService.Heartbeat:Connect(function()
        if tick() - startTime >= duration then
            StopFling()
            StatusText.Text = target.Name .. " launched to space! 🚀"
            StatusText.TextColor3 = Color3.fromRGB(120, 220, 120)
            return
        end

        if targetHrp and localHrp then
            -- Calculate target velocity
            local now = tick()
            local deltaTime = now - lastUpdate
            lastUpdate = now
            
            local currentPosition = targetHrp.Position
            local velocity = (currentPosition - lastPosition) / deltaTime
            lastPosition = currentPosition
            
            -- Dynamic radius based on target speed
            local speedFactor = math.min(velocity.Magnitude / 10, 2)
            local dynamicRadius = baseRadius * (1 + speedFactor)
            
            -- Orbit around predicted position
            local angle = (tick() - startTime) * 10
            local offset = Vector3.new(
                math.cos(angle) * dynamicRadius,
                math.sin(angle * 0.5) * 1.5,
                math.sin(angle) * dynamicRadius
            )
            
            -- Predict position with velocity compensation
            local predictedPosition = currentPosition + velocity * 0.2
            
            -- Position + look at target
            localHrp.CFrame = CFrame.new(predictedPosition + offset, predictedPosition)

            -- Powerful fling
            localHrp.Velocity = (predictedPosition - localHrp.Position).Unit * -650

            -- Random rotation
            bav.AngularVelocity = Vector3.new(
                math.random(-50, 50),
                math.random(80, 120),
                math.random(-50, 50)
            )
        end
    end)
end

-- Update distance every second
spawn(function()
    while ScreenGui.Parent do
        UpdateDistance()
        wait(1)
    end
end)

-- Fling button click
FlingButton.MouseButton1Click:Connect(function()
    FlingPlayer()
end)

-- Stop fling button click
StopFlingButton.MouseButton1Click:Connect(function()
    StopFling()
end)

-- UI Effects
local function ButtonHoverEffect(button, hoverColor, normalColor)
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = hoverColor}):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = normalColor}):Play()
    end)
end

ButtonHoverEffect(FlingButton, Color3.fromRGB(220, 80, 80), Color3.fromRGB(200, 60, 60))
ButtonHoverEffect(StopFlingButton, Color3.fromRGB(100, 100, 130), Color3.fromRGB(80, 80, 100))
ButtonHoverEffect(CloseButton, Color3.fromRGB(220, 80, 80), Color3.fromRGB(200, 60, 60))

-- Player added/removed events
Players.PlayerAdded:Connect(function()
    UpdatePlayerList(SearchBox.Text)
end)

Players.PlayerRemoving:Connect(function(player)
    if player == SelectedPlayer then
        if CurrentHighlight then
            CurrentHighlight:Destroy()
            CurrentHighlight = nil
        end
        SelectedPlayer = nil
        TargetName.Text = "No target selected"
        TargetDistance.Text = "Distance: -"
        StatusText.Text = "Target disconnected!"
        StatusText.TextColor3 = Color3.fromRGB(220, 120, 120)
    end
    UpdatePlayerList(SearchBox.Text)
end)

-- Character added event for highlighting
local function OnCharacterAdded(player, character)
    if player == SelectedPlayer and CurrentHighlight then
        CurrentHighlight:Destroy()
        CurrentHighlight = Highlight:Clone()
        CurrentHighlight.Adornee = character
        CurrentHighlight.Parent = character
    end
end

for _, player in ipairs(Players:GetPlayers()) do
    player.CharacterAdded:Connect(function(character)
        OnCharacterAdded(player, character)
    end)
end
