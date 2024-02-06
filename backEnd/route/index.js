import express from "express";
const appRoute = express.Router();

// all routes
import userRout from "./user.route.js";

// adding to Middleware
appRoute.use(userRout);

export default appRoute;
