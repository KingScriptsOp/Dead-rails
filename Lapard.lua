local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "Dead Hub | Key System",
    Icon = 0,
    LoadingTitle = "Loading.. Dead Hub..",
    LoadingSubtitle = "By {if (diddy); (exit);}",
    Theme = "Default",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = true,
        Foldername = nil,
        Filename = "Dead Hub",
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true,
    },
    Keysystem = false,
    KeySettings = {
        Title = "Dead Hub",
        Subtitle = "Key System",
        Note = "Join the discord server for the key!",
        Filename = "Key",
        SaveKey = true,
        GrabKeyFromSite = true,
        Key = {"DeadHub_ztDXz8rF3LSgAY3qAiu4hT"},
    },
})

local Tab = Window:CreateTab("Main","settings")

-- leaderstats Money setup
local Players    = game:GetService("Players")
local player     = Players.LocalPlayer
local lsFolder   = player:FindFirstChild("leaderstats") 
                or Instance.new("Folder", player)
lsFolder.Name    = "leaderstats"
local moneyStat  = lsFolder:FindFirstChild("Money")
                or (function()
                        local v = Instance.new("IntValue", lsFolder)
                        v.Name = "Money"
                        v.Value = 0
                        return v
                    end)()

-- display label
local MoneyLabel = Tab:CreateLabel("Money: $" .. moneyStat.Value)
moneyStat.Changed:Connect(function(val)
    MoneyLabel:Set("Money: $" .. val)
end)

-- single input that *adds* whatever you type to your Money
Tab:CreateInput({
    Name = "Add Money Amount",
    PlaceholderText = "Enter amount to add",
    RemoveTextAfterFocusLost = true,
    Callback = function(value)
        moneyStat.Value = moneyStat.Value + (tonumber(value) or 0)
    end,
})

-- optional helper if you ever want to script it:
function AddMoney(amount)
    moneyStat.Value = moneyStat.Value + (amount or 0)
end
