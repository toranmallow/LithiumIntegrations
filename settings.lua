data:extend({
  -- Base settings, order a[0-9]+
  {
    type = "bool-setting",
    name = "li-alt-graphite",
    setting_type = "startup",
    default_value = true,
    order = "a1",
  },
  {
    type = "bool-setting",
    name = "li-expand-prodmod",
    setting_type = "startup",
    default_value = true,
    order = "a2",
  },
  -- Integration settings, order b[0-9]+
  {
    type = "bool-setting",
    name = "li-elecweapons-support",
    setting_type = "startup",
    default_value = true,
    order = "b1",
  },
  {
    type = "bool-setting",
    name = "li-advelec-support",
    setting_type = "startup",
    default_value = true,
    order = "b2",
  },
  {
    type = "bool-setting",
    name = "li-advequip-support",
    setting_type = "startup",
    default_value = true,
    order = "b3",
  },
  {
    type = "bool-setting",
    name = "li-k2-support",
    setting_type = "startup",
    default_value = true,
    order = "b4",
  },
})

