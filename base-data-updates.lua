local fmut = require("__fdsl__.lib.mutate")
local frep = require("__fdsl__.lib.recipe")
local ftech = require("__fdsl__.lib.technology")

-------------------------------------------------------------------------- Damage buffs

if settings.startup["wood-military-damage-buff"].value then
  local damage_increases = {
    {"firearm-magazine", settings={"wood-military-smg-ammo"}, 1},
    {"piercing-rounds-magazine", settings={"wood-military-smg-ammo"}, 1},
    {"shotgun-pellet", settings={"wood-military-shotgun-ammo"}, 1},
    {"piercing-shotgun-pellet", settings={"wood-military-shotgun-ammo"}, 1}
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
    if ammo.action[1] and ammo.action[1].action_delivery[1] then
      buff_damage_effects(ammo.action[1].action_delivery[1].target_effects, amount)
    elseif ammo.action.action_delivery then
      buff_damage_effects(ammo.action.action_delivery.target_effects, amount)
    end
  end

  fmut.mutate(damage_increases, buff_damage)
end

-------------------------------------------------------------------------- Recipe changes

if settings.startup["wood-military-smg-ammo"].value then
  frep.add_ingredient("firearm-magazine", {type="item", name="wood-darts-magazine", amount=1})

  if settings.startup["wood-military-hard-mode"].value then
    frep.replace_ingredient("submachine-gun", "iron-plate", "steel-plate")
    frep.add_ingredient("wood-darts-magazine", {type="item", name="copper-plate", amount=1})
    frep.add_ingredient("firearm-magazine", {type="item", name="steel-plate", amount=1})
    frep.add_ingredient("piercing-rounds-magazine", {type="item", name="plastic-bar", amount=2})
  end
end

if settings.startup["wood-military-shotgun-ammo"].value then
  frep.add_ingredient("shotgun-shell", {type="item", name="wood-shotgun-shell", amount=1})
  
  if settings.startup["wood-military-hard-mode"].value then
    frep.replace_ingredient("shotgun", "iron-plate", "steel-plate")
    frep.add_ingredient("wood-shotgun-shell", {type="item", name="copper-plate", amount=2})
    frep.add_ingredient("piercing-shotgun-shell", {type="item", name="plastic-bar", amount=2})
  end
end

if mods["sniper-rifle-improved"] and settings.startup["wood-military-sniper-ammo"].value then
  frep.add_ingredient("sniper-magazine-1", {type="item", name="wood-bolts-magazine", amount=1})
  
  if settings.startup["wood-military-hard-mode"].value then
    frep.add_ingredient("wood-bolts-magazine", {type="item", name="copper-plate", amount=2})
    frep.replace_ingredient("sniper-magazine-1", "copper-plate", "plastic-bar")
    frep.add_ingredient("sniper-magazine-2", {type="item", name="plastic-bar", amount=4})
    frep.modify_ingredient("sniper-magazine-2", "sniper-magazine-1", {amount=1})
    frep.modify_result("sniper-magazine-2", "sniper-magazine-2", {amount=1})
  end
end

if settings.startup["wood-military-armor"].value then
  if frep.get_ingredient("heavy-armor", "light-armor") then
    frep.add_ingredient("light-armor", {type="item", name="wood-armor", amount=1})
  end

  if settings.startup["wood-military-hard-mode"].value then
    frep.add_ingredient("light-armor", {type="item", name="steel-plate", amount=10})
    frep.add_ingredient("heavy-armor", {type="item", name="plastic-bar", amount=10})
  end
end

-------------------------------------------------------------------------- Technology changes

if settings.startup["wood-military-smg-ammo"].value then
  ftech.add_unlock("military", "firearm-magazine")
end

if settings.startup["wood-military-shotgun-ammo"].value then
  ftech.add_unlock("military", "wood-shotgun-shell")
  ftech.remove_unlock("military", "shotgun-shell")
  ftech.add_unlock("military-2", "shotgun-shell")

  if mods["wood-industry"] and not settings.startup["wood-military-hard-mode"].value then
    ftech.add_prereq("military", "wood-pyrolysis")
  end
end

if mods["sniper-rifle-improved"] and settings.startup["wood-military-sniper-ammo"].value then
  ftech.add_unlock("military", "carbine-rifle")
  ftech.add_unlock("military", "wood-bolts-magazine")
  ftech.remove_unlock("military-2", "carbine-rifle")
end

if settings.startup["wood-military-armor"].value then
  ftech.add_unlock("military", "light-armor")
  
  if settings.startup["wood-military-hard-mode"].value then
    ftech.add_prereq("heavy-armor", "plastics")
    ftech.add_cost_ingredient("heavy-armor", "logistic-science-pack")
    ftech.modify_cost("heavy-armor", {count=75})
  end
end

if settings.startup["wood-military-hard-mode"].value then
  ftech.add_prereq("military", "steel-processing")
  ftech.modify_cost("military", {count=25})

  ftech.add_prereq("military-2", "plastics")
  ftech.remove_prereq("military-2", "steel-processing")
  ftech.remove_prereq("military-2", "logistic-science-pack")
  ftech.modify_cost("military-2", {count=50})

  if not settings.startup["wood-military-armor"].value then
    ftech.add_unlock("military", "light-armor")
  end
end

if settings.startup["wood-military-artillery"].value then
  ftech.add_unlock("artillery", "wood-artillery-shell")
end
