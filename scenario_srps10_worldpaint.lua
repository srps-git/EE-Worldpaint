-- Name: Worldpaint
-- Description: Empty scenario, no enemies, no friendlies. Can be used by a GM player to setup a scenario in the GM screen.
--- The F5 key can be used to copy the current layout to the clipboard for use in scenario scripts.
--- More extensive tools for drawing a world from scratch, with the idea to test/draft and export the final into an init function
--- by SRPS
-- Type: SRPS Development

--- Scenario
-- @script scenario_srps10_worldpaint
-- 1 IU = 10000 distance
require("utils.lua")
require("spawn_ships_scenario_utility.lua") -- only if actually using it





--------------------------
--ADD TO GAINING SCRIPT --
--------------------------

--#1 - require line
-- require("scenario_srps10_worldpaint.lua")

--#2 -- added to the init funciton
-- startWorldpaintGlobalVars()
-- mainWPMenuButtons() -- pulls the worldpaint tools in if script doesnt have a menu tree defined already

--#3 -- a new function added to the script, that worldpaint will call
--function wpBackToMain() -- exists to be overwritten in gaining scenario
--	clearGMFunctions()
--	addGMFunction("BACK TO SCENARIO MAIN", function() scenariosTopLevelMenuFunction() end ) -- change scenariosTopLevelMenuFunction to the actual top level menu function for the scenario
--end

--#4 -- inserted into the scenarios toplevel menu
--	addGMFunction("WORLDPAINT MAIN", function() clearGMFunctions() s() end)




function todo() -- not a function just a noteholder
-- add the ring mode to worldpaint buttons
--make an orbit mode


--add a measure mode

-- redo list buttons with indexed tables @ https://www.lua.org/pil/3.6.html

--make a drawbrush
--figure out line random
--make a zone?
--nebuloid = nebula with asteroid patterned just inside it
--minula is same except mines
--can combo mines and astroids as well
--nebula with mine and asteroid mixes
--nebula/asteroids/mines/n+a/n+m/a+m/n+a+m
--visual asteroids?
--plantets (with orbit considerations)
--fleet stuff
--type to make, amt to make, orders, faction, spawn pattern (grid or random, box or sphere or line)
--improve call math buttons stuff (manual val set and if parse currently)
--TO MAKE pull coords from highlighted objects v2 using avergae of all highlighted
--somehow make clabels also format the button text/mode?
--somehow add a drag/drawbrush mode?
--planets or stars that oscillate colors via random
--fully set zippy
end

function syntaxNotes() --note holder for syntax
local function createObjectsOnLineNotes()

	-- Create objects along a line between two vectors, optionally with grid
-- placement and randomization.
--
-- createObjectsOnLine(x1, y1, x2, y2, spacing, object_type, rows, chance, randomize)
--   x1, y1: Starting coordinates
--   x2, y2: Ending coordinates
--   spacing: The distance between each object.
--   object_type: The object type. Calls `object_type():setPosition()`.
--   rows (optional): The number of rows, minimum 1. Defaults to 1.
--   chance (optional): The percentile chance an object will be created,
--     minimum 1. Defaults to 100 (always).
--   randomize (optional): If present, randomize object placement by this
--     amount. Defaults to 0 (grid).
--
--   Examples: To create a mine field, run:
--     createObjectsOnLine(0, 0, 10000, 0, 1000, Mine, 4)
--   This creates 4 rows of mines from 0,0 to 10000,0, with mines spaced 1U
--   apart.
--
--   The `randomize` parameter adds chaos to the pattern. This works well for
--   asteroid fields:
--     createObjectsOnLine(0, 0, 10000, 0, 300, Asteroid, 4, 100, 800)
end
local function planetNotes()
--number Planet:getPlanetRadius()
--Returns this Planet's radius.
--Example: planet:getPlanetRadius()


--Planet Planet:setDistanceFromMovementPlane(number distance_from_movement_plane)
--Sets the z-position of this Planet, the distance by which it's offset above (positive) or below (negative) the movement plane.
--This value also modifies the Planet's collision radius.
--Defaults to 0.
--Example: planet:setDistanceFromMovementPlane(-500) -- sets the planet 0.5U below the movement plane
--Returns the object it was called on.


--Planet Planet:setOrbit(SpaceObject target, number orbit_time)
--Sets a SpaceObject around which this Planet orbits, as well as its orbital period in orbital degrees per tick.
--Example: moon:setOrbit(planet,20)
--Returns the object it was called on.
end
end

