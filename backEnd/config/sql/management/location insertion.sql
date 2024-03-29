-- Active: 1700814440885@@176.58.119.63@3306@huludeig_test

------------------ Location Management ------------------------
SHOW TABLEs;

INSERT INTO countries ( countryName) VALUES ('ኢትዮጵያ');
SELECT * FROM  countries ;
-- Insert regions
INSERT INTO regions (regionName, countryId) VALUES
('አዲስ አበባ', 1),
('ድሬዳዋ', 1),
('ኦሮሚያ', 1),
('ደቡብ', 1),
('ሲዳማ', 1),
('ትግራይ', 1),
('አማራ', 1),
('ሐረሪ', 1),
('አፋር', 1),
('ቤንሻንጉል ጉሙዝ', 1),
('ጋምቤላ', 1),
('ሶማሌ', 1);
 
-- Insert cities
INSERT INTO cities (cityName , regionId) VALUES
    ('አዲስ አበባ', 1),
    ('ድሬዳዋ', 2),
    ('አዳማ', 3),
    ('ጅማ', 3),
    ('ነቀምት', 3),
    ('ቢሾፍቱ', 3),
    ('አምቦ', 3),
    ('ሻሸመኔ', 3),
    ('ሐረር', 3),
    ('ወልሶ', 3),
    ('ሞጆ', 3),
    ('አርባ ምንጭ', 4),
    ('ዲላ', 4),
    ('ወላይታ ሶዶ', 4),
    ('ጅንካ', 4),
    ('ሆሳና', 4),
    ('ሶዶ', 4),
    ('ሚዛን ተፈሪ', 4),
    ('ሀዋሳ', 5),
    ('ይርጋ አለም', 5),
    ('መቀሌ', 6),
    ('አክሱም', 6),
    ('አዲግራት', 6),
    ('ሽረ', 6),
    ('ዓድዋ', 6),
    ('ሁመራ', 6),
    ('ውቅሮ', 6),
    ('አክሱም', 6),
    ('ማይጨው', 6),
    ('አብይ አዲ', 6),
    ('ባህር ዳር', 7),
    ('ጎንደር', 7),
    ('ደብረ ማርቆስ', 7),
    ('ደብረ ታቦር', 7),
    ('ወልድያ', 7),
    ('ባቲ', 7),
    ('ኮምቦልቻ', 7),
    ('ደብረ ብርሃን', 8),
    ('ደሴ', 7),
    ('ደብረ በርሃን', 7);

INSERT INTO subcities (subcityName, cityId)
VALUES
('አዲስ ከተማ', 1), ('አቃቂ ካሊቲ', 2), ('አራዳ', 1), ('ቦሌ', 1), ('ጉሌሌ', 1), ('ቂርቆስ', 1), ('ኮልፈ ከራንዮ', 1),
('ልደታ', 1), ('ንፋስ ስልቅ-ላፍቶ', 1), ('የካ', 1);


INSERT INTO districts (subcityId, districtName)
VALUES
    (1, 'ኣምናውኤራ'),
    (1, 'ኣሜሪካን ጂቢ'),
    (1, 'ችድ ተራ'),
    (1, 'ዶሮ ተራ'),
    (1, 'ኮሬች ተራ'),
    (1, 'መሶብ ተራ'),
    (1, 'ሚናልሽ ተራ'),
    (1, 'አስራሰመንት'),
    (1, 'አውቶቡስ ተራ'),
    (1, 'ቦምብ ተራ'),
    (1, 'ቺድ ተራ'),
    (1, 'ዲስትሪክት 3'),
    (1, 'ዱባይ ተራ'),
    (1, 'ፈራሽ ተራ'),
    (1, 'ጎማ ተራ'),
    (1, 'ሀደሬ ሰፈር'),
    (1, 'ኮልፈ ጢዋን'),
    (1, 'መንገል ሰፈር'),
    (1, 'መናለሽ'),
    (1, 'ሞሊቲሪ ተራ'),
    (1, 'ቅድስም፡ሳቲን ተራ'),
    (1, 'ስሚያዓ'),
    (1, 'ሰበሬንዓ'),
    (1, 'ስሃን ተራ'),
    (1, 'ስሓን ተራ'),
    (1, 'ሻንታ ተራ'),
    (1, 'ሸክላ ተራ'),
    (1, 'ሸመንት፡ሳቲን'),
    (1, 'ሴባተኛ'),
    (1, 'ስሃን ተራ'),
    (1, 'ስሃን ተራ'),
    (1, 'ሸዓትኛ'),
    (1, 'ሸሀንጠማ'),
    (1, 'ሸማ ተራ'),
    (1, 'ውሪክ ጥዋራ');

