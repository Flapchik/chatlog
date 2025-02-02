function Chatlog.DrawTextPanel(textPanel, chatlogTab)
	-- Full text panel
	textPanel.frame = vgui.Create("DPanel", chatlogTab)
	textPanel.frame:SetSize(chatlogTab:GetWide() - 15, 45)
	textPanel.frame:SetPos(5,70)
	textPanel.frame:SetBackgroundColor(Color(200,200,200))

	-- Full text title label
	textPanel.label = vgui.Create("DLabel", chatlogTab)
	textPanel.label:SetPos(6,53)
	textPanel.label:SetText(Chatlog.Translate("SelectedMessage"))
	textPanel.label:SetFont("ChatlogMessageLabel")
	textPanel.label:SetColor(Color(0,0,0))
	textPanel.label:SizeToContents()

	-- Full text
	-- We're passing this on to LoadRound() so it can modify the
	-- text whenever we click on a line, and declaring it
	-- as a function so we can clear it when changing rounds
	textPanel.fulltext = vgui.Create("DLabel", textPanel.frame)
	textPanel.fulltext:SetFont("ChatlogMessage")

	textPanel.timestamp = vgui.Create("DLabel", textPanel.frame)
	textPanel.timestamp:SetFont("ChatlogAuthor")

	textPanel.author = vgui.Create("DLabel", textPanel.frame)
	textPanel.author:SetFont("ChatlogAuthor")

	function Chatlog.ClearTextPanel()
		textPanel.fulltext:SetColor(Color(0,0,0))
		textPanel.fulltext:SetSize(chatlogTab:GetWide() - 15, 40)
		textPanel.fulltext:SetWrap(true)
		textPanel.fulltext:SetPos(7, 9)
		textPanel.fulltext:SetText(Chatlog.Translate("SelectedMessageNone"))
		
		textPanel.timestamp:SetColor(Color(0,0,0))
		textPanel.timestamp:SetText("[00:00]")
		textPanel.timestamp:SetPos(7,3)
		textPanel.timestamp:SizeToContents()
		
		textPanel.author:SetText(Chatlog.Translate("Player"))
		textPanel.author:SetColor(Color(0,0,0))
		textPanel.author:SetPos(46,3)
		textPanel.author:SizeToContents()
	end

	Chatlog.ClearTextPanel()
end