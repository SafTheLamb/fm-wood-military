local sounds = require("__base__.prototypes.entity.sounds")

local small_woodshot = function()
  return
  {
    {
      filename = "__wood-base-assets__/graphics/entity/explosion-woodshot/explosion-woodshot.png",
      priority = "extra-high",
      width = 51,
      height = 57,
      frame_count = 13,
      animation_speed = 1.5,
      shift = {0, 0},
      scale = 0.5,
      usage = "explosion"
    }
  }
end

data:extend({
  {
    type = "explosion",
    name = "explosion-woodshot-small",
    localised_name = {"entity-name.explosion-gunshot-small"},
    icons =
    {
      {icon = "__base__/graphics/icons/explosion.png"},
      {icon = "__base__/graphics/icons/pistol.png"}
    },
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "explosions",
    animations = small_woodshot(),
    rotate = true,
    smoke = "smoke-fast",
    smoke_count = 1,
    smoke_slow_down_factor = 1
  },
  {
    type = "explosion",
    name = "explosion-hit-splinters",
    localised_name = {"entity-name.explosion-hit"},
    flags = {"not-on-map"},
    subgroup = "explosions",
    animations = util.empty_sprite(),
    smoke = "smoke-fast",
    smoke_count = 1,
    smoke_slow_down_factor = 1,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "create-particle",
          repeat_count = 2,
          particle_name = "wooden-chest-wooden-splinter-particle-small",
          initial_height = 0.5,
          initial_height_deviation = 0.04,
          initial_vertical_speed = 0.069,
          initial_vertical_speed_deviation = 0.025,
          speed_from_center = 0.01,
          speed_from_center_deviation = 0.023
        }
      }
    }
  },
  {
    type = "explosion",
    name = "big-explosion-hit-splinters",
    localised_name = {"entity-name.explosion-hit"},
    flags = {"not-on-map"},
    subgroup = "explosions",
    animations = util.empty_sprite(),
    smoke = "smoke-fast",
    smoke_count = 1,
    smoke_slow_down_factor = 1,
    created_effect = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "create-particle",
            repeat_count = 5,
            particle_name = "wooden-chest-wooden-splinter-particle-medium",
            initial_height = 0.5,
            initial_height_deviation = 0.04,
            initial_vertical_speed = 0.069,
            initial_vertical_speed_deviation = 0.025,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.023
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "wooden-chest-wooden-splinter-particle-small",
            initial_height = 0.5,
            initial_height_deviation = 0.08,
            initial_vertical_speed = 0.13,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.046
          }
        }
      }
    }
  },
  {
    type = "explosion",
    name = "wood-artillery-explosion",
    localised_name = {"entity-name.wood-artillery-explosion"},
    icon = "__base__/graphics/item-group/effects.png",
    icon_size = 64,
    flags = {"not-on-map"},
    subgroup = "explosions",
    animations = util.empty_sprite(),
    --light = default_light(50),
    sound = sounds.small_explosion,
    created_effect = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "create-particle",
            repeat_count = 50,
            particle_name = "wooden-chest-wooden-splinter-particle-medium",
            initial_height = 0.5,
            speed_from_center = 0.1,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = {{-0.8984, -0.5}, {0.8984, 0.5}}
          },
          {
            type = "create-particle",
            repeat_count = 50,
            particle_name = "wooden-chest-wooden-splinter-particle-small",
            offset_deviation = {{-0.8984, -0.5}, {0.8984, 0.5}},
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.1,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 50,
            particle_name = "explosion-stone-particle-tiny",
            offset_deviation = {{-0.8984, -0.5}, {0.8984, 0.5}},
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.1,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },
})
