-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 19 2025 г., 13:34
-- Версия сервера: 8.0.30
-- Версия PHP: 8.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `zhkh`
--

-- --------------------------------------------------------

--
-- Структура таблицы `application`
--

CREATE TABLE `application` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `profession_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(50) DEFAULT 'Новая',
  `cancel_reason` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `application`
--

INSERT INTO `application` (`id`, `user_id`, `profession_id`, `title`, `description`, `status`, `cancel_reason`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'Проблема с краном', 'Сломался', 'Отменена', NULL, '2025-11-19 10:04:00', '2025-11-19 10:05:58'),
(2, 2, 2, 'Проблема с краном', 'Сломаааался', 'Выполнена', NULL, '2025-11-19 10:20:19', '2025-11-19 10:20:37');

-- --------------------------------------------------------

--
-- Структура таблицы `profession`
--

CREATE TABLE `profession` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `profession`
--

INSERT INTO `profession` (`id`, `name`) VALUES
(1, 'Сантехник'),
(2, 'Электрик'),
(3, 'Мелкий ремонт'),
(4, 'Другое'),
(5, 'Строитель');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `fio` varchar(255) NOT NULL,
  `login` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role` enum('user','admin') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `fio`, `login`, `email`, `phone`, `password`, `address`, `created_at`, `role`) VALUES
(2, 'Волженин ЕГ', 'ffdd', 'aaa@gmail.com', '+7-(999)-888-77-11', '$2y$13$SUjBoQFTc0wthMViBm0r.OOlGK6awcwWMqS2xL7B8Ikc6PdbijekK', 'asdasdasd', '2025-11-19 09:42:44', 'user'),
(3, 'Админ', 'admin', 'admin@gmail.com', '+7-(999)-333-44-55', '$2y$13$QP/v5/MEwltCIahVJSwS.ezEtCZrIMiX9rKj8FYw5uFW2AwDRccjy', 'ААа', '2025-11-19 10:15:27', 'admin');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `profession_id` (`profession_id`);

--
-- Индексы таблицы `profession`
--
ALTER TABLE `profession`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `application`
--
ALTER TABLE `application`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `profession`
--
ALTER TABLE `profession`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `application`
--
ALTER TABLE `application`
  ADD CONSTRAINT `application_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `application_ibfk_2` FOREIGN KEY (`profession_id`) REFERENCES `profession` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
