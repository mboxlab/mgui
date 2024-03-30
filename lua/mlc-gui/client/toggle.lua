local RealFrameTime = RealFrameTime
local Lerp = Lerp
local surface_SetDrawColor = CLIENT and surface.SetDrawColor
local surface_DrawRect = CLIENT and surface.DrawRect
local math_Remap = math.Remap
local math_min = math.min
local vgui_Register = CLIENT and vgui.Register

------------------------------------------------------------------------------------------------------------------------

local PANEL = {}

function PANEL:Init()
	self:SetMinimumSize(64, 24)

	self:SetText("Label")
	self:SetFont("mlcgui_small")
	self:SetTextColor(color_white)

	self.mlc_alpha = 0
	self.mlc_bar = 0
end

function PANEL:Paint(w, h)
	local frametime = RealFrameTime()

	local alpha = Lerp(frametime * 8, self.mlc_alpha, (self:IsHovered() and not self:IsDown()) and 64 or 40)
	self.mlc_alpha = alpha

	local bar = Lerp(frametime * 6, self.mlc_bar, self:GetChecked() and w or 0)
	self.mlc_bar = bar

	surface_SetDrawColor(128, 128, 128, alpha)
	surface_DrawRect(0, 0, w, h)

	local red, green = math_Remap(bar, 0, w, 192, 128), math_Remap(bar, 0, w, 128, 192)

	local endsize = w / 8
	for i = 1, 8 do
		surface_SetDrawColor(red, green, math_min(red, green), i == 8 and 10 or 4)
		surface_DrawRect(math_Remap(i, 1, 8, 0, (w - endsize) * bar / w), 0, math_Remap(i, 1, 8, w, endsize), h)
	end
end

vgui_Register("MLC_Toggle", PANEL, "DCheckBox")

------------------------------------------------------------------------------------------------------------------------
