local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/magbux/RyusaiSH/refs/heads/main/BorealisOfficialSH"))()

local Window = Library.new("Borealis Example 1")

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")

local Config = {
    Spamming = false,
    Message = "Borealis on top!",
    Delay = 1
}

local MainTab = Window:MakeTab("Chat Spam")
local MainSection = MainTab:AddSection()

MainSection:AddLabel("Configuration")

MainSection:AddTextbox({
    Name = "Spam Message",
    Default = "Borealis on top!",
    Placeholder = "Type here...",
    ClearOnFocusLost = false,
    Callback = function(Text)
        Config.Message = Text
    end
})

MainSection:AddSlider({
    Name = "Spam Delay",
    Min = 0,
    Max = 10,
    Default = 1,
    Callback = function(Value)
        Config.Delay = Value
    end
})

MainSection:AddLabel("Activation")

MainSection:AddToggle({
    Name = "Enable Chat Spam",
    Default = false,
    Callback = function(Value)
        Config.Spamming = Value
    end
})

local ThemeTab = Window:MakeTab("UI Theme")
local ThemeSection = ThemeTab:AddSection()

ThemeSection:AddLabel("Customize UI")

ThemeSection:AddColorPicker({
    Name = "Accent Color",
    Default = Color3.fromRGB(60, 180, 255),
    Callback = function(Value)
        
    end
})

ThemeSection:AddKeybind("Toggle UI", Enum.KeyCode.RightControl, function()
    Window:toggle()
end)


task.spawn(function()
    while task.wait() do
        if Config.Spamming and Config.Message ~= "" then
            if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
                local generalChannel = TextChatService.TextChannels:FindFirstChild("RBXGeneral")
                if generalChannel then
                    generalChannel:SendAsync(Config.Message)
                end
            else
                ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Config.Message, "All")
            end
            task.wait(Config.Delay)
        end
    end
end)
