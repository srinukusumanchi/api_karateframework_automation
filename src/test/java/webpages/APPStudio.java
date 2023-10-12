package webpages;

import baseclass.BasePage;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class APPStudio extends BasePage {

    static List<Map<String, String>> ddrRecords = null;
    static List<Map<String, String>> paConfigRecords = null;

    @FindBy(xpath = ".//a[text()='Data']")
    private WebElement dataButton;

    @FindBy(xpath = ".//*[@name='pzHelpTilesModalTemplate_pyPortalHarness_4']")
    private WebElement closePegaMarketing;

    @FindBy(xpath = ".//a[text()='Data model']")
    private WebElement dataModel;

    @FindBy(xpath = ".//span[text()='OutboundScheduler']")
    private WebElement outBoundScheduler;

    @FindBy(xpath = ".//span[text()='PA Configuration']")
    private WebElement paConfiguration;

    @FindBy(xpath = ".//*[text()='Open  ']")
    private WebElement openLink;

    @FindBy(xpath = "(.//*[text()='Data model'])[2]/following::*[text()='Records']")
    private WebElement recordsTab;

    @FindBy(xpath = "((.//*[text()='Data model'])[2]//following::*[text()='Records']")
    private WebElement recordsTabForPAConfig;

    @FindBy(xpath = "(//*[@id='bodyTbl_right'])[3]/tbody")
    private WebElement ddrTableBody;

    public APPStudio() {
        super();
        WebDriver webDriver = getWebDriver();
        PageFactory.initElements(webDriver, this);
        waitForPageLoad();
        waitForElementImplicit(30);
//        LoggingUtils.log("Navigated to Pega Designer Studio Screen");
    }

    public static List<Map<String, String>> getDdrRecords() {
        return ddrRecords;
    }

    public static void setDdrRecords(List<Map<String, String>> ddrRecords) {
        APPStudio.ddrRecords = ddrRecords;
    }

    public static void setpaConfigRecords(List<Map<String, String>> paConfigRecords) {
        APPStudio.paConfigRecords = paConfigRecords;
    }

    public static List<Map<String, String>> getpaConfigRecords() {
        return paConfigRecords;
    }

    public void clickOnDataButton() throws IOException {
        switchToFrameByName("pxExpress");
        click(dataButton, "Data Button");
        switchToParentFrame();
    }


    public void clickOnDataModel() throws IOException {
        switchToFrameByName("pxExpress");
        click(dataModel, "Data Model");
        switchToParentFrame();
    }

    public void clickOnOutBoundScheduler() throws IOException {
        switchToFrameByName("pxExpress");
        click(outBoundScheduler, "Outbound Scheduler");
        switchToParentFrame();
    }

    public void clickOnPAConfiguration() throws IOException {
        switchToFrameByName("pxExpress");
        click(paConfiguration, "PA Configuration");
        switchToParentFrame();
    }

    public void clickOnOpenLink() throws IOException {
        switchToFrameByName("pxExpress");
        click(openLink, "Open Link");
        switchToParentFrame();
    }

    public void clickOnRecordsTab() throws IOException {
        switchToFrameByName("pxExpress");
        click(recordsTab, "Records Tab");
        switchToParentFrame();
    }

    public void clickOnRecordsTabForPAConfigTable() throws IOException {
        switchToFrameByName("pxExpress");
        click(recordsTab, "Records Tab For PA Config");
        switchToParentFrame();
    }

    public List<Map<String, String>> getPAConfigTableValuesForPACCAndULOC() throws InterruptedException {
        switchToFrameByName("pxExpress");
        delay(5000);
        List<WebElement> PAConfigTableRows = getDriver().findElements(By.xpath("(//*[@id='bodyTbl_right'])[3]/tbody/tr"));
        List<WebElement> PAConfigTableColumns = getDriver().findElements(By.xpath("(//*[@id='bodyTbl_right'])[3]/tbody/tr/th"));

        List<String> PAConfigHeaders = new LinkedList<>();
        List<String> PAConfigHeadersValues = new LinkedList<>();
        Map<String, String> PAConfigRecord = null;

        paConfigRecords = new LinkedList<>();
        for (int rows = 1; rows <= PAConfigTableRows.size(); rows++) {

            for (int columns = 1; columns <= PAConfigTableColumns.size(); columns++) {
                if (rows == 1) {
                    WebElement tableHeaders = getDriver().findElement(By.xpath("(//*[@id='bodyTbl_right'])[3]/tbody/" + "tr[" + rows + "]/th[" + columns + "]/div/div/div[@class = 'cellIn ']"));
                    PAConfigHeaders.add(tableHeaders.getText());
                } else {
                    PAConfigRecord = new LinkedHashMap<>();
                    WebElement tableData = getDriver().findElement(By.xpath("(//*[@id='bodyTbl_right'])[3]/tbody/" + "tr[" + rows + "]/td[" + columns + "]/div"));
                    PAConfigHeadersValues.add(tableData.getText());
                }
            }

            if (PAConfigHeadersValues.size() != 0) {
                for (int i = 0; i < PAConfigHeadersValues.size(); i++) {
                    PAConfigRecord.put(PAConfigHeaders.get(i), PAConfigHeadersValues.get(i));
                }
                paConfigRecords.add(PAConfigRecord);
                PAConfigHeadersValues.clear();
            }
        }

        System.out.println("The PA Config Records are : " + paConfigRecords);

        setpaConfigRecords(paConfigRecords);

        switchToParentFrame();
        return paConfigRecords;
    }



    public List<Map<String, String>> getDDRRecords() throws InterruptedException {
        switchToFrameByName("pxExpress");
        addExplicitWait(ddrTableBody, "visibility", 30);
        delay(5000);
        List<WebElement> ddrTableRows = getDriver().findElements(By.xpath
                ("(//*[@id='bodyTbl_right'])[3]/tbody/tr"));
        List<WebElement> ddrTableColumns = getDriver().findElements(By.xpath
                ("(//*[@id='bodyTbl_right'])[3]/tbody/tr/th"));

        List<String> ddrHeaders = new LinkedList<>();
        List<String> ddrHeadersValues = new LinkedList<>();
        Map<String, String> ddrRecord = null;
        ddrRecords = new LinkedList<>();
        for (int rows = 1; rows <= ddrTableRows.size(); rows++) {

            for (int columns = 1; columns <= ddrTableColumns.size(); columns++) {
                if (rows == 1) {
                    WebElement tableHeaders = getDriver().findElement(By.xpath
                            ("(//*[@id='bodyTbl_right'])[3]/tbody/" +
                                    "tr[" + rows + "]/th[" + columns + "]/div/div/div[@class = 'cellIn ']"));
                    ddrHeaders.add(tableHeaders.getText());
                } else {
                    ddrRecord = new LinkedHashMap<>();
                    WebElement tableData = getDriver().findElement(By.xpath
                            ("(//*[@id='bodyTbl_right'])[3]/tbody/" +
                                    "tr[" + rows + "]/td[" + columns + "]/div"));
                    ddrHeadersValues.add(tableData.getText());
                }

            }
            if (ddrHeadersValues.size() != 0) {
                for (int i = 0; i < ddrHeadersValues.size(); i++) {

                    ddrRecord.put(ddrHeaders.get(i), ddrHeadersValues.get(i));
                }
                ddrRecords.add(ddrRecord);
                ddrHeadersValues.clear();
            }
        }
        setDdrRecords(ddrRecords);
        switchToParentFrame();
        return ddrRecords;
    }
}
