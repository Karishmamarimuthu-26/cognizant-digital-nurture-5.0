// Without Singleton Pattern
class LoggerWithoutPattern {
    public LoggerWithoutPattern() {
        System.out.println("Logger instance created");
    }
    public void log(String message) {
        System.out.println("Log: " + message);
    }
}

// With singleton
class Logger {
    private static Logger instance = null;
    private Logger() {
        System.out.println("Logger instance created");
    }
    public static Logger getInstance() {
        if (instance == null) {
            instance = new Logger();
        }
        return instance;
    }
    public void log(String message) {
        System.out.println("Log: " + message);
    }
}

class Main {
    public static void main(String[] args) {
        System.out.println("Without Singleton:");
        LoggerWithoutPattern logger1 = new LoggerWithoutPattern();
        logger1.log("First log");
        LoggerWithoutPattern logger2 = new LoggerWithoutPattern();
        logger2.log("Second log");
        System.out.println("Are both instances the same? " + (logger1 == logger2));

        System.out.println("\nWith Singleton:");
        Logger singleton1 = Logger.getInstance();
        singleton1.log("First log");
        Logger singleton2 = Logger.getInstance();
        singleton2.log("Second log");
        System.out.println("Are both instances the same? " + (singleton1 == singleton2));
    }
}