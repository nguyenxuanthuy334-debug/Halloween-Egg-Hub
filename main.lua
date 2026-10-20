-- ==========================================================
-- XT HUB - PRIVATE VIP (RAINBOW WELCOME + MODERN UI)
-- Platform: Delta Executor
-- Pass: 123
-- ==========================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

if CoreGui:FindFirstChild("XTHubPrivateVIP") then
    CoreGui.XTHubPrivateVIP:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "XTHubPrivateVIP"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- UI Login Gate
local LoginFrame = Instance.new("Frame")
LoginFrame.Size = UDim2.new(0, 340, 0, 190)
LoginFrame.Position = UDim2.new(0.5, -170, 0.5, -95)
LoginFrame.BackgroundColor3 = Color3.fromRGB(15, 17, 23)
LoginFrame.BorderSizePixel = 0
LoginFrame.Parent = ScreenGui

Instance.new("UICorner", LoginFrame).CornerRadius = UDim.new(0, 14)

local LoginStroke = Instance.new("UIStroke")
LoginStroke.Color = Color3.fromRGB(255, 128, 0)
LoginStroke.Thickness = 2
LoginStroke.Parent = LoginFrame

local TitleLogin = Instance.new("TextLabel")
TitleLogin.Size = UDim2.new(1, 0, 0, 45)
TitleLogin.Position = UDim2.new(0, 0, 0, 10)
TitleLogin.BackgroundTransparency = 1
TitleLogin.Text = "👑 XT HUB PRIVATE VIP"
TitleLogin.TextColor3 = Color3.fromRGB(255, 170, 0)
TitleLogin.TextSize = 16
TitleLogin.Font = Enum.Font.GothamBold
TitleLogin.Parent = LoginFrame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.85, 0, 0, 42)
TextBox.Position = UDim2.new(0.075, 0, 0, 65)
TextBox.BackgroundColor3 = Color3.fromRGB(25, 28, 38)
TextBox.BorderSizePixel = 0
TextBox.Text = ""
TextBox.PlaceholderText = "🔑 Nhập mật khẩu (123)..."
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.PlaceholderColor3 = Color3.fromRGB(120, 130, 150)
TextBox.TextSize = 13
TextBox.Font = Enum.Font.Gotham
TextBox.Parent = LoginFrame

Instance.new("UICorner", TextBox).CornerRadius = UDim.new(0, 8)

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(0.85, 0, 0, 38)
SubmitBtn.Position = UDim2.new(0.075, 0, 0, 125)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
SubmitBtn.BorderSizePixel = 0
SubmitBtn.Text = "ĐĂNG NHẬP"
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.TextSize = 13
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.Parent = LoginFrame

Instance.new("UICorner", SubmitBtn).CornerRadius = UDim.new(0, 8)

-- Khung Chào Mừng 7 Sắc Cầu Vồng (Rainbow Welcome)
local function ShowWelcomeScreen(onComplete)
    LoginFrame:Destroy()

    local WelcomeFrame = Instance.new("Frame")
    WelcomeFrame.Size = UDim2.new(0, 420, 0, 140)
    WelcomeFrame.Position = UDim2.new(0.5, -210, 0.5, -70)
    WelcomeFrame.BackgroundColor3 = Color3.fromRGB(12, 14, 20)
    WelcomeFrame.BorderSizePixel = 0
    WelcomeFrame.Parent = ScreenGui

    Instance.new("UICorner", WelcomeFrame).CornerRadius = UDim.new(0, 16)

    local WelcomeStroke = Instance.new("UIStroke")
    WelcomeStroke.Thickness = 3
    WelcomeStroke.Parent = WelcomeFrame

    local WelcomeText = Instance.new("TextLabel")
    WelcomeText.Size = UDim2.new(1, -20, 1, -20)
    WelcomeText.Position = UDim2.new(0, 10, 0, 10)
    WelcomeText.BackgroundTransparency = 1
    WelcomeText.Text = "✨ Chào mừng đến hack của Thủy ✨"
    WelcomeText.TextSize = 18
    WelcomeText.Font = Enum.Font.GothamBold
    WelcomeText.TextWrapped = true
    WelcomeText.Parent = WelcomeFrame

    -- Hiệu ứng Nhấp Nháy 7 Sắc Cầu Vồng
    local hue = 0
    local rainbowConn
    rainbowConn = RunService.RenderStepped:Connect(function(delta)
        hue = (hue + delta * 0.5) % 1
        local rainbowColor = Color3.fromHSV(hue, 1, 1)
        WelcomeText.TextColor3 = rainbowColor
        WelcomeStroke.Color = rainbowColor
    end)

    task.delay(3.5, function()
        if rainbowConn then rainbowConn:Disconnect() end
        WelcomeFrame:Destroy()
        if onComplete then onComplete() end
    end)
end

