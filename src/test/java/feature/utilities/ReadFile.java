package feature.utilities;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

public class ReadFile {

    public String readFileAsString(String fileName) throws IOException {

        String projectName=System.getProperty("user.dir");
        return new String(Files.readAllBytes(Paths.get(projectName+"\\"+fileName)));

    }


    public String filePath(String fileName){

        String filePath = System.getProperty("user.dir")+"\\"+fileName;
        return filePath;
    }
}
