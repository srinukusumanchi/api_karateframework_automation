package baseclass;

import com.codoid.products.exception.FilloException;
import com.codoid.products.fillo.Connection;
import com.codoid.products.fillo.Fillo;
import com.google.common.base.Function;
import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.junit.Assert;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.interactions.Action;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.interactions.MoveTargetOutOfBoundsException;
import org.openqa.selenium.remote.UnreachableBrowserException;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.Wait;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;

public class BasePage {

    protected static Properties properties;
    private static WebDriver webDriver;


    // Page class constructor -> Invokes First when you call this class methods
    public BasePage() {

        try {
            properties = new Properties();
            File file = new File(System.getProperty("user.dir") + "/src/test/java/config/application.properties");
            FileInputStream inputStream = new FileInputStream(file);
            properties.load(inputStream);
            setProperties(properties);
        } catch (IOException e) {
//            //LoggingUtils.log(e.getMessage());
        }

    }


    protected static Properties getProperties() {
        return properties;
    }

    private static void setProperties(Properties properties) {
        BasePage.properties = properties;
    }

    protected static WebDriver getWebDriver() {
        return webDriver;
    }

    private static void setWebDriver(WebDriver webDriver) {
        BasePage.webDriver = webDriver;
    }

    /**
     * This function is to get Todays date.
     *
     * @return String- It gives date in string format
     */
    public static String getCurrentDate() {
        return getCurrentDateTime().substring(0, 12);
    }

    /**
     * This function is to give Todays date.
     */
    private static String getCurrentDateTime() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("MMM dd, yyyy");
        Calendar cal = Calendar.getInstance();
        return dateFormat.format(cal.getTime());

    }


    /**
     * This function is to get driver object.
     *
     * @return String- It gives web driver object
     */
    protected WebDriver getDriver() {
        return webDriver;
    }


    /**
     * This function launches the Application URL from grid.properties
     */
    // Launch URL in opened application
    protected void launchBaseURL(String url) {
        if (url.length() != 0) {
            try {
                webDriver.get(url);
                //LoggingUtils.log("Launched URL:- "+url);
            } catch (UnreachableBrowserException e) {
               /* LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot")))
                        ,"Unable to launch URL:- "+url);*/
                throw new UnreachableBrowserException("Unable to load the Base URL: " + url);
            }
        } else {
            /*LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot")))
                    ,"Unable to launch URL:- "+url);*/
            throw new UnreachableBrowserException("Unable to load the Base URL: "
                    + url + " Please provide a valid Base URL.");
        }
    }

    /**
     * This function is to navigate the browser to a URL
     *
     * @param url - URL to which browser has to be navigated
     */
    public void navigateToURL(String url) {
        try {
            webDriver.navigate().to(url);
            //LoggingUtils.log("Launched URL:- "+url);
        } catch (UnreachableBrowserException e) {

            throw new UnreachableBrowserException("Unable to launch the URL: " + url);
        }
    }


//    -------------------------------------------Waits---------------------------------------------------

    /**
     * This function returns the Current Window URL
     *
     * @return String - returns the Current Window URL
     */
    private String getCurrentURL() {

        return webDriver.getCurrentUrl();
    }

    /**
     * This function returns the Current Window Title
     *
     * @return String - returns the Current Window Title
     */
    private String getPageTitle() throws InterruptedException {
        delay(10000);
        return webDriver.getTitle();
    }

    /**
     * This function checks whether the Current Window URL is same as the
     * Expected
     *
     * @param expectedURL - URL expected in the Current Window
     * @return boolean - returns true if the CurrentWindow URL matches the
     * expectedURL, else returns false
     */
    public boolean isURLAsExpected(String expectedURL) {

        return expectedURL.equals(getCurrentURL());
    }

    /**
     * @param time    - Maximum time to waits for a particular element
     * @param element - Element that need to be find in web page
     *                This function is to make the webDriver wait explicitly for few seconds until element finds
     */
    public WebElement waitForElementExplicit(long time, WebElement element) {
        WebDriverWait wait = new WebDriverWait(webDriver, time);
        return wait.until(ExpectedConditions.visibilityOf(element));
    }

    /**
     * @param time - Maximum time waits for a all elements in web page until it find
     *             This function is to make the webDriver wait Implicitly for few seconds.
     */
    protected void waitForElementImplicit(long time) {
        webDriver.manage().timeouts().implicitlyWait(time, TimeUnit.SECONDS);
    }


