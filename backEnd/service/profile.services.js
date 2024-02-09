import { query } from "../config/pool.js";
import profileQuery from "../query/profile.query.js";

const profileService = {
  getUserById: async (data) => {
    //console.log(data);
    const row = await query(profileQuery.getUserByIdQuery, [data]);
    return row;
  },
  addUserProfile: async (data) => {
    try {
      const row = await query(profileQuery.addUserProfileQuery, [
        data.userId,
        data.firstName,
        data.middleName,
        data.lastName,
      ]);
      return row;
    } catch (err) {
      console.log(err);
      return false;
    }
  },
  addUserAddress: async (data) => {
    const row = await query(profileQuery.addUserAddressQuery, [
      data.userId,
      data.districtId || null,
      ,
    ]);
    return row;
  },
  updateProfile: async (data) => {
    try {
      const row = await query(profileQuery.updateToProfileQuery, [
        data.firstName,
        data.middleName,
        data.lastName,
        parseInt(data.userId, 10),
      ]);
      return row;
    } catch (err) {
      console.log(err);
      return false;
    }
  },
  getSingleUserProfileInfo: async (data) => {
    try {
      const row = await query(profileQuery.getAllSingleUserInfo, [data]);
      return row;
    } catch (error) {
      console.log(error);
      return false;
    }
  },
};
export default profileService;
