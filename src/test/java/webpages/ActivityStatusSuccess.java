package webpages;

import baseclass.BasePage;
import junit.framework.Assert;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import java.io.IOException;
import java.util.Set;

public class ActivityStatusSuccess extends BasePage {

    @FindBy(xpath = ".//div[contains(text(),'The Operation completed successfully, but returned no content')]")
    private WebElement status;


    public ActivityStatusSuccess() {
        super();
        WebDriver webDriver = getWebDriver();
        PageFactory.initElements(webDriver, this);
        waitForPageLoad();
        waitForElementImplicit(30);
//        LoggingUtils.log("Navigated to Pega Designer Studio Screen");
    }


    public void verifyStatus(String cid) throws InterruptedException, IOException {
        Set<String> browsers = getWindowHandles();
        for (String browser : browsers) {
            switchToChildWindowWithName(browser);
            String browserTitle = getWebDriver().getTitle();
            if (browserTitle.equals("Pega Platform - Success")) {
                switchToChildWindowWithName(browser);
                String statusValue = getText(status);
                if (statusValue.trim().contains("The Operation completed successfully, but returned no content")) {
//                    Pass statement
                } else {
                    Assert.fail("Unable to clear delete interaction history for CID:-" + cid);
                }

            }
        }

    }


}
