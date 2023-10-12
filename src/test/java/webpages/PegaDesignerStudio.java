package webpages;

import baseclass.BasePage;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import java.io.IOException;

public class PegaDesignerStudio extends BasePage {

    @FindBy(id = "pySearchText")
    private WebElement searchText;

    @FindBy(xpath = ".//i[@class='pi pi-search-2']")
    private WebElement searchButton;

    @FindBy(xpath = ".//span[text()='Interactions History By Customer']")
    private WebElement interactionHistoryByCustomer;

    @FindBy(xpath = "(.//span[text()='DeleteInteractionHistoryForCustomer'])[2]")
    private WebElement deleteInteractionHistoryByCustomer;

    @FindBy(xpath = ".//span[text()='RecreateAllIHAggreagates']")
    private WebElement recreateAllIHAggregates;

    @FindBy(xpath = ".//h3[@class='layout-group-item-title'and text()='Favorites']")
    private WebElement favorites;

    @FindBy(xpath = "//a[@title='Configure Dev Studio']")
    private WebElement configureDevStudio;

    @FindBy(xpath = ".//span[text()='Decisioning']")
    private WebElement decisioning;

    @FindBy(xpath = "//span[text()='Decisioning']//ancestor::li[1]//child::ul[1]//child::span[1]//child::span[text()='Decisions']")
    private WebElement decisions;

    @FindBy(xpath = "//span[text()='Decisioning']//ancestor::li[1]//child::div[1]/ul[1]//li[4]/a/span//span[text()='Data Sources']")
    private WebElement dataSources;

    @FindBy(xpath = "//span[text()='Decisioning']//ancestor::li[1]//child::div[1]/ul[1]//li[4]/a/span//span[text()='Data Sources']//ancestor::li[1]//child::div//span/span[text()='Interaction History Summaries']")
    private WebElement interactionHist;

    @FindBy(xpath = "//span[contains(text(),'Last 210 Days for each')]//ancestor::div[3]//following-sibling::div[1]/div/div/div/div/span/a[text()='Manage ']")
    private WebElement ih210DaysManage;

    @FindBy(xpath = "//span[text()='Recreate aggregates']")
    private WebElement ihRecreateAggregates;

    @FindBy(xpath = "//span[contains(text(),'Last 365 Days for each')]//ancestor::div[3]//following-sibling::div[1]/div/div/div/div/span/a[text()='Manage ']")
    private WebElement ih365DaysManage;

    @FindBy(xpath = "//span[contains(text(),'Last 4 hours for each')]//ancestor::div[3]//following-sibling::div[1]/div/div/div/div/span/a[text()='Manage ']")
    private WebElement ih4HrsManage;

    @FindBy(xpath = "//span[contains(text(),'Last 90 Days for each Subject ID, Subject Type, Group, Business issue, Name, Channel')]//ancestor::div[3]//following-sibling::div[1]/div/div/div/div/span/a[text()='Manage ']")
    private WebElement ih90DaysManage;

    @FindBy(xpath = "//span[contains(text(),'Last 90 Days for each')]//ancestor::div[3]//following-sibling::div[1]/div/div/div/div/span/a[text()='Manage ']")
    private WebElement ih90DaysDispositionManage;

    @FindBy(xpath = ".//a[text()='D2D_EMAIL_Batch']")
    private WebElement d2dEmailBatch;


    @FindBy(xpath = ".//button[text()='Actions']")
    private WebElement actions;

    @FindBy(xpath = "(.//span[text()='Run'])[2]")
    private WebElement run;

    @FindBy(xpath = "//span[text()='DeleteInterac...']/parent::td/following-sibling::td")
    private WebElement deleteInteractionHistoryForCustomerCloseButton;

    @FindBy(xpath = "//span[text()='InteractionsH...']/parent::td/following-sibling::td")
    private WebElement interactionHistoryByCustomerCloseButton;

    @FindBy(xpath = "//span[text()='RecreateAllIH...']/parent::td/following-sibling::td")
    private WebElement recreateAllIHAggregatesCloseButton;

    @FindBy(xpath = ".//a[text()='Dev Studio ']/i")
    private WebElement studioDropDown;

    @FindBy(xpath = ".//span[text()='App Studio']")
    private WebElement appStudio;

    public PegaDesignerStudio() {
        super();
        WebDriver webDriver = getWebDriver();
        PageFactory.initElements(webDriver, this);
        waitForPageLoad();
        waitForElementImplicit(30);
//        LoggingUtils.log("Navigated to Pega Designer Studio Screen");
    }

    public void enterSearchText(String searchName) throws InterruptedException {
        type(searchText, searchName, "Search Text");
    }

    public void clickOnSearchButton() throws IOException {
        click(searchButton, "Search Button");
    }

    public void clickOnInteractionByCustomerLink() throws IOException {
        click(interactionHistoryByCustomer, "Interaction History By Customer");
    }

    public void clickOnFavorites() throws IOException {
        click(favorites, "Favorites");
    }

