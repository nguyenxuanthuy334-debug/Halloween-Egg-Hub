-- ==========================================================
-- STEAL AN EGG - ULTIMATE HUB (FULL IMAGE & EGG VALUE DISPLAY)
-- Platform: Delta Executor
-- Pass: 123
-- ==========================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

if CoreGui:FindFirstChild("StealAnEggUltimateHub") then
    CoreGui.StealAnEggUltimateHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "StealAnEggUltimateHub"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Login Frame
local LoginFrame = Instance.new("Frame")
LoginFrame.Size = UDim2.new(0, 320, 0, 170)
LoginFrame.Position = UDim2.new(0.5, -160, 0.5, -85)
LoginFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
LoginFrame.BorderSizePixel = 0
LoginFrame.Parent = ScreenGui
Instance.new("UICorner", LoginFrame).CornerRadius = UDim.new(0, 12)

local TitleLogin = Instance.new("TextLabel")
TitleLogin.Size = UDim2.new(1, 0, 0, 40)
TitleLogin.Position = UDim2.new(0, 0, 0, 10)
TitleLogin.BackgroundTransparency = 1
TitleLogin.Text = "🔑 MẬT KHẨU HUB: 123"
TitleLogin.TextColor3 = Color3.fromRGB(255, 128, 0)
TitleLogin.TextSize = 14
TitleLogin.Font = Enum.Font.SourceSansBold
TitleLogin.Parent = LoginFrame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.8, 0, 0, 40)
TextBox.Position = UDim2.new(0.1, 0, 0, 60)
TextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TextBox.BorderSizePixel = 0
TextBox.Text = ""
TextBox.PlaceholderText = "Nhập: 123..."
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 13
TextBox.Font = Enum.Font.SourceSans
TextBox.Parent = LoginFrame
Instance.new("UICorner", TextBox).CornerRadius = UDim.new(0, 8)

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(0.8, 0, 0, 35)
SubmitBtn.Position = UDim2.new(0.1, 0, 0, 115)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
SubmitBtn.Text = "XÁC NHẬN"
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.Font = Enum.Font.SourceSansBold
SubmitBtn.Parent = LoginFrame
Instance.new("UICorner", SubmitBtn).CornerRadius = UDim.new(0, 8)

