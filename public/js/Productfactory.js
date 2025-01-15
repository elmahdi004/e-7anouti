class ProductFactory {
    static createProduct(id, name, price, categoryInstance) {
        return new Product(id, name, price, categoryInstance);
    }
}
