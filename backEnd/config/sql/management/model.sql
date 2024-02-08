-- Active: 1697805377336@@127.0.0.1@3306@mydata

-- DROP DATABASE hulusample;

-- CREATE DATABASE hulusample;

-- Location modele

CREATE TABLE
    IF NOT EXISTS countries (
        countryId INT PRIMARY KEY AUTO_INCREMENT,
        countryName VARCHAR(50)
    );

CREATE TABLE
    IF NOT EXISTS regions (
        regionId INT PRIMARY KEY AUTO_INCREMENT,
        countryId INT,
        regionName VARCHAR(50),
        FOREIGN KEY (countryId) REFERENCES countries(countryId)
    );

CREATE TABLE
    IF NOT EXISTS zones (
        zoneId INT PRIMARY KEY AUTO_INCREMENT,
        regionId INT,
        zoneName VARCHAR(50),
        FOREIGN KEY (regionId) REFERENCES regions(regionId)
    );

CREATE TABLE
    IF NOT EXISTS cities (
        cityId INT PRIMARY KEY AUTO_INCREMENT,
        regionId INT,
        cityName VARCHAR(50),
        FOREIGN KEY (regionId) REFERENCES regions(regionId)
    );

CREATE TABLE
    IF NOT EXISTS subcity (
        subcityId INT PRIMARY KEY AUTO_INCREMENT,
        cityId INT,
        subcityName VARCHAR(50),
        FOREIGN KEY (cityId) REFERENCES cities(cityId)
    );

CREATE TABLE
    IF NOT EXISTS districts (
        districtId INT PRIMARY KEY AUTO_INCREMENT,
        subcityId INT,
        districtName VARCHAR(50),
        FOREIGN KEY (subcityId) REFERENCES subcity(subcityId)
    );

CREATE TABLE
    IF NOT EXISTS streets (
        streetId INT PRIMARY KEY AUTO_INCREMENT,
        subcityId INT,
        streetName VARCHAR(50),
        FOREIGN KEY (subcityId) REFERENCES subcity(subcityId)
    );

-- user model

CREATE TABLE
    IF NOT EXISTS companiesRole (
        companyRoleId INT PRIMARY KEY AUTO_INCREMENT,
        companyRoleName VARCHAR(50)
    );

CREATE TABLE
    IF NOT EXISTS users (
        userId INT PRIMARY KEY AUTO_INCREMENT,
        userEmail VARCHAR(50),
        userPhone VARCHAR(12),
        createdDate DATETIME,
        OTP VARCHAR(8),
        activeStatus BOOLEAN
    );

CREATE TABLE
    IF NOT EXISTS usersRole (
        userRoleId INT PRIMARY KEY AUTO_INCREMENT,
        userId INT,
        companyRoleId INT,
        FOREIGN KEY (userId) REFERENCES users(userId),
        FOREIGN KEY (companyRoleId) REFERENCES companiesRole(companyRoleId)
    );

CREATE TABLE
    IF NOT EXISTS usersPassword (
        userPasswordId INT PRIMARY KEY AUTO_INCREMENT,
        userId INT,
        userPassword VARCHAR(255),
        createdDate DATETIME,
        FOREIGN KEY (userId) REFERENCES users(userId)
    );

CREATE TABLE
    IF NOT EXISTS contactVerification (
        contactVerificationId INT PRIMARY KEY AUTO_INCREMENT,
        userId INT,
        emailStatus INT,
        phoneStatus INT,
        FOREIGN KEY (userId) REFERENCES users(userId)
    );

CREATE TABLE
    IF NOT EXISTS deletedUsers (
        deletedUserId INT PRIMARY KEY AUTO_INCREMENT,
        companyRoleId INT,
        userEmail VARCHAR(50),
        userPhone VARCHAR(12),
        lastPassword VARCHAR(255),
        dateOfRegistered DATETIME,
        dateOfDeleted DATETIME,
        firstName VARCHAR(50),
        middleName VARCHAR(50),
        lastName VARCHAR(50),
        lastImageUrl VARCHAR(50)
    );

--  profile  model

CREATE TABLE
    IF NOT EXISTS usersProfile (
        userProfileId INT PRIMARY KEY AUTO_INCREMENT,
        userId INT,
        firstName VARCHAR(50),
        middleName VARCHAR(50),
        lastName VARCHAR(50),
        createdDate DATETIME,
        FOREIGN KEY (userId) REFERENCES users(userId)
    );

CREATE TABLE
    IF NOT EXISTS usersAddress (
        userAddressId INT PRIMARY KEY AUTO_INCREMENT,
        userId INT,
        districtId INT,
        createdDate DATETIME,
        FOREIGN KEY (userId) REFERENCES users(userId),
        FOREIGN KEY (districtId) REFERENCES districts(districtId)
    );

CREATE TABLE
    IF NOT EXISTS profileImage (
        profileImageId INT PRIMARY KEY AUTO_INCREMENT,
        userId INT,
        imageUrl VARCHAR(255),
        FOREIGN KEY (userId) REFERENCES users(userId)
    );