function init()
	
	startWorldpaintGlobalVars() -- starts all global vars, so the gobal var function can be called externally
	
    --SpaceStation():setPosition(1000, 1000):setTemplate('Small Station'):setFaction("Human Navy"):setRotation(random(0, 360))
    --SpaceStation():setPosition(-1000, 1000):setTemplate('Medium Station'):setFaction("Human Navy"):setRotation(random(0, 360))
    --SpaceStation():setPosition(1000, -1000):setTemplate('Large Station'):setFaction("Human Navy"):setRotation(random(0, 360))
    --SpaceStation():setPosition(-1000, -1000):setTemplate('Huge Station'):setFaction("Human Navy"):setRotation(random(0, 360))
    --player1 = PlayerSpaceship():setFaction("Human Navy"):setTemplate("Atlantis"):setRotation(200)
    --player2 = PlayerSpaceship():setFaction("Human Navy"):setTemplate("Atlantis"):setRotation(0)
    --Nebula():setPosition(-5000, 0)
    --Artifact():setPosition(1000, 9000):setModel("small_frigate_1"):setDescription(_("scienceDescription-artifact", "An old space derelict."))
    --Artifact():setPosition(9000, 2000):setModel("small_frigate_1"):setDescription(_("scienceDescription-artifact", "A wrecked ship."))
    --Artifact():setPosition(3000, 4000):setModel("small_frigate_1"):setDescription(_("scienceDescription-artifact", "Tons of rotting plasteel."))
    --addGMFunction(_("buttonGM", "move 1 to 2"), function() player1:transferPlayersToShip(player2) end)
    --addGMFunction(_("buttonGM", "move 2 to 1"), function() player2:transferPlayersToShip(player1) end)
    --CpuShip():setTemplate("Adder MK5"):setPosition(0, 0):setRotation(0):setFaction("Human Navy")
    --CpuShip():setTemplate("Piranha F12"):setPosition(2000, 0):setRotation(-90):setFaction("Kraylor")
	
	local planet1 = makePlanet("Planet", "Small"):setPosition(5000, 5000)
	local moon1 = makePlanet("Moon", "Small"):setPosition(5000, 15000)
	local sun1 = makePlanet("Star", "Small"):setPosition(5000,0)
	planet1:setOrbit(sun1, 40)
    moon1:setOrbit(planet1, 20.0)
	
	    

	mainWPMenuButtons()
			

	
end

function startWorldpaintGlobalVars()
--global vars
	C1X = 0 -- Coord 1/2/Temp x/Y
	C1Y = 0
	C2X = 0
	C2Y = 0
	C3X = 0
	C3Y = 0
	CTX = 0
	CTY = 0
		
	amountCreate = 100
	modValue = 0 -- for any function call to math button
	typeCreate = Asteroid
	typeCreateString = "Asteroid"
	shapeCreate = "Cube"
	coordGrabMode = "Click"
	addMode = "Add"

	clickedFromLineRand = "no"
	clickedFromLineChance = "no"
	lineRows = 1
	lineChance = 100

	C1Label = "C1"
	C2Label = "C2"
	C3Label = "C3"

	curr_menu = nil

	--planet making vars
	--0 ~ 1
	--planet:setPlanetAtmosphereColor(0.2,0.2,1.0) -- sets a blue atmosphere
	planetR = "Random"
	planetG = "Random"
	planetB = "Random"
	planetType = "Random" --also "Star" "Planet" "Moon" "Gas"
	planetSize = "Random" --also "Small" "Medium" "Large"
	rotateSpeed = "Random"
	smallPlanetMin = 1000
	smallPlanetMax = 4000
	mediumPlanetMin = 5000
	mediumPlanetMax = 10000
	largePlanetMin = 20000
	largePlanetMax = 40000


end