//    -------------------------------------------Drop Down Helper---------------------------------------------------

    /**
     * @param time         - Maximum time to waits for a particular element
     * @param pollingValue - For every interval of time it will search for paricular element
     *                     This function is to make the webDriver wait Implicitly for few seconds.
     */
    public WebDriverWait getwaitForElementPooling(long time, int pollingValue) {
        WebDriverWait wait = new WebDriverWait(webDriver, time);
        wait.pollingEvery(pollingValue, TimeUnit.SECONDS);
        wait.ignoring(NoSuchElementException.class);
        wait.ignoring(ElementNotVisibleException.class);
        wait.ignoring(StaleElementReferenceException.class);
        wait.ignoring(NoSuchFrameException.class);
        return wait;
    }

    /**
     * This function is to make the webDriver wait explicitly for a condition to be
     * satisfied
     *
     * @param element - waits for an element
     *                visibility/presence/clickability has to be checked
     */
    protected void addExplicitWait(WebElement element, String condition, int inttimeoutinseconds) {

        WebDriverWait webDriverWait = new WebDriverWait(webDriver, inttimeoutinseconds, 30000);
        try {
            if (condition.equalsIgnoreCase("visibility")) {
                webDriverWait.until(ExpectedConditions.visibilityOf(element));
                highlight(element);

            } else if (condition.equalsIgnoreCase("clickable")) {
                webDriverWait.until(ExpectedConditions.elementToBeClickable(element));
                highlight(element);

            } else if (condition.equalsIgnoreCase("presence")) {
                webDriverWait.until(ExpectedConditions.presenceOfElementLocated((By) element));
                highlight(element);

            } else {
                //LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "Condition String should be visibility or clickable or presence");
            }
        } catch (NoSuchElementException e) {
            /*LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "The element with"
                    + element
                    + " not found:--" + e.fillInStackTrace());*/
            throw new NoSuchElementException("The element with"
                    + element
                    + " not found");
        } catch (UnsupportedCommandException e) {
           /* LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "The condition given to check the elemnt with"
                    + element
                    + " is invalid:-" + e.fillInStackTrace());*/
            throw new NoSuchElementException("The condition given to check the elemnt with"
                    + element
                    + " is invalid", e.fillInStackTrace());
        }
    }

    /**
     * This function is used to handle the page load sync
     */
    protected void waitForPageLoad() {
        try {
            Wait<WebDriver> wait = new WebDriverWait(webDriver, 60);
            wait.until(new Function<WebDriver, Boolean>() {
                public Boolean apply(WebDriver webDriver) {
                    /*LoggingUtils.log("Current Window State       : "
                            + String.valueOf(((JavascriptExecutor) webDriver).executeScript("return document.readyState")));*/
                    return String
                            .valueOf(((JavascriptExecutor) webDriver).executeScript("return document.readyState"))
                            .equals("complete");
                }
            });

        } catch (Exception e) {
//
        }
    }

    /**
     * This function is to select a dropdown option using its index
     *
     * @param element - element to locate the dropdown which is to be selected
     * @param index   - index of the dropdown option to be selected
     */
    public void selectDropDownByIndex(WebElement element, int index) throws IOException {
        try {
            addExplicitWait(element, "visibility", 20);
            Select dropDown = new Select(element);
            dropDown.selectByIndex(index);

        } catch (NoSuchElementException e) {
            /*LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "Unable to select the dropdown; The element with"
                    + element
                    + " not found:-" + e.fillInStackTrace());*/
            throw new NoSuchElementException("The element with"
                    + element
                    + " not found");
        }
    }

    /**
     * This function is to select the dropdown options that have a value
     * matching the argument
     *
     * @param element - element to locate the dropdown which is to be selected
     * @param value   - value to match against the dropdown option to be selected
     */
    public void selectDropDownByValue(WebElement element, String value) throws IOException {
        try {
            addExplicitWait(element, "visibility", 20);
            Select dropDown = new Select(element);
            dropDown.selectByValue(value);
            //LoggingUtils.log("Selected Dropdown value:- "+value);
        } catch (NoSuchElementException e) {
           /* LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "Unable to select the dropdown; The element with"
                    + element
                    + " not found:--" + e.fillInStackTrace());*/
            throw new NoSuchElementException("The element with"
                    + element
                    + " not found");
        }
    }

//    ---------------------------------------------------Action Helper-----------------------------------------------------

    /**
     * This function is to select the dropdown options that displays text
     * matching the argument
     *
     * @param element     - element to locate the dropdown which is to be selected
     * @param visibleText - visible text to match against the dropdown option to
     *                    be selected
     */
    public void selectDropDownByVisibleText(WebElement element, String visibleText) throws IOException {
        try {
            addExplicitWait(element, "visibility", 30);
            Select dropDown = new Select(element);
            dropDown.selectByVisibleText(visibleText);
            /*LoggingUtils.log( "User is able to select value from dropdown " + visibleText
                    + " successfully");*/

        } catch (NoSuchElementException e) {
           /* LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "Unable to select the dropdown; The element with"
                    + element
                    + " not found:--" + e.fillInStackTrace());*/
            throw new NoSuchElementException("The element with"
                    + element
                    + " not found");
        }
    }

    /**
     * This function is to get selected value from dropdown options
     *
     * @param element - Drop down element to perform actions
     */
    public String getSelectedValue(WebElement element) throws IOException {
        String selecteOption;
        try {
            addExplicitWait(element, "visibility", 20);
            Select dropDown = new Select(element);
            selecteOption = dropDown.getFirstSelectedOption().getText();

        } catch (NoSuchElementException e) {
            /*LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "Unable find dropdown element; The element with"
                    + element
                    + " not found:--" + e.fillInStackTrace());*/
            throw new NoSuchElementException("The element with"
                    + element
                    + " not found");
        }
        return selecteOption;

    }

    /**
     * This function is to get all values from dropdown element
     *
     * @param locator - Drop down element to get all drop down values
     */
    public List<WebElement> getAllDropDownValues(WebElement locator) throws IOException {
        addExplicitWait(locator, "visibility", 20);
        Select dropDownValues = new Select(locator);

        List<WebElement> elementList = dropDownValues.getOptions();
        ArrayList<WebElement> elementValues = new ArrayList<>();

        for (WebElement element : elementList) {

            elementValues.add(element);
        }

        return elementValues;
    }


    /**
     * This function is to move the mouse pointer to the specified location
     *
     * @param locator - By object to locate the element to which mouse pointer
     *                has to be moved
     */
    public void mouseOver(WebElement locator) throws IOException {
        try {
            addExplicitWait(locator, "visibility", 20);
            new Actions(webDriver).moveToElement(locator)
                    .build().perform();
            //LoggingUtils.log( "Mouse hovered on element " + locator);
        } catch (NoSuchElementException e) {
            /*LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "Unable to perform MouseOver; The element with"
                    + " not found:-" + e.fillInStackTrace());*/
            throw new NoSuchElementException("The element with"
                    + " not found");
        }
    }

    /**
     * This function is to click using mouse
     *
     * @param locator - By object to locate the element to which mouse pointer
     *                has to be moved
     */
    public void clickUsingMouse(WebElement locator) throws IOException {
        try {
            addExplicitWait(locator, "visibility", 20);
            new Actions(webDriver).moveToElement(locator).click()
                    .build().perform();
            //LoggingUtils.log( "Clicked element:- "+locator+" using mouse");
        } catch (NoSuchElementException e) {
            /*LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "Unable to perform MouseOver; The element with"
                    + " not found:-" + e.fillInStackTrace());*/
            throw new NoSuchElementException("The element with"
                    + " not found");
        }
    }


    /**
     * This function is to click on an element by moving the mouse pointer to
     * the specified location or to read the tip of a mouse
     *
     * @param element - By object to locate the element to which mouse pointer
     *                has to be moved
     */
    /*public void moveMouseTipAndClick(WebElement element) throws IOException {
        try {
            addExplicitWait(element, "visibility", 20);
            Locatable hoverItem = (Locatable) element;
            Mouse mouse = webDriver.getMouse();
            mouse.mouseMove(hoverItem.getCoordinates());
            mouse.click(hoverItem.getCoordinates());

        } catch (NoSuchElementException e) {
            LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "Unable to perform click; The element with"
                    + element
                    + " not found:-" + e.fillInStackTrace());
            throw new NoSuchElementException("The element with"
                    + element
                    + " not found");
        }
    }
*/

    /**
     * This function is to perform double click on a webelement
     *
     * @param element - By object of the webelement on which double click has to
     *                be performed
     */
    public void doubleClick(WebElement element) throws IOException {
        try {
            addExplicitWait(element, "visibility", 20);
            Actions builder = new Actions(webDriver);
            builder.doubleClick(element).perform();
            //LoggingUtils.log( "Double clicked on element:- "+element+" using mouse");
        } catch (NoSuchElementException e) {
           /* LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "Unable to perform doubleClick; The element with"
                    + element
                    + " not found:-" + e.fillInStackTrace());*/
            throw new NoSuchElementException("The element with"
                    + element
                    + " not found");
        }
    }


