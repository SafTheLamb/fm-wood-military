local fmut = require("__fdsl__.lib.mutate")
local frep = require("__fdsl__.lib.recipe")

local lumber_item = mods["wood-logistics"] and settings.startup["wood-logistics-lumber"].value and "lumber" or "wood"

-------------------------------------------------------------------------- Damage buffs

if settings.startup["wood-military-damage-buff"].value then
  local damage_increases = {
    {"firearm-magazine", settings={"wood-military-smg-ammo"}, 1},
    {"piercing-rounds-magazine", settings={"wood-military-smg-ammo"}, 1},
    {"shotgun-pellet", settings={"wood-military-shotgun-ammo"}, 1},
    {"piercing-shotgun-pellet", settings={"wood-military-shotgun-ammo"}, 1},
    {"smart-rounds-magazine", mods={"cupric-asteroids"}, settings={"wood-military-smg-ammo", "cupric-asteroids-military"}, 2}
  }

  local function buff_damage_effect(effect, amount)
    if effect.type == "damage" then
      effect.damage.amount = effect.damage.amount + amount
    end
  end

  local function buff_damage_effects(effects, amount)
    for _,effect in ipairs(effects) do
      buff_damage_effect(effect, amount)
    end
    buff_damage_effect(effects, amount)
  end

  local function buff_damage(name, amount)
    local ammo = data.raw.projectile[name] or data.raw.ammo[name].ammo_type
    assert(ammo and ammo.action, string.format("Ammo `%s` does not exist or is missing a damage action", name))
    if ammo.action[1] and ammo.action[1].action_delivery[1] then
      buff_damage_effects(ammo.action[1].action_delivery[1].target_effects, amount)
    elseif ammo.action.action_delivery then
      buff_damage_effects(ammo.action.action_delivery.target_effects, amount)
    end
  end

  fmut.mutate(damage_increases, buff_damage)
end

-------------------------------------------------------------------------- SMG ammo

if settings.startup["wood-military-smg-ammo"].value then
  if settings.startup["wood-military-modify-vanilla"].value then
    frep.add_ingredient("firearm-magazine", {type="item", name="wood-darts-magazine", amount=1})
  end
  frep.replace_ingredient("submachine-gun", "iron-plate", lumber_item)
end

-------------------------------------------------------------------------- Shotgun ammo

if settings.startup["wood-military-shotgun-ammo"].value then
  if settings.startup["wood-military-modify-vanilla"].value then
    frep.add_ingredient("shotgun-shell", {type="item", name="wood-shotgun-shell", amount=1})
  end
  
  frep.replace_ingredient("shotgun", "iron-plate", "steel-plate")
end

-------------------------------------------------------------------------- Rocket ammo

if settings.startup["wood-military-rockets"].value then
  if settings.startup["wood-military-modify-vanilla"].value then
    frep.add_ingredient("rocket", {type="item", name="splinter-bolt", amount=1})
  end
end

-------------------------------------------------------------------------- Armor

if settings.startup["wood-military-armor"].value then
  if frep.get_ingredient("heavy-armor", "light-armor") then
    frep.add_ingredient("light-armor", {type="item", name="wood-armor", amount=1})
  end

  frep.add_ingredient("light-armor", {type="item", name="steel-plate", amount=10})
  frep.add_ingredient("heavy-armor", {type="item", name="plastic-bar", amount=20})
end
