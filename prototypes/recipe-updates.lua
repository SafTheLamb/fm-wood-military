local Recipe = require("__stdlib__.stdlib.data.recipe")
local modutil = require("modutil")

local wood_cost = settings.startup["wood-military-ammo-cost"].value

if settings.startup["wood-military-smg-ammo"].value == "item" then
  local smg_ammo_recipe = Recipe("firearm-magazine")
  smg_ammo_recipe:set_enabled(false)
  smg_ammo_recipe:add_ingredient({"wood-darts-magazine", 1})
elseif settings.startup["wood-military-smg-ammo"].value == "recipe" then
  Recipe("firearm-magazine"):add_ingredient({"wood", wood_cost})
end

if settings.startup["wood-military-shotgun-ammo"].value == "item" then
  Recipe("shotgun-shell"):add_ingredient({"wood-shotgun-shell", 1})
elseif settings.startup["wood-military-shotgun-ammo"].value == "recipe" then
  Recipe("shotgun-shell"):add_ingredient({"wood", wood_cost})
end

if modutil.sniper_rifle and settings.startup["wood-military-sniper-ammo"].value == "item" then
  Recipe("rifle-magazine"):add_ingredient({"wood-bolts-magazine", 1})
elseif modutil.sniper_rifle and settings.startup["wood-military-sniper-ammo"].value == "recipe" then
  Recipe("rifle-magazine"):add_ingredient({"wood", 2*wood_cost})
end
