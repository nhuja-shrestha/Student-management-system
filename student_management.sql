-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2025 at 02:57 AM
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
-- Database: `student_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` enum('present','absent','leave') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `student_id`, `subject_id`, `date`, `status`, `created_at`) VALUES
(6, 17, 2, '2025-10-31', 'present', '2025-10-31 15:28:44'),
(7, 18, 2, '2025-10-31', 'present', '2025-10-31 15:28:44'),
(8, 19, 6, '2025-10-31', 'present', '2025-10-31 15:41:25'),
(9, 20, 6, '2025-10-31', 'absent', '2025-10-31 15:41:25'),
(10, 17, 2, '2025-10-31', 'absent', '2025-10-31 15:56:38'),
(11, 18, 2, '2025-10-31', 'present', '2025-10-31 15:56:38'),
(12, 21, 11, '2025-11-04', 'present', '2025-11-01 04:39:29');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dep_id` int(11) NOT NULL,
  `dep_name` varchar(100) NOT NULL,
  `total_semesters` int(50) DEFAULT 8
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dep_id`, `dep_name`, `total_semesters`) VALUES
(3, 'BCA', 8);

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

CREATE TABLE `marks` (
  `mark_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `exam_name` varchar(100) NOT NULL,
  `marks_obtained` int(11) NOT NULL,
  `total_marks` int(11) NOT NULL,
  `exam_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `marks`
--

INSERT INTO `marks` (`mark_id`, `student_id`, `subject_id`, `exam_name`, `marks_obtained`, `total_marks`, `exam_date`) VALUES
(1, 17, 2, 'Internal exams', 95, 100, '2025-10-31'),
(2, 18, 2, 'Internal exams', 90, 100, '2025-10-31'),
(3, 19, 6, 'Board exams', 60, 60, '2025-10-31'),
(4, 20, 6, 'Board exams', 50, 60, '2025-10-31'),
(5, 17, 2, 'pre board', 90, 100, '2025-10-31'),
(6, 18, 2, 'pre board', 95, 100, '2025-10-31');

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `notice_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `posted_by` int(11) DEFAULT NULL,
  `posted_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notices`
--

INSERT INTO `notices` (`notice_id`, `title`, `content`, `posted_by`, `posted_on`) VALUES
(1, 'about submission of assignment.', 'All the students are required to submit there assignment by deadline. submission after deadline will not be valued and marked.', 1, '2025-10-31 11:23:06'),
(4, 'about new assignment.', '', 24, '2025-11-01 05:25:52'),
(5, 'hey', 'hello', 24, '2025-11-01 06:10:07'),
(6, 'about new project', 'I have given all the project details. I want it submitted by the deadline', 24, '2025-11-01 06:12:44'),
(7, 'unseen holiday notice', 'due to the present condition of weather recently, your classes will remain closed on monday,2082/07/17', 1, '2025-11-01 06:34:43'),
(8, 'hey mann', 'homework dey', 1, '2025-11-02 00:41:36');

-- --------------------------------------------------------

--
-- Table structure for table `semesters`
--

CREATE TABLE `semesters` (
  `semester_id` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `semester_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `semesters`
--

INSERT INTO `semesters` (`semester_id`, `dep_id`, `semester_name`) VALUES
(14, 3, '1st Semester'),
(15, 3, '2nd Semester'),
(16, 3, '3rd Semester'),
(17, 3, '4th Semester'),
(18, 3, '5th Semester'),
(19, 3, '6th Semester'),
(20, 3, '7th_semester'),
(21, 3, '8th_semester');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `roll_no` varchar(20) NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `dep_id` int(11) DEFAULT 3,
  `semester_id` int(11) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `name`, `user_id`, `roll_no`, `dob`, `gender`, `dep_id`, `semester_id`, `phone`, `address`) VALUES
