-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2025 at 04:55 AM
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
('cc5669644462');

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

INSERT INTO `contracts` (`id`, `project_title`, `contract_number`, `party_b_full_name_with_title`, `party_b_address`, `party_b_phone`, `party_b_email`, `agreement_start_date`, `agreement_end_date`, `total_fee_usd`, `gross_amount_usd`, `tax_percentage`, `payment_gross`, `payment_net`, `workshop_description`, `party_a_signature_name`, `party_b_signature_name`, `party_b_position`, `total_fee_words`, `title`, `deliverables`, `output_description`, `custom_article_sentences`, `payment_installments`, `created_at`, `deleted_at`, `user_id`, `focal_person_info`, `party_a_info`, `deduct_tax_code`, `vat_organization_name`) VALUES
('07299214-1f54-49e7-9999-e5c5863ee20b', 'Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'NGOF/2025-007', 'Ms. CHAB Charyna', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+855 67408241', 'charyna.chab@student.passerellesnumeriques.org', '2025-10-07', '2025-11-09', 1200.00, 1200.00, 0.00, '$1200.00 USD', '$1200.00 USD', '', 'Mr. SOEUNG Saroeun', 'Ms. CHAB Charyna', 'Freelance Consultant', 'One Thousand Two Hundred US Dollars only', '', 'Sign Agreement \r\nSubmit the draft outline \r\nSubmit the draft budget analysis to be submitted to NGOF \r\nSubmit the well  written and comprehensive analysis report based on the outcomes of the analysis. \r\nPresent analysis report in a multi-stakeholder workshop. \r\nSubmit invoice and receipt of the servic; Sign Agreement \r\nSubmit the draft outline \r\nSubmit the draft budget analysis to be submitted to NGOF \r\nSubmit the well  written and comprehensive analysis report based on the outcomes of the analysis. \r\nPresent analysis report in a multi-stakeholder workshop. \r\nSubmit invoice and receipt of the servic', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (50%)\", \"deliverables\": \"Sign Agreement \\r\\nSubmit the draft outline \\r\\nSubmit the draft budget analysis to be submitted to NGOF \\r\\nSubmit the well  written and comprehensive analysis report based on the outcomes of the analysis. \\r\\nPresent analysis report in a multi-stakeholder workshop. \\r\\nSubmit invoice and receipt of the servic\", \"dueDate\": \"2025-10-07\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #2 (50%)\", \"deliverables\": \"Sign Agreement \\r\\nSubmit the draft outline \\r\\nSubmit the draft budget analysis to be submitted to NGOF \\r\\nSubmit the well  written and comprehensive analysis report based on the outcomes of the analysis. \\r\\nPresent analysis report in a multi-stakeholder workshop. \\r\\nSubmit invoice and receipt of the servic\", \"dueDate\": \"2025-11-09\", \"organization\": \"The NGO Forum on Cambodia\"}]', '2025-10-07 10:00:58', '2025-12-12 08:27:55', 41, '[{\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}, {\"name\": \"Ms. OUM Somaly\", \"position\": \"SACHAS Program Manager\", \"phone\": \"081 647 963\", \"email\": \"somaly@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}]', 'K002-100054102', 'The NGO Forum on Cambodia'),
('12eea846-aae9-4368-a938-8205673eda08', 'Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'NGOF/2025-016', 'Mr. Kin Doung', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+85567408241', 'kin.doung@student.passerellesnumeriques.org', '2025-11-10', '2025-12-07', 1200.00, 1200.00, 10.00, '$1200.00 USD', '$1080.00 USD', '', 'Mr. SOEUNG Saroeun', 'Mr. Kin Doung', 'Freelance Consultant', 'One Thousand Two Hundred US Dollars only', '', '- Sign Agreement - Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF - Submit the well-written and comprehensive analysis report based on the outcomes of the analysis. - Present analysis report in a multi-stakeholder workshop. - Submit invoice and receipt of the service\r\n- Sign Agreement - Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF - Submit the well-written and comprehensive analysis report based on the outcomes of the analysis. - Present analysis report in a multi-stakeholder workshop. - Submit invoice and receipt of the service; - Sign Agreement - Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF - Submit the well-written and comprehensive analysis report based on the outcomes of the analysis. - Present analysis report in a multi-stakeholder workshop. - Submit invoice and receipt of the service\r\n- Sign Agreement - Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF - Submit the well-written and comprehensive analysis report based on the outcomes of the analysis. - Present analysis report in a multi-stakeholder workshop. - Submit invoice and receipt of the service; - Sign Agreement - Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF - Submit the well-written and comprehensive analysis report based on the outcomes of the analysis. - Present analysis report in a multi-stakeholder workshop. - Submit invoice and receipt of the service\r\n- Sign Agreement - Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF - Submit the well-written and comprehensive analysis report based on the outcomes of the analysis. - Present analysis report in a multi-stakeholder workshop. - Submit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (30%)\", \"deliverables\": \"- Sign Agreement - Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF - Submit the well-written and comprehensive analysis report based on the outcomes of the analysis. - Present analysis report in a multi-stakeholder workshop. - Submit invoice and receipt of the service\\r\\n- Sign Agreement - Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF - Submit the well-written and comprehensive analysis report based on the outcomes of the analysis. - Present analysis report in a multi-stakeholder workshop. - Submit invoice and receipt of the service\", \"dueDate\": \"2025-12-01\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #2 (30%)\", \"deliverables\": \"- Sign Agreement - Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF - Submit the well-written and comprehensive analysis report based on the outcomes of the analysis. - Present analysis report in a multi-stakeholder workshop. - Submit invoice and receipt of the service\\r\\n- Sign Agreement - Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF - Submit the well-written and comprehensive analysis report based on the outcomes of the analysis. - Present analysis report in a multi-stakeholder workshop. - Submit invoice and receipt of the service\", \"dueDate\": \"2025-12-01\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #3 (40%)\", \"deliverables\": \"- Sign Agreement - Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF - Submit the well-written and comprehensive analysis report based on the outcomes of the analysis. - Present analysis report in a multi-stakeholder workshop. - Submit invoice and receipt of the service\\r\\n- Sign Agreement - Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF - Submit the well-written and comprehensive analysis report based on the outcomes of the analysis. - Present analysis report in a multi-stakeholder workshop. - Submit invoice and receipt of the service\", \"dueDate\": \"2026-01-01\", \"organization\": \"The NGO Forum on Cambodia\"}]', '2025-11-10 00:30:53', '2025-12-12 08:27:40', 69, '[{\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}]', NULL, NULL),
('156ed08b-bdf6-490b-9eec-924b9cc97565', 'Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'NGOF/2025-013', 'Mr. Chhea Chhouy', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+855 67408241', 'chhea.chhouy@student.passerellesnumeriques.org', '2025-10-10', '2025-11-09', 1225.00, 1225.00, 0.00, '$1225.00 USD', '$1225.00 USD', '', 'Mr. SOEUNG Saroeun', 'Mr. Chhea Chhouy', 'Freelance Consultant', 'One Thousand Two Hundred Twenty Five US Dollars only', '', 'Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service; Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (50%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-10-10\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #2 (50%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-11-09\", \"organization\": \"Passerelles Numeriques Cambodia\"}]', '2025-10-10 07:41:31', '2025-12-12 08:27:35', 69, '[{\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}, {\"name\": \"Mr. SOM Chettana\", \"position\": \"Finance Operation Manager\", \"phone\": \"076 754 8888\", \"email\": \"chettana@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}, {\"organization\": \"Passerelles Numeriques Cambodia\", \"short_name\": \"PNC\", \"name\": \"Mr. Heng HeangBunna\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"06 March 2015\"}]', 'K002-100054102', 'The NGO Forum on Cambodia'),
('257d55d6-aba2-43fe-85c2-ba1f92fffa3a', 'Consultant for producing the video documentary to promote piloting SNR guideline in Ratanakiri Province.', 'NGOF/2025-012', 'Mr. Heng Dara', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+855 67408241', 'heng.dara@gmail.com', '2025-10-09', '2025-11-09', 1250.00, 1250.00, 15.00, '$1250.00 USD', '$1062.50 USD', '', 'Mr. SOEUNG Saroeun', 'Mr. Heng Dara', 'Freelance Consultant', 'One Thousand Two Hundred Fifty US Dollars only', '', 'Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (100%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-11-09\", \"organization\": \"The NGO Forum on Cambodia\"}]', '2025-10-09 04:00:20', '2025-12-12 08:27:49', 43, '[{\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}]', '', ''),
('42c79f53-be6c-4470-9ea0-05024d8c5abe', 'Consultant for producing the video documentary to promote piloting SNR guideline in Ratanakiri Province.', 'NGOF/2025-002', 'Ms. SOTH Channavy', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+85567408241', 'soth.channavy@gmail.com', '2025-10-07', '2025-11-09', 1250.00, 1250.00, 10.00, '$1250.00 USD', '$1125.00 USD', '', 'Mr. SOEUNG Saroeun', 'Ms. SOTH Channavy', 'Freelance Consultant', 'One Thousand Two Hundred Fifty US Dollars only', '', 'Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service; Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (70%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-10-30\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #2 (30%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-11-09\", \"organization\": \"The NGO Forum on Cambodia\"}]', '2025-10-07 00:44:37', '2025-12-12 09:20:23', 69, '[{\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}]', NULL, NULL),
('45882072-d357-4154-a8ee-c845def15856', 'Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'NGOF/2025-003', 'Ms. AN Vannak', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+855 67408241', 'an.vannak@gmail.com', '2025-10-07', '2025-11-09', 2500.00, 2500.00, 0.00, '$2500.00 USD', '$2500.00 USD', '', 'Mr. SOEUNG Saroeun', 'Ms. AN Vannak', 'Freelance Consultant', 'Two Thousand Five Hundred US Dollars only', '', 'Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service; Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service; Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (40%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-10-07\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #2 (30%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-10-19\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #3 (30%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-11-09\", \"organization\": \"The NGO Forum on Cambodia\"}]', '2025-10-07 00:47:00', '2025-12-12 08:35:58', 69, '[{\"name\": \"Mr. CHAN Vicheth\", \"position\": \"RITI Program Manager\", \"phone\": \"012 953 650\", \"email\": \"vicheth@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}]', 'K002-100054102', 'The NGO Forum on Cambodia'),
('4abf109b-784e-43ce-84e8-40c1caab0fdc', 'Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'NGOF/2025-015', 'Mr. Sokchea Boy', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+85567408241', 'sochea.boy@student.passerellesnumeriques.org', '2025-10-17', '2025-11-09', 1225.00, 1225.00, 10.00, '$1225.00 USD', '$1102.50 USD', '', 'Mr. SOEUNG Saroeun', 'Mr. Sokchea Boy', 'Freelance Consultant', 'One Thousand Two Hundred Twenty Five US Dollars only', '', '- Sign Agreement - Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF - Submit the well-written and comprehensive analysis report based on the outcomes of the analysis. - Present analysis report in a multi-stakeholder workshop. - Submit invoice and receipt of the service\r\n- Sign Agreement - Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF - Submit the well-written and comprehensive analysis report based on the outcomes of the analysis. - Present analysis report in a multi-stakeholder workshop. - Submit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (100%)\", \"deliverables\": \"- Sign Agreement - Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF - Submit the well-written and comprehensive analysis report based on the outcomes of the analysis. - Present analysis report in a multi-stakeholder workshop. - Submit invoice and receipt of the service\\r\\n- Sign Agreement - Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF - Submit the well-written and comprehensive analysis report based on the outcomes of the analysis. - Present analysis report in a multi-stakeholder workshop. - Submit invoice and receipt of the service\", \"dueDate\": \"2025-11-09\", \"organization\": \"The NGO Forum on Cambodia\"}]', '2025-10-17 09:26:51', '2025-12-12 08:27:45', 76, '[{\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}]', '', ''),
('5191004d-699c-435c-80cb-b5dd85226747', 'Consultant for producing the video documentary to promote piloting SNR guideline in Ratanakiri Province.', 'NGOF/2025-014', 'Mr. Kin Doung', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+85567408241', 'kin.doung@gmail.com', '2025-10-10', '2025-11-09', 3500.00, 3500.00, 0.00, '$3500.00 USD', '$3500.00 USD', '', 'Mr. SOEUNG Saroeun', 'Mr. Kin Doung', 'Freelance Consultant', 'Three Thousand Five Hundred US Dollars only', '', 'Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (100%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-11-09\", \"organization\": \"The NGO Forum on Cambodia\"}]', '2025-10-10 06:21:36', '2025-10-10 13:55:16', 42, '[{\"name\": \"Ms. OUM Somaly\", \"position\": \"SACHAS Program Manager\", \"phone\": \"081 647 963\", \"email\": \"somaly@ngoforum.org.kh\"}, {\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}]', 'K002-100054102', 'The NGO Forum on Cambodia'),
('5692d227-d305-4ca6-a646-1e9c8d64bcd1', 'Consultant for producing the video documentary to promote piloting SNR guideline in Ratanakiri Province.', 'NGOF/2025-014', 'Mr. Kin Doung', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+85567408241', 'kin.doung@gmail.com', '2025-10-17', '2025-11-09', 1225.00, 1225.00, 15.00, '$1225.00 USD', '$1041.25 USD', '', 'Mr. SOEUNG Saroeun', 'Mr. Kin Doung', 'Freelance Consultant', 'One Thousand Two Hundred Twenty Five US Dollars only', '', 'Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (100%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-11-09\", \"organization\": \"The NGO Forum on Cambodia\"}]', '2025-10-17 09:01:32', '2025-11-10 07:29:24', 69, '[{\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}]', NULL, NULL),
('5adc61ca-a158-4a45-9022-6e5bab2e50af', 'Bank Policy Assesment using the Fair Finance Guide International (FFGI) Methodology', 'NGOF/2025-002', 'Mr. Heng Dara', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '013 456 982', 'heng.dara@gmail.com', '2025-12-01', '2026-01-01', 1250.00, 1250.00, 0.00, '$1250.00 USD', '$1250.00 USD', '', 'Mr. SOEUNG Saroeun', 'Mr. Heng Dara', 'Freelance Consultant', 'One Thousand Two Hundred Fifty US Dollars only', '', 'Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (100%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2026-01-01\", \"organization\": \"The NGO Forum on Cambodia\"}]', '2025-12-12 02:36:27', NULL, 1, '[{\"name\": \"Ms. OUM Somaly\", \"position\": \"SACHAS Program Manager\", \"phone\": \"081 647 963\", \"email\": \"somaly@ngoforum.org.kh\"}, {\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}]', 'K002-100054102', 'Passerelles Numeriques Cambodia'),
('6172338f-0cf2-4b3d-936e-649b80d3a034', 'Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'NGOF/2025-013', 'Mr. Chhea Chhouy', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+855 67408241', 'chhea.chhouy@student.passerellesnumeriques.org', '2025-10-10', '2025-11-09', 1225.00, 1225.00, 15.00, '$1225.00 USD', '$1041.25 USD', '', 'Mr. SOEUNG Saroeun', 'Mr. Chhea Chhouy', 'Freelance Consultant', 'One Thousand Two Hundred Twenty Five US Dollars only', '', 'Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (100%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-11-09\", \"organization\": \"The NGO Forum on Cambodia\"}]', '2025-10-10 06:20:40', '2025-10-10 13:55:22', 42, '[{\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}]', NULL, NULL),
('717bc7d6-d045-4d8a-9093-f7e37be16046', 'Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'NGOF/2025-005', 'Mr. Chhea Chhouy', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+855 67408241', 'chhea.chhouy@student.passerellesnumeriques.org', '2025-10-07', '2025-11-09', 1225.00, 1225.00, 15.00, '$1225.00 USD', '$1041.25 USD', '', 'Mr. SOEUNG Saroeun', 'Mr. Chhea Chhouy', 'Freelance Consultant', 'One Thousand Two Hundred Twenty Five US Dollars only', '', 'Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service; Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service; Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (30%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-10-07\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #2 (30%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-10-26\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #3 (40%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-11-09\", \"organization\": \"Cooperation Committee for Cambodia\"}]', '2025-10-07 03:03:40', '2025-10-09 13:41:15', 69, '[{\"name\": \"Mr. SOM Chettana\", \"position\": \"Finance Operation Manager\", \"phone\": \"076 754 8888\", \"email\": \"chettana@ngoforum.org.kh\"}, {\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\"}, {\"organization\": \"Cooperation Committee for Cambodia\", \"name\": \"Ms. SIN Putheary\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\"}]', '', ''),
('7b0c47ec-7db1-4d5f-b410-f5d2397cdc15', 'Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'NGOF/2025-001', 'Mr. SEAN Bunrith', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+85567408241', 'Seanbunrith@gmail.com', '2025-10-07', '2025-11-09', 2500.00, 2500.00, 15.00, '$2500.00 USD', '$2125.00 USD', '', 'Mr. SOEUNG Saroeun', 'Mr. SEAN Bunrith', 'Freelance Consultant', 'Two Thousand Five Hundred US Dollars only', '', 'Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\n Submit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (100%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\n Submit invoice and receipt of the service\", \"dueDate\": \"2025-11-09\", \"organization\": \"The NGO Forum on Cambodia\"}]', '2025-10-07 00:41:35', '2025-12-12 09:20:27', 69, '[{\"name\": \"Ms. OUM Somaly\", \"position\": \"SACHAS Program Manager\", \"phone\": \"081 647 963\", \"email\": \"somaly@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}]', NULL, NULL),
('a2a69d38-0299-4ce7-b562-3437a691e086', 'Consultant for producing the video documentary to promote piloting SNR guideline in Ratanakiri Province.', 'NGOF/2025-016', 'Mr. Kin Doung', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+85567408241', 'kin.doung@gmail.com', '2025-10-21', '2025-11-09', 1255.00, 1255.00, 15.00, '$1255.00 USD', '$1066.75 USD', '', 'Mr. SOEUNG Saroeun', 'Mr. Kin Doung', 'Freelance Consultant', 'One Thousand Two Hundred Fifty Five US Dollars only', '', 'Sign Agreement - Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF - Submit the well-written and comprehensive analysis report based on the outcomes of the analysis. - Present analysis report in a multi-stakeholder workshop. - Submit invoice and receipt of the service\r\nSign Agreement - Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF - Submit the well-written and comprehensive analysis report based on the outcomes of the analysis. - Present analysis report in a multi-stakeholder workshop. - Submit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (100%)\", \"deliverables\": \"Sign Agreement - Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF - Submit the well-written and comprehensive analysis report based on the outcomes of the analysis. - Present analysis report in a multi-stakeholder workshop. - Submit invoice and receipt of the service\\r\\nSign Agreement - Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF - Submit the well-written and comprehensive analysis report based on the outcomes of the analysis. - Present analysis report in a multi-stakeholder workshop. - Submit invoice and receipt of the service\", \"dueDate\": \"2025-11-09\", \"organization\": \"The NGO Forum on Cambodia\"}]', '2025-10-21 04:47:50', '2025-11-10 07:29:30', 69, '[{\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}, {\"name\": \"Ms. OUM Somaly\", \"position\": \"SACHAS Program Manager\", \"phone\": \"081 647 963\", \"email\": \"somaly@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}]', NULL, NULL),
('c2c5efdd-8603-4381-be92-29a44aa16b1c', 'Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'NGOF/2025-009', 'Mr. SEAN Bunrith', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+85567408241', 'Seanbunrith@gmail.com', '2025-10-08', '2025-11-09', 3350.00, 3350.00, 15.00, '$3350.00 USD', '$2847.50 USD', '', 'Mr. SOEUNG Saroeun', 'Mr. SEAN Bunrith', 'Freelance Consultant', 'Three Thousand Three Hundred Fifty US Dollars only', '', 'Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service; Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service; Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.', 'Budget analysis for MAFF for the NGOF', '{\"16\": \"I want to add more for the article 16.\"}', '[{\"description\": \"Installment #1 (30%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-10-08\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #2 (30%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-10-25\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #3 (40%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\", \"dueDate\": \"2025-11-09\", \"organization\": \"The NGO Forum on Cambodia\"}]', '2025-10-08 00:44:29', '2025-10-10 13:55:38', 43, '[{\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}, {\"name\": \"Ms. OUM Somaly\", \"position\": \"SACHAS Program Manager\", \"phone\": \"081 647 963\", \"email\": \"somaly@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}]', NULL, NULL),
('d1e20d93-5eb4-4f1a-b844-fadc2236c40a', 'Consultant for producing the video documentary to promote piloting SNR guideline in Ratanakiri Province.', 'NGOF/2025-011', 'Ms. CHAB Charyna', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+855 67408241', 'charyna.chab@student.passerellesnumeriques.org', '2025-10-09', '2025-11-09', 1225.00, 1225.00, 0.00, '$1225.00 USD', '$1225.00 USD', '', 'Mr. SOEUNG Saroeun', 'Ms. CHAB Charyna', 'Freelance Consultant', 'One Thousand Two Hundred Twenty Five US Dollars only', '', 'Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service; Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service; Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (30%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-10-09\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #2 (30%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-10-26\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #3 (40%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-11-09\", \"organization\": \"Cooperation Committee for Cambodia\"}]', '2025-10-09 03:26:18', '2025-10-10 13:55:28', 69, '[{\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}, {\"name\": \"Ms. OUM Somaly\", \"position\": \"SACHAS Program Manager\", \"phone\": \"081 647 963\", \"email\": \"somaly@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}, {\"organization\": \"Cooperation Committee for Cambodia\", \"short_name\": \"CCC\", \"name\": \"Ms. SIN Putheary\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#406 \\u179f\\u1787\\u178e\", \"registration_date\": \"06 June 2017\"}]', 'K002-100054102', 'The NGO Forum on Cambodia'),
('d6d7d9b7-e37f-4cc6-b3af-c9491130f64f', 'Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'NGOF/2025-010', 'Mr. SEAN Bunrith', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+85567408241', 'Seanbunrith@gmail.com', '2025-10-09', '2025-11-09', 1250.00, 1250.00, 0.00, '$1250.00 USD', '$1250.00 USD', '', 'Mr. SOEUNG Saroeun', 'Mr. SEAN Bunrith', 'Freelance Consultant', 'One Thousand Two Hundred Fifty US Dollars only', '', 'Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service; Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service; Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (30%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-10-09\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #2 (30%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-10-26\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #3 (40%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-11-09\", \"organization\": \"Cooperation Committee for Cambodia\"}]', '2025-10-09 02:09:43', '2025-10-10 13:55:35', 69, '[{\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}, {\"name\": \"Ms. OUM Somaly\", \"position\": \"SACHAS Program Manager\", \"phone\": \"081 647 963\", \"email\": \"somaly@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}, {\"organization\": \"Cooperation Committee for Cambodia\", \"short_name\": \"CCC\", \"name\": \"Ms. SIN Putheary\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}]', 'K002-100054102', 'The NGO Forum on Cambodia');
INSERT INTO `contracts` (`id`, `project_title`, `contract_number`, `party_b_full_name_with_title`, `party_b_address`, `party_b_phone`, `party_b_email`, `agreement_start_date`, `agreement_end_date`, `total_fee_usd`, `gross_amount_usd`, `tax_percentage`, `payment_gross`, `payment_net`, `workshop_description`, `party_a_signature_name`, `party_b_signature_name`, `party_b_position`, `total_fee_words`, `title`, `deliverables`, `output_description`, `custom_article_sentences`, `payment_installments`, `created_at`, `deleted_at`, `user_id`, `focal_person_info`, `party_a_info`, `deduct_tax_code`, `vat_organization_name`) VALUES
('decb7841-b071-4740-98ba-86c885ff2c46', 'Consultant for producing the video documentary to promote piloting SNR guideline in Ratanakiri Province.', 'NGOF/2025-017', 'Mr. Darin Hoy', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+855 67408241', 'darin.hoy@student.passerellesnumeriques.org', '2025-11-11', '2025-12-07', 1500.00, 1500.00, 15.00, '$1500.00 USD', '$1275.00 USD', '', 'Mr. SOEUNG Saroeun', 'Mr. Darin Hoy', 'Freelance Consultant', 'One Thousand Five Hundred US Dollars only', '', 'Sign Agreement \r\n Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF \r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis. \r\n Present analysis report in a multi-stakeholder workshop. \r\nSubmit invoice and receipt of the service\r\n Sign Agreement - Submit the draft outline \r\nSubmit the draft budget analysis to be submitted to NGOF \r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop. \r\nSubmit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (100%)\", \"deliverables\": \"Sign Agreement \\r\\n Submit the draft outline - Submit the draft budget analysis to be submitted to NGOF \\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis. \\r\\n Present analysis report in a multi-stakeholder workshop. \\r\\nSubmit invoice and receipt of the service\\r\\n Sign Agreement - Submit the draft outline \\r\\nSubmit the draft budget analysis to be submitted to NGOF \\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop. \\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-12-07\", \"organization\": \"The NGO Forum on Cambodia\"}]', '2025-11-11 06:43:56', '2025-11-27 14:17:49', 69, '[{\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}]', NULL, NULL),
('e06fe057-972c-4dc8-a5db-aeecd13ac20f', 'Consultant for producing the video documentary to promote piloting SNR guideline in Ratanakiri Province.', 'NGOF/2025-003', 'Mr. Khiev Kanal', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '012 387 971', 'khiev.kanal@gamil.com', '2025-12-02', '2026-01-02', 2535.00, 2535.00, 15.00, '$2535.00 USD', '$2154.75 USD', '', 'Mr. SOEUNG Saroeun', 'Mr. Khiev Kanal', 'Freelance Consultant', 'Two Thousand Five Hundred Thirty Five US Dollars only', '', 'Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (100%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2026-01-02\", \"organization\": \"The NGO Forum on Cambodia\"}]', '2025-12-12 02:53:21', NULL, 1, '[{\"name\": \"Mr. SOM Chettana\", \"position\": \"MACOR Program Manager\", \"phone\": \"076 754 8888\", \"email\": \"chettana@ngoforum.org.kh\"}, {\"name\": \"Mr. CHAN Vicheth\", \"position\": \"RITI Program Manager\", \"phone\": \"012 953 650\", \"email\": \"vicheth@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}]', '', ''),
('e094a1ce-8c6f-4963-9c44-57481c6bbc65', 'Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'NGOF/2025-004', 'Mr. Kin Doung', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+85567408241', 'kin.doung@gmail.com', '2025-10-07', '2025-11-09', 3255.00, 3255.00, 0.00, '$3255.00 USD', '$3255.00 USD', '', 'Mr. SOEUNG Saroeun', 'Mr. Kin Doung', 'Freelance Consultant', 'Three Thousand Two Hundred Fifty Five US Dollars only', '', 'Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service; Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service; Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (30%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-10-07\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #2 (30%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-10-26\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #3 (40%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-11-09\", \"organization\": \"The NGO Forum on Cambodia\"}]', '2025-10-07 00:50:26', '2025-12-12 08:35:51', 69, '[{\"name\": \"Mr. SOM Chettana\", \"position\": \"Finance Operation Manager\", \"phone\": \"076 754 8888\", \"email\": \"chettana@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}]', 'K002-100054102', 'The NGO Forum on Cambodia'),
('e32e750c-80c1-432b-a536-91dd70a572a0', 'Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'NGOF/2025-006', 'Mr. Kin Doung', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '+85567408241', 'kin.doung@gmail.com', '2025-10-07', '2025-11-09', 1235.00, 1235.00, 15.00, '$1235.00 USD', '$1049.75 USD', '', 'Mr. SOEUNG Saroeun', 'Mr. Kin Doung', 'Freelance Consultant', 'One Thousand Two Hundred Thirty Five US Dollars only', '', 'Sign Agreement \r\nSubmit the draft outline - Submit the draft budget analysis to be submitted to NGOF \r\nSubmit the well\r\nwritten and comprehensive analysis report based on the outcomes of the analysis. \r\nPresent analysis report in a multi-stakeholder workshop. \r\nSubmit invoice and receipt of the service; Sign Agreement \r\nSubmit the draft outline - Submit the draft budget analysis to be submitted to NGOF \r\nSubmit the well\r\nwritten and comprehensive analysis report based on the outcomes of the analysis. \r\nPresent analysis report in a multi-stakeholder workshop. \r\nSubmit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (50%)\", \"deliverables\": \"Sign Agreement \\r\\nSubmit the draft outline - Submit the draft budget analysis to be submitted to NGOF \\r\\nSubmit the well\\r\\nwritten and comprehensive analysis report based on the outcomes of the analysis. \\r\\nPresent analysis report in a multi-stakeholder workshop. \\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-10-07\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #2 (50%)\", \"deliverables\": \"Sign Agreement \\r\\nSubmit the draft outline - Submit the draft budget analysis to be submitted to NGOF \\r\\nSubmit the well\\r\\nwritten and comprehensive analysis report based on the outcomes of the analysis. \\r\\nPresent analysis report in a multi-stakeholder workshop. \\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-11-09\", \"organization\": \"The NGO Forum on Cambodia\"}]', '2025-10-07 07:24:54', '2025-10-09 13:41:21', 69, '[{\"name\": \"Ms. OUM Somaly\", \"position\": \"SACHAS Program Manager\", \"phone\": \"081 647 963\", \"email\": \"somaly@ngoforum.org.kh\"}, {\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\"}]', '', ''),
('f136d57b-715c-4e8c-b64e-4f18bc2a30ba', 'Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'NGOF/2025-001', 'Mr. SEAN Bunrith', '#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia', '012 845 091', 'Seanbunrith@gmail.com', '2025-12-01', '2026-01-01', 2500.00, 2500.00, 15.00, '$2500.00 USD', '$2125.00 USD', '', 'Mr. SOEUNG Saroeun', 'Mr. SEAN Bunrith', 'Freelance Consultant', 'Two Thousand Five Hundred US Dollars only', '', 'Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\nSubmit invoice and receipt of the service; Sign Agreement\r\nSubmit the draft outline\r\nSubmit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.; Submit the draft budget analysis to be submitted to NGOF\r\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\r\nPresent analysis report in a multi-stakeholder workshop.\r\n Submit invoice and receipt of the service', 'Budget analysis for MAFF for the NGOF', '{}', '[{\"description\": \"Installment #1 (40%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\nSubmit invoice and receipt of the service\", \"dueDate\": \"2025-12-12\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #2 (30%)\", \"deliverables\": \"Sign Agreement\\r\\nSubmit the draft outline\\r\\nSubmit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\", \"dueDate\": \"2025-12-22\", \"organization\": \"The NGO Forum on Cambodia\"}, {\"description\": \"Installment #3 (30%)\", \"deliverables\": \"Submit the draft budget analysis to be submitted to NGOF\\r\\nSubmit the well-written and comprehensive analysis report based on the outcomes of the analysis.\\r\\nPresent analysis report in a multi-stakeholder workshop.\\r\\n Submit invoice and receipt of the service\", \"dueDate\": \"2026-01-01\", \"organization\": \"The NGO Forum on Cambodia\"}]', '2025-12-12 02:31:52', NULL, 1, '[{\"name\": \"Mr. MAR Sophal\", \"position\": \"PALI Program Manager\", \"phone\": \"012 845 091\", \"email\": \"sophal@ngoforum.org.kh\"}]', '[{\"organization\": \"The NGO Forum on Cambodia\", \"short_name\": \"NGOF\", \"name\": \"Mr. SOEUNG Saroeun\", \"position\": \"Executive Director\", \"address\": \"#9-11, Street 476, Sangkat Tuol Tumpoung I, Phnom Penh, Cambodia\", \"registration_number\": \"#304 \\u179f\\u1787\\u178e\", \"registration_date\": \"07 March 2012\"}]', '', '');

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
  `end_date` date DEFAULT NULL,
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
('19f6da01-8603-4a29-873a-14c59aff5d05', 'NGOF-UDC/001', 'Undefined Duration Contract (UDC)', 'The NGO Forum on Cambodia', 'Mr. Soeung Saroeun', 'Executive Director', '#9-11, St. 476, Sangkat Toul Tompong I, Khan Chamka Morn, Phnom Penh, Cambodia', '023 214 429', '023 994 063', 'info@ngoforum.org.kh', 'Mr. Som Chettana', '271\r\nPhnom Penh', '013234535', 'som@ngoforum.org.kh', 'Finance and Operations Manager', '2025-02-01', NULL, 'Monday to Friday: 08:00am-12:00pm and 01:30pm-05:00pm', 1200.00, 'G4/L5', 'One Thousand Two Hundred US Dollars only', 150.00, 60.00, 200.00, 200.00, 200.00, 8.33, 1, 'Mr. Soeung Saroeun', 'Mr. Som Chettana', '2025-02-01', '2025-02-01', 'active', '2025-10-22 09:49:57', '2025-12-12 01:52:27', '2025-12-12 01:52:27'),
('206b974d-b1bd-47a1-9043-ec30792d751c', 'NGOF-UDC/001', 'Undefined Duration Contract (UDC)', 'The NGO Forum on Cambodia', 'Mr. Soeung Saroeun', 'Executive Director', '#9-11 Street 476, Toul Tompong, P.O. Box 2295, Phnom Penh 3, Cambodia.', '023 214 429', '023 994 063', 'info@ngoforum.org.kh', 'Ms. Oum Somaly', '#9-11 Street 476, Toul Tompong, P.O. Box 2295, Phnom Penh 3, Cambodia.', '012 345 768', 'somaly@ngoforum.org.kh', 'Solidarity Action for Community Harmonization and Sustainability', '2025-01-01', NULL, 'Monday to Friday: 08:00am-12:00pm and 01:30pm-05:00pm', 1500.00, 'G4/L5', 'One Thousand Five Hundred US Dollars only', 150.00, 60.00, 200.00, 200.00, 200.00, 8.33, 1, 'Mr. Soeung Saroeun', 'Ms. Oum Somaly', '2025-01-01', '2025-01-01', 'active', '2025-11-11 06:57:11', '2025-12-12 01:52:23', '2025-12-12 01:52:23'),
('602803d2-bff3-41be-a8e9-433c1b2bd8a5', 'NGOF-FDC/001', 'Fixed Duration Contract (FDC)', 'The NGO Forum on Cambodia', 'Mr. Soeung Saroeun', 'Executive Director', '#9-11, St. 476, Sangkat Toul Tompong I, Khan Chamka Morn, Phnom Penh, Cambodia', '023 214 429', '023 994 063', 'info@ngoforum.org.kh', 'Mr. Chan Vicheth', '#155, St.113, Sangkat Boeung Keng Kang III, Khan Boeung Keng Kang, Phnom Penh.', '012 953 650', 'vichethchan@gmail.com', 'Capacity Development Specialist', '2025-01-01', '2026-01-01', 'Monday to Friday: 08:00am-12:00pm and 01:30pm-05:00pm', 1225.00, 'G4/L5', 'One Thousand Two Hundred Twenty-five US Dollars only', 150.00, 60.00, 200.00, 200.00, 200.00, 8.33, 1, 'Mr. Soeung Saroeun', 'Mr. Chan Vicheth', '2025-01-01', '2025-01-01', 'active', '2025-10-22 08:34:12', '2025-12-12 01:52:30', '2025-12-12 01:52:30'),
('8b068368-a365-4678-8a69-0dd05413870c', 'NGOF-UDC/001', 'Undefined Duration Contract (UDC)', 'The NGO Forum on Cambodia', 'Mr. Soeung Saroeun', 'Executive Director', '#9-11, St. 476, Sangkat Toul Tompong I, Khan Chamka Morn, Phnom Penh, Cambodia', '023 214 429', '023 994 063', 'info@ngoforum.org.kh', 'Mr. Chhea Chhouy', '271\r\nPhnom Penh', '067408241', 'chhea.chhouy@student.passerellesnumeriques.org', 'IT Programming Intern', '2025-11-05', NULL, 'Monday to Friday: 08:00am-12:00pm and 01:30pm-05:00pm', 1250.00, 'G4/L5', 'One Thousand Two Hundred Fifty US Dollars only', 150.00, 60.00, 200.00, 200.00, 200.00, 8.33, 0, 'Mr. Soeung Saroeun', 'Mr. Chhea Chhouy', '2025-11-05', '2025-11-05', 'active', '2025-11-26 01:31:53', '2025-12-12 01:52:18', '2025-12-12 01:52:18'),
('a5e508da-762e-4cf0-a88b-5f23fab428ba', 'NGOF-FDC/001', 'Fixed Duration Contract (FDC)', 'The NGO Forum on Cambodia', 'Mr. Soeung Saroeun', 'Executive Director', '#9-11, St. 476, Sangkat Toul Tompong I, Khan Chamka Morn, Phnom Penh, Cambodia', '023 214 429', '023 994 063', 'info@ngoforum.org.kh', 'Mr. Kin Doung', '271\r\nPhnom Penh', '067408241', 'kin.doung@student.passerellesnumeriques.org', 'IT Programming Intern', '2025-11-01', '2026-11-01', 'Monday to Friday: 08:00am-12:00pm and 01:30pm-05:00pm', 1500.00, 'G4/L5', 'One Thousand Five Hundred US Dollars only', 150.00, 60.00, 200.00, 200.00, 200.00, 8.33, 1, 'Mr. Soeung Saroeun', 'Mr. Kin Doung', '2025-11-01', '2025-11-01', 'active', '2025-11-26 01:33:00', '2025-12-12 01:52:14', '2025-12-12 01:52:14');

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
(99, 1, 1, 'New Contract Created: Consultant for the Development of Budget Analysis on Reviewing the MAFF’s Budget Allocation Trend', 'Contract NGOF/2025-001 created by RIDD Chansoksreynich', 1, '2025-12-12 02:31:52', 'f136d57b-715c-4e8c-b64e-4f18bc2a30ba'),
(100, 1, 1, 'New Contract Created: Bank Policy Assesment using the Fair Finance Guide International (FFGI) Methodology', 'Contract NGOF/2025-002 created by RIDD Chansoksreynich', 1, '2025-12-12 02:36:27', '5adc61ca-a158-4a45-9022-6e5bab2e50af'),
(101, 1, 1, 'New Contract Created: Consultant for producing the video documentary to promote piloting SNR guideline in Ratanakiri Province.', 'Contract NGOF/2025-003 created by RIDD Chansoksreynich', 1, '2025-12-12 02:53:21', 'e06fe057-972c-4dc8-a5db-aeecd13ac20f');

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
(1, 'RIDD Chansoksreynich', 'sreynich@ngoforum.org.kh', 'pbkdf2:sha256:600000$on1t0JZvg5ScIvcf$1aff88dfd2f8bacf30af30896b26617cb64792dff012b0a7a2a6a8cf35b89b47', 'nich.jpg', '0976313871', 'Phum Tropeang Chhuk Street 371, Phnom P...', '2025-09-03 03:53:14', '2025-12-12 02:04:29', 5, 4),
(2, 'SOM Chettana', 'chettana@ngoforum.org.kh', 'pbkdf2:sha256:600000$wysnkwhMxS4OnefB$031b667f79b5aea6e8fee656caf4434f5cd2b9f1977cefd44585b1e1be54eacf', 'chettana.jpg', '067408245', 'Phum Tropeang Chhuk\r\nStreet 371, Phnom Penh', '2025-12-12 02:07:15', '2025-12-12 02:07:15', 6, 4),
(3, 'CHAN Vicheth', 'vicheth@ngoforum.org.kh', 'pbkdf2:sha256:600000$beHyGXrDbP1XKdyD$022e79c246fac7dd05e45bf042a3f6d73266f6a7fb53af3530b265f362d6dc37', 'vicheth.jpg', '067408242', 'Phum Tropeang Chhuk\r\nStreet 371, Phnom Penh', '2025-12-12 02:08:21', '2025-12-12 02:08:21', 6, 3),
(4, ' OUM Somaly', 'somaly@ngoforum.org.kh', 'pbkdf2:sha256:600000$i1K9lwCotYd2HUjZ$f1025cc302d808ce1ca7782f17561ab99c7594dbb16700d090109476bb9a1f42', 'somaly.jpg', '067408249', 'Phum Tropeang Chhuk\r\nStreet 371, Phnom Penh', '2025-12-12 02:09:11', '2025-12-12 02:09:11', 6, 2),
(5, 'MAR Sophal', 'sophal@ngoforum.org.kh', 'pbkdf2:sha256:600000$hYJdOGzebdy0QN48$d2eb8bc55be2903df32fc12560ea5110254c6796d746febc9c5cbe8bf959a8b6', 'sophal.jpg', '067408241', 'Phum Tropeang Chhuk\r\nStreet 371, Phnom Penh', '2025-12-12 02:09:48', '2025-12-12 02:09:48', 6, 1),
(6, 'KONG Sereymongkol', 'sereymongkol@ngoforum.org.kh', 'pbkdf2:sha256:600000$apy2yRR0NzbZCCeh$cdb93a459003aebde44f6d471ba453c9102ce781a9ccf3c4dcf76ff1648d2e88', 'mongkol.jpg', '067408248', 'Phum Tropeang Chhuk\r\nStreet 371, Phnom Penh', '2025-12-12 02:11:07', '2025-12-12 02:11:07', 7, 2),
(7, 'CHHOUY Chhea', 'chhea@ngoforum.org.kh', 'pbkdf2:sha256:600000$mAebhryRynTRGddc$d66d2bccb97016b0c2f45cd5c6350032f715dd2941bf07885172716ebc0cc137', 'chhea-chhouy.jpg', '067408243', 'Phum Tropeang Chhuk\r\nStreet 371, Phnom Penh', '2025-12-12 02:12:31', '2025-12-12 02:12:31', 7, 4);

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
  ADD KEY `user_id` (`user_id`);

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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

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

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contracts`
--
ALTER TABLE `contracts`
  ADD CONSTRAINT `contracts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
