-- Active: 1707382560683@@127.0.0.1@3306@hulutest

-- Create Countries Table

CREATE TABLE IF NOT EXISTS countries (
    countryId INT PRIMARY KEY AUTO_INCREMENT, countryName VARCHAR(255) NOT NULL
);

-- Create Regions Table

CREATE TABLE IF NOT EXISTS regions (
    regionId INT PRIMARY KEY AUTO_INCREMENT, countryId INT, regionName VARCHAR(255) NOT NULL, FOREIGN KEY (countryId) REFERENCES countries (countryId)
);

-- Create Zones Table

CREATE TABLE IF NOT EXISTS zones (
    zoneId INT PRIMARY KEY AUTO_INCREMENT, regionId INT, zoneName VARCHAR(255) NOT NULL, FOREIGN KEY (regionId) REFERENCES regions (regionId)
);

-- Create Cities Table

CREATE TABLE IF NOT EXISTS cities (
    cityId INT PRIMARY KEY AUTO_INCREMENT, regionId INT, cityName VARCHAR(255) NOT NULL, FOREIGN KEY (regionId) REFERENCES regions (regionId)
);

-- Create Subcities Table

CREATE TABLE IF NOT EXISTS subcities (
    subcityId INT PRIMARY KEY AUTO_INCREMENT, cityId INT, subcityName VARCHAR(255) NOT NULL, FOREIGN KEY (cityId) REFERENCES cities (cityId)
);

-- Create Districts Table

CREATE TABLE IF NOT EXISTS districts (
    districtId INT PRIMARY KEY AUTO_INCREMENT, subcityId INT, districtName VARCHAR(255) NOT NULL, FOREIGN KEY (subcityId) REFERENCES subcities (subcityId)
);

-- Create Streets Table

CREATE TABLE IF NOT EXISTS streets (
    streetId INT PRIMARY KEY AUTO_INCREMENT, districtId INT, streetName VARCHAR(255) NOT NULL, FOREIGN KEY (districtId) REFERENCES districts (districtId)
);

-- Create Users Table

CREATE TABLE IF NOT EXISTS users (
    userId INT PRIMARY KEY AUTO_INCREMENT, userEmail VARCHAR(255) NOT NULL, userPhone VARCHAR(255), createdDate DATETIME, OTP VARCHAR(255), activeStatus BOOLEAN
);

-- Create CompaniesRole Table

CREATE TABLE IF NOT EXISTS companiesRole (
    companyRoleId INT PRIMARY KEY AUTO_INCREMENT, companyRoleName VARCHAR(255) NOT NULL
);

-- Create UsersRole Table

CREATE TABLE IF NOT EXISTS usersRole (
    userRoleId INT PRIMARY KEY AUTO_INCREMENT, userId INT, companyRoleId INT, FOREIGN KEY (userId) REFERENCES users (userId), FOREIGN KEY (companyRoleId) REFERENCES companiesRole (companyRoleId)
);

-- Create UsersPassword Table

CREATE TABLE IF NOT EXISTS usersPassword (
    userPasswordId INT PRIMARY KEY AUTO_INCREMENT, userId INT, userPassword VARCHAR(255), createdDate DATETIME, FOREIGN KEY (userId) REFERENCES users (userId)
);

-- Create ContactVerification Table

CREATE TABLE IF NOT EXISTS contactVerification (
    contactVerificationId INT PRIMARY KEY AUTO_INCREMENT, userId INT, emailStatus BOOLEAN, phoneStatus BOOLEAN, FOREIGN KEY (userId) REFERENCES users (userId)
);

-- Create DeletedUsers Table

CREATE TABLE IF NOT EXISTS deletedUsers (
    deletedUserId INT PRIMARY KEY AUTO_INCREMENT, companyRoleId INT, userEmail VARCHAR(255), userPhone VARCHAR(255), lastPassword VARCHAR(255), dateOfRegistered DATETIME, dateOfDeleted DATETIME, firstName VARCHAR(255), middleName VARCHAR(255), lastName VARCHAR(255), lastImageUrl VARCHAR(255)
);

-- Create UsersProfile Table

CREATE TABLE IF NOT EXISTS usersProfile (
    userProfileId INT PRIMARY KEY AUTO_INCREMENT, userId INT, firstName VARCHAR(255), middleName VARCHAR(255), lastName VARCHAR(255), createdDate DATETIME, FOREIGN KEY (userId) REFERENCES users (userId)
);

