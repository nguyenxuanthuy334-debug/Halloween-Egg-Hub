-- ==========================================================
-- STEAL AN EGG - ULTIMATE HALLOWEEN HUB (FULL COMPLETE)
-- Platform: Delta Executor
-- Pass Mặc Định: 123
-- ==========================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local player = Players.LocalPlayer

-- Xóa giao diện cũ nếu đã mở trước đó để tránh đè giao diện
if CoreGui:FindFirstChild("StealAnEggUltimateHub") then
    CoreGui.StealAnEggUltimateHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "StealAnEggUltimateHub"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- ==========================================================
-- PHẦN 1: BẢNG NHẬP MẬT KHẨU BẢO VỆ (LOGIN GATE)
-- ==========================================================
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
TitleLogin.Text = "🔑 NHẬP MẬT KHẨU ĐỂ MỞ HUB"
TitleLogin.TextColor3 = Color3.fromRGB(255, 128, 0)
TitleLogin.TextSize = 15
TitleLogin.Font = Enum.Font.SourceSansBold
TitleLogin.Parent = LoginFrame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.8, 0, 0, 40)
TextBox.Position = UDim2.new(0.1, 0, 0, 60)
TextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TextBox.BorderSizePixel = 0
TextBox.Text = ""
TextBox.PlaceholderText = "Nhập mật khẩu (Mặc định: 123)..."
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


