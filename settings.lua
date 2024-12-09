data:extend({
  -- add wood darts magazine for vanilla pistol/smg
  {
    type = "bool-setting",
    name = "wood-military-smg-ammo",
    setting_type = "startup",
    default_value = true,
    order = "a[ammo]-a[smg]"
  },
  -- add wood shotgun shell for vanilla shotguns
  {
    type = "bool-setting",
    name = "wood-military-shotgun-ammo",
    setting_type = "startup",
    default_value = true,
    order = "a[ammo]-b[shotgun]"
  },
  -- add wood artillery shell for artillery cannons
  {
    type = "bool-setting",
    name = "wood-military-artillery",
    setting_type = "startup",
    default_value = true,
    order = "a[ammo]-d[artillery]"
  },
  -- how much wood each ammo item costs
  {
    type = "int-setting",
    name = "wood-military-ammo-cost",
    setting_type = "startup",
    minimum_value = 1,
    default_value = 4,
    order = "b[ammo-details]-a[cost]"
  },
  -- make ammo recipes more difficult
  {
    type = "bool-setting",
    name = "wood-military-hard-mode",
    setting_type = "startup",
    default_value = false,
    order = "b[ammo-details]-b[hard-mode]"
  },
  -- increase damage of non-wood ammo for increased catharsis
  {
    type = "bool-setting",
    name = "wood-military-damage-buff",
    setting_type = "startup",
    default_value = true,
    order = "b[ammo-details]-c[buff]"
  },
  -- add wood armor
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
  }
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