function mainWPMenuButtons()
	curr_menu = mainWPMenuButtons
	
	addGMFunction("Back to Scenario Main", function() wpBackToMain() end)
	
	addGMFunction("ENV", function() 
	clearGMFunctions() envButtons() end)
	
	addGMFunction("FLEET", function() -- doesnt do anything yet
	clearGMFunctions() fleetSpawnButtons() end)
	
	addGMFunction("+Spawn Ship(s)",spawnGMShips) -- from fleet utility
	
	
	--delete unselected
    addGMFunction(
        _("buttonGM", "Delete unselected"), function()
            local gm_selection = getGMSelection()
            for _, obj in ipairs(getAllObjects()) do
                local found = false
                for _, obj2 in ipairs(gm_selection) do
                    if obj == obj2 then
                        found = true
                    end
                end
                if not found then
                    obj:destroy()
                end
            end
        clearGMFunctions() curr_menu() end)
	
	addGMFunction("Zippy!", function() 	--make zippy
		local Zippy
		Zippy = PlayerSpaceship():setTemplate("MP52 Hornet"):setPosition(C1X, C1Y)
		:setWarpDrive(true):setWarpSpeed(4000.00)
		:setHullMax(1):setImpulseMaxSpeed(250.0):setImpulseMaxReverseSpeed(250.0):setRotationMaxSpeed(35.0)
		:setWarpDrive(true):setWarpSpeed(4000.00)
		:setAutoCoolant(true):commandSetAutoRepair(true):setMaxEnergy(2000)
		:setWeaponStorageMax("Mine", 40):setWeaponStorage("Mine", 40)
		:setSystemPowerFactor("reactor", -100.0):setSystemHeatRate("impulse", 0.00):setSystemPowerRate("impulse", 0.00):setSystemHeatRate("warp", 0.00):setSystemPowerRate("warp", 0.00)
	clearGMFunctions() curr_menu() end)
	
	addGMFunction("!!! RESET WORLDPAINT !!!", function() setScenario("scenario_srps10_worldpaint.lua") end) -- resets scenario


end -- function mainWPMenuButtons()

function mainGMButtons() -- from fleet utility, fleet util calls this specific function which must be overwritten here
			clearGMFunctions()
			addGMFunction("+Spawn Ship(s)",mainWPMenuButtons())
end

function wpBackToMain() -- exists to be overwritten in gaining scenario
	clearGMFunctions()
	addGMFunction("BACK TO SCENARIO MAIN", function() mainWPMenuButtons() end ) -- in this one mainWPMenuButtons is top menu
end


function envButtons()
--refresh buttons is clearGMFunctions() envButtons()
curr_menu = envButtons
UpdateCLabels()
clickedFromLineRand = "no"
clickedFromLineChance = "no"


addGMFunction("<< MAIN", function() -- back to MAIN
clearGMFunctions() mainWPMenuButtons() end)
		
addGMFunction(string.format("Make: %s", typeCreateString), function() -- Type toggle, cant do nebuloids yet
	local isChanged = 0
	if typeCreate == Asteroid and isChanged == 0 then typeCreate = Nebula typeCreateString = "Nebula" isChanged = 1 end
	if typeCreate == Nebula and isChanged == 0 then typeCreate = Mine typeCreateString = "Mine" isChanged = 1 end
	if typeCreate == Mine and isChanged == 0 then typeCreate = BlackHole typeCreateString = "BlackHole" isChanged = 1 end
	if typeCreate == BlackHole and isChanged == 0 then typeCreate = Planet typeCreateString = "Planet" isChanged = 1  end				
	if typeCreate == Planet and isChanged == 0 then typeCreate = Asteroid typeCreateString = "Asteroid" isChanged = 1 end				
	clearGMFunctions() envButtons() end)

if typeCreate == Planet then --planet config menu
	addGMFunction("PLANET CONFIG", function()
		clearGMFunctions() planetConfig() end)
end

addGMFunction(string.format("Shape: %s", shapeCreate), function() -- shape button
	local isChanged = 0
	if shapeCreate == "Cube" and isChanged == 0 then shapeCreate = "LineGrid" isChanged = 1 end
	if shapeCreate == "LineGrid" and isChanged == 0 then shapeCreate = "LineRand" isChanged = 1 end
	if shapeCreate == "LineRand" and isChanged == 0 then shapeCreate = "Sphere" isChanged = 1 end
	if shapeCreate == "Sphere" and isChanged == 0 then shapeCreate = "Circle" isChanged = 1 end
	if shapeCreate == "Circle" and isChanged == 0 then shapeCreate = "Single" isChanged = 1 end
	if shapeCreate == "Single" and isChanged == 0 then shapeCreate = "Cube" isChanged = 1 end
	clearGMFunctions() envButtons() end)

