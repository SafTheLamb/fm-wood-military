local ftech = require("__fdsl__.lib.technology")

-------------------------------------------------------------------------- SMG ammo

if settings.startup["wood-military-smg-ammo"].value then
  ftech.add_unlock("military", "firearm-magazine")
end

-------------------------------------------------------------------------- Shotgun ammo

if settings.startup["wood-military-shotgun-ammo"].value then
  ftech.add_unlock("military", "wood-shotgun-shell")
  ftech.remove_unlock("military", "shotgun-shell")
  ftech.add_unlock("military-2", "shotgun-shell")
end

-------------------------------------------------------------------------- Sniper ammo

if mods["sniper-rifle-improved"] and settings.startup["wood-military-sniper-ammo"].value then
  ftech.add_unlock("military", "carbine-rifle")
  ftech.add_unlock("military", "wood-bolts-magazine")
  ftech.remove_unlock("military-2", "carbine-rifle")
end

-------------------------------------------------------------------------- Artillery ammo

if settings.startup["wood-military-artillery"].value then
  if mods["basic-artillery"] then
    ftech.add_unlock("basic-artillery", "wood-artillery-shell")
  else
    ftech.add_unlock("artillery", "wood-artillery-shell")
  end
end

-------------------------------------------------------------------------- Rocket ammo

if settings.startup["wood-military-artillery"].value then
  ftech.add_unlock("rocketry", "scorpion-bolt")
  ftech.add_unlock("rocketry", "splinter-bolt")
  ftech.add_unlock("explosive-rocketry", "rocket")
  ftech.remove_unlock("rocketry", "rocket")
end

-------------------------------------------------------------------------- Armor

if settings.startup["wood-military-armor"].value then
  ftech.add_unlock("military", "light-armor")
  ftech.remove_prereq("heavy-armor", "military")
  ftech.add_prereq("heavy-armor", "plastics")
  ftech.add_prereq("heavy-armor", "military-2")
  ftech.add_cost_ingredient("heavy-armor", "logistic-science-pack")
  ftech.modify_cost("heavy-armor", {count=75})
end

-------------------------------------------------------------------------- Hard mode

ftech.add_prereq("military", "steel-processing")
ftech.modify_cost("military", {count=25})
ftech.remove_prereq("military-2", "steel-processing")
ftech.modify_cost("military-2", {count=50})
