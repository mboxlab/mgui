local PANEL = {}

AccessorFunc( PANEL, "vg_mouseinput", "MouseInput", FORCE_BOOL )

function PANEL:Init()
    self:SetSize(ScrW(), ScrH())
end

do
    local blur = Material("pp/blurscreen")

    local bSetFloat = blur.SetFloat
    local bRecompute = blur.Recompute

    local pGetAlpha = FindMetaTable("Panel").GetAlpha

    local render_UpdateScreenEffectTexture = render.UpdateScreenEffectTexture
    local surface_SetMaterial = surface.SetMaterial
    local surface_SetDrawColor = surface.SetDrawColor
    local surface_DrawTexturedRect = surface.DrawTexturedRect
    local surface_DrawRect = surface.DrawRect

    function PANEL:Paint(w, h)
        bSetFloat(blur, "$blur", pGetAlpha(self) / 64)
        bRecompute(blur)

        render_UpdateScreenEffectTexture()
        surface_SetMaterial(blur)
        surface_SetDrawColor(255, 255, 255, 255)
        surface_DrawTexturedRect(0, 0, w, h)

        surface_SetDrawColor(32, 32, 32, 240)
        surface_DrawRect(0, 0, w, h)
    end
end

do
    local animDur = 0.12
    local animHide = function(_,self)
        self:SetVisible(false)
        if self.vg_mouseinput then
            self:SetMouseInputEnabled(false)
            gui.EnableScreenClicker(false)
        end
    end

    function PANEL:Show()
        self:SetVisible(true)
        self:Stop()
        self:AlphaTo(255, animDur)

        if self.vg_mouseinput then
            self:SetMouseInputEnabled(true)
            gui.EnableScreenClicker(true)
        end
    end

    function PANEL:Hide()
        self:Stop()
        self:AlphaTo(0, animDur, nil, animHide)
    end
end

vgui.Register("mgui_background", PANEL, "DPanel")