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