if shapeCreate == "LineGrid" or shapeCreate == "LineRand" then --rows/chance submenu button
	addGMFunction(string.format("R: %s Ch: %s", lineRows, lineChance), function() 
	clearGMFunctions() lineSubButtons() end)
end

addGMFunction(string.format("Amount: %s", amountCreate), function() -- Amount Change Submenu
	modValue = amountCreate
	clearGMFunctions() amountCreateButtons() end)

addGMFunction("Make it!", function() --Make it!
makeIt(typeCreate, amountCreate, shapeCreate, C1X, C1Y, C2X, C2Y, C3X, C3Y)
clearGMFunctions() envButtons() end)

coordSetButtons() --calls the coordSet buttons when in this menu

end -- function envButtons()

function planetConfig()

addGMFunction("<< ENV", function() -- back to MAIN
clearGMFunctions() envButtons() end)
		
addGMFunction("## Planet Config", function() clearGMFunctions() planetConfig() end)

addGMFunction(string.format("Type: %s", planetType), function()
	local isChanged = 0
	if 	planetType == "Random" and isChanged == 0 then planetType = "Planet" isChanged = 1 end
	if 	planetType == "Planet" and isChanged == 0 then planetType = "Star" isChanged = 1 end
	if 	planetType == "Star" and isChanged == 0 then planetType = "Moon" isChanged = 1 end
	if 	planetType == "Moon" and isChanged == 0 then planetType = "Gas" isChanged = 1 end
	if 	planetType == "Gas" and isChanged == 0 then planetType = "Random" isChanged = 1 end
clearGMFunctions() planetConfig() end)



addGMFunction(string.format("Size: %s", planetSize), function()
	local isChanged = 0
	if 	planetSize == "Random" and isChanged == 0 then planetSize = "Small" isChanged = 1 end
	if 	planetSize == "Small" and isChanged == 0 then planetSize = "Medium" isChanged = 1 end
	if 	planetSize == "Medium" and isChanged == 0 then planetSize = "Large" isChanged = 1 end
	if 	planetSize == "Large" and isChanged == 0 then planetSize = "Random" isChanged = 1 end
clearGMFunctions() planetConfig() end)

addGMFunction(string.format("Red: %s", planetR), function()
	local isChanged = 0
	if 	planetR == "Random" and isChanged == 0 then planetR = .1 isChanged = 1 end
	if 	planetR == .1 and isChanged == 0 then planetR = .2 isChanged = 1 end
	if 	planetR == .2 and isChanged == 0 then planetR = .3 isChanged = 1 end
	if 	planetR == .3 and isChanged == 0 then planetR = .4 isChanged = 1 end
	if 	planetR == .4 and isChanged == 0 then planetR = .5 isChanged = 1 end
	if 	planetR == .5 and isChanged == 0 then planetR = .6 isChanged = 1 end
	if 	planetR == .6 and isChanged == 0 then planetR = .7 isChanged = 1 end
	if 	planetR == .7 and isChanged == 0 then planetR = .8 isChanged = 1 end
	if 	planetR == .8 and isChanged == 0 then planetR = .9 isChanged = 1 end
	if 	planetR == .9 and isChanged == 0 then planetR = 1.0 isChanged = 1 end
	if 	planetR == 1.0 and isChanged == 0 then planetR = "Random" isChanged = 1 end
clearGMFunctions() planetConfig() end)

addGMFunction(string.format("Green: %s", planetG), function()
	local isChanged = 0
	if 	planetG == "Random" and isChanged == 0 then planetG = .1 isChanged = 1 end
	if 	planetG == .1 and isChanged == 0 then planetG = .2 isChanged = 1 end
	if 	planetG == .2 and isChanged == 0 then planetG = .3 isChanged = 1 end
	if 	planetG == .3 and isChanged == 0 then planetG = .4 isChanged = 1 end
	if 	planetG == .4 and isChanged == 0 then planetG = .5 isChanged = 1 end
	if 	planetG == .5 and isChanged == 0 then planetG = .6 isChanged = 1 end
	if 	planetG == .6 and isChanged == 0 then planetG = .7 isChanged = 1 end
	if 	planetG == .7 and isChanged == 0 then planetG = .8 isChanged = 1 end
	if 	planetG == .8 and isChanged == 0 then planetG = .9 isChanged = 1 end
	if 	planetG == .9 and isChanged == 0 then planetG = 1.0 isChanged = 1 end
	if 	planetG == 1.0 and isChanged == 0 then planetG = "Random" isChanged = 1 end
clearGMFunctions() planetConfig() end)

