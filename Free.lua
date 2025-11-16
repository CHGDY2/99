-- Free.lua (แมพ 99 คืนในป่า, ID: 4)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

-- GUI หลัก
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RuidHob_GUI"
ScreenGui.Parent = game.CoreGui

-- ปุ่มหลักวงกลม
local MainButton = Instance.new("TextButton")
MainButton.Size = UDim2.new(0,120,0,120)
MainButton.Position = UDim2.new(0,50,0,50)
MainButton.Text = "Ruid Hob"
MainButton.TextScaled = true
MainButton.Parent = ScreenGui
MainButton.BackgroundColor3 = Color3.fromRGB(0,255,255)

-- ไล่สีขยับ
spawn(function()
    local hue = 0
    while MainButton.Parent do
        hue = (hue + 0.01) % 1
        MainButton.TextColor3 = Color3.fromHSV(hue,1,1)
        wait(0.05)
    end
end)

-- Scrollable Menu
local Frame = Instance.new("ScrollingFrame")
Frame.Size = UDim2.new(0,220,0,400)
Frame.Position = UDim2.new(0,200,0,50)
Frame.BackgroundTransparency = 0.3
Frame.BackgroundColor3 = Color3.fromRGB(50,50,50)
Frame.CanvasSize = UDim2.new(0,0,0,0)
Frame.ScrollBarThickness = 8
Frame.Parent = ScreenGui

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = Frame
UIListLayout.Padding = UDim.new(0,5)

-- ฟังก์ชัน Auto / เสกของ / Menu
local MenuFunctions = {}

-- หมวดหลัง
MenuFunctions["บิน"] = function()
    Humanoid.WalkSpeed = 100
    print("บินแล้ว")
end
MenuFunctions["วิ่ง"] = function()
    Humanoid.WalkSpeed = 50
    print("วิ่งเร็วแล้ว")
end
MenuFunctions["ฟาร์มเพชร"] = function()
    print("ฟาร์มเพชรอัตโนมัติ")
    spawn(function()
        while true do
            for _,item in pairs(ReplicatedStorage:GetChildren()) do
                if item:IsA("Tool") then
                    item:Clone().Parent = LocalPlayer.Backpack
                end
            end
            wait(0.5)
        end
    end)
end
MenuFunctions["Auto ตัดต้นไม้"] = function()
    print("Auto ตัดต้นไม้")
    spawn(function()
        while true do
            for _,obj in pairs(workspace:GetChildren()) do
                if obj.Name:find("Tree") then
                    obj:Destroy()
                end
            end
            wait(0.5)
        end
    end)
end

-- หมวดเสกของ (ID:4 ใช้เป็นตัวอ้างอิง)
MenuFunctions["เสกของทั้งหมด"] = function()
    print("เสกของทั้งหมด (ID:4)")
    for _,item in pairs(ReplicatedStorage:GetChildren()) do
        if item:IsA("Tool") then
            item:Clone().Parent = LocalPlayer.Backpack
        end
    end
end

-- หมวดออโต้
MenuFunctions["Auto หาเด็ก"] = function()
    print("Auto หาเด็ก")
end
MenuFunctions["Auto ตกปลา"] = function()
    print("Auto ตกปลา")
end
MenuFunctions["Auto สัตว์เลี้ยง"] = function()
    print("Auto สัตว์เลี้ยง")
end
MenuFunctions["Auto ตีทุกอย่าง"] = function()
    print("Auto ตีทุกอย่าง")
    spawn(function()
        while true do
            for _,obj in pairs(workspace:GetChildren()) do
                if obj:FindFirstChild("Humanoid") then
                    local hum = obj:FindFirstChild("Humanoid")
                    hum.Health = hum.Health - 50 -- โหดขึ้นมาก
                end
            end
            wait(0.2)
        end
    end)
end

-- สร้างปุ่มเมนู
for name, func in pairs(MenuFunctions) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1,0,0,30)
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(80,80,80)
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Parent = Frame
    btn.MouseButton1Click:Connect(func)
end

-- ปรับ CanvasSize ให้ Scrollable
UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    Frame.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y)
end)

-- ปุ่มปิด GUI
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0,30,0,30)
CloseButton.Position = UDim2.new(0,10,0,10)
CloseButton.Text = "X"
CloseButton.BackgroundColor3 = Color3.fromRGB(255,0,0)
CloseButton.TextColor3 = Color3.fromRGB(255,255,255)
CloseButton.Parent = ScreenGui
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- ปุ่มย่อ GUI
local MinButton = Instance.new("TextButton")
MinButton.Size = UDim2.new(0,30,0,30)
MinButton.Position = UDim2.new(0,50,0,10)
MinButton.Text = "▢"
MinButton.BackgroundColor3 = Color3.fromRGB(100,100,100)
MinButton.TextColor3 = Color3.fromRGB(255,255,255)
MinButton.Parent = ScreenGui
MinButton.MouseButton1Click:Connect(function()
    Frame.Visible = not Frame.Visible
end)
