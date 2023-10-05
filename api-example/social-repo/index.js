const app = require("./src/app.js");
const pool = require("./src/pool.js");

pool
  .connect({
    host: "localhost",
    port: 5432,
    database: "udemy-sql-socialnetwork",
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
  })
  .then(() => {
    app().listen(3000, () => {
      console.log("Listening on port 3000");
    });
  })
  .catch((err) => console.error(err));

// $env:DB_USER="" ; $env:DB_PASSWORD="" ; node .\index.js