addGMFunction(string.format("Blue: %s", planetB), function()
	local isChanged = 0
	if 	planetB == "Random" and isChanged == 0 then planetB = .1 isChanged = 1 end
	if 	planetB == .1 and isChanged == 0 then planetB = .2 isChanged = 1 end
	if 	planetB == .2 and isChanged == 0 then planetB = .3 isChanged = 1 end
	if 	planetB == .3 and isChanged == 0 then planetB = .4 isChanged = 1 end
	if 	planetB == .4 and isChanged == 0 then planetB = .5 isChanged = 1 end
	if 	planetB == .5 and isChanged == 0 then planetB = .6 isChanged = 1 end
	if 	planetB == .6 and isChanged == 0 then planetB = .7 isChanged = 1 end
	if 	planetB == .7 and isChanged == 0 then planetB = .8 isChanged = 1 end
	if 	planetB == .8 and isChanged == 0 then planetB = .9 isChanged = 1 end
	if 	planetB == .9 and isChanged == 0 then planetB = 1.0 isChanged = 1 end
	if 	planetB == 1.0 and isChanged == 0 then planetB = "Random" isChanged = 1 end
clearGMFunctions() planetConfig() end)

addGMFunction(string.format("Rotate Speed: %s", rotateSpeed), function()
	local isChanged = 0
	if 	rotateSpeed == "Random" and isChanged == 0 then rotateSpeed = 0 isChanged = 1 end
	if 	rotateSpeed == 0 and isChanged == 0 then rotateSpeed = 10 isChanged = 1 end
	if 	rotateSpeed == 10 and isChanged == 0 then rotateSpeed = 20 isChanged = 1 end
	if 	rotateSpeed == 20 and isChanged == 0 then rotateSpeed = 30 isChanged = 1 end
	if 	rotateSpeed == 30 and isChanged == 0 then rotateSpeed = 40 isChanged = 1 end
	if 	rotateSpeed == 40 and isChanged == 0 then rotateSpeed = 50 isChanged = 1 end
	if 	rotateSpeed == 50 and isChanged == 0 then rotateSpeed = 60 isChanged = 1 end
	if 	rotateSpeed == 60 and isChanged == 0 then rotateSpeed = 70 isChanged = 1 end
	if 	rotateSpeed == 70 and isChanged == 0 then rotateSpeed = 80 isChanged = 1 end
	if 	rotateSpeed == 80 and isChanged == 0 then rotateSpeed = 90 isChanged = 1 end
	if 	rotateSpeed == 90 and isChanged == 0 then rotateSpeed = 100 isChanged = 1 end
	if 	rotateSpeed == 100 and isChanged == 0 then rotateSpeed = "Random" isChanged = 1 end
clearGMFunctions() planetConfig() end)





end -- function planetConfig()

function lineSubButtons()
	addGMFunction("<< BACK", function() -- back to MAIN
	clearGMFunctions() curr_menu() end)
	
	addGMFunction(string.format("Shape: %s", shapeCreate), function() -- shows current Shape
	clearGMFunctions() lineSubButtons() end)
	
addGMFunction(string.format("Rows: %s", lineRows), function() --rows button
	modValue = lineRows
	clickedFromLineRand = "yes"
clearGMFunctions() amountCreateButtons() end)

addGMFunction(string.format("Chance: %s", lineChance), function() --chance button
	modValue = lineChance
	clickedFromLineChance = "yes"
clearGMFunctions() amountCreateButtons() end)

	
	

end

function fleetSpawnButtons() --nothing here yet!
	curr_menu = fleetSpawnButtons
	UpdateCLabels()

	addGMFunction("<< MAIN", function() 
	clearGMFunctions() mainWPMenuButtons() end)
	
	coordSetButtons()
end

function coordSetButtons() --doesnt draw itself, draws curr_menu (for future spbo support) only called by other menus

addGMFunction(string.format("Coord Mode: %s", coordGrabMode), function() --add toggle to switch between click and highlight mode
	local isChanged = 0
	if coordGrabMode == "Click" and isChanged == 0 then coordGrabMode = "Select" isChanged = 1 end
	if coordGrabMode == "Select" and isChanged == 0 then coordGrabMode = "Click" isChanged = 1 end
	clearGMFunctions() curr_menu() end)

