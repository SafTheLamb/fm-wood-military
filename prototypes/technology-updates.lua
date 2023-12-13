local Technology = require("__stdlib__.stdlib.data.technology")
local modutil = require("modutil")

local military1 = Technology("military")
local military2 = Technology("military-2")

if settings.startup["wood-military-smg-ammo"].value == "item" then
  military1:add_effect("firearm-magazine")
end

if settings.startup["wood-military-shotgun-ammo"].value == "item" then
  military1:add_effect("wood-shotgun-shell")
  military1:remove_effect("shotgun-shell")
  military2:add_effect("shotgun-shell")
end

if modutil.sniper_rifle and settings.startup["wood-military-sniper-ammo"].value == "item" then
  military1:add_effect("wood-bolts-magazine")
  military1:add_effect("carbine-rifle")
  military2:remove_effect("carbine-rifle")
end
