-- local PANEL = {}

-- AccessorFunc( PANEL, "m_iIndent", "Indent" )

-- function PANEL:Init()
--     self:SetTall( 16 )

-- 	self.Button = self:Add("DCheckBox")
-- 	self.Button.OnChange = function( _, val ) self:OnChange( val ) end
--     self.Button.red = 0
--     self.Button.green = 0

--     do
--         local Lerp = Lerp
--         local RealFrameTime = RealFrameTime

--         local surface_SetDrawColor = surface.SetDrawColor
--         local surface_DrawRect = surface.DrawRect

--         local panel = self

--         self.Button.Paint = function( self, w, h )
--             local frametime = RealFrameTime()
        
--             surface_SetDrawColor( 128, 128, 128, 40 )
--             surface_DrawRect( 0, 0, w, h )

--             local value = self:GetChecked()

--             local shift = (self:IsHovered() or panel.Label:IsHovered()) and 16 or 0

--             local red = Lerp( frametime * 6, self.red, value and 128 + shift or 192 - shift )
--             self.red = red

--             local green = Lerp( frametime * 6, self.green, value and 192 - shift or 128 + shift )
--             self.green = green

--             surface_SetDrawColor( red, green, math.min(red, green), 64 )
--             surface_DrawRect( 2, 2, w - 4, h - 4 )
--         end
--     end

-- 	self.Label = self:Add("DLabel")
-- 	self.Label:SetMouseInputEnabled( true )
-- 	self.Label.DoClick = function() self:Toggle() end

--     self.alpha = 0

--     self:SetFont( "mgui_small" )
--     self:SetTextColor( color_white )
-- end

-- function PANEL:SetDark( b )
-- 	self.Label:SetDark( b )
-- end

-- function PANEL:SetBright( b )
-- 	self.Label:SetBright( b )
-- end

-- function PANEL:SetConVar( cvar )
-- 	self.Button:SetConVar( cvar )
-- end

-- function PANEL:SetValue( val )
-- 	self.Button:SetValue( val )
-- end

-- function PANEL:SetChecked( val )
-- 	self.Button:SetChecked( val )
-- end

-- function PANEL:GetChecked( val )
-- 	return self.Button:GetChecked()
-- end

-- function PANEL:Toggle()
-- 	self.Button:Toggle()
-- end

-- function PANEL:PerformLayout()
-- 	local x = self.m_iIndent or 0

-- 	self.Button:SetSize( 15, 15 )
-- 	self.Button:SetPos( x, math.floor( ( self:GetTall() - self.Button:GetTall() ) / 2 ) )

-- 	self.Label:SizeToContents()
-- 	self.Label:SetPos( x + self.Button:GetWide() + 4, math.floor( ( self:GetTall() - self.Label:GetTall() ) / 2 ) )
-- end

-- function PANEL:SetTextColor( color )
-- 	self.Label:SetTextColor( color )
-- end

-- function PANEL:SizeToContents()
-- 	self:InvalidateLayout( true ) -- Update the size of the DLabel and the X offset
-- 	self:SetWide( self.Label.x + self.Label:GetWide() )
-- 	self:SetTall( math.max( self.Button:GetTall(), self.Label:GetTall() ) )
-- 	self:InvalidateLayout() -- Update the positions of all children
-- end

-- function PANEL:SetText( text )
-- 	self.Label:SetText( text )
-- 	self:SizeToContents()
-- end

-- function PANEL:SetFont( font )
-- 	self.Label:SetFont( font )
-- 	self:SizeToContents()
-- end

-- function PANEL:GetText()
-- 	return self.Label:GetText()
-- end

-- function PANEL:Paint( w, h )
-- end

-- function PANEL:OnChange( bVal )
-- end


-- vgui.Register("mgui_checkboxlabel", PANEL, "DPanel")