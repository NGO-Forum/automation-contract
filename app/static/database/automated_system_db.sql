-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2025 at 03:54 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `automated_system_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `alembic_version`
--

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alembic_version`
--

INSERT INTO `alembic_version` (`version_num`) VALUES
('5516e82be46a');

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

CREATE TABLE `contracts` (
  `id` varchar(36) NOT NULL,
  `project_title` varchar(255) NOT NULL,
  `contract_number` varchar(50) NOT NULL,
  `party_b_full_name_with_title` varchar(255) DEFAULT NULL,
  `party_b_address` text DEFAULT NULL,
  `party_b_phone` varchar(20) DEFAULT NULL,
  `party_b_email` varchar(100) DEFAULT NULL,
  `registration_number` varchar(50) DEFAULT NULL,
  `registration_date` varchar(50) DEFAULT NULL,
  `agreement_start_date` varchar(50) DEFAULT NULL,
  `agreement_end_date` varchar(50) DEFAULT NULL,
  `total_fee_usd` decimal(10,2) DEFAULT NULL,
  `gross_amount_usd` decimal(10,2) DEFAULT NULL,
  `tax_percentage` decimal(5,2) DEFAULT NULL,
  `payment_gross` varchar(50) DEFAULT NULL,
  `payment_net` varchar(50) DEFAULT NULL,
  `workshop_description` varchar(255) DEFAULT NULL,
  `party_a_signature_name` varchar(100) DEFAULT NULL,
  `party_b_signature_name` varchar(100) DEFAULT NULL,
  `party_b_position` varchar(100) DEFAULT NULL,
  `total_fee_words` text DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `deliverables` text DEFAULT NULL,
  `output_description` text DEFAULT NULL,
  `custom_article_sentences` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `payment_installments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `focal_person_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`focal_person_info`)),
  `party_a_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`party_a_info`)),
  `deduct_tax_code` varchar(50) DEFAULT NULL,
  `vat_organization_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contracts`
--

INSERT INTO `contracts` (`id`, `project_title`, `contract_number`, `party_b_full_name_with_title`, `party_b_address`, `party_b_phone`, `party_b_email`, `registration_number`, `registration_date`, `agreement_start_date`, `agreement_end_date`, `total_fee_usd`, `gross_amount_usd`, `tax_percentage`, `payment_gross`, `payment_net`, `workshop_description`, `party_a_signature_name`, `party_b_signature_name`, `party_b_position`, `total_fee_words`, `title`, `deliverables`, `output_description`, `custom_article_sentences`, `payment_installments`, `created_at`, `deleted_at`, `user_id`, `focal_person_info`, `party_a_info`, `deduct_tax_code`, `vat_organization_name`) VALUES
('07299214-1f54-49e7-9999-e5c5863ee20b', 'Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'NGOF/2025-007', 'Ms. CHAB Charyna', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+855 67408241', 'charyna.chab@student.passerellesnumeriques.org', '#304 សជណ', '07 March 2012', '2025-10-07', '2025-11-09', 1200.00, 1200.00, 0.00, '$1200.00 USD', '$1200.00 USD', '', 'Mr. SOEUNG Saroeun', 'Ms. CHAB Charyna', 'Freelance Consultant', 'One Thousand Two Hundred US Dollars only', '', 'Sign Agreement \r\nSubmit the draft outline \r\nSubmit the draft budget analysis to be submitted to NGOF \r\nSubmit the well  written and comprehensive analysis report based on the outcomes of the analysis. \r\nPresent analysis report in a multi-stakeholder workshop. \r\nSubmit invoice and receipt of the servic; Sign Agreement \r\nSubmit the draft outline \r\nSubmit the draft budget analysis to be submitted to NGOF \r\nSubmit the well  written and comprehensive analysis report based on the outcomes of the analysis. \r\nPresent analysis report in a multi-stakeholder workshop. \r\nSubmit invoice and receipt of the servic', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (50%)\", \"deliverables\": \"Sign Agreement \\r\\nSubmit the draft outline \\r\\nSubmit the draft budget analysis to be submitted to NGOF \\r\\nSubmit the well  written and comprehensive analysis report based on the outcomes of the analysis. \\r\\nPresent analysis report in a multi-stakeholder workshop. \\r\\nSubmit invoice and receipt of the servic\", \"dueDate\": \"2025-10-07\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #2 (50%)\", \"deliverables\": \"Sign Agreement \\r\\nSubmit the draft outline \\r\\nSubmit the draft budget analysis to be submitted to NGOF \\r\\nSubmit the well  written and comprehensive analysis report based on the outcomes of the analysis. \\r\\nPresent analysis report in a multi-stakeholder workshop. \\r\\nSubmit invoice and receipt of the servic\", \"dueDate\": \"2025-11-09\", \"organization\": \"The NGO Forum on Cambodia\"}]', '2025-10-07 10:00:58', NULL, 41, '[{\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}, {\"name\": \"Ms. OUM Somaly\", \"position\": \"SACHAS Program Manager\", \"phone\": \"081 647 963\", \"email\": \"somaly@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}]', 'K002-100054102', 'The NGO Forum on Cambodia'),
('12eea846-aae9-4368-a938-8205673eda08', 'Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'NGOF/2025-016', 'Mr. Kin Doung', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+85567408241', 'kin.doung@student.passerellesnumeriques.org', NULL, NULL, '2025-11-10', '2025-12-07', 1200.00, 1200.00, 10.00, '$1200.00 USD', '$1080.00 USD', '', 'Mr. SOEUNG Saroeun', 'Mr. Kin Doung', 'Freelance Consultant', 'One Thousand Two Hundred US Dollars only', '', '- Sign Agreement - Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF - Submit the well-written and comprehensive analysis report based on the outcomes of the analysis. - Present analysis report in a multi-stakeholder workshop. - Submit invoice and receipt of the service\r\n- Sign Agreement - Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF - Submit the well-written and comprehensive analysis report based on the outcomes of the analysis. - Present analysis report in a multi-stakeholder workshop. - Submit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (100%)\", \"deliverables\": \"- Sign Agreement - Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF - Submit the well-written and comprehensive analysis report based on the outcomes of the analysis. - Present analysis report in a multi-stakeholder workshop. - Submit invoice and receipt of the service\\r\\n- Sign Agreement - Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF - Submit the well-written and comprehensive analysis report based on the outcomes of the analysis. - Present analysis report in a multi-stakeholder workshop. - Submit invoice and receipt of the service\", \"dueDate\": \"2025-12-07\", \"organization\": \"The NGO Forum on Cambodia\"}]', '2025-11-10 00:30:53', NULL, 69, '[{\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}]', NULL, NULL),
('156ed08b-bdf6-490b-9eec-924b9cc97565', 'Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'NGOF/2025-013', 'Mr. Chhea Chhouy', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+855 67408241', 'chhea.chhouy@student.passerellesnumeriques.org', NULL, NULL, '2025-10-10', '2025-11-09', 1225.00, 1225.00, 0.00, '$1225.00 USD', '$1225.00 USD', '', 'Mr. SOEUNG Saroeun', 'Mr. Chhea Chhouy', 'Freelance Consultant', 'One Thousand Two Hundred Twenty Five US Dollars only', '', 'Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service; Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (50%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-10-10\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #2 (50%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-11-09\", \"organization\": \"Passerelles Numeriques Cambodia\"}]', '2025-10-10 07:41:31', NULL, 69, '[{\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}, {\"name\": \"Mr. SOM Chettana\", \"position\": \"Finance Operation Manager\", \"phone\": \"076 754 8888\", \"email\": \"chettana@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}, {\"organization\": \"Passerelles Numeriques Cambodia\", \"short_name\": \"PNC\", \"name\": \"Mr. Heng HeangBunna\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"06 March 2015\"}]', 'K002-100054102', 'The NGO Forum on Cambodia'),
('257d55d6-aba2-43fe-85c2-ba1f92fffa3a', 'Consultant for producing the video documentary to promote piloting SNR guideline in Ratanakiri Province.', 'NGOF/2025-012', 'Mr. Heng Dara', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+855 67408241', 'heng.dara@gmail.com', NULL, NULL, '2025-10-09', '2025-11-09', 1250.00, 1250.00, 15.00, '$1250.00 USD', '$1062.50 USD', '', 'Mr. SOEUNG Saroeun', 'Mr. Heng Dara', 'Freelance Consultant', 'One Thousand Two Hundred Fifty US Dollars only', '', 'Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (100%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-11-09\", \"organization\": \"The NGO Forum on Cambodia\"}]', '2025-10-09 04:00:20', NULL, 43, '[{\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}]', '', ''),
('42c79f53-be6c-4470-9ea0-05024d8c5abe', 'Consultant for producing the video documentary to promote piloting SNR guideline in Ratanakiri Province.', 'NGOF/2025-002', 'Ms. SOTH Channavy', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+85567408241', 'soth.channavy@gmail.com', '#304 សជណ', '07 March 2012', '2025-10-07', '2025-11-09', 1250.00, 1250.00, 10.00, '$1250.00 USD', '$1125.00 USD', '', 'Mr. SOEUNG Saroeun', 'Ms. SOTH Channavy', 'Freelance Consultant', 'One Thousand Two Hundred Fifty US Dollars only', '', 'Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service; Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (70%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-10-30\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #2 (30%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-11-09\", \"organization\": \"The NGO Forum on Cambodia\"}]', '2025-10-07 00:44:37', NULL, 69, '[{\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}]', NULL, NULL),
('45882072-d357-4154-a8ee-c845def15856', 'Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'NGOF/2025-003', 'Ms. AN Vannak', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+855 67408241', 'an.vannak@gmail.com', '#304 សជណ', '07 March 2012', '2025-10-07', '2025-11-09', 2500.00, 2500.00, 0.00, '$2500.00 USD', '$2500.00 USD', '', 'Mr. SOEUNG Saroeun', 'Ms. AN Vannak', 'Freelance Consultant', 'Two Thousand Five Hundred US Dollars only', '', 'Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service; Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service; Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (40%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-10-07\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #2 (30%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-10-19\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #3 (30%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-11-09\", \"organization\": \"The NGO Forum on Cambodia\"}]', '2025-10-07 00:47:00', NULL, 69, '[{\"name\": \"Mr. CHAN Vicheth\", \"position\": \"RITI Program Manager\", \"phone\": \"012 953 650\", \"email\": \"vicheth@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}]', 'K002-100054102', 'The NGO Forum on Cambodia'),
('4abf109b-784e-43ce-84e8-40c1caab0fdc', 'Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'NGOF/2025-015', 'Mr. Sokchea Boy', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+85567408241', 'sochea.boy@student.passerellesnumeriques.org', NULL, NULL, '2025-10-17', '2025-11-09', 1225.00, 1225.00, 10.00, '$1225.00 USD', '$1102.50 USD', '', 'Mr. SOEUNG Saroeun', 'Mr. Sokchea Boy', 'Freelance Consultant', 'One Thousand Two Hundred Twenty Five US Dollars only', '', '- Sign Agreement - Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF - Submit the well-written and comprehensive analysis report based on the outcomes of the analysis. - Present analysis report in a multi-stakeholder workshop. - Submit invoice and receipt of the service\r\n- Sign Agreement - Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF - Submit the well-written and comprehensive analysis report based on the outcomes of the analysis. - Present analysis report in a multi-stakeholder workshop. - Submit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (100%)\", \"deliverables\": \"- Sign Agreement - Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF - Submit the well-written and comprehensive analysis report based on the outcomes of the analysis. - Present analysis report in a multi-stakeholder workshop. - Submit invoice and receipt of the service\\r\\n- Sign Agreement - Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF - Submit the well-written and comprehensive analysis report based on the outcomes of the analysis. - Present analysis report in a multi-stakeholder workshop. - Submit invoice and receipt of the service\", \"dueDate\": \"2025-11-09\", \"organization\": \"The NGO Forum on Cambodia\"}]', '2025-10-17 09:26:51', NULL, 76, '[{\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}]', '', ''),
('5191004d-699c-435c-80cb-b5dd85226747', 'Consultant for producing the video documentary to promote piloting SNR guideline in Ratanakiri Province.', 'NGOF/2025-014', 'Mr. Kin Doung', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+85567408241', 'kin.doung@gmail.com', NULL, NULL, '2025-10-10', '2025-11-09', 3500.00, 3500.00, 0.00, '$3500.00 USD', '$3500.00 USD', '', 'Mr. SOEUNG Saroeun', 'Mr. Kin Doung', 'Freelance Consultant', 'Three Thousand Five Hundred US Dollars only', '', 'Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (100%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-11-09\", \"organization\": \"The NGO Forum on Cambodia\"}]', '2025-10-10 06:21:36', '2025-10-10 13:55:16', 42, '[{\"name\": \"Ms. OUM Somaly\", \"position\": \"SACHAS Program Manager\", \"phone\": \"081 647 963\", \"email\": \"somaly@ngoforum.org.kh\"}, {\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}]', 'K002-100054102', 'The NGO Forum on Cambodia'),
('5692d227-d305-4ca6-a646-1e9c8d64bcd1', 'Consultant for producing the video documentary to promote piloting SNR guideline in Ratanakiri Province.', 'NGOF/2025-014', 'Mr. Kin Doung', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+85567408241', 'kin.doung@gmail.com', NULL, NULL, '2025-10-17', '2025-11-09', 1225.00, 1225.00, 15.00, '$1225.00 USD', '$1041.25 USD', '', 'Mr. SOEUNG Saroeun', 'Mr. Kin Doung', 'Freelance Consultant', 'One Thousand Two Hundred Twenty Five US Dollars only', '', 'Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (100%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-11-09\", \"organization\": \"The NGO Forum on Cambodia\"}]', '2025-10-17 09:01:32', '2025-11-10 07:29:24', 69, '[{\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}]', NULL, NULL),
('6172338f-0cf2-4b3d-936e-649b80d3a034', 'Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'NGOF/2025-013', 'Mr. Chhea Chhouy', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+855 67408241', 'chhea.chhouy@student.passerellesnumeriques.org', NULL, NULL, '2025-10-10', '2025-11-09', 1225.00, 1225.00, 15.00, '$1225.00 USD', '$1041.25 USD', '', 'Mr. SOEUNG Saroeun', 'Mr. Chhea Chhouy', 'Freelance Consultant', 'One Thousand Two Hundred Twenty Five US Dollars only', '', 'Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (100%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-11-09\", \"organization\": \"The NGO Forum on Cambodia\"}]', '2025-10-10 06:20:40', '2025-10-10 13:55:22', 42, '[{\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}]', NULL, NULL),
('717bc7d6-d045-4d8a-9093-f7e37be16046', 'Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'NGOF/2025-005', 'Mr. Chhea Chhouy', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+855 67408241', 'chhea.chhouy@student.passerellesnumeriques.org', '#304 សជណ', '07 March 2012', '2025-10-07', '2025-11-09', 1225.00, 1225.00, 15.00, '$1225.00 USD', '$1041.25 USD', '', 'Mr. SOEUNG Saroeun', 'Mr. Chhea Chhouy', 'Freelance Consultant', 'One Thousand Two Hundred Twenty Five US Dollars only', '', 'Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service; Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service; Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (30%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-10-07\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #2 (30%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-10-26\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #3 (40%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-11-09\", \"organization\": \"Cooperation Committee for Cambodia\"}]', '2025-10-07 03:03:40', '2025-10-09 13:41:15', 69, '[{\"name\": \"Mr. SOM Chettana\", \"position\": \"Finance Operation Manager\", \"phone\": \"076 754 8888\", \"email\": \"chettana@ngoforum.org.kh\"}, {\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\"}, {\"organization\": \"Cooperation Committee for Cambodia\", \"name\": \"Ms. SIN Putheary\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\"}]', '', ''),
('7b0c47ec-7db1-4d5f-b410-f5d2397cdc15', 'Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'NGOF/2025-001', 'Mr. SEAN Bunrith', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+85567408241', 'Seanbunrith@gmail.com', '#304 សជណ', '07 March 2012', '2025-10-07', '2025-11-09', 2500.00, 2500.00, 15.00, '$2500.00 USD', '$2125.00 USD', '', 'Mr. SOEUNG Saroeun', 'Mr. SEAN Bunrith', 'Freelance Consultant', 'Two Thousand Five Hundred US Dollars only', '', 'Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\n Submit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (100%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\n Submit invoice and receipt of the service\", \"dueDate\": \"2025-11-09\", \"organization\": \"The NGO Forum on Cambodia\"}]', '2025-10-07 00:41:35', NULL, 69, '[{\"name\": \"Ms. OUM Somaly\", \"position\": \"SACHAS Program Manager\", \"phone\": \"081 647 963\", \"email\": \"somaly@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}]', NULL, NULL),
('a2a69d38-0299-4ce7-b562-3437a691e086', 'Consultant for producing the video documentary to promote piloting SNR guideline in Ratanakiri Province.', 'NGOF/2025-016', 'Mr. Kin Doung', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+85567408241', 'kin.doung@gmail.com', NULL, NULL, '2025-10-21', '2025-11-09', 1255.00, 1255.00, 15.00, '$1255.00 USD', '$1066.75 USD', '', 'Mr. SOEUNG Saroeun', 'Mr. Kin Doung', 'Freelance Consultant', 'One Thousand Two Hundred Fifty Five US Dollars only', '', 'Sign Agreement - Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF - Submit the well-written and comprehensive analysis report based on the outcomes of the analysis. - Present analysis report in a multi-stakeholder workshop. - Submit invoice and receipt of the service\r\nSign Agreement - Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF - Submit the well-written and comprehensive analysis report based on the outcomes of the analysis. - Present analysis report in a multi-stakeholder workshop. - Submit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (100%)\", \"deliverables\": \"Sign Agreement - Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF - Submit the well-written and comprehensive analysis report based on the outcomes of the analysis. - Present analysis report in a multi-stakeholder workshop. - Submit invoice and receipt of the service\\r\\nSign Agreement - Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF - Submit the well-written and comprehensive analysis report based on the outcomes of the analysis. - Present analysis report in a multi-stakeholder workshop. - Submit invoice and receipt of the service\", \"dueDate\": \"2025-11-09\", \"organization\": \"The NGO Forum on Cambodia\"}]', '2025-10-21 04:47:50', '2025-11-10 07:29:30', 69, '[{\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}, {\"name\": \"Ms. OUM Somaly\", \"position\": \"SACHAS Program Manager\", \"phone\": \"081 647 963\", \"email\": \"somaly@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}]', NULL, NULL),
('c2c5efdd-8603-4381-be92-29a44aa16b1c', 'Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'NGOF/2025-009', 'Mr. SEAN Bunrith', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+85567408241', 'Seanbunrith@gmail.com', '#304 សជណ', '07 March 2012', '2025-10-08', '2025-11-09', 3350.00, 3350.00, 15.00, '$3350.00 USD', '$2847.50 USD', '', 'Mr. SOEUNG Saroeun', 'Mr. SEAN Bunrith', 'Freelance Consultant', 'Three Thousand Three Hundred Fifty US Dollars only', '', 'Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service; Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service; Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.', 'Budget analysis for MAFF for the NGOF', '{\"16\": \"I want to add more for the article 16.\"}', '[{\"description\": \"Installment #1 (30%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-10-08\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #2 (30%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-10-25\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #3 (40%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\", \"dueDate\": \"2025-11-09\", \"organization\": \"The NGO Forum on Cambodia\"}]', '2025-10-08 00:44:29', '2025-10-10 13:55:38', 43, '[{\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}, {\"name\": \"Ms. OUM Somaly\", \"position\": \"SACHAS Program Manager\", \"phone\": \"081 647 963\", \"email\": \"somaly@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}]', NULL, NULL),
('d1e20d93-5eb4-4f1a-b844-fadc2236c40a', 'Consultant for producing the video documentary to promote piloting SNR guideline in Ratanakiri Province.', 'NGOF/2025-011', 'Ms. CHAB Charyna', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+855 67408241', 'charyna.chab@student.passerellesnumeriques.org', NULL, NULL, '2025-10-09', '2025-11-09', 1225.00, 1225.00, 0.00, '$1225.00 USD', '$1225.00 USD', '', 'Mr. SOEUNG Saroeun', 'Ms. CHAB Charyna', 'Freelance Consultant', 'One Thousand Two Hundred Twenty Five US Dollars only', '', 'Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service; Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service; Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (30%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-10-09\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #2 (30%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-10-26\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #3 (40%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-11-09\", \"organization\": \"Cooperation Committee for Cambodia\"}]', '2025-10-09 03:26:18', '2025-10-10 13:55:28', 69, '[{\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}, {\"name\": \"Ms. OUM Somaly\", \"position\": \"SACHAS Program Manager\", \"phone\": \"081 647 963\", \"email\": \"somaly@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}, {\"organization\": \"Cooperation Committee for Cambodia\", \"short_name\": \"CCC\", \"name\": \"Ms. SIN Putheary\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#406 \\u179f\\u1787\\u178e\", \"registration_date\": \"06 June 2017\"}]', 'K002-100054102', 'The NGO Forum on Cambodia'),
('d6d7d9b7-e37f-4cc6-b3af-c9491130f64f', 'Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'NGOF/2025-010', 'Mr. SEAN Bunrith', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+85567408241', 'Seanbunrith@gmail.com', '#304 សជណ', '07 March 2012', '2025-10-09', '2025-11-09', 1250.00, 1250.00, 0.00, '$1250.00 USD', '$1250.00 USD', '', 'Mr. SOEUNG Saroeun', 'Mr. SEAN Bunrith', 'Freelance Consultant', 'One Thousand Two Hundred Fifty US Dollars only', '', 'Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service; Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service; Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (30%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-10-09\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #2 (30%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-10-26\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #3 (40%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-11-09\", \"organization\": \"Cooperation Committee for Cambodia\"}]', '2025-10-09 02:09:43', '2025-10-10 13:55:35', 69, '[{\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}, {\"name\": \"Ms. OUM Somaly\", \"position\": \"SACHAS Program Manager\", \"phone\": \"081 647 963\", \"email\": \"somaly@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}, {\"organization\": \"Cooperation Committee for Cambodia\", \"short_name\": \"CCC\", \"name\": \"Ms. SIN Putheary\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}]', 'K002-100054102', 'The NGO Forum on Cambodia'),
('decb7841-b071-4740-98ba-86c885ff2c46', 'Consultant for producing the video documentary to promote piloting SNR guideline in Ratanakiri Province.', 'NGOF/2025-017', 'Mr. Darin Hoy', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+855 67408241', 'darin.hoy@student.passerellesnumeriques.org', NULL, NULL, '2025-11-11', '2025-12-07', 1500.00, 1500.00, 15.00, '$1500.00 USD', '$1275.00 USD', '', 'Mr. SOEUNG Saroeun', 'Mr. Darin Hoy', 'Freelance Consultant', 'One Thousand Five Hundred US Dollars only', '', 'Sign Agreement \r\n Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF \r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis. \r\n Present analysis report in a multi-stakeholder workshop. \r\nSubmit invoice and receipt of the service\r\n Sign Agreement - Submit the draft outline \r\nSubmit the draft budget analysis to be submitted to NGOF \r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop. \r\nSubmit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (100%)\", \"deliverables\": \"Sign Agreement \\r\\n Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF \\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis. \\r\\n Present analysis report in a multi-stakeholder workshop. \\r\\nSubmit invoice and receipt of the service\\r\\n Sign Agreement - Submit the draft outline \\r\\nSubmit the draft budget analysis to be submitted to NGOF \\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop. \\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-12-07\", \"organization\": \"The NGO Forum on Cambodia\"}]', '2025-11-11 06:43:56', NULL, 69, '[{\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}]', NULL, NULL);
INSERT INTO `contracts` (`id`, `project_title`, `contract_number`, `party_b_full_name_with_title`, `party_b_address`, `party_b_phone`, `party_b_email`, `registration_number`, `registration_date`, `agreement_start_date`, `agreement_end_date`, `total_fee_usd`, `gross_amount_usd`, `tax_percentage`, `payment_gross`, `payment_net`, `workshop_description`, `party_a_signature_name`, `party_b_signature_name`, `party_b_position`, `total_fee_words`, `title`, `deliverables`, `output_description`, `custom_article_sentences`, `payment_installments`, `created_at`, `deleted_at`, `user_id`, `focal_person_info`, `party_a_info`, `deduct_tax_code`, `vat_organization_name`) VALUES
('e094a1ce-8c6f-4963-9c44-57481c6bbc65', 'Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'NGOF/2025-004', 'Mr. Kin Doung', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+85567408241', 'kin.doung@gmail.com', '#304 សជណ', '07 March 2012', '2025-10-07', '2025-11-09', 3255.00, 3255.00, 0.00, '$3255.00 USD', '$3255.00 USD', '', 'Mr. SOEUNG Saroeun', 'Mr. Kin Doung', 'Freelance Consultant', 'Three Thousand Two Hundred Fifty Five US Dollars only', '', 'Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service; Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service; Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (30%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-10-07\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #2 (30%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-10-26\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #3 (40%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-11-09\", \"organization\": \"The NGO Forum on Cambodia\"}]', '2025-10-07 00:50:26', NULL, 69, '[{\"name\": \"Mr. SOM Chettana\", \"position\": \"Finance Operation Manager\", \"phone\": \"076 754 8888\", \"email\": \"chettana@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}]', 'K002-100054102', 'The NGO Forum on Cambodia'),
('e32e750c-80c1-432b-a536-91dd70a572a0', 'Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'NGOF/2025-006', 'Mr. Kin Doung', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+85567408241', 'kin.doung@gmail.com', '#304 សជណ', '07 March 2012', '2025-10-07', '2025-11-09', 1235.00, 1235.00, 15.00, '$1235.00 USD', '$1049.75 USD', '', 'Mr. SOEUNG Saroeun', 'Mr. Kin Doung', 'Freelance Consultant', 'One Thousand Two Hundred Thirty Five US Dollars only', '', 'Sign Agreement \r\nSubmit the draft outline - Submit the draft budget analysis to be submitted to NGOF \r\nSubmit the well\r\nwritten and comprehensive analysis report based on the outcomes of the analysis. \r\nPresent analysis report in a multi-stakeholder workshop. \r\nSubmit invoice and receipt of the service; Sign Agreement \r\nSubmit the draft outline - Submit the draft budget analysis to be submitted to NGOF \r\nSubmit the well\r\nwritten and comprehensive analysis report based on the outcomes of the analysis. \r\nPresent analysis report in a multi-stakeholder workshop. \r\nSubmit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (50%)\", \"deliverables\": \"Sign Agreement \\r\\nSubmit the draft outline - Submit the draft budget analysis to be submitted to NGOF \\r\\nSubmit the well\\r\\nwritten and comprehensive analysis report based on the outcomes of the analysis. \\r\\nPresent analysis report in a multi-stakeholder workshop. \\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-10-07\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #2 (50%)\", \"deliverables\": \"Sign Agreement \\r\\nSubmit the draft outline - Submit the draft budget analysis to be submitted to NGOF \\r\\nSubmit the well\\r\\nwritten and comprehensive analysis report based on the outcomes of the analysis. \\r\\nPresent analysis report in a multi-stakeholder workshop. \\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-11-09\", \"organization\": \"The NGO Forum on Cambodia\"}]', '2025-10-07 07:24:54', '2025-10-09 13:41:21', 69, '[{\"name\": \"Ms. OUM Somaly\", \"position\": \"SACHAS Program Manager\", \"phone\": \"081 647 963\", \"email\": \"somaly@ngoforum.org.kh\"}, {\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\"}]', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'PALI Program Manager', 'Policy research, advocacy, legal influence, secretariat for BWG & RCC', '2025-08-19 07:44:24', '2025-10-20 05:54:28'),
(2, 'SACHAS Program Manager ', 'Community transformation, capacity building, secretariat for NRLG & NECAW', '2025-08-19 07:45:03', '2025-10-20 05:54:13'),
(3, 'RITI Program Manager', 'Institutional resilience, governance, fundraising, secretariat for GGEDSI', '2025-08-19 07:45:13', '2025-10-20 05:53:52'),
(4, 'MACOR Program Manager', 'Organizational transparency, accountability, and sustainable operations', '2025-08-19 07:45:26', '2025-10-20 05:53:44'),
(5, 'Senior Management Team', 'The manage of all the departments', '2025-08-19 07:48:16', '2025-08-19 07:48:16');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` varchar(36) NOT NULL,
  `contract_no` varchar(50) NOT NULL,
  `contract_type` varchar(100) NOT NULL,
  `organization_name` varchar(255) DEFAULT 'The NGO Forum on Cambodia',
  `representative_name` varchar(100) DEFAULT 'Mr. Soeung Saroeun',
  `representative_title` varchar(100) DEFAULT 'Executive Director',
  `organization_address` text DEFAULT NULL,
  `organization_tel` varchar(50) DEFAULT '023 214 429',
  `organization_fax` varchar(50) DEFAULT '023 994 063',
  `organization_email` varchar(150) DEFAULT 'info@ngoforum.org.kh',
  `employee_name` varchar(255) NOT NULL,
  `employee_address` text DEFAULT NULL,
  `employee_tel` varchar(50) DEFAULT '',
  `employee_email` varchar(150) DEFAULT '',
  `position_title` varchar(150) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL COMMENT 'NULL = Undefined Duration Contract (UDC)',
  `working_hours` varchar(255) DEFAULT 'Monday to Friday: 08:00am-12:00pm and 01:30pm-05:00pm',
  `salary_amount` decimal(10,2) DEFAULT 0.00,
  `salary_grade` varchar(50) DEFAULT '',
  `salary_amount_words` varchar(500) DEFAULT '',
  `medical_allowance` decimal(10,2) DEFAULT 150.00,
  `child_education_allowance` decimal(10,2) DEFAULT 60.00,
  `delivery_benefit` decimal(10,2) DEFAULT 200.00,
  `delivery_benefit_miscarriage` decimal(10,2) DEFAULT 200.00,
  `death_benefit` decimal(10,2) DEFAULT 200.00,
  `severance_percentage` decimal(5,2) DEFAULT 8.33,
  `thirteenth_month_salary` tinyint(1) DEFAULT 1,
  `employer_signature_name` varchar(150) DEFAULT 'Mr. Soeung Saroeun',
  `employee_signature_name` varchar(150) DEFAULT '',
  `employer_signature_date` date DEFAULT NULL,
  `employee_signature_date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT 'active',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `contract_no`, `contract_type`, `organization_name`, `representative_name`, `representative_title`, `organization_address`, `organization_tel`, `organization_fax`, `organization_email`, `employee_name`, `employee_address`, `employee_tel`, `employee_email`, `position_title`, `start_date`, `end_date`, `working_hours`, `salary_amount`, `salary_grade`, `salary_amount_words`, `medical_allowance`, `child_education_allowance`, `delivery_benefit`, `delivery_benefit_miscarriage`, `death_benefit`, `severance_percentage`, `thirteenth_month_salary`, `employer_signature_name`, `employee_signature_name`, `employer_signature_date`, `employee_signature_date`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
('19f6da01-8603-4a29-873a-14c59aff5d05', 'NGOF-UDC/001', 'Undefined Duration Contract (UDC)', 'The NGO Forum on Cambodia', 'Mr. Soeung Saroeun', 'Executive Director', '#9-11, St. 476, Sangkat Toul Tompong I, Khan Chamka Morn, Phnom Penh, Cambodia', '023 214 429', '023 994 063', 'info@ngoforum.org.kh', 'Mr. Som Chettana', '271\r\nPhnom Penh', '013234535', 'som@ngoforum.org.kh', 'Finance and Operations Manager', '2025-02-01', NULL, 'Monday to Friday: 08:00am-12:00pm and 01:30pm-05:00pm', 1200.00, 'G4/L5', 'One Thousand Two Hundred US Dollars only', 150.00, 60.00, 200.00, 200.00, 200.00, 8.33, 1, 'Mr. Soeung Saroeun', 'Mr. Som Chettana', '2025-02-01', '2025-02-01', 'active', '2025-10-22 09:49:57', '2025-11-26 09:15:00', NULL),
('206b974d-b1bd-47a1-9043-ec30792d751c', 'NGOF-UDC/001', 'Undefined Duration Contract (UDC)', 'The NGO Forum on Cambodia', 'Mr. Soeung Saroeun', 'Executive Director', '#9-11 Street 476, Toul Tompong, P.O. Box 2295, Phnom Penh 3, Cambodia.', '023 214 429', '023 994 063', 'info@ngoforum.org.kh', 'Ms. Oum Somaly', '#9-11 Street 476, Toul Tompong, P.O. Box 2295, Phnom Penh 3, Cambodia.', '012 345 768', 'somaly@ngoforum.org.kh', 'Solidarity Action for Community Harmonization and Sustainability', '2025-01-01', NULL, 'Monday to Friday: 08:00am-12:00pm and 01:30pm-05:00pm', 1500.00, 'G4/L5', 'One Thousand Five Hundred US Dollars only', 150.00, 60.00, 200.00, 200.00, 200.00, 8.33, 1, 'Mr. Soeung Saroeun', 'Ms. Oum Somaly', '2025-01-01', '2025-01-01', 'active', '2025-11-11 06:57:11', '2025-11-26 09:15:00', NULL),
('602803d2-bff3-41be-a8e9-433c1b2bd8a5', 'NGOF-FDC/001', 'Fixed Duration Contract (FDC)', 'The NGO Forum on Cambodia', 'Mr. Soeung Saroeun', 'Executive Director', '#9-11, St. 476, Sangkat Toul Tompong I, Khan Chamka Morn, Phnom Penh, Cambodia', '023 214 429', '023 994 063', 'info@ngoforum.org.kh', 'Mr. Chan Vicheth', '#155, St.113, Sangkat Boeung Keng Kang III, Khan Boeung Keng Kang, Phnom Penh.', '012 953 650', 'vichethchan@gmail.com', 'Capacity Development Specialist', '2025-01-01', '2026-01-01', 'Monday to Friday: 08:00am-12:00pm and 01:30pm-05:00pm', 1225.00, 'G4/L5', 'One Thousand Two Hundred Twenty-five US Dollars only', 150.00, 60.00, 200.00, 200.00, 200.00, 8.33, 1, 'Mr. Soeung Saroeun', 'Mr. Chan Vicheth', '2025-01-01', '2025-01-01', 'active', '2025-10-22 08:34:12', '2025-11-26 09:15:00', NULL),
('8b068368-a365-4678-8a69-0dd05413870c', 'NGOF-UDC/001', 'Undefined Duration Contract (UDC)', 'The NGO Forum on Cambodia', 'Mr. Soeung Saroeun', 'Executive Director', '#9-11, St. 476, Sangkat Toul Tompong I, Khan Chamka Morn, Phnom Penh, Cambodia', '023 214 429', '023 994 063', 'info@ngoforum.org.kh', 'Mr. Chhea Chhouy', '271\r\nPhnom Penh', '067408241', 'chhea.chhouy@student.passerellesnumeriques.org', 'IT Programming Intern', '2025-11-05', NULL, 'Monday to Friday: 08:00am-12:00pm and 01:30pm-05:00pm', 1250.00, 'G4/L5', 'One Thousand Two Hundred Fifty US Dollars only', 150.00, 60.00, 200.00, 200.00, 200.00, 8.33, 0, 'Mr. Soeung Saroeun', 'Mr. Chhea Chhouy', '2025-11-05', '2025-11-05', 'active', '2025-11-26 01:31:53', '2025-11-26 01:50:36', NULL),
('a5e508da-762e-4cf0-a88b-5f23fab428ba', 'NGOF-FDC/001', 'Fixed Duration Contract (FDC)', 'The NGO Forum on Cambodia', 'Mr. Soeung Saroeun', 'Executive Director', '#9-11, St. 476, Sangkat Toul Tompong I, Khan Chamka Morn, Phnom Penh, Cambodia', '023 214 429', '023 994 063', 'info@ngoforum.org.kh', 'Mr. Kin Doung', '271\r\nPhnom Penh', '067408241', 'kin.doung@student.passerellesnumeriques.org', 'IT Programming Intern', '2025-11-01', '2026-11-01', 'Monday to Friday: 08:00am-12:00pm and 01:30pm-05:00pm', 1500.00, 'G4/L5', 'One Thousand Five Hundred US Dollars only', 150.00, 60.00, 200.00, 200.00, 200.00, 8.33, 1, 'Mr. Soeung Saroeun', 'Mr. Kin Doung', '2025-11-01', '2025-11-01', 'active', '2025-11-26 01:33:00', '2025-11-26 01:33:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `interns`
--

CREATE TABLE `interns` (
  `id` varchar(36) NOT NULL,
  `intern_name` varchar(255) NOT NULL,
  `intern_role` varchar(255) NOT NULL,
  `intern_address` text DEFAULT NULL,
  `intern_phone` varchar(20) DEFAULT NULL,
  `intern_email` varchar(100) DEFAULT NULL,
  `start_date` date NOT NULL,
  `duration` varchar(50) NOT NULL,
  `end_date` date NOT NULL,
  `working_hours` varchar(100) DEFAULT NULL,
  `allowance_amount` decimal(10,2) DEFAULT NULL,
  `has_nssf` tinyint(1) DEFAULT NULL,
  `supervisor_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`supervisor_info`)),
  `employer_representative_name` varchar(100) DEFAULT NULL,
  `employer_representative_title` varchar(100) DEFAULT NULL,
  `employer_address` text DEFAULT NULL,
  `employer_phone` varchar(20) DEFAULT NULL,
  `employer_fax` varchar(20) DEFAULT NULL,
  `employer_email` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `interns`