-- Create UsersAddress Table

CREATE TABLE IF NOT EXISTS usersAddress (
    userAddressId INT PRIMARY KEY AUTO_INCREMENT, userId INT, districtId INT, createdDate DATETIME, FOREIGN KEY (userId) REFERENCES users (userId), FOREIGN KEY (districtId) REFERENCES districts (districtId)
);

-- Create UsersPictures Table

CREATE TABLE IF NOT EXISTS usersPictures (
    userPictureId INT PRIMARY KEY AUTO_INCREMENT, userId INT, imageUrl VARCHAR(255), createdDate DATETIME, pictureVisibility BOOLEAN, FOREIGN KEY (userId) REFERENCES users (userId)
);

-- Create Properties Table

CREATE TABLE IF NOT EXISTS properties (
    propertyId INT PRIMARY KEY AUTO_INCREMENT, propertyName VARCHAR(255), createdDate DATETIME
);

-- Create Houses Table

CREATE TABLE IF NOT EXISTS houses (
    houseId INT PRIMARY KEY AUTO_INCREMENT, propertyId INT, housePurpose VARCHAR(255), FOREIGN KEY (propertyId) REFERENCES properties (propertyId)
);

-- Create BedRoom Table

CREATE TABLE IF NOT EXISTS bedRoom (
    bedRoomId INT PRIMARY KEY AUTO_INCREMENT, houseId INT, numbersOfBedRoom VARCHAR(255), FOREIGN KEY (houseId) REFERENCES houses (houseId)
);

-- Create ResidenceHouses Table

CREATE TABLE IF NOT EXISTS residenceHouses (
    residenceHouseId INT PRIMARY KEY AUTO_INCREMENT, bedRoomId INT, houseType VARCHAR(255), FOREIGN KEY (bedRoomId) REFERENCES bedRoom (bedRoomId)
);

-- Create GovernmentShare Table

CREATE TABLE IF NOT EXISTS governmentShare (
    governmentShareId INT PRIMARY KEY AUTO_INCREMENT, residenceHouseId INT, governmentShare VARCHAR(255), FOREIGN KEY (residenceHouseId) REFERENCES residenceHouses (residenceHouseId)
);

-- Create BusinessShoppe Table

CREATE TABLE IF NOT EXISTS businessShoppe (
    businessShoppeId INT PRIMARY KEY AUTO_INCREMENT, houseId INT, houseType VARCHAR(255), FOREIGN KEY (houseId) REFERENCES houses (houseId)
);

-- Create Conversations Table

CREATE TABLE IF NOT EXISTS conversations (
    conversationId INT PRIMARY KEY AUTO_INCREMENT, userOneId INT, userTwoId INT, FOREIGN KEY (userOneId) REFERENCES users (userId), FOREIGN KEY (userTwoId) REFERENCES users (userId)
);

-- Create Messages Table

CREATE TABLE IF NOT EXISTS messages (
    messageId INT PRIMARY KEY AUTO_INCREMENT, conversationId INT, senderId INT, createdDate DATETIME, seen BOOLEAN, FOREIGN KEY (conversationId) REFERENCES conversations (conversationId)
);

-- Create Message Content Table

CREATE TABLE IF NOT EXISTS messageContent (
    messageContentId INT PRIMARY KEY AUTO_INCREMENT, messageId INT, messageText VARCHAR(255), FOREIGN KEY (messageId) REFERENCES messages (messageId)
);

-- Create MessageImages Table

CREATE TABLE IF NOT EXISTS messageImages (
    messageImagesId INT PRIMARY KEY AUTO_INCREMENT, messageContentId INT, imageUrl VARCHAR(255), FOREIGN KEY (messageContentId) REFERENCES messageContent (messageContentId)
);

-- Create Posts Table

