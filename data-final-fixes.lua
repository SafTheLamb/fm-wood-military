if mods["distant-misfires"] then
  local wood_nerf_modifier = settings.startup["wood-military-wood-modifier"].value
  
  local function nerf_ammo(ammo_type)
    for _,action in ipairs(ammo_type.action) do
      for _,delivery in ipairs(action.action_delivery) do
        if delivery.type == "projectile" then
          delivery.max_range = wood_nerf_modifier * delivery.max_range
        end
      end
    end
  end

  if settings.startup["wood-military-smg-ammo"].value then
    data.raw.projectile["wood-darts-magazine"].animation.filename = "__wood-base-assets__/graphics/entity/wood-bullet/wood-bullet.png"
    nerf_ammo(data.raw.ammo["wood-darts-magazine"].ammo_type)
  end

  if mods["sniper-rifle-improved"] and settings.startup["wood-military-sniper-ammo"].value then
    data.raw.projectile["wood-bolts-magazine"].animation.filename = "__wood-base-assets__/graphics/entity/wood-bullet/wood-bullet.png"
    nerf_ammo(data.raw.ammo["wood-bolts-magazine"].ammo_type)
  end
end
