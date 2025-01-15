class Product {
    constructor(id, name, price, category) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.category = category; // Association directe avec une instance de Category
    }

    displayInfo() {
        return `${this.name} - $${this.price} [Category: ${this.category.name}]`;
    }
}