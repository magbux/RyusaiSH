local LibraryURL = "https://raw.githubusercontent.com/magbux/RyusaiSH/refs/heads/main/RyusaiOfficialSH"
local success, Library = pcall(function() 
    return loadstring(game:HttpGet(LibraryURL))() 
end)

if not success then
    warn("Failed to load Library!")
    return
end

local Window = Library.new("Example Script TuT (Check The Console)")

local Config = {
    ExampleToggle = false,
    ExampleSlider = 50,
    ExampleDropdown = "Option 1"
}

local MainTab = Window:MakeTab("Main")
local MainSection = MainTab:AddSection()

MainSection:AddButton({
    Name = "Example Button",
    Callback = function()
        print("Button was clicked!")
        print("This is how you make a button trigger code")
    end
})

MainSection:AddToggle({
    Name = "Example Toggle",
    Default = false,
    Callback = function(Value)
        Config.ExampleToggle = Value
        print("Toggle is now:", Value)
        if Value then
            print("Toggle turned ON!")
        else
            print("Toggle turned OFF!")
        end
    end
})

MainSection:AddDropdown({
    Name = "Example Dropdown",
    Default = "Option 1",
    Items = {"Option 1", "Option 2", "Option 3"},
    Callback = function(Value)
        Config.ExampleDropdown = Value
        print("Dropdown selected:", Value)
    end
})

MainSection:AddSlider({
    Name = "Example Slider",
    Min = 0,
    Max = 100,
    Default = 50,
    Callback = function(Value)
        Config.ExampleSlider = Value
        print("Slider value is now:", Value)
    end
})

MainSection:AddKeybind("Example Keybind", Enum.KeyCode.F, function()
    print("You pressed the F key!")
    print("Keybinds let you trigger functions with keyboard keys")
end)

local TutorialTab = Window:MakeTab("Tutorial")
local TutorialSection = TutorialTab:AddSection()

TutorialSection:AddButton({
    Name = "How to use AddButton",
    Callback = function()
        print("=== ADDBUTTON TUTORIAL ===")
        print("Syntax: Section:AddButton({Name = 'ButtonName', Callback = function() ... end})")
        print("Use buttons to trigger one-time actions like teleporting or resetting")
        print("Everything inside Callback function() runs when the button is clicked")
    end
})

TutorialSection:AddButton({
    Name = "How to use AddToggle",
    Callback = function()
        print("=== ADDTOGGLE TUTORIAL ===")
        print("Syntax: Section:AddToggle({Name = 'ToggleName', Default = false, Callback = function(Value) ... end})")
        print("Value will be true when ON, false when OFF")
        print("Use toggles for features that need to stay on/off like God Mode or Fly")
        print("The Callback runs every time you toggle it")
    end
})

TutorialSection:AddButton({
    Name = "How to use AddSlider",
    Callback = function()
        print("=== ADDSLIDER TUTORIAL ===")
        print("Syntax: Section:AddSlider({Name = 'SliderName', Min = 0, Max = 100, Default = 50, Callback = function(Value) ... end})")
        print("Value is the number from Min to Max that the slider is set to")
        print("Use sliders for values that change like WalkSpeed, JumpPower, or Volume")
    end
})

TutorialSection:AddButton({
    Name = "How to use AddDropdown",
    Callback = function()
        print("=== ADDDROPDOWN TUTORIAL ===")
        print("Syntax: Section:AddDropdown({Name = 'DropdownName', Default = 'Option 1', Items = {...}, Callback = function(Value) ... end})")
        print("Items is a table of options to choose from")
        print("Value is the selected option as a string")
        print("Use dropdowns for selecting between multiple choices")
    end
})

TutorialSection:AddButton({
    Name = "How to use AddKeybind",
    Callback = function()
        print("=== ADDKEYBIND TUTORIAL ===")
        print("Syntax: Section:AddKeybind('BindName', Enum.KeyCode.KEYNAME, function() ... end)")
        print("This triggers code when you press a keyboard key")
        print("Common keys: F, E, R, T, G, H, etc")
        print("Find all keys at: https://create.roblox.com/docs/reference/engine/enums/KeyCode")
    end
})

TutorialSection:AddButton({
    Name = "How to use Config Variables",
    Callback = function()
        print("=== CONFIG VARIABLES TUTORIAL ===")
        print("Store values in Config table to use them across your script")
        print("Example: Config = { MyValue = 0 }")
        print("Access with: Config.MyValue")
        print("Update with: Config.MyValue = NewValue")
        print("This way toggles and sliders can control features everywhere in script")
    end
})

TutorialSection:AddButton({
    Name = "How to use task.spawn loops",
    Callback = function()
        print("=== TASK.SPAWN LOOP TUTORIAL ===")
        print("Use task.spawn(function() to run code in background")
        print("while task.wait(seconds) do ... end makes it repeat forever")
        print("Check Config values inside loop to apply changes continuously")
        print("Example: if Config.ExampleToggle then ... end")
    end
})

TutorialSection:AddButton({
    Name = "Print Debug Messages",
    Callback = function()
        print("=== PRINTING TUTORIAL ===")
        print("Use: print('message') to see output in console")
        print("Open console with F9 in Roblox Studio")
        print("Print values to debug: print('Value is:', myVariable)")
        print("This helps you understand what your code is doing!")
    end
})
