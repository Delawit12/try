import mysql from "mysql2/promise";
import dotenv from "dotenv";
dotenv.config();
const host = "127.0.0.1";
const port = "3306";
const password = "1234";
const user = "root";
const database = "hulutest";

const pool = mysql.createPool({
  host,
  port,
  password,
  user,
  database,
  connectionLimit: 10,
});

async function query(sql, params) {
  const [rows, fields] = await pool.execute(sql, params);
  return rows;
}

export { query };
