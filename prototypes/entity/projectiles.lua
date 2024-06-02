-- Shotgun pellet ----------------------------------------------------------------------------------
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

-- Artillery shell ---------------------------------------------------------------------------------
if settings.startup["wood-military-artillery"].value then
  data:extend({
    {
      type = "artillery-projectile",
      name = "wood-artillery-projectile",
      flags = {"not-on-map"},
      reveal_map = true,
      map_color = {r=1, g=1, b=0},
      picture = {
        filename = "__wood-military__/graphics/entity/wood-artillery-projectile/hr-wood-shell.png",
        draw_as_glow = true,
        width = 64,
        height = 64,
        scale = 0.5
      },
      shadow = {
        filename = "__base__/graphics/entity/artillery-projectile/hr-shell-shadow.png",
        width = 64,
        height = 64,
        scale = 0.5
      },
      chart_picture = {
        filename = "__base__/graphics/entity/artillery-projectile/artillery-shoot-map-visualization.png",
        flags = { "icon" },
        frame_count = 1,
        width = 64,
        height = 64,
        priority = "high",
        scale = 0.25
      },
      action = {
        type = "direct",
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              type = "nested-result",
              action = {
                type = "area",
                radius = 0.5,
                action_delivery = {
                  type = "instant",
                  target_effects = {
                    {
                      type = "damage",
                      damage = {amount = 250 , type = "physical"}
                    }
                  }
                }
              }
            },
            {
              type = "create-trivial-smoke",
              smoke_name = "artillery-smoke",
              initial_height = 0,
              speed_from_center = 0.05,
              speed_from_center_deviation = 0.005,
              offset_deviation = {{-4, -4}, {4, 4}},
              max_radius = 0.5,
              repeat_count = 15
            },
            {
              type = "create-entity",
              entity_name = "wood-artillery-explosion"
            },
            {
              type = "show-explosion-on-chart",
              scale = 2/32
            }
          }
        }
      },
      final_action = {
        type = "direct",
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              type = "create-entity",
              entity_name = "small-scorchmark-tintable",
              check_buildability = true
            },
            {
              type = "invoke-tile-trigger",
              repeat_count = 1
            },
            {
              type = "destroy-decoratives",
              from_render_layer = "decorative",
              to_render_layer = "object",
              include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
              include_decals = false,
              invoke_decorative_trigger = true,
              decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
              radius = 0.75 -- slightly larger radius than damage
            }
          }
        }
      },
      height_from_ground = 70 / 64
    },
  })
end
