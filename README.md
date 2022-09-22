# trbl-hackerman

## NPC trades cryptostick for software.

## Software can be installed on an `empty_usb` stick and in turn used to craft a laptop or something.


### add to your shared/items.lua
```lua
--[[
    you might have some already, just make sure the crafting/combining section is transferred over, eg:
    ['combinable'] = {accept = {'empty_usb'}, reward = 'vpn_usb', anim = {['dict'] = 'anim@amb@business@weed@weed_inspecting_high_dry@', ['lib'] = 'weed_inspecting_high_base_inspector', ['text'] = 'Uploading firmware..', ['timeOut'] = 10000}},
    ]]

    ["hacking_software"] 			= {["name"] = "hacking_software", 			 	["label"] = "Illicit Software", 		["weight"] = 100, 		["type"] = "item", 		["image"] = "software.png", 		["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "hacking software!"},
    ["empty_usb"] 					= {["name"] = "empty_usb", 			 	 		["label"] = "Empty USB", 				["weight"] = 100, 		["type"] = "item", 		["image"] = "usbplugin.png", 		["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Blank USB Device!"},
    ["vpn_software"] 				= {["name"] = "vpn_software", 			 	 	["label"] = "VPN Backdoor", 			["weight"] = 100, 		["type"] = "item", 		["image"] = "software.png", 		["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,    ['combinable'] = {accept = {'empty_usb'}, reward = 'vpn_usb', anim = {['dict'] = 'anim@amb@business@weed@weed_inspecting_high_dry@', ['lib'] = 'weed_inspecting_high_base_inspector', ['text'] = 'Uploading firmware..', ['timeOut'] = 10000}},   ["description"] = "hacking software!"},
    ["boosting_software"] 			= {["name"] = "boosting_software", 			 	["label"] = "Boosting Binaries", 		["weight"] = 100, 		["type"] = "item", 		["image"] = "software.png", 		["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,    ['combinable'] = {accept = {'laptop'}, reward = 'boostinglaptop', anim = {['dict'] = 'anim@amb@business@weed@weed_inspecting_high_dry@', ['lib'] = 'weed_inspecting_high_base_inspector', ['text'] = 'Uploading firmware..', ['timeOut'] = 10000}},   ["description"] = "Laptop Update softare"},
    ["format_software"] 			= {["name"] = "format_software", 			 	["label"] = "Format Cleaner", 			["weight"] = 100, 		["type"] = "item", 		["image"] = "software.png", 		["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,    ['combinable'] = {accept = {'vpn_usb'}, reward = 'empty_usb', anim = {['dict'] = 'anim@amb@business@weed@weed_inspecting_high_dry@', ['lib'] = 'weed_inspecting_high_base_inspector', ['text'] = 'Formatting Device..', ['timeOut'] = 10000}},   ["description"] = "Wipe your dongle!"},
    ["vpn_usb"] 					= {["name"] = "vpn_usb", 			 	 		["label"] = "VPN Dongle", 				["weight"] = 100, 		["type"] = "item", 		["image"] = "vpnusb.png", 		    ["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,    ['combinable'] = {accept = {'laptop'}, reward = 'vpnlaptop', anim = {['dict'] = 'anim@amb@business@weed@weed_inspecting_high_dry@', ['lib'] = 'weed_inspecting_high_base_inspector', ['text'] = 'Connecting..', ['timeOut'] = 10000}},   ["description"] = "Secure VPN Dongle. dont lose me. L"},
    ["vpnlaptop"] 					= {["name"] = "vpnlaptop", 			 	 		["label"] = "Secure Laptop", 			["weight"] = 500, 		["type"] = "item", 		["image"] = "laptop.png", 		    ["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Secured Laptop"},
    ["boostinglaptop"] 				= {["name"] = "boostinglaptop", 			 	["label"] = "Special Laptop", 			["weight"] = 500, 		["type"] = "item", 		["image"] = "toughlaptop.png", 		["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "This laptop has a few dents and scratches\n but is still functional."},
    ['hackerman_accesscard'] 		= {['name'] = 'hackerman_accesscard', 			['label'] = 'Access Card', 			    ['weight'] = 0, 	    ['type'] = 'item', 		['image'] = 'hackerman_accesscard.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'An access card... I wonder what it goes to'},

    note, none of these crafted items actually do anything without needing to tie these items to your other scripts, ie boosting laptop stuff from a carboosting script, and vpn software from my unpublished house robberies script
    ]]
```

###     add to qb-doorlock/configs
```lua
    --[[
        -- hackerspace-maindoor created by Troubleshooter_
        Config.DoorList['hackerspace-hackerspace-maindoor'] = {
            doorRate = 1.0,
            objName = -612979079,
            distance = 2,
            doorType = 'sliding',
            fixText = true,
            doorLabel = 'Club Members Only',
            objYaw = 355.0,
            items = { ['hackerman_accesscard'] = 1 },
            objCoords = vec3(-583.686646, 228.596497, 78.375748),
            locked = true,
        }

    ]]
    ```
