//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

// Setup the playground view
let view = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 500))
view.backgroundColor = .white
PlaygroundPage.current.liveView = view

// Create the two layers
var layerA = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
var layerB = UIView(frame: CGRect(x: 0, y: 250, width: 200, height: 200))
layerA.backgroundColor = .red
layerB.backgroundColor = .blue

// Add them to the view
view.addSubview(layerA)
view.addSubview(layerB)

// The values copied from framer
let duration: TimeInterval = 3
let dampingRatio: CGFloat = 0.25
let delay: TimeInterval = 1

// Standard UIView animate API: https://developer.apple.com/documentation/uikit/uiview/1622594-animate
UIView.animate(withDuration: duration,
               delay: delay,
               usingSpringWithDamping: dampingRatio,
               initialSpringVelocity: 0, options: [],
               animations: {
                layerA.frame.origin.x = 300
               },
               completion: nil)

// These values are retrieved by right clicking the animation in Framer
// and selecting Copy Animation -> Tension and Friction
let tension: CGFloat = 54.83363359078326
let friction: CGFloat = 3.702486785620688

// Animation using CASpringAnimation: https://developer.apple.com/documentation/quartzcore/caspringanimation
let animation = CASpringAnimation(keyPath: "position.x")

// We're animating the center, so adjust the animation from and to values for that
animation.fromValue = 0 + layerB.frame.midX
let toValue = 300 + layerB.frame.midX
animation.toValue = toValue

// Stiffness and tension are the same thing
animation.stiffness = tension
// Damping and friction are the same thing (beware: dampingRatio is something else)
animation.damping = friction

// Mass is always 1 on iOS, initialVelocity is only needed
// if you start an animation when the is view already moving (i.e. at the end of a drag)
animation.mass = 1
animation.initialVelocity = 0
animation.beginTime = CACurrentMediaTime() + delay
animation.duration = animation.settlingDuration

CATransaction.setCompletionBlock({
    layerB.layer.position.x = toValue
})
layerB.layer.add(animation, forKey: nil)
CATransaction.commit()


