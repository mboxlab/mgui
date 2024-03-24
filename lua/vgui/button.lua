local PANEL = {}

function PANEL:Init()
    self:SetMinimumSize( 64, 40 )

    self:SetFont( "mgui_small" )
    self:SetTextColor( color_white )

    self.vg_alpha, self.vg_bar = 0, 0
end

do
    local Lerp = Lerp
    local RealFrameTime = RealFrameTime

    local surface_SetDrawColor = surface.SetDrawColor
    local surface_DrawRect = surface.DrawRect

    local math_Remap = math.Remap

    function PANEL:Paint(w, h)
        local isHovered = self:IsHovered()
        local frametime = RealFrameTime()
    
        local alpha = Lerp( frametime * 8, self.vg_alpha, (isHovered and not self:IsDown()) and 64 or 40 )
        self.vg_alpha = alpha
    
        local bar = Lerp( frametime * 6, self.vg_bar, isHovered and w or 0 )
        self.vg_bar = bar
    
        surface_SetDrawColor( 128, 128, 128, alpha )
        surface_DrawRect( 0, 0, w, h )

        if bar < 1 then
            return
        end

        for i = 1, 8 do
            surface_SetDrawColor( 192, 192, 192, 6 )
            surface_DrawRect( w - bar, h - 3, math_Remap( i, 1, 8, bar, bar / 4 ), 3 )
        end
    end    
end

vgui.Register("mgui_button", PANEL, "DButton")