<%-- 
    Document   : index
    Created on : 29 Nov, 2023, 11:07:23 PM
    Author     : Hp-admin
--%>

<%@page import="java.io.IOException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="automobile.autocar"%>
<%@page import="automobile.AutomobilePriceAnalysis"%>

<%@page import="java.util.Arrays"%>
<%@page import="automobile.Car"%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">

    <head>
        <!-- meta data -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!--font-family-->
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <link href="https://fonts.googleapis.com/css?family=Rufina:400,700" rel="stylesheet">

        <!-- title of site -->
        <title>Auto Mobile Price Analysis</title>

        <!-- For favicon png -->
        <link rel="shortcut icon" type="image/icon" href="assets/logo/favicon.png"/>

        <!--font-awesome.min.css-->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <!--linear icon css-->
        <link rel="stylesheet" href="assets/css/linearicons.css">

        <!--flaticon.css-->
        <link rel="stylesheet" href="assets/css/flaticon.css">

        <!--animate.css-->
        <link rel="stylesheet" href="assets/css/animate.css">

        <!--owl.carousel.css-->
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/owl.theme.default.min.css">

        <!--bootstrap.min.css-->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!-- bootsnav -->
        <link rel="stylesheet" href="assets/css/bootsnav.css" >	

        <!--style.css-->
        <link rel="stylesheet" href="assets/css/style.css">

        <!--responsive.css-->
        <link rel="stylesheet" href="assets/css/responsive.css">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

        <!--[if lt IE 9]>
                        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
                        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>

