
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx =  470;
local yy =  250;
local xx2 = 820;
local yy2 = 250;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;
function onCreate()
	makeLuaSprite('bg', 'z', 130, -230);
	--setScrollFactor('bg', 0.5, 0.5);
	setProperty('bg.scale.x', 1.5);
	setProperty('bg.antialiasing', true);
	scaleObject('bg',9,7.5);
	addLuaSprite('bg', false);

	makeLuaSprite('bgtrees', 'XBGTrees', 0, -200);
	setScrollFactor('bgtrees', 0.8, 0.8);
	setProperty('bgtrees.scale.x', 1.5);
	setProperty('bgtrees.antialiasing', true);
	updateHitbox('bgtrees');
	addLuaSprite('bgtrees', false);

	makeLuaSprite('bgplants1', 'XBGPlants1', 0, -200);
	setScrollFactor('bgplants1', 0.9, 0.9);
	setProperty('bgplants1.scale.x', 1.5);
	setProperty('bgplants1.antialiasing', true);
	updateHitbox('bgplants1');
	addLuaSprite('bgplants1', false);

	makeLuaSprite('bgplants2', 'XBGPlants2', 0, -200);
	setScrollFactor('bgplants2', 1, 1);
	setProperty('bgplants2.scale.x', 1.5);
	setProperty('bgplants2.antialiasing', true);
	updateHitbox('bgplants2');
	addLuaSprite('bgplants2', false);

	makeLuaSprite('ground', 'XGround', 0, 0);
	setScrollFactor('ground', 1, 1);
	setProperty('ground.scale.x', 1.5);
	setProperty('ground.antialiasing', true);
	updateHitbox('ground');
	addLuaSprite('ground', false);

	makeLuaSprite('cloud1', 'XFog', 1000, 0)
	setProperty('cloud1.scale.x', 8);
	setProperty('cloud1.scale.y', 8);
	setProperty('cloud1.antialiasing', false);
	setScrollFactor('cloud1', 1.2, 1.2);
	setProperty('cloud1.alpha', 0.7)
	addLuaSprite('cloud1', true);

	makeLuaSprite('cloud2', 'XFog', 2024, 0)
	setProperty('cloud2.scale.x', 8);
	setProperty('cloud2.scale.y', 8);
	setProperty('cloud2.antialiasing', false);
	setScrollFactor('cloud2', 1.2, 1.2);
	setProperty('cloud2.alpha', 0.7)
	addLuaSprite('cloud2', true);

	makeLuaSprite('cloud3', 'XFog', 3048, 0)
	setProperty('cloud3.scale.x', 8);
	setProperty('cloud3.scale.y', 8);
	setProperty('cloud3.antialiasing', false);
	setScrollFactor('cloud3', 1.2, 1.2);
	setProperty('cloud3.alpha', 0.7)
	addLuaSprite('cloud3', true);

	makeLuaSprite('cloud4', 'XFog', -24, 0)
	setProperty('cloud4.scale.x', 8);
	setProperty('cloud4.scale.y', 8);
	setProperty('cloud4.antialiasing', false);
	setScrollFactor('cloud4', 1.2, 1.2);
	setProperty('cloud4.alpha', 0.7)
	addLuaSprite('cloud4', true);

	makeLuaSprite('fgtree', 'XForegroundTree', 0, -100);
	setScrollFactor('fgtree', 1.1, 1.1);
	setProperty('fgtree.scale.x', 1.5);
	setProperty('fgtree.antialiasing', true);
	updateHitbox('fgtree');
	addLuaSprite('fgtree', true);

	makeLuaSprite('fgplants', 'XForegroundPlants', 200, 70);
	setScrollFactor('fgplants', 1.2, 1.2);
	setProperty('fgplants.scale.x', 1.5);
	scaleObject('fgplants',16,12);
	setProperty('fgplants.antialiasing', true);
	updateHitbox('fgplants');
	addLuaSprite('fgplants', true);

	makeLuaSprite('flashSprite', '', 0, 0)
	makeGraphic('flashSprite', 1920, 1080, 'B30000')
	setScrollFactor('flashSprite', 0, 0);
	setObjectCamera('flashSprite', 'other')
	setProperty('flashSprite.alpha', 0)
	addLuaSprite('flashSprite', true);
end

function onCreatePost()
	setProperty('gf.alpha', 0.001)
	doTweenX('Cloud1Move', 'cloud1', getProperty('cloud1.x')-1024, 20, 'linear')
	doTweenX('Cloud2Move', 'cloud2', getProperty('cloud2.x')-1024, 20, 'linear')
	doTweenX('Cloud3Move', 'cloud3', getProperty('cloud3.x')-1024, 20, 'linear')
	doTweenX('Cloud4Move', 'cloud4', getProperty('cloud4.x')-1024, 20, 'linear')
	setProperty('cloud1.alpha', 0)
	setProperty('cloud2.alpha', 0)
	setProperty('cloud3.alpha', 0)
	setProperty('cloud4.alpha', 0)
	
end

function onTweenCompleted(tag)
	if tag == 'Cloud1Move' then
		setProperty('cloud1.x', 1000)
		doTweenX('Cloud1Move', 'cloud1', getProperty('cloud1.x')-1024, 20, 'linear')
	elseif tag == 'Cloud2Move' then
		setProperty('cloud2.x', 2024)
		doTweenX('Cloud2Move', 'cloud2', getProperty('cloud2.x')-1024, 20, 'linear')
	elseif tag == 'Cloud3Move' then
		setProperty('cloud3.x', 3048)
		doTweenX('Cloud3Move', 'cloud3', getProperty('cloud3.x')-1024, 20, 'linear')
	elseif tag == 'Cloud4Move' then
		setProperty('cloud4.x', -24)
		doTweenX('Cloud4Move', 'cloud4', getProperty('cloud4.x')-1024, 20, 'linear')
	end
end

function onPause()
    addHaxeLibrary('FlxTween', 'flixel.tweens')
runHaxeCode([[
    FlxTween.globalManager.forEach(
        function(t:FlxTween) {
            t.active = false;
        }
    );
]])
end

function onResume()
    addHaxeLibrary('FlxTween', 'flixel.tweens')
runHaxeCode([[
    FlxTween.globalManager.forEach(
        function(t:FlxTween) {
            t.active = true;
        }
    );
]])
end