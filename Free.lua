-- Free.lua
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RuidHob_GUI"
ScreenGui.Parent = game.CoreGui

local MainButton = Instance.new("TextButton")
MainButton.Size = UDim2.new(0,100,0,100)
MainButton.Position = UDim2.new(0,50,0,50)
MainButton.Text = "Ruid Hob"
MainButton.Parent = ScreenGui
MainButton.BackgroundColor3 = Color3.fromRGB(0,255,255)

local MenuFunctions = {
    Fly = function() print("บินแล้ว") end,
    Run = function() print("วิ่งแล้ว") end,
    AutoDiamond = function() print("ฟาร์มเพชรแล้ว") end,
    AutoTree = function() print("Auto ตัดต้นไม้แล้ว") end,
    SpawnWood = function() print("เสกไม้แล้ว") end,
    SpawnCoal = function() print("เสกถ่านแล้ว") end,
    SpawnIron = function() print("เสกเหล็กแล้ว") end,
    SpawnGun = function() print("เสกปืนแล้ว") end,
    AutoKid = function() print("Auto หาเด็กแล้ว") end,
    AutoFish = function() print("Auto ตกปลาแล้ว") end,
    AutoPet = function() print("Auto สัตว์เลี้ยงแล้ว") end,
    AutoEvent = function() print("Auto ทำ Event แล้ว") end,
    AutoAttack = function() print("Auto ตีทุกอย่างแล้ว") end,
}

local yOffset = 0
for name, func in pairs(MenuFunctions) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0,120,0,30)
    btn.Position = UDim2.new(0,50,0,170 + yOffset)
    btn.Text = name
    btn.Parent = ScreenGui
    btn.MouseButton1Click:Connect(func)
    yOffset = yOffset + 35
end

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0,30,0,30)
CloseButton.Position = UDim2.new(0,10,0,10)
CloseButton.Text = "X"
CloseButton.Parent = ScreenGui
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local MinButton = Instance.new("TextButton")
MinButton.Size = UDim2.new(0,30,0,30)
MinButton.Position = UDim2.new(0,50,0,10)
MinButton.Text = "▢"
MinButton.Parent = ScreenGui
MinButton.MouseButton1Click:Connect(function()
    MainButton.Visible = true
    for _,v in pairs(ScreenGui:GetChildren()) do
        if v:IsA("TextButton") and v~=MainButton and v~=CloseButton and v~=MinButton then
            v.Visible = not v.Visible
        end
    end
end)
