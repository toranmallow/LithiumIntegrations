---------------[Changes to Picklock's base setup]---------------
-- Enable productivity modules for lithium based intermediate products

enable_productivity_recipes = {
"pi-lipo-cell", "pi-lithium-plate", "pi-lithium-7-pellet", "pi-lithium-6-pellet"
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
