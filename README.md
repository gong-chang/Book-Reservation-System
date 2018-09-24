# Book Reservation System
-   A web application that allows users to login and reserve their favorite books.  
-  This system is designed to meet the needs of libraries, Implemented admin page, allows admin to manage users, books, and reservations records.  
    

-   Front-end pages are based on JQuery and Bootstrap.  
    
-   Using Spring/Spring MVC/ Mybatis to construct back-end, MySQL as DB.  
    
-   Using Maven to manage the project dependencies. Deployed on Heroku.

.
The main page:
![The main page](https://raw.githubusercontent.com/MikasaG/Book-Reservation-System/master/images/1.PNG)


User can check the books list without login:
![books list](https://raw.githubusercontent.com/MikasaG/Book-Reservation-System/master/images/2.PNG)

Book detail:
![Book detail](https://raw.githubusercontent.com/MikasaG/Book-Reservation-System/master/images/3.PNG)

If user is not logged in and wants to reserve a book, it will remind the user to log in:
![remind](https://raw.githubusercontent.com/MikasaG/Book-Reservation-System/master/images/4.PNG)

User reserve a book:
![User reserve a book](https://raw.githubusercontent.com/MikasaG/Book-Reservation-System/master/images/5.PNG)

Admin page:  Administrator can add, delete or modify users, books, and reservations records.  
![Admin page](https://raw.githubusercontent.com/MikasaG/Book-Reservation-System/master/images/6.PNG)

Modifying a book information:
![Modifying a book information](https://raw.githubusercontent.com/MikasaG/Book-Reservation-System/master/images/7.PNG)

The administrator checks the book list which are currently reserved:
![8](https://raw.githubusercontent.com/MikasaG/Book-Reservation-System/master/images/8.PNG)

## About

There is a login and registration functionality included. There are two roles for user, such as student and admin.  
**Student**: The users with this role can check book detail and reserve their favorite book. But each book can only be reserved once.
**Administrators**: The Administrators has the highest authority, they can add, delete or modify users, books, and reservations records.  

Demo  👉  [Book Reservation System](https://reserve-book.herokuapp.com/listBooks)  
The demo is deployed on  [Heroku](https://www.heroku.com/), using MySQL as database.
