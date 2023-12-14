local modutil = require("modutil")

for _,force in pairs(game.forces) do
  local technologies = force.technologies
  local recipes = force.recipes

  local military1 = technologies["military"].researched
  local military2 = technologies["military-2"].researched

  if settings.startup["wood-military-smg-ammo"].value == "item" then
    recipes["firearm-magazine"].enabled = military1
  else
    recipes["firearm-magazine"].enabled = true
  end

  if settings.startup["wood-military-shotgun-ammo"].value == "item" then
    recipes["wood-shotgun-shell"].enabled = military1
    recipes["shotgun-shell"].enabled = military2
  else
    recipes["shotgun-shell"].enabled = military1
  end
end
