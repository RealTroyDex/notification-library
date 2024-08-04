local notification = {}

local tween = game:GetService("TweenService")

-- Check if the Notification GUI already exists
local exists = game.Players.LocalPlayer.PlayerGui:FindFirstChild("Notification")
if exists then
    return notification  -- if it exists, return the notification table and skip the rest of the script
end

local Instances = {
    Notification = Instance.new("ScreenGui"),
    Main_Holder = Instance.new("Frame"),
    UICorner = Instance.new("UICorner"),
    notification_text = Instance.new("TextLabel"),
    UIPadding = Instance.new("UIPadding"),
}

Instances.Notification.Name = "Notification"
Instances.Notification.Parent = game.Players.LocalPlayer.PlayerGui

Instances.Main_Holder.Name = "Main_Holder"
Instances.Main_Holder.Size = UDim2.new(0, 255, 0, 40)
Instances.Main_Holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.Main_Holder.Position = UDim2.new(1.00999999, 0, 0.889999986, 0)
Instances.Main_Holder.BorderSizePixel = 0
Instances.Main_Holder.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Instances.Main_Holder.Parent = Instances.Notification

Instances.UICorner.Name = "UICorner"
Instances.UICorner.CornerRadius = UDim.new(0, 4)
Instances.UICorner.Parent = Instances.Main_Holder

Instances.notification_text.Name = "notification_text"
Instances.notification_text.Size = UDim2.new(0, 252, 0, 40)
Instances.notification_text.BorderColor3 = Color3.fromRGB(0, 0, 0)
Instances.notification_text.BackgroundTransparency = 1
Instances.notification_text.BorderSizePixel = 0
Instances.notification_text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instances.notification_text.TextDirection = Enum.TextDirection.LeftToRight
Instances.notification_text.TextColor3 = Color3.fromRGB(205, 135, 90)
Instances.notification_text.Text = "Placeholder"
Instances.notification_text.TextXAlignment = Enum.TextXAlignment.Left
Instances.notification_text.TextWrapped = true
Instances.notification_text.TextSize = 16
Instances.notification_text.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
Instances.notification_text.Parent = Instances.Main_Holder

Instances.UIPadding.Name = "UIPadding"
Instances.UIPadding.PaddingLeft = UDim.new(0, 10)
Instances.UIPadding.PaddingBottom = UDim.new(0, 2)
Instances.UIPadding.Parent = Instances.notification_text

local playing = false

function notification.notify(text, duration)
    if text and duration and not playing then
        local tweening = tween:Create(Instances.Main_Holder, TweenInfo.new(1), { Position = UDim2.new(0.745, 0, 0.89, 0) })
        local tweenoff = tween:Create(Instances.Main_Holder, TweenInfo.new(1), { Position = UDim2.new(1.01, 0, 0.89, 0) })
        Instances.notification_text.Text = text
        tweening:Play()
        tweening.Completed:Connect(function()
            wait(duration)
            tweenoff:Play()
        end)
        playing = false
    else
        warn("Text or duration not provided, or in cooldown.")
    end
end

function notification.error(text, duration)
    if text and duration and not playing then
        local tweening = tween:Create(Instances.Main_Holder, TweenInfo.new(1), { Position = UDim2.new(0.745, 0, 0.89, 0) })
        local tweenoff = tween:Create(Instances.Main_Holder, TweenInfo.new(1), { Position = UDim2.new(1.01, 0, 0.89, 0) })
        Instances.notification_text.TextColor3 = Color3.fromRGB(160, 25, 75)
        Instances.notification_text.Text = text
        tweening:Play()
        tweening.Completed:Connect(function()
            wait(duration)
            tweenoff:Play()
        end)
        tweenoff.Completed:Connect(function()
            Instances.notification_text.TextColor3 = Color3.fromRGB(205, 135, 90)
        end)
        playing = false
    else
        warn("Text or duration not provided, or in cooldown.")
    end
end

function notification.warn(text, duration)
    if text and duration and not playing then
        local tweening = tween:Create(Instances.Main_Holder, TweenInfo.new(1), { Position = UDim2.new(0.745, 0, 0.89, 0) })
        local tweenoff = tween:Create(Instances.Main_Holder, TweenInfo.new(1), { Position = UDim2.new(1.01, 0, 0.89, 0) })
        Instances.notification_text.TextColor3 = Color3.fromRGB(190, 160, 90)
        Instances.notification_text.Text = text
        tweening:Play()
        tweening.Completed:Connect(function()
            wait(duration)
            tweenoff:Play()
        end)
        tweenoff.Completed:Connect(function()
            Instances.notification_text.TextColor3 = Color3.fromRGB(205, 135, 90)
        end)
        playing = false
    else
        warn("Text or duration not provided, or in cooldown.")
    end
end

return notification
