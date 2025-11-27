local frep = require("__fdsl__.lib.recipe")

if mods["Voidcraft"] then
	local vcc = require("__Voidcraft__.prototypes.costs")
	local lumber_item = mods["wood-logistics"] and settings.startup["wood-logistics-lumber"].value and "lumber" or "wood"
	local woodchips_bad_product = mods["wood-industry"] and "woodchips" or "wood"
	local coal_bad_product = mods["wood-industry"] and "charcoal" or "coal"

	VOIDCRAFT.create_auto_groups({{"voidcraft-wood-military", "vcwm"}})

	local vc_recipes = {}
	if settings.startup["wood-military-smg-ammo"].value then
		table.insert(vc_recipes, VOIDCRAFT.voidcraft_recipe({prefix="__wood-military__", subgroup="voidcraft-wood-military"}, {"wood-darts-magazine", "wood", coal_bad_product}, "vdA-a", 0.5*vcc.firearm_magazine, "s6x-void-military", {0.48, 0.4, 0.1}))
	end
	if settings.startup["wood-military-shotgun-ammo"].value then
		table.insert(vc_recipes, VOIDCRAFT.voidcraft_recipe({prefix="__wood-military__", subgroup="voidcraft-wood-military"}, {"wood-shotgun-shell", woodchips_bad_product, coal_bad_product}, "vdA-b", 0.5*vcc.shotgun_shell, "s6x-void-military", {0.48, 0.4, 0.1}))
	end
	if settings.startup["wood-military-rockets"].value then
		table.insert(vc_recipes, VOIDCRAFT.voidcraft_recipe({prefix="__wood-military__", subgroup="voidcraft-wood-military"}, {"splinter-bolt", lumber_item, "coal"}, "vdb-A", 0.5*vcc.rocket, "s6x-void-rockets", {0.48, 0.4, 0.1}))
	end
	if settings.startup["wood-military-artillery"].value then
		table.insert(vc_recipes, VOIDCRAFT.voidcraft_recipe({prefix="__wood-military__", subgroup="voidcraft-wood-military", advanced=true}, {"wood-artillery-shell", lumber_item, "coal"}, "vde-a", 0.1*vcc.artillery_shell, "s6x-void-artillery", {0.96, 0.8, 0.52}))
	end

	if next(vc_recipes) ~= nil then
		data:extend(vc_recipes)
		for _,recipe in pairs(vc_recipes) do
			data:extend({
				VOIDCRAFT.coherize(recipe),
				VOIDCRAFT.fluxize(recipe)
			})
		end
	end
end