    public void clickOnAggregatesRecreation() throws IOException, InterruptedException{
        click(configureDevStudio, "Configure Dev Studion");
        interactionHistSummaries(decisioning,decisions,dataSources,interactionHist);
        Thread.sleep(10000);
        recreateAggregates(ih210DaysManage,ihRecreateAggregates,ih365DaysManage,ih90DaysDispositionManage,ih90DaysManage);
    }

    public void clickOnAggregatesRecreationForSingleCID() throws IOException, InterruptedException{
        click(configureDevStudio, "Configure Dev Studion");
        interactionHistSummaries(decisioning,decisions,dataSources,interactionHist);
        Thread.sleep(10000);
        recreateAggregatesForSIngleCID(ih210DaysManage,ihRecreateAggregates,ih365DaysManage,ih90DaysDispositionManage,ih90DaysManage);
    }


    public void recreateAllIHAggregates(String cid) throws IOException, InterruptedException {
        PegaDesignerStudio pegaDesignerStudio = new PegaDesignerStudio();
        pegaDesignerStudio.clickOnFavorites();

        pegaDesignerStudio.clickOnRecreateAllIHAggregates();

        pegaDesignerStudio.clickOnActionsRecreateAllAggregaates();
        pegaDesignerStudio.clickOnRunRecreateAllAggrigates();

        RecreateAllIHAggregates recreateAllIHAggregates = new RecreateAllIHAggregates();

        recreateAllIHAggregates.clickOnRunButton();
        delay(8000);
        ActivityStatusSuccess activityStatusSuccess = new ActivityStatusSuccess();
        activityStatusSuccess.verifyStatus(cid);

        closeWindow("Run");
        closeWindow("Pega Platform - Success");

//        pegaDesignerStudio.clickOnCloseRecreateAllAggregates();
    }

    public void clickOnAggregatesRecreationAfterClearingIH() throws IOException, InterruptedException{
        click(configureDevStudio, "Configure Dev Studion");
        interactionHistSummaries(decisioning,decisions,dataSources,interactionHist);
        Thread.sleep(10000);
        recreateAggregatesAfterClearingIH(ih210DaysManage,ihRecreateAggregates,ih365DaysManage,ih90DaysDispositionManage,ih90DaysManage);
    }

    public void clickOnDeleteInteractionByCustomerLink() throws IOException {
        click(deleteInteractionHistoryByCustomer, "Delete Interaction History By Customer");
    }

    public void clickOnRecreateAllIHAggregates() throws IOException {
        click(recreateAllIHAggregates, "Recreate All IH Aggregates");
    }

    public void clickOnActionsInteractionHistory() throws IOException {
        switchToFrameByName("PegaGadget0Ifr");
        click(actions, "Action Button");
        switchToParentFrame();
    }

    public void clickOnActionsDeleteInteractionHistory() throws IOException {
        switchToFrameByName("PegaGadget1Ifr");
        click(actions, "Action Button");
        switchToParentFrame();
    }

    public void clickOnActionsRecreateAllAggregaates() throws IOException {
        switchToFrameByName("PegaGadget2Ifr");
        click(actions, "Action Button");
        switchToParentFrame();
    }


    public void clickOnActionsDeleteInteractionHistoryForIHClear() throws IOException {
        switchToFrameByName("PegaGadget0Ifr");
        click(actions, "Action Button");
        switchToParentFrame();
    }

    public void clickOnRunInteractionHistory() throws IOException {
        switchToFrameByName("PegaGadget0Ifr");
        click(run, "Run Button");
        switchToParentFrame();
    }

    public void clickOnCloseInteractionHistoryByCustomer() throws IOException {
        switchToFrameByName("PegaGadget0Ifr");
        click(interactionHistoryByCustomerCloseButton, "Intraction History By Customer Button - Close Tab");
        switchToParentFrame();
    }

    public void clickOnCloseDeleteInteractionHistoryForCustomer() throws IOException {
        switchToFrameByName("PegaGadget0Ifr");
        click(deleteInteractionHistoryForCustomerCloseButton, "Delete Interaction History For Customer - Close Tab");
        switchToParentFrame();
    }

    public void clickOnCloseRecreateAllAggregates() throws IOException {
        switchToFrameByName("PegaGadget0Ifr");
        click(recreateAllIHAggregatesCloseButton, "Recreate all Aggregates -  Close Tab");
        switchToParentFrame();
    }

    public void clickOnRunDeleteInteractionHistory() throws IOException, InterruptedException {
        switchToFrameByName("PegaGadget1Ifr");
        click(run, "Run Button");
        delay(5000);
        switchToParentFrame();
    }

    public void clickOnRunRecreateAllAggrigates() throws IOException, InterruptedException {
        switchToFrameByName("PegaGadget2Ifr");
        click(run, "Run Button");
        delay(5000);
        switchToParentFrame();
    }

    public void clickOnDeleteInteractionHistoryForIHClear() throws IOException, InterruptedException {
        switchToFrameByName("PegaGadget0Ifr");
        click(run, "Run Button");
        delay(5000);
        switchToParentFrame();
    }

    public void clickOnD2DEmailBatchLink() throws IOException {
        click(d2dEmailBatch, "D2D Email Batch");
    }

    public void clickOnDevStudio() throws IOException {
        click(studioDropDown, "Studio Drop down");
        click(appStudio, "APP Studio");
    }

}
