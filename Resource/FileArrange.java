import java.io.*;
import java.util.ArrayList;
import java.util.Scanner;

// class FileArrangeBase:
/*
* Data Fields:
*       String desktopDir;
*       ArrayList<String> fileLists;
*       String[] type;
*       String targetDirectory;
* Private methods:
*       String getExtension(String path);
*       boolean isSuffix(String path,String[] suf);
* Public methods:
*       public  FileArrangeBase();
*       public FileArrangeBase(String desk,String[] t,String target);
*       public boolean This();
*       public boolean That();
* */
class FileArrangeBase {
    private String desktopDir;
    private ArrayList<String> fileLists;
    private String[] type;
    private String targetDirectory;

    // get the extension of a legal path.
    // For example: given path's format is  *****.xxx, return result is xxx
    private String getExtension(String path) {
        int lastIndex = path.lastIndexOf('.');
        String extension = "";
        if(lastIndex > 0) {
            extension = path.substring(lastIndex+1);
        }
        return extension;
    }

    // Decide the given path's extension is in suf or not.
    private boolean isSuffix(String path,String[] suf) {
        String extension = getExtension(path);
        for (String s : suf) {
            if (extension.equals(s)) {
                return true;
            }
        }
        return false;
    }

    // constructor, initialize all the data fields.
    public FileArrangeBase(String desk,String[] t,String target) {
        desktopDir = desk;
        fileLists = new ArrayList<String>();
        type = t.clone();
        targetDirectory=target;
    }

    // default constructor, do nothing.
    public  FileArrangeBase() {
    }

    // This() methods:
    // Test desktop directory has file with given extension or not.
    // if so : add it to fileLists
    // else : do nothing.
    public boolean This() {
        boolean flag = false;
        File desktop = new File(desktopDir);
        File[] completeFileLists = desktop.listFiles();
        if(completeFileLists != null) {
            for (File i : completeFileLists) {
                if (i.isFile()) {
                    String p = i.getPath();
                    if(isSuffix(p,type)) {
                        flag = true;
                        fileLists.add(p);
                    }
                }
            }
        }
        return flag;
    }

    // move all the files in fileLists to target Directory.
    // Notice:
    // we move file A to B:
    // if B already exists, just rename A's name with additional prefix '%'
    // and this is recursive.
    public boolean That() {
        File targetDir = new File(desktopDir+targetDirectory+"/");
        System.out.println("Target directory: " + targetDir.getPath());
        if(!targetDir.exists()) {
            try {
                System.out.println("Create new directory " + targetDir.getPath());
                targetDir.mkdir();
            }
            catch (SecurityException se) {
                System.out.println("Create Failed!");
                se.printStackTrace();
                return false;
            }
        }

        try {
            for (String i : fileLists) {
                File temp = new File(i);
                System.out.println("move file " + temp.getPath() + " to " + targetDir.getPath());
                File dest = new File(targetDir.getPath()+"/"+temp.getName());

                for(int j=0;dest.exists();j++) {
                    String repeated = new String(new char[j]).replace("\0", "%");;
                    dest = new File(targetDir.getPath()+"/" + repeated +temp.getName());
                }
                temp.renameTo(dest);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}


// class FileArrangeTxt:
class FileArrangeTxt extends FileArrangeBase {
    // private default constructor means user cannot get this type object with no parameters.
    private  FileArrangeTxt() {
    }

    // if user just give desktop directory, it will use [ new String[]{"txt"},"TXT" ] as second and third parameters.
    public  FileArrangeTxt(String desktop) {
        super(desktop,new String[]{"txt"},"TXT");
    }

    // user can also give all the three parameters.
    public  FileArrangeTxt(String desktop,String[] suffixs,String target) {
        super(desktop,suffixs,target);
    }
}


class FileArrangeDoc extends  FileArrangeBase {
    // private default constructor means user cannot get this type object with no parameters.
    private  FileArrangeDoc() {
    }

    // if user just give desktop directory, it will use [ new String[]{"doc","docx"},"DOC" ] as second and third parameters.
    public  FileArrangeDoc(String desktop) {
        super(desktop,new String[]{"doc","docx"},"DOC");
    }

    // user can also give all the three parameters.
    public  FileArrangeDoc(String desktop,String[] suffixs,String target) {
        super(desktop,suffixs,target);
    }
}

public class FileArrange {
    public  static  void main(String[] args) {

        System.out.println("Please input desktop directory,like 'D:/Temp/', the end '/' is essential.");
        Scanner input = new Scanner(System.in);
        String desktop = input.next();

        // get instance
        FileArrangeTxt faTxt = new FileArrangeTxt(desktop);
        FileArrangeDoc faDoc = new FileArrangeDoc(desktop);

        // if this then that
        if(faTxt.This()) {
            faTxt.That();
        }

        // if this then that
        if(faDoc.This()) {
            faDoc.That();
        }
    }
}