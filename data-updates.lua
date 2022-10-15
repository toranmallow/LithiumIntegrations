---------------[Changes to Picklock's base setup]---------------
-- Add alternate recipes for graphite
data:extend{
   {
      type = "recipe",
      name = "pi-graphite2",
      category = "chemistry",
      normal =
	 {
	    energy_required = 4,
	    enabled = false,
	    ingredients =
	       {
		  {type="fluid", name="petroleum-gas", amount=30},
		  {"coal", 1}
	       },
	    result = "pi-graphite"
	 },
      expensive =
	 {
	    energy_required = 5,
	    enabled = false,
	    ingredients =
	       {
		  {type="fluid", name="petroleum-gas", amount=60},
		  {"coal", 2}
	       },
	    result = "pi-graphite"
	 }  
   },
   {
      type = "recipe",
      name = "pi-graphite3",
      category = "chemistry",
      normal =
	 {
	    energy_required = 4,
	    enabled = false,
	    ingredients =
	       {
		  {type="fluid", name="lubricant", amount=10},
		  {"coal", 1}
	       },
	    result = "pi-graphite"
	 },
      expensive =
	 {
	    energy_required = 5,
	    enabled = false,
	    ingredients =
	       {
		  {type="fluid", name="lubricant", amount=20},
		  {"coal", 2}
	       },
	    result = "pi-graphite"
	 }  
   },
   {
      type = "recipe",
      name = "pi-graphite4",
      category = "chemistry",
      normal =
	 {
	    energy_required = 4,
	    enabled = false,
	    ingredients =
	       {
		  {type="fluid", name="light-oil", amount=10},
		  {"coal", 1}
	       },
	    result = "pi-graphite"
	 },
      expensive =
	 {
	    energy_required = 5,
	    enabled = false,
	    ingredients =
	       {
		  {type="fluid", name="light-oil", amount=20},
		  {"coal", 2}
	       },
	    result = "pi-graphite"
	 }  
   },
   {
      type = "recipe",
      name = "pi-graphite5",
      category = "chemistry",
      normal =
	 {
	    energy_required = 4,
	    enabled = false,
	    ingredients =
	       {
		  {type="fluid", name="crude-oil", amount=50},
		  {"coal", 1}
	       },
	    result = "pi-graphite"
	 },
      expensive =
	 {
	    energy_required = 5,
	    enabled = false,
	    ingredients =
	       {
		  {type="fluid", name="crude-oil", amount=100},
		  {"coal", 2}
	       },
	    result = "pi-graphite"
	 }  
   }

}

table.insert(data.raw["technology"]["pi-tech-lipo-accu"].effects, {type = "unlock-recipe",recipe = "pi-graphite2"})
table.insert(data.raw["technology"]["pi-tech-lipo-accu"].effects, {type = "unlock-recipe",recipe = "pi-graphite3"})
table.insert(data.raw["technology"]["pi-tech-lipo-accu"].effects, {type = "unlock-recipe",recipe = "pi-graphite4"})
table.insert(data.raw["technology"]["pi-tech-lipo-accu"].effects, {type = "unlock-recipe",recipe = "pi-graphite5"})

-- Enable productivity modules for lithium based intermediate products
enable_productivity_recipes = {
"pi-lipo-cell", "pi-lithium-plate", "pi-lithium-7-pellet", "pi-lithium-6-pellet", "pi-graphite", "pi-graphite2", "pi-graphite3", "pi-graphite4", "pi-graphite5"
}

for k, v in pairs(data.raw.module) do
  if v.name:find("productivity%-module") and v.limitation then
    for _, recipe in ipairs(enable_productivity_recipes) do
      if data.raw["recipe"][recipe] then
        table.insert(v.limitation, recipe)
      end
    end
  end
end

---------------[Electric-Weapons Integration]---------------
-- Replace regular batteries with lithium polymer cells
if (mods or script.active_mods)["Electric-Weapons"] then
   data:extend{
      {
	 type = "recipe",
	 name = "sw-electric-gun",
	 enabled = false,
	 energy_required = 20,
	 ingredients =
	    {
	       {"steel-plate", 5},
	       {"plastic-bar", 4},
	       {"advanced-circuit", 5},
	       {"pi-lipo-cell", 6}
	    },
	 result = "sw-electric-gun"
      },
      {
	 type = "recipe",
	 name = "sw-electric-rifle",
	 enabled = false,
	 energy_required = 30,
	 ingredients =
	    {
	       {"steel-plate", 10},
	       {"plastic-bar", 10},
	       {"speed-module", 5},
	       {"pi-lipo-cell", 10}
	    },
	 result = "sw-electric-rifle"
      },
      
      {
	 type = "recipe",
	 name = "sw-electric-bomber",
	 enabled = false,
	 energy_required = 40,
	 ingredients =
	    {
	       {"steel-plate", 40},
	       {"effectivity-module", 5},
	       {"processing-unit", 20},
	       {"pi-lipo-cell", 10}
	    },
	 result = "sw-electric-bomber"
      },
      {
	 type = "recipe",
	 name = "sw-electric-gun-cell",
	 enabled = false,
	 energy_required = 6,
	 ingredients =
	    {
	       {"steel-plate", 2},
	       {"advanced-circuit", 1},
	       {"plastic-bar", 2},
	       {"pi-lipo-cell", 3}
	    },
	 result = "sw-electric-gun-cell"
      },
      {
	 type = "recipe",
	 name = "sw-electric-gun-cell-wsticker",
	 enabled = false,
	 energy_required = 7,
	 ingredients =
	    {
	       {"sw-electric-gun-cell", 2},
	       {"advanced-circuit", 1},
	       {"pi-lipo-cell", 4}
	    },
	 result = "sw-electric-gun-cell-wsticker"
      },
      {
	 type = "recipe",
	 name = "sw-shock-bomb-ammo-1",
	 enabled = false,
	 energy_required = 7,
	 ingredients =
	    {
	       {"sw-electric-gun-cell", 2},
	       {"explosives", 2},
	       {"processing-unit", 1},
	       {"pi-lipo-cell", 4}
	    },
	 result = "sw-shock-bomb-ammo-1"
      },
      
      {
	 type = "recipe",
	 name = "sw-shock-bomb-ammo-2",
	 enabled = false,
	 energy_required = 8,
	 ingredients =
	    {
	       {"sw-electric-gun-cell", 1},
	       {"sw-shock-bomb-ammo-1", 1},
	       {"explosives", 3},
	       {"processing-unit", 1},
	       {"pi-lipo-cell", 5}
	    },
	 result = "sw-shock-bomb-ammo-2"
      }, 
      {
	 type = "recipe",
	 name = "sw-shock-bomb-ammo-3",
	 enabled = false,
	 energy_required = 10,
	 ingredients =
	    {
	       {"sw-electric-gun-cell", 1},
	       {"sw-shock-bomb-ammo-2", 1},
	       {"explosives", 4},
	       {"processing-unit", 1},
	       {"solid-fuel", 2}
	    },
	 result = "sw-shock-bomb-ammo-3"
      }, 
      {
	 type = "recipe",
	 name = "sw-electric-rounds-magazine",
	 enabled = false,
	 energy_required = 10,
	 ingredients =
	    {
	       {"piercing-rounds-magazine", 1},
	       {"pi-lipo-cell", 2},
	    },
	 result = "sw-electric-rounds-magazine"
      }, 
      {
	 type = "recipe",
	 name = "sw-electric-turret",
	 enabled = false,
	 energy_required = 20,
	 ingredients =
	    {
	       {"laser-turret", 1},
	       {"steel-plate", 20},
	       {"pi-lipo-cell", 10},
	       {"advanced-circuit",10}	  
	       
	    },
	 result = "sw-electric-turret"
      },
      {
	 type = "recipe",
	 name = "sw-electric-stick-turret",
	 enabled = false,
	 energy_required = 20,
	 ingredients =
	    {
	       {"sw-electric-turret", 1},
	       {"sw-electric-gun-cell-wsticker", 5},
	       {"pi-lipo-cell", 10}
	    },
	 result = "sw-electric-stick-turret"
      },
   }
end

---------------[Advanced-Electric-Revamped-v16 Integration]---------------
-- Replace regular accumulators with LiPo accumulators
-- Replace regular batteries with lithium polymer cells
-- Add some lithium polymer cell inputs to solar panelsa
-- Make LiPo accumulators upgrade to advanced accumulators
if (mods or script.active_mods)["Advanced-Electric-Revamped-v16"] then
   data:extend{
      {
	 type = "recipe",
	 name = "advanced-accumulator",
	 energy_required = 30,
	 enabled = false,
	 ingredients =
	    {
	       {"pi-lipo-accu", (settings.startup["advanced-electric-multiplier-advanced-accumulator"].value) + 1},
	       {"iron-plate", 10},
	       {"electronic-circuit", 5}
	    },
	 result = "advanced-accumulator"
      },
      {
      	 type = "recipe",
      	 name = "elite-accumulator",
      	 energy_required = 45,
      	 enabled = false,
      	 ingredients =
      	    {
      	       {"advanced-accumulator", (settings.startup["advanced-electric-multiplier-elite-accumulator"].value) / 10 + 2},
      	       {"iron-plate", 25},
	       {"pi-lipo-cell", 20},
      	       {"advanced-circuit", 10}
      	    },
      	 result = "elite-accumulator"
      },
      {
	 type = "recipe",
	 name = "ultimate-accumulator",
	 energy_required = 60,
	 enabled = false,
	 ingredients =
	    {
	       {"elite-accumulator", (settings.startup["advanced-electric-multiplier-ultimate-accumulator"].value) / 100 + 5},
	       {"steel-plate", 50},
	       {"pi-lipo-cell", 25},
	       {"processing-unit", 25}
	    },
	 result = "ultimate-accumulator"
      },
      -- {
      -- 	 type = "recipe",
      -- 	 name = "advanced-solar",
      -- 	 energy_required = 30,
      -- 	 enabled = false,
      -- 	 ingredients =
      -- 	    {
      -- 	       {"steel-plate", 5},
      -- 	       {"electronic-circuit", 5},
      -- 	       {"solar-panel", (settings.startup["advanced-electric-multiplier-advanced-solar"].value) + 1}
      -- 	    },
      -- 	 result = "advanced-solar"
      -- },
      {
	 type = "recipe",
	 name = "elite-solar",
	 energy_required = 45,
	 enabled = false,
	 ingredients =
	    {
	       {"steel-plate", 10},
	       {"advanced-circuit", 5},
	       {"pi-lipo-cell", 5},	       
	       {"advanced-solar", (settings.startup["advanced-electric-multiplier-elite-solar"].value) / 10 + 2}
	    },
	 result = "elite-solar"
      },
      {
	 type = "recipe",
	 name = "ultimate-solar",
	 energy_required = 60,
	 enabled = false,
	 ingredients =
	    {
	       {"steel-plate", 50},
	       {"processing-unit", 25},
	       {"pi-lipo-cell", 25},
	       {"elite-solar", (settings.startup["advanced-electric-multiplier-ultimate-solar"].value) / 100 + 5}
	    },
	 result = "ultimate-solar"
      }
   }

   -- Insert LiPo accumulators into the upgrade path for Advanced Solar HR
   data.raw["accumulator"]["pi-lipo-accu"].next_upgrade = "advanced-accumulator"
end
