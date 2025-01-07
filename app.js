const express = require("express");
const multer = require("multer");
const path = require("path");

const libxmljs = require('libxmljs2');



const fs = require("fs").promises;
const { Xslt, XmlParser } = require("xslt-processor");

const cookieParser = require('cookie-parser');

const app = express();
const port = 3000;

// Set up multer to store uploaded files temporarily
const upload = multer({ dest: "./temp" });

// Middleware to serve static files
app.use(express.static("public"));
app.use(cookieParser());


// the main page route
app.get("/", async (req, res) => {
    try {
        if (!req.cookies.lang) {
            res.cookie("lang", "en", { maxAge: 365 * 24 * 60 * 60 * 1000 })
        }

        // Read XML and XSLT files
        const xmlData = await fs.readFile("./data/data.xml", "utf8");
        const xslData = await fs.readFile("./pages/main.xsl", "utf8");

        // Initialize the Xslt and XmlParser classes
        const options = {
            escape: false,
            selfClosingTags: true,
            parameters: [{ name: "lang", value: req.cookies.lang }],
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
        if (!req.cookies.lang) {
            res.cookie("lang", "en", { maxAge: 365 * 24 * 60 * 60 * 1000 })
        }

        // Read XML and XSLT files
        const xmlData = await fs.readFile("./data/data.xml", "utf8");
        const xslData = await fs.readFile("./pages/products.xsl", "utf8");

        // Initialize the Xslt and XmlParser classes
        const options = {
            escape: false,
            selfClosingTags: true,
            parameters: [{ name: "lang", value: req.cookies.lang }],
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
        if (!req.cookies.lang) {
            res.cookie("lang", "en", { maxAge: 365 * 24 * 60 * 60 * 1000 })
        }

        // Read XML and XSLT files
        const xmlData = await fs.readFile("./data/data.xml", "utf8");
        const xslData = await fs.readFile("./pages/productsByCategorie.xsl", "utf8");
        // Initialize the Xslt and XmlParser classes
        const options = {
            escape: false,
            selfClosingTags: true,
            parameters: [{ name: "lang", value: req.cookies.lang }, { name: "catId", value: req.params.catId }],
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
            parameters: [{ name: "productId", value: req.params.id }],
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


// Start the server
app.listen(port, () => {
    console.log(`App is running at http://localhost:${port}`);
});


//lang routes - html

// Route to display a form to upload an XML file
app.get("/langs", (req, res) => {
    res.send(`
        <form action="/langs" method="post" enctype="multipart/form-data">
            <label for="language">Select language:</label>
            <select name="language" required>
                <option value="cn">Chinese</option>
                <option value="es">Spanish</option>
                <option value="fr">French</option>
                <option value="de">German</option>
            </select><br/><br/>
            <input type="file" name="langFile" accept=".xml" required /><br/><br/>
            <button type="submit">Upload</button>
        </form>
    `);
});
// Route to handle uploaded XML file and append content to data.xml under <languages>

app.post("/langs", upload.single("langFile"), async (req, res) => {
    if (!req.file || !req.body.language) {
        return res.status(400).send("Language and file are required.");
    }

    const langCode = req.body.language;
    const filePath = req.file.path;
    const dataPath = path.join(__dirname, "./data/data.xml");

    try {
        // Read uploaded and existing XML files
        const uploadedContent = await fs.readFile(filePath, "utf8");
        const dataContent = await fs.readFile(dataPath, "utf8");

        // Remove XML header from uploaded content
        const cleanedUploadedContent = uploadedContent.replace(/<\?xml[^>]*\?>/, "").trim();

        // Check <lang> element with required attributes
        const langRegex = /<lang\s+code="([^"]+)"\s+title="([^"]+)"[^>]*>[\s\S]*?<\/lang>/;
        const langMatch = cleanedUploadedContent.match(langRegex);

        if (!langMatch) throw new Error("lang element n'a pas des attributes code ou title.");

        const extractedCode = langMatch[1];
        const extractedTitle = langMatch[2];

        if (extractedCode !== langCode) throw new Error(`Code pas valid: ${extractedCode} !== ${langCode}`);

        // Append <lang> to <languages> in data.xml
        const languagesRegex = /<languages>([\s\S]*?)<\/languages>/;
        const updatedData = dataContent.replace(languagesRegex, `<languages>$1\n${langMatch[0]}</languages>`);

        // Write updated data and delete temp file
        await fs.writeFile(dataPath, updatedData, "utf8");
        await fs.unlink(filePath);

        res.send(`Lang ${langCode} avec title "${extractedTitle}" ajoutee.`);
    } catch (err) {
        console.error("Error:", err);
        res.status(500).send(`Error: ${err.message}`);
    }
});