<section id="home" class="welcome-hero">

			<!-- top-area Start -->
			<div class="top-area">
				<div class="header-area">
					<!-- Start Navigation -->
				    <nav class="navbar navbar-default bootsnav  navbar-sticky navbar-scrollspy"  data-minus-value-desktop="70" data-minus-value-mobile="55" data-speed="1000">

				        <div class="container">

				            <!-- Start Header Navigation -->
				            <div class="navbar-header">
				                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
				                    <i class="fa fa-bars"></i>
				                </button>
				                <a class="navbar-brand" href="index.html">Auto Mobile Price Analysis<span></span></a>

				            </div><!--/.navbar-header-->
				            <!-- End Header Navigation -->

				            <!-- Collect the nav links, forms, and other content for toggling -->
				            <div class="collapse navbar-collapse menu-ui-design" id="navbar-menu">
				                <ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">
				                    <li ><a href="index.jsp">home</a></li>
				                  
				                    <li class="scroll"><a href="#featured-cars">featured cars</a></li>
				                    <li class="scroll"><a href="#new-cars">new cars</a></li>
				                    <li class="scroll"><a href="#brand">brands</a></li>
				                    <li class="scroll"><a href="#contact">contact</a></li>
				                </ul><!--/.nav -->
				            </div><!-- /.navbar-collapse -->
				        </div><!--/.container-->
				    </nav><!--/nav-->
				    <!-- End Navigation -->
				</div><!--/.header-area-->
			    <div class="clearfix"></div>

			</div><!-- /.top-area-->
			<!-- top-area End -->


			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="model-search-content">
							<div class="row">
								  <div class="panel panel-default">
                        <div class="panel-heading">Car Compare Get best Deal</div>
                        <div class="panel-body">


                            <table id="zctb" class="display table table-striped table-bordered table-hover" cellspacing="0" width="100%">
                                <thead>
                                    <tr>


                                        <th>Car Make</th>
                                        <th>Model</th>
                                        <th>Seating Capacity</th>
                                        <th>Mileage</th>
                                        <th>Price</th>





                                    </tr>
                                </thead>
                                <tbody>
                                    <%

                                        AutomobilePriceAnalysis automobile = new AutomobilePriceAnalysis();
                                        if(AutomobilePriceAnalysis.invertedIndex.size()>0)
                                        {
                                            System.out.println(AutomobilePriceAnalysis.invertedIndex.size());
                                        }
                                        else{
                                        autocar autoc = new autocar();
                                        String baseurl = "https://www.autocarindia.com";
                                        ArrayList<String> detailsList = new ArrayList<>();
                                        String urls = "https://www.spinny.com/buy-used-cars/chennai/hyundai/new-i20/sportz-12-mt-vadapalani-2021/11338017/?referrer=/used-hyundai-cars-in-chennai/s/";

                                        // Add the extracted values to the array list
                                        detailsList.add(urls);
                                        detailsList.add("https://www.spinny.com/buy-used-cars/chennai/maruti-suzuki/swift/vdi-sholinganallur-2016/11179370/?referrer=/used-cars-in-chennai/s/");
                                        detailsList.add("https://www.spinny.com/buy-used-cars/chennai/volkswagen/polo/highline-15-d-vadapalani-2014/11041884/?referrer=/used-cars-in-chennai/s/");
                                        detailsList.add("https://www.spinny.com/buy-used-cars/chennai/hyundai/new-i20/asta-o-10-turbo-dct-vadapalani-2020/11527979/?referrer=/used-hyundai-cars-in-chennai/s/");

                                        String url = "https://www.autocarindia.com/new-cars";
                                        if (autoc.isValidURL(url)) {
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
                                                    automobile.indexCar(cardeta);

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
                                                    automobile.indexCar(cardeta);
                                                    // Print the extracted values
                                                    System.out.println("Model Name: " + modelName);
                                                    System.out.println("Price: " + price);

                                                    // Print the extracted values
                                                    System.out.println("Mileage: " + mileage);
                                                    System.out.println("Seating Capacity: " + seatingCapacity);
                                                }

                                            } catch (IOException e) {
                                                e.printStackTrace();
                                            }
                                        } else {
                                            System.out.println("Invalid URL: " + url);
                                        }
                                        }
                                        String modelname = (String) session.getAttribute("carresult");

                                        List<Car> results = automobile.search(modelname);
                                        results = Car.removeRepeatedSequences(results);

                                        for (Car result : results) {


                                    %>


                                    <tr>
                                        <td> <%=result.getMake()%></td>
                                        <td> <%=result.getModel()%></td>

                                        <td> <%=result.getSeat()%></td>
                                        <td> <%=result.getMillage()%></td>
                                        <td> <%=result.getPrice()%></td>

                                    </tr>
                                    <%}


                                    %>

                                </tbody>
                            </table>
                        </div>
                    </div>

							</div>
						</div>
					</div>
				</div>
			</div>

		</section><!--/.welcome-hero-->
	
        <section id="service" class="service">
            <div class="container">
                <div class="service-content">
                  
                </div>
            </div><!--/.container-->

        </section><!--/.service-->
        <!--service end-->

        <!--new-cars start -->
        <section id="new-cars" class="new-cars">
            <div class="container">
                <div class="section-header">
                    <p>checkout <span>the</span> latest cars</p>
                    <h2>newest cars</h2>
                </div><!--/.section-header-->
                <div class="new-cars-content">
                    <div class="owl-carousel owl-theme" id="new-cars-carousel">
                        <div class="new-cars-item">
                            <div class="single-new-cars-item">
                                <div class="row">
                                    <div class="col-md-7 col-sm-12">
                                        <div class="new-cars-img">
                                            <img src="assets/images/new-cars-model/ncm1.png" alt="img"/>
                                        </div><!--/.new-cars-img-->
                                    </div>
                                    <div class="col-md-5 col-sm-12">
                                        <div class="new-cars-txt">
                                            <h2><a href="#">chevrolet camaro <span> za100</span></a></h2>
                                            <p>
                                                The Chevrolet Camaro is a popular American sports car known for its iconic design, powerful performance, and exhilarating driving experience	</p>

                                            <button class="welcome-btn new-cars-btn" onclick="window.location.href = '#'">
                                                view details
                                            </button>
                                        </div><!--/.new-cars-txt-->	
                                    </div><!--/.col-->
                                </div><!--/.row-->
                            </div><!--/.single-new-cars-item-->
                        </div><!--/.new-cars-item-->
                        <div class="new-cars-item">
                            <div class="single-new-cars-item">
                                <div class="row">
                                    <div class="col-md-7 col-sm-12">
                                        <div class="new-cars-img">
                                            <img src="assets/images/new-cars-model/ncm2.png" alt="img"/>
                                        </div><!--/.new-cars-img-->
                                    </div>
                                    <div class="col-md-5 col-sm-12">
                                        <div class="new-cars-txt">
                                            <h2><a href="#">BMW series-3 wagon</a></h2>
                                            <p>

                                                The BMW 3 Series Wagon, often part of the BMW 3 Series lineup, is a versatile and stylish estate car that combines the dynamic driving experience characteristic of BMW with the practicality of a wagon	</p>

                                            <button class="welcome-btn new-cars-btn" onclick="window.location.href = '#'">
                                                view details
                                            </button>
                                        </div><!--/.new-cars-txt-->	
                                    </div><!--/.col-->
                                </div><!--/.row-->	
                            </div><!--/.single-new-cars-item-->
                        </div><!--/.new-cars-item-->
                        <div class="new-cars-item">
                            <div class="single-new-cars-item">
                                <div class="row">
                                    <div class="col-md-7 col-sm-12">
                                        <div class="new-cars-img">
                                            <img src="assets/images/new-cars-model/ncm3.png" alt="img"/>
                                        </div><!--/.new-cars-img-->
                                    </div>
                                    <div class="col-md-5 col-sm-12">
                                        <div class="new-cars-txt">
                                            <h2><a href="#">ferrari 488 superfast</a></h2>
                                            <p>
                                                It is a versatile and stylish estate car that combines the dynamic driving experience	</p>

                                            <button class="welcome-btn new-cars-btn" onclick="window.location.href = '#'">
                                                view details
                                            </button>
                                        </div><!--/.new-cars-txt-->	
                                    </div><!--/.col-->
                                </div><!--/.row-->
                            </div><!--/.single-new-cars-item-->
                        </div><!--/.new-cars-item-->
                    </div><!--/#new-cars-carousel-->
                </div><!--/.new-cars-content-->
            </div><!--/.container-->

        </section><!--/.new-cars-->
        <!--new-cars end -->

        <!--featured-cars start -->
        <section id="featured-cars" class="featured-cars">
            <div class="container">
                <div class="section-header">
                    <p>checkout <span>the</span> featured cars</p>
                    <h2>featured cars</h2>
                </div><!--/.section-header-->
                <div class="featured-cars-content">
                    <div class="row">
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-featured-cars">
                                <div class="featured-img-box">
                                    <div class="featured-cars-img">
                                        <img src="assets/images/featured-cars/fc1.png" alt="cars">
                                    </div>
                                    <div class="featured-model-info">
                                        <p>
                                            model: 2017
                                            <span class="featured-mi-span"> 3100 mi</span> 
                                            <span class="featured-hp-span"> 240HP</span>
                                            automatic
                                        </p>
                                    </div>
                                </div>
                                <div class="featured-cars-txt">
                                    <h2><a href="#">BMW 6-series gran coupe</a></h2>
                                    <h3>$89,395</h3>
                                    <p>

                                        The BMW 3 Series Wagon, often part of the BMW 3 Series lineup, is a versatile and stylish estate car that combines the dynamic driving experience characteristic of BMW with the practicality of a wagon
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-featured-cars">
                                <div class="featured-img-box">
                                    <div class="featured-cars-img">
                                        <img src="assets/images/featured-cars/fc2.png" alt="cars">
                                    </div>
                                    <div class="featured-model-info">
                                        <p>
                                            model: 2017
                                            <span class="featured-mi-span"> 3100 mi</span> 
                                            <span class="featured-hp-span"> 240HP</span>
                                            automatic
                                        </p>
                                    </div>
                                </div>
                                <div class="featured-cars-txt">
                                    <h2><a href="#">chevrolet camaro <span>wmv20</span></a></h2>
                                    <h3>$66,575</h3>
                                    <p>
                                        It is a versatile and stylish estate car that combines the dynamic driving experience			</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-featured-cars">
                                <div class="featured-img-box">
                                    <div class="featured-cars-img">
                                        <img src="assets/images/featured-cars/fc3.png" alt="cars">
                                    </div>
                                    <div class="featured-model-info">
                                        <p>
                                            model: 2017
                                            <span class="featured-mi-span"> 3100 mi</span> 
                                            <span class="featured-hp-span"> 240HP</span>
                                            automatic
                                        </p>
                                    </div>
                                </div>
                                <div class="featured-cars-txt">
                                    <h2><a href="#">lamborghini <span>v520</span></a></h2>
                                    <h3>$125,250</h3>
                                    <p>
                                        It is a versatile and stylish estate car that combines the dynamic driving experience 
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-featured-cars">
                                <div class="featured-img-box">
                                    <div class="featured-cars-img">
                                        <img src="assets/images/featured-cars/fc4.png" alt="cars">
                                    </div>
                                    <div class="featured-model-info">
                                        <p>
                                            model: 2017
                                            <span class="featured-mi-span"> 3100 mi</span> 
                                            <span class="featured-hp-span"> 240HP</span>
                                            automatic
                                        </p>
                                    </div>
                                </div>
                                <div class="featured-cars-txt">
                                    <h2><a href="#">audi <span> a3</span> sedan</a></h2>
                                    <h3>$95,500</h3>
                                    <p>
                                        It is a versatile and stylish estate car that combines the dynamic driving experience 
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-featured-cars">
                                <div class="featured-img-box">
                                    <div class="featured-cars-img">
                                        <img src="assets/images/featured-cars/fc4.png" alt="cars">
                                    </div>
                                    <div class="featured-model-info">
                                        <p>
                                            model: 2017
                                            <span class="featured-mi-span"> 3100 mi</span> 
                                            <span class="featured-hp-span"> 240HP</span>
                                            automatic
                                        </p>
                                    </div>
                                </div>
                                <div class="featured-cars-txt">
                                    <h2><a href="#">infiniti <span>z5</span></a></h2>
                                    <h3>$36,850</h3>
                                    <p>
                                        It is a versatile and stylish estate car that combines the dynamic driving experience 
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-featured-cars">
                                <div class="featured-img-box">
                                    <div class="featured-cars-img">
                                        <img src="assets/images/featured-cars/fc5.png" alt="cars">
                                    </div>
                                    <div class="featured-model-info">
                                        <p>
                                            model: 2017
                                            <span class="featured-mi-span"> 3100 mi</span> 
                                            <span class="featured-hp-span"> 240HP</span>
                                            automatic
                                        </p>
                                    </div>
                                </div>
                                <div class="featured-cars-txt">
                                    <h2><a href="#">porsche <span>718</span> cayman</a></h2>
                                    <h3>$48,500</h3>
                                    <p>
                                        It is a versatile and stylish estate car that combines the dynamic driving experience 
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-featured-cars">
                                <div class="featured-img-box">
                                    <div class="featured-cars-img">
                                        <img src="assets/images/featured-cars/fc7.png" alt="cars">
                                    </div>
                                    <div class="featured-model-info">
                                        <p>
                                            model: 2017
                                            <span class="featured-mi-span"> 3100 mi</span> 
                                            <span class="featured-hp-span"> 240HP</span>
                                            automatic
                                        </p>
                                    </div>
                                </div>
                                <div class="featured-cars-txt">
                                    <h2><a href="#"><span>bmw 8-</span>series coupe</a></h2>
                                    <h3>$56,000</h3>
                                    <p>
                                        It is a versatile and stylish estate car that combines the dynamic driving experience 
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-featured-cars">
                                <div class="featured-img-box">
                                    <div class="featured-cars-img">
                                        <img src="assets/images/featured-cars/fc8.png" alt="cars">
                                    </div>
                                    <div class="featured-model-info">
                                        <p>
                                            model: 2017
                                            <span class="featured-mi-span"> 3100 mi</span> 
                                            <span class="featured-hp-span"> 240HP</span>
                                            automatic
                                        </p>
                                    </div>
                                </div>
                                <div class="featured-cars-txt">
                                    <h2><a href="#">BMW <span> x</span>series-6</a></h2>
                                    <h3>$75,800</h3>
                                    <p>
                                        It is a versatile and stylish estate car that combines the dynamic driving experience 
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/.container-->

        </section><!--/.featured-cars-->
        <!--featured-cars end -->


        <!--brand strat -->
        <section id="brand"  class="brand">
            <div class="container">
                <div class="brand-area">
                    <div class="owl-carousel owl-theme brand-item">
                        <div class="item">
                            <a href="#">
                                <img src="assets/images/brand/br1.png" alt="brand-image" />
                            </a>
                        </div><!--/.item-->
                        <div class="item">
                            <a href="#">
                                <img src="assets/images/brand/br2.png" alt="brand-image" />
                            </a>
                        </div><!--/.item-->
                        <div class="item">
                            <a href="#">
                                <img src="assets/images/brand/br3.png" alt="brand-image" />
                            </a>
                        </div><!--/.item-->
                        <div class="item">
                            <a href="#">
                                <img src="assets/images/brand/br4.png" alt="brand-image" />
                            </a>
                        </div><!--/.item-->

                        <div class="item">
                            <a href="#">
                                <img src="assets/images/brand/br5.png" alt="brand-image" />
                            </a>
                        </div><!--/.item-->

                        <div class="item">
                            <a href="#">
                                <img src="assets/images/brand/br6.png" alt="brand-image" />
                            </a>
                        </div><!--/.item-->
                    </div><!--/.owl-carousel-->
                </div><!--/.clients-area-->

            </div><!--/.container-->

        </section><!--/brand-->	
        <!--brand end -->

        <!--blog start -->
        <section id="blog" class="blog"></section><!--/.blog-->
        <!--blog end -->

        <!--contact start-->
        <footer id="contact"  class="contact">
            <div class="container">
                <div class="footer-top">
                    <div class="row">
                        <div class="col-md-3 col-sm-6">
                            <div class="single-footer-widget">
                                <div class="footer-logo">
                                    <a href="index.html">carvilla</a>
                                </div>
                                <p>
                                    Ased do eiusm tempor incidi ut labore et dolore magnaian aliqua. Ut enim ad minim veniam.
                                </p>
                                <div class="footer-contact">
                                    <p>info@themesine.com</p>
                                    <p>+1 (885) 2563154554</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2 col-sm-6">
                            <div class="single-footer-widget">
                                <h2>about devloon</h2>
                                <ul>
                                    <li><a href="#">about us</a></li>
                                    <li><a href="#">career</a></li>
                                    <li><a href="#">terms <span> of service</span></a></li>
                                    <li><a href="#">privacy policy</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3 col-xs-12">
                            <div class="single-footer-widget">
                                <h2>top brands</h2>
                                <div class="row">
                                    <div class="col-md-7 col-xs-6">
                                        <ul>
                                            <li><a href="#">BMW</a></li>
                                            <li><a href="#">lamborghini</a></li>
                                            <li><a href="#">camaro</a></li>
                                            <li><a href="#">audi</a></li>
                                            <li><a href="#">infiniti</a></li>
                                            <li><a href="#">nissan</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-5 col-xs-6">
                                        <ul>
                                            <li><a href="#">ferrari</a></li>
                                            <li><a href="#">porsche</a></li>
                                            <li><a href="#">land rover</a></li>
                                            <li><a href="#">aston martin</a></li>
                                            <li><a href="#">mersedes</a></li>
                                            <li><a href="#">opel</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-offset-1 col-md-3 col-sm-6">
                            <div class="single-footer-widget">
                                <h2>news letter</h2>
                                <div class="footer-newsletter">
                                    <p>
                                        Subscribe to get latest news  update and informations
                                    </p>
                                </div>
                                <div class="hm-foot-email">
                                    <div class="foot-email-box">
                                        <input type="text" class="form-control" placeholder="Add Email">
                                    </div><!--/.foot-email-box-->
                                    <div class="foot-email-subscribe">
                                        <span><i class="fa fa-arrow-right"></i></span>
                                    </div><!--/.foot-email-icon-->
                                </div><!--/.hm-foot-email-->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer-copyright">
                    <div class="row">
                        <div class="col-sm-6">
                            <p>
                                &copy; copyright.designed and developed by <a href="#">Automobile</a>.
                            </p><!--/p-->
                        </div>
                        <div class="col-sm-6">
                            <div class="footer-social">
                                <a href="#"><i class="fa fa-facebook"></i></a>	
                                <a href="#"><i class="fa fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-pinterest-p"></i></a>
                                <a href="#"><i class="fa fa-behance"></i></a>	
                            </div>
                        </div>
                    </div>
                </div><!--/.footer-copyright-->
            </div><!--/.container-->

            <div id="scroll-Top">
                <div class="return-to-top">
                    <i class="fa fa-angle-up " id="scroll-top" data-toggle="tooltip" data-placement="top" title="" data-original-title="Back to Top" aria-hidden="true"></i>
                </div>

            </div><!--/.scroll-Top-->

        </footer><!--/.contact-->
        <!--contact end-->



        <!-- Include all js compiled plugins (below), or include individual files as needed -->

        <script src="assets/js/jquery.js"></script>

        <!--modernizr.min.js-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>

        <!--bootstrap.min.js-->
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- bootsnav js -->
        <script src="assets/js/bootsnav.js"></script>

        <!--owl.carousel.js-->
        <script src="assets/js/owl.carousel.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>

        <!--Custom JS-->
        <script src="assets/js/custom.js"></script>

    </body>

</html>