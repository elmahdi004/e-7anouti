const express = require("express");
const fs = require("fs").promises;
const { Xslt, XmlParser } = require("xslt-processor");

const app = express();
const port = 3000;

// Middleware to serve static files
app.use(express.static("public"));

// Route to perform XSLT transformation
app.get("/products", async (req, res) => {
    try {
        // Read XML and XSLT files
        const xmlData = await fs.readFile("./data/xml/products.xml", "utf8");
        const xslData = await fs.readFile("./data/xslt/products.xsl", "utf8");

        // Initialize the Xslt and XmlParser classes
        const xslt = new Xslt();
        const xmlParser = new XmlParser();


        const outXmlString = await xslt.xsltProcess(
            xmlParser.xmlParse(xmlData),
            xmlParser.xmlParse(xslData)
        );
        // Send the transformed HTML to the client
        res.set("Content-Type", "text/html");
        res.send(outXmlString); // Transformed XML or HTML as string
    } catch (error) {
        console.error("Error during XSLT transformation:", error);
        res.status(500).send("An error occurred during XSLT transformation.");
    }
});

app.get('/products/:id', async (req, res) => {
    try {
        // Read XML and XSLT files
        const xmlData = await fs.readFile("./data/xml/products.xml", "utf8");
        const xslData = await fs.readFile("./data/xslt/product.xsl", "utf8");

        // Initialize the Xslt and XmlParser classes
        const options = {
            escape: false,
            selfClosingTags: true,
            parameters: [{ name:"productId",value: req.params.id }],
            outputMethod: 'xml'
          };

        const xslt = new Xslt(options);
        const xmlParser = new XmlParser();


        const outXmlString = await xslt.xsltProcess(
            xmlParser.xmlParse(xmlData),
            xmlParser.xmlParse(xslData)
        );
        // Send the transformed HTML to the client
        res.set("Content-Type", "text/html");
        res.send(outXmlString); // Transformed XML or HTML as string
    } catch (error) {
        console.error("Error during XSLT transformation:", error);
        res.status(500).send("An error occurred during XSLT transformation.");
    }
});

// Test route
app.get("/", (req, res) => {
    res.send("Welcome to the Express app using xslt-processor!");
});

// Start the server
app.listen(port, () => {
    console.log(`App is running at http://localhost:${port}`);
});