if coordGrabMode == "Click" then --set temp coords to click
	addGMFunction(string.format("CT: %s %s", round(CTX,1), round(CTY,1)), function()
				onGMClick(function(x,y) CTX, CTY = x,y clearGMFunctions() curr_menu() end)
				end)
	end
	
if coordGrabMode == "Select" then --pull coords from highlighted objects v1
	addGMFunction(string.format("CT: %s %s", round(CTX,1), round(CTY,1)), function() for _, obj in ipairs(getGMSelection()) do
		CTX, CTY = obj:getPosition() end
	clearGMFunctions() curr_menu() end)
end

----------------
-- c1
-----------------
addGMFunction(string.format("%s: %s %s.", C1Label, round(C1X,1), round(C1Y,1)), function() C1X, C1Y = CTX, CTY clearGMFunctions() curr_menu() end) -- lock CT to C1
----------------
-- c2
-----------------
if shapeCreate == "Circle" then
addGMFunction(string.format("%s: %s.", C2Label, round(distance(C1X, C1Y, C2X, C2Y))), function() C2X, C2Y = CTX, CTY clearGMFunctions() curr_menu() end)
else
addGMFunction(string.format("%s: %s %s.", C2Label, round(C2X,1), round(C2Y,1)), function() C2X, C2Y = CTX, CTY clearGMFunctions() curr_menu() end) -- lock CT to C2
end
----------------
-- c3
-----------------
if shapeCreate == "LineGrid" or shapeCreate == "LineRand" then
	addGMFunction(string.format("%s: %s.", C3Label, round(distance(C1X, C1Y, C3X, C3Y))), function() C3X, C3Y = CTX, CTY clearGMFunctions() curr_menu() end) --lock CT to C3, show distance between c1/c3
elseif shapeCreate == "Circle" then
	addGMFunction(string.format("%s: %s.", C3Label, round(distance(C2X, C2Y, C3X, C3Y))), function() C3X, C3Y = CTX, CTY clearGMFunctions() curr_menu() end) --lock CT to C3, show distance between c2/c3 for thickness
elseif shapeCreate == "Sphere" then
	addGMFunction(string.format("%s: %s.", C3Label, round(distance(C1X, C1Y, C3X, C3Y))), function() C3X, C3Y = CTX, CTY clearGMFunctions() curr_menu() end) --lock CT to C3, show distance between c1/c3
elseif shapeCreate == "Cube" or shapeCreate == "Single" then
	addGMFunction(string.format("%s: %s %s.", C3Label, round(C3X,1), round(C3Y,1)), function() C3X, C3Y = CTX, CTY clearGMFunctions() curr_menu() end) -- lock CT to C3
end

end

function amountCreateButtons() --IF in the back button and valset in call button for handling all math

	addGMFunction("<< BACK", function() 
	if curr_menu == envButtons and clickedFromLineRand == "yes" then lineRows = modValue end
	if curr_menu == envButtons and clickedFromLineChance == "yes" then 
	if lineChance > 100 then lineChance = 100 end
	lineChance = modValue
	end
	if curr_menu == envButtons and clickedFromLineRand == "no" and clickedFromLineChance == "no" then amountCreate = modValue end
	clearGMFunctions() curr_menu() end)
	
	addGMFunction(string.format("Amount: %s", modValue), function() clearGMFunctions() amountCreateButtons() end) -- display only button

	--quickset buttons
	addGMFunction("Quick 1", function() 
	modValue = 1
	clearGMFunctions() amountCreateButtons() end)
	addGMFunction("Quick 10", function() 
	modValue = 10
	clearGMFunctions() amountCreateButtons() end)
	addGMFunction("Quick 25", function() 
	modValue = 25
	clearGMFunctions() amountCreateButtons() end)
	addGMFunction("Quick 50", function() 
	modValue = 50
	clearGMFunctions() amountCreateButtons() end)
	addGMFunction("Quick 100", function() 
	modValue = 100
	clearGMFunctions() amountCreateButtons() end)
	
	--Add/Subtract button
	addGMFunction(string.format("%s", addMode), function() 
	local isChanged = 0
	if addMode == "Add" and isChanged == 0 then addMode = "Subtract" isChanged = 1 end
	if addMode == "Subtract" and isChanged == 0 then addMode = "Add" isChanged = 1 end
	clearGMFunctions() amountCreateButtons() end)
	
	--by value buttons
	addGMFunction("by 1", function() 
	if addMode == "Add" then modValue = modValue + 1 end
	if addMode == "Subtract" then modValue = modValue - 1 end
	clearGMFunctions() amountCreateButtons() end)
	addGMFunction("by 10", function() 
	if addMode == "Add" then modValue = modValue + 10 end
	if addMode == "Subtract" then modValue = modValue - 10 end
	clearGMFunctions() amountCreateButtons() end)
	addGMFunction("by 100", function() 
	if addMode == "Add" then modValue = modValue + 100 end
	if addMode == "Subtract" then modValue = modValue - 100 end
	clearGMFunctions() amountCreateButtons() end)
	addGMFunction("by 1000", function() 
	if addMode == "Add" then modValue = modValue + 1000 end
	if addMode == "Subtract" then modValue = modValue - 1000 end
	clearGMFunctions() amountCreateButtons() end)
	
