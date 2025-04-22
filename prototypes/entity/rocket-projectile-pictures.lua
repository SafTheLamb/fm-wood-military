return {
  animation = function(tip_tint)
    return {
      layers = {
        util.sprite_load("__wood-military__/graphics/entity/wood-rocket/wood-rocket", {
          scale = 0.5,
          repeat_count = 8,
          frame_count = 1,
          rotate_shift = true,
          priority = "high"
        }),
        util.sprite_load("__base__/graphics/entity/rocket/rocket-tinted-tip", {
          scale = 0.5,
          repeat_count = 8,
          frame_count = 1,
          rotate_shift = true,
          priority = "high",
          tint = tip_tint
        })
      }
    }
  end,
  shadow = util.sprite_load("__base__/graphics/entity/rocket/rocket", {
    draw_as_shadow = true,
    scale = 0.5,
    frame_count = 1,
    rotate_shift = true,
    priority = "high"
  })
}
