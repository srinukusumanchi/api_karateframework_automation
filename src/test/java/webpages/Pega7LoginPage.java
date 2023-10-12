package webpages;

import baseclass.BasePage;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import java.io.IOException;

public class Pega7LoginPage extends BasePage {

    @FindBy(id = "txtUserID")
    private WebElement userName;

    @FindBy(id = "txtPassword")
    private WebElement password;

    @FindBy(id = "sub")
    private WebElement login;

    public Pega7LoginPage() {
        super();
        WebDriver webDriver = getWebDriver();
        PageFactory.initElements(webDriver, this);
        waitForPageLoad();
        waitForElementImplicit(30);
//        LoggingUtils.log("Navigated to Pega7 Screen");
    }

    public void enterUserName(String userName) throws InterruptedException {
        type(this.userName, userName, "User Name");

    }

    public void enterPassword(String password) throws InterruptedException {
        type(this.password, password, "Password");
    }

    public void clickOnLoginButton() throws IOException {
        click(login, "Login Button");
    }
}
