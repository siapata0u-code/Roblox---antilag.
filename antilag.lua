-- 🔰 Anti Lag PRO - 99 Nights in the Forest
-- Dibuat untuk mengurangi lag di HP/PC kentang

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local player = Players.LocalPlayer

-- Buat GUI tombol
local gui = Instance.new("ScreenGui")
gui.Name = "AntiLagGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local btn = Instance.new("TextButton")
btn.Size = UDim2.new(0, 150, 0, 40)
btn.Position = UDim2.new(0, 10, 0, 10)
btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.Text = "Anti Lag: OFF"
btn.Parent = gui
btn.AutoButtonColor = true

-- Simpan setting asli
local original = {
	GlobalShadows = Lighting.GlobalShadows,
	Brightness = Lighting.Brightness,
	FogEnd = Lighting.FogEnd
}

local isOn = false

local function enableAntiLag()
	-- Lighting
	Lighting.GlobalShadows = false
	Lighting.Brightness = 1
	Lighting.FogEnd = 1e5
	Lighting.EnvironmentDiffuseScale = 0
	Lighting.EnvironmentSpecularScale = 0

	-- Efek berat
	for _, v in ipairs(workspace:GetDescendants()) do
		if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Fire")
			or v:IsA("Smoke") or v:IsA("Sparkles") then
			v.Enabled = false
		elseif v:IsA("Decal") or v:IsA("Texture") then
			v.Transparency = 1
		elseif v:IsA("BasePart") or v:IsA("MeshPart") or v:IsA("UnionOperation") then
			v.Material = Enum.Material.SmoothPlastic
			v.Reflectance = 0
		end
	end

	-- Efek Lighting
	for _, effect in ipairs({"Bloo