--

INSERT INTO `interns` (`id`, `intern_name`, `intern_role`, `intern_address`, `intern_phone`, `intern_email`, `start_date`, `duration`, `end_date`, `working_hours`, `allowance_amount`, `has_nssf`, `supervisor_info`, `employer_representative_name`, `employer_representative_title`, `employer_address`, `employer_phone`, `employer_fax`, `employer_email`, `created_at`, `deleted_at`) VALUES
('22245edc-3aca-4cb7-80c6-02ae30a9da9e', 'Mr. MangSeu Sork', 'IT-Intern', '271 Phnom Penh', '+85567408241', 'mangeseu.sork@student.passerellesnumeriques.org', '2025-08-05', '6', '2026-02-05', '8:00am – 5:00pm, Monday to Friday', 150.00, 1, '{\"title\": \"RITI Program Manager\", \"name\": \"Mr. CHAN Vicheth\"}', 'Mr. Soeung Saroeun', 'Executive Director', '#9-11, St. 476, Sangkat ToulTompong I, Khan Chamka Morn, Phnom Penh, Cambodia', '023 214 429', '023 994 063', 'info@ngoforum.org.kh', '2025-10-24 02:43:14', NULL),
('31e99418-9195-4556-ac41-69c2a5a3655d', 'Mr. Chhea Chhouy', 'IT-Intern', 'BP 511, Phum Tropeang Chhuk (Borey Sorla) Sangtak, Street 371, Phnom Penh', '+85567408241', 'chhea.chhouy@student.passerellesnumeriques.org', '2025-08-05', '6', '2026-02-05', '8:00am – 5:00pm, Monday to Friday', 150.00, 1, '{\"title\": \"MACOR Program Manager\", \"name\": \"Mr. SOM Chettana\"}', 'Mr. Soeung Saroeun', 'Executive Director', '#9-11, St. 476, Sangkat ToulTompong I, Khan Chamka Morn, Phnom Penh, Cambodia', '023 214 429', '023 994 063', 'info@ngoforum.org.kh', '2025-10-24 02:43:14', NULL),
('97183329-cde2-40a2-9a36-f12f65351044', 'Ms. Dorn Sochea', 'Finance and Administrative Intern', 'BP 511, Phum Tropeang Chhuk (Borey Sorla) Sangtak, Street 371, Phnom Penh', '+85567408241', 'socheadorn@gmail.com', '2025-08-18', '3', '2025-11-18', '8:00am – 5:00pm, Monday to Friday', 150.00, 1, '{\"title\": \"MACOR Program Manager\", \"name\": \"Mr. SOM Chettana\"}', 'Mr. Soeung Saroeun', 'Executive Director', '#9-11, St. 476, Sangkat ToulTompong I, Khan Chamka Morn, Phnom Penh, Cambodia', '023 214 429', '023 994 063', 'info@ngoforum.org.kh', '2025-10-24 02:43:14', NULL),
('ad77f660-1439-4ab2-8af6-6e64cffc089e', 'Mr. Oeun Romas', 'PILI-intern', 'BP 511, Phum Tropeang Chhuk (Borey Sorla) Sangtak, Street 371, Phnom Penh', '+85567408241', 'oeun.romas@gmail.com', '2025-09-10', '6', '2026-03-10', '8:00am – 5:00pm, Monday to Friday', 200.00, 1, '{\"title\": \"PALI Program Manager\", \"name\": \"Mr. MAR Sophal\"}', 'Mr. Soeung Saroeun', 'Executive Director', '#9-11, St. 476, Sangkat ToulTompong I, Khan Chamka Morn, Phnom Penh, Cambodia', '023 214 429', '023 994 063', 'info@ngoforum.org.kh', '2025-10-24 02:43:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `related_contract_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `creator_id`, `recipient_id`, `title`, `message`, `is_read`, `created_at`, `related_contract_id`) VALUES
(55, 69, 69, 'New Contract Created: Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'Contract NGOF/2025-001 created by Chhea Chhouy', 1, '2025-10-07 00:41:35', '7b0c47ec-7db1-4d5f-b410-f5d2397cdc15'),
(56, 69, 69, 'New Contract Created: Consultant for producing the video documentary to promote piloting SNR guideline in Ratanakiri Province.', 'Contract NGOF/2025-002 created by Chhea Chhouy', 1, '2025-10-07 00:44:37', '42c79f53-be6c-4470-9ea0-05024d8c5abe'),
(57, 69, 69, 'New Contract Created: Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'Contract NGOF/2025-003 created by Chhea Chhouy', 1, '2025-10-07 00:47:00', '45882072-d357-4154-a8ee-c845def15856'),
(58, 69, 69, 'New Contract Created: Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'Contract NGOF/2025-004 created by Chhea Chhouy', 1, '2025-10-07 00:50:26', 'e094a1ce-8c6f-4963-9c44-57481c6bbc65'),
(59, 69, 69, 'New Contract Created: Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'Contract NGOF/2025-005 created by Chhea Chhouy', 1, '2025-10-07 03:03:40', '717bc7d6-d045-4d8a-9093-f7e37be16046'),
(62, 69, 69, 'New Contract Created: Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'Contract NGOF/2025-006 created by Chhea Chhouy', 1, '2025-10-07 07:24:54', 'e32e750c-80c1-432b-a536-91dd70a572a0'),
(64, 41, 69, 'New Contract Created: Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'Contract NGOF/2025-007 created by Rady Y', 1, '2025-10-07 10:00:58', '07299214-1f54-49e7-9999-e5c5863ee20b'),
(66, 43, 69, 'New Contract Created: Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'Contract NGOF/2025-009 created by Hey Him', 1, '2025-10-08 00:44:29', 'c2c5efdd-8603-4381-be92-29a44aa16b1c'),
(70, 69, 69, 'New Contract Created: Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'Contract NGOF/2025-010 created by Chhea Chhouy', 1, '2025-10-09 02:09:43', 'd6d7d9b7-e37f-4cc6-b3af-c9491130f64f'),
(71, 69, 69, 'New Contract Created: Consultant for producing the video documentary to promote piloting SNR guideline in Ratanakiri Province.', 'Contract NGOF/2025-011 created by Chhea Chhouy', 1, '2025-10-09 03:26:18', 'd1e20d93-5eb4-4f1a-b844-fadc2236c40a'),
(72, 43, 69, 'New Contract Created: Consultant for producing the video documentary to promote piloting SNR guideline in Ratanakiri Province.', 'Contract NGOF/2025-012 created by Hey Him', 1, '2025-10-09 04:00:20', '257d55d6-aba2-43fe-85c2-ba1f92fffa3a'),
(73, 69, 69, 'Contract Updated: Consultant for producing the video documentary to promote piloting SNR guideline in Ratanakiri Province.', 'Contract NGOF/2025-002 updated by Chhea Chhouy', 1, '2025-10-09 06:38:59', '42c79f53-be6c-4470-9ea0-05024d8c5abe'),
(74, 69, 69, 'Contract Updated: Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'Contract NGOF/2025-001 updated by Chhea Chhouy', 1, '2025-10-09 07:56:05', '7b0c47ec-7db1-4d5f-b410-f5d2397cdc15'),
(75, 69, 69, 'Contract Updated: Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'Contract NGOF/2025-003 updated by Chhea Chhouy', 1, '2025-10-09 07:57:05', '45882072-d357-4154-a8ee-c845def15856'),
(76, 69, 69, 'Contract Updated: Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'Contract NGOF/2025-004 updated by Chhea Chhouy', 1, '2025-10-09 07:57:45', 'e094a1ce-8c6f-4963-9c44-57481c6bbc65'),
(77, 69, 69, 'Contract Updated: Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'Contract NGOF/2025-007 updated by Chhea Chhouy', 1, '2025-10-09 07:58:32', '07299214-1f54-49e7-9999-e5c5863ee20b'),
(78, 69, 69, 'Contract Updated: Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'Contract NGOF/2025-009 updated by Chhea Chhouy', 1, '2025-10-09 07:59:16', 'c2c5efdd-8603-4381-be92-29a44aa16b1c'),
(79, 69, 69, 'Contract Updated: Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'Contract NGOF/2025-010 updated by Chhea Chhouy', 1, '2025-10-09 07:59:44', 'd6d7d9b7-e37f-4cc6-b3af-c9491130f64f'),
(80, 69, 69, 'Contract Updated: Consultant for producing the video documentary to promote piloting SNR guideline in Ratanakiri Province.', 'Contract NGOF/2025-011 updated by Chhea Chhouy', 1, '2025-10-09 08:00:06', 'd1e20d93-5eb4-4f1a-b844-fadc2236c40a'),
(81, 42, 69, 'New Contract Created: Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'Contract NGOF/2025-013 created by Yen Yon', 1, '2025-10-10 06:20:40', '6172338f-0cf2-4b3d-936e-649b80d3a034'),
(82, 42, 69, 'New Contract Created: Consultant for producing the video documentary to promote piloting SNR guideline in Ratanakiri Province.', 'Contract NGOF/2025-014 created by Yen Yon', 1, '2025-10-10 06:21:36', '5191004d-699c-435c-80cb-b5dd85226747'),
(83, 69, 69, 'Contract Updated: Consultant for producing the video documentary to promote piloting SNR guideline in Ratanakiri Province.', 'Contract NGOF/2025-014 updated by Chhea Chhouy', 1, '2025-10-10 06:22:27', '5191004d-699c-435c-80cb-b5dd85226747'),
(84, 69, 69, 'Contract Updated: Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'Contract NGOF/2025-013 updated by Chhea Chhouy', 1, '2025-10-10 06:22:39', '6172338f-0cf2-4b3d-936e-649b80d3a034'),
(85, 69, 69, 'New Contract Created: Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'Contract NGOF/2025-013 created by Chhea Chhouy', 1, '2025-10-10 07:41:31', '156ed08b-bdf6-490b-9eec-924b9cc97565'),
(86, 69, 69, 'Contract Updated: Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'Contract NGOF/2025-013 updated by Chhea Chhouy', 1, '2025-10-10 07:56:52', '156ed08b-bdf6-490b-9eec-924b9cc97565'),
(87, 69, 69, 'New Contract Created: Consultant for producing the video documentary to promote piloting SNR guideline in Ratanakiri Province.', 'Contract NGOF/2025-014 created by Chhea Chhouy', 1, '2025-10-17 09:01:32', '5692d227-d305-4ca6-a646-1e9c8d64bcd1'),
(88, 69, 69, 'Contract Updated: Consultant for producing the video documentary to promote piloting SNR guideline in Ratanakiri Province.', 'Contract NGOF/2025-014 updated by Chhea Chhouy', 1, '2025-10-17 09:01:56', '5692d227-d305-4ca6-a646-1e9c8d64bcd1'),
(89, 76, 69, 'New Contract Created: Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'Contract NGOF/2025-015 created by Chhea Dev', 1, '2025-10-17 09:26:51', '4abf109b-784e-43ce-84e8-40c1caab0fdc'),
(90, 69, 69, 'New Contract Created: Consultant for producing the video documentary to promote piloting SNR guideline in Ratanakiri Province.', 'Contract NGOF/2025-016 created by Chhea Chhouy', 1, '2025-10-21 04:47:50', 'a2a69d38-0299-4ce7-b562-3437a691e086'),
(91, 69, 69, 'Contract Updated: Consultant for producing the video documentary to promote piloting SNR guideline in Ratanakiri Province.', 'Contract NGOF/2025-016 updated by Chhea Chhouy', 1, '2025-10-21 04:48:21', 'a2a69d38-0299-4ce7-b562-3437a691e086'),
(92, 69, 69, 'New Contract Created: Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'Contract NGOF/2025-016 created by Chhea Chhouy', 1, '2025-11-10 00:30:53', '12eea846-aae9-4368-a938-8205673eda08'),
(93, 69, 69, 'Contract Updated: Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'Contract NGOF/2025-016 updated by Chhea Chhouy', 1, '2025-11-10 01:10:15', '12eea846-aae9-4368-a938-8205673eda08'),
(94, 69, 69, 'New Contract Created: Consultant for producing the video documentary to promote piloting SNR guideline in Ratanakiri Province.', 'Contract NGOF/2025-017 created by Chhea Chhouy', 1, '2025-11-11 06:43:56', 'decb7841-b071-4740-98ba-86c885ff2c46'),
(95, 69, 69, 'Contract Updated: Consultant for producing the video documentary to promote piloting SNR guideline in Ratanakiri Province.', 'Contract NGOF/2025-017 updated by Chhea Chhouy', 1, '2025-11-11 06:44:48', 'decb7841-b071-4740-98ba-86c885ff2c46');

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(15, 'add_user', 'This permission and add user', '2025-09-03 04:03:16', '2025-09-03 04:03:16'),
(16, 'view_profile', 'This permission can view profile ', '2025-09-03 04:03:44', '2025-09-03 04:03:44'),
(17, 'view', 'This permission can only view', '2025-09-03 04:04:02', '2025-09-03 04:04:02'),
(18, 'manage the consultant contract', 'This permission can manage the consultant contract.', '2025-09-03 04:04:53', '2025-09-03 04:04:53'),
(19, 'crud_department all', 'This permission can crud the department.', '2025-09-03 04:05:27', '2025-09-03 04:05:27'),
(20, 'crud_all_user ', 'This permission can crud all users in system', '2025-09-03 04:06:06', '2025-09-03 04:06:06'),
(21, 'crud_role', 'This permission can crud role all system ', '2025-09-03 04:06:38', '2025-09-03 04:06:38'),
(22, 'view_dashboard page', 'This permission can view dashboard page', '2025-09-03 04:07:14', '2025-09-03 04:07:14'),
(23, 'view_summary report', 'This permission can view summary report.', '2025-09-03 04:08:14', '2025-09-03 04:08:14');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(5, 'Admin', 'I want to manage this system.', '2025-08-19 07:26:47', '2025-08-19 07:26:47'),
(6, 'Manager', 'I want to add more user in this system.', '2025-08-19 07:27:42', '2025-08-19 07:27:42'),
(7, 'Employee', 'I am a staff in your company.', '2025-08-19 07:28:28', '2025-08-19 07:28:28'),
(8, 'Executive Directive', 'I want to used this system.', '2025-08-19 07:30:02', '2025-08-19 09:15:29');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`role_id`, `permission_id`) VALUES
(5, 15),
(5, 16),
(5, 17),
(5, 18),
(5, 19),
(5, 20),
(5, 21),
(5, 22),
(5, 23),
(6, 15),
(6, 16),
(6, 17),
(6, 18),
(7, 16),
(7, 17),
(7, 18),
(8, 15),
(8, 18),
(8, 20),
(8, 22),
(8, 23);

-- --------------------------------------------------------

--
-- Table structure for table `uploaded_docx`
--

CREATE TABLE `uploaded_docx` (
  `id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `original_name` varchar(255) NOT NULL,
  `uploaded_at` datetime NOT NULL,
  `uploaded_by` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uploaded_docx`
--

INSERT INTO `uploaded_docx` (`id`, `filename`, `original_name`, `uploaded_at`, `uploaded_by`) VALUES
(2, 'Mr._Kin_Doung.docx', 'Mr._Kin_Doung.docx', '2025-11-10 01:28:12', 'Chhea Chhouy'),
(3, 'Mr.Sean_Bunrith.docx', 'Mr.Sean_Bunrith.docx', '2025-11-10 01:28:24', 'Chhea Chhouy');

-- --------------------------------------------------------

--
-- Table structure for table `uploaded_employee`
--

CREATE TABLE `uploaded_employee` (
  `id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `original_name` varchar(255) NOT NULL,
  `uploaded_at` datetime NOT NULL,
  `uploaded_by` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uploaded_employee`
--

INSERT INTO `uploaded_employee` (`id`, `filename`, `original_name`, `uploaded_at`, `uploaded_by`) VALUES
(3, 'NGOF-FDC_001_Mr._Som_Chettana.docx', 'NGOF-FDC_001_Mr._Som_Chettana.docx', '2025-11-10 01:52:29', 'Chhea Chhouy'),
(4, 'NGOF-FDC_001_Mr._Chan_Vicheth.docx', 'NGOF-FDC_001_Mr._Chan_Vicheth.docx', '2025-11-10 01:53:58', 'Chhea Chhouy');

-- --------------------------------------------------------

--
-- Table structure for table `uploaded_intern`
--

CREATE TABLE `uploaded_intern` (
  `id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `original_name` varchar(255) NOT NULL,
  `uploaded_at` datetime NOT NULL,
  `uploaded_by` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uploaded_intern`
--

INSERT INTO `uploaded_intern` (`id`, `filename`, `original_name`, `uploaded_at`, `uploaded_by`) VALUES
(3, 'Mr._Oeun_Romas_Agreement.docx', 'Mr._Oeun_Romas_Agreement.docx', '2025-11-10 02:46:59', 'Chhea Chhouy'),
(4, 'Ms._Dorn_Sochea_Agreement.docx', 'Ms._Dorn_Sochea_Agreement.docx', '2025-11-10 02:46:59', 'Chhea Chhouy');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT 'default_profile.png',
  `phone_number` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `image`, `phone_number`, `address`, `created_at`, `updated_at`, `role_id`, `department_id`) VALUES
(41, 'Rady Y', 'rady.Y@gmail.com', 'pbkdf2:sha256:600000$Psh0R4ycgAADvgcZ$49807f793314b7522259891904ae5261d30a67d3a706e167a5271a5df329314d', 'photo_2018-10-20_10-47-45.jpg', '077408241', '#9-11 Street 476, Toul Tompong, P.O. Box 2295, Phnom Penh 3, Cambodia. NGO Forum on Cambodia', '2025-08-25 06:53:18', '2025-09-05 08:49:38', 6, 3),
(42, 'Yen Yon', 'yen.yon@gmail.com', 'pbkdf2:sha256:600000$qOcn42DJ68axTQ14$94df617ccd0cf1500ec48daf935eab0e90546d9e81f27c5bbfee2a1f0df34113', 'photo_2025-02-05_23-02-19.jpg', '087408241', '#9-11 Street 476, Toul Tompong, P.O. Box 2295, Phnom Penh 3, Cambodia. NGO Forum on Cambodia', '2025-08-25 06:55:05', '2025-09-09 02:22:56', 6, 1),
(43, 'Hey Him', 'hey.him@gmail.com', 'pbkdf2:sha256:600000$GR32qQjB9hSByd0F$8591c9387dde233ac6af1427a76c3262e9ac26c1837314765c2a5035aae83b3c', 'photo_2025-02-23_17-21-55.jpg', '097408241', '#9-11 Street 476, Toul Tompong, P.O. Box 2295, Phnom Penh 3, Cambodia. NGO Forum on Cambodia', '2025-08-25 06:56:43', '2025-09-05 09:25:32', 6, 2),
(44, 'Hean Sokhom', 'hean.sokhom@gmail.com', 'pbkdf2:sha256:600000$CEuXV59zG8vg8NNc$f8fb293d1a72c17c62e11ff017fd02832a0987a1c9e735c8e290ca71b6d86cf4', 'photo_2020-02-07_13-45-05.jpg', '057408241', '#9-11 Street 476, Toul Tompong, P.O. Box 2295, Phnom Penh 3, Cambodia. NGO Forum on Cambodia', '2025-08-25 06:57:55', '2025-09-05 09:11:42', 6, 4),
(47, 'Sokchea Boy', 'sokchea.boy@student.passerellesnumeriques.org', 'pbkdf2:sha256:600000$JWYKRNBzt5pkJazm$90242794463508dca34e4e1e39056bf718b1617179155e54eb3cf6b0649bfd99', 'photo_2025-07-21_21-57-43.jpg', '047408241', '#9-11 Street 476, Toul Tompong, P.O. Box 2295, Phnom Penh 3, Cambodia. NGO Forum on Cambodia', '2025-08-25 07:05:51', '2025-09-09 01:16:17', 7, 1),
(69, 'Chhea Chhouy', 'chheadeveloper@gmail.com', 'pbkdf2:sha256:600000$Tatnm9nVeb5Kifks$44ba3c5fb0e8f2a725f7fbb93201d79478ac8a790390327e9a4ec1dff6c27a74', 'photo_2025-08-20_09-26-56.jpg', '067408241', '#9-11 Street 476, Toul Tompong, P.O. Box 2295, Phnom Penh 3, Cambodia. NGO Forum on Cambodia', '2025-09-03 03:53:14', '2025-10-08 08:32:24', 5, 4),
(75, 'Leader Din', 'leader.din@gmail.com', 'pbkdf2:sha256:600000$XNYYoHc1yo2bYrU9$bc6515bcf8b589c221bd38cd7cbc16e0c8ba6c863a6de7a501a9d5e8ba14c3c8', 'photo_2025-06-14_07-12-25.jpg', '098772362', '#9-11 Street 476, Toul Tompong, P.O. Box 2295, Phnom Penh 3, Cambodia. NGO Forum on Cambodia', '2025-09-04 01:59:14', '2025-09-09 01:16:09', 7, 1),
(76, 'Chhea Dev', 'chhea.chhouy@student.passerellesnumeriques.org', 'pbkdf2:sha256:600000$olKKEzW0lS2mtYem$e316c7472170bb7d1f281f7c9878f84cfa6952d796540a29f08553da1bc58cbb', 'photo_2025-08-12_12-40-07.jpg', '067408240', '271\r\nPhnom Penh', '2025-09-05 08:26:17', '2025-10-17 09:24:08', 7, 4),
(77, 'Software', 'data@gmail.com', 'pbkdf2:sha256:600000$WhNeUbqzAXZoTuxf$5ced7e2bc1b6d674874dfbd1ef6d95e973d97650dd33dbe4b7b669bca675b33e', 'photo_2025-06-28_11-29-37.jpg', '09872444', '#9-11 Street 476, Toul Tompong, P.O. Box 2295, Phnom Penh 3, Cambodia. NGO Forum on Cambodia', '2025-09-05 08:31:01', '2025-09-05 08:31:12', 7, 3),
(79, 'MengSue Sor', 'mengseur@gmail.com', 'pbkdf2:sha256:600000$4SHzoIJTDMfAzmj1$bb51f5080a05678a6baf472436ecf5abfbc19b2352ba840095b655fdcb17247a', 'photo_2025-05-17_21-48-13.jpg', '077468241', '#9-11 Street 476, Toul Tompong, P.O. Box 2295, Phnom Penh 3, Cambodia. NGO Forum on Cambodia', '2025-09-05 09:31:47', '2025-09-08 08:58:26', 7, 2),
(80, 'Linna Rin', 'linna.rin@student.passerellesnumeriques.org', 'pbkdf2:sha256:600000$ax8H9VXyJnXwNMuK$072aa793f1f30ea3d56bcfdb5b834738a17881ccda74d4fb3eeda1b48e62a006', 'photo_2025-06-25_20-57-05.jpg', '0989734321', '#9-11 Street 476, Toul Tompong, P.O. Box 2295, Phnom Penh 3, Cambodia. NGO Forum on Cambodia', '2025-09-05 09:33:00', '2025-09-05 09:33:00', 7, 2),
(87, 'Sokha Davy', 'sokha.davy@gmail.com', 'pbkdf2:sha256:600000$NnN5hILTX2FEkHJH$4c9f1b48c01593bfe8559dd5b37ad61c06f1d1a517d50fef3a659abb461740c9', 'photo_2025-06-25_20-57-05.jpg', '09869827', '#9-11 Street 476, Toul Tompong, P.O. Box 2295, Phnom Penh 3, Cambodia. NGO Forum on Cambodia', '2025-09-09 01:24:57', '2025-09-09 01:25:07', 7, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alembic_version`
--
ALTER TABLE `alembic_version`
  ADD PRIMARY KEY (`version_num`);

--
-- Indexes for table `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uix_contract_number_deleted_at` (`contract_number`,`deleted_at`),
  ADD KEY `ix_contracts_user_id` (`user_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_contract_type` (`contract_type`),
  ADD KEY `idx_employee_name` (`employee_name`),
  ADD KEY `idx_contract_no` (`contract_no`);

--
-- Indexes for table `interns`
--
ALTER TABLE `interns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `related_contract_id` (`related_contract_id`),
  ADD KEY `ix_notifications_creator_id` (`creator_id`),
  ADD KEY `ix_notifications_recipient_id` (`recipient_id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `permission_id` (`permission_id`);

--
-- Indexes for table `uploaded_docx`
--
ALTER TABLE `uploaded_docx`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_uploaded_docx_uploaded_at` (`uploaded_at`);

--
-- Indexes for table `uploaded_employee`
--
ALTER TABLE `uploaded_employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_uploaded_employee_uploaded_at` (`uploaded_at`);

--
-- Indexes for table `uploaded_intern`
--
ALTER TABLE `uploaded_intern`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_uploaded_intern_uploaded_at` (`uploaded_at`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone_number` (`phone_number`),
  ADD KEY `ix_user_department_id` (`department_id`),
  ADD KEY `ix_user_role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
