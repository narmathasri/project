-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.1.58-community - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for bookrecommendation
CREATE DATABASE IF NOT EXISTS `bookrecommendation` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bookrecommendation`;


-- Dumping structure for table bookrecommendation.arm
CREATE TABLE IF NOT EXISTS `arm` (
  `BID` varchar(50) DEFAULT NULL,
  `Sup` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table bookrecommendation.arm: ~11 rows (approximately)
/*!40000 ALTER TABLE `arm` DISABLE KEYS */;
INSERT INTO `arm` (`BID`, `Sup`) VALUES
	('B-2', '1'),
	('B-5', '0.667'),
	('B-6', '0.667'),
	('B-4', '0.333'),
	('B-5 , B-6 ', '0.333'),
	('B-2 , B-4 ', '0.333'),
	('B-2 , B-6 ', '0.667'),
	('B-2 , B-5 ', '0.667'),
	('B-6 , B-4 ', '0.333'),
	('B-2 , B-5 , B-6 ', '0.333'),
	('B-2 , B-6 , B-4 ', '0.333');
/*!40000 ALTER TABLE `arm` ENABLE KEYS */;


-- Dumping structure for table bookrecommendation.book
CREATE TABLE IF NOT EXISTS `book` (
  `BookId` varchar(50) DEFAULT NULL,
  `BookName` varchar(5000) DEFAULT NULL,
  `CateId` varchar(5000) DEFAULT NULL,
  `SubCateId` varchar(5000) DEFAULT NULL,
  `Author` varchar(5000) DEFAULT NULL,
  `Publisher` varchar(5000) DEFAULT NULL,
  `Price` varchar(5000) DEFAULT NULL,
  `Edition` varchar(5000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table bookrecommendation.book: ~7 rows (approximately)
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` (`BookId`, `BookName`, `CateId`, `SubCateId`, `Author`, `Publisher`, `Price`, `Edition`) VALUES
	('B-1', 'Introduction to Data Mining', 'Computer', 'Database management system', 'Vipin Kumar , Michael Steinbach , Pang Ning Tan ', 'Addison Wesley Longman', '1000', 'Hardcover'),
	('B-2', 'Oracle Database 11g Pl/SQL Programming', 'Computer', 'Database management system', '-', 'Tata Mcgraw Hill Education Private Limited', '1500', 'Paperback'),
	('B-3', 'Computer Networks', 'Computer', 'Networking', 'Andrew S Tanenbaum', 'PEARSON EDUCATION LIMITED', '213', 'Paperback'),
	('B-4', 'Network Security Essentials', 'Computer', 'Networking', '-', 'Pearson', '276', 'Paperback'),
	('B-5', 'Networks and Systems', 'Computer', 'Networking', 'Roy', 'New Age International', '221', 'Paperback'),
	('B-6', 'Organic Chemistry', 'Science', 'Chemistry', ' Jonathan Clayden , Nick Greeves , Stuart Warren ', 'Oxford University Press, USA', '2350', 'Paperback '),
	('B-7', 'General Chemistry', 'Science', 'Chemistry', 'Linus Pauling', 'Dover Publications', '1000', 'Paperback');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;


