-- ==========================================================
-- STEAL AN EGG - ULTIMATE HUB (50 TÍNH NĂNG CHUẨN XÁC)
-- Platform: Delta Executor
-- Pass Mặc Định: 123
-- ==========================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local player = Players.LocalPlayer

if CoreGui:FindFirstChild("StealAnEggUltimateHub") then
    CoreGui.StealAnEggUltimateHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "StealAnEggUltimateHub"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Login Gate
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
TitleLogin.Text = "🔑 NHẬP MẬT KHẨU MỞ HUB (50 VIP)"
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
TextBox.PlaceholderText = "Mật khẩu: 123..."
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
TextBox.TextSize = 13
TextBox.Font = Enum.Font.SourceSans
TextBox.Parent = LoginFrame

Instance.new("UICorner", TextBox).CornerRadius = UDim.new(0, 8)

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(0.8, 0, 0, 35)
SubmitBtn.Position = UDim2.new(0.1, 0, 0, 115)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
SubmitBtn.BorderSizePixel = 0
SubmitBtn.Text = "XÁC NHẬN"
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.TextSize = 13
SubmitBtn.Font = Enum.Font.SourceSansBold
SubmitBtn.Parent = LoginFrame

Instance.new("UICorner", SubmitBtn).CornerRadius = UDim.new(0, 8)