//---------------------------------------------------Window Helper----------------------------------------------------------

    /**
     * This function performs a click-and-hold at the location of the source
     * element; moves to the location of the target element, then releases the
     * mouse.
     *
     * @param initialElementLocator - By object of the initial location of the
     *                              source webelement
     * @param finalElementLocator   - By object of the final location where the
     *                              webelement has to be moved
     */
    public void dragAndDrop(WebElement initialElementLocator, WebElement finalElementLocator) throws IOException {
        try {
            addExplicitWait(initialElementLocator, "visibility", 20);
            addExplicitWait(finalElementLocator, "visibility", 20);
            Actions builder = new Actions(webDriver);
            Action dragAndDrop = builder
                    .clickAndHold(initialElementLocator)
                    .moveToElement(finalElementLocator)
                    .release(finalElementLocator)
                    .build();
            dragAndDrop.perform();
            //LoggingUtils.log(" User is able to perform Drag And Drop on  successfuly");
            /*LoggingUtils.log("The element is draged from"
                    + initialElementLocator.toString().replace("By.", " ")
                    + " to"
                    + finalElementLocator.toString().replace("By.", " "));*/
        } catch (NoSuchElementException e) {
           /* LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "Unable to perform dragAndDrop;The element is not draged from"
                    + initialElementLocator.toString().replace("By.", " ")
                    + " to"
                    + finalElementLocator.toString().replace("By.", " ") + ":--" + e.fillInStackTrace());*/
            throw new NoSuchElementException("Unable to perform dragAndDrop;The element is not draged from"
                    + initialElementLocator.toString().replace("By.", " ")
                    + " to"
                    + finalElementLocator.toString().replace("By.", " "));
        }
    }

    /**
     * This function is to move the Webelement to an offset from the top-left
     * corner of the Webelement
     *
     * @param locator     - By object to locate the Webelement which is to be moved
     * @param locatorName - Name of the locator to declared.
     * @param xOffset     - xOffset by which the Webelement will be moved from the
     *                    current position towards x-axis
     * @param yOffset     - yOffset by which the Webelement will be moved from the
     *                    current position towards y-axis
     */
    public void moveToElement(By locator, String locatorName, int xOffset, int yOffset) {
        try {
            Actions builder = new Actions(webDriver);
            builder.moveToElement(webDriver.findElement(locator), xOffset, yOffset);
        } catch (MoveTargetOutOfBoundsException e) {
//            LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "Unable to move the element from current position:-" + e.fillInStackTrace());
            throw new MoveTargetOutOfBoundsException("Target provided x:" + xOffset
                    + "and y:" + yOffset + "is invalid");
        } catch (NoSuchElementException e) {
//            LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "Unable to move the element from current position:-" + e.fillInStackTrace());
            throw new NoSuchElementException("The element with"
                    + locator.toString().replace("By.", " ")
                    + " not found");
        }

    }

    /**
     * This function is to perform a right click on a particular webelement
     *
     * @param locator     - By object of the Webelement on which right click
     *                    operation has to be performed
     * @param locatorName - Name of the locator to declared.
     */
    public void rightClick(By locator, String locatorName) {
        try {
            WebElement webElement = webDriver.findElement(locator);
            Actions action = new Actions(webDriver);
            action.contextClick(webElement).build().perform();
        } catch (NoSuchElementException e) {
//            LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "Unable to scroll:-" + e.fillInStackTrace());
            throw new NoSuchElementException("The element with"
                    + locator.toString().replace("By.", " ")
                    + " not found");
        } catch (UnsupportedCommandException e) {
//            LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "Unable to scroll:-" + e.fillInStackTrace());
            throw new UnsupportedCommandException("Command used by the webdriver is unsupported");
        }
    }

    /**
     * This function is to load the previous URL in the browser history.
     */
    public void navigateBack() {
        try {
            webDriver.navigate().back();
        } catch (WebDriverException e) {
//            LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "The page cannot be navigated backward:--" + e.fillInStackTrace());
            throw new WebDriverException("The page cannot be navigated backward");
        }
    }

    /**
     * This function loads the URL which is forward in the browser's history.
     * Does nothing if we are on the latest page viewed.
     */
    public void navigateForward() {
        try {
            webDriver.navigate().forward();
        } catch (UnreachableBrowserException e) {
//            LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "The page cannot be navigated forward:--" + e.fillInStackTrace());
            throw new UnreachableBrowserException("The page cannot be navigated forward");
        }
    }

    /**
     * This function refresh the current page
     */
    public void refreshPage() {
        try {
            webDriver.navigate().refresh();
            //LoggingUtils.log( "Page refreshed");
        } catch (UnreachableBrowserException e) {
//            LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "The page cannot be refreshed:--" + e.fillInStackTrace());
            throw new UnreachableBrowserException("The page cannot be refreshed");
        }
    }

    /**
     * This function is gives number of windows opened
     *
     * @return Set - It returns set of windows opened
     */
    protected Set<String> getWindowHandles() {

        return webDriver.getWindowHandles();

    }

    /**
     * This function switches to child window
     *
     * @param index - Tells child window opened number
     */
    public void switchToChildWindowWithIndex(int index) {
        LinkedList<String> windowId = new LinkedList<>(getWindowHandles());

        if (index < 0 || index > windowId.size()) {
            throw new IllegalArgumentException("Invalid Index:" + index);
        }
        webDriver.switchTo().window(windowId.get(index));
    }

    /**
     * This function switches to child window
     *
     * @param windowName - Window name
     */
    protected void switchToChildWindowWithName(String windowName) {
        webDriver.switchTo().window(windowName);
    }


    /**
     * This function switches to Parent window
     */
    protected void switchToParentWindow() {
        LinkedList<String> windowId = new LinkedList<>(getWindowHandles());

        webDriver.switchTo().window(windowId.get(0));

    }

    /**
     * This function is to switch the driver from Current Window to newly opened
     * Window
     */
    public void switchToWindow(String windowName) {
        for (String windowHandle : webDriver.getWindowHandles()) {
            try {
                String title = webDriver.switchTo().window(windowHandle).getTitle();
                if (title.contains(windowName)) {
                    webDriver.switchTo().window(windowHandle);
                    setWebDriver(webDriver);
                    break;
                }
            } catch (NoSuchWindowException e) {
                throw new NoSuchWindowException("Unable to switch the window");
            }

        }

    }


    /**
     * This function is to switch the driver from Current Window to newly opened
     * Window and close browser
     */
    public void closeWindow(String windowName) {
        for (String windowHandle : webDriver.getWindowHandles()) {
            try {
                String title = webDriver.switchTo().window(windowHandle).getTitle();
                if (title.contains(windowName)) {
                    webDriver.switchTo().window(windowHandle);
                    webDriver.close();
                    break;
                }
            } catch (NoSuchWindowException e) {
                throw new NoSuchWindowException("Unable to switch the window");
            }

        }

    }


    /**
     * This function is to get the current window handle
     *
     * @return windowHandle - returns the handle of current browser window
     */
    public String getWindowHandle() {
        String windowHandle = webDriver.getWindowHandle();
        /*LoggingUtils.log("The current window handle " + windowHandle
                + " is returned");*/
        try {
            windowHandle = webDriver.getWindowHandle();
        } catch (WebDriverException e) {
//            LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "Unable to returm the window handle:-" + e.fillInStackTrace());
            throw new WebDriverException("Unable to returm the window handle");
        }
        return windowHandle;
    }

    /**
     * This function is to switch the webDriver from Current Window to newly opened
     * Window
     */
    public void switchToWindow() {
        try {
            for (String windowHandle : webDriver.getWindowHandles()) {
                webDriver.switchTo().window(windowHandle);
            }
            //LoggingUtils.log("User is able to switch between windows successfuly");
            //LoggingUtils.log("The window is switched");
        } catch (NoSuchWindowException e) {
//            LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "Unable to switch the window:--" + e.fillInStackTrace());
            throw new NoSuchWindowException("Unable to switch the window");
        }
    }

    /**
     * This function is to switch into a frame using frame index
     *
     * @param index - index of the frame to which webDriver has to be switched into
     */
    public void switchToFrameByIndex(int index) {
        try {
            webDriver.switchTo().parentFrame();
            webDriver.switchTo().frame(index);
            //LoggingUtils.log("User is able to switch into frame successfully");
            //LoggingUtils.log("The webDriver is switched into frame");
        } catch (NoSuchFrameException e) {
//            LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "Unable to switch into frame:--" + e.fillInStackTrace());
            throw new NoSuchFrameException("Unable to switch into frame");
        }
    }

    /**
     * This function is to switch into a frame using the frame name
     *
     * @param frameName - name of the frame to which webDriver has to be switched
     *                  into
     */
    protected void switchToFrameByName(String frameName) {
        if (!frameName.equalsIgnoreCase(null)) {
            try {
                webDriver.switchTo().frame(frameName);
                //LoggingUtils.log("User is able to switch into frame:" + frameName + " successfully");
                //LoggingUtils.log("The webDriver is switched to frame: " + frameName);
            } catch (NoSuchFrameException e) {
//                LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "Unable to switch into frame:--" + e.fillInStackTrace());
                throw new NoSuchFrameException("Unable to switch into frame");
            }
        }
        //LoggingUtils.log("Unable to switch into frame as framename is null");
    }

    /**
     * This function is to switch into a parent frame
     */
    protected void switchToParentFrame() {
        try {
            webDriver.switchTo().parentFrame();
            //LoggingUtils.log("Able to switch to parent frame successfully");
        } catch (NoSuchFrameException e) {
//                LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "Unable to switch to parent frame:--" + e.fillInStackTrace());
            throw new NoSuchFrameException("Unable to switch to parent frame");
        }
    }

