const pool = require("../pool");
const toCamelCase = require("./utils/to-camel-case");

class UserRepo {
  static async find() {
    const { rows } = await pool.query(`
      SELECT *
      FROM users;
    `);

    const parsedRows = toCamelCase(rows);

    return parsedRows;
  }

  static async findById() {}

  static async insert() {}

  static async update() {}

  static async delete() {}
}

module.exports = UserRepo;
