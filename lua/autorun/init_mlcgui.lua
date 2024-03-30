sdk.walker.include("mlc-gui")

-- if CLIENT then
--     local background = vgui.Create("MLC_Background")
--     background:SetHide( true )
--     background:MouseInput()
--     timer.Simple(2, function()
--         background:Hide()
--     end)
-- end

--[[

------------------------------------------------------------------------------------------------------------------------

local PANEL = {}

function PANEL:Init()
end

function PANEL:Paint( w, h )
end

vgui.Register("MLC_", PANEL, "")

------------------------------------------------------------------------------------------------------------------------

]]
--
