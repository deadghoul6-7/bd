-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 23 2023 г., 16:06
-- Версия сервера: 10.4.24-MariaDB
-- Версия PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `system_of_city_telephone_network`
--

-- --------------------------------------------------------

--
-- Структура таблицы `addresses`
--

CREATE TABLE `addresses` (
  `phone_number` varchar(17) NOT NULL,
  `index_number` varchar(11) NOT NULL,
  `area` varchar(11) NOT NULL,
  `street` varchar(11) NOT NULL,
  `house` varchar(11) NOT NULL,
  `apartment` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `addresses`
--

INSERT INTO `addresses` (`phone_number`, `index_number`, `area`, `street`, `house`, `apartment`) VALUES
('+7(143)456-44-44', '123456', 'Центральный', ' Ленина', '11', '15'),
('+7(333)333-78-92', '654321', 'Северный', 'Пушкина', '16', '17'),
('+7(412)456-78-91', '111111', 'Южный', 'Пролетарска', '1', '1');

-- --------------------------------------------------------

--
-- Структура таблицы `ats`
--

CREATE TABLE `ats` (
  `phone_number` varchar(17) NOT NULL,
  `name_ats` varchar(40) NOT NULL,
  `address_ats` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ats`
--

INSERT INTO `ats` (`phone_number`, `name_ats`, `address_ats`) VALUES
('+7(111)111-11-11', 'Городская АТС №1', 'ул. Ленина, 1'),
('+7(222)222-22-22', 'Городская АТС №2', 'ул. Пушкина, 2'),
('+7(333)333-33-33', 'Городская АТС №3', 'ул. Пролетарская, 5');

-- --------------------------------------------------------

--
-- Структура таблицы `employees`
--

CREATE TABLE `employees` (
  `second_name` varchar(11) NOT NULL,
  `name` varchar(11) NOT NULL,
  `surname` varchar(11) NOT NULL,
  `job_title` varchar(15) NOT NULL,
  `phone_number` varchar(17) NOT NULL,
  `number_ats` varchar(17) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `employees`
--

INSERT INTO `employees` (`second_name`, `name`, `surname`, `job_title`, `phone_number`, `number_ats`) VALUES
('Иванов', 'Руслан', 'Иванович', 'Инженер', '+7(111)111-11-11', '+7(111)111-11-11'),
('Николаев ', 'Руслан', 'Даниилович', 'Администратор', '+7(222)222-22-22', '+7(222)222-22-22'),
('Белоусов', 'Георгий', 'Егорович', 'Техник', '+7(333)333-33-33', '+7(333)333-33-33');

-- --------------------------------------------------------

--
-- Структура таблицы `intercity`
--

CREATE TABLE `intercity` (
  `phone_number` varchar(17) NOT NULL,
  `state` text NOT NULL,
  `disable_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `long_distance_debt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `intercity`
--

INSERT INTO `intercity` (`phone_number`, `state`, `disable_date`, `start_date`, `long_distance_debt`) VALUES
('+7(143)456-44-44', 'Открыт', NULL, NULL, 0),
('+7(333)333-78-92', 'Закрыт', '2023-08-25', '2023-09-02', 1500),
('+7(412)456-78-91', 'Открыт', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `subscribers`
--

CREATE TABLE `subscribers` (
  `phone_number` varchar(17) NOT NULL,
  `second_name` varchar(11) NOT NULL,
  `name` varchar(11) NOT NULL,
  `surname` varchar(11) NOT NULL,
  `gender` varchar(11) NOT NULL,
  `age` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `subscribers`
--

INSERT INTO `subscribers` (`phone_number`, `second_name`, `name`, `surname`, `gender`, `age`) VALUES
('+7(143)456-44-44', 'Иванов', 'Иван', 'Иванович', 'М', 35),
('+7(333)333-78-92', 'Сидоров', 'Алексей', 'Сергеевич', 'М', 47),
('+7(412)456-78-91', 'Петров', 'Петр', 'Петрович', 'М', 20);

-- --------------------------------------------------------

--
-- Структура таблицы `subscription_board`
--

CREATE TABLE `subscription_board` (
  `phone_number` varchar(17) NOT NULL,
  `amount_of_subscription_fee` int(11) NOT NULL,
  `penalty_amount` int(11) NOT NULL,
  `last_payment_date` date NOT NULL,
  `beneficiary` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `subscription_board`
--

INSERT INTO `subscription_board` (`phone_number`, `amount_of_subscription_fee`, `penalty_amount`, `last_payment_date`, `beneficiary`) VALUES
('+7(143)456-44-44', 500, 0, '2023-06-15', 1),
('+7(333)333-78-92', 600, 100, '2023-08-01', 0),
('+7(412)456-78-91', 400, 0, '2023-09-01', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `addresses`
--
ALTER TABLE `addresses`
  ADD KEY `phone_number` (`phone_number`);

--
-- Индексы таблицы `ats`
--
ALTER TABLE `ats`
  ADD PRIMARY KEY (`phone_number`);

--
-- Индексы таблицы `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`phone_number`);

--
-- Индексы таблицы `intercity`
--
ALTER TABLE `intercity`
  ADD KEY `phone_number` (`phone_number`);

--
-- Индексы таблицы `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`phone_number`);

--
-- Индексы таблицы `subscription_board`
--
ALTER TABLE `subscription_board`
  ADD KEY `phone_number` (`phone_number`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `subscribers` (`phone_number`);

--
-- Ограничения внешнего ключа таблицы `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `ats` (`phone_number`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `intercity`
--
ALTER TABLE `intercity`
  ADD CONSTRAINT `intercity_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `subscribers` (`phone_number`);

--
-- Ограничения внешнего ключа таблицы `subscription_board`
--
ALTER TABLE `subscription_board`
  ADD CONSTRAINT `subscription_board_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `subscribers` (`phone_number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
