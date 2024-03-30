local RealFrameTime = RealFrameTime
local Lerp = Lerp
local surface_SetDrawColor = CLIENT and surface.SetDrawColor
local surface_DrawRect = CLIENT and surface.DrawRect
local math_Remap = math.Remap
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
	local isHovered = self:IsHovered()

	local alpha = Lerp(frametime * 8, self.mlc_alpha, (isHovered and not self:IsDown()) and 64 or 40)
	self.mlc_alpha = alpha

	local bar = Lerp(frametime * 6, self.mlc_bar, isHovered and w or 0)
	self.mlc_bar = bar

	surface_SetDrawColor(128, 128, 128, alpha)
	surface_DrawRect(0, 0, w, h)

	if bar < 1 then
		return
	end

	local endsize = bar / 4
	for i = 1, 8 do
		surface_SetDrawColor(192, 192, 192, 6)
		surface_DrawRect(w - bar, h - 3, math_Remap(i, 1, 8, bar, endsize), 3)
	end
end

vgui_Register("MLC_Button", PANEL, "DButton")

------------------------------------------------------------------------------------------------------------------------
