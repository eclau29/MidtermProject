-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cofishdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `cofishdb` ;

-- -----------------------------------------------------
-- Schema cofishdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cofishdb` DEFAULT CHARACTER SET utf8 ;
USE `cofishdb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(200) BINARY NOT NULL,
  `role` VARCHAR(50) NOT NULL DEFAULT 'user',
  `active` TINYINT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `accessibility`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `accessibility` ;

CREATE TABLE IF NOT EXISTS `accessibility` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `location` ;

CREATE TABLE IF NOT EXISTS `location` (
  `id` INT NOT NULL,
  `accessibility_id` INT NOT NULL,
  `latitude` DOUBLE NULL,
  `longitude` DOUBLE NULL,
  `name` VARCHAR(45) NULL,
  `water_body` VARCHAR(45) NULL,
  `area` VARCHAR(100) NULL,
  `fishing_notes` TEXT NULL,
  `description` TEXT NULL,
  `map_url` VARCHAR(1000) NULL,
  `image_url` VARCHAR(1000) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_location_accessability_idx` (`accessibility_id` ASC),
  CONSTRAINT `fk_location_accessability`
    FOREIGN KEY (`accessibility_id`)
    REFERENCES `accessibility` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile` ;

CREATE TABLE IF NOT EXISTS `user_profile` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `first_name` VARCHAR(75) NULL,
  `last_name` VARCHAR(75) NULL,
  `city` VARCHAR(100) NULL,
  `state` VARCHAR(50) NULL,
  `about_me` TEXT NULL,
  `date_created` DATETIME NULL,
  `image_url` VARCHAR(1000) NULL,
  INDEX `fk_user_profile_user1_idx` (`user_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_user_profile_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `report`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `report` ;

CREATE TABLE IF NOT EXISTS `report` (
  `id` INT NOT NULL,
  `profile_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  `comment` VARCHAR(1000) NULL,
  `report_date` DATETIME NULL,
  `active` TINYINT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  INDEX `fk_report_location1_idx` (`location_id` ASC),
  INDEX `fk_report_profile_idx` (`profile_id` ASC),
  CONSTRAINT `fk_report_location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_report_profile`
    FOREIGN KEY (`profile_id`)
    REFERENCES `user_profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fish_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fish_type` ;

CREATE TABLE IF NOT EXISTS `fish_type` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `image_url` VARCHAR(1000) NULL,
  `description` TEXT NULL,
  `wiki_url` VARCHAR(1000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caught_fish`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `caught_fish` ;

CREATE TABLE IF NOT EXISTS `caught_fish` (
  `id` INT NOT NULL,
  `report_id` INT NOT NULL,
  `fish_type_id` INT NOT NULL,
  `length_inches` DOUBLE NULL,
  `weight_lbs` DOUBLE NULL,
  `rod_type` VARCHAR(45) NULL,
  `lure_type` VARCHAR(45) NULL,
  `comment` VARCHAR(500) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_caught_fish_report1_idx` (`report_id` ASC),
  INDEX `fk_caught_fish_fish_type1_idx` (`fish_type_id` ASC),
  CONSTRAINT `fk_caught_fish_report1`
    FOREIGN KEY (`report_id`)
    REFERENCES `report` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_caught_fish_fish_type1`
    FOREIGN KEY (`fish_type_id`)
    REFERENCES `fish_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `location_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `location_comment` ;

CREATE TABLE IF NOT EXISTS `location_comment` (
  `id` INT NOT NULL,
  `location_id` INT NOT NULL,
  `user_profile_id` INT NOT NULL,
  `comment_date` DATETIME NULL,
  `comment_text` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_location_comment_location1_idx` (`location_id` ASC),
  INDEX `fk_location_comment_user_profile1_idx` (`user_profile_id` ASC),
  CONSTRAINT `fk_location_comment_location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_location_comment_user_profile1`
    FOREIGN KEY (`user_profile_id`)
    REFERENCES `user_profile` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rating` ;

CREATE TABLE IF NOT EXISTS `rating` (
  `user_profile_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  `rating_date` DATETIME NOT NULL,
  `rating` INT NULL,
  INDEX `fk_rating_user_profile1_idx` (`user_profile_id` ASC),
  INDEX `fk_rating_location1_idx` (`location_id` ASC),
  PRIMARY KEY (`user_profile_id`, `location_id`),
  CONSTRAINT `fk_rating_user_profile1`
    FOREIGN KEY (`user_profile_id`)
    REFERENCES `user_profile` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rating_location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `favorite_location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `favorite_location` ;

CREATE TABLE IF NOT EXISTS `favorite_location` (
  `user_profile_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  PRIMARY KEY (`user_profile_id`, `location_id`),
  INDEX `fk_user_profile_has_location_location1_idx` (`location_id` ASC),
  INDEX `fk_user_profile_has_location_user_profile1_idx` (`user_profile_id` ASC),
  CONSTRAINT `fk_user_profile_has_location_user_profile1`
    FOREIGN KEY (`user_profile_id`)
    REFERENCES `user_profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_profile_has_location_location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS cofish@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'cofish'@'localhost' IDENTIFIED BY 'cofish';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'cofish'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `cofishdb`;
INSERT INTO `user` (`id`, `username`, `password`, `email`, `role`, `active`) VALUES (1, 'fisher', 'fisher', 'fisher@gmail.com', 'user', 1);
INSERT INTO `user` (`id`, `username`, `password`, `email`, `role`, `active`) VALUES (2, 'Admin', 'Admin', 'Admin@gmail.com', 'admin', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `accessibility`
-- -----------------------------------------------------
START TRANSACTION;
USE `cofishdb`;
INSERT INTO `accessibility` (`id`, `name`) VALUES (1, 'Easy');
INSERT INTO `accessibility` (`id`, `name`) VALUES (2, 'Medium');
INSERT INTO `accessibility` (`id`, `name`) VALUES (3, 'Hard');

COMMIT;


-- -----------------------------------------------------
-- Data for table `location`
-- -----------------------------------------------------
START TRANSACTION;
USE `cofishdb`;
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (1, 1, -105.093250, 39.488111, 'Waterton Canyon', 'South Platte', 'Denver Metro', 'Low, clear water conditions can make presentation tricky but overall not super technical.  Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph', 'Easy, low-key place to fish for small rainbow/browns.  In the summer, it gets crowded with hikers, walkers, bikers but you can usually find a place to yourself.  From the bridge, theres some nice eddy/pockets all the way up until the walking trail along the banks meets the actual bike/car/walking  trail.  If you are looking for some exercise, walk/take your bike up to strantia springs dam/tailwater.', 'https://goo.gl/maps/VGgibsvs8JC2', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (2, 2, -105.212944, 39.653028, 'Bear Creek', 'Bear Creek', 'Denver Metro', 'Small creek that runs from Evergreen down through Morrison.  Similar patterns as above with ant patterns, beetles can produce as well.  Be sneaky...fish pockets upstream from yourself or flip across etc.  You will not cast much here...just do roll-casts or simply extend/flip.  6 leader - 9 is too much', 'Fairly technical little body of water.  Creek can get ~ 4-5 deep in pockets but mostly 4 - 10 wide (sometimes a little more) and has lots of trees and things in the way.  There are sections that you will find where there is open water and they hold some nice fish for such a small creek.  Fun place to get away from people but the road bikers are up/down that road in the summer so be careful.', 'https://goo.gl/maps/BKCh8pgKcGu', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (3, 1, -105.329222, 39.741417, 'Clear Creek', 'Clear Creek', 'Denver Metro', 'clear water conditions can make presentation tricky but overall not super technical.  Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph', 'Clear creek is one of my favorite close by areas.  Over the years, it has seen a lot of traffic to the folks going to Blackhawk, to rock climbers and rafters.  Leaving Golden, theres lots of places to pull over and fish but I prefer to go directly to Tunnel 3.  You can walk down, around and get off the road a bit - you will probably have others there unless you sneak out during the week.  NOTE:  This is a dangerous waterway during runoff in the canyon.  Do not try and cross in early spring/summer unless you know what you are doing there are deep holes and Ive gotten stuck scaling walls and bobbing around corners.  You can fish clear creek all the way up past Idaho Springs.  Rainbows, Browns.', 'https://goo.gl/maps/q1xiAC8H9N22', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (4, 1, -105.168778, 39.359056, 'Deckers Area', 'South Platte', 'Foothills West', 'Can be technical - lots of pressure but still produces a lot of fish.  Early spring, summer and fall are great - early summer can be tricky with run off etc.  Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph etc.   9 leader ', 'This is the easiest access to the South Platte - at this location, it is open fishing and  you have lots of camping, people having fun etc.  Leaving Sedalia, just stay on 67 until you hit a rock with a little bar on the right hand side. (Sprucewood Inn)  Turn right and about 2-3 miles of windy steep roads takes you directly intersecting the river...you can stay on the road and go long way and it brings you out closer to Deckers.  ', 'https://goo.gl/maps/Uc1BH1fp62Q2', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (5, 1, -105.170778, 39.408056, 'Deckers Area #2', 'South Platte', 'Foothills West', 'Can be technical - lots of pressure but still produces a lot of fish.  Early spring, summer and fall are great - early summer can be tricky with run off etc.  Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph etc.   9 leader ', 'At the river intersection, turn right and you can drive back /towards Denver (so to speak) and follow the South Platte until it splits and if you were so inclined, you could walk back down to Waterton Canyon.  This whole area can be more of a play area in the summer but in the spring/winter, the deep pools, boulders etc., can produce some good fish.  Also, you can fish the smaller water of the North Fork of the South Platte that dumps in there as well.', 'https://goo.gl/maps/Pwemev6VVL62', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (6, 2, -105.207000, 39.296139, 'Deckers Area #3', 'South Platte', 'Foothills West', 'Can be technical - lots of pressure but still produces a lot of fish.  Early spring, summer and fall are great - early summer can be tricky with run off etc.  Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph etc.   9 leader ', 'At the river intersection, turn left this time and as you head more SW, you will then cross over into gold medal water, fly/lure only.   Past Scraggy View, this does not have the people that are playing as much but can be crowded.   There are good spots all along from here to Deckers but the spot I have here is one of my favorites.  You can pay/park and walk back around the bend ~ 1/2 mile or so section or you can park a few blocks down at the top of the incline and tree bash down.  Its steep but it puts you right into the area and if theres people at the parking lot or the other end, youll be in the middle.  Ive taken 6+ lb trout of this section and broken off ~ 30 rainbows...so bigguns can be found in here.', 'https://goo.gl/maps/kxfbouNeCpR2', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (7, 1, -105.227667, 39.253972, 'Deckers Area ', 'South Platte', 'Foothills West', 'Can be technical - lots of pressure but still produces a lot of fish.  Early spring, summer and fall are great - early summer can be tricky with run off etc.  Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph etc.   9 leader ', 'You arrive at Deckers and you can literally fish across the street anywhere around here.  It has some great spots all along but it can get crowded because you can fish - then walk back across the street for a beer/lunch etc.  You can continue west up the river until you reach a private fishing club WigWam.  You can also decide to turn back south on HW67 and head towards woodland park/manitou springs if you just want to sight see on the way into Colorado Springs', 'https://www.google.com/maps/place/39%C2%B01514.3%22N+105%C2%B01339.6%22W/@39.2539722,-105.2292678,504m/data=!3m2!1e3!4b1!4m6!3m5!1s0x0:0x0!7e2!8m2!3d39.2539594!4d-105.2276576', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (8, 2, -105.265806, 39.241750, 'Cheesman Canyon', 'South Platte', 'Foothills West', 'Technical - lots of pressure but still produces a lot of extremely large fish.  Early spring, summer and fall are great - early summer can be tricky with run off etc.  Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph etc.   9 - 12 leader ', 'The famous Cheeseman Canyon is one of the more legendary areas in Colorado.  Past the private Wigwam club, there is a trailhead that leads to Cheeseman Canyon.  Cheeseman Lake is what feeds the South Platte river and this trail leads you to the tail waters of the lake.   This section flowing out of the lake downstream is extremely technical but is filled with 6-8lb rainbows and browns.  Massive fish, feeding on the tailwaters etc., and because of the pressure, they are tough to catch.  I have not been there since I was in my 20s but Im sure it is still awesome.   Expect to find a lot of fishing heros, with them wearing/carrying more $ in gear than some people spend on a car.  :) haha...  so be warned..douche alert.', 'https://goo.gl/maps/6nSf341Uovt', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (9, 2, -105.648083, 39.455528, 'West 285 Grant', 'North Fork of the South Platte', 'West', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph', 'This is the other river that dumps into Waterton Canyon.  If you followed it from there it would lead you back to Pine Junction/285 and as you follow it west, it leads you out to Bailey and beyond.  This is a spring or fall river mostly because of the way it is influenced by the run off from the Guanella Pass area.  Lots of places to stop along the way but watch for private propery and fun tip - in the summer you can take the Guanelle Pass road and it will take you over to I70/Idaho Springs area - cool drive.', 'https://goo.gl/maps/FxrUfMR6ZDp', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (10, 2, -105.460820, 38.909146, '11 Mile Canyon', 'South Platte', 'West', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph', 'On Hwy24, turn left (or right if you are coming from the other way) at Lake George onto State road 96.  This will lead you to the entrance of the 11 mile canyon rec area.  There is an entrance fee to this and some private areas but overall, theres 6+ miles of water in here all the way up to the dam/spillway.  Some great pools and pocket water.  This can get crowded with people camping and such in the full summer months but typically you can still find a section to call your own.', 'https://goo.gl/maps/i9BdrdMkHnt', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (11, 1, -105.368778, 38.994639, 'Tarryall Road', 'South Platte', 'West', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph', 'Nearly across the road from the 11 mile path, the south platte continues into some open meadows areas as it winds its way to Cheeseman lake.  Theres several camp grounds back here and it can get crowded with people just playing but as you follow state road 112, there are places to access the water or park at the camp ground and walk back in some.  I do not recall how far back there is parking but it it would be a pretty nice/hike/walk.', 'https://goo.gl/maps/asqReCWYCVr', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (12, 1, -105.608652, 39.230054, 'Tarryall Lake', 'Tarryall Creek', 'West', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph', 'Coming from  Hw285/Denver you can turn on state road 77 by Jefferson and you will end up following Tarryall Creek South east ish back towards Tarryall Lake.  Theres a lot of mix of private/public access to this little stream etc., but it goes for quite some time.  If you are on Hwy24 from Lake George, you can take the same Tarryall Road but instead of going on to state road 112, you would turn onto state road 77.  This will lead you towards Tarryall Lake heading more north West  - back towards - Hwy285 etc.   Again, lots of areas but pay attention to private proprety.  Near the exit of the lake, heres places to pull of and you can walk out in the pastures etc.   Ute Creek Trail head on the south side can be a good place to park/walk.                                                                                                    ', 'https://goo.gl/maps/LT94KjpnvPo ', 'https://goo.gl/maps/usWpkJynoHN2');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (13, 1, -105.581928, 38.968129, 'Miracle Mile', 'South Platte', 'West', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph', 'Continuing from Hwy24 towards Hartsel, you will come out across the open high plains and come across state road 447.  This will lead you to the area known as the Miracle Mile as it is a body of water that rund between Spinney Mtn Res and 11 Mile res.   This section is another famous area that attracts people from all of the country (and colorado) as not only are there massive fish but during the spawning, kokanee salmon (Land locked salmon) run between the two lakes.  (cant remember which direction..haah)  but you get large rainbows/browns lurking feeding of the roe and some amazing fishing.  It is technical and again lots of pressure but another great spot', 'https://goo.gl/maps/kcnEg3LktD92', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (14, 2, -105.778667, 39.017000, 'Hartsel/Badger Basin', 'Middle Fork of South Platte', 'West', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph', 'Continuing along Hwy 24 towards Hartsel, you will cross state road 11 which leads to state road 59.  This section comes out of Antero res and eventually feeds into Spinney Mtn Res - there are several areas to access and typically you can see a parking area and then you walk back across the pastures to water.  This can be  tricky depending on the season - low water conditions and all.   As you continue west along state road 59, it connects back to Hwy 24 at Hartsel and as you continue, there are several additional areas to pull off.  You have be sneaky with these areas, as its super low, clear water typically and walking the banks will spook big fish.', 'https://goo.gl/maps/QJbfexe8vmK2', 'https://goo.gl/maps/v8VoJueJ2dE2');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (15, 2, -105.890000, 39.107778, 'Tomahawk', 'South Platte', 'West', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph', 'Contining along Hwy24 or coming from Hwy285 to Fairplay, you will cross Hwy9.    This section is ~ 10 miles from Fairplay or 8.5 miles from Hartsel if you are coming from that direction.  The South Platte crosses under Hwy9 and immediately after (or before if you are coming from Hartsel) there is an access road that follows the bend in the river.  The river flows through some secluded pastures and there is about 2 miles of water winding its way back/forth etc.  There is some private access roads before/after so be aware of that but there is a central parking area that I like to use, then just walk straight across the fields 1/4 mile or so to the water.   Early summer the water flows really fast and is not great but Spring, mid-summer through fall/winter this is one of my favorite places.  Deep undercut banks provide shelter for very large fish and youll need to be sneaky how you approach areas to cast.  Try to approach from the sides and let your topwater of nymphs drift along the banks - Boom.... :)   This can bet crowded too but its far enough where you can usually get a section to yourself etc.  (PS - mosquitoes...so have repelant/clothing)', 'https://goo.gl/maps/vfGXwZuezEq', 'https://goo.gl/maps/tVE7uKVFi4L2');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (16, 1, -105.975500, 39.048750, 'South Fork', 'South Fork of the South Platte', 'West', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph', 'This is another favorite area of mine as it is far enough out that not many people ever bother and it is fairly secluded.  From Fairplay, continue south on Hwy 285 and the first pull off area is about 12 miles down. There is a second pull off 2 miles south from there as well but I typically pick the first area.  You can see if there are cars there from the road and decide if you want to venture in.   This is a pretty small stretch of water but it holds a lot of fish and fun.  Ive literally spent an entire afternoon out here before just catching smaller brookies, browns.  You can get away with a #4 weight line here but given the potential for wind, I typically always use #5.  It is not super technical and some great pools, eddys etc.', 'https://goo.gl/maps/s27js6j5aZC2', 'https://goo.gl/maps/RUrdMnGjXGz');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (17, 1, -105.985528, 38.858361, 'Trout Creek', 'Trout Creek', 'West', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph', 'Contining along Hwy 285 - head towards Buena Vista, there is a tiny like body of water called Trout Creek that is accessible as you head SW.  It is a fun pull off if you want to catch some smaller fish and/or perhaps do a little gold panning?  :)   It is the type of place I would go if I wanted a break in driving or there were hordes of other people around.', 'https://goo.gl/maps/e7PDvafcwCx', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (19, 1, -106.240472, 39.019806, 'Stone Cabin', 'Arkansas River', 'West/SW', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph', 'Heading towards Granite, there is a pull off to the right called Stone Cabin.  Early spring - this can be deep snow,  so be cautious but once you pull in there are areas to park and walk down to the river.  The river bend has some fantastic spots as you walk downstream etc.  Upstream, there is a section where clear creek (fed from the res) dumps into the river.  This can be crowded at times given its easy access.', 'https://goo.gl/maps/8mhMVanKSLE2', '');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (20, 3, -106.244667, 39.026444, 'Stone Cabin + 1/2 mile', 'Arkansas River', 'West/SW', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph', 'A little under a half mile up the road from the entrance to Stone Cabin, there is a nother pull off.  The water winds around the corner before it flows downstream and this section is a great spot.  You can also continue up river from here 1/4 mile or so with lots of boulders, pocket water etc.  Lots of fish per mile...  If you continue towards Granite, there are a number of places to pull off etc. on the way to Leadville.  Remember, the elevation is climbing  at this point and the water will be colder etc.  If you continue this way, you will eventually run into I70 and you can head back to Denver that route if you choose.', 'https://goo.gl/maps/VJBzphh3KnQ2', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (21, 3, -106.051252, 38.652806, 'Browns Canyon', 'Arkansas River', 'West/SW', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph', 'This is the famed area for rafting and such but if you have the gumption, you can walk in from Hecla Junction campground which is about 8 miles south of Nathrop turning onto state road 194.  Like any of the Arkansas areas, be wary of rattlesnakes and copper head snakes as you walk/hike around.  It gets hot in the summer and the snakes will be out sunning themselves...Be wary of the rafting guides too.  (LOL)  Personal knowledge of some of the antics of these people - most are good folk, others are looking for a serious lifestyle alternative.', 'https://goo.gl/maps/FCA4ZThfas92', '');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (22, 1, -106.170972, 38.535806, 'Poncha Springs', 'South Arkansas', 'West/SW', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph', 'As you continue south towards Salida, Hwy 285 will intersect Hwy 50 at Poncha Springs.  If you head west on Hwy 50 towards Monarch pass, the south Arkansas River flows from the passes.  A smaller version of the Arkansas, there are places to pull over along the way to wet your line but as usual, be cautious of private property.  There was a winery up this way too - which may be a fun stop over.   It has been a while since Ive been in this area in/around Maysville etc. but there are also some B&Bs as I recall that would give you direct water access as well.', 'https://goo.gl/maps/vZk8DKpx2b72', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (23, 3, -105.917944, 38.493472, 'Salida/Wellsville', 'Arkansas River', 'West/SW', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph, streamers in the fall', 'Heading south on Hwy 50 towards Canon City, about 5 miles outside of Salida is a place called Wellsville.  There is a nice pull off here where you can walk a good section of the river.  Careful walking the step sections as the rocks can be painful if you slip.  Lots of deep, pocket water and good fish population throughout.   You can also park after the bend and walk back around (2nd link)', 'https://goo.gl/maps/VtW5YmDumV32', 'https://goo.gl/maps/jn9LeveQ9DP2');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (24, 3, -105.535972, 38.442139, 'The Braids', 'Arkansas River', 'West/SW', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph, streamers in the fall', 'While there is literally sixty (60) miles of river frontage on Hwy 50 between Salida/Canon City alone, some places hold some special place for me in the decades on this river.   This section is referred to as the braids because the way the river winds itself between sections of islands etc.  You can walk upstream around the bend or traverse south to the nexdt spot called Pinnacle Rock.', 'https://goo.gl/maps/61a3qucm6yx', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (25, 1, -105.522920, 38.447548, 'Pinnacle Rock', 'Arkansas River', 'West/SW', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph, streamers in the fall', 'Pinnacle Rock is a campground/pull over and it is also frequently used for take out for rafters etc.  You can park and walk upstream towards the braids with some nice water in this section.', 'https://goo.gl/maps/1J8zQQPW9Au', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (26, 1, -105.473528, 38.458000, 'Spike Buck', 'Arkansas River', 'West/SW', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph, streamers in the fall', 'A few miles further south you will come to an area known as Spike Buck.  There are restrooms and parking areas etc.  Or you can find a pull off above/below this designated area.', 'https://goo.gl/maps/tRdU4QWHw7D2', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (27, 1, -105.375667, 38.483944, 'Parkdale/Royal Gorge', 'Arkansas River', 'West/SW', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph, streamers in the fall', 'So this used to be accessible to anyone back before the rafting companies.  Also, when I was young, we used to be able to walk back into the canyon along the tracks, fishing sections that nobody bothered to walk into etc.  I believe this is public lands (this little spot here) and you can walk to the river - but be sure and double check before trying.', 'https://goo.gl/maps/3zqBUvRyLyw', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (28, 1, -105.246306, 38.434694, 'Electric Plant', 'Arkansas River', 'West/SW', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph, streamers in the fall', 'This is Arkansas river access on the south side of the river in Canon.  This is part of the river walk trail access that rund along the river in the city.  This section is more or less across from the old power plant.  Nice area, walking is easy and food/drink just up the road.', 'https://goo.gl/maps/tD83iRbnasG2', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (29, 1, -105.224696, 38.439093, 'River Walk 9th st', 'Arkansas River', 'West/SW', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph, streamers in the fall', 'This is Arkansas river access on the south side of the river in Canon.  This is part of the river walk trail access that rund along the river in the city.  You can take this all the way around on bike or foot with good fishing throughout.', 'https://goo.gl/maps/GLiUCKUxAE32', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (30, 1, -105.204880, 38.437362, 'Reynolds Bridge', 'Arkansas River', 'West/SW', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph, streamers in the fall', 'This is Arkansas river access on the south side of the river in Canon.  This is part of the river walk trail access that rund along the river in the city.  You can take this all the way around on bike or foot with good fishing throughout.', 'https://goo.gl/maps/nQBzUqW98Lv', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (31, 3, -104.676588, 38.269869, 'Pueblo Res/Tail Water', 'Arkansas River', 'West/SW', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph,', 'If you are so inclined and happen to be in the Pueblo area, you can walk from the nature preserve pretty much to the dam/outlet from the res.  In the spring/fall/winter, this is actually some pretty good fishing through here - of course it is not like riding around in a boat etc., if that is why you are there in the first place.  :) ', 'https://goo.gl/maps/cfHm15WXBoL2', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (32, 3, -105.299328, 38.411644, 'Temple Canyon', 'Grape Creek', 'West/SW', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph', 'This is one entrance to Grape Creek - this is a fun place to hike/mountain Bike etc. and the fishing can be quite good as well.  When the Arkansas bloats over with run off, a lot of fish will move into places like this.  You can literally hike this entire canyon and come out near  Deweese Res near westcliffe.   (Its a long haul though)   Warning - this is another rattlesnake haven so be alert - as well as Mountain Lions.', 'https://goo.gl/maps/86wJNDvU8XK2', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (33, 2, -106.426694, 38.393444, 'Tomichi Creek', 'Tomichi Creek/Marshall Creek/Indian Creek', 'West', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph', 'West on Hwy 50 from Poncha Springs - towards Gunnison.  These are small creeks that are mostly controlled by run off.  Sargents is an interesting stop along the way for food/fuel etc.  Typical challenges with small water - light leaders, small flies and stealth.  This leads to Marchall Pass and Ohaver Lake, which is an alternate route to Monarch pass and leads you back to Poncha Springs/Hwy 285.  :)', 'https://goo.gl/maps/W9WJ11pBFrq', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (34, 2, -107.018421, 38.514794, 'Neversink Trail', 'Gunnison River', 'West', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph, streamers in the fall', 'As you continue to Gunnison,  go through town towards (Blue Mesa) and before you reach the full res, there is the Neversink trail head.  From here, you can walk down and fish a good section of the Gunnison river.  Depending on the season, the water can be pretty full and there is some large fish here. Also, there are kokanee salmon in this res as well, which makes for some interesting snagging activity that takes place in the fall during the runs.  ', 'https://goo.gl/maps/zfAiJr4rTXR2', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (35, 1, -106.858389, 38.653750, 'Almont Campground', 'Gunnison River', 'West', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph, streamers in the fall', 'This is on the outskirts of Gunnison, heading towards Crested Butte etc.  Before you get to Almont, there is a section of the Gunnison river that is accessible from the road.  Once you reach Almont, the the rivers split into (3) - East River, Gunnison River and Taylor River.', 'https://goo.gl/maps/uGjK3nApkWw', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (36, 2, -106.847472, 38.717417, 'Roaring Judy Area', 'East River', 'West', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph, streamers in the fall', 'Heading towards Crested Butte, the east river flows through the valley with a hatchery (Roaring Judy) nearby.  Special rules exists for this section so pay attention but as you get closer to Crested Butte, there are places to get access - be wary of private property.  I do not have a lot of experience on this river.', 'https://goo.gl/maps/Hp2QqNRsf7t', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (37, 1, -106.836278, 38.672500, 'Taylor ', 'Taylor River', 'West ', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph, streamers in the fall', 'The Taylor river is another famous waterway...there is rafting on this river but the bigger issue is really river access.  The river has lots of private property all around it and it can be tough to find an access point - with the exception of the dam area.  There are a number of camp sites along the way that can provide a spot and access but it will be often crowded.', 'https://goo.gl/maps/97VrNth2vF52', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (38, 1, -106.612528, 38.814278, 'Taylor Dam', 'Taylor River', 'West ', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph, streamers in the fall', 'This is another famous spot - the tailwaters of Taylor res, feeding the river product massive fish.  It also produces a lot of attention as you would expect.  Its worth doing though if you can sneak away mid-week etc.', 'https://goo.gl/maps/PLG46Mhn7TB2', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (39, 2, -106.709917, 38.863139, 'Spring Creek Res', 'Spring Creek', 'West', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph', 'On the way following the Taylor River, you will see a turn off for state road 744 before heading into Taylor canyon area. (Past old Harmels resort)  This will lead you to Spring Creek Res.  This high-altitude lake is awesome...spring creek is relatively small but you can catch brookies of all sizes.  Once you arrive at the res, you can fish from the bank or use a float tube.  Brilliantly colored fish and not a lot of pressure up here.  It can get chilly...so be aware ', 'https://goo.gl/maps/prGkoy364QS2', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (40, 3, -107.764159, 38.281044, 'Montrose', 'Uncompahgre River', 'West', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph', 'Continuing past Gunnison on Hwy50, you reach Montrose - turning south, you follow Hwy 550 towards Ouray.  Past Eldrige there are parking spots for accessing this river but you may want to just keep going to Ridgeway and then park/hike/walk around as you seen fit.  Ridgeway can get crowded, so expect some of that to spill over into the river access but again, these are far from Denver etc., so all things considered it will be less crowded than you would imagine.  If you continue into Ouray, theres lots of B&Bs etc., to stay.  If you want to fish, go early spring or late summer/fall/winter, as the Uncompahgre will flow muddy during initial summer months because of the run off.  Ouray is worth staying for the hot springs and german bier garden', 'https://goo.gl/maps/DpNK5TW6KSn', 'https://goo.gl/maps/WRjG2xdxJX42');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (41, 3, -107.801865, 37.453736, 'Hermosa', 'Animas River', 'SW', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph', ' Traveling south from Ouray on Hwy550, (million dollar hwy) you will reach Hermosa.  This is a great little town but access can be a pain.  The Durango/Silverton train runs in the summer and it will drop people off at various stops along the way.  I did not do this myself but it looks like it would be cool.    As you get closer to Durango - there are places for direct access.  KOA provides some access in/around Hermosa', 'https://goo.gl/maps/uK3oakRUi7B2', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (42, 1, -107.886667, 37.271722, 'Durango', 'Animas River', 'SW', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph, streamers in the fall', 'Once in Durango, the river is still fishable but often times it turns into more tubing and people playing around.  The nice thing is that it is walkable through town and you can head over to the animas Brewing as well.', 'https://goo.gl/maps/kyw2zRrzyc32', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (43, 1, -107.011886, 37.265538, 'Pagosa Springs', 'San Juan River', 'SW', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph', 'The San Juan is world renowned but in the tail waters of navajo dam in NM.  In colorado, it is still good fishing but can be tough to reach.  In Pagosa Springs, there is a river walk section to access the San Juan as well as Yamaguchi park.', 'https://goo.gl/maps/LFGVD3fT6L52', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (44, 1, -106.919010, 37.457640, 'Pagosa Springs', 'West Fork San Juan', 'SW', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph', 'This is a nice area to hike and get out Pagosa.  I do not have a lot of familiarity with this water but I understand it can be enjoyable.', 'https://goo.gl/maps/xJb8H8zBkL42', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (45, 2, -106.831333, 39.363000, 'Carbondale/Basalt', 'Roaring Fork & Frying Pan River', 'West/Central', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph, Mysis Shrimp', 'Coming from Glenwood Springs or from Hwy24 and Granite area (not during winter) you can follow state road 82 towards Aspen/Snowmass etc until you reach Basalt.  At Basalt, the Roaring fork and Frying Pan converge.  If you take midland Ave to Frying pan Rd, this will lead you into the canyon along this river.  The Frying pan river is another very interesting place to fish and it is the tailwaters of Ruedi Res.    This is one of the only rivers that you can fish mid-winter due to the warmer water flowing out of the dam - while the air temp can be freezing (or below) the water stays relatively warm by comparison.   The production of mysis freshwater shrimp produce large fish in the tailwater behind the dam.   Because of this, the river can get crowded at times - and also due to the proximity of Aspen/Snowmass etc. but it is worth the trip.', 'https://goo.gl/maps/A6cDfYmymYs', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (46, 2, -105.840556, 40.009917, 'Winter Park/Fraser', 'Fraser River', 'West ', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph, Green Drake', 'Theres a number of places to on the water but the easiest is the fraser river trail.  This is a relatively small river but produces a lot of nice fish - no monsters but lots of fun. The access in town is cool or if you want to be adventurous, there is access near Tabernash. (link) FromStrawberry Road go straight on forest road 2751 there is a pull of and a small trail down to the river.   Be careful of deep snow if spring and the trail is likely not doable with snow still down etc.', 'https://goo.gl/maps/MB2dmZmj2Tv', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (47, 1, -105.760417, 40.118139, 'Granby', 'Arapahoe Creek', 'West', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph, Green Drake', 'Leaving Fraser and heading towards Granby, turn on Hwy 34 towards Lake Granby.   As you approach the lake, you can turn on state road 6, which will take you to monarch lake trail head.  Theres some beautiful scenery there and the creek/inlets of the lake make for some descent fishing.  Make a trip into Grand Lake - lots of fun.', 'https://goo.gl/maps/jc5wHHQ6nzJ2', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (48, 1, -105.814722, 40.256611, 'Grand Lake', 'N. Inlet/Tonahutu Creek', 'West', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph, Green Drake', 'From the trailhead, you can check out Tonahutu creek (small) or hike/walk the trail to access the north inlet that feeds into grand lake.  This is another nice, clear mountain stream that will run super cold and slowly flourish as the summer approaches.  Lots of native brookies and great area.   The lodge on the river is fun - the restaurant pipes in the sound of the river gurgling etc.  Been a long time since I visited that lodge so cant speak to its current state.  In the summer - trail ridge road will take you across into RMNP!', 'https://goo.gl/maps/9XFgCQbvvcs', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (49, 2, -106.131809, 40.049634, 'Hot Sulpher Springs', 'Colorado River', 'West', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph, Green Drake', 'Instead of going to Grandby/Grand Lake, you can go west on Hwy 40 towards Hot Sulpher Springs.  The Colorado River runs along this section and can be some great fishing - this is of course way above where it ends up flowing out of Colorado towards Glenwood Springs etc.   Theres a number of places to pull over and access - so take your time and watch for private property.  There is a state recreation area just past the town.', 'https://goo.gl/maps/KuPMTLScXKo', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (50, 1, -106.174403, 40.046571, 'Hot Sulpher Springs', 'Williams Fork', 'West', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph,  ', 'This is one of the access points to reach the Williams Fork river.  I do not have a lot of experience here but the tailwaters from the dam is always good.  Also, if you want to fish the entrance into the res - that is another option - likely less people as well.', 'https://goo.gl/maps/fiWMjjW2e7U2', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (51, 1, -106.348111, 39.922222, 'Kremmling/Green Mountain Res.', 'Colorado River/Blue River', 'West', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph, streamers in the fall', 'Going through Kremmling on Hwy 40, you will intersect Hwy 9 again.  Going south on Hwy9, this is the Blue River - fed from the Colorado.   Through this section, there is access before it feeds into Green Mountain Res.   Lots of private property so be cautious on where you are/parke tc.', 'https://goo.gl/maps/Hhxi3EQE2452', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (52, 3, -106.213318, 39.825745, 'Towards Silverthorne', 'Blue River', 'West', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph, streamers in the fall', 'Leaving Green Mountain Res behind, the Blue river flows towards Silverthorne/Frisco and I70.  There are a few places to stop and get access but the easiest is the state rec area.  From here, you can walk up/down stream some and there is some great fishing.  In the fall - the Kokanee salmon run out of Green Mountain res and there is the opportunity to hook some of these up on a flyrod.  Again, can be crowded and the affluent crowd that lives in the area do not have to drive the 2hrs from Denver.  haha  :)', 'https://goo.gl/maps/sGfKrx4h9pq', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (53, 1, -106.071778, 39.627389, 'Silverthorne', 'Blue River', 'West', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph, streamers in the fall', 'This is an interesting stretch - you have the high-end outlet mall right on the river and with people shopping etc., you will see folks flyfishing right in the  middle of it all.  The river continues on to spill into Dillon Res but between downtown and there - lots of places to fish - and eat/shop along the bike path.', 'https://goo.gl/maps/ZpqVvRcYihH2', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (54, 3, -105.619417, 40.357028, 'Rocky Mountain National Park', 'Big Thompson', 'West', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph,  ', 'RMNP is always a great place to go.  Enter the park from the Estes side and turn left on Bear Lake rd, turn right onto Morain Park rd and then jog left on Fern Lake rd.   You can drive up close to the trailhead or park further down and walk in.  This trail follows the flow of the Big Thompson and has fantastic fishing.  The trail will be filled with people walking in to hike/camp etc., but there will be plenty of places to stop and hold your attention.  The  hike is a little over 4.5 miles to Fern Lake if you want to go for it...it can be strenuous at times.', 'https://goo.gl/maps/6SvdESznz6x', ' ');
INSERT INTO `location` (`id`, `accessibility_id`, `latitude`, `longitude`, `name`, `water_body`, `area`, `fishing_notes`, `description`, `map_url`, `image_url`) VALUES (55, 2, -105.485668, 40.376074, 'Estes Park', 'Big Thompson', 'West', 'Springtime - go small, midge if topwater, small nymphs (RS2, Pheasant Tail, etc.) Summer - go bigger, hoppers, stimulators, caddis (early spring too), Goldenstone nymph,  ', 'The Big Thompson flows for about 18 miles from Estes out to near Loveland.  There are lots of B&Bs all along the way up to and including within Estes proper.  The 4th of July gets a little packed due to the fireworks over lake Estes etc. and of course the normal summer traffic but it is a great place.  Fish/explore during the morning, shop/eat in the afternoon/evening, hang out at a local watering hole etc.  Great fishing, nothing huge in here but always fun.', 'https://goo.gl/maps/FPWGH9aYb8v', ' ');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_profile`
-- -----------------------------------------------------
START TRANSACTION;
USE `cofishdb`;
INSERT INTO `user_profile` (`id`, `user_id`, `first_name`, `last_name`, `city`, `state`, `about_me`, `date_created`, `image_url`) VALUES (1, 1, 'Bob', 'Fishermen', 'Denver', 'Colorado', 'I fish for food', '2019-07-16 11:09', 'http://dslv9ilpbe7p1.cloudfront.net/bF7svvAwQ1OWrFzbHMnWdQ_store_header_image');

COMMIT;


-- -----------------------------------------------------
-- Data for table `report`
-- -----------------------------------------------------
START TRANSACTION;
USE `cofishdb`;
INSERT INTO `report` (`id`, `profile_id`, `location_id`, `comment`, `report_date`, `active`) VALUES (1, 1, 1, 'Great spot to fish caught me a big trout', '2019-07-16 11:30', 1);
INSERT INTO `report` (`id`, `profile_id`, `location_id`, `comment`, `report_date`, `active`) VALUES (2, 1, 3, 'Fun spot to  fish and a challange to get to but very dangerous during spring ', '2019-07-17 12:00', 1);
INSERT INTO `report` (`id`, `profile_id`, `location_id`, `comment`, `report_date`, `active`) VALUES (3, 1, 4, 'Today was hot day the weather was about 98 degrees, with a warm breeze. This spot was not too difficult to get to', '2018-05-15 02:30', 1);
INSERT INTO `report` (`id`, `profile_id`, `location_id`, `comment`, `report_date`, `active`) VALUES (4, 1, 5, 'You can also access Waterton Canyon from the east. Drive south on Wadsworth Blvd (Hwy 121), south of C-470. The road essentially ends at Kassler where you can park and hike into the canyon. Strontia Springs Reservoir is found in the canyon. This area of non-vehicle access runs for about 8 miles.', '2018-08-11 03:15', 1);
INSERT INTO `report` (`id`, `profile_id`, `location_id`, `comment`, `report_date`, `active`) VALUES (5, 1, 6, 'Flows at Deckers are currently at 990 cfs. Cheesman reservoir is full and spilling. Flows will likely stay high for the foreseeable future. 2x and 3x fluorocarbon is a must when it comes to landing fish with these big flows. While the flows are high, the water is gin clear. You can expect leeches, worms, PMDs, caddis and stoneflies to be the ticket. Find the slow water created by banks, boulders and bends in the river to find the fish. When you find one, there will likely be more since they are very concentrated in the river. Please exercise extreme caution wading!', '2019-05-10 01:00', 1);
INSERT INTO `report` (`id`, `profile_id`, `location_id`, `comment`, `report_date`, `active`) VALUES (6, 1, 25, 'Clarity looks good this morning round Salida, and the river has fished extremely since Wednesday considering the above average flows.  Conditions will continue to improve over the next few days with the stable forecast and slowly dropping flows.  Fish are extremely concentrated along the banks and in broken pocket water as they seek refuge from the swift current.  Coincidentally, as stonefly nypmhs migrate to the edges and hatch they become vulnerable, easy food for trout.  This has provided some excellent dry and dry/dropper fishing with large stonefly imitations out along the edges.  Don\'t worry about the fast water in the middle of the river; think small stream tactics right along the shoreline, and you\'ll find success.  Fish are not leader shy, so stock up on heavy leader/tippet material to give yourself a fighting chance at landing your quarry in the fast flow!', '2019-05-20 01:45', 1);
INSERT INTO `report` (`id`, `profile_id`, `location_id`, `comment`, `report_date`, `active`) VALUES (7, 1, 35, 'It was very cold, don\'t know why I went fishing', '2018-11-25  02:15', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `fish_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `cofishdb`;
INSERT INTO `fish_type` (`id`, `name`, `image_url`, `description`, `wiki_url`) VALUES (1, 'Rainbow Trout', 'https://cpw.state.co.us/PublishingImages/Fishing/SpeciesID/RainbowTrout_JosephTomerelli.jpg', 'Rainbows can be found in most mountain lakes and streams, as well as many plains reservoirs. Physical characteristics that can help distinguish rainbow trout include dark spots on a light body, continuous spotting throughout the body, and often a \\“rainbow\\” horizontal reddish stripe. Rainbow trout may be caught with a variety of flies, baits, and lures.', 'https://en.wikipedia.org/wiki/Rainbow_trout');
INSERT INTO `fish_type` (`id`, `name`, `image_url`, `description`, `wiki_url`) VALUES (2, 'Cutthroat (Native) Trout', 'https://cpw.state.co.us/PublishingImages/Fishing/SpeciesID/CutThroatTrout_JosephTomerelli.jpg', 'Cutthroat trout can be distinguished from rainbows by heavier spotting toward the tail and the presence of a red slash on their \\“throat.\\” Anglers may find these trout in high lakes and streams.', 'https://en.wikipedia.org/wiki/Cutthroat_trout');
INSERT INTO `fish_type` (`id`, `name`, `image_url`, `description`, `wiki_url`) VALUES (3, 'Brown Trout', 'https://cpw.state.co.us/PublishingImages/Fishing/SpeciesID/BrownTrout_JosephTomerelli.jpg', 'These fish can be difficult to catch, but many anglers have good success during their fall spawning runs. A large dark spotting pattern and reddish dots can help anglers distinguish these fish from rainbows and cutthroats.', 'https://en.wikipedia.org/wiki/Brown_trout');
INSERT INTO `fish_type` (`id`, `name`, `image_url`, `description`, `wiki_url`) VALUES (4, 'Brook Trout', 'https://cpw.state.co.us/PublishingImages/Fishing/SpeciesID/BrookTrout_JosephTomerelli.jpg', 'Brook trout have white spots (worm-shaped on top) on a dark background with tri-colored outlined fins (orange, black and white).They are typically found in higher elevation lakes, beaver dams and streams.', 'https://en.wikipedia.org/wiki/Brook_trout');
INSERT INTO `fish_type` (`id`, `name`, `image_url`, `description`, `wiki_url`) VALUES (5, 'Lake Trout', 'https://cpw.state.co.us/PublishingImages/Fishing/SpeciesID/LakeTrout_JosephTomerelli.jpg', 'Also known as Mackinaw. They have white spots on a dark background with a deep fork in their tail. As the name suggests, these fish are found in mountain lakes and are usually in deeper water. Anglers also enjoy success with this species during the fall and spring in shallower areas and when ice-fishing.', 'https://en.wikipedia.org/wiki/Lake_trout');
INSERT INTO `fish_type` (`id`, `name`, `image_url`, `description`, `wiki_url`) VALUES (6, 'Kokanee Salmon', 'https://cpw.state.co.us/PublishingImages/Fishing/SpeciesID/Kokanee_JosephTomerelli.jpg', 'These silver fish with black spots on the upper half of their bodies can be found  swimming in compact schools feeding on zooplankton, a food source unaffected by the drawing down of reservoirs. They turn reddish in color and males develop a \\“hook jaw\\” during the fall spawning season. Trolling with cowbells at medium depths provides angling success.', 'https://en.wikipedia.org/wiki/Kokanee_salmon');
INSERT INTO `fish_type` (`id`, `name`, `image_url`, `description`, `wiki_url`) VALUES (7, 'Mountain Whitefish', 'https://cpw.state.co.us/PublishingImages/Fishing/SpeciesID/mountainWhiteFish_JosephTomerelli.jpg', 'These fish have larger scales than trout and still possess an adipose fin (small flap of skin on their back toward the tail). A weak mouth means delicate hooking and handling is required to land this fish.', 'https://en.wikipedia.org/wiki/Mountain_whitefish');
INSERT INTO `fish_type` (`id`, `name`, `image_url`, `description`, `wiki_url`) VALUES (8, 'Splake', 'https://cpw.state.co.us/PublishingImages/Fishing/SpeciesID/Splake_JosephTomerelli.jpg', 'Splake have tri-colored pelvic fins like brook trout and their tails are slightly forked. Splake are found in high mountains lakes and have been used since the 1980s to thin out stunted brook trout populations. Anglers relish their large sizes (up to 18 pounds) and find success with flies, lures and bait during the summer.', 'https://en.wikipedia.org/wiki/Splake');
INSERT INTO `fish_type` (`id`, `name`, `image_url`, `description`, `wiki_url`) VALUES (9, 'Grayling', 'https://cpw.state.co.us/PublishingImages/Fishing/SpeciesID/Grayling_JosephTomerelli.jpg', 'A large sail-like dorsal fin extending over their silver bodies make them easy to identify. Grayling have extremely small mouths and can usually only be caught on small flies or lures. Even though grayling are relatively small in stature (usually less then 12 inches), they can be a nice challenge to anglers', 'https://en.wikipedia.org/wiki/Arctic_grayling');
INSERT INTO `fish_type` (`id`, `name`, `image_url`, `description`, `wiki_url`) VALUES (10, 'Wiper', 'https://cpw.state.co.us/PublishingImages/Fishing/SpeciesID/Wiper_JosephTomerelli.jpg', 'Wiper have become a very popular sportfish because of their hard fighting. Wiper are a schooling fish that can be found \\“busting\\” prey fish on the surface during the summer. Casting shad imitations or various lures at the \\“busting\\” prey and holding on tight is a fun method for catching wiper. Trolling can also be effective.', 'https://en.wikipedia.org/wiki/Hybrid_striped_bass');
INSERT INTO `fish_type` (`id`, `name`, `image_url`, `description`, `wiki_url`) VALUES (11, 'Walleye', 'https://cpw.state.co.us/PublishingImages/Fishing/SpeciesID/Walleye_JosephTomerelli.jpg', 'You can identify walleye by looking for their two separate dorsal fins and a white tipped tail. Adults feed entirely on other fish and are most often caught by slowly cranking jigs and spinners over bottom structures.', 'https://en.wikipedia.org/wiki/Walleye');
INSERT INTO `fish_type` (`id`, `name`, `image_url`, `description`, `wiki_url`) VALUES (12, 'Saugeye', 'https://cpw.state.co.us/PublishingImages/Fishing/SpeciesID/Saugeye_JosephTomerelli.jpg', 'Saugeye can be distinguished from walleyes by black mottling marks on their bodies, tails that do not have a white tip and black pigmentation in between dorsal spines. Anglers have luck catching saugeye by trolling live bait or slowly retrieving jigs over bottom humps and points.', 'https://en.wikipedia.org/wiki/Sauger');
INSERT INTO `fish_type` (`id`, `name`, `image_url`, `description`, `wiki_url`) VALUES (13, 'Yellow Perch', 'https://cpw.state.co.us/PublishingImages/Fishing/SpeciesID/YellowPerch_JosephTomerelli.jpg', 'Yellow perch have two separate dorsal fins with large vertical dark stripes on their yellowish sides. These fish can be found in large schools and are caught by using bait or small spinners. Yellow perch are usually less than one pound, but can be found over two pounds in some waters.', 'https://en.wikipedia.org/wiki/Yellow_perch');
INSERT INTO `fish_type` (`id`, `name`, `image_url`, `description`, `wiki_url`) VALUES (14, 'Channel Catfish', 'https://cpw.state.co.us/PublishingImages/Fishing/SpeciesID/ChannelCatfish_JosephTomerelli.jpg', 'These fish are easily identified by their barbels (whiskers), forked tail and sporadic black spotting. Night fishing with live bait, chicken innards, flavored dough balls, or any other smelly concoction provides the best angling success. ', 'https://en.wikipedia.org/wiki/Channel_catfish');
INSERT INTO `fish_type` (`id`, `name`, `image_url`, `description`, `wiki_url`) VALUES (15, 'Smallmouth Bass', 'https://cpw.state.co.us/PublishingImages/Fishing/SpeciesID/SmallMouthBass_JosephTomerelli.jpg', 'The best way to distinguish the smallmouth from its cousin, the largemouth bass, is by the \\“smallies\\” jaws that does not extend beyond the eye. They maintain broken vertical lines on their sides and many have a reddish eye. Smallies are frequently caught along rip-rap shorelines with small jigs or crayfish imitations', 'https://en.wikipedia.org/wiki/Smallmouth_bass');
INSERT INTO `fish_type` (`id`, `name`, `image_url`, `description`, `wiki_url`) VALUES (16, 'Largemouth Bass', 'https://cpw.state.co.us/PublishingImages/Fishing/SpeciesID/LargeMouth_JosephTomerelli.jpg', 'This fish has a very big mouth and its jaw extends past the eye. You can also distinguish them as the bass with the horizontal stripe on their body. Casting lures and plugs during dawn and dusk hours around cattails and sunken logs will give you the best chance to land one of the lunkers.', 'https://en.wikipedia.org/wiki/Largemouth_bass');
INSERT INTO `fish_type` (`id`, `name`, `image_url`, `description`, `wiki_url`) VALUES (17, 'Tiger Muskie (Muskellunge)', 'https://cpw.state.co.us/PublishingImages/Fishing/SpeciesID/TigerMuskie_JosephTomerelli.jpg', 'Their long snout filled with teeth and dark tiger striped sides on a light body make them easy to identify. The best opportunity to catch a tiger muskie would be by throwing large lures over vegetation during the summer. Northern pike look like tiger muskie, but have whitish irregular chain markings on a dark body.', 'https://en.wikipedia.org/wiki/Tiger_muskellunge');
INSERT INTO `fish_type` (`id`, `name`, `image_url`, `description`, `wiki_url`) VALUES (18, 'Black Crappie', 'https://cpw.state.co.us/PublishingImages/Fishing/SpeciesID/BlackCrappie_JosephTomerelli.jpg', 'Crappie are a pan-shaped fish with black splotches on a silver background, whose dorsal spines and rays get longer as they approach the tail. Crappie are a schooling fish that often congregate around vertical structures. Anglers have the most success for crappies jigging by structure in the early spring. ', 'https://en.wikipedia.org/wiki/Black_crappie');
INSERT INTO `fish_type` (`id`, `name`, `image_url`, `description`, `wiki_url`) VALUES (19, 'Bluegill', 'https://cpw.state.co.us/PublishingImages/Fishing/SpeciesID/BlueGill_JosephTomerelli.jpg', 'The bluegill has a small mouth on a short head and a dark gill flap with no trim. There are parallel vertical bars on the side with long, pointed pectoral (side) fins. A male bluegill in breeding colors has brilliant blue fins and a red-orange stomach. The female bluegill is dark on the back with vertical stripes on the body. Bluegills are best caught in the morning or evening using small tackle ranging from a bobber and worm to delicate dry flies.', 'https://en.wikipedia.org/wiki/Bluegill');
INSERT INTO `fish_type` (`id`, `name`, `image_url`, `description`, `wiki_url`) VALUES (20, 'Green Sunfish', 'https://cpw.state.co.us/PublishingImages/Fishing/SpeciesID/GreenSunfish_JosephTomerelli.jpg', 'This fish is similar in appearance to the bluegill, but has a larger mouth and is olive in color with short, rounded pectoral fins and yellow trim on the fins. This stocky fish is found in both streams and impoundments and spawns in shallow areas from June to mid-August. Like most sunfish, this sporty panfish can be taken with crickets, worms, and other bait rigged under a bobber, or with small lures, jigs, and flies.', 'https://en.wikipedia.org/wiki/Green_sunfish');
INSERT INTO `fish_type` (`id`, `name`, `image_url`, `description`, `wiki_url`) VALUES (21, 'Colorado Pikeminnow (Protected)', 'https://cpw.state.co.us/PublishingImages/Fishing/SpeciesID/Pikeminnow_JosephTomerelli_low.jpg', 'Protected fish. The Colorado pikeminnow is the largest minnow in North America and is an endangered, native fish of the Colorado River thought to have evolved more than 3 million years ago. \n\nCalled the \\“white salmon\\” by early settlers due to its migratory behavior, the Colorado pikeminnow has a torpedo-shaped body and a large, toothless mouth. It has an olive-green and gold back and a silvery-white belly. ', 'https://en.wikipedia.org/wiki/Colorado_pikeminnow');
INSERT INTO `fish_type` (`id`, `name`, `image_url`, `description`, `wiki_url`) VALUES (22, 'Humpback Chub (Protected)', 'https://cpw.state.co.us/PublishingImages/Fishing/SpeciesID/Humpback_JosephTomerelli_low.jpg', 'Protected fish. The humpback chub is a remarkable member of the minnow family that is green to silver and white with an abrupt hump behind the head. They grow to about 18 inches in length.\n\n', 'https://en.wikipedia.org/wiki/Humpback_chub');
INSERT INTO `fish_type` (`id`, `name`, `image_url`, `description`, `wiki_url`) VALUES (23, 'Razorback Sucker (Protected)', 'https://cpw.state.co.us/PublishingImages/Fishing/SpeciesID/RazorBack_JosephTomerelli_low.jpg', 'Protected fish. The razorback sucker is a large, bronze to yellow fish that grows to a weight of about 15 pounds and has a sharp-edged keel behind the head. Breeding males turn gray-black with a bright orange belly.', 'https://en.wikipedia.org/wiki/Razorback_sucker');

COMMIT;


-- -----------------------------------------------------
-- Data for table `caught_fish`
-- -----------------------------------------------------
START TRANSACTION;
USE `cofishdb`;
INSERT INTO `caught_fish` (`id`, `report_id`, `fish_type_id`, `length_inches`, `weight_lbs`, `rod_type`, `lure_type`, `comment`) VALUES (1, 1, 1, 13, 3.2, 'fly 8 ft 6 in', 'Hoppers/Stimulators/GoldenStone nymph', 'Caught ealry morning cool weather');
INSERT INTO `caught_fish` (`id`, `report_id`, `fish_type_id`, `length_inches`, `weight_lbs`, `rod_type`, `lure_type`, `comment`) VALUES (2, 1, 3, 6, 2.2, 'fly 8 ft 6 in', 'Hoppers/Stimulators/GoldenStone nymph', 'Caught mid afternoon, on a hot day with no wind');

COMMIT;


-- -----------------------------------------------------
-- Data for table `location_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `cofishdb`;
INSERT INTO `location_comment` (`id`, `location_id`, `user_profile_id`, `comment_date`, `comment_text`) VALUES (1, 1, 1, '2019-07-16 11:30', 'That was wild y\'all');

COMMIT;


-- -----------------------------------------------------
-- Data for table `rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `cofishdb`;
INSERT INTO `rating` (`user_profile_id`, `location_id`, `rating_date`, `rating`) VALUES (1, 1, '2019-07-16 11:30', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `favorite_location`
-- -----------------------------------------------------
START TRANSACTION;
USE `cofishdb`;
INSERT INTO `favorite_location` (`user_profile_id`, `location_id`) VALUES (1, 1);
INSERT INTO `favorite_location` (`user_profile_id`, `location_id`) VALUES (1, 3);
INSERT INTO `favorite_location` (`user_profile_id`, `location_id`) VALUES (1, 5);
INSERT INTO `favorite_location` (`user_profile_id`, `location_id`) VALUES (1, 7);
INSERT INTO `favorite_location` (`user_profile_id`, `location_id`) VALUES (1, 8);
INSERT INTO `favorite_location` (`user_profile_id`, `location_id`) VALUES (1, 20);
INSERT INTO `favorite_location` (`user_profile_id`, `location_id`) VALUES (1, 35);

COMMIT;

