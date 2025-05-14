package com.codegym.case_study_restaurant.model;

public class MenuItem {
    private int itemId;
    private String name;
    private String description;
    private double price;
    private String category;
    private String imageUrl;
    private boolean isAvailable;

    // Constructors
    public MenuItem() {}

    public MenuItem(int itemId, String name, String description, double price, String category, String imageUrl, boolean isAvailable) {
        this.itemId = itemId;
        this.name = name;
        this.description = description;
        this.price = price;
        this.category = category;
        this.imageUrl = imageUrl;
        this.isAvailable = isAvailable;
    }

    public Object getName() {
        return name;
    }

    public Object getDescription() {
        return description;
    }

    public Object getPrice() {
        return price;
    }

    public String getCategory() {
        return category;
    }

    public boolean isAvailable() {
        return isAvailable;
    }

    public Object getImageUrl() {
        return imageUrl;
    }

    @Override
    public String toString() {
        return "MenuItem [itemId=" + itemId + ", name=" + name + ", description=" + description + ", price=" + price
                + ", category=" + category + ", imageUrl=" + imageUrl + ", isAvailable=" + isAvailable + "]";
    }
}

