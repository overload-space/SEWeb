package model;

import model.Resource;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class UploadResource {
    public static void saveFileToLocalDisk(MultipartFile multipartFile, Homework homework) throws IOException,
            FileNotFoundException {

        String outputFileName = getDestinationLocation() + homework.getTitle() + "/" + multipartFile.getOriginalFilename();

        FileCopyUtils.copy(multipartFile.getBytes(), new FileOutputStream(outputFileName));
    }

    public static Resource getUploadedFileInfo(MultipartFile multipartFile, Homework homework) throws IOException {
        Resource fileInfo = new Resource();
        fileInfo.setFileName(multipartFile.getOriginalFilename());
        fileInfo.setFileUrl(getDestinationLocation()+ homework.getTitle() + "/");
        return fileInfo;
    }

    public static String getDestinationLocation() {
        //String testPath = "/Users/Cloud/Code/njuLessons/softwareEngineering/SEWeb/Resource/";
        String testPath = "D:\\Homework\\";
        return testPath;
    }

    public static void deleteFileFromDisk(String destLocation) {
        File file = new File(destLocation);
        file.delete();
    }
}