-- property model

CREATE TABLE
    IF NOT EXISTS properties (
        propertyId INT PRIMARY KEY AUTO_INCREMENT,
        propertyName VARCHAR(50),
        createdDate DATE
    );

CREATE TABLE
    IF NOT EXISTS houses (
        houseId INT PRIMARY KEY AUTO_INCREMENT,
        propertyId INT,
        housePurpose VARCHAR(50),
        FOREIGN KEY (propertyId) REFERENCES properties(propertyId)
    );

CREATE TABLE
    IF NOT EXISTS residenceHouses (
        residenceHouseId INT PRIMARY KEY AUTO_INCREMENT,
        houseId INT,
        houseType VARCHAR(50),
        FOREIGN KEY (houseId) REFERENCES houses(houseId)
    );

CREATE TABLE
    IF NOT EXISTS businessShoppe (
        businessShoppeId INT PRIMARY KEY AUTO_INCREMENT,
        houseId INT,
        houseType VARCHAR(50),
        FOREIGN KEY (houseId) REFERENCES houses(houseId)
    );

CREATE TABLE
    IF NOT EXISTS bedRoom (
        bedRoomId INT PRIMARY KEY AUTO_INCREMENT,
        residenceHouseId INT,
        numbersOfBedRoom INT,
        FOREIGN KEY (residenceHouseId) REFERENCES residenceHouses(residenceHouseId)
    );

CREATE TABLE
    IF NOT EXISTS governmentShare (
        governmentShareId INT PRIMARY KEY AUTO_INCREMENT,
        governmentShare VARCHAR(255)
    );

-- message model

CREATE TABLE
    IF NOT EXISTS conversations (
        conversationId INT PRIMARY KEY AUTO_INCREMENT,
        userOneId INT,
        userTwoId INT,
        FOREIGN KEY (userOneId) REFERENCES users(userId),
        FOREIGN KEY (userTwoId) REFERENCES users(userId)
    );

CREATE TABLE
    IF NOT EXISTS messages (
        messageId INT PRIMARY KEY AUTO_INCREMENT,
        conversationId INT,
        senderId INT,
        createdDate DATETIME,
        seen BOOLEAN,
        FOREIGN KEY (conversationId) REFERENCES conversations(conversationId),
        FOREIGN KEY (senderId) REFERENCES users(userId)
    );

CREATE TABLE
    IF NOT EXISTS messageContent (
        messageContentId INT PRIMARY KEY AUTO_INCREMENT,
        messageId INT,
        messageText TEXT,
        FOREIGN KEY (messageId) REFERENCES messages(messageId)
    );

CREATE TABLE
    IF NOT EXISTS messageImages (
        messageImagesId INT PRIMARY KEY AUTO_INCREMENT,
        messageContentId INT,
        imageUrl VARCHAR(255),
        FOREIGN KEY (messageContentId) REFERENCES messageContent(messageContentId)
    );

-- post model

CREATE TABLE
    IF NOT EXISTS posts (
        postId INT PRIMARY KEY AUTO_INCREMENT,
        userId INT,
        purpose VARCHAR(255),
        propertyId INT,
        houseId INT,
        residenceHouseId INT,
        businessShoppeId INT,
        bedRoomId INT,
        governmentShareId INT,
        districtId INT,
        createDate DATETIME,
        FOREIGN KEY (userId) REFERENCES users(userId),
        FOREIGN KEY (propertyId) REFERENCES properties(propertyId),
        FOREIGN KEY (houseId) REFERENCES houses(houseId),
        FOREIGN KEY (residenceHouseId) REFERENCES residenceHouses(residenceHouseId),
        FOREIGN KEY (businessShoppeId) REFERENCES businessShoppe(businessShoppeId),
        FOREIGN KEY (bedRoomId) REFERENCES BedRoom(bedRoomId),
        FOREIGN KEY (governmentShareId) REFERENCES governmentShare(governmentShareId),
        FOREIGN KEY (districtId) REFERENCES districts(districtId)
    );

CREATE TABLE
    IF NOT EXISTS postPricings (
        postPricingId INT PRIMARY KEY AUTO_INCREMENT,
        postId INT,
        price DECIMAL(10, 2),
        initialPayment DECIMAL(10, 2),
        commotion VARCHAR(255),
        FOREIGN KEY (postId) REFERENCES posts(postId)
    );

CREATE TABLE
    IF NOT EXISTS postInfo (
        postInfoId INT PRIMARY KEY AUTO_INCREMENT,
        postId INT,
        kare VARCHAR(255),
        description TEXT,
        FOREIGN KEY (postId) REFERENCES posts(postId)
    );

CREATE TABLE
    IF NOT EXISTS postImages (
        postImageId INT PRIMARY KEY AUTO_INCREMENT,
        postId INT,
        imageUrl VARCHAR(255),
        FOREIGN KEY (postId) REFERENCES posts(postId)
    );

