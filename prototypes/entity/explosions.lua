data:extend({
  {
    type = "explosion",
    name = "explosion-hit-splinters",
    localised_name = {"entity-name.explosion-hit"},
    flags = {"not-on-map", "hidden"},
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
})
