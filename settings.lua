local modutil = require("modutil")

data:extend(
{
  -- add wood darts magazine for vanilla pistol/smg
  {
    type = "string-setting",
    name = "wood-military-smg-ammo",
    setting_type = "startup",
    default_value = "item",
    allowed_values = {"item", "recipe", "no"}
  },
  -- add wood shotgun shell for vanilla shotguns
  {
    type = "string-setting",
    name = "wood-military-shotgun-ammo",
    setting_type = "startup",
    default_value = "item",
    allowed_values = {"item", "recipe", "no"}
  },
  -- how much wood each ammo item costs
  {
    type = "int-setting",
    name = "wood-military-ammo-cost",
    setting_type = "startup",
    default_value = 4
  },
  -- increase damage of non-wood ammo for increased catharsis
  {
    type = "bool-setting",
    name = "wood-military-damage-buff",
    setting_type = "startup",
    default_value = true
  }
})

if modutil.sniper_rifle then
  data:extend(
  {
    -- add crossbow bolts magazine for snipers
    {
      type = "string-setting",
      name = "wood-military-sniper-ammo",
      setting_type = "startup",
      default_value = "item",
      allowed_values = {"item", "recipe", "no"}
    }
  })
end
