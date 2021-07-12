import Foundation
import XCTest

class FieldHelper {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    public func clearInputField(field: XCUIElement) {
        guard let stringValue = field.value as? String else {
                    XCTFail("Tried to clear and enter text into a non string value")
                    return
                }
        
        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)
                app.typeText(deleteString)
    }
}