(17, 'Nhuja shrestha', 38, '1', '2025-10-31', 'Male', 3, 14, '9823828371', 'Sankhu'),
(18, 'Alisha khiuju', 39, '2', '2025-10-31', 'Female', 3, 14, '98283928932', 'sallaghari'),
(19, 'prathu Mhrzn', 40, '3', '2025-10-31', 'Male', 3, 15, '9823828371', 'Sankhu'),
(20, 'Dinila Rasaili', 41, '4', '2025-10-31', 'Female', 3, 15, '0987434989', 'chabahil'),
(21, 'Nhujala', 44, '5', '2025-10-31', 'Male', 3, 16, '9823828371', 'Sankhu');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `subject_name` varchar(50) NOT NULL,
  `subject_code` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_id`, `semester_id`, `subject_name`, `subject_code`) VALUES
(1, 14, 'CFA', 'CACS101'),
(2, 14, 'Mathematics I', 'CACS104'),
(3, 14, 'Digital Logic', 'CACS105'),
(4, 14, 'English', 'CACS103'),
(5, 14, 'Society and Technology', 'CACS102'),
(6, 15, 'C-programming', 'CACS151'),
(7, 15, 'Financial Accounting', 'CAAC152'),
(8, 15, 'English II', 'CAEN153'),
(9, 15, 'Mathematics II', 'CAMT154'),
(10, 15, 'Microprocessor', 'CACS155'),
(11, 16, 'Data Structure & Algorithms', 'CACS201'),
(12, 16, 'Probability & Statistics', 'CAST202'),
(13, 16, 'System Analysis & Design', 'CACS203'),
(14, 16, 'Object Oriented Programming in Java', 'CACS204'),
(15, 16, 'Web Technology', 'CACS205'),
(16, 17, 'Operating System', 'CACS251'),
(17, 17, 'Numerical Methods', 'CACS252'),
(18, 17, 'Software Engineering', 'CACS253'),
(19, 17, 'Scripting Languages', 'CACS254'),
(20, 17, 'Database Management System', 'CACS255'),
(21, 18, 'Management Information System and e-Business', 'CACS301'),
(22, 18, '.NET Technology', 'CACS302'),
(23, 18, 'Computer Networking', 'CACS303'),
(24, 18, 'Introduction to Management', 'CAMG304'),
(25, 18, 'Computer Graphics and Animation', 'CACS305'),
(26, 19, 'Mobile Programming', 'CACS351'),
(27, 19, 'Distributed System', 'CACS352'),
(28, 19, 'Applied Economics', 'CACS353'),
(29, 19, 'Advanced Java Programming', 'CACS354'),
(30, 19, 'Network Programming', 'CACS355'),
(31, 20, 'Cyber Law and Professional Ethics', 'CACS401'),
(32, 20, 'Cloud Computing', 'CACS402'),
(33, 20, 'Internship', 'CAIN403'),
(34, 21, 'Operations Research', 'CAOR451'),
(35, 21, 'Project III', 'CAPJ452');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `teacher_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `phone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`teacher_id`, `user_id`, `subject_id`, `phone`) VALUES
(5, 24, 2, '9869768553'),
(6, 42, 6, '982389123'),
(7, 45, 20, '39470482');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_subjects`
--

CREATE TABLE `teacher_subjects` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','teacher','student') NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `role`, `name`, `email`) VALUES
(1, 'Nhuja', 'admin@123', 'admin', 'Nhuja', 'admin@example.com'),
(24, 'lasta01', 'lastey@123', 'teacher', 'Lasata Shrestha', 'lasata@gmail.com'),
(38, 'Nhuja03', 'Nhujey@123', 'student', 'Nhuja shrestha', 'nhujashrestha121212@gmail.com'),
(39, 'Alisha02', 'alisha@123', 'student', 'Alisha khiuju', 'alisha@gmail.com'),
(40, 'Praths', 'prath@123', 'student', 'prathu Mhrzn', 'praths@gmail.com'),
(41, 'Dinila', 'dinila@123', 'student', 'Dinila Rasaili', 'dinila@gmail.com'),
(42, 'Rayleigh', 'rayleigh@123', 'teacher', 'Silver_Rayleigh', 'silver@gmail.com'),
(44, 'Nhujala', 'Nhuja@123', 'student', 'Nhujala', 'nhujashrestha1212@gmail.com'),
(45, 'Zoro', 'zoro@123', 'teacher', 'Roronoa Zoro', 'zoro@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `fk_attendance_subject` (`subject_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dep_id`);

--
-- Indexes for table `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`mark_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`notice_id`),
  ADD KEY `posted_by` (`posted_by`);

--
-- Indexes for table `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`semester_id`),
  ADD KEY `fk_semesters_course` (`dep_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `roll_no` (`roll_no`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_students_course` (`dep_id`),
  ADD KEY `fk_students_semester` (`semester_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`),
  ADD KEY `fk_subjects_semester` (`semester_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`teacher_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `teacher_subjects`
--
ALTER TABLE `teacher_subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `dep_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `marks`
--
ALTER TABLE `marks`
  MODIFY `mark_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `notice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `semesters`
--
ALTER TABLE `semesters`
  MODIFY `semester_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `teacher_subjects`
--
ALTER TABLE `teacher_subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_attendance_subject` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `marks`
--
ALTER TABLE `marks`
  ADD CONSTRAINT `fk_marks_subject` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `marks_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Constraints for table `notices`
--
ALTER TABLE `notices`
  ADD CONSTRAINT `notices_ibfk_1` FOREIGN KEY (`posted_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `semesters`
--
ALTER TABLE `semesters`
  ADD CONSTRAINT `fk_semesters_course` FOREIGN KEY (`dep_id`) REFERENCES `department` (`dep_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `semesters_ibfk_1` FOREIGN KEY (`dep_id`) REFERENCES `department` (`dep_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `fk_students_course` FOREIGN KEY (`dep_id`) REFERENCES `department` (`dep_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_students_semester` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`semester_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`dep_id`) REFERENCES `department` (`dep_id`) ON DELETE SET NULL;

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `fk_subjects_semester` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`semester_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `teachers_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`);

--
-- Constraints for table `teacher_subjects`
--
ALTER TABLE `teacher_subjects`
  ADD CONSTRAINT `teacher_subjects_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teacher_subjects_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
