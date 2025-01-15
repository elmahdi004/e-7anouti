const fruitsCategory = new Category(1, 'Fruits');
const dairyCategory = new Category(2, 'Dairy');

const product1 = ProductFactory.createProduct(101, 'Apple', 1.5, fruitsCategory);
const product2 = ProductFactory.createProduct(102, 'Banana', 1.0, fruitsCategory);
const product3 = ProductFactory.createProduct(201, 'Milk', 2.5, dairyCategory);

console.log(product1.displayInfo()); // Apple - $1.5 [Category: Fruits]
console.log(product2.displayInfo()); // Banana - $1.0 [Category: Fruits]
console.log(product3.displayInfo()); // Milk - $2.5 [Category: Dairy]
