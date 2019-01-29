
import UIKit

func sketchSize(_ size: Float) -> Float {
    let screenWidth = Float(UIScreen.main.bounds.size.width)
    let iPhonePlusWidth = Float(414.0)
    let scale = screenWidth / iPhonePlusWidth
    let scaledSize = size * scale
    return abs(scaledSize) <= abs(size) ? scaledSize : size
}

func sketchSizeHeight(_ size: Float) -> Float {
    let screenHeight = Float(UIScreen.main.bounds.size.height)
    let iPhoneHeight = Float(667.0)
    let scale = screenHeight / iPhoneHeight
    let scaledSize = size * scale
    return scaledSize
}

func sketchSizeWidth(_ size: Float) -> Float {
    let screenWidth = Float(UIScreen.main.bounds.size.width)
    let iPhoneWidth = Float(375.0)
    let scale = screenWidth / iPhoneWidth
    let scaledSize = size * scale
    return scaledSize
}
