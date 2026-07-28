interface Document {
    void open();
}

// Document Classes
class WordDocument implements Document {
    public void open() {
        System.out.println("Opening Word Document");
    }
}

class PdfDocument implements Document {
    public void open() {
        System.out.println("Opening PDF Document");
    }
}

class ExcelDocument implements Document {
    public void open() {
        System.out.println("Opening Excel Document");
    }
}

// Factory Method Pattern Classes
abstract class DocumentFactory {
    public abstract Document createDocument();
}

class WordFactory extends DocumentFactory {
    public Document createDocument() {
        return new WordDocument();
    }
}

class PdfFactory extends DocumentFactory {
    public Document createDocument() {
        return new PdfDocument();
    }
}

class ExcelFactory extends DocumentFactory {
    public Document createDocument() {
        return new ExcelDocument();
    }
}
class Main {

    public static void main(String[] args) {

        // BEFORE FACTORY PATTERN
        System.out.println("=== WITHOUT FACTORY PATTERN ===");

        WordDocument w = new WordDocument();
        w.open();

        PdfDocument p = new PdfDocument();
        p.open();

        ExcelDocument e = new ExcelDocument();
        e.open();

        // AFTER FACTORY PATTERN
        System.out.println("\n=== WITH FACTORY PATTERN ===");

        DocumentFactory wordFactory = new WordFactory();
        Document wordDoc = wordFactory.createDocument();
        wordDoc.open();

        DocumentFactory pdfFactory = new PdfFactory();
        Document pdfDoc = pdfFactory.createDocument();
        pdfDoc.open();

        DocumentFactory excelFactory = new ExcelFactory();
        Document excelDoc = excelFactory.createDocument();
        excelDoc.open();
    }
}