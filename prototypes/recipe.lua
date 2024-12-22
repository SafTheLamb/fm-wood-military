local wood_cost = settings.startup["wood-military-ammo-cost"].value
local chip_item = mods["wood-industry"] and "woodchips" or "wood"

local lumber_item = "wood"
local recipe_category = "crafting"
if mods["wood-logistics"] then
  if settings.startup["wood-logistics-lumber"].value then
    lumber_item = "lumber"
  end
  if settings.startup["wood-logistics-lumber-mill"].value then
    recipe_category = "crafting-or-carpentry"
  end
end

-------------------------------------------------------------------------- Pistol/smg ammo

if settings.startup["wood-military-smg-ammo"].value then
  data:extend({
    {
      type = "recipe",
      name = "wood-darts-magazine",
      category = recipe_category,
      energy_required = 1,
      ingredients = {{type="item", name="wood", amount=wood_cost}},
      results = {{type="item", name="wood-darts-magazine", amount=1}}
    }
  })
end

-------------------------------------------------------------------------- Shotgun ammo

if settings.startup["wood-military-shotgun-ammo"].value then
  data:extend({
    {
      type = "recipe",
      name = "wood-shotgun-shell",
      category = recipe_category,
      enabled = false,
      energy_required = 1,
      ingredients = {{type="item", name=chip_item, amount=wood_cost}},
      results = {{type="item", name="wood-shotgun-shell", amount=1}}
    }
  })
end

-------------------------------------------------------------------------- Sniper rifle ammo

if mods["sniper-rifle-improved"] and settings.startup["wood-military-sniper-ammo"].value then
  data:extend({
    {
      type = "recipe",
      name = "wood-bolts-magazine",
      category = recipe_category,
      enabled = false,
      energy_required = 1,
      ingredients = {
        {type="item", name=lumber_item, amount=wood_cost},
        mods["aai-industry"] and {type="item", name="iron-stick", amount=1} or {type="item", name="iron-plate", amount=1}
      },
      results = {{type="item", name="wood-bolts-magazine", amount=1}}
    }
  })
end

-------------------------------------------------------------------------- Rockets

if settings.startup["wood-military-rockets"].value then
  data:extend({
    {
      type = "recipe",
      name = "scorpion-bolt",
      enabled = false,
      energy_required = 1,
      ingredients = {
        {type="item", name="coal", amount=5},
        {type="item", name=lumber_item, amount=2}
      },
      results = {{type="item", name="scorpion-bolt", amount=1}}
    },
    {
      type = "recipe",
      name = "splinter-bolt",
      enabled = false,
      energy_required = 2,
      ingredients = {
        {type="item", name="scorpion-bolt", amount=1},
        {type="item", name="explosives", amount=1}
      },
      results = {{type="item", name="splinter-bolt", amount=1}}
    }
  })
end

-------------------------------------------------------------------------- Artillery shell

if settings.startup["wood-military-artillery"].value then
  data:extend({
    {
      type = "recipe",
      name = "wood-artillery-shell",
      category = recipe_category,
      enabled = false,
      energy_required = 3,
      ingredients = {
        {type="item", name=lumber_item, amount=2*wood_cost},
        {type="item", name="copper-plate", amount=2},
        {type="item", name="electronic-circuit", amount=1}
      },
      results = {{type="item", name="wood-artillery-shell", amount=1}}
    }
  })
end

-------------------------------------------------------------------------- Armor

if settings.startup["wood-military-armor"].value then
  data:extend({
    {
      type = "recipe",
      name = "wood-armor",
      energy_required = 3,
      ingredients = {{type="item", name="wood", amount=20}},
      results = {{type="item", name="wood-armor", amount=1}}
    }
  })
end
