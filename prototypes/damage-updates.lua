local function increase_damage(ammo, amount)
  if ammo and amount then
    if ammo.action[1] and ammo.action[1].action_delivery[1] then
      for _,effect in pairs(ammo.action[1].action_delivery[1].target_effects) do
        if effect.type == "damage" then
          effect.damage.amount = effect.damage.amount + amount
          break
        end
      end
    elseif ammo.action and ammo.action.action_delivery then
      if #ammo.action.action_delivery.target_effects > 0 then
        for _,effect in pairs(ammo.action.action_delivery.target_effects) do
          if effect.type == "damage" then
            effect.damage.amount = effect.damage.amount + amount
            break
          end
        end
      -- shotgun pellet projectile only has one target effect >.<
      elseif ammo.action.action_delivery.target_effects.type == "damage" then
        ammo.action.action_delivery.target_effects.damage.amount =
          ammo.action.action_delivery.target_effects.damage.amount + amount
      end
    end
  end
end

if settings.startup["wood-military-damage-buff"].value then
  if settings.startup["wood-military-smg-ammo"].value == "item" then
    increase_damage(data.raw.ammo["firearm-magazine"].ammo_type, 1)
    increase_damage(data.raw.ammo["piercing-rounds-magazine"].ammo_type, 1)
  end
  if settings.startup["wood-military-shotgun-ammo"].value == "item" then
    increase_damage(data.raw.projectile["shotgun-pellet"], 1)
    increase_damage(data.raw.projectile["piercing-shotgun-pellet"], 1)
  end
end
