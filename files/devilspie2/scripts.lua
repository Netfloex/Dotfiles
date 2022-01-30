
debug_print("Window Class: " .. get_window_class())

local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end


local maximizedApplications = {"Ferdi", "discord", "Code", "kitty", "Chromium"}
local leftMonitorApplications = {"Ferdi", "discord"}
local rightMonitorApplications = {"Code", "kitty", "Chromium"}


if (has_value(maximizedApplications, get_window_class())) then
	maximize();
end

if (has_value(leftMonitorApplications, get_window_class())) then
	set_window_position(0,0,2)
end

if (has_value(rightMonitorApplications, get_window_class())) then
	set_window_position(0,0,1)
end


