-- // Services
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TeleportService = game:GetService("TeleportService")

-- // Vars
local LocalPlayer = Players.LocalPlayer

local RepositoryURL = "https://raw.githubusercontent.com/ParadoXMOMO/Xafojdofsdfjodsifjooijodjsfi/"
local Branch = "main/"
local AutofarmScript = "Autofarm.txt"
local AutoloadScript = "Justload.lua"

-- // Launch the script
loadstring(game:HttpGet(RepositoryURL .. Branch .. AutofarmScript))()

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
        local Script = game:HttpGet(RepositoryURL .. Branch .. AutoloadScript)
        syn.queue_on_teleport(Script)
    end
end)
