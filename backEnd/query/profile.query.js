export default {
  getUserByIdQuery: `select * from users where userId = ?`,
  addUserProfileQuery: `INSERT INTO usersProfile(userId, firstName, middleName, lastName)VALUES (?, ?, ?, ?);`,
  addUserAddressQuery: `INSERT INTO usersAddress (userId, districtId, createdDate)
    VALUES (?, ?, NOW());`,
  removeUserAddressQuery: `DELETE FROM usersAddress
    WHERE userId = ?;
    `,
  updateToProfileQuery: `UPDATE usersProfile SET firstName=?,middleName=?,lastName=? WHERE userId =?`,
  removeUserProfileQuery: `DELETE FROM usersProfile
  WHERE userId = ?;
  `,
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
