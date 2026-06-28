-- GitHub云端卡密校验，上传到你仓库loader.lua
local CoreGui = game:GetService("StarterGui")
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KeyAuthUI"
ScreenGui.Parent = CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 320, 0, 160)
Frame.Position = UDim2.new(0.5, -160, 0.5, -80)
Frame.BackgroundColor3 = Color3.new(0.1,0.1,0.1)
Frame.BorderSizePixel = 2
Frame.BorderColor3 = Color3.new(0.4,0.6,1)
Frame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,0,0,36)
Title.BackgroundTransparency = 1
Title.Text = "请输入激活卡密"
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 20
Title.Parent = Frame

local InputBox = Instance.new("TextBox")
InputBox.Size = UDim2.new(0.9,0,0,40)
InputBox.Position = UDim2.new(0.05,0,0.28,0)
InputBox.BackgroundColor3 = Color3.new(0.2,0.2,0.2)
InputBox.TextColor3 = Color3.new(1,1,1)
InputBox.PlaceholderText = "在此输入卡密"
InputBox.Font = Enum.Font.SourceSans
InputBox.TextSize = 16
InputBox.Parent = Frame

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(0.9,0,0,40)
SubmitBtn.Position = UDim2.new(0.05,0,0.62,0)
SubmitBtn.BackgroundColor3 = Color3.new(0.2,0.5,0.9)
SubmitBtn.Text = "验证并加载脚本"
SubmitBtn.TextColor3 = Color3.new(1,1,1)
SubmitBtn.Font = Enum.Font.SourceSansBold
SubmitBtn.TextSize = 18
SubmitBtn.Parent = Frame

-- 云端卡密列表，以后线上改这里就行，不用重发脚本
local ValidKeys = {
    "AT0725",
    "RAD2026KEY",
    "TEST8899"
}

local function CheckKey(inputStr)
    for _,key in ipairs(ValidKeys) do
        if inputStr == key then
            return true
        end
    end
    return false
end

SubmitBtn.MouseButton1Click:Connect(function()
    local input = InputBox.Text
    if CheckKey(input) then
        ScreenGui:Destroy()
        local success, source = pcall(game.HttpGet,game,"https://raw.githubusercontent.com/Kapclantyler/wfr/refs/heads/main/radianthub")
        if success then
            loadstring(source)()
        else
            warn("原脚本链接加载失败")
        end
    else
        warn("卡密无效")
        InputBox.Text = ""
    end
end)
