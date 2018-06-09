package pl.javastart.controller;

import pl.javastart.businesslogic.PriceCalculator;
import pl.javastart.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/controller")
public class ControllerServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ArrayList<Product> allProducts = new ArrayList<>();
        PriceCalculator calculator = new PriceCalculator();
        double sum;
        double average;

        request.setCharacterEncoding("UTF-8");
        for (int i=1;i<5;i++){
            String productStr = request.getParameter("product"+i);
            String priceStr = request.getParameter("price"+i);
            if (!productStr.equals("") && !priceStr.equals("")) {
                try {
                    Product product = new Product(productStr, Double.parseDouble(priceStr));
                    allProducts.add(product);
                }catch(NumberFormatException e){
                    System.out.println("Price must be a double. " + e.getMessage());
                }
            }
        }

        /*for (Product product : allProducts){
            System.out.println(product.toString());
        }*/

        sum = calculator.calculateSum(allProducts);
        average = calculator.calculateAverage(allProducts);

        //System.out.println("suma= "+ sum + " srednia= " + average);

        if(!allProducts.isEmpty()) {
            request.setAttribute("products", allProducts);
            request.setAttribute("sum",sum);
            request.setAttribute("average",average);
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        }else{
            request.getRequestDispatcher("empty.jsp").forward(request, response);
        }
        allProducts.clear();

    }

}
