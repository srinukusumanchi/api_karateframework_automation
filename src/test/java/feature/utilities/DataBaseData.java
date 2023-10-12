package feature.utilities;

import baseclass.BasePage;
import org.junit.Assert;
import org.junit.jupiter.api.Assertions;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.*;

public class DataBaseData {
    private static Properties properties;
    private final JdbcTemplate jdbc;

    private String getDbHost() {
        return properties.getProperty("dbHost");
    }

    private String getDbPort() {
        return properties.getProperty("dbPort");
    }

    private String getDbName() {
        return properties.getProperty("databaseName");
    }

    private String getDbUserName() {
        return properties.getProperty("dbUserName");
    }

    private String getDbPassword() {
        return properties.getProperty("dbPassword");
    }

    private String getSchema() {
        return properties.getProperty("dbSchema");
    }

    public DataBaseData() throws IOException {
        properties = new Properties();
        File file = new File(System.getProperty("user.dir") + "/src/test/java/config/application.properties");
        FileInputStream inputStream = new FileInputStream(file);
        properties.load(inputStream);
        String dbHost = getDbHost();
        String dbPort = getDbPort();
        String databaseName = getDbName();
        String dbUserName = getDbUserName();
        String dbPassword = getDbPassword();
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.ibm.db2.jcc.DB2Driver");
        dataSource.setUrl("jdbc:db2://" + dbHost + ":" + dbPort + "/" + databaseName);
        dataSource.setUsername(dbUserName);
        dataSource.setPassword(dbPassword);
        jdbc = new JdbcTemplate(dataSource);
    }


