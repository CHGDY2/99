-- RUID HOB HUB FREE - GUI + ปุ่มสคริปต์ฟรี
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local CG = game:GetService("CoreGui")

-- ScreenGui
local GUI = Instance.new("ScreenGui", CG)
GUI.Name = "RuidHobFree"
GUI.ResetOnSpawn = false

-- ไอคอนวงกลมเปิด GUI
local Icon = Instance.new("ImageButton", GUI)
Icon.Size = UDim2.new(0,70,0,70)
Icon.Position = UDim2.new(0.05,0,0.5,-35)
Icon.BackgroundTransparency = 1
Icon.Image = "rbxassetid://478029386"

-- GUI หลัก
local Main = Instance.new("Frame", GUI)
Main.Size = UDim2.new(0,500,0,400)
Main.Position = UDim2.new(0.5,-250,0.5,-200)
Main.BackgroundColor3 = Color3.fromRGB(18,18,18)
Main.BorderSizePixel = 0
Main.Visible = false
Main.ClipsDescendants = true
Main.Active = true
Main.Draggable = true

-- Header
local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1,0,0,50)
Header.BackgroundColor3 = Color3.fromRGB(30,30,30)
Header.BorderSizePixel = 0

local Title = Instance.new("TextLabel", Header)
Title.Size = UDim2.new(1,-100,1,0)
Title.Position = UDim2.new(0,10,0,0)
Title.BackgroundTransparency = 1
Title.Text = "Ruid Hob"
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true

-- ไล่สี Dynamic
spawn(function()
    while true do
        for i = 0,1,0.01 do
            Title.TextColor3 = Color3.fromHSV(i,1,1)
            task.wait(0.02)
        end
    end
end)

-- ปุ่ม X ลบ GUI
local CloseBtn = Instance.new("TextButton", Header)
CloseBtn.Size = UDim2.new(0,50,0,50)
CloseBtn.Position = UDim2.new(1,-50,0,0)
CloseBtn.Text = "X"
CloseBtn.TextScaled = true
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextColor3 = Color3.new(1,1,1)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255,30,30)
CloseBtn.MouseButton1Click:Connect(function()
    GUI:Destroy()
end)

-- ปุ่ม □ ย่อ GUI
local MiniBtn = Instance.new("TextButton", Header)
MiniBtn.Size = UDim2.new(0,50,0,50)
MiniBtn.Position = UDim2.new(1,-100,0,0)
MiniBtn.Text = "□"
MiniBtn.TextScaled = true
MiniBtn.Font = Enum.Font.GothamBold
MiniBtn.TextColor3 = Color3.new(1,1,1)
MiniBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
MiniBtn.MouseButton1Click:Connect(function()
    Main.Visible = false
    Icon.Visible = true
end)

-- ScrollFrame
local Scroll = Instance.new("ScrollingFrame", Main)
Scroll.Size = UDim2.new(1,0,1,-50)
Scroll.Position = UDim2.new(0,0,0,50)
Scroll.BackgroundTransparency = 1
Scroll.ScrollBarThickness = 6
Scroll.CanvasSize = UDim2.new(0,0,3,0)

-- ฟังก์ชันสร้างปุ่มสวย
local function MakeButton(text, callback)
    local btn = Instance.new("TextButton", Scroll)
    btn.Size = UDim2.new(1,-20,0,55)
    btn.Position = UDim2.new(0,10,0,(#Scroll:GetChildren()-1)*60)
    btn.BackgroundColor3 = Color3.fromRGB(45,45,45)
    btn.Text = text
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.AutoButtonColor = false

    -- Hover Effect
    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(70,70,70)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(45,45,45)
    end)

    btn.MouseButton1Click:Connect(callback)
end

-- รายการ URL ของสคริปต์ Free (โหลดจาก repo ของคุณ)
local AllScripts = {
    "https://raw.githubusercontent.com/CHGDY2/99/main/Free/Fly.lua",
    "https://raw.githubusercontent.com/CHGDY2/99/main/Free/Run.lua",
    "https://raw.githubusercontent.com/CHGDY2/99/main/Free/AutoDiamond.lua",
    "https://raw.githubusercontent.com/CHGDY2/99/main/Free/AutoTree.lua",
    "https://raw.githubusercontent.com/CHGDY2/99/main/Free/SpawnWood.lua",
    "https://raw.githubusercontent.com/CHGDY2/99/main/Free/SpawnCoal.lua",
    "https://raw.githubusercontent.com/CHGDY2/99/main/Free/SpawnIron.lua",
    "https://raw.githubusercontent.com/CHGDY2/99/main/Free/SpawnGun.lua",
    "https://raw.githubusercontent.com/CHGDY2/99/main/Free/AutoKid.lua",
    "https://raw.githubusercontent.com/CHGDY2/99/main/Free/AutoFish.lua",
    "https://raw.githubusercontent.com/CHGDY2/99/main/Free/AutoPet.lua",
    "https://raw.githubusercontent.com/CHGDY2/99/main/Free/AutoEvent.lua",
    "https://raw.githubusercontent.com/CHGDY2/99/main/Free/AutoAttack.lua"
}

-- ฟังก์ชันโหลดทุกสคริปต์
local function LoadAll()
    for _,url in pairs(AllScripts) do
        pcall(function()
            loadstring(game:HttpGet(url))()
        end)
    end
end

-- ปุ่ม All
MakeButton("🌐 Load All Scripts", LoadAll)

-- ปุ่มแต่ละสคริปต์
MakeButton("🚀 Fly", function() loadstring(game:HttpGet(AllScripts[1]))() end)
MakeButton("⚡ Run", function() loadstring(game:HttpGet(AllScripts[2]))() end)
MakeButton("💎 Auto Diamond", function() loadstring(game:HttpGet(AllScripts[3]))() end)
MakeButton("🌲 Auto Tree", function() loadstring(game:HttpGet(AllScripts[4]))() end)
MakeButton("🪵 Spawn Wood", function() loadstring(game:HttpGet(AllScripts[5]))() end)
MakeButton("🔥 Spawn Coal", function() loadstring(game:HttpGet(AllScripts[6]))() end)
MakeButton("⚒️ Spawn Iron", function() loadstring(game:HttpGet(AllScripts[7]))() end)
MakeButton("🔫 Spawn Gun", function() loadstring(game:HttpGet(AllScripts[8]))() end)
MakeButton("👶 Auto Kid", function() loadstring(game:HttpGet(AllScripts[9]))() end)
MakeButton("🎣 Auto Fish", function() loadstring(game:HttpGet(AllScripts[10]))() end)
MakeButton("🐾 Auto Pet", function() loadstring(game:HttpGet(AllScripts[11]))() end)
MakeButton("🎉 Auto Event", function() loadstring(game:HttpGet(AllScripts[12]))() end)
MakeButton("⚔️ Auto Attack", function() loadstring(game:HttpGet(AllScripts[13]))() end)

-- เปิด GUI
Icon.MouseButton1Click:Connect(function()
    Icon.Visible = false
    Main.Visible = true
end)
