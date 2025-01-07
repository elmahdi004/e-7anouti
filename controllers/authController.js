function authenticate(username, password, callback) {
    fs.readFile(USERS_XML, (err, data) => {
      if (err) return callback(err);
  
      parser.parseString(data, (err, result) => {
        if (err) return callback(err);
        
        const users = result.users.user;
        const user = users.find(u => u.username[0] === username && u.password[0] === password);
  
        if (user) {
          callback(null, true);
        } else {
          callback(null, false);
        }
      });
    });
  }
  