local function LaunchMainHub()
    -- Nút Toggle Bật/Tắt XT HUB
    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Size = UDim2.new(0, 100, 0, 35)
    ToggleBtn.Position = UDim2.new(0.02, 0, 0.03, 0)
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(20, 24, 33)
    ToggleBtn.Text = "⚡ ẨN/HIỆN XT HUB"
    ToggleBtn.TextColor3 = Color3.fromRGB(255, 170, 0)
    ToggleBtn.Font = Enum.Font.GothamBold
    ToggleBtn.TextSize = 10
    ToggleBtn.Parent = ScreenGui
    Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 8)

    local ToggleStroke = Instance.new("UIStroke")
    ToggleStroke.Color = Color3.fromRGB(255, 128, 0)
    ToggleStroke.Thickness = 1.5
    ToggleStroke.Parent = ToggleBtn

    local MainContainer = Instance.new("Frame")
    MainContainer.Size = UDim2.new(1, 0, 1, 0)
    MainContainer.BackgroundTransparency = 1
    MainContainer.Parent = ScreenGui

    ToggleBtn.MouseButton1Click:Connect(function()
        MainContainer.Visible = not MainContainer.Visible
    end)

    -- Menu Trái (XT HUB)
    local LeftMenu = Instance.new("ScrollingFrame")
    LeftMenu.Size = UDim2.new(0, 250, 0, 360)
    LeftMenu.Position = UDim2.new(0.02, 0, 0.12, 0)
    LeftMenu.BackgroundColor3 = Color3.fromRGB(15, 17, 23)
    LeftMenu.BorderSizePixel = 0
    LeftMenu.ScrollBarThickness = 4
    LeftMenu.ScrollBarImageColor3 = Color3.fromRGB(255, 128, 0)
    LeftMenu.Parent = MainContainer
    Instance.new("UICorner", LeftMenu).CornerRadius = UDim.new(0, 12)

    local LeftStroke = Instance.new("UIStroke")
    LeftStroke.Color = Color3.fromRGB(40, 45, 60)
    LeftStroke.Thickness = 1
    LeftStroke.Parent = LeftMenu

    local LeftTitle = Instance.new("TextLabel")
    LeftTitle.Size = UDim2.new(1, 0, 0, 40)
    LeftTitle.BackgroundTransparency = 1
    LeftTitle.Text = "🔥 XT HUB - TÍNH NĂNG VIP"
    LeftTitle.TextColor3 = Color3.fromRGB(255, 170, 0)
    LeftTitle.Font = Enum.Font.GothamBold
    LeftTitle.TextSize = 13
    LeftTitle.Parent = LeftMenu

    local yPos = 45
    local function addFeature(num, name, callback)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0.9, 0, 0, 32)
        btn.Position = UDim2.new(0.05, 0, 0, yPos)
        btn.BackgroundColor3 = Color3.fromRGB(25, 28, 38)
        btn.Text = "  " .. num .. ". " .. name
        btn.TextColor3 = Color3.fromRGB(200, 210, 225)
        btn.TextSize = 11
        btn.Font = Enum.Font.GothamMedium
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.Parent = LeftMenu
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

        local statusTag = Instance.new("TextLabel")
        statusTag.Size = UDim2.new(0, 45, 0, 20)
        statusTag.Position = UDim2.new(1, -50, 0.5, -10)
        statusTag.BackgroundColor3 = Color3.fromRGB(40, 45, 55)
        statusTag.Text = "OFF"
        statusTag.TextColor3 = Color3.fromRGB(150, 150, 150)
        statusTag.Font = Enum.Font.GothamBold
        statusTag.TextSize = 9
        statusTag.Parent = btn
        Instance.new("UICorner", statusTag).CornerRadius = UDim.new(0, 4)

        local state = false
        btn.MouseButton1Click:Connect(function()
            state = not state
            if state then
                statusTag.Text = "ON"
                statusTag.TextColor3 = Color3.fromRGB(255, 255, 255)
                statusTag.BackgroundColor3 = Color3.fromRGB(0, 180, 100)
                btn.BackgroundColor3 = Color3.fromRGB(30, 45, 40)
            else
                statusTag.Text = "OFF"
                statusTag.TextColor3 = Color3.fromRGB(150, 150, 150)
                statusTag.BackgroundColor3 = Color3.fromRGB(40, 45, 55)
                btn.BackgroundColor3 = Color3.fromRGB(25, 28, 38)
            end
            if callback then callback(state) end
        end)
        yPos = yPos + 38
    end

    local noclipEnabled, speedEnabled = false, false
    local baseParts = {}

    -- Features
    addFeature(1, "Noclip (Xuyên Tường)", function(s) noclipEnabled = s end)
    addFeature(2, "⚡ Tăng Tốc Độ", function(s)
        speedEnabled = s
        local char = player.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = speedEnabled and 40 or 16 end
    end)
    addFeature(3, "Nhảy Cao VIP", function(s)
        local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.JumpPower = s and 100 or 50 end
    end)
    addFeature(4, "Giảm Trọng Lực", function(s) workspace.Gravity = s and 40 or 196.2 end)
    addFeature(5, "🏠 Xây Nhà Trú Ẩn", function(s)
        if s then
            for _, p in pairs(baseParts) do p:Destroy() end
            baseParts = {}
            local char = player.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                local pos = hrp.Position
                local cframes = {
                    CFrame.new(pos + Vector3.new(0, 4, 6)),
                    CFrame.new(pos + Vector3.new(0, 4, -6)),
                    CFrame.new(pos + Vector3.new(6, 4, 0)) * CFrame.Angles(0, math.rad(90), 0),
                    CFrame.new(pos + Vector3.new(-6, 4, 0)) * CFrame.Angles(0, math.rad(90), 0),
                    CFrame.new(pos + Vector3.new(0, 9, 0)),
                    CFrame.new(pos - Vector3.new(0, 3, 0))
                }
                for _, cf in ipairs(cframes) do
                    local p = Instance.new("Part")
                    p.Size = Vector3.new(12, 10, 1)
                    p.CFrame = cf
                    p.Anchored = true
                    p.CanCollide = true
                    p.Material = Enum.Material.ForceField
                    p.Color = Color3.fromRGB(0, 255, 200)
                    p.Parent = workspace
                    table.insert(baseParts, p)
                end
            end
        else
            for _, p in pairs(baseParts) do p:Destroy() end
            baseParts = {}
        end
    end)

    LeftMenu.CanvasSize = UDim2.new(0, 0, 0, yPos + 15)

    -- Loop
    RunService.Stepped:Connect(function()
        if noclipEnabled and player.Character then
            for _, v in pairs(player.Character:GetDescendants()) do
                if v:IsA("BasePart") then v.CanCollide = false end
            end
        end
        if speedEnabled and player.Character then
            local hum = player.Character:FindFirstChildOfClass("Humanoid")
            if hum and hum.WalkSpeed ~= 40 then hum.WalkSpeed = 40 end
        end
    end)

    -- Panel Phải: RADAR QUÉT TRỨNG
    local StealPanel = Instance.new("ScrollingFrame")
    StealPanel.Size = UDim2.new(0, 290, 0, 360)
    StealPanel.Position = UDim2.new(0.65, 0, 0.12, 0)
    StealPanel.BackgroundColor3 = Color3.fromRGB(15, 17, 23)
    StealPanel.BorderSizePixel = 0
    StealPanel.ScrollBarThickness = 4
    StealPanel.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 150)
    StealPanel.Parent = MainContainer
    Instance.new("UICorner", StealPanel).CornerRadius = UDim.new(0, 12)

    local RightStroke = Instance.new("UIStroke")
    RightStroke.Color = Color3.fromRGB(40, 45, 60)
    RightStroke.Thickness = 1
    RightStroke.Parent = StealPanel

    local TitleRight = Instance.new("TextLabel")
    TitleRight.Size = UDim2.new(1, 0, 0, 40)
    TitleRight.BackgroundTransparency = 1
    TitleRight.Text = "📡 RADAR TRỨNG & GIÁ TIỀN REALTIME"
    TitleRight.TextColor3 = Color3.fromRGB(0, 255, 150)
    TitleRight.Font = Enum.Font.GothamBold
    TitleRight.TextSize = 12
    TitleRight.Parent = StealPanel

    local ListContainer = Instance.new("ScrollingFrame")
    ListContainer.Size = UDim2.new(0.92, 0, 0, 300)
    ListContainer.Position = UDim2.new(0.04, 0, 0, 45)
    ListContainer.BackgroundTransparency = 1
    ListContainer.BorderSizePixel = 0
    ListContainer.ScrollBarThickness = 3
    ListContainer.Parent = StealPanel

    local activeRows = {}

    local function getEggDetails(model)
        local imgId = "rbxassetid://10723381650"
        local valueText = "💵 Giá: ??"

        for _, descendant in pairs(model:GetDescendants()) do
            if (descendant:IsA("Decal") or descendant:IsA("Texture")) and descendant.Texture ~= "" then
                imgId = descendant.Texture; break
            elseif descendant:IsA("ImageLabel") and descendant.Image ~= "" then
                imgId = descendant.Image; break
            end
        end

        for _, descendant in pairs(model:GetDescendants()) do
            if descendant:IsA("TextLabel") or descendant:IsA("TextButton") then
                local txt = descendant.Text
                if string.find(txt, "%$") or string.find(string.lower(txt), "egg") or string.find(txt, "x") or tonumber(txt) then
                    valueText = "💵 " .. txt; break
                end
            elseif descendant:IsA("StringValue") or descendant:IsA("IntValue") or descendant:IsA("NumberValue") then
                valueText = "💵 " .. tostring(descendant.Value)
            end
        end

        return imgId, valueText
    end

    task.spawn(function()
        while task.wait(1.5) do
            local currentEggs = {}
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("Model") and string.find(string.lower(obj.Name), "egg") then
                    local part = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
                    if part then
                        table.insert(currentEggs, {Model = obj, Part = part})
                    end
                end
            end

            for model, rowData in pairs(activeRows) do
                local exists = false
                for _, eggData in ipairs(currentEggs) do
                    if eggData.Model == model then exists = true; break end
                end
                if not exists then
                    rowData.Frame:Destroy()
                    activeRows[model] = nil
                end
            end

            local yOffset = 0
            for _, eggData in ipairs(currentEggs) do
                local model = eggData.Model
                local part = eggData.Part
                local imgId, valueText = getEggDetails(model)

                if not activeRows[model] then
                    local row = Instance.new("Frame")
                    row.Size = UDim2.new(1, 0, 0, 52)
                    row.BackgroundColor3 = Color3.fromRGB(22, 26, 36)
                    row.Parent = ListContainer
                    Instance.new("UICorner", row).CornerRadius = UDim.new(0, 8)

                    local rowStroke = Instance.new("UIStroke")
                    rowStroke.Color = Color3.fromRGB(35, 40, 55)
                    rowStroke.Thickness = 1
                    rowStroke.Parent = row

                    local imgLbl = Instance.new("ImageLabel")
                    imgLbl.Size = UDim2.new(0, 40, 0, 40)
                    imgLbl.Position = UDim2.new(0, 6, 0, 6)
                    imgLbl.BackgroundColor3 = Color3.fromRGB(12, 14, 20)
                    imgLbl.Image = imgId
                    imgLbl.Parent = row
                    Instance.new("UICorner", imgLbl).CornerRadius = UDim.new(0, 6)

                    local nameLbl = Instance.new("TextLabel")
                    nameLbl.Size = UDim2.new(0.48, 0, 0.45, 0)
                    nameLbl.Position = UDim2.new(0, 52, 0, 6)
                    nameLbl.BackgroundTransparency = 1
                    nameLbl.Text = model.Name
                    nameLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
                    nameLbl.Font = Enum.Font.GothamBold
                    nameLbl.TextSize = 11
                    nameLbl.TextXAlignment = Enum.TextXAlignment.Left
                    nameLbl.Parent = row

                    local valLbl = Instance.new("TextLabel")
                    valLbl.Size = UDim2.new(0.48, 0, 0.4, 0)
                    valLbl.Position = UDim2.new(0, 52, 0, 26)
                    valLbl.BackgroundTransparency = 1
                    valLbl.Text = valueText
                    valLbl.TextColor3 = Color3.fromRGB(255, 200, 0)
                    valLbl.Font = Enum.Font.GothamMedium
                    valLbl.TextSize = 10
                    valLbl.TextXAlignment = Enum.TextXAlignment.Left
                    valLbl.Parent = row

                    local btn = Instance.new("TextButton")
                    btn.Size = UDim2.new(0.28, 0, 0, 32)
                    btn.Position = UDim2.new(0.69, 0, 0.18, 0)
                    btn.BackgroundColor3 = Color3.fromRGB(0, 170, 100)
                    btn.Text = "Lướt Tới"
                    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
                    btn.Font = Enum.Font.GothamBold
                    btn.TextSize = 10
                    btn.Parent = row
                    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

                    btn.MouseButton1Click:Connect(function()
                        local char = player.Character
                        local hrp = char and char:FindFirstChild("HumanoidRootPart")
                        if hrp and part then
                            local targetCF = part.CFrame + Vector3.new(0, 3, 0)
                            local dist = (hrp.Position - targetCF.Position).Magnitude
                            local tweenInfo = TweenInfo.new(dist / 65, Enum.EasingStyle.Linear)
                            local tween = TweenService:Create(hrp, tweenInfo, {CFrame = targetCF})
                            tween:Play()
                        end
                    end)

                    activeRows[model] = {Frame = row, ValueLbl = valLbl, ImgLbl = imgLbl}
                else
                    activeRows[model].ValueLbl.Text = valueText
                end

                activeRows[model].Frame.Position = UDim2.new(0, 0, 0, yOffset)
                yOffset = yOffset + 58
            end

            ListContainer.CanvasSize = UDim2.new(0, 0, 0, yOffset)
        end
    end)
end

SubmitBtn.MouseButton1Click:Connect(function()
    if TextBox.Text == "123" then
        ShowWelcomeScreen(LaunchMainHub)
    else
        TextBox.Text = ""
        TextBox.PlaceholderText = "Sai Mật Khẩu!"
    end
end)
