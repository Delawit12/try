import userService from "../service/user.services.js";
import userUtility from "../utility/user.utility.js";
import bcrypt from "bcrypt";
const userController = {
  registerUser: async (req, res) => {
    const { userEmail, userPassword, userPhone } = req.body;
    console.log(req.body);
    // Check all fields
    if (!userEmail || !userPassword || !userPhone) {
      return res.status(400).json({
        success: false,
        message: "All fields are required",
      });
    }
    // Check if email is used before
    const isEmailExist = await userService.getUserByEmail(userEmail);
    // If there is an account related to this email
    if (isEmailExist.length) {
      //console.log(isEmailExist);
      return res.status(500).json({
        success: false,
        message: "Email is already used",
      });
    }
    const isPhoneExist = await userService.getUserByPhone(userPhone);
    // If there is an account related to this email
    if (isPhoneExist.length) {
      //console.log(isPhoneExist);
      return res.status(500).json({
        success: false,
        message: "Phone Number is already used",
      });
    } else {
      let userId;
      // Password encryption
      const saltRounds = 10; // Specify a number of rounds
      const salt = bcrypt.genSaltSync(saltRounds);
      req.body.userPassword = bcrypt.hashSync(userPassword, salt);
      //Generate OTP
      const OTP = userUtility.generateDigitOTP();
      req.body.OTP = OTP;

      const registerUser = await userService.registerUser(req.body);

      // Extract userId from the result
      userId = registerUser.insertId;
      req.body.userId = userId;

      // Send OTP by email
      userUtility.sendEmail(userEmail, OTP).then(async () => {
        // Inserting password into the database
        const isPaswordAdded = await userService.addUserPassword(req.body);
        if (isPaswordAdded) {
          res.status(200).json({
            success: true,
            message: "User created successfully",
          });
        }
      });
    }
  },
  // Confirm OTP
  confirmOTP: async (req, res) => {
    const { userEmail, OTP } = req.body;
    // Validate the request values
    if (!userEmail || !OTP) {
      return res.json({
        success: false,
        message: "All fields are required",
      });
    }

    // Check if the email exists
    const getOTP = await userService.getUserOTPByEmail(req.body);
    if (!getOTP.length) {
      return res.status(500).json({
        success: false,
        message: "OTP does not match",
      });
    } else {
      const data = {
        activeStatus: 2,
        userEmail: userEmail,
      };

      // Update the active status of the user
      const activated = await userService.updateActiveStatus(data);
      console.log(activated);
      if (activated) {
        return res.json({
          success: true,
          message: "OTP successfully confirmed",
        });
      }
    }
  },
  loginUser: async (req, res) => {
    const { userEmail, userPassword } = req.body;
    // Check if all fields are given
    if (!userEmail || !userPassword) {
      return res.json({
        success: false,
        message: "All fields are required",
      });
    }
    const isUserExist = await userService.getUserByEmail(userEmail);
    // If there is no account related to this email
    if (!isUserExist.length) {
      return res.status(500).json({
        success: false,
        message: "No account exists with this email",
      });
    }

    const userId = isUserExist[0].userId;
    const checkedUserPassword = await userService.getUserPasswordByUserId(
      userId
    );

    if (!checkedUserPassword) {
      return res.status(500).json({
        success: false,
        message: "Password does not exist",
      });
    }

    const dbPassword = checkedUserPassword[0].userPassword;
    const isMatch = bcrypt.compareSync(userPassword, dbPassword);

    if (!isMatch) {
      return res.status(500).json({
        success: false,
        message: "Incorrect password",
      });
    } else {
      const token = jwt.sign({ userId, userEmail }, process.env.JWT_SECRET);
      return res.status(200).json({
        token,
        userId,
        userEmail,
        success: true,
        message: "Login successfully",
      });
    }
  },
  getAllUsers: async (req, res) => {
    const response = await userService.getAllUsers();
    res.status(200).json({
      status: true,
      data: response,
    });
  },
  getUserProfile: async (req, res) => {
    const response = await userService.getlUserProfile();
    if (response.length) {
      res.status(200).json({
        status: true,
        data: response,
      });
    } else {
      res.status(500).json({
        status: false,
        message: "no user found",
      });
    }
  },
};
export default userController;
