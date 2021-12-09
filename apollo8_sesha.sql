-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 08, 2021 at 05:57 PM
-- Server version: 10.1.48-MariaDB-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apollo8_sesha`
--
CREATE DATABASE IF NOT EXISTS `apollo8_sesha` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `apollo8_sesha`;

-- --------------------------------------------------------

--
-- Table structure for table `allUsers`
--

CREATE TABLE `allUsers` (
  `userID` int(11) NOT NULL COMMENT 'What we track in the system',
  `email` text NOT NULL COMMENT 'How we link to oauth',
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- Error reading data for table apollo8_sesha.allUsers: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `apollo8_sesha`.`allUsers`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `categoryLinks`
--

CREATE TABLE `categoryLinks` (
  `categoryID` int(11) NOT NULL,
  `courseID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- Error reading data for table apollo8_sesha.categoryLinks: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `apollo8_sesha`.`categoryLinks`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `categoryName`
--

CREATE TABLE `categoryName` (
  `categoryID` int(11) NOT NULL,
  `categoryText` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- Error reading data for table apollo8_sesha.categoryName: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `apollo8_sesha`.`categoryName`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `codesChart`
--

CREATE TABLE `codesChart` (
  `code` varchar(16) NOT NULL,
  `courseID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- Error reading data for table apollo8_sesha.codesChart: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `apollo8_sesha`.`codesChart`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `courseContent`
--

CREATE TABLE `courseContent` (
  `contentID` int(11) NOT NULL,
  `sectionID` int(11) DEFAULT NULL,
  `courseID` int(11) NOT NULL,
  `mainContentType` int(10) UNSIGNED NOT NULL,
  `mainContentURL` varchar(2083) NOT NULL,
  `mainContentName` varchar(128) NOT NULL,
  `contentDesc` text,
  `extraType` int(11) DEFAULT NULL,
  `extraURL` varchar(2083) DEFAULT NULL,
  `extraName` varchar(128) DEFAULT NULL,
  `contentOrder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- Error reading data for table apollo8_sesha.courseContent: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `apollo8_sesha`.`courseContent`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `courseOwnership`
--

CREATE TABLE `courseOwnership` (
  `userID` int(11) NOT NULL,
  `courseID` int(11) NOT NULL,
  `purchaseDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `accessDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- Error reading data for table apollo8_sesha.courseOwnership: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `apollo8_sesha`.`courseOwnership`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `courseID` int(11) NOT NULL,
  `courseName` varchar(256) NOT NULL,
  `logoImageURL` varchar(2083) NOT NULL,
  `previewImageURL` varchar(2083) NOT NULL DEFAULT 'https://weave.cs.nmt.edu/apollo8/endpoint/resources/images/default.jpg',
  `previewVideoURL` varchar(2083) NOT NULL,
  `bookImageURL` varchar(2083) DEFAULT NULL,
  `bookDescription` text,
  `courseDescription` text,
  `faviconURL` varchar(2083) DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- Error reading data for table apollo8_sesha.courses: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `apollo8_sesha`.`courses`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `courseSections`
--

CREATE TABLE `courseSections` (
  `sectionID` int(11) NOT NULL,
  `courseID` int(11) NOT NULL,
  `sectionName` text NOT NULL,
  `sectionOrder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- Error reading data for table apollo8_sesha.courseSections: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `apollo8_sesha`.`courseSections`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `courseSkills`
--

CREATE TABLE `courseSkills` (
  `skillID` int(11) NOT NULL,
  `courseID` int(11) NOT NULL,
  `skillText` varchar(2056) NOT NULL,
  `skillOrder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- Error reading data for table apollo8_sesha.courseSkills: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `apollo8_sesha`.`courseSkills`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `courseID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `reviewText` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- Error reading data for table apollo8_sesha.reviews: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `apollo8_sesha`.`reviews`' at line 1

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allUsers`
--
ALTER TABLE `allUsers`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `categoryLinks`
--
ALTER TABLE `categoryLinks`
  ADD PRIMARY KEY (`categoryID`,`courseID`),
  ADD KEY `courseID` (`courseID`);

--
-- Indexes for table `categoryName`
--
ALTER TABLE `categoryName`
  ADD PRIMARY KEY (`categoryID`),
  ADD UNIQUE KEY `catagoryName` (`categoryText`);

--
-- Indexes for table `codesChart`
--
ALTER TABLE `codesChart`
  ADD PRIMARY KEY (`code`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `courseID` (`courseID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `courseContent`
--
ALTER TABLE `courseContent`
  ADD PRIMARY KEY (`contentID`),
  ADD KEY `sectionID` (`sectionID`),
  ADD KEY `courseID` (`courseID`);

--
-- Indexes for table `courseOwnership`
--
ALTER TABLE `courseOwnership`
  ADD PRIMARY KEY (`userID`,`courseID`),
  ADD KEY `courseID` (`courseID`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`courseID`);

--
-- Indexes for table `courseSections`
--
ALTER TABLE `courseSections`
  ADD PRIMARY KEY (`sectionID`),
  ADD KEY `courseID` (`courseID`);

--
-- Indexes for table `courseSkills`
--
ALTER TABLE `courseSkills`
  ADD PRIMARY KEY (`skillID`),
  ADD KEY `courseID` (`courseID`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`courseID`,`userID`),
  ADD KEY `userID` (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allUsers`
--
ALTER TABLE `allUsers`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'What we track in the system', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `categoryName`
--
ALTER TABLE `categoryName`
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `courseContent`
--
ALTER TABLE `courseContent`
  MODIFY `contentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1311;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `courseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `courseSections`
--
ALTER TABLE `courseSections`
  MODIFY `sectionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `courseSkills`
--
ALTER TABLE `courseSkills`
  MODIFY `skillID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categoryLinks`
--
ALTER TABLE `categoryLinks`
  ADD CONSTRAINT `categoryLinks_ibfk_1` FOREIGN KEY (`courseID`) REFERENCES `courses` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `categoryLinks_ibfk_2` FOREIGN KEY (`categoryID`) REFERENCES `categoryName` (`categoryID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `codesChart`
--
ALTER TABLE `codesChart`
  ADD CONSTRAINT `codesChart_ibfk_1` FOREIGN KEY (`courseID`) REFERENCES `courses` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `codesChart_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `allUsers` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `courseContent`
--
ALTER TABLE `courseContent`
  ADD CONSTRAINT `courseContent_ibfk_1` FOREIGN KEY (`sectionID`) REFERENCES `courseSections` (`sectionID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `courseContent_ibfk_2` FOREIGN KEY (`courseID`) REFERENCES `courses` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `courseOwnership`
--
ALTER TABLE `courseOwnership`
  ADD CONSTRAINT `courseOwnership_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `allUsers` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `courseOwnership_ibfk_2` FOREIGN KEY (`courseID`) REFERENCES `courses` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `courseSections`
--
ALTER TABLE `courseSections`
  ADD CONSTRAINT `courseSections_ibfk_1` FOREIGN KEY (`courseID`) REFERENCES `courses` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `courseSkills`
--
ALTER TABLE `courseSkills`
  ADD CONSTRAINT `courseSkills_ibfk_1` FOREIGN KEY (`courseID`) REFERENCES `courses` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `allUsers` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`courseID`) REFERENCES `courses` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
