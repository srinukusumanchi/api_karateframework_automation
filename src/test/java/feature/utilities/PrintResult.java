package feature.utilities;

import java.util.ArrayList;

public class PrintResult {

    static ArrayList<String> passedFields = new ArrayList<>();
    static ArrayList<String> failedFields = new ArrayList<>();
    public String printResult(String field,String value){
        passedFields.add(field+" is displayed correctly as "+value);
        return field+" is displayed correctly as "+value;
    }

    public String printFailedResult(String field,String value,String data){
        failedFields.add(field+" It is displayed as "+value+" instead of "+data );
        System.out.println("Fail-->" + field + " It is displayed as " + value + " instead of " + data);
        return field+" is displayed as "+ value+" instead of "+data;
    }

    public ArrayList<String> getFailedResults() {
        ArrayList<String> returnResult = new ArrayList<String>(failedFields);
        failedFields.clear();
        return returnResult;
    }

    public ArrayList<String> getPassedFields() {
        ArrayList<String> passedResullt=new ArrayList<>(passedFields);
        passedFields.clear();

        return passedResullt;
    }

    public void clearFields(){
        passedFields.clear();
        failedFields.clear();
    }

    public String printFailMessage(String message){
        failedFields.add(message);
        return message;
    }

    public String printPassMessage(String message){
        passedFields.add(message);
        return message;
    }

    public int getLength(ArrayList<String> failedFields){

        return (failedFields.size());
    }
}
