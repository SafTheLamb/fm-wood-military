local Recipe = require("__kry_stdlib__.stdlib.data.recipe")

local wood_cost = settings.startup["wood-military-ammo-cost"].value

-- Pistol/smg ammo ---------------------------------------------------------------------------------
if settings.startup["wood-military-smg-ammo"].value then
  Recipe("firearm-magazine"):set_enabled(false)
  Recipe("firearm-magazine"):add_ingredient({type="item", name="wood-darts-magazine", amount=1})
  if settings.startup["wood-military-hard-mode"].value then
    -- in hard mode, add copper to represent casing, and make vanilla ammo cost steel
    Recipe("wood-darts-magazine"):add_ingredient({type="item", name="copper-plate", amount=1})
    Recipe("firearm-magazine"):add_ingredient({type="item", name="steel-plate", amount=1})
  end
end

if settings.startup["wood-military-hard-mode"].value then
  -- in hard mode, Military 1 needs steel, and Military 2 needs plastic
  Recipe("submachine-gun"):replace_ingredient("iron-plate", "steel-plate")
  Recipe("piercing-rounds-magazine"):add_ingredient({type="item", name="plastic-bar", amount=2})
end

-- Shotgun ammo ------------------------------------------------------------------------------------
if settings.startup["wood-military-shotgun-ammo"].value then
  -- try and avoid 4 item cost for vanilla shotgun shells
  -- (Goal: 2 item types for wood ammo, 3 item types for vanilla, 4 item types for piercing)
  Recipe("shotgun-shell"):add_ingredient({type="item", name="wood-shotgun-shell", amount=1})

  if settings.startup["wood-military-hard-mode"].value then
    Recipe("wood-shotgun-shell"):add_ingredient({type="item", name="copper-plate", amount=1})
    Recipe("shotgun-shell"):replace_ingredient("copper-plate", "plastic-bar")
  end
end

if settings.startup["wood-military-hard-mode"].value then
  Recipe("shotgun"):replace_ingredient("iron-plate", "steel-plate")
  Recipe("piercing-shotgun-shell"):add_ingredient({type="item", name="plastic-bar", amount=4})
end

-- Sniper rifle ammo -------------------------------------------------------------------------------
if mods["sniper-rifle-improved"] then
  if settings.startup["wood-military-sniper-ammo"].value then
    Recipe("sniper-magazine-1"):add_ingredient({type="item", name="wood-bolts-magazine", amount=1})
    if settings.startup["wood-military-hard-mode"].value then
      Recipe("wood-bolts-magazine"):add_ingredient({type="item", name="copper-plate", amount=1})
    end
  end

  if settings.startup["wood-military-hard-mode"].value then
    Recipe("sniper-magazine-1"):replace_ingredient("copper-plate", "plastic-bar")
    Recipe("sniper-magazine-2"):add_ingredient({type="item", name="plastic-bar", amount=4})
    Recipe("sniper-magazine-2"):replace_ingredient("sniper-magazine-1", {type="item", name="sniper-magazine-1", amount=1})
    Recipe("sniper-magazine-2").results = {{type="item", name="sniper-magazine-2", amount=1}}
  end
end

-- Armor -------------------------------------------------------------------------------------------
if settings.startup["wood-military-armor"].value then
  if mods["aai-industry"] then
    Recipe("light-armor"):add_ingredient({type="item", name="wood-armor", amount=1})
  end
  if settings.startup["wood-military-hard-mode"].value then
    Recipe("wood-armor"):add_ingredient({type="item", name="copper-plate", amount=10})
  end
end

if settings.startup["wood-military-armor"].value or settings.startup["wood-military-hard-mode"].value then
  Recipe("light-armor"):set_enabled(false)
end

if settings.startup["wood-military-hard-mode"].value then
  Recipe("light-armor"):replace_ingredient("iron-plate", "copper-plate")
  Recipe("light-armor"):add_ingredient({type="item", name="steel-plate", amount=10})
  Recipe("heavy-armor"):add_ingredient({type="item", name="plastic-bar", amount=50})
end
