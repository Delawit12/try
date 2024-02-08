-- Active: 1700814440885@@176.58.119.63@3306@huludeig_test
use huludeig_hulusample;

-- Insert data into Properties table
INSERT INTO properties (propertyName, createdDate) VALUES
    ('House', NOW()),
    ('Car', NOW()),
    ('Electronics', NOW());

-- Insert data into Houses table
INSERT INTO houses (propertyId, housePurpose) VALUES
    (1, 'Residence'),
    (1, 'Business Shop');

SELECT * from bedRoom;
-- Insert data into BedRoom table
INSERT INTO bedRoom (houseId, numbersOfBedRoom) VALUES
    (1, 'Studio'),
    (1, 'With one bed room'),
    (1, 'With two bed room'),
    (1, 'With three bed room'),
    (1, 'With four bed room'),
    (1, 'With five bed room');

-- Insert data into ResidenceHouses table
INSERT INTO residenceHouses (bedRoomId, houseType) VALUES
    (1, 'Condominium'),
    (2, 'Condominium'),
    (3, 'Condominium'),
    (4, 'Condominium'),
    (2, 'Apartment'),
    (3, 'Apartment'),
    (4, 'Apartment'),
    (5, 'Apartment'),
    (2, 'Union house'),
    (3, 'Union house'),
    (4, 'Union house'),
    (5, 'Union house'),
    (3, 'Villa'),
    (4, 'Villa'),
    (5, 'Villa'),
    (3, 'G+'),
    (4, 'G+'),
    (5, 'G+');

-- Insert data into GovernmentShare table
INSERT INTO governmentShare (residenceHouseId, governmentShare) VALUES
    (1, '20X80'),
    (1, '10X90'),
    (2, '40X60'),
    (2, '20X80'),
    (3, '40X60'),
    (3, '20X80'),
    (4, '40X60'),
    (4, '20X80')
    ;

-- Insert data into BusinessShoppe table
INSERT INTO businessShoppe (houseId, houseType) VALUES
    (2, 'Mall'),
    (2, 'Office'),
    (2, 'Lamera'),
    (2, 'Store');


