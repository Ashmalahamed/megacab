package com.maga.JavaFiles;

public class Booking {
    private int id; // Unique identifier for the booking
    private String userName; // Name of the user making the booking
    private String pickupLocation; // Pickup location
    private String dropLocation; // Drop location
    private String cabType; // Type of cab (e.g., Standard, Luxury, SUV)
    private String bookingTime; // Date and time of the booking
    private String customerName; // Name of the customer
    private String customerAddress; // Address of the customer
    private String customerPhone; // Phone number of the customer
    private String orderNumber; // Unique order number

    // Parameterized Constructor
    public Booking(int id, String userName, String pickupLocation, String dropLocation, String cabType,
                   String bookingTime, String customerName, String customerAddress, String customerPhone, String orderNumber) {
        this.id = id;
        this.userName = userName;
        this.pickupLocation = pickupLocation;
        this.dropLocation = dropLocation;
        this.cabType = cabType;
        this.bookingTime = bookingTime;
        this.customerName = customerName;
        this.customerAddress = customerAddress;
        this.customerPhone = customerPhone;
        this.orderNumber = orderNumber;
    }

    // Default Constructor
    public Booking() {}

    // Getters
    public int getId() { return id; }
    public String getUserName() { return userName; }
    public String getPickupLocation() { return pickupLocation; }
    public String getDropLocation() { return dropLocation; }
    public String getCabType() { return cabType; }
    public String getBookingTime() { return bookingTime; }
    public String getCustomerName() { return customerName; }
    public String getCustomerAddress() { return customerAddress; }
    public String getCustomerPhone() { return customerPhone; }
    public String getOrderNumber() { return orderNumber; }

    // Setters
    public void setId(int id) { this.id = id; }
    public void setUserName(String userName) { this.userName = userName; }
    public void setPickupLocation(String pickupLocation) { this.pickupLocation = pickupLocation; }
    public void setDropLocation(String dropLocation) { this.dropLocation = dropLocation; }
    public void setCabType(String cabType) { this.cabType = cabType; }
    public void setBookingTime(String bookingTime) { this.bookingTime = bookingTime; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }
    public void setCustomerAddress(String customerAddress) { this.customerAddress = customerAddress; }
    public void setCustomerPhone(String customerPhone) { this.customerPhone = customerPhone; }
    public void setOrderNumber(String orderNumber) { this.orderNumber = orderNumber; }

    // toString method for debugging purposes
    @Override
    public String toString() {
        return "Booking{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", pickupLocation='" + pickupLocation + '\'' +
                ", dropLocation='" + dropLocation + '\'' +
                ", cabType='" + cabType + '\'' +
                ", bookingTime='" + bookingTime + '\'' +
                ", customerName='" + customerName + '\'' +
                ", customerAddress='" + customerAddress + '\'' +
                ", customerPhone='" + customerPhone + '\'' +
                ", orderNumber='" + orderNumber + '\'' +
                '}';
    }
}