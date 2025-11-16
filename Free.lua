-- Free.lua
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

-- สร้าง ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RuidHob_GUI"
ScreenGui.Parent = game.CoreGui

-- วงกลมหลักชื่อค่าย
local MainButton = Instance.new("TextButton")
MainButton.Size = UDim2.new(0,120,0,120)
MainButton.Position = UDim2.new(0,50,0,50)
MainButton.Text = "Ruid Hob"
MainButton.TextScaled = true
MainButton.Parent = ScreenGui
MainButton.BackgroundColor3 = Color3.fromRGB(0,255,255)
MainButton.AutoButtonColor = true

-- ไล่สีตัวอักษรชื่อค่าย
spawn(function()
    local hue = 0
    while MainButton.Parent do
        hue = (hue + 0.01) % 1
        MainButton.TextColor3 = Color3.fromHSV(hue,1,1)
        wait(0.05)
    end
end)

-- กล่อง Scrollable สำหรับปุ่มเมนู
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0,150,0,400)
Frame.Position = UDim2.new(0,200,0,50)
Frame.BackgroundTransparency = 0.3
Frame.BackgroundColor3 = Color3.fromRGB(50,50,50)
Frame.Parent = ScreenGui

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = Frame
UIListLayout.Padding = UDim.new(0,5)

-- ฟังก์ชันเมนู
local MenuFunctions = {
    -- หมวดหลัง / Movement
    Fly = function()
        print("บินแล้ว")
        -- ตัวอย่าง fly (สามารถปรับตามเกมจริง)
        local BodyVelocity = Instance.new("BodyVelocity")
        BodyVelocity.Velocity = Vector3.new(0,50,0)
        BodyVelocity.MaxForce = Vector3.new(0,4000,0)
        BodyVelocity.Parent = Character.PrimaryPart
        game:GetService("Debris"):AddItem(BodyVelocity,1)
    end,
    Run = function()
        print("วิ่งแล้ว")
        Humanoid.WalkSpeed = 50 -- ปรับความเร็ว
    end,
    AutoDiamond = function()
        print("ฟาร์มเพชรแล้ว")
        -- ตัวอย่าง loop เก็บไอเทมในพื้นที่ใกล้เคียง
        spawn(function()
            while true do
                for _,item in pairs(workspace:GetChildren()) do
                    if item.Name == "Diamond" and (item.Position - Character.PrimaryPart.Position).Magnitude < 20 then
                        item.CFrame = Character.PrimaryPart.CFrame
                    end
                end
                wait(0.5)
            end
        end)
    end,
    AutoTree = function()
        print("Auto ตัดต้นไม้แล้ว")
        -- ตัวอย่าง loop ตัดต้นไม้
        spawn(function()
            while true do
                for _,tree in pairs(workspace:GetChildren()) do
                    if tree.Name == "Tree" and (tree.Position - Character.PrimaryPart.Position).Magnitude < 20 then
                        tree:Destroy()
                    end
                end
                wait(1)
            end
        end)
    end,
    -- หมวดเสกของ
    SpawnWood = function() print("เสกไม้แล้ว") end,
    SpawnCoal = function() print("เสกถ่านแล้ว") end,
    SpawnIron = function() print("เสกเหล็กแล้ว") end,
    SpawnGun = function() print("เสกปืนแล้ว") end,
    -- หมวดออโต้
    AutoKid = function() print("Auto หาเด็กแล้ว") end,
    AutoFish = function() print("Auto ตกปลาแล้ว") end,
    AutoPet = function() print("Auto สัตว์เลี้ยงแล้ว") end,
    AutoEvent = function() print("Auto ทำ Event แล้ว") end,
    AutoAttack = function()
        print("Auto ตีทุกอย่างแล้ว")
        -- ตัวอย่างทำ damage มอนสเตอร์ใกล้
        spawn(function()
            while true do
                for _,monster in pairs(workspace:GetChildren()) do
                    if monster:IsA("Model") and (monster.PrimaryPart.Position - Character.PrimaryPart.Position).Magnitude < 10 then
                        if monster:FindFirstChild("Humanoid") then
                            monster.Humanoid:TakeDamage(10)
                        end
                    end
                end
                wait(1)
            end
        end)
    end,
}

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