    public String readValue(String query) {
        String dbData = null;
        try {
            dbData = Objects.requireNonNull(jdbc.queryForObject(query, String.class)).trim();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return dbData;
    }

    public Map<String, Object> readRow(String query) {
        return jdbc.queryForMap(query);
    }

    public List<Map<String, Object>> readRows(String query) {
        List<Map<String, Object>> dbData = null;
        try {
            dbData = jdbc.queryForList(query);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return dbData;
    }

    public void insertRows(final String query) {
        try {
            jdbc.batchUpdate(query);
            System.out.println("Query:-" + query);
            new BasePage().writeToFile(query.replace(properties.get("dbSchema").toString(),
                    "customerdata").replace("CURRENT TIMESTAMP", "CURRENT_TIMESTAMP") + ";");
            System.out.println("Insert/Update is successful and query is:- " + query);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            Assertions.fail("Unable to update/insert record to database table, Error is:-" + e.getMessage()
                    + "Query is :-" + query);
        }

    }

    public int dbColumnStartsNumber(ArrayList<String> k) {
        int dbColumnStartAt = 0;
        for (String k1 : k) {

            if (k1.equals("Db_Column_Starts")) {
                break;

            }
            dbColumnStartAt = dbColumnStartAt + 1;
        }
        return (dbColumnStartAt + 1);
    }


    public String queryBuilderUpdate(Map<String, String> mapobj, String tableName) {
        String dbSchema = getSchema();
        String columnData = "CURRENT TIMESTAMP";
        String columnNames = "UPDATE " + dbSchema + "." + tableName + " SET INSRT_PROCESS_TMSTMP=";
        StringBuilder columnNamesStringBuilder = null;
        String relational = null;

        try {
            Set<String> columnHeaders = mapobj.keySet();
            ArrayList<String> columnHeaderArray = new ArrayList<String>(columnHeaders);

            int dbColumnStartAt = dbColumnStartsNumber(columnHeaderArray);
            columnNames = columnNames.concat(columnData);
            columnNames = columnNames.concat(", ");
            for (int i = dbColumnStartAt; i < columnHeaderArray.size(); i++) {

                if (!mapobj.get(columnHeaderArray.get(i)).equals("")) {
                    columnNames = columnNames.concat(columnHeaderArray.get(i) + "='" + mapobj.get(columnHeaderArray.get(i).trim()) + "'");
                    columnNames = columnNames.concat(", ");
                }
            }
            if (tableName.equals("ACCT_DIM")) {
                relational = "WHERE ACCT_NUM='" + mapobj.get("ACCT_NUM") + "'";
            } else if (tableName.equals("CUST_ACCT_RLTNP_DIM")) {
                relational = "WHERE ACCT_NUM='" + mapobj.get("ACCT_NUM") + "' AND CIS_CUST_ID='" + mapobj.get("CIS_CUST_ID") + "'";
            } else if (tableName.equals("CUST_DIM")) {
                relational = "WHERE CIS_CUST_ID='" + mapobj.get("CIS_CUST_ID") + "'";
            }

            int columnDataLastIndexValue = columnNames.lastIndexOf(',');
            columnNamesStringBuilder = new StringBuilder(columnNames);
            columnNamesStringBuilder.setCharAt(columnDataLastIndexValue, ' ');

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return columnNamesStringBuilder.append(relational).toString();
    }


    public String queryBuilder(Map<String, String> mapobj, String tableName) {
        String dbSchema = getSchema();
        String columnData = "values(CURRENT TIMESTAMP,";
        String columnNames = "Insert into " + dbSchema + "." + tableName + "(INSRT_PROCESS_TMSTMP,";
        StringBuilder columnNamesStringBuilder = null;
        StringBuilder columnDataStringBuilder = null;

        try {
            Set<String> columnHeaders = mapobj.keySet();
            ArrayList<String> columnHeaderArray = new ArrayList<String>(columnHeaders);

            int dbColumnStartAt = dbColumnStartsNumber(columnHeaderArray);
            for (int i = dbColumnStartAt; i < columnHeaderArray.size(); i++) {

                if (!mapobj.get(columnHeaderArray.get(i)).equals("")) {
                    columnNames = columnNames.concat(columnHeaderArray.get(i));
                    columnNames = columnNames.concat(",");
                    if (mapobj.get(columnHeaderArray.get(i)).equalsIgnoreCase("NULL")) {
                        columnData = columnData.concat(mapobj.get(columnHeaderArray.get(i)));
                    } else if (mapobj.get(columnHeaderArray.get(i)).equalsIgnoreCase("BLANK")) {
                        columnData = columnData.concat("''");
                    } else {
                        columnData = columnData.concat("'" + mapobj.get(columnHeaderArray.get(i)) + "'");
                    }

                    columnData = columnData.concat(",");

                }

            }
            int columnDataLastIndexValue = columnData.lastIndexOf(',');
            int columnNameLastIndexValue = columnNames.lastIndexOf(',');
            columnNamesStringBuilder = new StringBuilder(columnNames);
            columnDataStringBuilder = new StringBuilder(columnData);
            columnDataStringBuilder.setCharAt(columnDataLastIndexValue, ')');
            columnNamesStringBuilder.setCharAt(columnNameLastIndexValue, ')');

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return columnNamesStringBuilder.toString() + " " + columnDataStringBuilder.toString();
    }

    public String queryBuilderPurlCust(Map<String, String> mapobj, String tableName) {
        String dbSchema = getSchema();
        String columnData = "values(";
        String columnNames = "Insert into " + dbSchema + "." + tableName + "(";
        StringBuilder columnNamesStringBuilder = null;
        StringBuilder columnDataStringBuilder = null;

        try {
            Set<String> columnHeaders = mapobj.keySet();
            ArrayList<String> columnHeaderArray = new ArrayList<String>(columnHeaders);

            int dbColumnStartAt = dbColumnStartsNumber(columnHeaderArray);
            for (int i = dbColumnStartAt; i < columnHeaderArray.size(); i++) {

                if (!mapobj.get(columnHeaderArray.get(i)).equals("")) {
                    columnNames = columnNames.concat(columnHeaderArray.get(i));
                    columnNames = columnNames.concat(",");
                    if (mapobj.get(columnHeaderArray.get(i)).equalsIgnoreCase("NULL")) {
                        columnData = columnData.concat(mapobj.get(columnHeaderArray.get(i)));
                    } else {
                        columnData = columnData.concat("'" + mapobj.get(columnHeaderArray.get(i)) + "'");
                    }

                    columnData = columnData.concat(",");

                }

            }
            int columnDataLastIndexValue = columnData.lastIndexOf(',');
            int columnNameLastIndexValue = columnNames.lastIndexOf(',');
            columnNamesStringBuilder = new StringBuilder(columnNames);
            columnDataStringBuilder = new StringBuilder(columnData);
            columnDataStringBuilder.setCharAt(columnDataLastIndexValue, ')');
            columnNamesStringBuilder.setCharAt(columnNameLastIndexValue, ')');

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return columnNamesStringBuilder.toString() + " " + columnDataStringBuilder.toString();
    }

    public String customizeQueryResult(final String query) {
        String value = null;
        try {
            value = jdbc.queryForObject(query, String.class);
            System.out.println("Query:-" + query);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            Assert.fail("Query is not given properly, Error is:-" + e.getMessage()
                    + "Query is :-" + query);
        }
        return value;
    }

    public String lastSeqUsed() throws IOException {
        DataBaseData database = new DataBaseData();
        String lastSeqUsed = database.customizeQueryResult("select max(LAST_SEQ_USED+1) from " + getSchema() + ".PURL_CUST_PROFILE");
        return lastSeqUsed;
    }

    public String genLastSeqUsedAcc2() throws IOException {
        DataBaseData database = new DataBaseData();
        String lastSeqUsedAcc2 = database.customizeQueryResult("select max(LAST_SEQ_USED+2) from " + getSchema() + ".PURL_CUST_PROFILE");
        return lastSeqUsedAcc2;
    }

    public String genLastSeqUsedAcc3() throws IOException {
        DataBaseData database = new DataBaseData();
        String lastSeqUsedAcc3 = database.customizeQueryResult("select max(LAST_SEQ_USED+3) from " + getSchema() + ".PURL_CUST_PROFILE");
        return lastSeqUsedAcc3;
    }

    public String genLastSeqUsedAcc4() throws IOException {
        DataBaseData database = new DataBaseData();
        String lastSeqUsedAcc4 = database.customizeQueryResult("select max(LAST_SEQ_USED+4) from " + getSchema() + ".PURL_CUST_PROFILE");
        return lastSeqUsedAcc4;
    }

    public String queryBuilderCustAcctPref(Map<String, String> mapobj, String tableName) {
        String dbSchema = getSchema();
        String columnData = "values(CURRENT TIMESTAMP,";
        String columnNames = "Insert into " + dbSchema + "." + tableName + "(INSRT_PROCESS_TMSTMP,";
        StringBuilder columnNamesStringBuilder = null;
        StringBuilder columnDataStringBuilder = null;

        try {
            Set<String> columnHeaders = mapobj.keySet();
            ArrayList<String> columnHeaderArray = new ArrayList<String>(columnHeaders);

            int dbColumnStartAt = dbColumnStartsNumber(columnHeaderArray);
            for (int i = dbColumnStartAt; i < columnHeaderArray.size(); i++) {

                if (!mapobj.get(columnHeaderArray.get(i)).equals("")) {
                    columnNames = columnNames.concat(columnHeaderArray.get(i));
                    columnNames = columnNames.concat(",");
                    if (mapobj.get(columnHeaderArray.get(i)).equalsIgnoreCase("NULL")) {
                        columnData = columnData.concat(mapobj.get(columnHeaderArray.get(i)));
                    } else {
                        columnData = columnData.concat("'" + mapobj.get(columnHeaderArray.get(i)) + "'");
                    }

                    columnData = columnData.concat(",");

                }

            }
            int columnDataLastIndexValue = columnData.lastIndexOf(',');
            int columnNameLastIndexValue = columnNames.lastIndexOf(',');
            columnNamesStringBuilder = new StringBuilder(columnNames);
            columnDataStringBuilder = new StringBuilder(columnData);
            columnDataStringBuilder.setCharAt(columnDataLastIndexValue, ')');
            columnNamesStringBuilder.setCharAt(columnNameLastIndexValue, ')');

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return columnNamesStringBuilder.toString() + " " + columnDataStringBuilder.toString();
    }


    public String queryBuilder_NoTimestmap(Map<String, String> mapobj, String tableName) {
        String dbSchema = getSchema();
        String columnData = "values(";
        String columnNames = "Insert into " + dbSchema + "." + tableName + "(";
        StringBuilder columnNamesStringBuilder = null;
        StringBuilder columnDataStringBuilder = null;

        try {
            Set<String> columnHeaders = mapobj.keySet();
            ArrayList<String> columnHeaderArray = new ArrayList<String>(columnHeaders);

            int dbColumnStartAt = dbColumnStartsNumber(columnHeaderArray);
            for (int i = dbColumnStartAt; i < columnHeaderArray.size(); i++) {

                if (!mapobj.get(columnHeaderArray.get(i)).equals("")) {
                    columnNames = columnNames.concat(columnHeaderArray.get(i));
                    columnNames = columnNames.concat(",");
                    columnData = columnData.concat("'" + mapobj.get(columnHeaderArray.get(i)) + "'");
                    columnData = columnData.concat(",");

                }

            }
            int columnDataLastIndexValue = columnData.lastIndexOf(',');
            int columnNameLastIndexValue = columnNames.lastIndexOf(',');
            columnNamesStringBuilder = new StringBuilder(columnNames);
            columnDataStringBuilder = new StringBuilder(columnData);
            columnDataStringBuilder.setCharAt(columnDataLastIndexValue, ')');
            columnNamesStringBuilder.setCharAt(columnNameLastIndexValue, ')');

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return columnNamesStringBuilder.toString() + " " + columnDataStringBuilder.toString();
    }

}
