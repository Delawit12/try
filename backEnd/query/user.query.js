export default {
  getUserByEmailQuery: `SELECT * FROM users WHERE userEmail=? `,
  getUserByPhone: `SELECT * FROM users WHERE userPhone=?`,
  insertUsersTableQuery: `INSERT INTO users (userEmail, userPhone, createdDate, OTP, activeStatus)  VALUES (?, ?, NOW(),?, 1)`,
  insertUserPasswordTableQuery: `INSERT INTO usersPassword (userId,userPassword,createdDate) VALUES(?,?,NOW())`,
  getUserPasswordByUserIdQuery: `SELECT * FROM userPassword WHERE userId=?`,
  getAllUsersQuery: `SELECT
  users.userId,
  users.userEmail,
  users.userPhone,
  users.createdDate AS userCreatedDate,
  users.OTP,
  users.activeStatus,
  usersRole.userRoleId,
  companiesRole.companyRoleName,
  usersPassword.userPasswordId,
  usersPassword.userPassword,
  usersPassword.createdDate AS passwordCreatedDate,
  contactVerification.contactVerificationId,
  contactVerification.emailStatus,
  contactVerification.phoneStatus,
  usersProfile.userProfileId,
  usersProfile.firstName,
  usersProfile.middleName,
  usersProfile.lastName,
  usersProfile.createdDate AS profileCreatedDate,
  usersAddress.userAddressId,
  usersAddress.districtId,
  usersAddress.createdDate AS addressCreatedDate,
  usersPictures.userPictureId,
  usersPictures.imageUrl,
  usersPictures.createdDate AS pictureCreatedDate,
  usersPictures.pictureVisibility
FROM
  users
  LEFT JOIN usersRole ON users.userId = usersRole.userId
  LEFT JOIN companiesRole ON usersRole.companyRoleId = companiesRole.companyRoleId
  LEFT JOIN usersPassword ON users.userId = usersPassword.userId
  LEFT JOIN contactVerification ON users.userId = contactVerification.userId
  LEFT JOIN usersProfile ON users.userId = usersProfile.userId
  LEFT JOIN usersAddress ON users.userId = usersAddress.userId
  LEFT JOIN usersPictures ON users.userId = usersPictures.userId;`,
  getAllSingleUserInfo: `

    SELECT 
    JSON_OBJECT(
        'userInfo', JSON_OBJECT(
            'userId', u.userId,
            'userEmail', u.userEmail,
            'userPhone', u.userPhone,
            'companyRoleName', cr.companyRoleName
        ),
        'userProfile', JSON_OBJECT(
            'fname', up.firstName,
            'lname', up.lastName,
            'mname', up.middleName,
            'profilePicture', JSON_OBJECT(
                'imageUrl', upic.imageUrl,
                'pictureVisibility', upic.pictureVisibility
            )
        ),
        'userAddress', JSON_OBJECT(
            'country', c.countryName,
            'region', r.regionName,
            'city', ci.cityName,
            'subcity', sc.subcityName,
            'district', d.districtName
        ),
        'emailStatus', cv.emailStatus,
        'phoneStatus', cv.phoneStatus
    ) AS userInfo
FROM users u
LEFT JOIN usersRole ur ON u.userId = ur.userId
LEFT JOIN companiesRole cr ON ur.companyRoleId = cr.companyRoleId
LEFT JOIN usersProfile up ON u.userId = up.userId
LEFT JOIN usersAddress ua ON u.userId = ua.userId
LEFT JOIN districts d ON ua.districtId = d.districtId
LEFT JOIN subcities sc ON d.subcityId = sc.subcityId
LEFT JOIN cities ci ON sc.cityId = ci.cityId
LEFT JOIN regions r ON ci.regionId = r.regionId
LEFT JOIN countries c ON r.countryId = c.countryId
LEFT JOIN contactVerification cv ON u.userId = cv.userId
LEFT JOIN usersPictures upic ON u.userId = upic.userId
WHERE u.userId = ?;


                   `,
};
