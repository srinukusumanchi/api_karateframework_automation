package feature.utilities;

import com.codoid.products.exception.FilloException;
import com.codoid.products.fillo.Connection;
import com.codoid.products.fillo.Fillo;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.common.hash.Hashing;

import javax.xml.bind.SchemaOutputResolver;
import java.nio.charset.StandardCharsets;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;

public class StringUtilities {

    public String removeSpecialCharacters(String originalString, String specialCharacter, String replaceString) {
        String[] splChr = specialCharacter.split(" ");
        String newString = originalString;
        for (String chr : splChr) {
            newString = newString.replaceAll(chr, replaceString);
        }
        return newString;
    }

    public String removeSpecialCharacters(String originalString, String[] specialCharacter, String replaceString) {
        String newString = originalString;
        for (String chr : specialCharacter) {
            newString = newString.replaceAll(chr, replaceString);
        }
        return newString;

    }

    public String xmlDBComparions(String xml, String dataBase, Integer position) {
        String matchedData = null;
        String[] arrayList = xml.replaceAll("\\[", "").replaceAll("\\]", "").split(", ");
        ArrayList<String> array = new ArrayList<String>(Arrays.asList(arrayList));
        if (position != -1 && array.get(position).equalsIgnoreCase(dataBase)) {
            matchedData = dataBase;

        }
        return matchedData;
    }

    public int leadPosition(String xmlNbaData, String excelNbaData) {

        int j = -1;
        String[] arrayList = xmlNbaData.replaceAll("\\[", "").replaceAll("\\]", "").split(", ");
        ArrayList<String> array = new ArrayList<String>(Arrays.asList(arrayList));

        for (int i = 0; i < array.size(); i++) {
            if (array.get(i).equalsIgnoreCase(excelNbaData)) {
                j = i;
            }
        }
        return j;
    }


    public String xpathGenerate(String orignalString, String replaceFrom, String replaceTo) {

        return orignalString.replace(replaceFrom, replaceTo);
    }


    public String ageGreaterThanEighteen(String symbol) {
        LocalDate date = LocalDate.now();

        int month = date.getMonthValue();
        int day = date.getDayOfMonth();

        return "1993" + symbol + month + symbol + day;
    }

    public String currValUpdateTimestamp(){

        SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        System.out.println("TimeStamp is : "+timestamp);
        String currValUpdTmstp = sdf3.format(timestamp);
        return currValUpdTmstp;
    }


    public void writeToExcel(String testID, String testDatalocation, String testDataFileName, String testDataSheetname, String cid, String colname) throws FilloException {

        Fillo fillo = new Fillo();
        Connection con = fillo.getConnection(System.getProperty("user.dir") + "/" + testDatalocation
                + "/" + testDataFileName);
        con.executeUpdate("update " + testDataSheetname + " set " + colname + "= '" + cid + "' where TestID = '" + testID + "'");


    }

    public String convertToJson(List<Map<String, String>> mapObject) {
        GsonBuilder gsonMapBuilder = new GsonBuilder();
        Gson gsonObject = gsonMapBuilder.create();
        return gsonObject.toJson(mapObject);

    }

    public static LocalDate equalToSevenMonth(int months) throws ParseException {
        LocalDate date = LocalDate.now();
        LocalDate custOpndDate = date.minusMonths(months);
        LocalDate sixmonthLastDate = custOpndDate.minusDays(1);
        LocalDate sevenPlusOneDate = custOpndDate.plusDays(1);
        System.out.println("Equal To Seven is : "+custOpndDate);
        System.out.println("Six Month Last Date is : "+sixmonthLastDate);
        System.out.println("Seventh Plus one is : "+ sevenPlusOneDate);
        return custOpndDate;

    }

    // function to generate a random string of length n
    public String getAlphaNumericString(int n) {

        // chose a Character random from this String
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

        // create StringBuffer size of AlphaNumericString
        StringBuilder sb = new StringBuilder(n);

        for (int i = 0; i < n; i++) {

            // generate a random number between
            // 0 to AlphaNumericString variable length
            int index
                    = (int) (AlphaNumericString.length()
                    * Math.random());

            // add Character one by one in end of sb
            sb.append(AlphaNumericString
                    .charAt(index));
        }

        return sb.toString();
    }

    public String generateHashKey() {
        String originalString = getAlphaNumericString(10).toLowerCase();
        return Hashing.md5()
                .hashString(originalString, StandardCharsets.UTF_8)
                .toString();
    }

    public static void main(String args[])
    {
        StringUtilities stringUtilities = new StringUtilities();
        System.out.println(stringUtilities.currValUpdateTimestamp());
    }

}