INSERT INTO districts (subcityId, districtName)
VALUES
    (2, 'አዲስ'),
    (2, 'አካኪ ቦታ'),
    (2, 'አካኪ በሰቃ'),
    (2, 'አካኪ ካሊቲ'),
    (2, 'ኬበና'),
    (2, 'ገላን ቦታ'),
    (2, 'ሳሪስ'),
    (2, 'ሳሪስ አቦ አሪያ'),
    (2, 'ሴልባን'),
    (2, 'ቱግ ከበና'),
    (2, 'ቱሉ ዲሚቱ');

INSERT INTO districts (subcityId, districtName)
VALUES
    (3, 'አባቆራን ሰፈር'),
    (3, 'አምበሞራ'),
    (3, 'አምስት ኪሎ'),
    (3, 'አራት ኪሎ'),
    (3, 'አሮጌ ከራ'),
    (3, 'ኣትካሌት ተራ'),
    (3, 'ቢዓስ መበራት'),
    (3, 'ዶሮ መአንኪያ'),
    (3, 'እንቁላርፋቅቤራ'),
    (3, 'ኤሪ በከንቱ'),
    (3, 'ገዳም ሰፈር'),
    (3, 'ጊዮርግስ'),
    (3, 'ሀብተ ጊዮርግስ'),
    (3, 'ፓዚያ'),
    (3, 'ፖስታ ቤት'),
    (3, 'ራስ መከንነ ድልዲ'),
    (3, 'ሰባራ ባቡር'),
    (3, 'ሾላ'),
    (3, 'ሱማሊ ተራ'),
    (3, 'ጥልያን ሰፈር'),
    (3, 'ቃማር'),
    (3, 'ትልነና ሰፈር'),
    (3, 'ውቤ በርሀ'),
    (3, 'ይውናስ');

INSERT INTO districts (subcityId, districtName)
VALUES
    (4, 'ቦሌ አራብሳ'),
    (4, 'አያት ኮንዶሚኒዮም'),
    (4, 'አያት ዞን 2'),
    (4, 'አያት ዞን 3'),
    (4, 'አያት ዞን 5'),
    (4, 'ብሎክለ፡ሜንስ  ተራ'),
    (4, 'ብሎክለ፡ሜንስ  ተራ'),
    (4, 'ከፍዬ ኮንዶሚኒዮም'),
    (4, 'ፎሪንትስቶን፡ሆምስ ኮንዶሚኒዮም'),
    (4, 'ጅካሪዎስ ኮንዶሚኒዮም'),
    (4, 'ናታን ፌሌኬ ኪብሬት'),
    (4, 'ኖኣ፡ሪያል፡ኢስቴቲቬ፡11'),
    (4, 'ቦሌ ሌሚ፡ኢንዞሴትሪዎክ'),
    (4, 'ቦሌ፡ሚካኤል'),
    (4, 'ጌርጂ'),
    (4, 'ግዋሳ'),
    (4, 'ግልፍላን፡ስታሪም'),
    (4, 'ኮተቤ'),
    (4, 'ኮተቤ፡ሸት'),
    (4, 'ግሊፍላን፡ስጠል'),
    (4, 'ኮተቤ፡ሸት'),
    (4, 'ግሊፍላን፡ሸት'),
    (4, 'እየቃ'),
    (4, 'ግሊፍላን፡ቅሬ');

