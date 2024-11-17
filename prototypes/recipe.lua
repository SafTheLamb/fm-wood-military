local wood_cost = settings.startup["wood-military-ammo-cost"].value

-- Pistol/smg ammo ---------------------------------------------------------------------------------
if settings.startup["wood-military-smg-ammo"].value then
  data:extend({
    {
      type = "recipe",
      name = "wood-darts-magazine",
      energy_required = 1,
      ingredients = {{type="item", name="wood", amount=wood_cost}},
      results = {{type="item", name="wood-darts-magazine", amount=1}}
    }
  })
end

-- Shotgun ammo ------------------------------------------------------------------------------------
if settings.startup["wood-military-shotgun-ammo"].value then
  data:extend({
    {
      type = "recipe",
      name = "wood-shotgun-shell",
      enabled = false,
      energy_required = 1,
      ingredients = {{type="item", name="wood", amount=wood_cost}},
      results = {{type="item", name="wood-shotgun-shell", amount=1}}
    }
  })
end

-- Sniper rifle ammo -------------------------------------------------------------------------------
if mods["sniper-rifle-improved"] and settings.startup["wood-military-sniper-ammo"].value then
  data:extend({
    {
      type = "recipe",
      name = "wood-bolts-magazine",
      enabled = false,
      energy_required = 1,
      ingredients = {
        {type="item", name="wood", amount=2*wood_cost},
        {type="item", name="iron-stick", amount=1}
      },
      results = {{type="item", name="wood-bolts-magazine", amount=1}}
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
      ingredients = {
        {type="item", name="wood", amount=8*wood_cost},
        {type="item", name="copper-plate", amount=2},
        {type="item", name="electronic-circuit", amount=1}
      },
      results = {{type="item", name="wood-artillery-shell", amount=1}}
    }
  })
end

-- Armor -----------------------------------------------------------------------------------------
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
