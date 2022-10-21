
GatherMate2_HideNodes = LibStub("AceAddon-3.0"):NewAddon("GatherMate2_HideNodes", "AceConsole-3.0", "AceEvent-3.0", "AceComm-3.0")
Lang = LibStub("AceLocale-3.0"):GetLocale("GatherMate2_HideNodes")
	
function NodeToggle()
	GatherMate2.db.profile["showWorldMap"] = not GatherMate2.db.profile["showWorldMap"]
	GatherMate2:GetModule("Config"):UpdateConfig()
end

function Button()
	if IsAddOnLoaded("Questie") then
		if Questie.db.global.mapShowHideEnabled then
			GatherMate2_Toggle_Nodes:SetPoint("RIGHT", "WorldMapFrameCloseButton", "LEFT", "-125", "0")
		else
			GatherMate2_Toggle_Nodes:SetPoint("RIGHT", "WorldMapFrameCloseButton", "LEFT", "0", "0")
		end
	end
	if IsAddOnLoaded("ElvUI") then
		local E, _, V, P, G = unpack(ElvUI)
		local S = E:GetModule('Skins')
		
		S:HandleButton(_G.GatherMate2_Toggle_Nodes)
	end
	if GatherMate2.db.profile.showWorldMap then
		GatherMate2_Toggle_Nodes:SetText(Lang["Hide Nodes"])
	else
		GatherMate2_Toggle_Nodes:SetText(Lang["Show Nodes"])
	end
end

WorldMapFrame:HookScript("OnUpdate", Button)