end

function cleanup()
    -- Clean up the current play field. Find all objects and destroy everything that is not a player.
    -- If it is a player, position him in the center of the scenario.
    for _, obj in ipairs(getAllObjects()) do
        if obj.typeName == "PlayerSpaceship" then
            obj:setPosition(random(-100, 100), random(-100, 100))
        else
            obj:destroy()
        end
    end
end

function update(delta)
    -- No victory condition
	
	

	
	
	
end

function UpdateCLabels() -- keeps coordinate buttons labeled to what they're for
	if curr_menu == fleetSpawnButtons then
		C1Label = "C1"
		C2Label = "C2"
		C3Label = "C3"
	end	
	if curr_menu == envButtons then
		if shapeCreate == "Cube" then C1Label = "P1" C2Label = "P2" C3Label = "NA" end
		if shapeCreate == "LineGrid" or shapeCreate == "LineRand" then C1Label = "P1" C2Label = "P2" C3Label = "Gap 1~3" end
		if shapeCreate == "Circle" then C1Label = "Cntr" C2Label = "Mid" C3Label = "Edge" end
		if shapeCreate == "Sphere" then	C1Label = "Cntr" C2Label = "NA" C3Label = "Edge" end
		if shapeCreate == "Single" then	C1Label = "P1" C2Label = "NA" C3Label = "NA" end
	end
end

onNewPlayerShip(	-- Set callback function
    function(ship)
        -- Decide what you do with new ships:
        print(ship, ship.typeName, ship:getTypeName(), ship:getCallSign())
        -- ship:destroy()
    end
)

function round(x, n) --rounding function to truncate long coords in buttons
	if x == nil then x = 0 end -- prevents nil round errors
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end

function makeIt(obj_type, amount, shape, x1, y1, x2, y2, x3, y3)
	
	
--catch nonstandard obj_types here and fix them for further
	--nebula with asteroids in its coverage
	--nebula with mines it its coverage
	if obj_type == Planet then
		obj_type = makePlanet(planetType, planetSize, planetR, planetG, plantB, rotateSpeed)
		obj_type:setPosition(x1,y1)
	end

	
	

	
--standard obj_types here
	if shape == "Cube" then
		for n = 1, amount do
			obj_type():setPosition(random(math.min(x1, x2), math.max(x1, x2)), random(math.min(y1, y2), math.max(y1, y2)))
		end
	end
		
	if shape == "LineGrid" then
		for n = 1, amount do
			--createObjectsOnLine(x1, y1, x2, y2, spacing, object_type, rows (1 default), chance (100% default), randomize(0 default, grid))
			createObjectsOnLine(x1, y1, x2, y2, distance(x1, y1, x3, y3), obj_type, lineRows, lineChance, 0)
		end
	end

	if shape == "LineRand" then
		for n = 1, amount do
			--createObjectsOnLine(x1, y1, x2, y2, spacing, object_type, rows (1 default), chance (100% default), randomize(0 default, grid))
			createObjectsOnLine(x1, y1, x2, y2, distance(x1, y1, x3, y3), obj_type, lineRows, lineChance)
		end
	end
	
	if shape == "Sphere" then
		placeRandomAroundPoint(obj_type, amount, 0, distance(x1, y1, x3, y3), x1, y1)
	end
		
	if shape == "Circle" then
		placeRandomAroundPoint(obj_type, amount, distance(x1, y1, x2, y2), distance(x1, y1, x3, y3), x1, y1)
	end
	
	if shape == "Single" then
		 obj_type():setPosition(x1, y1)
	end
		 

