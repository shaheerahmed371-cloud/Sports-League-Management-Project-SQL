-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2025 at 01:46 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sports_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `Event_ID` int(11) NOT NULL,
  `Event_Name` varchar(215) NOT NULL,
  `TYPE` varchar(215) DEFAULT NULL,
  `Start_Date` date NOT NULL,
  `End_Date` date NOT NULL,
  `Status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`Event_ID`, `Event_Name`, `TYPE`, `Start_Date`, `End_Date`, `Status`) VALUES
(1, 'Annual Sports Week', 'University', '2024-02-01', '2024-02-07', 'Scheduled'),
(2, 'Cricket Championship', 'Tournament', '2024-03-15', '2024-03-20', 'Scheduled'),
(3, 'Football League', 'Tournament', '2024-04-10', '2024-04-15', 'Completed'),
(4, 'Basketball Competition', 'Knockout', '2024-05-05', '2024-05-10', 'Scheduled'),
(5, 'Athletics Meet', 'University', '2024-06-01', '2024-06-03', 'Scheduled');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `Location_ID` int(11) NOT NULL,
  `Location_Name` varchar(255) NOT NULL,
  `Capacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`Location_ID`, `Location_Name`, `Capacity`) VALUES
(1, 'Basketball Ground', 500),
(2, 'Cricket Ground', 2000),
(3, 'Football Ground', 1500),
(4, 'Indoor Gym', 300),
(5, 'Athletics Track', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `officials`
--

CREATE TABLE `officials` (
  `Official_ID` int(11) NOT NULL,
  `Role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `officials`
--

INSERT INTO `officials` (`Official_ID`, `Role`) VALUES
(1, 'Referee'),
(2, 'Umpire'),
(3, 'Coach'),
(4, 'Assistant Referee'),
(5, 'Event Manager');

-- --------------------------------------------------------

--
-- Table structure for table `official_subevent`
--

CREATE TABLE `official_subevent` (
  `Official_ID` int(11) NOT NULL,
  `SubEvent_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `official_subevent`
--

INSERT INTO `official_subevent` (`Official_ID`, `SubEvent_ID`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `Player_ID` int(11) NOT NULL,
  `Player_Name` varchar(255) NOT NULL,
  `Position` varchar(100) DEFAULT NULL,
  `Team_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`Player_ID`, `Player_Name`, `Position`, `Team_ID`) VALUES
(1, 'Ali Khan', 'Forward', 1),
(2, 'Ahmed Raza', 'Bowler', 2),
(3, 'Sara Malik', 'Midfielder', 3),
(4, 'Zainab Tariq', 'Defender', 4),
(5, 'Usman Javed', 'Runner', 5);

-- --------------------------------------------------------

--
-- Table structure for table `player_subevent`
--

CREATE TABLE `player_subevent` (
  `SubEvent_ID` int(11) NOT NULL,
  `Player_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_subevent`
--

INSERT INTO `player_subevent` (`SubEvent_ID`, `Player_ID`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `qualification_criteria`
--

CREATE TABLE `qualification_criteria` (
  `Criteria_ID` int(11) NOT NULL,
  `Description` text NOT NULL,
  `Sport_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `qualification_criteria`
--

INSERT INTO `qualification_criteria` (`Criteria_ID`, `Description`, `Sport_ID`) VALUES
(1, 'Top 2 teams qualify for the final', 1),
(2, 'Top 4 teams qualify for the semifinals', 2),
(3, 'League matches determine qualifiers', 3),
(4, 'Knockout matches determine finalists', 4),
(5, 'Time-based performance determines winners', 5);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `Schedule_ID` int(11) NOT NULL,
  `Time` time NOT NULL,
  `Date` date NOT NULL,
  `SubEvent_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`Schedule_ID`, `Time`, `Date`, `SubEvent_ID`) VALUES
(1, '10:00:00', '2024-02-03', 1),
(2, '14:00:00', '2024-03-20', 2),
(3, '16:00:00', '2024-04-10', 3),
(4, '12:00:00', '2024-05-06', 4),
(5, '09:00:00', '2024-06-01', 5);

-- --------------------------------------------------------

--
-- Table structure for table `sport`
--

CREATE TABLE `sport` (
  `Sport_ID` int(11) NOT NULL,
  `Sport_Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sport`
--

INSERT INTO `sport` (`Sport_ID`, `Sport_Name`) VALUES
(5, 'Athletics'),
(4, 'Badminton'),
(1, 'Basketball'),
(2, 'Cricket'),
(3, 'Football');

-- --------------------------------------------------------

--
-- Table structure for table `sport_rules`
--

CREATE TABLE `sport_rules` (
  `Rule_ID` int(11) NOT NULL,
  `Description` text NOT NULL,
  `Sport_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sport_rules`
--

INSERT INTO `sport_rules` (`Rule_ID`, `Description`, `Sport_ID`) VALUES
(1, 'Each match lasts 4 quarters of 10 minutes', 1),
(2, 'Matches consist of 10 overs per team', 2),
(3, 'Each Team has 11 players on the field', 3),
(4, 'Matches are best of 3 sets', 4),
(5, 'Time determines winner for races', 5);

-- --------------------------------------------------------

--
-- Table structure for table `subevent`
--

CREATE TABLE `subevent` (
  `SubEvent_ID` int(11) NOT NULL,
  `SubEvent_Name` varchar(255) NOT NULL,
  `Scheduled_Date` date NOT NULL,
  `Result` varchar(255) DEFAULT NULL,
  `Event_ID` int(11) NOT NULL,
  `Sport_ID` int(11) NOT NULL,
  `Location_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subevent`
--

INSERT INTO `subevent` (`SubEvent_ID`, `SubEvent_Name`, `Scheduled_Date`, `Result`, `Event_ID`, `Sport_ID`, `Location_ID`) VALUES
(1, 'Basketball Semifinal', '2024-02-03', NULL, 1, 1, 1),
(2, 'Cricket Final', '2024-03-20', 'Team A Won', 2, 2, 2),
(3, 'Football Match 1', '2024-04-10', 'Draw', 3, 3, 3),
(4, 'Badminton Round 1', '2024-05-06', NULL, 4, 4, 4),
(5, '100m Sprint', '2024-06-01', 'Runner A Won', 5, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `Team_ID` int(11) NOT NULL,
  `Team_Name` varchar(255) NOT NULL,
  `Department` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`Team_ID`, `Team_Name`, `Department`) VALUES
(1, 'CUST Eagles', 'Computer Science'),
(2, 'CUST Lions', 'Electrical Engineering'),
(3, 'CUST Tigers', 'Business Administration'),
(4, 'CUST Panthers', 'Mechanical Engineering'),
(5, 'CUST Falcons', 'Civil Engineering');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`Event_ID`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`Location_ID`);

--
-- Indexes for table `officials`
--
ALTER TABLE `officials`
  ADD PRIMARY KEY (`Official_ID`);

--
-- Indexes for table `official_subevent`
--
ALTER TABLE `official_subevent`
  ADD PRIMARY KEY (`Official_ID`,`SubEvent_ID`),
  ADD KEY `SubEvent_ID` (`SubEvent_ID`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`Player_ID`),
  ADD KEY `Team_ID` (`Team_ID`);

--
-- Indexes for table `player_subevent`
--
ALTER TABLE `player_subevent`
  ADD PRIMARY KEY (`SubEvent_ID`,`Player_ID`),
  ADD KEY `Player_ID` (`Player_ID`);

--
-- Indexes for table `qualification_criteria`
--
ALTER TABLE `qualification_criteria`
  ADD PRIMARY KEY (`Criteria_ID`),
  ADD KEY `Sport_ID` (`Sport_ID`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`Schedule_ID`),
  ADD KEY `SubEvent_ID` (`SubEvent_ID`);

--
-- Indexes for table `sport`
--
ALTER TABLE `sport`
  ADD PRIMARY KEY (`Sport_ID`),
  ADD UNIQUE KEY `Sport_Name` (`Sport_Name`);

--
-- Indexes for table `sport_rules`
--
ALTER TABLE `sport_rules`
  ADD PRIMARY KEY (`Rule_ID`),
  ADD KEY `Sport_ID` (`Sport_ID`);

--
-- Indexes for table `subevent`
--
ALTER TABLE `subevent`
  ADD PRIMARY KEY (`SubEvent_ID`),
  ADD KEY `Event_ID` (`Event_ID`),
  ADD KEY `Sport_ID` (`Sport_ID`),
  ADD KEY `Location_ID` (`Location_ID`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`Team_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `Location_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `officials`
--
ALTER TABLE `officials`
  MODIFY `Official_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `player`
--
ALTER TABLE `player`
  MODIFY `Player_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `qualification_criteria`
--
ALTER TABLE `qualification_criteria`
  MODIFY `Criteria_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `Schedule_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sport`
--
ALTER TABLE `sport`
  MODIFY `Sport_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sport_rules`
--
ALTER TABLE `sport_rules`
  MODIFY `Rule_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subevent`
--
ALTER TABLE `subevent`
  MODIFY `SubEvent_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `Team_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `official_subevent`
--
ALTER TABLE `official_subevent`
  ADD CONSTRAINT `official_subevent_ibfk_1` FOREIGN KEY (`Official_ID`) REFERENCES `officials` (`Official_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `official_subevent_ibfk_2` FOREIGN KEY (`SubEvent_ID`) REFERENCES `subevent` (`SubEvent_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `player_ibfk_1` FOREIGN KEY (`Team_ID`) REFERENCES `team` (`Team_ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `player_subevent`
--
ALTER TABLE `player_subevent`
  ADD CONSTRAINT `player_subevent_ibfk_1` FOREIGN KEY (`SubEvent_ID`) REFERENCES `subevent` (`SubEvent_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `player_subevent_ibfk_2` FOREIGN KEY (`Player_ID`) REFERENCES `player` (`Player_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `qualification_criteria`
--
ALTER TABLE `qualification_criteria`
  ADD CONSTRAINT `qualification_criteria_ibfk_1` FOREIGN KEY (`Sport_ID`) REFERENCES `sport` (`Sport_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`SubEvent_ID`) REFERENCES `subevent` (`SubEvent_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sport_rules`
--
ALTER TABLE `sport_rules`
  ADD CONSTRAINT `sport_rules_ibfk_1` FOREIGN KEY (`Sport_ID`) REFERENCES `sport` (`Sport_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subevent`
--
ALTER TABLE `subevent`
  ADD CONSTRAINT `subevent_ibfk_1` FOREIGN KEY (`Event_ID`) REFERENCES `event` (`Event_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subevent_ibfk_2` FOREIGN KEY (`Sport_ID`) REFERENCES `sport` (`Sport_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subevent_ibfk_3` FOREIGN KEY (`Location_ID`) REFERENCES `location` (`Location_ID`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