//    ---------------------------------------------------Generic Helper-----------------------------------------------------

    /**
     * This function is to switch into a frame; frame is located as a webelemet
     *
     * @param locator - By object of the webelemet using which frame can be
     *                located
     */
    public void switchToFrameByWebElement(WebElement locator) {
        try {
            webDriver.switchTo().frame(locator);
            //LoggingUtils.log("User is able to switch into frame successfully");
            /*LoggingUtils.log("The webDriver is switched to frame with"
                    + locator.toString());*/
        } catch (NoSuchFrameException e) {
//            LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "Unable to switch into frame:--" + e.fillInStackTrace());
            throw new NoSuchFrameException("Unable to switch into frame");
        }
    }

    /**
     * This function Opens the Browser Window
     */
    protected WebDriver getBrowser() {
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--disable-notifications");
        options.setExperimentalOption("useAutomationExtension", false);
        System.setProperty("webdriver.chrome.driver", getProperties().getProperty("system.webdriver.chrome.driver"));
        webDriver = new ChromeDriver(options);
        setWebDriver(webDriver);
        return webDriver;
    }//getBrowser

    /**
     * This function closes the Current Browser Window
     */
    public void closeCurrentWindow() {
        webDriver.close();
        //LoggingUtils.log("webDriver window is closed");
    }

    /**
     * This function clicks on the element which can be located by the By Object
     *
     * @param element     - Element that performs clicking action
     * @param locatorName - Name of the locator to declared. i.e., Name of the
     *                    locator_Button,Name of the locator_Link,etc
     */
    protected void click(WebElement element, String locatorName) throws IOException {
        try {
            addExplicitWait(element, "clickable", 40);//clickable,presence,visibility
            element.click();
            /*LoggingUtils.log( " User is able to click on " + locatorName
                    + " successfully");*/
        } catch (NoSuchElementException e) {
           /* LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "The element with"
                    + element
                    + " not found:-" + e.fillInStackTrace());*/
            throw new NoSuchElementException("The element with"
                    + element
                    + " not found");
        }
    }

    /**
     * This function is to pass a text into an input field within UI
     *
     * @param element     - Element that performs entering action
     * @param value       - Text value which is to be send to the input field
     * @param locatorName - Name of the locator to declared. i.e., Name of the
     *                    locator_Button,Name of the locator_Link,etc
     */
    public void type(WebElement element, String value, String locatorName) throws InterruptedException {
        try {
            addExplicitWait(element, "visibility", 30);//clickable,presence,visibility
            element.clear();
            element.sendKeys(value);
            //LoggingUtils.log(" User is able to enter " + value + " into " + locatorName + " successfully");
        } catch (NoSuchElementException e) {
            /*LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "The element with"
                    + element
                    + " not found:-" + e.fillInStackTrace());*/
            throw new NoSuchElementException("The element with"
                    + element
                    + " not found");
        }
    }

    /**
     * This function is to get the visible text of an element within UI
     *
     * @param element - element to locate the element from which the text has
     *                to be taken
     * @return String - returns the innertext of the specified element
     */
    protected String getText(WebElement element) {
        String text = null;
        try {
//            addExplicitWait(element, "visibility", 10);//clickable,presence,visibility
            text = element.getText();
        } catch (NoSuchElementException e) {
            /*LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "Unable to get the text. The element with"
                    + element + " not found:--" + e.fillInStackTrace());*/
            throw new NoSuchElementException("Unable to get the text. The element with"
                    + element
                    + " not found");
        }
        return text;
    }

    /**
     * This funtion is to maximize the Current Browser Window
     */
    protected void maximizeWindow() {
        try {
            webDriver.manage().window().maximize();
            //LoggingUtils.log("Window is maximized");
        } catch (UnreachableBrowserException e) {
//            LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "Unable to maximize the window:-" + e.fillInStackTrace());
            throw new NoSuchElementException("Unable to maximize the window");
        }
    }

    /**
     * This function is to add a time delay
     *
     * @param time - time duration in MilliSeconds
     */
    protected void delay(int time) throws InterruptedException {
        Thread.sleep(time);
        //LoggingUtils.log("Delay for " + time + " MilliSeconds is added");
    }

    /**
     * This function is to check whether a webelement is visible or not
     *
     * @param element -  webelement which is to be checked either it is visible
     * @return boolean - returns true if the specified webelement is visible,
     * else it will return false
     */
    public boolean isElementVisible(WebElement element) {

        return element.isDisplayed();
    }

    /**
     * This function is to check whether a webelement is enabled or not
     *
     * @param element - webelement which is to be checked either it is enabled
     * @return boolean - returns true if the specified webelement is enabled,
     * else it will return false
     */
    public boolean isElementEnabled(WebElement element) {

        //LoggingUtils.log("element is enabled");
        //LoggingUtils.log("The element with is enabled");
        return element.isEnabled();
    }

    /**
     * This function is to check whether the Current Window Title is as expected
     *
     * @param expectedTitle - Title expected in the Current Window
     * @return boolean - returns true if the CurrentTitle matches the
     * expectedTitle, else it will return false
     */
    public boolean isTitleAsExpected(String expectedTitle) throws InterruptedException {
        /*LoggingUtils.log("The current window title is " + getPageTitle()
                + " whereas the expected is " + expectedTitle);*/
        /*LoggingUtils.log("The current window title is " + getPageTitle()
                + " whereas the expected is " + expectedTitle);*/
        return expectedTitle.equals(getPageTitle());
    }

    /**
     * This function is to get a cookie with a specific name
     *
     * @param cookieName - Name of the cookie which is to be returned
     * @return Cookie - Returns the cookie value for the name specified, or null
     * if no cookie found with the given name
     */
    public Cookie getCookie(String cookieName) {
        //LoggingUtils.log("User is able to obtain the cookie:" + cookieName + " successfuly");
        //LoggingUtils.log("The cookie:" + cookieName + " is obtained");
        return webDriver.manage().getCookieNamed(cookieName);
    }
