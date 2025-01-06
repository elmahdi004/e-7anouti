const express = require("express");
const fs = require("fs").promises;
const { Xslt, XmlParser } = require("xslt-processor");

const cookieParser = require('cookie-parser');

const app = express();
const port = 3000;

// Middleware to serve static files
app.use(express.static("public"));
app.use(cookieParser());


// the main page route
app.get("/", async (req, res) => {
            try {
            if(!req.cookies.lang){
                res.cookie("lang", "en", { maxAge: 365 * 24 * 60 * 60 * 1000 })
            }

        // Read XML and XSLT files
        const xmlData = await fs.readFile("./data/data.xml", "utf8");
        const xslData = await fs.readFile("./pages/main.xsl", "utf8");
        
        // Initialize the Xslt and XmlParser classes
        const options = {
            escape: false,
            selfClosingTags: true,
            parameters: [{ name:"lang",value: req.cookies.lang }],
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
// all products route

app.get("/products", async (req, res) => {
    try {
    if(!req.cookies.lang){
        res.cookie("lang", "en", { maxAge: 365 * 24 * 60 * 60 * 1000 })
    }

// Read XML and XSLT files
const xmlData = await fs.readFile("./data/data.xml", "utf8");
const xslData = await fs.readFile("./pages/products.xsl", "utf8");

// Initialize the Xslt and XmlParser classes
const options = {
    escape: false,
    selfClosingTags: true,
    parameters: [{ name:"lang",value: req.cookies.lang }],
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

// products by category 

app.get("/products/category/:catId", async (req, res) => {
    try {
    if(!req.cookies.lang){
        res.cookie("lang", "en", { maxAge: 365 * 24 * 60 * 60 * 1000 })
    }

// Read XML and XSLT files
const xmlData = await fs.readFile("./data/data.xml", "utf8");
const xslData = await fs.readFile("./pages/productsByCategorie.xsl", "utf8");
// Initialize the Xslt and XmlParser classes
const options = {
    escape: false,
    selfClosingTags: true,
    parameters: [{ name:"lang",value: req.cookies.lang },{ name:"catId",value: req.params.catId }],
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

// My cart route
app.get("/myCart", async (req, res) => {
    try {
    if(!req.cookies.lang){
        res.cookie("lang", "en", { maxAge: 365 * 24 * 60 * 60 * 1000 })
    }

// Read XML and XSLT files
const xmlData = await fs.readFile("./data/data.xml", "utf8");
const xslData = await fs.readFile("./pages/myCart.xsl", "utf8");

// Initialize the Xslt and XmlParser classes
const options = {
    escape: false,
    selfClosingTags: true,
    parameters: [{ name:"lang",value: req.cookies.lang }],
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

app.get("/admin", async (req, res) => {
    try {
    if(!req.cookies.lang){
        res.cookie("lang", "en", { maxAge: 365 * 24 * 60 * 60 * 1000 })
    }

// Read XML and XSLT files
const xmlData = await fs.readFile("./data/data.xml", "utf8");
const xslData = await fs.readFile("./pages/admin/index.xsl", "utf8");

// Initialize the Xslt and XmlParser classes
const options = {
    escape: false,
    selfClosingTags: true,
    parameters: [{ name:"lang",value: req.cookies.lang }],
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

// // Start the server 
app.listen(port, () => {
    console.log(`App is running at http://localhost:${port}`);
});
