local AccessorFunc = AccessorFunc
local ScrW = ScrW
local ScrH = ScrH
local Material = Material
local render_UpdateScreenEffectTexture = CLIENT and render.UpdateScreenEffectTexture
local surface_SetMaterial = CLIENT and surface.SetMaterial
local surface_SetDrawColor = CLIENT and surface.SetDrawColor
local surface_DrawTexturedRect = CLIENT and surface.DrawTexturedRect
local surface_DrawRect = CLIENT and surface.DrawRect
local vgui_Register = CLIENT and vgui.Register

------------------------------------------------------------------------------------------------------------------------

local PANEL = {}

AccessorFunc( PANEL, "mlc_hide", "Hide", FORCE_BOOL )

function PANEL:Init()
    self:SetSize( ScrW(), ScrH() )
    self:DockPadding(32, 16, 32, 16)

    self:SetAlpha( 0 )
    self:Show()
end

do
    local blur = Material( "pp/blurscreen" )

    function PANEL:Paint( w, h )
        blur:SetFloat( "$blur", self:GetAlpha() / 64 )
        blur:Recompute()

        render_UpdateScreenEffectTexture()
        surface_SetMaterial( blur )
        surface_SetDrawColor( 255, 255, 255, 255 )
        surface_DrawTexturedRect(0, 0, w, h )

        surface_SetDrawColor( 32, 32, 32, 240 )
        surface_DrawRect( 0, 0, w, h )
    end

    PANEL.PaintOld = PANEL.Paint
end

do
    local animDur = 0.14

    local animShowFinish = function( animData, self )
        self:ShowFinish()
    end

    local animHideFinish = function( animData, self )
        if self.mlc_hide then
            self:SetVisible( false )
            self:HideFinish()
        else
            self:HideFinish()
            self:Remove()
        end
    end

    function PANEL:Show()
        if self.mlc_hide then
            self:SetVisible( true )
        end

        self:Stop()
        self:AlphaTo( 255, animDur, _, animShowFinish )
        self:ShowStart()
    end

    function PANEL:Hide()
        self:Stop()
        self:AlphaTo( 0, animDur, nil, animHideFinish )
        self:HideStart()
    end

    function PANEL:ShowStart() end
    function PANEL:ShowFinish() end
    function PANEL:HideStart() end
    function PANEL:HideFinish() end
end

function PANEL:MouseInput()
    self:MakePopup()
    self:SetKeyboardInputEnabled( false )
end

vgui_Register("MLC_Background", PANEL, "DPanel")

------------------------------------------------------------------------------------------------------------------------