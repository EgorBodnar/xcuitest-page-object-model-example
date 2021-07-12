import XCTest

class XCUITestSandboxUITests: XCTestCase {
    

    override func setUpWithError() throws {
        continueAfterFailure = false
        XCUIApplication().launch();
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testElementsPresent() throws {
        let app = XCUIApplication()
        let mainScreen = MainScreen(app: app)
        
        XCTAssert(mainScreen.alphaStatementTitle.exists)
        XCTAssert(mainScreen.inputField.exists)
        XCTAssert(mainScreen.textOutput.exists)
        XCTAssert(mainScreen.slider.exists)
        XCTAssert(mainScreen.progressLine.exists)
        XCTAssert(mainScreen.omegaButton.exists)
        XCTAssert(mainScreen.alphaButton.exists)
        XCTAssert(mainScreen.ChooseRedButton.exists)
        XCTAssert(mainScreen.ChooseGreenButton.exists)
        XCTAssert(mainScreen.ChooseBlueButton.exists)
    }
    
    func testChooseColor() throws {
        let app = XCUIApplication()
        let mainScreen = MainScreen(app: app)
        
        mainScreen.ChooseRedButton.tap()
        XCTAssert(mainScreen.allertWindow.element.exists, "There is no Allert window")
        XCTAssert(mainScreen.allertOkButton.exists, "There is no OK button")
        XCTAssertEqual(mainScreen.allertWindow.staticTexts["Red"].label, "Red", "Wrong title, should be 'Red'")
        mainScreen.allertOkButton.tap()
        
        mainScreen.ChooseBlueButton.tap()
        XCTAssertEqual(mainScreen.allertWindow.staticTexts["Blue"].label, "Blue", "Wrong title, should be 'Blue'")
        mainScreen.allertOkButton.tap()
        
        mainScreen.ChooseGreenButton.tap()
        XCTAssertEqual(mainScreen.allertWindow.staticTexts["Green"].label, "Green", "Wrong title, should be 'Green'")
        mainScreen.allertOkButton.tap()
        
        XCTAssert(!mainScreen.allertWindow.element.exists, "Allert window should not be displayed")
    }
    
    func testSlider() throws {
        let app = XCUIApplication()
        let mainScreen = MainScreen(app: app)
        
        XCTAssertEqual(mainScreen.progressLine.value as! String, "49%")
        mainScreen.slider.adjust(toNormalizedSliderPosition : 0.0)
        XCTAssertEqual(mainScreen.progressLine.value as! String, "99%")
        mainScreen.slider.adjust(toNormalizedSliderPosition : 1.0)
        XCTAssertEqual(mainScreen.progressLine.value as! String, "0%")
        mainScreen.slider.adjust(toNormalizedSliderPosition : 0.5)
        XCTAssertEqual(mainScreen.progressLine.value as! String, "49%")
    }
    
    func testStatementTogle() throws {
        let app = XCUIApplication()
        let mainScreen = MainScreen(app: app)
        
        XCTAssert(mainScreen.alphaStatementTitle.exists)
        XCTAssert(!mainScreen.omegaStatementTitle.exists)
        
        mainScreen.omegaButton.tap()
        XCTAssert(mainScreen.omegaStatementTitle.exists)
        XCTAssert(!mainScreen.alphaStatementTitle.exists)
        
        mainScreen.alphaButton.tap()
        XCTAssert(mainScreen.alphaStatementTitle.exists)
        XCTAssert(!mainScreen.omegaStatementTitle.exists)
    }
    
    func testInputText() throws {
        let app = XCUIApplication()
        let mainScreen = MainScreen(app: app)
        let fieldHelper = FieldHelper( app: app)
        
        let firstTextForTest = "Test text"
        let secondTextForTest = "Second test text!"
        
        XCTAssertEqual(mainScreen.textOutput.label, "")
        
        mainScreen.inputField.tap()
        mainScreen.inputField.typeText(firstTextForTest)
        XCTAssertEqual(mainScreen.textOutput.label, firstTextForTest)
        
        fieldHelper.clearInputField(field: mainScreen.inputField)
        XCTAssertEqual(mainScreen.textOutput.label, "")
        
        mainScreen.inputField.tap()
        mainScreen.inputField.typeText(secondTextForTest)
        XCTAssertEqual(mainScreen.textOutput.label, secondTextForTest)
    }
}
