# NabaNepal Kitchen Application

# Description

### E-commerce is quickly becoming a recognized and popular business paradigm. Businesses are setting up websites with capabilities for online transactions in greater and greater numbers. It is safe to argue that doing your buying online has become routine. The goal of this project is to create a general-purpose online store where consumers can shop for kitchen appliances including gas ranges and refrigerators without leaving their homes. Using the API of the MERN the backend was integrated. 

## Features

### Register and Login
### Add Review to the Product 
### Search the desired Product
### Add Product to the Cart
### Payment
### View Order History

# Technology Used

## Flutter

### Using a single code base, developers can create applications for mobile, desktop, and the web using the open-source Flutter platform. The NabaNepal Kitchen app was created using Flutter because, once code is written, it can quickly be integrated across all platforms.

## MongoDB

### Since this social media app deals with a huge amount of data it would be tuff for a relational database RDBMS to handle those data. In order to perfectly manages a large volume of data a NoSQL database is used which is MongoDB.

## NodeJS

### The widespread task in apps like reading and writing to the network connections as well as reading and writing to the database and file system executes at a very high speed when using NodeJS. Similarly, Node.js code written for either the browser or server runs in a similar manner on both.

## Challenges

### Everything was working fine in the code in the beginning. The logic of the code went vast when trying to add advanced features into the project. Firstly, fetching the review in the view review page did not work as the review was inside the array where it had two other components rating and comments where rating also had a list of arrays so the logic to fetch the review was really tough. In addition to this, integrating payment was another challenging part where the code has to be changed in android manifest to make it compatible to support the stripe payment. However, fixing all those issues the final project was built successfully at the end.

## Future Work

### 1.	Creating an admin panel in the application so that the admin can perform all the CRUD operations through the app.

### 2.	Report issues if the customer will face any problems while using the application.

### 3.	Implementing live chat so that admin and customer can contact instantly through message if the customer will have any query.

### 4.	Implementing dark mode and light mode so users can change the theme according to their choice.

## Project Architecture

### The repository pattern is a design pattern that is applied to this particular software development. This establishes a boundary between the data layer and the remainder of the application. In order for the rest of the app to access this data, the data layer is the part of the program that controls the data and business logic and provides consistent APIs. While the user interface (UI) shows the user’s information, the data layer contains things like networking code, Room databases, error handling, and other code that reads or manipulates data. Essentially, it is only used if we work offline. The repository acts as a link between the domain and data mapping layers by acting as an in-memory domain object collection. Our software may enable offline caching and offer quick access to data by preserving data obtained from the network on the device's local storage using this pattern. Before showing what is currently there, the device will download new report data from the back-end server if it is connected to the internet and store it locally. If not, the device will immediately retrieve the data that has been saved in a local data source like Hive or Sqflite, even if it is not connected to the internet.

## State Management 

### So, to enhance the performance of the code state management is used in this application. It usually handles multiple UI components. To enhance the performance of my code I have implemented get x and provider.

## a)	GetX
### A quick, dependable and small state management library for flutter is GetX. State management enables information transit within the program. I used getx.obs to setstate the data in a variable in flutter, which helped me do it without changing the app's overall state. 

## b)	Provider 
### Provider is easier to use and maintain wrapper for the inherited widgets. It provides a technique for managing the state of a piece of data inside the application.

## Conclusion

### Shopping for kitchen appliances has grown more important not only from the perspective of the entrepreneur but also from that of the client, as the Internet has emerged as a key resource in contemporary business. Kitchen appliances provide up new business prospects for entrepreneurs while also enabling consumers to compare prices. According to a report, most internet shoppers are impulsive and typically decide whether or not to stay on a website within the first few seconds. Like the inside of a store, app design. The customer is likely to go on to the other app if the store has a bad aesthetic or is similar to hundreds of other stores. As a result, we made every effort in the project's design to make it as simple for users to navigate, retrieve data from, and receive the appropriate feedback.

## Appendix
<img src="flutter%20images/splash.PNG" width="200"/>
<img src="flutter%20images/SignUp.PNG" width="200"/>
<img src="flutter%20images/login.PNG" width="200"/>
<img src="flutter%20images/dashboard.PNG" width="200"/>
<img src="flutter%20images/details_page.PNG" width="200"/>
<img src="flutter%20images/cart.PNG" width="200"/>
<img src="flutter%20images/Shipping.PNG" width="200"/>
<img src="flutter%20images/Order_Summary.PNG" width="200"/>
<img src="flutter%20images/payment.PNG" width="200"/>
<img src="flutter%20images/submit_review.PNG" width="200"/>
<img src="flutter%20images/view_review.PNG" width="200"/>
<img src="flutter%20images/profile.PNG" width="200"/>
<img src="flutter%20images/myaccount.PNG" width="200"/>
<img src="flutter%20images/changepassword.PNG" width="200"/>
<img src="flutter%20images/myorderhistory.PNG" width="200"/>
<img src="flutter%20images/orderdetails.PNG" width="200"/>
<img src="flutter%20images/tab_splash.PNG" width="200"/>
<img src="flutter%20images/tab_dashboard.PNG" width="200"/>
<img src="flutter%20images/tab_profilepage.PNG" width="200"/>
<img src="flutter%20images/wearos_splash.PNG" width="200"/>
<img src="flutter%20images/wearos_dashboard.PNG" width="200"/>
<img src="flutter%20images/wearos_notification.PNG" width="200"/>