//--------------------------------------------JavaScriptHelper-----------------------------------------------------------

    /**
     * This function is to delete a cookie from the browser's "cookie jar" The
     * domain of the cookie will be ignored.
     *
     * @param cookieName - name of the cookie which is to be deleted.
     */
    public void deleteCookieNamed(String cookieName) {
        if (!cookieName.equalsIgnoreCase(null)) {
            try {
                //LoggingUtils.log("User is able to delete the cookie:" + cookieName + " successfuly");
                //LoggingUtils.log("The cookie:" + cookieName + " is deleted");
                webDriver.manage().deleteCookieNamed(cookieName);
            } catch (InvalidCookieDomainException e) {
//                LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "Unable to delete the cookie:--" + e.fillInStackTrace());
                throw new InvalidCookieDomainException("The cookie with name "
                        + cookieName + " cannot be deleted");
            }
        } else {
            //LoggingUtils.log("Cookie Name is null; Unable to delete");
        }
    }

    /**
     * This function is to delete all the cookies for the current domain
     */
    public void deleteAllCookie() {
        try {
            webDriver.manage().deleteAllCookies();
            //LoggingUtils.log("User is able to delete all cookies successfully");
            //LoggingUtils.log("All cookies are deleted");
        } catch (InvalidCookieDomainException e) {
//            LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "Unable to delete cookies:--" + e.fillInStackTrace());
            throw new InvalidCookieDomainException("Unable to delete cookies");
        }
    }

    /**
     * This function is used to assert the expected text
     */
    public void assertText(String text) throws InterruptedException {
        try {
            delay(50);
            Assert.assertTrue(webDriver.getPageSource().contains(text));
            //LoggingUtils.log("" + text + " has been verified successfully in current page");

        } catch (NoSuchElementException e) {
            //LoggingUtils.log("" + text + " not displayed");
            java.util.logging.Logger.getLogger(BasePage.class.getName()).log(Level.SEVERE, "" + text + " not asserted", e);

        }
    }

    /**
     * This function is to click on a webelemet using JavascriptExecutor
     *
     * @param element - Name of the elemenet to click. *
     */
    public void clickUsingJavascriptExecutor(WebElement element, String locator) {
        try {
            JavascriptExecutor javaScriptExecutor = (JavascriptExecutor) webDriver;
            javaScriptExecutor.executeScript("arguments[0].click();", element);
            /*LoggingUtils.log( "User is able to click on " + locator
                    + " successfully");*/
        } catch (NoSuchElementException e) {
//            LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "The element with not found:--" + e.fillInStackTrace());
            throw new NoSuchElementException("The element with not found");
        }

    }

    /**
     * This function is to scroll the browser window to a webelement using
     * JavascriptExecutor
     *
     * @param element -  webelement to which the window has to
     *                be scroll to the element
     */
    public void scrollToElementUsingJavascriptExecutor(WebElement element) {
        try {
            JavascriptExecutor javaScriptExecutor = (JavascriptExecutor) webDriver;
            javaScriptExecutor.executeScript("arguments[0].scrollIntoView(true);", element);
            //LoggingUtils.log("User is able to scroll into  on browser successfully");
            //LoggingUtils.log("Browser window is scrolled to element with");
        } catch (NoSuchElementException e) {
//            LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "Unable to scroll: =" + e.fillInStackTrace());
            throw new NoSuchElementException("The element with not found");
        } catch (MoveTargetOutOfBoundsException e) {
//            LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "Unable to scroll:-" + e.fillInStackTrace());
            throw new MoveTargetOutOfBoundsException("Target element provided with is invalid");
        }

    }

    /**
     * This function is to click an element using Java Script executor
     * JavascriptExecutor
     *
     * @param script -  String for arguments to click and element
     */
    private Object javaScriptExecutorClick(String script) {
        JavascriptExecutor exe = (JavascriptExecutor) webDriver;
        return exe.executeScript(script);

    }

    /**
     * This function is to scroll web page
     * JavascriptExecutor
     *
     * @param element - Scrolls to the element in the web page
     */
    private void scrollIntoView(WebElement element) {
        JavascriptExecutor exe = (JavascriptExecutor) webDriver;
        exe.executeScript("arguments[0].scrollIntoView();", element);

    }

    /**
     * This function is to scroll web page and click that element
     * JavascriptExecutor
     *
     * @param element - Scrolls to the element in the web page
     */
    public void scrllVerticalToElementClick(WebElement element) {
        scrollIntoView(element);
        element.click();
    }

    /**
     * This function is to scroll web page  down
     * JavascriptExecutor
     */
    public void scrollDownVertically() {
        javaScriptExecutorClick("window.scrollTo(0,document.body.scrollHeight)");
    }

    /**
     * This function is to scroll web page up
     * JavascriptExecutor
     */
    public void scrollUpVertically() {
        javaScriptExecutorClick("window.scrollTo(0,-document.body.scrollHeight)");
    }

    /**
     * This function is to scroll web page down with pixel value
     * JavascriptExecutor
     *
     * @param value - It is an integer value
     */
    public void scrollDownUpByPixel(int value) //Negative value for Up and Positive value for down
    {
        javaScriptExecutorClick("window.scrollBy(0," + value + ")");
    }

    /**
     * This function is to Zoom a awebpage
     * JavascriptExecutor
     *
     * @param value - It is an integer value
     */
    public void zoomInByPercentage(int value) {
        javaScriptExecutorClick("document.body.style.zoom='" + value + "%'");
    }

    /**
     * This function is to highlight element on webpage
     * JavascriptExecutor
     *
     * @param element - Web Element to identify on web page
     */
    private void highlight(WebElement element) {
        JavascriptExecutor exe = (JavascriptExecutor) webDriver;
        exe.executeScript("arguments[0].setAttribute('style','background:yellow;border:2px solid red;');", element);
        try {
            Thread.sleep(1500);
        } catch (Exception e) {
//            LogHelper.logger.error(e.getCause());
        }
        exe.executeScript("arguments[0].setAttribute('style','border:2px solid white;');", element);

    }

    //-----------------------------------------------------------Alert Helper------------------------------------------------------


    /**
     * This function is to check whether there is any alert present.
     *
     * @return boolean - returns true if alert is present, else it will return
     * false
     */
    public boolean isAlertPresent() throws InterruptedException {
        Thread.sleep(6000);
        try {
            webDriver.switchTo().alert();
            //LoggingUtils.log("User is able to switch to alert box successfuly");
            //LoggingUtils.log("An alert box is present");
            return true;
        } catch (Exception e) {
            //LoggingUtils.log("There is no alert present:--" + e.fillInStackTrace());
            return false;
        }
    }

