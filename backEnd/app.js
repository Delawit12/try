import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import appRoute from "./route/index.js";
dotenv.config();

const port = 8888;
const host = "192.168.1.4";
// const port = process.env.SERVER_PORT;
// const host = process.env.SERVER_HOST;
// import install from "./config/install.js";
// install();
const server = express();

//Enable CORS middleware before setting up routes
const corsOptions = {
  origin: ["http://localhost:5173", "http://192.168.43.110:5173"],
  credentials: true,
};
server.use(cors(corsOptions));

//Middleware for parsing JSON and URL-encoded data
server.use(express.json());
server.use(express.urlencoded({ extended: true }));

server.use(appRoute);

server.get("/", (req, res) => {
  res.send("the server is running on the specified port");
});

server.get("/test", (req, res) => {
  res.send("test url");
});

server.listen(port, host, () => {
  console.log(`Server is running at http://${host}:${port}`);
});