INSERT INTO districts (subcityId, districtName)
VALUES
    (6, 'ባንቲቢከቱ'),
    (6, 'በግታ'),
    (6, 'በሀራዊ'),
    (6, 'በክሎቤት'),
    (6, 'ቡልጋሪያ፡ስፈር'),
    (6, 'እንደራሴ'),
    (6, 'ጎተራ'),
    (6, 'ካሳንችስ'),
    (6, 'ከራ'),
    (6, 'ላንቻ'),
    (6, 'ልገሃር'),
    (6, 'ምናህሪያ፡ካሳንችስ'),
    (6, 'ሜሻሎኪያ'),
    (6, 'መስቅል፡ፍለዌ'),
    (6, 'መስከል፡ምሺያል'),
    (6, 'ምስቪሎኪያ'),
    (6, 'ኦላምፓ'),
    (6, 'ሪቺ'),
    (6, 'ሳራቤት'),
    (6, 'ወሎ፡ስፈር');

INSERT INTO districts (subcityId, districtName)
VALUES
    (7, 'ጅሞ 2'),
    (7, 'ሚኪይ አየላንድ ኮንዶ ሲት'),
    (7, 'ረፒ ዩፕር'),
    (7, 'አዲን ልቤሃቂ'),
    (7, 'አስቆ አሬአ'),
    (7, 'አስቆ፡ቤረቸኮ፡ፋበሪካ፡አሪያ'),
    (7, 'አሰራ፡ቴና'),
    (7, 'አየር፡ቴና'),
    (7, 'ገብረ፡ክርስቶስ፡ቤተ፡ኪርስትይዓ'),
    (7, 'ኮልፈ፡ከራንዮ'),
    (7, 'ኮሽም'),
    (7, 'ኩርቱመ፡ስትሪም'),
    (7, 'ከሺም'),
    (7, 'ከሺም'),
    (7, 'ከሩቱም፡ስትሪም'),
    (7, 'ሥትናዝሙዐንተ፡ማዚሩያ(ቶታል)'),
    (7, 'ዘነበወርቆ፡አሰራ፡ሰመንት፡ማዚሩያ(አስራ፡ስመንት)');

INSERT INTO districts (subcityId, districtName)
VALUES
    (8, 'አብነት ስታቅ'),
    (8, 'አጉስታ'),
    (8, 'በርበረ፡በሬንዳ'),
    (8, 'ችድ፡ጠራ'),
    (8, 'ኮካ'),
    (8, 'ዳርመር'),
    (8, 'ጌያ፡ስፈር'),
    (8, 'ጎታም'),
    (8, 'ካሳንቺስ'),
    (8, 'ከራ'),
    (8, 'ልንቻ'),
    (8, 'ለገሀር'),
    (8, 'ሜካሬሜዳ'),
    (8, 'መቸራሜዳ'),
    (8, 'ሞቢርዝ'),
    (8, 'ሲንጋትራ'),
    (8, 'ቴክል፡ሀይማኖት'),
    (8, 'ቶር፡ሀይሎች');

INSERT INTO districts (subcityId, districtName)
VALUES
    (9, 'በስራት ጌብሪይል'),
    (9, 'ኢኻማዊ፡ሪሴዋዕኪራር'),
    (9, 'ግሪታ፡አኦ'),
    (9, 'ጉሌሌ፡ቦታ'),
    (9, 'ሀይል፡ገርመንት'),
    (9, 'ሃአላ'),
    (9, 'ሀርቡ፡ሸት'),
    (9, 'እሩርእል'),
    (9, 'ጅሞ'),
    (9, 'ላፍቶ'),
    (9, 'ለቡ'),
    (9, 'ለቡ፡መብራጢል'),
    (9, 'መቃንኡ'),
    (9, 'መቃንኡ፡አቦ'),
    (9, 'ምንበን፡ሪያም'),
    (9, 'ቫቲካን');


INSERT INTO districts (subcityId, districtName)
VALUES
    (10, 'አባዶ ፕራጭንት 13'),
    (10, 'አድዋ ዲልዲዊ ኮንዶሚኒዮም'),
    (10, 'አየት ሪያላ'),
    (10, 'ባልደራስ ኮንዶሚኒዮም'),
    (10, 'ኪገረስ'),
    (10, 'ኪዘዋ ሲንጋ'),
    (10, 'ሳሪ ብዳ'),
    (10, 'ሱንሂን፡ሪዚድንት');

--------X---------- Location Management --------X----------------
