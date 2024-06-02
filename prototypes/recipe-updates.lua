local Recipe = require("__stdlib__.stdlib.data.recipe")
local modutil = require("modutil")

local wood_cost = settings.startup["wood-military-ammo-cost"].value

-- Pistol/smg ammo ---------------------------------------------------------------------------------
if settings.startup["wood-military-smg-ammo"].value == "item" then
  Recipe("firearm-magazine"):set_enabled(false)
  Recipe("firearm-magazine"):add_ingredient({"wood-darts-magazine", 1})
  if settings.startup["wood-military-hard-mode"].value then
    -- in hard mode, add copper to represent casing, and make vanilla ammo cost steel
    Recipe("wood-darts-magazine"):add_ingredient({"copper-plate", 1})
    if not modutil.brass then
      -- can only do this when adding wood ammo, otherwise base ammo isn't craftable until steel is researched
      Recipe("firearm-magazine"):add_ingredient({"steel-plate", 1})
    end
  end
elseif settings.startup["wood-military-smg-ammo"].value == "recipe" then
  -- only add wood to vanilla ammo item
  Recipe("firearm-magazine"):add_ingredient({"wood", wood_cost})
  if settings.startup["wood-military-hard-mode"].value then
    -- in hard mode, add copper to represent casing
    if not modutil.brass then
      Recipe("firearm-magazine"):add_ingredient({"copper-plate", 1})
    end
  end
end

if settings.startup["wood-military-hard-mode"].value then
  -- in hard mode, Military 1 needs steel, and Military 2 needs plastic
  Recipe("submachine-gun"):replace_ingredient("iron-plate", "steel-plate")
  Recipe("piercing-rounds-magazine"):add_ingredient({"plastic-bar", 2})
  if modutil.wood_logistics and data.raw.item["basic-gear-wheel"] then
    Recipe("pistol"):replace_ingredient("copper-plate", "basic-gear-wheel")
  end
end

-- Shotgun ammo ------------------------------------------------------------------------------------
if settings.startup["wood-military-shotgun-ammo"].value == "item" then
  -- try and avoid 4 item cost for vanilla shotgun shells
  -- (Goal: 2 item types for wood ammo, 3 item types for vanilla, 4 item types for piercing)
  if modutil.brass then
    Recipe("shotgun-shell"):replace_ingredient("copper-plate", {"wood-shotgun-shell", 1})
  else
    Recipe("shotgun-shell"):add_ingredient({"wood-shotgun-shell", 1})
  end

  if settings.startup["wood-military-hard-mode"].value then
    Recipe("wood-shotgun-shell"):add_ingredient({"copper-plate", 1})
    if not modutil.brass then
      Recipe("shotgun-shell"):replace_ingredient("copper-plate", "plastic-bar")
    end
  end
elseif settings.startup["wood-military-shotgun-ammo"].value == "recipe" then
  Recipe("shotgun-shell"):add_ingredient({"wood", wood_cost})
end

if settings.startup["wood-military-hard-mode"].value then
  Recipe("shotgun"):replace_ingredient("iron-plate", "steel-plate")
  Recipe("piercing-shotgun-shell"):add_ingredient({"plastic-bar", 4})
end

-- Sniper rifle ammo -------------------------------------------------------------------------------
if modutil.sniper_rifle then
  if settings.startup["wood-military-sniper-ammo"].value == "item" then
    Recipe("sniper-magazine-1"):add_ingredient({"wood-bolts-magazine", 1})
    if settings.startup["wood-military-hard-mode"].value then
      Recipe("wood-bolts-magazine"):add_ingredient({"copper-plate", 1})
    end
  elseif modutil.sniper_rifle and settings.startup["wood-military-sniper-ammo"].value == "recipe" then
    Recipe("rifle-magazine"):add_ingredient({"wood", 2*wood_cost})
  end

  if settings.startup["wood-military-hard-mode"].value then
    Recipe("sniper-magazine-1"):replace_ingredient("copper-plate", modutil.brass and "brass-plate" or "plastic-bar")
    Recipe("sniper-magazine-2"):add_ingredient({"plastic-bar", 4})
    Recipe("sniper-magazine-2"):replace_ingredient("sniper-magazine-1", {"sniper-magazine-1", 1})
    Recipe("sniper-magazine-2").results = {{"sniper-magazine-2", 1}}
  end
end

-- Armor -------------------------------------------------------------------------------------------
if settings.startup["wood-military-armor"].value == "item" then
  if modutil.aai_industry then
    Recipe("light-armor"):add_ingredient({"wood-armor", 1})
  end
  if settings.startup["wood-military-hard-mode"].value then
    Recipe("wood-armor"):add_ingredient({"copper-plate", 10})
  end
elseif settings.startup["wood-military-armor"].value == "recipe" then
  Recipe("light-armor"):add_ingredient({"wood", 20})
end

if settings.startup["wood-military-armor"].value == "item" or settings.startup["wood-military-hard-mode"].value then
  Recipe("light-armor"):set_enabled(false)
end

if settings.startup["wood-military-hard-mode"].value then
  Recipe("light-armor"):replace_ingredient("iron-plate", "copper-plate")
  Recipe("light-armor"):add_ingredient({"steel-plate", 10})
  Recipe("heavy-armor"):add_ingredient({"plastic-bar", 50})
end

