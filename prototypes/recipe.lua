local modutil = require("modutil")

local wood_cost = settings.startup["wood-military-ammo-cost"].value

if settings.startup["wood-military-smg-ammo"].value == "item" then
  data:extend({
    {
      type = "recipe",
      name = "wood-darts-magazine",
      energy_required = 1,
      ingredients = {{"wood", wood_cost}},
      result = "wood-darts-magazine",
      result_count = 1
    }
  })
end

if settings.startup["wood-military-shotgun-ammo"].value == "item" then
  data:extend({
    {
      type = "recipe",
      name = "wood-shotgun-shell",
      enabled = false,
      energy_required = 1,
      ingredients = {{"wood", wood_cost}},
      result = "wood-shotgun-shell",
      result_count = 1
    }
  })
end

if modutil.sniper_rifle and settings.startup["wood-military-sniper-ammo"].value == "item" then
  data:extend({
    {
      type = "recipe",
      name = "wood-bolts-magazine",
      enabled = false,
      energy_required = 2,
      ingredients = {{"wood", 2*wood_cost}, {"iron-stick", 1}},
      result = "wood-bolts-magazine",
      result_count = 2
    }
  })
end