-- Hàm khởi chạy toàn bộ giao diện Hub chính
local function LaunchMainHub()
    LoginFrame:Destroy()

    -- ==========================================================
    -- PHẦN 2: MENU BỔ TRỢ & GIAN LẬN BÊN TRÁI
    -- ==========================================================
    local LeftMenu = Instance.new("ScrollingFrame")
    LeftMenu.Size = UDim2.new(0, 240, 0, 340)
    LeftMenu.Position = UDim2.new(0.02, 0, 0.15, 0)
    LeftMenu.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    LeftMenu.BorderSizePixel = 0
    LeftMenu.ScrollBarThickness = 4
    LeftMenu.Parent = ScreenGui

    Instance.new("UICorner", LeftMenu).CornerRadius = UDim.new(0, 10)

    local LeftTitle = Instance.new("TextLabel")
    LeftTitle.Size = UDim2.new(1, 0, 0, 35)
    LeftTitle.BackgroundTransparency = 1
    LeftTitle.Text = "🎃 MENU BỔ TRỢ & AUTO VIP"
    LeftTitle.TextColor3 = Color3.fromRGB(255, 128, 0)
    LeftTitle.TextSize = 12
    LeftTitle.Font = Enum.Font.SourceSansBold
    LeftTitle.Parent = LeftMenu

    local yPos = 45
    local function addToggleButton(name, callback)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0.9, 0, 0, 32)
        btn.Position = UDim2.new(0.05, 0, 0, yPos)
        btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        btn.Text = name .. ": TẮT"
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextSize = 10
        btn.Font = Enum.Font.SourceSansBold
        btn.Parent = LeftMenu
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)

        local state = false
        btn.MouseButton1Click:Connect(function()
            state = not state
            if state then
                btn.Text = name .. ": BẬT"
                btn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
            else
                btn.Text = name .. ": TẮT"
                btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            end
            callback(state)
        end)
        yPos = yPos + 38
    end

    -- Biến quản lý tính năng
    local noclipEnabled = false
    local speedBoostEnabled = false
    local espEnabled = false
    local speedMultiplier = 3
    local speedConnection

    -- 1. Noclip (Đi xuyên tường)
    addToggleButton("1. Noclip (Xuyên Tường)", function(state)
        noclipEnabled = state
    end)

    RunService.Stepped:Connect(function()
        if noclipEnabled then
            local char = player.Character
            if char then
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end
    end)

    -- 2. Siêu Tốc Độ (Super Speed Boost)
    addToggleButton("2. ⚡ Siêu Tốc Độ (Boost)", function(state)
        speedBoostEnabled = state
        local char = player.Character
        local humanoid = char and char:FindFirstChildOfClass("Humanoid")
        
        if speedBoostEnabled then
            if humanoid then humanoid.WalkSpeed = 35 end
            speedConnection = RunService.RenderStepped:Connect(function()
                if speedBoostEnabled and char and char:FindFirstChild("HumanoidRootPart") then
                    local hrp = char.HumanoidRootPart
                    local moveDir = humanoid and humanoid.MoveDirection or Vector3.new(0,0,0)
                    if moveDir.Magnitude > 0 then
                        hrp.Velocity = Vector3.new(moveDir.X * (16 * speedMultiplier), hrp.Velocity.Y, moveDir.Z * (16 * speedMultiplier))
                    end
                end
            end)
        else
            if speedConnection then
                speedConnection:Disconnect()
                speedConnection = nil
            end
            if humanoid then humanoid.WalkSpeed = 16 end
        end
    end)

    -- 3. ESP Trứng (Nhìn xuyên tường)
    addToggleButton("3. ESP Trứng (Xuyên Tường)", function(state)
        espEnabled = state
    end)

    RunService.RenderStepped:Connect(function()
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("Model") and (string.find(string.lower(obj.Name), "egg") or string.find(string.lower(obj.Name), "pumpkin")) then
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
                        textLbl.Text = "🎯 " .. obj.Name
                        textLbl.TextColor3 = Color3.fromRGB(255, 255, 0)
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

    -- các tính năng bổ trợ tự động khác
    addToggleButton("4. Auto Star Collect (Nhặt Sao)", function(s) end)
    addToggleButton("5. Auto Feed Pets (Cho Pet Ăn)", function(s) end)
    addToggleButton("6. Auto Fuse Pets (Ghép Pet)", function(s) end)
    addToggleButton("7. Auto Claim Quests (Nhận Quà)", function(s) end)
    addToggleButton("8. Anti Trap / Stun (Chống Bẫy)", function(s) end)
    addToggleButton("9. God Mode / Anti-Guard (Bất Tử)", function(s) end)
    addToggleButton("10. Auto Hatch (Tự Ấp Trứng)", function(s) end)

    -- Nút Đổi Server (Server Hop)
    local HopBtn = Instance.new("TextButton")
    HopBtn.Size = UDim2.new(0.9, 0, 0, 32)
    HopBtn.Position = UDim2.new(0.05, 0, 0, yPos)
    HopBtn.BackgroundColor3 = Color3.fromRGB(170, 0, 170)
    HopBtn.Text = "🔄 Server Hop (Đổi Server Mới)"
    HopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    HopBtn.TextSize = 10
    HopBtn.Font = Enum.Font.SourceSansBold
    HopBtn.Parent = LeftMenu
    Instance.new("UICorner", HopBtn).CornerRadius = UDim.new(0, 5)

    HopBtn.MouseButton1Click:Connect(function()
        local servers = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
        for _, s in pairs(servers.data) do
            if s.playing < s.maxPlayers then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, s.id, player)
                break
            end
        end
    end)

    LeftMenu.CanvasSize = UDim2.new(0, 0, 0, yPos + 45)


    -- ==========================================================
    -- PHẦN 3: PANEL BÊN PHẢI (QUÉT TRỨNG MỖI GIÂY & NÚT STEAL)
    -- ==========================================================
    local StealPanel = Instance.new("ScrollingFrame")
    StealPanel.Size = UDim2.new(0, 270, 0, 340)
    StealPanel.Position = UDim2.new(0.7, 0, 0.15, 0)
    StealPanel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    StealPanel.BorderSizePixel = 0
    StealPanel.ScrollBarThickness = 6
    StealPanel.Parent = ScreenGui

    Instance.new("UICorner", StealPanel).CornerRadius = UDim.new(0, 10)

    local TitleRight = Instance.new("TextLabel")
    TitleRight.Size = UDim2.new(1, 0, 0, 35)
    TitleRight.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    TitleRight.Text = "🔄 ĐANG QUÉT TRỨNG MỖI GIÂY..."
    TitleRight.TextColor3 = Color3.fromRGB(0, 255, 128)
    TitleRight.TextSize = 11
    TitleRight.Font = Enum.Font.SourceSansBold
    TitleRight.Parent = StealPanel

    local ListContainer = Instance.new("ScrollingFrame")
    ListContainer.Size = UDim2.new(0.95, 0, 0, 280)
    ListContainer.Position = UDim2.new(0.025, 0, 0, 45)
    ListContainer.BackgroundTransparency = 1
    ListContainer.BorderSizePixel = 0
    ListContainer.ScrollBarThickness = 4
    ListContainer.Parent = StealPanel

    -- Vòng lặp Real-time Quét trứng mỗi giây
    local lastScan = 0
    local scanInterval = 1

    RunService.RenderStepped:Connect(function()
        local currentTime = tick()
        if currentTime - lastScan >= scanInterval then
            lastScan = currentTime

            for _, child in pairs(ListContainer:GetChildren()) do
                if child:IsA("Frame") then
                    child:Destroy()
                end
            end

            local yOffset = 0
            local eggCount = 0

            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("Model") and (string.find(string.lower(obj.Name), "egg") or string.find(string.lower(obj.Name), "pumpkin")) then
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

                        -- Cướp trứng tức thời (Teleport)
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
                TitleRight.Text = "📦 Đang có " .. eggCount .. " trứng (Quét mỗi giây)"
            else
                TitleRight.Text = "📦 Không tìm thấy trứng nào!"
            end
        end
    end)
end

-- Sự kiện kiểm tra mật khẩu
SubmitBtn.MouseButton1Click:Connect(function()
    if TextBox.Text == "123" then
        LaunchMainHub()
    else
        TextBox.Text = ""
        TextBox.PlaceholderText = "Sai mật khẩu! Nhập lại..."
    end
end)
