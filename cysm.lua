local lagGui = Instance.new("ScreenGui")
lagGui.Name = "Lag"
lagGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local mainFrame = Instance.new("Frame")
mainFrame.Name = "Main"
mainFrame.Size = UDim2.new(0, 322, 0, 174)
mainFrame.Position = UDim2.new(0.3602941334247589, 0, 0.3847695589065552, 0)
mainFrame.BackgroundTransparency = 0
mainFrame.BackgroundColor3 = Color3.fromRGB(54, 57, 63) 
mainFrame.BorderSizePixel = 0
mainFrame.Parent = lagGui

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Text = "Lag by: CySm"
title.Size = UDim2.new(0, 149, 0, 50)
title.Position = UDim2.new(0.05590061843395233, 0, 0.08045977354049683, 0)
title.BackgroundTransparency = 0
title.BackgroundColor3 = Color3.fromRGB(78, 168, 222) 
title.Font = Enum.Font.SourceSansBold
title.TextScaled = true
title.TextColor3 = Color3.new(255, 255, 255) 
title.BorderSizePixel = 0
title.Parent = mainFrame

local messageTextBox = Instance.new("TextBox")
messageTextBox.Name = "Message"
messageTextBox.PlaceholderText = "Message?"
messageTextBox.Size = UDim2.new(0, 114, 0, 36)
messageTextBox.Position = UDim2.new(0.5430900454521179, 0, 0.4100450575351715, 0)
messageTextBox.BackgroundTransparency = 0
messageTextBox.BackgroundColor3 = Color3.fromRGB(78, 168, 222) 
messageTextBox.TextColor3 = Color3.fromRGB(255, 255, 255) 
messageTextBox.Font = Enum.Font.SourceSans
messageTextBox.TextSize = 14
messageTextBox.BorderSizePixel = 0
messageTextBox.Parent = mainFrame

local howMuchTextBox = Instance.new("TextBox")
howMuchTextBox.Name = "HowMuch"
howMuchTextBox.PlaceholderText = "How Much?"
howMuchTextBox.Size = UDim2.new(0, 114, 0, 36)
howMuchTextBox.Position = UDim2.new(0.11141306161880493, 0, 0.4100450575351715, 0)
howMuchTextBox.BackgroundTransparency = 0
howMuchTextBox.BackgroundColor3 = Color3.fromRGB(78, 168, 222) 
howMuchTextBox.TextColor3 = Color3.fromRGB(255, 255, 255) 
howMuchTextBox.Font = Enum.Font.SourceSans
howMuchTextBox.TextSize = 14
howMuchTextBox.BorderSizePixel = 0
howMuchTextBox.Parent = mainFrame

local lagButton = Instance.new("TextButton")
lagButton.Name = "LagButton"
lagButton.Text = "Lag It!"
lagButton.Size = UDim2.new(0, 176, 0, 46)
lagButton.Position = UDim2.new(0.22360248863697052, 0, 0.654636800289154, 0)
lagButton.TextScaled = true
lagButton.BackgroundTransparency = 0
lagButton.BackgroundColor3 = Color3.fromRGB(78, 168, 222) 
lagButton.TextColor3 = Color3.new(255, 255, 255) 
lagButton.Font = Enum.Font.SourceSansBold
lagButton.BorderSizePixel = 0
lagButton.Parent = mainFrame

local notifyLabel = Instance.new("TextLabel")
notifyLabel.Name = "Notify"
notifyLabel.Text = "Remember open the chat"
notifyLabel.Size = UDim2.new(0, 127, 0, 50)
notifyLabel.Position = UDim2.new(0.5869565010070801, 0, 0.08620689809322357, 0)
notifyLabel.BackgroundTransparency = 0
notifyLabel.BackgroundColor3 = Color3.fromRGB(78, 168, 222) 
notifyLabel.Font = Enum.Font.SourceSansBold
notifyLabel.TextScaled = true
notifyLabel.TextColor3 = Color3.new(255, 255, 255) 
notifyLabel.BorderSizePixel = 0
notifyLabel.Parent = mainFrame

local function lagIt()
    local message = mainFrame.Message.Text
    local unicode = " " -- Note: unicode character
    message = message .. unicode:rep(200 - #message)
    
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local sayMessageRequest = replicatedStorage:FindFirstChild("SayMessageRequest", true)
    
    if sayMessageRequest then
        local howMuch = tonumber(mainFrame.HowMuch.Text) or 1
        for i = 1, howMuch do
            sayMessageRequest:FireServer(message, "All")
        end
    else
        warn("SayMessageRequest not found. Unable to send messages.")
    end
    
    wait(math.random(12, 14))
end

lagButton.MouseButton1Click:Connect(lagIt)

lagGui.Parent = game.CoreG