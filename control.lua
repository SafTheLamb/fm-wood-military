local modutil = require("modutil")

local function on_init()
  -- respawn with wood ammo instead
  if settings.startup["wood-military-smg-ammo"] == "item" then
    if remote.interfaces["freeplay"] then
      local respawn_items = remote.call("freeplay", "get_respawn_items")
      respawn_items["wood-bolts-magazine"] = respawn_items["firearm-magazine"]
      respawn_items["firearm-magazine"] = nil
      remote.call("freeplay", "set_respawn_items", respawn_items)
    end
  end
end

local function on_configuration_changed()
  if modutil.sniper_rifle then
    for _,force in pairs(game.forces) do
      -- run sniper rifle migrations here instead, since migrations don't rerun when other mods are installed
      local technology = force.technologies
      local recipes = force.recipes

      local military1 = technology["military"].researched
      local military2 = technology["military-2"].researched

      if settings.startup["wood-military-sniper-ammo"].value == "item" then
        recipes["wood-bolts-magazine"].enabled = military1
        recipes["carbine-rifle"].enabled = military1
      else
        recipes["carbine-rifle"].enabled = military2
      end

      if settings.startup["wood-military-artillery"].value then
        recipes["wood-artillery-shell"].enabled = technology["artillery"].researched
      end
    end
  end
end

script.on_init(on_init)
script.on_configuration_changed(on_configuration_changed)
