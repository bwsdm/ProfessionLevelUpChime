local frame = CreateFrame("Frame")

local function playTrack()
	PlaySoundFile(".\\Sounds\\sogne.mp3")
end

frame:RegisterEvent("CHAT_MSG_SKILL")
frame:SetScript("OnEvent", function(self, event, ...)
	playTrack()
end)