-- Dumping structure for table bookrecommendation.category
CREATE TABLE IF NOT EXISTS `category` (
  `CateId` varchar(50) DEFAULT NULL,
  `CateName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table bookrecommendation.category: ~0 rows (approximately)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;


-- Dumping structure for table bookrecommendation.itemsimilarity
CREATE TABLE IF NOT EXISTS `itemsimilarity` (
  `Item1` varchar(50) DEFAULT NULL,
  `Item2` varchar(50) DEFAULT NULL,
  `ItemSim` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table bookrecommendation.itemsimilarity: ~6 rows (approximately)
/*!40000 ALTER TABLE `itemsimilarity` DISABLE KEYS */;
INSERT INTO `itemsimilarity` (`Item1`, `Item2`, `ItemSim`) VALUES
	('B-2', 'B-5', '0.857'),
	('B-2', 'B-6', '-1'),
	('B-2', 'B-4', '-1'),
	('B-5', 'B-6', '-1'),
	('B-5', 'B-4', '-1'),
	('B-6', 'B-4', '-1');
/*!40000 ALTER TABLE `itemsimilarity` ENABLE KEYS */;


-- Dumping structure for table bookrecommendation.login
CREATE TABLE IF NOT EXISTS `login` (
  `UserName` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `Gender` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Mobile` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table bookrecommendation.login: ~4 rows (approximately)
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` (`UserName`, `Password`, `Gender`, `Email`, `Mobile`) VALUES
	('aaa', 'aaa', 'male', 'aaa@gmail.com', '8912345678'),
	('bbb', 'bbb', 'male', 'bbb@gmail.com', '4759848580'),
	('ccc', 'ccc', 'female', 'ccc@gmail.com', '9034897812'),
	('raja', 'raja', 'male', 'raja@gmail.com', '8712347890');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;


-- Dumping structure for table bookrecommendation.purchase
CREATE TABLE IF NOT EXISTS `purchase` (
  `UserName` varchar(50) DEFAULT NULL,
  `Date` varchar(50) DEFAULT NULL,
  `BID` varchar(50) DEFAULT NULL,
  `UserRating` varchar(50) DEFAULT NULL,
  `Quantity` varchar(50) DEFAULT NULL,
  `Amount` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table bookrecommendation.purchase: ~8 rows (approximately)
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` (`UserName`, `Date`, `BID`, `UserRating`, `Quantity`, `Amount`) VALUES
	('aaa', '24-0-2015', 'B-2', '4', '1', '1500'),
	('aaa', '24-0-2015', 'B-5', '2', '2', '442'),
	('bbb', '24-0-2015', 'B-6', '4', '1', '2350'),
	('bbb', '24-0-2015', 'B-2', '2', '1', '1500'),
	('bbb', '24-0-2015', 'B-4', '2', '1', '276'),
	('ccc', '24-0-2015', 'B-2', '5', '1', '1500'),
	('ccc', '24-0-2015', 'B-5', '3', '1', '221'),
	('aaa', '24-0-2015', 'B-6', '4', '1', '2350');
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;


-- Dumping structure for table bookrecommendation.recommend
CREATE TABLE IF NOT EXISTS `recommend` (
  `BID` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table bookrecommendation.recommend: ~4 rows (approximately)
/*!40000 ALTER TABLE `recommend` DISABLE KEYS */;
INSERT INTO `recommend` (`BID`) VALUES
	('B-6'),
	('B-2'),
	('B-5'),
	('B-4');
/*!40000 ALTER TABLE `recommend` ENABLE KEYS */;


-- Dumping structure for table bookrecommendation.sample1
CREATE TABLE IF NOT EXISTS `sample1` (
  `UserName` varchar(50) DEFAULT NULL,
  `Date` varchar(50) DEFAULT NULL,
  `BID` varchar(50) DEFAULT NULL,
  `Quantity` varchar(50) DEFAULT NULL,
  `Amount` varchar(50) DEFAULT NULL,
  `UserRating` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table bookrecommendation.sample1: ~0 rows (approximately)
/*!40000 ALTER TABLE `sample1` DISABLE KEYS */;
INSERT INTO `sample1` (`UserName`, `Date`, `BID`, `Quantity`, `Amount`, `UserRating`) VALUES
	('aaa', '24-0-2015', 'B-2', '1', '1500', 'VeryGood'),
	('aaa', '24-0-2015', 'B-5', '2', '442', 'Fair'),
	('bbb', '24-0-2015', 'B-6', '1', '2350', 'VeryGood'),
	('bbb', '24-0-2015', 'B-2', '1', '1500', 'Fair'),
	('bbb', '24-0-2015', 'B-4', '1', '276', 'Fair'),
	('ccc', '24-0-2015', 'B-2', '1', '1500', 'Excellent'),
	('ccc', '24-0-2015', 'B-5', '1', '221', 'Good'),
	('aaa', '24-0-2015', 'B-6', '1', '2350', 'VeryGood');
/*!40000 ALTER TABLE `sample1` ENABLE KEYS */;


-- Dumping structure for table bookrecommendation.userrating
CREATE TABLE IF NOT EXISTS `userrating` (
  `BID` varchar(50) DEFAULT NULL,
  `rate` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table bookrecommendation.userrating: ~4 rows (approximately)
/*!40000 ALTER TABLE `userrating` DISABLE KEYS */;
INSERT INTO `userrating` (`BID`, `rate`) VALUES
	('B-2', '3.667'),
	('B-5', '2.5'),
	('B-6', '4'),
	('B-4', '2');
/*!40000 ALTER TABLE `userrating` ENABLE KEYS */;


-- Dumping structure for table bookrecommendation.usersimilarity
CREATE TABLE IF NOT EXISTS `usersimilarity` (
  `User1` varchar(50) DEFAULT NULL,
  `User2` varchar(50) DEFAULT NULL,
  `UserSim` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table bookrecommendation.usersimilarity: ~3 rows (approximately)
/*!40000 ALTER TABLE `usersimilarity` DISABLE KEYS */;
INSERT INTO `usersimilarity` (`User1`, `User2`, `UserSim`) VALUES
	('aaa', 'bbb', '0.316'),
	('aaa', 'ccc', '0.949'),
	('bbb', 'ccc', '-1');
/*!40000 ALTER TABLE `usersimilarity` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
