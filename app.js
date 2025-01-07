const express = require("express");
const multer = require("multer");
const path = require("path");
const bodyParser = require('body-parser');


const libxmljs = require('libxmljs2');



const fs = require("fs").promises;
const { Xslt, XmlParser } = require("xslt-processor");

const cookieParser = require('cookie-parser');

const session = require('express-session');
const xml2js = require('xml2js');


const app = express();
const port = 3000;

app.use(session({
    secret: 'secret-key',
    resave: false,
    saveUninitialized: true,
  }));

  const parser = new xml2js.Parser();
  const builder = new xml2js.Builder();

// Set up multer to store uploaded files temporarily
const upload = multer({ dest: "./temp" });

// Middleware to serve static files
app.use(express.static("public"));
app.use(cookieParser());

app.use(bodyParser.urlencoded({ extended: true })); // For parsing application/x-www-form-urlencoded
app.use(bodyParser.json()); // For parsing application/json


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
        const xmlData = await fs.readFile("./data/data.xml", "utf8");
        const xslData = await fs.readFile("./pages/product.xsl", "utf8");

        // Initialize the Xslt and XmlParser classes
        const options = {
            escape: false,
            selfClosingTags: true,
            parameters: [{ name: "productId", value: req.params.id },{ name: "lang", value: req.cookies.lang }],
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
app.get("/myCart", isAuthenticatedMiddleware ,async (req, res) => {
    try {
    if(!req.cookies.lang){
        res.cookie("lang", "en", { maxAge: 365 * 24 * 60 * 60 * 1000 })
    }
    const authUser = req.session.user['$'].id ? req.session.user['$'].id : 0 ;

// Read XML and XSLT files
const xmlData = await fs.readFile("./data/data.xml", "utf8");
const xslData = await fs.readFile("./pages/myCart.xsl", "utf8");

// Initialize the Xslt and XmlParser classes
const options = {
    escape: false,
    selfClosingTags: true,
    parameters: [{ name:"lang",value: req.cookies.lang },{name:"authUser",value:authUser}],
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

app.get("/admin", isAuthenticatedMiddleware ,async (req, res) => {
    try {
    if(!req.cookies.lang){
        res.cookie("lang", "en", { maxAge: 365 * 24 * 60 * 60 * 1000 })
    }
const authUser = req.session.user['$'].id
const authRole = req.session.user['$'].role
// Read XML and XSLT files
const xmlData = await fs.readFile("./data/data.xml", "utf8");
const xslData = await fs.readFile("./pages/admin/index.xsl", "utf8");

// Initialize the Xslt and XmlParser classes
const options = {
    escape: false,
    selfClosingTags: true,
    parameters: [{ name:"lang",value: req.cookies.lang },{name:"authUser",value:authUser},{name:"authRole",value:authRole}],
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


app.get("/admin/products", isAuthenticatedMiddleware ,async (req, res) => {
    try {
    if(!req.cookies.lang){
        res.cookie("lang", "en", { maxAge: 365 * 24 * 60 * 60 * 1000 })
    }
const authUser = req.session.user['$'].id
const authRole = req.session.user['$'].role
// Read XML and XSLT files
const xmlData = await fs.readFile("./data/data.xml", "utf8");
const xslData = await fs.readFile("./pages/admin/products/index.xsl", "utf8");

// Initialize the Xslt and XmlParser classes
const options = {
    escape: false,
    selfClosingTags: true,
    parameters: [{ name:"lang",value: req.cookies.lang },{name:"authUser",value:authUser},{name:"authRole",value:authRole}],
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

app.get("/signup", async (req, res) => {
    try {
    if(!req.cookies.lang){
        res.cookie("lang", "en", { maxAge: 365 * 24 * 60 * 60 * 1000 })
    }

// Read XML and XSLT files
const xmlData = await fs.readFile("./data/data.xml", "utf8");
const xslData = await fs.readFile("./pages/signup.xsl", "utf8");

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

// Login route

app.get("/login", async (req, res) => {
    try {
    if(!req.cookies.lang){
        res.cookie("lang", "en", { maxAge: 365 * 24 * 60 * 60 * 1000 })
    }

// Read XML and XSLT files
const xmlData = await fs.readFile("./data/data.xml", "utf8");
const xslData = await fs.readFile("./pages/login.xsl", "utf8");

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


// login handle route "POST"

app.post("/login", async (req, res) => {

    if(!req.cookies.lang){
        res.cookie("lang", "en", { maxAge: 365 * 24 * 60 * 60 * 1000 })
    }



const xmlData = await fs.readFile("./data/data.xml", "utf8");
const xslData = await fs.readFile("./pages/login.xsl", "utf8");
const xslData_2 = await fs.readFile("./pages/main.xsl", "utf8");

const options = {
    escape: false,
    selfClosingTags: true,
    parameters: [{ name:"lang",value: req.cookies.lang }],
    outputMethod: 'xml'
  };
  const xslt = new Xslt(options);
  const xmlParser = new XmlParser();

const {email,password} = req.body;
authenticate(email, password, async (err, authenticated) => {
    if (authenticated) {
      req.session.user = authenticated;
      const outXmlString = await xslt.xsltProcess(
        xmlParser.xmlParse(xmlData),
        xmlParser.xmlParse(xslData_2)
    );
    res.set("Content-Type", "text/html");
    res.send(outXmlString); 
    
    } else {
        const outXmlString = await xslt.xsltProcess(
            xmlParser.xmlParse(xmlData),
            xmlParser.xmlParse(xslData)
        );
        res.set("Content-Type", "text/html");
        res.send(outXmlString);  
    }
  });


// Initialize the Xslt and XmlParser classes






});


app.get("/admin/orders", isAuthenticatedMiddleware ,async (req, res) => {
    try {
    if(!req.cookies.lang){
        res.cookie("lang", "en", { maxAge: 365 * 24 * 60 * 60 * 1000 })
    }
    const authUser = req.session.user['$'].id
    const authRole = req.session.user['$'].role
// Read XML and XSLT files
const xmlData = await fs.readFile("./data/data.xml", "utf8");
const xslData = await fs.readFile("./pages/admin/orders_client/index.xsl", "utf8");
// Initialize the Xslt and XmlParser classes
const options = {
    escape: false,
    selfClosingTags: true,
    parameters: [{ name:"lang",value: req.cookies.lang },{name:"authUser",value:authUser},{name:"authRole",value:authRole}],
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
app.get("/admin/m-orders", isAuthenticatedMiddleware ,async (req, res) => {
    try {
    if(!req.cookies.lang){
        res.cookie("lang", "en", { maxAge: 365 * 24 * 60 * 60 * 1000 })
    }
    const authUser = req.session.user['$'].id
    const authRole = req.session.user['$'].role
// Read XML and XSLT files
const xmlData = await fs.readFile("./data/data.xml", "utf8");
const xslData = await fs.readFile("./pages/admin/orders/index.xsl", "utf8");
// Initialize the Xslt and XmlParser classes
const options = {
    escape: false,
    selfClosingTags: true,
    parameters: [{ name:"lang",value: req.cookies.lang },{name:"authUser",value:authUser},{name:"authRole",value:authRole}],
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
app.get("/logout", isAuthenticatedMiddleware ,async (req, res) => {
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

// destroy the session

req.session.destroy();

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
// Get all users (Read)



// Middelware section 

function isAuthenticatedMiddleware(req, res, next) {
    if (req.session.user) {
      next();
    } else {
      res.redirect('/login');
    }
  }



async function authenticate(username, password, callback) {
    const dataXml = await fs.readFile("./data/data.xml", "utf8");
    parser.parseString(dataXml, (err, result) => {
        if (err) return callback(err);
        
        const users = result.Store.users[0].user;
        const user = users.find(u => u.email[0] === username && u.password[0] === password);
  
        if (user) {
            console.log("Has Been login");
          callback(null, user);
        } else {
            console.log("You have an error please try again");
          callback(null, false);
        }
      });
  }