//--------------------------------------------------Table Helper----------------------------------------------------

    /**
     * This function is to handle the alert; Will Click on OK button First get a
     * handle to the open alert, prompt or confirmation and then accept the
     * alert.
     */
    public void acceptAlert() {
        try {
            Alert alertBox = webDriver.switchTo().alert();
            alertBox.accept();
            //LoggingUtils.log("User is able to able to accept the alert box successfully");
            //LoggingUtils.log("The alert is accepted");
        } catch (NoAlertPresentException e) {
            //LoggingUtils.log("Unable to access the alert:-" + e.fillInStackTrace());
            throw new NoAlertPresentException("Alert not present");
        }
    }

    /**
     * This function is to handle the alert; Will Click on Cancel button First
     * get a handle to the open alert, prompt or confirmation and then dismiss
     * the alert.
     */
    public void dismissAlert() {
        try {
            Alert alertBox = webDriver.switchTo().alert();
            alertBox.dismiss();
            //LoggingUtils.log("User is able to able to dismiss the alert box successfully ");
            //LoggingUtils.log("The alert is dismissed");
        } catch (NoAlertPresentException e) {
//            LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "Unable to access the alert:-" + e.fillInStackTrace());
            throw new NoAlertPresentException("Alert not present");
        }
    }

    /**
     * This function is to get the text which is present on the Alert.
     *
     * @return String - returns the text message which is present on the Alert.
     */
    public String getAlertMessage() {
        String alertMessage = null;
        try {
            Alert alertBox = webDriver.switchTo().alert();
            //LoggingUtils.log("User is able to retrieve the text " + alertBox.getText() + " within popup successfully");
            //LoggingUtils.log("The text " + alertBox.getText() + " within popup is returned");
            alertMessage = alertBox.getText();
        } catch (NoAlertPresentException e) {
//            LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "Unable to access the alert:-" + e.fillInStackTrace());
            throw new NoAlertPresentException("Alert not present");
        }
        return alertMessage;
    }

    public void interactionHistSummaries(WebElement decisioning, WebElement decisions, WebElement dataSources, WebElement interactionHist) throws InterruptedException {
        Actions actions = new Actions(getWebDriver());
        actions.moveToElement(decisioning).perform();
        actions.moveToElement(decisions).perform();
        actions.moveToElement(dataSources).perform();
        actions.moveToElement(interactionHist).click().perform();
        actions.build().perform();
        Thread.sleep(5000);
    }

    public void recreateAggregates(WebElement ih210DaysManage, WebElement ihRecreateAggregates, WebElement ih365DaysManage, WebElement ih4HrsManage, WebElement ih90DaysManage) throws IOException, InterruptedException {

        List<WebElement> iframes = getWebDriver().findElements(By.tagName("iframe"));
        int noOfFrames = iframes.size();
        System.out.println("No Of Frames on this Window : " + noOfFrames);
        System.out.println(iframes);

        getWebDriver().switchTo().frame(1);
        click(ih210DaysManage, "210 Days IH Manage");
        click(ihRecreateAggregates, "210 Days IH Recreate Aggregates");
        Thread.sleep(5000);

        click(ih365DaysManage, "365 Days IH Manage");
        click(ihRecreateAggregates, "365 Days IH Recreate Aggregates");
        Thread.sleep(5000);

        click(ih4HrsManage, "4 Hrs IH Manage");
        click(ihRecreateAggregates, "4 Hrs IH Recreate Aggregates");
        Thread.sleep(5000);

        click(ih90DaysManage, "90 Days IH Manage");
        click(ihRecreateAggregates, "90 Days IH Recreate Aggregates");
        Thread.sleep(5000);
    }

    public void recreateAggregatesForSIngleCID(WebElement ih210DaysManage, WebElement ihRecreateAggregates, WebElement ih365DaysManage, WebElement ih4HrsManage, WebElement ih90DaysManage) throws IOException, InterruptedException {

        List<WebElement> iframes = getWebDriver().findElements(By.tagName("iframe"));
        int noOfFrames = iframes.size();
        System.out.println("No Of Frames on this Window : " + noOfFrames);
        System.out.println(iframes);

        getWebDriver().switchTo().frame(2);
        click(ih210DaysManage, "210 Days IH Manage");
        click(ihRecreateAggregates, "210 Days IH Recreate Aggregates");
        Thread.sleep(5000);

        click(ih365DaysManage, "365 Days IH Manage");
        click(ihRecreateAggregates, "365 Days IH Recreate Aggregates");
        Thread.sleep(5000);

        click(ih4HrsManage, "4 Hrs IH Manage");
        click(ihRecreateAggregates, "4 Hrs IH Recreate Aggregates");
        Thread.sleep(5000);

        click(ih90DaysManage, "90 Days IH Manage");
        click(ihRecreateAggregates, "90 Days IH Recreate Aggregates");
        Thread.sleep(5000);
    }

    public void recreateAggregatesAfterClearingIH(WebElement ih210DaysManage, WebElement ihRecreateAggregates, WebElement ih365DaysManage, WebElement ih4HrsManage, WebElement ih90DaysManage) throws IOException, InterruptedException {

        List<WebElement> iframes = getWebDriver().findElements(By.tagName("iframe"));
        int noOfFrames = iframes.size();
        System.out.println("No Of Frames on this Window : " + noOfFrames);
        System.out.println(iframes);

        getWebDriver().switchTo().frame(0);
        click(ih210DaysManage, "210 Days IH Manage");
        click(ihRecreateAggregates, "210 Days IH Recreate Aggregates");
        Thread.sleep(5000);

        click(ih365DaysManage, "365 Days IH Manage");
        click(ihRecreateAggregates, "365 Days IH Recreate Aggregates");
        Thread.sleep(5000);

        click(ih4HrsManage, "4 Hrs IH Manage");
        click(ihRecreateAggregates, "4 Hrs IH Recreate Aggregates");
        Thread.sleep(5000);

        click(ih90DaysManage, "90 Days IH Manage");
        click(ihRecreateAggregates, "90 Days IH Recreate Aggregates");
        Thread.sleep(5000);

        getWebDriver().quit();
    }

    /**
     * This function for select box in the form of table
     *
     * @param locator
     * @param locatorName
     * @return
     */

    public List<WebElement> webElements(By locator, String locatorName) {
        List<WebElement> allElements;
        try {
            allElements = webDriver.findElements(locator);
        } catch (NoSuchElementException e) {
//            LoggingUtils.logFailure(new File(Objects.requireNonNull(extentReportHelper.getScreenshot("ScreenShot"))), "selectFromTable: Unable to find the element:-" + e.fillInStackTrace());
            throw new NoSuchElementException("The element with"
                    + locatorName + " not found");
        }

        return allElements;
    }


