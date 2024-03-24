local PANEL = {}

function PANEL:Init()
    self:SetMinimumSize( 64, 40 )

    self:SetFont( "mgui_small" )
    self:SetTextColor(color_white)

    self.vg_alpha, self.vg_bar = 0, 0
end

do
    local Lerp = Lerp
    local RealFrameTime = RealFrameTime

    local surface_SetDrawColor = surface.SetDrawColor
    local surface_DrawRect = surface.DrawRect

    local math_Remap = math.Remap

    function PANEL:Paint( w, h )
        local frametime = RealFrameTime()
    
        local alpha = Lerp( frametime * 8, self.vg_alpha, ( self:IsHovered() and not self:IsDown() ) and 64 or 40 )
        self.vg_alpha = alpha
    
        local bar = Lerp( frametime * 6, self.vg_bar, self:GetChecked() and w or 0 )
        self.vg_bar = bar
    
        surface_SetDrawColor( 128, 128, 128, alpha )
        surface_DrawRect( 0, 0, w, h )

        local r, g = math_Remap(bar, 0, w, 192, 128), math.Remap(bar, 0, w, 128, 192)

        for i = 1, 8 do
            surface_SetDrawColor( r, g, math.min(r, g), i == 8 and 24 or 12 )
            surface_DrawRect( 
                math_Remap( i, 1, 8, 0, ( w - w / 8 ) * bar / w ), 0, 
                math_Remap( i, 1, 8, w, w / 8 ), h 
            )
        end
    end    
end

vgui.Register("mgui_checkbox", PANEL, "DCheckBox")