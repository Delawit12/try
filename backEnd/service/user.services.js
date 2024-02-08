import { query } from "../config/pool.js";
import usersQuery from "../query/user.query.js";

const userService = {
  getUserByEmail: (userEmail) => {
    const rows = query(usersQuery.getUserByEmailQuery, [userEmail]);
    return rows;
  },
  getUserByPhone: (userPhone) => {
    const rows = query(usersQuery.getUserByPhone, [userPhone]);

    return rows;
  },
  addUserPassword: (data) => {
    const rows = query(usersQuery.insertUserPasswordTableQuery, [
      data.userId,
      data.userPassword,
    ]);
    return rows; // Add the return statement
  },
  registerUser: (data) => {
    const rows = query(usersQuery.insertUsersTableQuery, [
      data.userEmail,
      data.userPhone,
      data.OTP,
    ]);
    return rows;
  },
  getUserPasswordByUserId: (userId) => {
    const rows = query(usersQuery.getUserPasswordByUserIdQuery, [userId]);
    return rows;
  },
  getAllUsers: () => {
    const rows = query(usersQuery.getAllUsersQuery);
    return rows;
  },
  getlUserProfile: () => {
    const rows = query(usersQuery.getAllSingleUserInfo);
    return rows;
  },
};
export default userService;
