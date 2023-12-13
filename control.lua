if settings.startup["wood-military-smg-ammo"] == "item" then
  local function on_init()
    if remote.interfaces["freeplay"] then
      local respawn_items = remote.call("freeplay", "get_respawn_items")
      respawn_items["wood-bolts-magazine"] = respawn_items["firearm-magazine"]
      respawn_items["firearm-magazine"] = nil
      remote.call("freeplay", "set_respawn_items", respawn_items)
    end
  end

  script.on_init(on_init)
end
