import Foundation
import XCTest

class MainScreen {
    
    let app: XCUIApplication
    
    let alphaStatementTitle: XCUIElement
    let omegaStatementTitle: XCUIElement
    
    let inputField: XCUIElement
    let textOutput: XCUIElement
    
    let slider: XCUIElement
    let progressLine: XCUIElement
    
    let allertWindow: XCUIElementQuery
    let allertOkButton: XCUIElement
    
    let omegaButton: XCUIElement
    let alphaButton: XCUIElement
    
    let ChooseRedButton: XCUIElement
    let ChooseGreenButton: XCUIElement
    let ChooseBlueButton: XCUIElement

    init(app: XCUIApplication) {
        self.app = app
        
        alphaStatementTitle = app.navigationBars["Alpha"].staticTexts["Alpha"]
        omegaStatementTitle = app.navigationBars["Omega"].staticTexts["Omega"]
        
        inputField = app.textFields["input_field"]
        textOutput = app/*@START_MENU_TOKEN@*/.staticTexts["text_output"]/*[[".staticTexts[\"dddd\"]",".staticTexts[\"text_output\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        slider = app.sliders["slider_id"]
        progressLine = app/*@START_MENU_TOKEN@*/.progressIndicators["progress_line_id"]/*[[".progressIndicators[\"Progress\"]",".progressIndicators[\"progress_line_id\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        allertWindow = app.alerts["chosen_color_alert_id"].scrollViews.otherElements
        allertOkButton = allertWindow.buttons["OK"]
        
        omegaButton = app/*@START_MENU_TOKEN@*/.buttons["Omega"]/*[[".segmentedControls.buttons[\"Omega\"]",".buttons[\"Omega\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        alphaButton = app.buttons["Alpha"]
        
        ChooseRedButton = app/*@START_MENU_TOKEN@*/.buttons["Red"].staticTexts["Red"]/*[[".buttons[\"Red\"].staticTexts[\"Red\"]",".staticTexts[\"Red\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
        ChooseGreenButton = app.buttons["Green"].staticTexts["Green"]
        ChooseBlueButton = app.buttons["Blue"].staticTexts["Blue"]
    }

}
