/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package automobile;

import static automobile.AutomobilePriceAnalysis.indexCar;
import static automobile.AutomobilePriceAnalysis.search;
import java.io.IOException;

import org.jsoup.*;
import org.jsoup.nodes.*;
import org.jsoup.select.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class autocar {

    private static final String URL_REGEX = "^((http|https)://)?([a-zA-Z0-9.-]+)\\.([a-zA-Z]{2,63})([/\\w.-]*)*/?$";

    private static final Pattern URL_PATTERN = Pattern.compile(URL_REGEX);

    public static boolean isValidURL(String url) {
        Matcher matcher = URL_PATTERN.matcher(url);
        return matcher.matches();
    }

    public static void main(String[] args) throws IOException {
        String baseurl = "https://www.autocarindia.com";
        ArrayList<String> detailsList = new ArrayList<>();
        String urls = "https://www.spinny.com/buy-used-cars/chennai/hyundai/new-i20/sportz-12-mt-vadapalani-2021/11338017/?referrer=/used-hyundai-cars-in-chennai/s/";

        // Add the extracted values to the array list
        detailsList.add(urls);
        detailsList.add("https://www.spinny.com/buy-used-cars/chennai/maruti-suzuki/swift/vdi-sholinganallur-2016/11179370/?referrer=/used-cars-in-chennai/s/");
        detailsList.add("https://www.spinny.com/buy-used-cars/chennai/volkswagen/polo/highline-15-d-vadapalani-2014/11041884/?referrer=/used-cars-in-chennai/s/");
        detailsList.add("https://www.spinny.com/buy-used-cars/chennai/hyundai/new-i20/sportz-12-mt-vadapalani-2021/11338017/?referrer=/used-cars-in-chennai/s/");
        detailsList.add("https://www.spinny.com/buy-used-cars/chennai/hyundai/new-i20/asta-o-10-turbo-dct-vadapalani-2020/11527979/?referrer=/used-hyundai-cars-in-chennai/s/");
        detailsList.add("https://www.spinny.com/buy-used-cars/chennai/hyundai/new-i20/sportz-12-mt-vadapalani-2021/11338017/?referrer=/used-hyundai-cars-in-chennai/s/");

        String url = "https://www.autocarindia.com/new-cars";
        if (isValidURL(url)) {
            try {

                // Connect to the website and get the HTML content
                Document document = Jsoup.connect(url).get();

                // Find all the car listings on the page
                Elements carListings = document.select("div.car-lis-sec");

                // Iterate through each car listing and extract information
                for (Element car : carListings) {

                    // Extract model name
                    String modelName = car.select("h3.heading-h4 a").text();
                    String CarCompany = modelName.split(" ")[0];

                    // Extract price
                    String price = car.select("h4.price-model").text();

                    // Extract engine information
                    String engineInfo = car.select("div.car-dis-sec p.icon-name:contains(Engine) + p").text();

                    // Extract fuel type
                    String fuelType = car.select("div.car-dis-sec p.icon-name:contains(Fuel Type) + p").text();

                    // Extract mileage
                    String mileage = car.select("div.car-dis-sec p.icon-name:contains(Mileage) + p").text();

                    Elements carListImgElements = document.select("div.car-lis-img");
                    String seatingCapacity = "4";

                    Elements anchorElement = carListImgElements.get(0).select("a");

                    // Check if the anchor element is not null
                    if (anchorElement != null) {
                        // Get the value of the "href" attribute
                        String hrefValue = anchorElement.attr("href");
                        String makedurl = baseurl + hrefValue;
                        Document docmm = Jsoup.connect(makedurl).get();
                        Element table = docmm.select("table.specification-section").first();

                        if (table != null) {
                            // Select the first row in the table
                            Element row = table.select("tr").first();

                            if (row != null) {
                                // Select the cell containing "Seating Capacity"
                                Element seatingCapacityCell = row.select("td:contains(Seating Capacity)").first();

                                if (seatingCapacityCell != null) {
                                    // Extract the text content after the span element
                                    seatingCapacity = seatingCapacityCell.select("span").first().nextSibling().toString().trim().split(" ")[0];
                                }

                            }
                        }
                    }
                    if (mileage.equalsIgnoreCase(null)) {
                        mileage = "N/A";
                    }
                    Car cardeta = new Car(CarCompany, modelName, price, mileage, seatingCapacity, Arrays.asList(engineInfo, fuelType, mileage));
                    indexCar(cardeta);

                    // Print or process the extracted information
                    System.out.println("Company Name: " + CarCompany);
                    System.out.println("Model Name: " + modelName);
                    System.out.println("Price: " + price);
                    System.out.println("Engine: " + engineInfo);
                    System.out.println("Fuel Type: " + fuelType);
                    System.out.println("Mileage: " + mileage);
                    System.out.println("seatingCapacity: " + seatingCapacity);
                    System.out.println("-_________________________-");
                }
                for (String urljj : detailsList) {

                    Document doc;

                    String CarCompany = "Honda";
                    // fetching the target website 
                    doc = Jsoup.connect(urljj).get();
                    Element section = doc.select("section[data-category=features-specification]").first();

                    // Select the elements within the section for mileage and seating capacity
                    Elements mileageElement = section.select(".styles__specDetails:contains(Mileage)");
                    Elements seatingCapacityElement = section.select(".styles__specDetails:contains(Seating capacity)");

                    // Extract the values
                    String mileage = mileageElement.select(".styles__specValue").text();
                    String seatingCapacity = seatingCapacityElement.select(".styles__specValue").text().split(" ")[0];

                    Element modelNameElement = doc.select(".DesktopRightSection__carName").first();
                    Element priceElement = doc.select(".DesktopRightSection__price span").first();

                    // Extract the values
                    String modelName = modelNameElement.text();
                    String price = priceElement.text();
                    Car cardeta = new Car(CarCompany, modelName, price, mileage, seatingCapacity, Arrays.asList(mileage));
                    indexCar(cardeta);
                    // Print the extracted values
                    System.out.println("Model Name: " + modelName);
                    System.out.println("Price: " + price);

                    // Print the extracted values
                    System.out.println("Mileage: " + mileage);
                    System.out.println("Seating Capacity: " + seatingCapacity);
                }

                String query = "320km";
                List<Car> results = search(query);
                // Display search results
                System.out.println("Search results for '" + query + "':");
                for (Car result : results) {
                    System.out.println(result);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("Invalid URL: " + url);
        }
    }

}
