import userController from "../controller/user.controller.js";
import express from "express";

const userRout = express.Router();

userRout.post("/api/users/register", userController.registerUser);
userRout.post("/api/users/otpConfimation", userController.confirmOTP);
userRout.post("/api/users/login", userController.loginUser);
userRout.get("/api/all-users", userController.getAllUsers);
// userRout.get("/api/user/profile", auth, userController.getUserProfile);

export default userRout;
