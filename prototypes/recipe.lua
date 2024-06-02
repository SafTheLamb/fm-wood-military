local modutil = require("modutil")

local wood_cost = settings.startup["wood-military-ammo-cost"].value

-- Pistol/smg ammo ---------------------------------------------------------------------------------
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

-- Shotgun ammo ------------------------------------------------------------------------------------
if settings.startup["wood-military-shotgun-ammo"].value == "item" then
  data:extend({
    {
      type = "recipe",
      name = "wood-shotgun-shell",
      enabled = false,
      energy_required = 1,
      ingredients = {modutil.growtorio and {"woodchips", 2*wood_cost} or {"wood", wood_cost}},
      result = "wood-shotgun-shell",
      result_count = 1
    }
  })
end

-- Sniper rifle ammo -------------------------------------------------------------------------------
if modutil.sniper_rifle and settings.startup["wood-military-sniper-ammo"].value == "item" then
  data:extend({
    {
      type = "recipe",
      name = "wood-bolts-magazine",
      enabled = false,
      energy_required = 1,
      ingredients = {{"wood", 2*wood_cost}, {"iron-stick", 1}},
      result = "wood-bolts-magazine",
      result_count = 1
    }
  })
end

-- Artillery shell ---------------------------------------------------------------------------------
if settings.startup["wood-military-artillery"].value then
  data:extend({
    {
      type = "recipe",
      name = "wood-artillery-shell",
      enabled = false,
      energy_required = 3,
      ingredients = {{"wood", 8*wood_cost}, {"copper-plate", 2}, {"electronic-circuit", 1}},
      result = "wood-artillery-shell",
      result_count = 1
    }
  })
end

-- Armor -----------------------------------------------------------------------------------------
if settings.startup["wood-military-armor"].value == "item" then
  data:extend({
    {
      type = "recipe",
      name = "wood-armor",
      energy_required = 3,
      ingredients = {{"wood", 20}},
      result = "wood-armor",
      result_count = 1
    }
  })
end
