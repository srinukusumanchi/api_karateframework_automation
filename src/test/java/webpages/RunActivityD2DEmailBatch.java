package webpages;

import baseclass.BasePage;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import java.io.IOException;
import java.util.Set;

public class RunActivityD2DEmailBatch extends BasePage {

    @FindBy(xpath = ".//div[text()='Run']")
    private WebElement runButton;


    public RunActivityD2DEmailBatch() {
        super();
        WebDriver webDriver = getWebDriver();
        PageFactory.initElements(webDriver, this);
        waitForPageLoad();
        waitForElementImplicit(30);
//        LoggingUtils.log("Navigated to Pega Designer Studio Screen");
    }


    public void clickOnRunButton() throws IOException {
        Set<String> browsers = getWindowHandles();
        for (String browser : browsers) {
            switchToChildWindowWithName(browser);
            String browserTitle = getWebDriver().getTitle();
            if (browserTitle.equals("Run")) {
                click(runButton, "Run Button");
                switchToParentWindow();
            }
        }
    }


}
