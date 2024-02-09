import profileController from "../controller/profile.controller.js";
import express from "express";

const profileRout = express.Router();

profileRout.post("/api/profile/createProfile", profileController.addNewProfile);
profileRout.put(
  "/api/profile/updateProfile:userId",
  profileController.updateProfile
);
// profileRout.delete(
//   "/api/profile/removeProfile:userId",
//   profileController.removeProfile
// );
profileRout.get(
  "/api/profile/getSingleUserProfile",
  profileController.getProfileInfo
);
export default profileRout;