CREATE TABLE IF NOT EXISTS posts (
    postId INT PRIMARY KEY AUTO_INCREMENT, userId INT, propertyId INT, houseId INT, residenceHouseId INT, businessShoppeId INT, bedRoomId INT, governmentShareId INT, districtId INT, streetId INT, createDate DATETIME, FOREIGN KEY (userId) REFERENCES users (userId), FOREIGN KEY (propertyId) REFERENCES properties (propertyId), FOREIGN KEY (houseId) REFERENCES houses (houseId), FOREIGN KEY (residenceHouseId) REFERENCES residenceHouses (residenceHouseId), FOREIGN KEY (businessShoppeId) REFERENCES businessShoppe (businessShoppeId), FOREIGN KEY (bedRoomId) REFERENCES bedRoom (bedRoomId), FOREIGN KEY (governmentShareId) REFERENCES governmentShare (governmentShareId), FOREIGN KEY (districtId) REFERENCES districts (districtId), FOREIGN KEY (streetId) REFERENCES streets (streetId)
);

-- Create PostPricings Table

CREATE TABLE IF NOT EXISTS postPricings (
    postPricingId INT PRIMARY KEY AUTO_INCREMENT, postId INT, price DECIMAL(10, 2), initialPayment DECIMAL(10, 2), isCommissioned BOOLEAN, commission DECIMAL(10, 2), FOREIGN KEY (postId) REFERENCES posts (postId)
);

-- Create PostInfo Table

CREATE TABLE IF NOT EXISTS postInfo (
    postInfoId INT PRIMARY KEY AUTO_INCREMENT, postId INT, kare VARCHAR(255), purpose VARCHAR(255), description TEXT, FOREIGN KEY (postId) REFERENCES posts (postId)
);

-- Create PostImages Table

CREATE TABLE IF NOT EXISTS postImages (
    postImageId INT PRIMARY KEY AUTO_INCREMENT, postId INT, imageUrl VARCHAR(255), FOREIGN KEY (postId) REFERENCES posts (postId)
);

-- Create PostRules Table

CREATE TABLE IF NOT EXISTS postRules (
    postRuleId INT PRIMARY KEY AUTO_INCREMENT, postId INT, rule TEXT, FOREIGN KEY (postId) REFERENCES posts (postId)
);

-- Create PostAdditionalInfo Table

CREATE TABLE IF NOT EXISTS postAdditionalInfo (
    postAdditionalInfoId INT PRIMARY KEY AUTO_INCREMENT, postId INT, information TEXT, FOREIGN KEY (postId) REFERENCES posts (postId)
);

-- Create Favorites Table

CREATE TABLE IF NOT EXISTS favorites (
    favoritesId INT PRIMARY KEY AUTO_INCREMENT, postId INT, userId INT, FOREIGN KEY (postId) REFERENCES posts (postId), FOREIGN KEY (userId) REFERENCES users (userId)
);

-- Create Reports Table

CREATE TABLE IF NOT EXISTS reports (
    reportId INT PRIMARY KEY AUTO_INCREMENT, postId INT, userId INT, description TEXT, createdDate DATETIME, FOREIGN KEY (postId) REFERENCES posts (postId), FOREIGN KEY (userId) REFERENCES users (userId)
);

-- Create Likes Table

CREATE TABLE IF NOT EXISTS likes (
    likeId INT PRIMARY KEY AUTO_INCREMENT, postId INT, userId INT, value INT, createDate DATETIME, FOREIGN KEY (postId) REFERENCES posts (postId), FOREIGN KEY (userId) REFERENCES users (userId)
);

-- Create Comments Table

CREATE TABLE IF NOT EXISTS comments (
    commentId INT PRIMARY KEY AUTO_INCREMENT, postId INT, userId INT, comment TEXT, createdDate DATETIME, FOREIGN KEY (postId) REFERENCES posts (postId), FOREIGN KEY (userId) REFERENCES users (userId)
);

-- Create Replays Table

CREATE TABLE IF NOT EXISTS replays (
    replayId INT PRIMARY KEY AUTO_INCREMENT, commentId INT, userId INT, replay TEXT, createdDate DATETIME, FOREIGN KEY (commentId) REFERENCES comments (commentId), FOREIGN KEY (userId) REFERENCES users (userId)
);

-- Create NotificationSet Table

CREATE TABLE IF NOT EXISTS notificationSet (
    notificationSetId INT PRIMARY KEY AUTO_INCREMENT, userId INT, priceRange DECIMAL(10, 2), district VARCHAR(255), propertyId INT, FOREIGN KEY (userId) REFERENCES users (userId), FOREIGN KEY (propertyId) REFERENCES properties (propertyId)
);

