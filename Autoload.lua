-- // Services
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TeleportService = game:GetService("TeleportService")

-- // Vars
local LocalPlayer = Players.LocalPlayer

local AutofarmScriptURL = ""
local AutoloadScripttURL = ""

-- // Launch the script
loadstring(game:HttpGet(AutofarmScriptURL))()

-- // Rejoin on kick
CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
    if (child.Name == "ErrorPrompt" and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame")) then
        -- // Rejoin
        TeleportService:Teleport(game.PlaceId)
    end
end)

-- // When teleported, execute this script again
LocalPlayer.OnTeleport:Connect(function(State)
    if (State == Enum.TeleportState.Started) then
        syn.queue_on_teleport(game:HttpGet(AutoloadScripttURL))
    end
end)