data:extend({
  {
    type = "bool-setting",
    name = "wood-military-smg-ammo",
    setting_type = "startup",
    default_value = true,
    order = "a[ammo]-a[smg]"
  },
  {
    type = "bool-setting",
    name = "wood-military-shotgun-ammo",
    setting_type = "startup",
    default_value = true,
    order = "a[ammo]-b[shotgun]"
  },
  {
    type = "bool-setting",
    name = "wood-military-rockets",
    setting_type = "startup",
    default_value = true,
    order = "a[ammo]-d[rocket]"
  },
  {
    type = "bool-setting",
    name = "wood-military-artillery",
    setting_type = "startup",
    default_value = true,
    order = "a[ammo]-e[artillery]"
  },
  {
    type = "int-setting",
    name = "wood-military-ammo-cost",
    setting_type = "startup",
    minimum_value = 1,
    default_value = 2,
    order = "b[ammo-details]-a[cost]"
  },
  {
    type = "bool-setting",
    name = "wood-military-modify-vanilla",
    setting_type = "startup",
    default_value = true,
    order = "b[ammo-details]-b[modify]"
  },
  {
    type = "bool-setting",
    name = "wood-military-damage-buff",
    setting_type = "startup",
    default_value = true,
    order = "b[ammo-details]-d[buff]"
  },
  {
    type = "double-setting",
    name = "wood-military-wood-modifier",
    setting_type = "startup",
    minimum_value = 0.5,
    maximum_value = 1.0,
    default_value = 0.85,
    order = "b[ammo-details]-e[nerf]"
  },
  {
    type = "bool-setting",
    name = "wood-military-carbon",
    setting_type = "startup",
    default_value = true,
    order = "b[ammo-details]-c[carbon]"
  },
  {
    type = "bool-setting",
    name = "wood-military-armor",
    setting_type = "startup",
    default_value = true,
    order = "c[armor]"
  },
  -- start the game with wood darts magazines
  {
    type = "bool-setting",
    name = "wood-military-nerf-start",
    setting_type = "runtime-global",
    default_value = false,
    order = "z[misc]-a[start]"
  },

  -- unused, but kept for backwards compatibility
  {
    type = "bool-setting",
    name = "wood-military-hard-mode",
    setting_type = "startup",
    default_value = false,
    order = "z[ammo-details]-z[hard-mode]",
    hidden = true,
  },
})

if mods["sniper-rifle-improved"] then
  data:extend({
    -- add crossbow bolts magazine for snipers
    {
      type = "bool-setting",
      name = "wood-military-sniper-ammo",
      setting_type = "startup",
      default_value = true,
      order = "a[ammo]-c[sniper]"
    }
  })
end
