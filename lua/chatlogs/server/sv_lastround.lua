-- This saves the last registered round to a .json file to set as
-- "Last round from previous map" when the server restarts or
-- the map changes

Chatlog.LastRoundPrevMap = {}

hook.Add("TTTEndRound", "ChatlogLastRound", function()
	file.Write("chatlog/chatlog_lastroundmap.json", util.TableToJSON(Chatlog.Rounds[GetGlobalInt("ChatlogRoundNumber")]))
end)

if file.Exists("chatlog/chatlog_lastroundmap.json", "DATA") then
    Chatlog.LastRoundPrevMap = util.JSONToTable(file.Read("chatlog/chatlog_lastroundmap.json", "DATA"))
    SetGlobalBool("ChatlogLastMapExists", true)
    file.Delete("chatlog/chatlog_lastroundmap.json", "DATA")
else
    SetGlobalBool("ChatlogLastMapExists", false)
end