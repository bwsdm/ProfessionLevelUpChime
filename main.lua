local frame = CreateFrame("Frame")

local function playTrack()
	PlaySoundFile("Interface\\Addons\\ProfessionLevelUpChime\\Sounds\\coin.mp3")
end

frame:RegisterEvent("CHAT_MSG_SKILL")
frame:SetScript("OnEvent", function(self, event, ...)
	local args = { ... }
	local professionList = {
		"Mining",
		"Skinning",
		"Herbalism",
		"Fishing",
		"Enchanting",
		"Leatherworking",
		"Tailoring",
		"Engineering",
		"Blacksmithing",
		"Cooking",
		"First Aid",
		"Alchemy",
	}
	for k in pairs(professionList) do
		if string.find(args[1], professionList[k]) then
			playTrack()
		end
	end
end)
