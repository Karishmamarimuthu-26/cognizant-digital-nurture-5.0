public class FinancialForecasting {

    public static double predictFutureValue(
            double currentValue,
            double growthRate,
            int years) {

        // Base Case
        if (years == 0) {
            return currentValue;
        }

        
        return predictFutureValue(
                currentValue * (1 + growthRate),
                growthRate,
                years - 1);
    }

    public static void main(String[] args) {

        double currentValue = 10000;
        double growthRate = 0.10; // 10%
        int years = 3;

        double futureValue =
                predictFutureValue(
                        currentValue,
                        growthRate,
                        years);

        System.out.println("Current Value: ₹" + currentValue);
        System.out.println("Growth Rate: " + (growthRate * 100) + "%");
        System.out.println("Years: " + years);
        System.out.printf("Predicted Future Value: Rs. %.2f%n", futureValue);
    }
}
