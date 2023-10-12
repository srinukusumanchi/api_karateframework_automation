package feature.utilities;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;


public class ReadFromExcel {


    public static Map<String, String> readFromExcel(String uniqueColumnName, String testID, String testDataLocation, String testDataFileName, String testDataSheetName) throws IOException {

        Map<String, String> details = null;
        ArrayList<String> columnNames = null;

        File file = null;
        FileInputStream fileInputStream = null;
        Workbook workbook = null;
        Sheet sheet;
        String projectName = System.getProperty("user.dir");
        file = getFileObject(projectName + "/" + testDataLocation, testDataFileName);
        fileInputStream = getFileInputStreamObject(file);
        workbook = getWorkBook(fileInputStream, testDataFileName);
        sheet = getSheet(workbook, testDataSheetName);
        details = getDetailsPOI(uniqueColumnName, sheet, testID);
        fileInputStream.close();
        return details;

    }

    public static File getFileObject(String filePath, String fileName) {
        return new File(filePath + "\\" + fileName);
    }

    public static FileInputStream getFileInputStreamObject(File file) throws FileNotFoundException {
        return new FileInputStream(file);
    }

    public static Workbook getWorkBook(FileInputStream fileInputStream, String fileName) throws IOException {

        return new XSSFWorkbook(fileInputStream);
    }

    public static Sheet getSheet(Workbook workbook, String sheetName) {

        return workbook.getSheet(sheetName);
    }

    public static Map<String, String> getDetailsPOI(String uniqueColumnName, Sheet sheet, String testID) {
        Map<String, String> details = new LinkedHashMap<>();
        ArrayList<String> columnNames = new ArrayList<>();
        ArrayList<String> columnValues = new ArrayList<>();
        Row row = null;
        row = sheet.getRow(0);
        Iterator<Cell> cellIterator = row.cellIterator();
        while (cellIterator.hasNext()) {
            columnNames.add(cellIterator.next().getStringCellValue());
        }

        Iterator<Row> rowIterator = sheet.rowIterator();
        while (rowIterator.hasNext()) {
            Iterator<Cell> cellIteratorValue = rowIterator.next().cellIterator();
            while (cellIteratorValue.hasNext()) {
                String cellValue = cellIteratorValue.next().getStringCellValue();
                columnValues.add(cellValue);
            }
            Iterator<String> columnNameIterator = columnNames.iterator();
            Iterator<String> columnValuesIterator = columnValues.iterator();
            while (columnNameIterator.hasNext() && columnValuesIterator.hasNext()) {
                details.put(columnNameIterator.next(), columnValuesIterator.next());
            }
//            System.out.println(details);
            if (details.get(uniqueColumnName).equals(testID)) {
                break;
            } else {
                details.clear();
                columnValues.clear();
            }
        }

        return details;
    }

    public CSVRecord readCSVFile(String testID, String testDataLocation, String testDataFileName, String columnName) {
        CSVRecord csvRecordValues = null;
        try (
//                new BufferedReader(new InputStreamReader(new FileInputStream("a.txt"),"utf-8"));
                Reader reader = Files.newBufferedReader(Paths.get(System.getProperty("user.dir") + testDataLocation + "/" + testDataFileName));
//                Reader reader = newBufferedReader(new InputStreamReader(new FileInputStream(System.getProperty("user.dir") + testDataLocation + "/" + testDataFileName),"utf-8"));
                CSVParser csvParser = new CSVParser(reader, CSVFormat.DEFAULT
                        .withFirstRecordAsHeader()
                        .withIgnoreHeaderCase()
                        .withTrim())
        ) {
            for (CSVRecord csvRecord : csvParser) {
                // Accessing values by Header names
                System.out.println(csvRecord.get("OfferCode"));
                if (csvRecord.get("OfferCode").equals(testID)) {
                    csvRecordValues = csvRecord;
                    break;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return csvRecordValues;
    }

    public Map<String, Object> dataCombiner(ArrayList<String> details, ArrayList<String> columnNames) {
        Map<String, Object> data = new LinkedHashMap<>();
        Iterator<String> columnNamesIterator = columnNames.iterator();
        Iterator<String> detailIterator = details.iterator();
        while (detailIterator.hasNext() && columnNamesIterator.hasNext()) {
            data.put(columnNamesIterator.next(), detailIterator.next());
        }
        System.out.println("In datacombiner");
        return data;
    }

    public String readRequiredValueFromHashMap(Map<String, Object> data, String requiredValue) {


        String returnedValue;
        if (data.get(requiredValue).toString().equalsIgnoreCase("")) {
            returnedValue = "";
        } else {
            returnedValue = data.get(requiredValue).toString();
        }

        return returnedValue;
    }

    public String readRequiredValueFromCSV(CSVRecord data, String requiredValue) {

        return data.get(requiredValue);
    }
}
