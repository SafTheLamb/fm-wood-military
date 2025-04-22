local frep = require("__fdsl__.lib.recipe")

if mods["sniper-rifle-improved"] and settings.startup["wood-military-sniper-ammo"].value then
  if settings.startup["wood-military-modify-vanilla"].value then
    frep.add_ingredient("sniper-magazine-1", {type="item", name="wood-bolts-magazine", amount=1})
  end
end
