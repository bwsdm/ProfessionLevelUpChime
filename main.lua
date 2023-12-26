local frame = CreateFrame("Frame")
frame:RegisterEvent("CHAT_MSG_SKILL")

local popupFrame = CreateFrame("Frame")
popupFrame:SetSize(300, 100)
popupFrame:SetPoint("TOPRIGHT")
popupFrame:Hide()

popupFrame.text = popupFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
popupFrame.text:SetAllPoints(true)

local matchedProfession

local function playTrack()
	PlaySoundFile("Interface\\Addons\\ProfessionLevelUpChime\\Sounds\\coin.mp3")
end

frame:SetScript("OnEvent", function(self, event, ...)
	local args = { ... }

	local skillName, currentSkill, maxSkill = string.match(args[1], "(.+) increases to (%d+)/(%d+)")
	print("Skill: " .. skillName .. "CurrentLevel: " .. currentSkill .. "MaxLevel: " .. maxSkill)
	if skillName and currentSkill and maxSkill then
		local formattedMessage = skillName .. "has reached" .. currentSkill .. "!"
		popupFrame.text:SetText(formattedMessage)
		popupFrame:Show()
		playTrack()

		C_Timer.After(3, function()
			popupFrame:Hide()
		end)
	end

	--	local professionList = {
	--		"Mining",
	--		"Skinning",
	--		"Herbalism",
	--		"Fishing",
	--		"Enchanting",
	--		"Leatherworking",
	--		"Tailoring",
	--		"Engineering",
	--		"Blacksmithing",
	--		"Cooking",
	--		"First Aid",
	--		"Alchemy",
	--	}
	--  for _, profession in ipairs(professionList) do
	--    local _, _, matchedProfessionResult = string.find(args[1], profession)
	--    if matchedProfessionResult then
	--      matchedProfession = matchedProfessionResult  -- Set the global variable
	--      print("Profession found:", matchedProfession)
	--      playTrack()
	--      -- If you want to stop checking for other professions after the first match, you can break the loop here.
	--      -- break
	--    end
	--  end
end)

popupFrame:SetScript("OnShow", function(self)
	self:SetAlpha(1)
	self.fadeOut = self:CreateAnimationGroup()
	local fadeOut = self.fadeOut:CreateAnimation("Alpha")
	fadeOut:SetFromAlpha(1)
	fadeOut:SetToAlpha(0)
	fadeOut:SetDuration(1)
	fadeOut:SetScript("OnFinished", function()
		self:Hide()
	end)
	self.fadeOut:Play()
end)
