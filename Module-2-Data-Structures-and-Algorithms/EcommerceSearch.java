import java.util.Arrays;
import java.util.Comparator;

class Product {
    int productId;
    String productName;
    String category;
    public Product(int productId, String productName, String category) {
        this.productId = productId;
        this.productName = productName;
        this.category = category;
    }
    @Override
    public String toString() {
        return "Product ID: " + productId +
                ", Name: " + productName +
                ", Category: " + category;
    }
}

public class EcommerceSearch {
    public static Product linearSearch(Product[] products, String targetName) {
        for (Product product : products) {
            if (product.productName.equalsIgnoreCase(targetName)) {
                return product;
            }
        }
        return null;
    }

    public static Product binarySearch(Product[] products, String targetName) {
        int left = 0;
        int right = products.length - 1;
        while (left <= right) {
            int mid = left + (right - left) / 2;
            int comparison = products[mid].productName.compareToIgnoreCase(targetName);
            if (comparison == 0) {
                return products[mid];
            } else if (comparison < 0) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        return null;
    }

    public static void main(String[] args) {
        Product[] products = {
                new Product(101, "Laptop", "Electronics"),
                new Product(102, "Mouse", "Accessories"),
                new Product(103, "Keyboard", "Accessories"),
                new Product(104, "Monitor", "Electronics"),
                new Product(105, "Headphone", "Audio")
        };
        String searchItem = "Mouse";

        System.out.println("=== LINEAR SEARCH ===");
        Product linearResult = linearSearch(products, searchItem);
        if (linearResult != null) {
            System.out.println("Product Found");
            System.out.println(linearResult);
        } else {
            System.out.println("Product Not Found");
        }

        Arrays.sort(products, Comparator.comparing(p -> p.productName.toLowerCase()));

        System.out.println("\n=== BINARY SEARCH ===");
        Product binaryResult = binarySearch(products, searchItem);
        if (binaryResult != null) {
            System.out.println("Product Found");
            System.out.println(binaryResult);
        } else {
            System.out.println("Product Not Found");
        }

        System.out.println("\n=== TIME COMPLEXITY ANALYSIS ===");
        System.out.println("Linear Search:");
        System.out.println("Best Case    : O(1)");
        System.out.println("Average Case : O(n)");
        System.out.println("Worst Case   : O(n)");
        System.out.println();
        System.out.println("Binary Search:");
        System.out.println("Best Case    : O(1)");
        System.out.println("Average Case : O(log n)");
        System.out.println("Worst Case   : O(log n)");
    }
}