--line has chance (0-100%) row (def 1) and random (??)options
-- how set random # on line?
--local px = x1 + xd * cnt_x + yd * (cnt_y - (rows - 1) * spacing * 0.5) + random(-randomize, randomize)

end -- function makeIt(obj_type, amount, shape, x1, y1, x2, y2, x3, y3)

function makePlanet(planet_type, planet_size, xr, xg, xb, rotate_speed) -- x/y required, else nil or 'r' means randomset
thisPlanet = Planet()


--type
   if planet_type == nil or planet_type == "Random" then
   		local i = irandom(1,4)
		if i == 1 then planet_type = "Star" end
		if i == 2 then planet_type = "Gas" end
		if i == 3 then planet_type = "Moon" end
		if i == 4 then planet_type = "Planet" end
	end


--atmosphere
	if planet_type == "Star" then
		thisPlanet:setPlanetAtmosphereTexture("planets/star-1.png")
	end

	if planet_type == "Planet" or planet_type == "Gas" then
		thisPlanet:setPlanetSurfaceTexture("planets/atmosphere.png")
	end


--surface texture
	if planet_type == "Planet" then
		local i = irandom(1,5)
		if i == 1 then thisPlanet:setPlanetSurfaceTexture("planets/planet-1.png") end
		if i == 2 then thisPlanet:setPlanetSurfaceTexture("planets/planet-2.png") end
		if i == 3 then thisPlanet:setPlanetSurfaceTexture("planets/planet-3.png") end
		if i == 4 then thisPlanet:setPlanetSurfaceTexture("planets/planet-4.png") end
		if i == 5 then thisPlanet:setPlanetSurfaceTexture("planets/planet-5.png") end
	end
	
	if planet_type == "Moon" then
		local i = irandom(1,3)
		if i == 1 then thisPlanet:setPlanetSurfaceTexture("planets/moon-1.png") end
		if i == 2 then thisPlanet:setPlanetSurfaceTexture("planets/moon-2.png") end
		if i == 3 then thisPlanet:setPlanetSurfaceTexture("planets/moon-3.png") end
	end
	
	if planet_type == "Gas" then
		local i = irandom(1,3)
		if i == 1 then thisPlanet:setPlanetSurfaceTexture("planets/gas-1.png") end
		if i == 2 then thisPlanet:setPlanetSurfaceTexture("planets/gas-2.png") end
		if i == 3 then thisPlanet:setPlanetSurfaceTexture("planets/gas-3.png") end
	end
	
	
--clouds
	if planet_type == "Planet" or planet_type == "Gas" then
		local i = irandom(1,4) -- chance of no clouds
		if i == 1 then thisPlanet:setPlanetSurfaceTexture("planets/clouds-1.png") end
		if i == 2 then thisPlanet:setPlanetSurfaceTexture("planets/clouds-2.png") end
		if i == 3 then thisPlanet:setPlanetSurfaceTexture("planets/clouds-3.png") end
	end


--color
	if xr == nil or xr == "Random" then xr = random(0,1) end
	if xg == nil or xg == "Random" then xg = random(0,1) end
	if xb == nil or xb == "Random" then xb = random(0,1) end

	thisPlanet:setPlanetAtmosphereColor(xr, xg, xb)

--rotate speed
	if rotate_speed == nil or rotate_speed == "Random" then
		thisPlanet:setAxialRotationTime(irandom(20,60))
	else
		thisPlanet:setAxialRotationTime(rotate_speed)
	end

--size
	if planet_size == nil or planet_size == "Random" then
		local i = irandom(1,3)
		if i == 1 then planet_size = "Small" end
		if i == 2 then planet_size = "Medium" end
		if i == 3 then planet_size = "Large" end
	end
	
	if planet_size == "Small" then thisPlanet:setPlanetRadius(random(smallPlanetMin, smallPlanetMax)) end
	if planet_size == "Medium" then thisPlanet:setPlanetRadius(random(mediumPlanetMin, mediumPlanetMax)) end
	if planet_size == "Large" then thisPlanet:setPlanetRadius(random(largePlanetMin, largePlanetMax)) end

return thisPlanet	
end -- planetMake func end
