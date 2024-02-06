import express from "express";
import dotenv from "dotenv";
import appRoute from "./route/index.js";
dotenv.config();

const port = process.env.SERVER_PORT;
const host = process.env.SERVER_HOST;
const server = express();
server.use(appRoute);

server.get("/", (req, res) => {
  res.send("kkkkkk");
});

server.get("/test", (req, res) => {
  res.send("test url");
});

server.listen(port, host, () => {
  console.log(`Server is running at http://${host}:${port}`);
});