//--------------------------------------------------Excel Utility----------------------------------------------------

    /**
     * This function for reading excel sheet
     *
     * @param filePath          - It will tell where excel file is located
     * @param fileName          - It will tell excel file name
     * @param sheetName         - It will tell name of the sheet name
     * @param uniqueColumnName  - It will tell which column name to refer
     * @param scenarioCondition -  It will tell which row to be taken similar to primary key
     * @return Map<String, String> -  It will return Map object contains excel column names and column values
     */
    protected Map<String, String> readExcel(String filePath, String fileName, String sheetName, String uniqueColumnName, String scenarioCondition) throws IOException {
        Map<String, String> testCasesWithSamples = new LinkedHashMap<>();
        Workbook book = null;
        Sheet sheet = null;

        FileInputStream fis = new FileInputStream(System.getProperty("user.dir") + File.separator +
                filePath + File.separator + fileName);

        if (fileName.endsWith(".xlsx")) {
            book = new XSSFWorkbook(fis);
        } else if (fileName.endsWith(".xls")) {
            book = new HSSFWorkbook(fis);
        }

        sheet = book.getSheet(sheetName);

        List<String> headersList = null;
        List<String> dataList = null;
        Map<String, String> sample = null;
        for (Row row : sheet) {
            if (row.getCell(0).toString().startsWith("Header")) {
                headersList = new ArrayList<>();
                for (Cell cell : row) {
                    headersList.add(cell.toString());
                }
            } else {
                dataList = new ArrayList<>();
                sample = new LinkedHashMap<>();
                for (Cell cell : row) {
                    dataList.add(cell.toString());
                }
                for (int i = 0; i < dataList.size(); i++) {
                    if (headersList != null) {
                        sample.put(headersList.get(i), dataList.get(i));
                    }

                }

                if (sample.get(uniqueColumnName).equals(scenarioCondition)) {
                    testCasesWithSamples = sample;
                }
            }

        }

        return testCasesWithSamples;
    }


    // Save values into excel
    public void saveColumnValueToSpecificScenarioSheetName(String filePath, String fileName, String sheetName, String scenarioId, String columnName, String columnValue) throws FilloException {
        Fillo fillo = new Fillo();
        Connection connection = fillo.getConnection(filePath + File.separator + fileName);
        String query = "UPDATE " + sheetName + " SET " + columnName + "='" + columnValue + "' WHERE Header_TestID = '" + scenarioId + "'";
        connection.executeUpdate(query);
        connection.close();
    }
    //--------------------------------------------------Date and Time Utility----------------------------------------------------

    /**
     * This function for getting system date and time
     *
     * @return String - It returns date and time in string format
     */
    public String getSystemDateTimeForBatch(String format) {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern(format);
        LocalDateTime now = LocalDateTime.now();
        return dtf.format(now);
    }

    /**
     * This function for incrmenting date
     *
     * @return String - It returns incremented date  in string format
     */
    public String incrementDate(String format, String dateStr, int increment) {
        Date date = null;
        SimpleDateFormat dateFormat = new SimpleDateFormat(format);

        try {
            date = dateFormat.parse(dateStr);
        } catch (ParseException e) {
            Assert.fail("Date Parse error");
        }
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        c.add(Calendar.DATE, increment);
        Date currentDatePlusOne = c.getTime();
        dateStr = dateFormat.format(currentDatePlusOne);
        return dateStr;
    }

    /**
     * This function for changing date format
     * *
     *
     * @return String - It returns changed format of date
     */
    public String changeDateFormat(String date, String format) {
        Date date1 = new Date(date);
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(date1);
    }

    // Function to print difference in
    // time start_date and end_date
    public long findDifference(String start_date, String end_date) throws ParseException {

        // SimpleDateFormat converts the
        // string format to date object
        SimpleDateFormat sdf
                = new SimpleDateFormat(
                "yyyy-MM-dd");

        // parse method is used to parse
        // the text from a string to
        // produce the date
        Date d1 = sdf.parse(start_date);
        Date d2 = sdf.parse(end_date);

        // Calucalte time difference
        // in milliseconds
        long difference_In_Time
                = d2.getTime() - d1.getTime();

        return (difference_In_Time
                / (1000 * 60 * 60 * 24))
                % 365;

    }

    public void writeToFile(String query) {
        try {
            FileWriter fw = new FileWriter(System.getProperty("user.dir") + "/queries.txt", true);
            fw.write(query + "\n");
            fw.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println("Success...");
    }

    public void deleteDirectory(String destination) throws IOException {
        File folder = new File(destination);
        if (folder.exists()) {
            FileUtils.deleteDirectory(new File(destination));
        }

    }

}
