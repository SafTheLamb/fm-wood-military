local modutil = require("modutil")

if settings.startup["wood-military-smg-ammo"].value == "item" then
  data:extend({
    {
      type = "ammo",
      name = "wood-darts-magazine",
      icon = "__wood-military__/graphics/icons/wood-darts-magazine.png",
      icon_size = 64, icon_mipmaps = 4,
      ammo_type =
      {
        category = "bullet",
        range_modifier = 0.8,
        cooldown_modifier = 1/0.8,
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              {
                type = "create-entity",
                entity_name = "explosion-hit-splinters",
                offsets = {{0, 0.5}},
                offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
              },
              {
                type = "damage",
                damage = {amount=3, type="physical"}
              }
            }
          }
        }
      },
      magazine_size = 10,
      reload_time = 45,
      subgroup = "ammo",
      order = "a[basic-clips]-A[wood-darts-magazine]",
      stack_size = 200
    }
  })
end

if settings.startup["wood-military-shotgun-ammo"].value == "item" then
  data:extend({
    {
      type = "ammo",
      name = "wood-shotgun-shell",
      icon = "__wood-military__/graphics/icons/wood-shotgun-shell.png",
      icon_size = 64, icon_mipmaps = 4,
      ammo_type =
      {
        category = "shotgun-shell",
        range_modifier = 0.8,
        cooldown_modifier = 1/0.8,
        target_type = "direction",
        clamp_position = true,
        action =
        {
          type = "direct",
          repeat_count = 8,
          action_delivery =
          {
            type = "projectile",
            projectile = "wood-shotgun-pellet",
            starting_speed = 1,
            starting_speed_deviation = 0.1,
            direction_deviation = 0.3,
            range_deviation = 0.3,
            max_range = 15
          }
        }
      },
      magazine_size = 10,
      reload_time = 45,
      subgroup = "ammo",
      order = "b[shotgun]-A[wooden]",
      stack_size = 200
    }
  })
end

if modutil.sniper_rifle and settings.startup["wood-military-sniper-ammo"].value == "item" then
  data:extend({
    {
      type = "ammo",
      name = "wood-bolts-magazine",
      icon = "__wood-military__/graphics/icons/wood-bolts-magazine.png",
      icon_size = 64, icon_mipmaps = 4,
      ammo_type =
      {
        category = "rifle-bullet",
        range_modifier = 0.8,
        cooldown_modifier = 1/0.8,
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              {
                type = "create-entity",
                entity_name = "explosion-hit-splinters",
                offsets = {{0, 0.5}},
                offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
              },
              {
                type = "damage",
                damage = {amount=40, type="physical"}
              }
            }
          }
        }
      },
      magazine_size = 5,
      reload_time = 75,
      subgroup = "ammo",
      order = "a[basic-clips]-d[sniper-magazine-0]",
      stack_size = 200
    }
  })
end
