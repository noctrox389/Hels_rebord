function onEvent(n, v1, v2)
	if n == 'FogToggle' then
		setProperty('cloud1.alpha', 0.7)
		setProperty('cloud2.alpha', 0.7)
		setProperty('cloud3.alpha', 0.7)
		setProperty('cloud4.alpha', 0.7)
	end
end