CREATE TABLE
    IF NOT EXISTS postRules (
        postRuleId INT PRIMARY KEY AUTO_INCREMENT,
        postId INT,
        rule TEXT,
        FOREIGN KEY (postId) REFERENCES posts(postId)
    );

CREATE TABLE
    IF NOT EXISTS postAdditionalInfo (
        postAdditionalInfoId INT PRIMARY KEY AUTO_INCREMENT,
        information TEXT
    );

-- notification model

CREATE TABLE
    IF NOT EXISTS notificationSet (
        notificationSetId INT PRIMARY KEY AUTO_INCREMENT,
        userId INT,
        priceRange DECIMAL(10, 2),
        district VARCHAR(255),
        propertyId INT,
        FOREIGN KEY (userId) REFERENCES users(userId),
        FOREIGN KEY (propertyId) REFERENCES properties(propertyId)
    );

CREATE TABLE
    IF NOT EXISTS notificationPermission (
        notificationPermissionId INT PRIMARY KEY AUTO_INCREMENT,
        canEmail BOOLEAN,
        canPopUp BOOLEAN,
        amountPerDay INT
    );

CREATE TABLE
    IF NOT EXISTS notification (
        notificationId INT PRIMARY KEY AUTO_INCREMENT,
        userId INT,
        postId INT,
        FOREIGN KEY (userId) REFERENCES users(userId),
        FOREIGN KEY (postId) REFERENCES posts(postId)
    );

--- package model

CREATE TABLE
    IF NOT EXISTS companyPostPackages (
        companyPostPackageId INT PRIMARY KEY AUTO_INCREMENT,
        postPackageName VARCHAR(255),
        duration INT,
        numbersOfPost INT,
        Price DECIMAL(10, 2)
    );

CREATE TABLE
    IF NOT EXISTS companyAdvertPackage (
        companyAdvertPackageId INT PRIMARY KEY AUTO_INCREMENT,
        advertPackageName VARCHAR(255),
        sitesAdvert VARCHAR(255),
        duration INT,
        price DECIMAL(10, 2)
    );

CREATE TABLE
    IF NOT EXISTS userPostPackages (
        userPostPackageId INT PRIMARY KEY AUTO_INCREMENT,
        companyPostPackageId INT,
        userId INT,
        paymentDate DATETIME,
        numbersOfPostCount INT,
        FOREIGN KEY (companyPostPackageId) REFERENCES companyPostPackages(companyPostPackageId),
        FOREIGN KEY (userId) REFERENCES users(userId)
    );

CREATE TABLE
    IF NOT EXISTS userAdvertPackage (
        userAdvertPackageId INT PRIMARY KEY AUTO_INCREMENT,
        companyAdvertPackageId INT,
        userId INT,
        paymentDate DATETIME,
        FOREIGN KEY (companyAdvertPackageId) REFERENCES companyAdvertPackage(companyAdvertPackageId),
        FOREIGN KEY (userId) REFERENCES Users(userId)
    );

-- fav model

CREATE TABLE
    IF NOT EXISTS favorites (
        favoritesId INT PRIMARY KEY AUTO_INCREMENT,
        postId INT,
        userId INT,
        FOREIGN KEY (postId) REFERENCES posts(postId),
        FOREIGN KEY (userId) REFERENCES users(userId)
    );

CREATE TABLE
    IF NOT EXISTS reports (
        reportId INT PRIMARY KEY AUTO_INCREMENT,
        postId INT,
        userId INT,
        description TEXT,
        createdDate DATETIME,
        FOREIGN KEY (postId) REFERENCES posts(postId),
        FOREIGN KEY (userId) REFERENCES users(userId)
    );

CREATE TABLE
    IF NOT EXISTS likes (
        likeId INT PRIMARY KEY AUTO_INCREMENT,
        postId INT,
        userId INT,
        value INT,
        createDate DATETIME,
        FOREIGN KEY (postId) REFERENCES posts(postId),
        FOREIGN KEY (userId) REFERENCES users(userId)
    );

CREATE TABLE
    IF NOT EXISTS comments (
        commentId INT PRIMARY KEY AUTO_INCREMENT,
        postId INT,
        userId INT,
        comment TEXT,
        createdDate DATETIME,
        FOREIGN KEY (postId) REFERENCES posts(postId),
        FOREIGN KEY (userId) REFERENCES users(userId)
    );

CREATE TABLE
    IF NOT EXISTS replays (
        replayId INT PRIMARY KEY AUTO_INCREMENT,
        commentId INT,
        userId INT,
        replay TEXT,
        createdDate DATETIME,
        FOREIGN KEY (commentId) REFERENCES comments(commentId),
        FOREIGN KEY (userId) REFERENCES users(userId)
    );

CREATE TABLE
    IF NOT EXISTS contactUs (
        contactUs INT PRIMARY KEY AUTO_INCREMENT,
        userEmail VARCHAR(50),
        fullName VARCHAR(50),
        subject VARCHAR(50),
        message TEXT
    );