create database Ola;
use Ola;

select * from bookings;

-- 1. Retrieve all successful bookings:
select * from bookings where Booking_Status = 'Success';

-- 2. Find the average ride distance for each vehicle type:
select Vehicle_Type,avg(Ride_Distance) as Average_Ride_Distance from bookings group by Vehicle_Type;

-- 3. Get the total number of cancelled rides by customers:
select count(Booking_Status) as Number_of_Cancelled_Rides from bookings where Booking_Status="Canceled by customer";

-- 4. List the top 5 customers who booked the highest number of rides:
select Customer_ID,count(Booking_ID) as No_of_bookings from bookings group by Customer_ID order by No_of_bookings desc limit 5;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select count(Booking_Status) as Number_of_Rides_Cancelled from bookings where Canceled_Rides_by_Driver="Personal & Car related issue";

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select max(Driver_Ratings) as Maximum_Rating,min(Driver_Ratings) as Minimum_Rating from bookings where Vehicle_Type="Prime Sedan";

-- 7. Retrieve all rides where payment was made using UPI:
select count(*) as No_of_Rides from bookings where Payment_Method="UPI";

-- 8. Find the average customer rating per vehicle type:
select round(avg(Customer_Rating),2) as Average_Customer_Rating,Vehicle_Type from bookings group by Vehicle_Type;

-- 9. Calculate the total booking value of rides completed successfully:
select sum(Booking_Value) as Total_Booking_Value from bookings where Booking_Status="Success";

-- 10. List all incomplete rides along with the reason
select Booking_ID,Incomplete_Rides_Reason from bookings where Incomplete_Rides="yes";