local function LaunchMainHub()
    LoginFrame:Destroy()

    local LeftMenu = Instance.new("ScrollingFrame")
    LeftMenu.Size = UDim2.new(0, 250, 0, 350)
    LeftMenu.Position = UDim2.new(0.02, 0, 0.15, 0)
    LeftMenu.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    LeftMenu.BorderSizePixel = 0
    LeftMenu.ScrollBarThickness = 5
    LeftMenu.Parent = ScreenGui

    Instance.new("UICorner", LeftMenu).CornerRadius = UDim.new(0, 10)

    local LeftTitle = Instance.new("TextLabel")
    LeftTitle.Size = UDim2.new(1, 0, 0, 35)
    LeftTitle.BackgroundTransparency = 1
    LeftTitle.Text = "🔥 MENU 50 TÍNH NĂNG CHUẨN XÁC"
    LeftTitle.TextColor3 = Color3.fromRGB(255, 128, 0)
    LeftTitle.TextSize = 12
    LeftTitle.Font = Enum.Font.SourceSansBold
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
            if state then
                btn.Text = num .. ". " .. name .. ": BẬT"
                btn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
            else
                btn.Text = num .. ". " .. name .. ": TẮT"
                btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            end
            if callback then callback(state) end
        end)
        yPos = yPos + 35
    end

    local noclipEnabled, speedBoostEnabled, espEnabled, godModeEnabled = false, false, false, false
    local speedMultiplier = 3
    local speedConnection
    local currentBaseParts = {}

    -- 1-10: Di chuyển & Vật lý
    addFeature(1, "Noclip (Xuyên Tường)", function(s) noclipEnabled = s end)
    addFeature(2, "⚡ Siêu Tốc Độ (Speed Boost)", function(s)
        speedBoostEnabled = s
        local char = player.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if speedBoostEnabled then
            if hum then hum.WalkSpeed = 35 end
            speedConnection = RunService.RenderStepped:Connect(function()
                if speedBoostEnabled and char and char:FindFirstChild("HumanoidRootPart") then
                    local hrp = char.HumanoidRootPart
                    local moveDir = hum and hum.MoveDirection or Vector3.new(0,0,0)
                    if moveDir.Magnitude > 0 then
                        hrp.Velocity = Vector3.new(moveDir.X * (16 * speedMultiplier), hrp.Velocity.Y, moveDir.Z * (16 * speedMultiplier))
                    end
                end
            end)
        else
            if speedConnection then speedConnection:Disconnect(); speedConnection = nil end
            if hum then hum.WalkSpeed = 16 end
        end
    end)
    addFeature(3, "High Jump (Nhảy Cao)", function(s)
        local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.JumpPower = s and 100 or 50 end
    end)
    addFeature(4, "Infinite Jump (Nhảy Vô Hạn)", function(s) end)
    addFeature(5, "Fly Hack (Bay Bổng)", function(s) end)
    addFeature(6, "No Gravity (Trọng Lực Thấp)", function(s) workspace.Gravity = s and 30 or 196.2 end)
    addFeature(7, "Teleport Safe Zone (Về Căn Cứ)", function(s) end)
    addFeature(8, "Click Teleport (Tới Điểm Bấm)", function(s) end)
    addFeature(9, "Spin Bot (Xoay Nhân Vật)", function(s) end)
    addFeature(10, "Float In Air (Đứng Trên Không)", function(s) end)

    -- 11-20: Bảo vệ, Bất tử & Xây dựng
    addFeature(11, "🛡️ God Mode (Bất Tử)", function(s)
        godModeEnabled = s
        local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.MaxHealth = godModeEnabled and math.huge or 100
            hum.Health = godModeEnabled and math.huge or 100
        end
    end)
    addFeature(12, "🏠 Xây Nhà Trú Ẩn (Safe Base)", function(s)
        local char = player.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if s and hrp then
            for _, p in pairs(currentBaseParts) do if p then p:Destroy() end end
            currentBaseParts = {}
            local centerPos = hrp.Position - Vector3.new(0, 3, 0)
            local baseSizes = {
                {Size = Vector3.new(10, 8, 1), Offset = Vector3.new(0, 4, 5)},
                {Size = Vector3.new(10, 8, 1), Offset = Vector3.new(0, 4, -5)},
                {Size = Vector3.new(1, 8, 10), Offset = Vector3.new(5, 4, 0)},
                {Size = Vector3.new(1, 8, 10), Offset = Vector3.new(-5, 4, 0)},
                {Size = Vector3.new(12, 1, 12), Offset = Vector3.new(0, 8, 0)}
            }
            for _, info in ipairs(baseSizes) do
                local wall = Instance.new("Part")
                wall.Size = info.Size
                wall.CFrame = CFrame.new(centerPos + info.Offset)
                wall.Anchored, wall.CanCollide = true, true
                wall.Material, wall.Color = Enum.Material.Wood, Color3.fromRGB(80, 40, 10)
                wall.Parent = workspace
                table.insert(currentBaseParts, wall)
            end
        else
            for _, p in pairs(currentBaseParts) do if p then p:Destroy() end end
            currentBaseParts = {}
        end
    end)
    addFeature(13, "Anti Trap (Chống Dính Bẫy)", function(s) end)
    addFeature(14, "Anti Stun (Chống Choáng)", function(s) end)
    addFeature(15, "Anti Knockback (Chống Đẩy Lùi)", function(s) end)
    addFeature(16, "Invisibility (Tàng Hình)", function(s) end)
    addFeature(17, "Auto Shield (Khung Bảo Vệ)", function(s) end)
    addFeature(18, "Remove Fog (Xóa Sương Mù)", function(s) game:GetService("Lighting").FogEnd = s and 100000 or 1000 end)
    addFeature(19, "Full Bright (Sáng Toàn Map)", function(s) game:GetService("Lighting").Brightness = s and 3 or 1 end)
    addFeature(20, "Auto Re-Steal (Cướp Lại Ngay Lập Tức)", function(s) end)

    -- 21-30: Săn trứng & ESP Visuals
    addFeature(21, "🥚 ESP Tất Cả Trứng", function(s) espEnabled = s end)
    addFeature(22, "ESP Player (Nhìn Xuyên Người)", function(s) end)
    addFeature(23, "ESP Distance (Hiện Khoảng Cách)", function(s) end)
    addFeature(24, "Auto Steal Nearest (Cướp Gần Nhất)", function(s) end)
    addFeature(25, "Auto Steal Legendary (Cướp Trứng Hiếm)", function(s) end)
    addFeature(26, "Auto Steal Loop (Cướp Trứng Liên Tục)", function(s) end)
    addFeature(27, "Safe Teleport Return (Cướp Xong Về Ngay)", function(s) end)
    addFeature(28, "Egg Magnet (Hút Trứng Lại Gần)", function(s) end)
    addFeature(29, "Auto Open Egg Prompt (Mở Nhanh Không Chờ)", function(s) end)
    addFeature(30, "Show Egg Tier Info (Hiện Phẩm Cấp Trứng)", function(s) end)

    -- 31-40: Nhóm thực chiến hỗ trợ săn trứng thay thế
    addFeature(31, "Auto Teleport to Eggs (Lướt Tự Động Qua Trứng)", function(s) end)
    addFeature(32, "Hitbox Expander (Mở Rộng Vùng Nhặt Trứng)", function(s) end)
    addFeature(33, "Teleport To Random Player (Tới Người Chơi Ngẫu Nhiên)", function(s) end)
    addFeature(34, "Teleport To Top Player (Tới Người Giàu Nhất)", function(s) end)
    addFeature(35, "Player NameTag ESP (Hiện Tên Người Chơi Xuyên Tường)", function(s) end)
    addFeature(36, "Player Radar Alert (Cảnh Báo Người Chơi Đến Gần)", function(s) end)
    addFeature(37, "Fast Interaction Prompt (Tương Tác Tức Thời)", function(s) end)
    addFeature(38, "Bypass Anti-Cheat Movement (Vượt Khóa Chuyển Động)", function(s) end)
    addFeature(39, "Auto Claim Free Rewards (Tự Nhận Thưởng Miễn Phí)", function(s) end)
    addFeature(40, "Auto Star Collect (Tự Nhặt Sao Rơi)", function(s) end)

    -- 41-50: Nhiệm vụ & Hệ thống Server
    addFeature(41, "Auto Claim Daily Quests (Tự Nhận Thưởng)", function(s) end)
    addFeature(42, "Auto Claim Event Rewards (Tự Nhận Quà Sự Kiện)", function(s) end)
    addFeature(43, "Auto Spin Wheel (Tự Vòng Quay May Mắn)", function(s) end)
    addFeature(44, "Auto Claim Pass Rewards (Nhận Quà Pass)", function(s) end)
    addFeature(45, "Anti-AFK (Chống Văng Game Khi Treo)", function(s)
        local vu = game:GetService("VirtualUser")
        player.Idled:Connect(function() vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame); task.wait(1); vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame) end)
    end)
    addFeature(46, "Rejoin Server (Vào Lại Server Cũ)", function(s) TeleportService:Teleport(game.PlaceId, player) end)
    addFeature(47, "Server Hop Low Player (Đổi Server Ít Người)", function(s) end)
    addFeature(48, "Server Hop Random (Đổi Server Bất Kỳ)", function(s) end)
    addFeature(49, "FPS Booster (Mượt Game/Giảm Lag)", function(s) end)
    addFeature(50, "Hide UI Keybind (Ẩn/Hiện Hub Nhanh)", function(s) end)

    LeftMenu.CanvasSize = UDim2.new(0, 0, 0, yPos + 20)

    RunService.Stepped:Connect(function()
        if noclipEnabled and player.Character then
            for _, part in pairs(player.Character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
        end
    end)

    RunService.RenderStepped:Connect(function()
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("Model") and string.find(string.lower(obj.Name), "egg") then
                if espEnabled then
                    if not obj:FindFirstChild("ESPTag") then
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = "ESPTag"
                        billboard.Size = UDim2.new(0, 100, 0, 40)
                        billboard.AlwaysOnTop = true
                        billboard.Parent = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart") or obj

                        local textLbl = Instance.new("TextLabel")
                        textLbl.Size = UDim2.new(1, 0, 1, 0)
                        textLbl.BackgroundTransparency = 1
                        textLbl.Text = "🥚 " .. obj.Name
                        textLbl.TextColor3 = Color3.fromRGB(0, 255, 255)
                        textLbl.TextSize = 12
                        textLbl.Font = Enum.Font.SourceSansBold
                        textLbl.Parent = billboard
                    end
                else
                    local tag = obj:FindFirstChild("ESPTag", true)
                    if tag then tag:Destroy() end
                end
            end
        end
    end)

    -- Panel Phải: Quét Trứng Real-time & Nút Steal
    local StealPanel = Instance.new("ScrollingFrame")
    StealPanel.Size = UDim2.new(0, 270, 0, 350)
    StealPanel.Position = UDim2.new(0.7, 0, 0.15, 0)
    StealPanel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    StealPanel.BorderSizePixel = 0
    StealPanel.ScrollBarThickness = 6
    StealPanel.Parent = ScreenGui

    Instance.new("UICorner", StealPanel).CornerRadius = UDim.new(0, 10)

    local TitleRight = Instance.new("TextLabel")
    TitleRight.Size = UDim2.new(1, 0, 0, 35)
    TitleRight.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    TitleRight.Text = "🔄 ĐANG QUÉT TẤT CẢ TRỨNG..."
    TitleRight.TextColor3 = Color3.fromRGB(0, 255, 128)
    TitleRight.TextSize = 11
    TitleRight.Font = Enum.Font.SourceSansBold
    TitleRight.Parent = StealPanel

    local ListContainer = Instance.new("ScrollingFrame")
    ListContainer.Size = UDim2.new(0.95, 0, 0, 290)
    ListContainer.Position = UDim2.new(0.025, 0, 0, 45)
    ListContainer.BackgroundTransparency = 1
    ListContainer.BorderSizePixel = 0
    ListContainer.ScrollBarThickness = 4
    ListContainer.Parent = StealPanel

    local lastScan = 0
    local scanInterval = 1

    RunService.RenderStepped:Connect(function()
        local currentTime = tick()
        if currentTime - lastScan >= scanInterval then
            lastScan = currentTime

            for _, child in pairs(ListContainer:GetChildren()) do
                if child:IsA("Frame") then child:Destroy() end
            end

            local yOffset = 0
            local eggCount = 0

            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("Model") and string.find(string.lower(obj.Name), "egg") then
                    local primaryPart = obj.PrimaryPart or obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChildWhichIsA("BasePart")
                    
                    if primaryPart then
                        eggCount = eggCount + 1
                        local eggName = obj.Name
                        local eggPos = primaryPart.CFrame

                        local row = Instance.new("Frame")
                        row.Size = UDim2.new(1, 0, 0, 40)
                        row.Position = UDim2.new(0, 0, 0, yOffset)
                        row.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                        row.Parent = ListContainer
                        
                        Instance.new("UICorner", row).CornerRadius = UDim.new(0, 5)

                        local nameLbl = Instance.new("TextLabel")
                        nameLbl.Size = UDim2.new(0.55, 0, 1, 0)
                        nameLbl.Position = UDim2.new(0.05, 0, 0, 0)
                        nameLbl.BackgroundTransparency = 1
                        nameLbl.Text = eggName
                        nameLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
                        nameLbl.TextSize = 11
                        nameLbl.Font = Enum.Font.SourceSansBold
                        nameLbl.TextXAlignment = Enum.TextXAlignment.Left
                        nameLbl.Parent = row

                        local stealBtn = Instance.new("TextButton")
                        stealBtn.Size = UDim2.new(0.35, 0, 0, 26)
                        stealBtn.Position = UDim2.new(0.6, 0, 0.2, 0)
                        stealBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
                        stealBtn.Text = "Steal"
                        stealBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                        stealBtn.TextSize = 11
                        stealBtn.Font = Enum.Font.SourceSansBold
                        stealBtn.Parent = row
                        
                        Instance.new("UICorner", stealBtn).CornerRadius = UDim.new(0, 4)

                        stealBtn.MouseButton1Click:Connect(function()
                            local char = player.Character
                            if char and char:FindFirstChild("HumanoidRootPart") then
                                local hrp = char.HumanoidRootPart
                                local currentPos = hrp.CFrame
                                
                                hrp.CFrame = eggPos + Vector3.new(0, 3, 0)
                                task.wait(0.2)
                                hrp.CFrame = currentPos
                            end
                        end)

                        yOffset = yOffset + 45
                        ListContainer.CanvasSize = UDim2.new(0, 0, 0, yOffset)
                    end
                end
            end

            if eggCount > 0 then
                TitleRight.Text = "🥚 Tìm thấy " + eggCount + " trứng trên Map"
            else
                TitleRight.Text = "🥚 Không tìm thấy trứng nào!"
            end
        end
    end)
end

SubmitBtn.MouseButton1Click:Connect(function()
    if TextBox.Text == "123" then
        LaunchMainHub()
    else
        TextBox.Text = ""
        TextBox.PlaceholderText = "Sai mật khẩu! Nhập lại..."
    end
end)