-- Create NotificationPermission Table

CREATE TABLE IF NOT EXISTS notificationPermission (
    notificationPermissionId INT PRIMARY KEY AUTO_INCREMENT, canEmail BOOLEAN, canPopUp BOOLEAN, amountPerDay INT
);

-- Create Notification Table

CREATE TABLE IF NOT EXISTS notification (
    notificationId INT PRIMARY KEY AUTO_INCREMENT, userId INT, postId INT, FOREIGN KEY (userId) REFERENCES users (userId), FOREIGN KEY (postId) REFERENCES posts (postId)
);

-- Create CompanyPostPackages Table

CREATE TABLE IF NOT EXISTS companyPostPackages (
    companyPostPackageId INT PRIMARY KEY AUTO_INCREMENT, postPackageName VARCHAR(255), duration INT, numbersOfPost INT, Price DECIMAL(10, 2)
);

-- Create CompanyAdvertPackage Table

CREATE TABLE IF NOT EXISTS companyAdvertPackage (
    companyAdvertPackageId INT PRIMARY KEY AUTO_INCREMENT, advertPackageName VARCHAR(255), sitesAdvert VARCHAR(255), duration INT, Price DECIMAL(10, 2)
);

-- Create UserPostPackages Table

CREATE TABLE IF NOT EXISTS userPostPackages (
    userPostPackageId INT PRIMARY KEY AUTO_INCREMENT, companyPostPackageId INT, userId INT, paymentDate DATETIME, numbersOfPostCount INT, FOREIGN KEY (companyPostPackageId) REFERENCES companyPostPackages (companyPostPackageId), FOREIGN KEY (userId) REFERENCES users (userId)
);

-- Create UserAdvertPackage Table

CREATE TABLE IF NOT EXISTS userAdvertPackage (
    userAdvertPackageId INT PRIMARY KEY AUTO_INCREMENT, companyAdvertPackageId INT, userId INT, paymentDate DATETIME, FOREIGN KEY (companyAdvertPackageId) REFERENCES companyAdvertPackage (companyAdvertPackageId), FOREIGN KEY (userId) REFERENCES users (userId)
);

-- Create Advert Table

CREATE TABLE IF NOT EXISTS advert (
    advertId INT PRIMARY KEY AUTO_INCREMENT, userAdvertPackageId INT, FOREIGN KEY (userAdvertPackageId) REFERENCES userAdvertPackage (userAdvertPackageId)
);

-- Create Payment Table

CREATE TABLE IF NOT EXISTS payment (
    paymentId INT PRIMARY KEY AUTO_INCREMENT, userId INT, paymentDate DATETIME, amount DECIMAL(10, 2), FOREIGN KEY (userId) REFERENCES users (userId)
);

-- give me sql query that extract this object using list conversationId and userId(usersTable)
-- ""
-- {
--     conversationId
--     userId(usersTable)
--     anotheruser{
--         userId(usersTable),
--         imageUrl(usersPicturesTable),
--         fname,lname,mane(usersProfileTable),
--     }
--    messages {
--          messageText(messageContent),
--         createdDate,
--         senderId,
--          seen
--          imageUrl (messageImages),
--     }
-- }
--
-- {SELECT
-- c.conversationId,
-- c.userId AS conversationUserId,
-- u.userId AS anotherUserId,
-- up.imageUrl AS anotherUserImageUrl,
-- up.fname AS anotherUserFirstName,
-- up.lname AS anotherUserLastName,
-- up.mane AS anotherUserMane,
-- m.messageText AS messageText,
-- m.createdDate AS messageCreatedDate,
-- m.senderId AS messageSenderId,
-- m.seen AS messageSeen,
-- mi.imageUrl AS messageImageUrl
-- FROM
--     conversationsTable c
--     JOIN usersTable u ON c.userId = u.userId
--     JOIN usersProfileTable up ON u.userId = up.userId
--     LEFT JOIN messagesTable m ON c.conversationId = m.conversationId
--     LEFT JOIN messageImagesTable mi ON m.messageId = mi.messageId
-- WHERE
--     c.conversationId IN (list_of_conversationIds) -- Replace with actual list of conversationIds
--     AND u.userId = 'specific_userId';}
-- -- Replace with the specific userId