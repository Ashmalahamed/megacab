package com.maga.JavaFiles;

public class Vehicle {
    private int id;
    private String vehicleName;
    private String vehicleType;
    private String registrationNumber;
    private String driverName;
    private String contactNumber;

    // Constructors
    public Vehicle() {}

    public Vehicle(int id, String vehicleName, String vehicleType, String registrationNumber, String driverName, String contactNumber) {
        this.id = id;
        this.vehicleName = vehicleName;
        this.vehicleType = vehicleType;
        this.registrationNumber = registrationNumber;
        this.driverName = driverName;
        this.contactNumber = contactNumber;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getVehicleName() { return vehicleName; }
    public void setVehicleName(String vehicleName) { this.vehicleName = vehicleName; }

    public String getVehicleType() { return vehicleType; }
    public void setVehicleType(String vehicleType) { this.vehicleType = vehicleType; }

    public String getRegistrationNumber() { return registrationNumber; }
    public void setRegistrationNumber(String registrationNumber) { this.registrationNumber = registrationNumber; }

    public String getDriverName() { return driverName; }
    public void setDriverName(String driverName) { this.driverName = driverName; }

    public String getContactNumber() { return contactNumber; }
    public void setContactNumber(String contactNumber) { this.contactNumber = contactNumber; }
}
