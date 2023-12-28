local frame = CreateFrame("Frame")
frame:RegisterEvent("CHAT_MSG_SKILL")

local popupFrame = CreateFrame("Frame")
popupFrame:SetSize(300, 100)
popupFrame:SetPoint("TOP")
popupFrame:Hide()

popupFrame.text = popupFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
popupFrame.text:SetAllPoints(true)

local function playTrack()
	PlaySoundFile("Interface\\Addons\\ProfessionLevelUpChime\\Sounds\\coin.mp3")
end

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
	for _, profession in ipairs(professionList) do
		local matchedProfessionResult, _ = string.find(args[1], profession)
		if matchedProfessionResult then
			local skillName, currentSkill = string.match(args[1], "(.+) has increased to (%d+)")
			if skillName and currentSkill then
				local formattedMessage = skillName .. " has reached " .. currentSkill .. "!"
				popupFrame.text:SetText(formattedMessage)
				popupFrame:Show()
				playTrack()
			end
		end
	end
end)

popupFrame:SetScript("OnShow", function(self)
	self:SetAlpha(1)
	self.fadeOut = self:CreateAnimationGroup()
	local fadeOut = self.fadeOut:CreateAnimation("Alpha")
	fadeOut:SetFromAlpha(1)
	fadeOut:SetToAlpha(0)
	fadeOut:SetDuration(2.5)
	fadeOut:SetScript("OnFinished", function()
		self:Hide()
	end)
	self.fadeOut:Play()
end)
