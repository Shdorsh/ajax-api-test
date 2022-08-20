-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2022 at 03:15 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spotify_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `artists`
--

CREATE TABLE `artists` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `bio` text NOT NULL,
  `gender` enum('Male','Female','','') NOT NULL,
  `birth_year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `artists`
--

INSERT INTO `artists` (`id`, `name`, `bio`, `gender`, `birth_year`) VALUES
(1, 'Justin Bieber', 'Lorem ipsum dolor sit amet.', 'Male', 2002),
(2, 'Nepal', 'Népal attache énormément d\'importance à l\'anonymat, il ne se montre qu\'encapuchonné, masqué, cagoulé ou même maquillé.', 'Male', 1990),
(3, 'Elvis presley', 'groovy', 'Male', 1940);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`) VALUES
(1, 'Pop'),
(2, 'Rock'),
(3, 'Rap'),
(4, 'Funk'),
(5, 'Metal'),
(6, 'Classic');

-- --------------------------------------------------------

--
-- Table structure for table `playlists`
--

CREATE TABLE `playlists` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `creation_date` date NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `playlist_content`
--

CREATE TABLE `playlist_content` (
  `playlist_id` int(11) NOT NULL,
  `song_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE `songs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `release_date` date NOT NULL,
  `poster` varchar(255) DEFAULT NULL,
  `artist_id` int(11) NOT NULL,
  `categ_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`id`, `title`, `release_date`, `poster`, `artist_id`, `categ_id`) VALUES
(1, 'Malik al mawt', '2019-02-03', NULL, 2, 3),
(2, 'Niveau 1', '2016-05-01', NULL, 2, 3),
(3, 'Baby', '2012-05-04', NULL, 1, 1),
(4, 'Baby (Ganxxta Rap Edition, 18+, VERY EXPLICIT) ', '2022-08-02', NULL, 1, 3),
(6, 'Walk Hard', '0000-00-00', NULL, 3, 3),
(7, 'Jailhouse Rock', '0000-00-00', NULL, 3, 3),
(8, 'Moitié Homme Moitié Napalm', '0000-00-00', NULL, 2, 4),
(9, 'Little Less Conversation', '1956-10-08', NULL, 3, 2),
(10, 'Im a Belieber', '2022-08-10', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `picture`) VALUES
(1, 'allgood verygoodform', 'form@checker.good', '1234567890', ''),
(2, 'legituser', 'leg@it.it', 'helloworld', ''),
(3, 'olaf', 'olaf@olafsson.ol', 'falo', ''),
(6, '&lt;h1&gt;validn ame&lt;/h1&gt;', 'test@goodemail.de', '1b8f6a3ae0bbd4c39911fb096055fc66', ''),
(11, 'myName', 'my@Ema.il', '$2y$10$erw.k3HjzanqpY1XrG9CMujLchDazfM7sBmvoZab9m0g0I5HszwZm', ''),
(16, 'chucky', 'chuck.chucksson@chucky.ch', '$2y$10$JxqvQNDYK3DxF4rCZdXQUulh2N72r6.QyDpOrJnZoFC9ytm7XMpXG', 'chucky_1659705021'),
(17, 'andy', 'andrew.anders@andersson.an', '$2y$10$z4wW6U558mkfV4M6nBojlevnestR/JFOzu/S43sAGoy9h7BfnvW0S', 'andy_1659705189'),
(18, 'testinho', 'test@test.test', '$2y$10$nuwJomW7JHb85agrK3Vt/uFaIswswb6kcoYfz5fEDHMM/BFVI1ok.', 'testinho_1659947127.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `playlists`
--
ALTER TABLE `playlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `playlist_content`
--
ALTER TABLE `playlist_content`
  ADD PRIMARY KEY (`playlist_id`,`song_id`),
  ADD KEY `song_id` (`song_id`);

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categ_id` (`categ_id`),
  ADD KEY `artist_id` (`artist_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artists`
--
ALTER TABLE `artists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `playlists`
--
ALTER TABLE `playlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `playlists`
--
ALTER TABLE `playlists`
  ADD CONSTRAINT `playlists_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `playlist_content`
--
ALTER TABLE `playlist_content`
  ADD CONSTRAINT `playlist_content_ibfk_1` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`id`),
  ADD CONSTRAINT `playlist_content_ibfk_2` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`);

--
-- Constraints for table `songs`
--
ALTER TABLE `songs`
  ADD CONSTRAINT `songs_ibfk_2` FOREIGN KEY (`categ_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `songs_ibfk_3` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
