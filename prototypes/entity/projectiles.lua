if settings.startup["wood-military-shotgun-ammo"].value == "item" then
  data:extend({
    {
      type = "projectile",
      name = "wood-shotgun-pellet",
      flags = {"not-on-map"},
      collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
      acceleration = 0,
      direction_only = true,
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            type = "damage",
            damage = {amount = 3, type = "physical"}
          }
        }
      },
      animation =
      {
        filename = "__wood-military__/graphics/entity/wood-bullet/wood-bullet.png",
        draw_as_glow = false,
        frame_count = 1,
        width = 3,
        height = 50,
        priority = "high"
      }
    }
  })
end