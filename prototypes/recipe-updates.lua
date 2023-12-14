local Recipe = require("__stdlib__.stdlib.data.recipe")
local modutil = require("modutil")

local wood_cost = settings.startup["wood-military-ammo-cost"].value

if settings.startup["wood-military-smg-ammo"].value == "item" then
  Recipe("firearm-magazine"):add_unlock("military")
  Recipe("firearm-magazine"):add_ingredient({"wood-darts-magazine", 1})
elseif settings.startup["wood-military-smg-ammo"].value == "recipe" then
  Recipe("firearm-magazine"):add_ingredient({"wood", wood_cost})
end

if settings.startup["wood-military-shotgun-ammo"].value == "item" then
  Recipe("wood-shotgun-shell"):add_unlock("military")
  Recipe("shotgun-shell"):remove_unlock("military")
  Recipe("shotgun-shell"):add_unlock("military-2")
  Recipe("shotgun-shell"):add_ingredient({"wood-shotgun-shell", 1})
elseif settings.startup["wood-military-shotgun-ammo"].value == "recipe" then
  Recipe("shotgun-shell"):add_ingredient({"wood", wood_cost})
end

if modutil.sniper_rifle and settings.startup["wood-military-sniper-ammo"].value == "item" then
  Recipe("carbine-rifle"):add_unlock("military")
  Recipe("wood-bolts-magazine"):add_unlock("military")
  Recipe("carbine-rifle"):remove_unlock("military-2")
  Recipe("sniper-magazine-1"):add_ingredient({"wood-bolts-magazine", 1})
elseif modutil.sniper_rifle and settings.startup["wood-military-sniper-ammo"].value == "recipe" then
  Recipe("rifle-magazine"):add_ingredient({"wood", 2*wood_cost})
end