local function LaunchMainHub()
    LoginFrame:Destroy()

    -- Nút Toggle Bật/Tắt UI
    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Size = UDim2.new(0, 90, 0, 32)
    ToggleBtn.Position = UDim2.new(0.02, 0, 0.02, 0)
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 128, 0)
    ToggleBtn.Text = "ẨN / HIỆN HUB"
    ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleBtn.Font = Enum.Font.SourceSansBold
    ToggleBtn.TextSize = 11
    ToggleBtn.Parent = ScreenGui
    Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 6)

    local MainContainer = Instance.new("Frame")
    MainContainer.Size = UDim2.new(1, 0, 1, 0)
    MainContainer.BackgroundTransparency = 1
    MainContainer.Parent = ScreenGui

    ToggleBtn.MouseButton1Click:Connect(function()
        MainContainer.Visible = not MainContainer.Visible
    end)

    local LeftMenu = Instance.new("ScrollingFrame")
    LeftMenu.Size = UDim2.new(0, 240, 0, 340)
    LeftMenu.Position = UDim2.new(0.02, 0, 0.12, 0)
    LeftMenu.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    LeftMenu.BorderSizePixel = 0
    LeftMenu.ScrollBarThickness = 5
    LeftMenu.Parent = MainContainer
    Instance.new("UICorner", LeftMenu).CornerRadius = UDim.new(0, 10)

    local LeftTitle = Instance.new("TextLabel")
    LeftTitle.Size = UDim2.new(1, 0, 0, 35)
    LeftTitle.BackgroundTransparency = 1
    LeftTitle.Text = "⚡ TÍNH NĂNG THỰC CHIẾN"
    LeftTitle.TextColor3 = Color3.fromRGB(255, 128, 0)
    LeftTitle.Font = Enum.Font.SourceSansBold
    LeftTitle.TextSize = 12
    LeftTitle.Parent = LeftMenu

    local yPos = 40
    local function addFeature(num, name, callback)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0.9, 0, 0, 30)
        btn.Position = UDim2.new(0.05, 0, 0, yPos)
        btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        btn.Text = num .. ". " .. name .. ": TẮT"
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextSize = 10
        btn.Font = Enum.Font.SourceSansBold
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.Parent = LeftMenu
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)

        local state = false
        btn.MouseButton1Click:Connect(function()
            state = not state
            btn.Text = num .. ". " .. name .. (state and ": BẬT" or ": TẮT")
            btn.BackgroundColor3 = state and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(45, 45, 45)
            if callback then callback(state) end
        end)
        yPos = yPos + 35
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
    addFeature(3, "Nhảy Cao", function(s)
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
                    p.Color = Color3.fromRGB(0, 255, 255)
                    p.Parent = workspace
                    table.insert(baseParts, p)
                end
            end
        else
            for _, p in pairs(baseParts) do p:Destroy() end
            baseParts = {}
        end
    end)

    LeftMenu.CanvasSize = UDim2.new(0, 0, 0, yPos + 20)

    -- Loop Noclip & Speed
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

    -- Panel Phải: QUÉT TRỨNG + HÌNH ẢNH + TIỀN TRỨNG
    local StealPanel = Instance.new("ScrollingFrame")
    StealPanel.Size = UDim2.new(0, 280, 0, 340)
    StealPanel.Position = UDim2.new(0.65, 0, 0.12, 0)
    StealPanel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    StealPanel.BorderSizePixel = 0
    StealPanel.ScrollBarThickness = 5
    StealPanel.Parent = MainContainer
    Instance.new("UICorner", StealPanel).CornerRadius = UDim.new(0, 10)

    local TitleRight = Instance.new("TextLabel")
    TitleRight.Size = UDim2.new(1, 0, 0, 35)
    TitleRight.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    TitleRight.Text = "🥚 DANH SÁCH TRỨNG + TIỀN REALTIME"
    TitleRight.TextColor3 = Color3.fromRGB(0, 255, 128)
    TitleRight.Font = Enum.Font.SourceSansBold
    TitleRight.TextSize = 11
    TitleRight.Parent = StealPanel

    local ListContainer = Instance.new("ScrollingFrame")
    ListContainer.Size = UDim2.new(0.95, 0, 0, 280)
    ListContainer.Position = UDim2.new(0.025, 0, 0, 40)
    ListContainer.BackgroundTransparency = 1
    ListContainer.BorderSizePixel = 0
    ListContainer.ScrollBarThickness = 4
    ListContainer.Parent = StealPanel

    local activeRows = {}

    -- Hàm tìm hình ảnh & số tiền của quả trứng
    local function getEggDetails(model)
        local imgId = "rbxassetid://10723381650" -- Ảnh quả trứng mặc định nếu không có Decal
        local valueText = "💰 Giá: ??"

        -- Tìm Decal/Texture/Image
        for _, descendant in pairs(model:GetDescendants()) do
            if descendant:IsA("Decal") or descendant:IsA("Texture") then
                if descendant.Texture ~= "" then
                    imgId = descendant.Texture
                    break
                end
            elseif descendant:IsA("ImageLabel") and descendant.Image ~= "" then
                imgId = descendant.Image
                break
            end
        end

        -- Tìm thông số tiền/BillboardGui
        for _, descendant in pairs(model:GetDescendants()) do
            if descendant:IsA("TextLabel") or descendant:IsA("TextButton") then
                local txt = descendant.Text
                if string.find(txt, "%$") or string.find(string.lower(txt), "egg") or string.find(txt, "x") or tonumber(txt) then
                    valueText = "💵 " .. txt
                    break
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

            -- Xóa các row hết hạn
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

            -- Cập nhật row có Hình Ảnh + Số Tiền
            local yOffset = 0
            for _, eggData in ipairs(currentEggs) do
                local model = eggData.Model
                local part = eggData.Part
                local imgId, valueText = getEggDetails(model)

                if not activeRows[model] then
                    local row = Instance.new("Frame")
                    row.Size = UDim2.new(1, 0, 0, 48)
                    row.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    row.Parent = ListContainer
                    Instance.new("UICorner", row).CornerRadius = UDim.new(0, 6)

                    -- Icon Ảnh Trứng
                    local imgLbl = Instance.new("ImageLabel")
                    imgLbl.Size = UDim2.new(0, 38, 0, 38)
                    imgLbl.Position = UDim2.new(0, 5, 0, 5)
                    imgLbl.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                    imgLbl.Image = imgId
                    imgLbl.Parent = row
                    Instance.new("UICorner", imgLbl).CornerRadius = UDim.new(0, 4)

                    -- Tên Trứng
                    local nameLbl = Instance.new("TextLabel")
                    nameLbl.Size = UDim2.new(0.5, 0, 0.5, 0)
                    nameLbl.Position = UDim2.new(0, 48, 0, 4)
                    nameLbl.BackgroundTransparency = 1
                    nameLbl.Text = model.Name
                    nameLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
                    nameLbl.Font = Enum.Font.SourceSansBold
                    nameLbl.TextSize = 11
                    nameLbl.TextXAlignment = Enum.TextXAlignment.Left
                    nameLbl.Parent = row

                    -- Dòng Số Tiền / Thông Số
                    local valLbl = Instance.new("TextLabel")
                    valLbl.Size = UDim2.new(0.5, 0, 0.4, 0)
                    valLbl.Position = UDim2.new(0, 48, 0, 24)
                    valLbl.BackgroundTransparency = 1
                    valLbl.Text = valueText
                    valLbl.TextColor3 = Color3.fromRGB(255, 215, 0)
                    valLbl.Font = Enum.Font.SourceSansBold
                    valLbl.TextSize = 10
                    valLbl.TextXAlignment = Enum.TextXAlignment.Left
                    valLbl.Parent = row

                    -- Nút Lướt Tới
                    local btn = Instance.new("TextButton")
                    btn.Size = UDim2.new(0.28, 0, 0, 30)
                    btn.Position = UDim2.new(0.69, 0, 0.18, 0)
                    btn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
                    btn.Text = "Lướt Tới"
                    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
                    btn.Font = Enum.Font.SourceSansBold
                    btn.TextSize = 10
                    btn.Parent = row
                    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)

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
                    -- Cập nhật lại giá trị tiền mượt mà
                    activeRows[model].ValueLbl.Text = valueText
                end

                activeRows[model].Frame.Position = UDim2.new(0, 0, 0, yOffset)
                yOffset = yOffset + 53
            end

            ListContainer.CanvasSize = UDim2.new(0, 0, 0, yOffset)
        end
    end)
end

SubmitBtn.MouseButton1Click:Connect(function()
    if TextBox.Text == "123" then
        LaunchMainHub()
    else
        TextBox.Text = ""
        TextBox.PlaceholderText = "Sai Pass!"
    end
end)
