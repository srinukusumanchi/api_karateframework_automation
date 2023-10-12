package webpages;

import baseclass.BasePage;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import java.io.IOException;

public class D2DEmailBatch extends BasePage {

    @FindBy(xpath = ".//button[contains(text(),'Actions')]/child::i")
    private WebElement actions;

    @FindBy(xpath = "(.//span[text()='Run'])[2]")
    private WebElement runButton;


    public D2DEmailBatch() {
        super();
        WebDriver webDriver = getWebDriver();
        PageFactory.initElements(webDriver, this);
        waitForPageLoad();
        waitForElementImplicit(30);
//        LoggingUtils.log("Navigated to Pega Designer Studio Screen");
    }


    public void clickOnRunButton() throws IOException {
        switchToFrameByName("PegaGadget0Ifr");
        click(runButton, "Run Button");
        switchToParentFrame();
    }

    public void clickOnActions() throws IOException {
        switchToFrameByName("PegaGadget0Ifr");
        click(actions, "Action Button");
        switchToParentFrame();
    }

}
