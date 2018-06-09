package pl.javastart.businesslogic;

import pl.javastart.model.Product;

import java.util.ArrayList;

public class PriceCalculator {

    public double calculateSum(ArrayList<Product> products){
        double sum = 0;

        for (int i=0;i<products.size();i++){
            sum = sum + products.get(i).getPrice();
        }
        return sum;
    }

    public double calculateAverage(ArrayList<Product> products){
        double average = calculateSum(products);

        if (products.size()!=0)
            average=average/products.size();

        return average;
    }

}
