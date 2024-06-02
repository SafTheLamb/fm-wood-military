local Technology = require("__stdlib__.stdlib.data.technology")
local Recipe = require("__stdlib__.stdlib.data.recipe")
local modutil = require("modutil")

-- Pistol/smg ammo ---------------------------------------------------------------------------------
if settings.startup["wood-military-smg-ammo"].value == "item" then
  Technology("military"):add_effect("firearm-magazine")
end

-- Shotgun ammo ------------------------------------------------------------------------------------
if settings.startup["wood-military-shotgun-ammo"].value == "item" then
  Technology("military"):add_effect("wood-shotgun-shell")
  Recipe("shotgun-shell"):remove_unlock("military") --Technology("military"):remove_effect("shotgun-shell")
  Technology("military-2"):add_effect("shotgun-shell")
end

-- Sniper rifle ammo -------------------------------------------------------------------------------
if modutil.sniper_rifle and settings.startup["wood-military-sniper-ammo"].value == "item" then
  Technology("military"):add_effect("carbine-rifle")
  Technology("military"):add_effect("wood-bolts-magazine")
  Recipe("carbine-rifle"):remove_unlock("military-2") --Technology("military-2"):remove_effect("carbine-rifle")
end

-- Artillery shell ---------------------------------------------------------------------------------
if settings.startup["wood-military-artillery"].value then
  Technology("artillery"):add_effect("wood-artillery-shell")
end

-- Armor -------------------------------------------------------------------------------------------
if settings.startup["wood-military-armor"].value == "item" or settings.startup["wood-military-hard-mode"].value then
  Technology("military"):add_effect("light-armor")
end

if settings.startup["wood-military-hard-mode"].value then
  Technology("heavy-armor"):add_prereq("logistic-science-pack")
  Technology("heavy-armor"):add_prereq("plastics")
  Technology("heavy-armor"):add_pack("logistic-science-pack")
  Technology("heavy-armor").unit.count = 75
end

-- Hard mode ---------------------------------------------------------------------------------------
if settings.startup["wood-military-hard-mode"].value then
  Technology("military"):add_prereq("steel-processing")
  Technology("military").unit.count = 25

  Technology("military-2"):add_prereq("plastics")
  Technology("military-2"):remove_prereq("steel-processing")
  Technology("military-2"):remove_prereq("logistic-science-pack")
  Technology("military-2").unit.count = 50
end
