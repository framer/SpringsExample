layerA = new Layer
	backgroundColor: "red"
layerB = new Layer
	backgroundColor: "blue"
	y: 250

duration = 3
dampingRatio = 0.25
delay = 1

layerA.animate
	x: 300
	options:
		time: duration
		curve: Spring(damping: 0.25)
		delay: delay

# These values are retrieved by right clicking the above animation
# and selecting Copy Animation -> Tension and Friction
tension = 54.83363359078326
friction = 3.702486785620688

layerB.animate
	x: 300
	options:
		curve: Spring(tension: tension, friction: friction)
		delay: delay