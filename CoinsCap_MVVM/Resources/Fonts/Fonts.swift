
import UIKit

enum Fonts {
    
    static var avenirBold: UIFont {
        return try! getFont("Roboto-Bold")
    }
    
    private static func getFont(_ fontName: String, with size: CGFloat = 16) throws -> UIFont {
        guard let font = UIFont(name: fontName, size: size) else {
            fatalError("""
                Failed to load the \(fontName) font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        return font
    }
}
