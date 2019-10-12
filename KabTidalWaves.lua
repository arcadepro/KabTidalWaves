local f 		= CreateFrame("Frame")
local spellID 		= 53390 -- Tidal Waves
local texturePath 	= 592058 -- GetFileIDFromPath("TEXTURES\\SPELLACTIVATIONOVERLAYS\\SURGE_OF_DARKNESS") -- 592058
local scale		= 1
local r,g,b		= 60, 255, 200

local function overlayOn(tidalstacks)
	if tidalstacks == 1 then
		--print("1 tidal stack")
		SpellActivationOverlay_ShowOverlay(SpellActivationOverlayFrame, spellID, texturePath, "LEFT", scale, r, g, b, false, false)	-- left on
		SpellActivationOverlay_ShowOverlay(SpellActivationOverlayFrame, spellID, "", "RIGHT", scale, 0, 0, 0, false, true)			-- right off
	elseif tidalstacks == 2 then
		--print("2 tidal stacks")
		SpellActivationOverlay_ShowOverlay(SpellActivationOverlayFrame, spellID, texturePath, "LEFT", scale, r, g, b, false, false)	-- left on
		SpellActivationOverlay_ShowOverlay(SpellActivationOverlayFrame, spellID, texturePath, "RIGHT", scale, r, g, b, false, true)	-- right on
	end
end

local function overlayOff()
	SpellActivationOverlay_HideOverlays(SpellActivationOverlayFrame, spellID) -- both off
end

f:SetScript("OnEvent", function(self, event, ...)
	local _, _, count = AuraUtil.FindAuraByName("Tidal Waves", "player", "HELPFUL")
	if count then
		overlayOn(count)
	else
		overlayOff()
	end
end)

f:RegisterUnitEvent("UNIT_AURA", "player")
