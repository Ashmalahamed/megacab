package com.maga.JavaFiles;

public class Booking {
    private int id;
    private String userName;
    private String pickupLocation;
    private String dropLocation;
    private String cabType;
    private String bookingTime;
    private String customerName;
    private String customerAddress;
    private String customerPhone;
    private String orderNumber;

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

}