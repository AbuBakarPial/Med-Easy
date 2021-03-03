-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2020 at 01:33 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medicine`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_drug`
--

CREATE TABLE `tbl_drug` (
  `id` int(11) NOT NULL,
  `drug_name` varchar(255) NOT NULL,
  `drug_use` longtext NOT NULL,
  `indication` longtext NOT NULL,
  `contraindication` longtext NOT NULL,
  `dosage` longtext NOT NULL,
  `drug_usage` longtext NOT NULL,
  `precaution` longtext NOT NULL,
  `side_effect` longtext NOT NULL,
  `warning` longtext NOT NULL,
  `storage_condition` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_drug`
--

INSERT INTO `tbl_drug` (`id`, `drug_name`, `drug_use`, `indication`, `contraindication`, `dosage`, `drug_usage`, `precaution`, `side_effect`, `warning`, `storage_condition`) VALUES
(1, 'napa', 'Napa is a non-opiate, Napa and antipyretic, prescribed for headache, pain (muscle ache, backache) and fever either alone or combined with other medications.', 'Napa is a non-opiate, Napa and antipyretic, prescribed for headache, pain (muscle ache, backache) and fever either alone or combined with other medications.  It changes the way the body senses pain and cools the body.', 'Hypersensitivity.', 'Adults: 0.5-1gm, 3-6 times daily max 4gm. Children: 15mg/kg/dose or 60mg/kg/24hr divided every 6 hrs. Maximum 5 doses SOS.', 'It comes as a tablet and liquid to take by mouth, with or without food.', 'Caution should be exercised in patients with history of asthma, bleeding problems, growths in the nose, heart, kidney or liver disease, liver inflammation, high blood pressure, chickenpox, anxiety, trouble in sleeping, ulcers, stomach problems, stroke, Kawasaki syndrome, any allergy, who are taking other medications, during pregnancy and breastfeeding.\r\nAvoid alcohol consumption.\r\nIt should not be used in children with infections such as flu, chickenpox or viral infections.\r\nAvoid large amount of caffeinated beverages while taking Napa.\r\nIt may reduce platelet counts; avoid injury or bruising.', 'Nausea, stomach upset, skin rash, acute toxicity may result in liver failure.', 'Avoid excess dosage.', 'Store it at room temperature.\r\n<b>Active ingredients:</b> <a href=\"/?s=paracetamol\">Paracetamol</a>'),
(2, 'Sergel', 'Sergel', 'Sergel', 'Sergel', 'Sergel', 'Sergel', 'Sergel', 'Sergel', 'Sergel', 'Sergel');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_drug`
--
ALTER TABLE `tbl_drug`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_drug`
--
ALTER TABLE `tbl_drug`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
