-- local PANEL = {}

-- function PANEL:Init()
--     self.lblTitle:SetFont( "mgui_small" )
--     self.lblTitle:SetTextColor( color_white )

--     self.startTime = SysTime()
-- end

-- do
--     local blur = Material( "pp/blurscreen" )

--     local bSetFloat = blur.SetFloat
--     local bRecompute = blur.Recompute

--     local pGetAlpha = FindMetaTable( "Panel" ).GetAlpha

--     local render_UpdateScreenEffectTexture = render.UpdateScreenEffectTexture
--     local surface_SetMaterial = surface.SetMaterial
--     local surface_SetDrawColor = surface.SetDrawColor
--     local surface_DrawTexturedRect = surface.DrawTexturedRect
--     local surface_DrawRect = surface.DrawRect

--     function PANEL:Paint( w, h )
--         bSetFloat( blur, "$blur", pGetAlpha( self ) / 64 )
--         bRecompute( blur )

--         render_UpdateScreenEffectTexture()
--         surface_SetMaterial( blur )
--         surface_SetDrawColor( 255, 255, 255, 255 )
--         surface.DrawTexturedRectUV( 0, 0, w, h, self:GetX() / ScrW(), self:GetY() / ScrH(), (self:GetX() + self:GetWide()) / ScrW(), (self:GetY() + self:GetTall()) / ScrH())

--         surface_SetDrawColor( 32, 32, 32, 240 )
--         surface_DrawRect( 0, 0, w, h )

--         surface_SetDrawColor( 24, 24, 24, 96 )
--         surface_DrawRect( 1, 1, w - 2, 22 )
--     end
-- end

-- vgui.Register( "mgui_frame", PANEL, "DFrame" )