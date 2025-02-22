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
  -- add wood rockets for vanilla rocket launchers
  {
    type = "bool-setting",
    name = "wood-military-rockets",
    setting_type = "startup",
    default_value = true,
    order = "a[ammo]-d[rocket]"
  },
  -- add wood artillery shell for artillery cannons
  {
    type = "bool-setting",
    name = "wood-military-artillery",
    setting_type = "startup",
    default_value = true,
    order = "a[ammo]-e[artillery]"
  },
  -- how much wood each ammo item costs
  {
    type = "int-setting",
    name = "wood-military-ammo-cost",
    setting_type = "startup",
    minimum_value = 1,
    default_value = 2,
    order = "b[ammo-details]-a[cost]"
  },
  -- whether to make base-tier vanilla ammo cost wood
  {
    type = "bool-setting",
    name = "wood-military-modify-vanilla",
    setting_type = "startup",
    default_value = true,
    order = "b[ammo-details]-b[modify]"
  },
  -- make ammo recipes more difficult
  {
    type = "bool-setting",
    name = "wood-military-hard-mode",
    setting_type = "startup",
    default_value = false,
    order = "b[ammo-details]-c[hard-mode]"
  },
  -- increase damage of non-wood ammo for increased catharsis
  {
    type = "bool-setting",
    name = "wood-military-damage-buff",
    setting_type = "startup",
    default_value = true,
    order = "b[ammo-details]-d[buff]"
  },
  -- scalar for the range and firerate of wooden ammo (1 = no change)
  {
    type = "double-setting",
    name = "wood-military-wood-modifier",
    setting_type = "startup",
    minimum_value = 0.5,
    maximum_value = 1.0,
    default_value = 0.85,
    order = "b[ammo-details]-e[nerf]"
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
