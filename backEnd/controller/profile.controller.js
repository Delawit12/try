import profileService from "../service/profile.services.js";
const profileController = {
  addNewProfile: async (req, res) => {
    const { userId, firstName, middleName, lastName, country, region, city } =
      req.body;

    //check all the data provided
    if (
      !userId ||
      !firstName ||
      !middleName ||
      !lastName ||
      !country ||
      !region ||
      !city
    ) {
      return res.status(500).json({
        status: "false",
        message: "all fields are reqired",
      });
    }
    // check user exist
    const isUserExist = await profileService.getUserById(userId);
    if (!isUserExist) {
      return res.status(500).json({
        status: "false",
        message: "user does not exist",
      });
    }
    // insert user profile data
    const isProfileAdded = await profileService.addUserProfile(req.body);
    if (isProfileAdded) {
      const isUserAddressAdded = await profileService.addUserAddress(req.body);
      if (isUserAddressAdded) {
        return res.status(200).json({
          status: "true",
          message: "user profile added successfully ",
        });
      }
    }
  },
  getProfileInfo: async (req, res, next) => {
    const userId = req.body.userId;
    if (userId) {
      console.log(userId);
      const userData = await profileService.getSingleUserProfileInfo(userId);
      if (userData) {
        return res.status(200).json({
          status: true,
          data: userData,
        });
      }
    } else {
      res.status(500).json({
        status: false,
        message: "invalid taken 000",
      });
    }
  },
  updateProfile: async (req, res) => {
    const userId = req.params.userId;
    const { firstName, middleName, lastName, country, region, city } = req.body;
    //check all the data provided
    if (!firstName || !middleName || !lastName || !userId) {
      return res.status(500).json({
        status: "false",
        message: "all fields are reqired",
      });
    }
    // check user exist
    const isUserExist = await profileService.getUserById(userId);
    if (!isUserExist) {
      return res.status(500).json({
        status: "false",
        message: "user does not exist",
      });
    }
    // insert profile data
    //req.body.userId = userId;
    //console.log(req.body);
    // Update profile data
    try {
      const isProfileUpdated = await profileService.updateProfile({
        firstName,
        middleName,
        lastName,
        userId: parseInt(userId, 10),
      });

      if (isProfileUpdated) {
        return res.status(200).json({
          success: true,
          message: "Profile successfully updated",
        });
      } else {
        return res.status(500).json({
          success: false,
          message: "No rows were updated in the profile table",
        });
      }
    } catch (error) {
      console.log(error);
      return res.status(500).json({
        success: false,
        message: "Error updating profile",
      });
    }
  },
};
export default profileController;
