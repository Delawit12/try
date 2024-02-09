import express from "express";
const appRoute = express.Router();

// all routes
import userRout from "./user.route.js";
import profileRout from "./profile.route.js";

// adding to Middleware
appRoute.use(userRout);
appRoute.use(profileRout);

export default appRoute;
