local item_sounds = require("__base__.prototypes.item_sounds")

-------------------------------------------------------------------------- SMG

if settings.startup["wood-military-smg-ammo"].value then
  data:extend({
    {
      type = "ammo",
      name = "wood-darts-magazine",
      icon = "__wood-military__/graphics/icons/wood-darts-magazine.png",
      ammo_category = "bullet",
      ammo_type = {
        range_modifier = 0.8,
        cooldown_modifier = 1/0.8,
        action = {
          type = "direct",
          action_delivery = {
            type = "instant",
            source_effects = {
              {
                type = "create-explosion",
                entity_name = "explosion-woodshot-small"
              }
            },
            target_effects = {
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
      inventory_move_sound = item_sounds.wood_inventory_move,
      pick_sound = item_sounds.wood_inventory_pickup,
      drop_sound = item_sounds.wood_inventory_move,
      stack_size = 100,
      weight = 10*kg
    }
  })
end

-------------------------------------------------------------------------- Shotgun

if settings.startup["wood-military-shotgun-ammo"].value then
  data:extend({
    {
      type = "ammo",
      name = "wood-shotgun-shell",
      icon = "__wood-military__/graphics/icons/wood-shotgun-shell.png",
      icon_size = 64, icon_mipmaps = 4,
      ammo_category = "shotgun-shell",
      ammo_type = {
        range_modifier = 0.8,
        cooldown_modifier = 1/0.8,
        target_type = "direction",
        clamp_position = true,
        action = {
          {
            type = "direct",
            action_delivery = {
              type = "instant",
              source_effects = {
                {
                  type = "create-explosion",
                  entity_name = "explosion-woodshot-small"
                }
              }
            }
          },
          {
            type = "direct",
            repeat_count = 8,
            action_delivery = {
              type = "projectile",
              projectile = "wood-shotgun-pellet",
              starting_speed = 1,
              starting_speed_deviation = 0.1,
              direction_deviation = 0.3,
              range_deviation = 0.3,
              max_range = 15
            }
          }
        }
      },
      magazine_size = 10,
      reload_time = 45,
      subgroup = "ammo",
      order = "b[shotgun]-A[wooden]",
      inventory_move_sound = item_sounds.wood_inventory_move,
      pick_sound = item_sounds.wood_inventory_pickup,
      drop_sound = item_sounds.wood_inventory_move,
      stack_size = 100,
      weight = 10*kg
    }
  })
end

-------------------------------------------------------------------------- Sniper rifle

if mods["sniper-rifle-improved"] and settings.startup["wood-military-sniper-ammo"].value then
  data:extend({
    {
      type = "ammo",
      name = "wood-bolts-magazine",
      icon = "__wood-military__/graphics/icons/wood-bolts-magazine.png",
      icon_size = 64, icon_mipmaps = 4,
      ammo_category = "rifle-bullet",
      ammo_type = {
        range_modifier = 0.8,
        cooldown_modifier = 1/0.8,
        action = {
          {
            type = "direct",
            action_delivery = {
              {
                type = "instant",
                source_effects = {
                  {
                    type = "create-explosion",
                    entity_name = "explosion-woodshot-small"
                  }
                },
                target_effects = {
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
          }
        }
      },
      magazine_size = 5,
      reload_time = 75,
      subgroup = "ammo",
      order = "a[basic-clips]-d[sniper-magazine-0]",
      inventory_move_sound = item_sounds.wood_inventory_move,
      pick_sound = item_sounds.wood_inventory_pickup,
      drop_sound = item_sounds.wood_inventory_move,
      stack_size = 100,
      weight = 10*kg
    }
  })
end

-------------------------------------------------------------------------- Artillery

if settings.startup["wood-military-artillery"].value then
  data:extend({
    {
      type = "ammo",
      name = "wood-artillery-shell",
      icon = "__wood-military__/graphics/icons/wood-artillery-shell.png",
      icon_size = 64, icon_mipmaps = 4,
      ammo_category = "artillery-shell",
      ammo_type = {
        target_type = "position",
        action = {
          {
            type = "direct",
            action_delivery = {
              {
                type = "artillery",
                projectile = "wood-artillery-projectile",
                starting_speed = 1,
                direction_deviation = 0,
                range_deviation = 0,
                source_effects = {
                  {type="create-explosion",entity_name="artillery-cannon-muzzle-flash"}
                }
              }
            }
          }
        }
      },
      subgroup = "ammo",
      order = "d[explosive-cannon-shell]-d[-artillery]",
      inventory_move_sound = item_sounds.wood_inventory_move,
      pick_sound = item_sounds.wood_inventory_pickup,
      drop_sound = item_sounds.wood_inventory_move,
      stack_size = 10,
      weight = 100*kg
    }
  })
end

-------------------------------------------------------------------------- Armor

if settings.startup["wood-military-armor"].value then
  data:extend({
    {
      type = "armor",
      name = "wood-armor",
      icon = "__wood-military__/graphics/icons/wood-armor.png",
      icon_size = 64, icon_mipmaps = 4,
      resistances = {
        {
          type = "physical",
          decrease = 2,
          percent = 10
        },
        {
          type = "acid",
          decrease = 0,
          percent = 10
        },
        {
          type = "explosion",
          decrease = 1,
          percent = 10
        },
        {
          type = "fire",
          decrease = 0,
          percent = -90
        }
      },
      subgroup = "armor",
      order = "A[wood-armor]",
      inventory_move_sound = item_sounds.wood_inventory_move,
      pick_sound = item_sounds.wood_inventory_pickup,
      drop_sound = item_sounds.wood_inventory_move,
      stack_size = 1,
      durability = 500
    }
  })
end
