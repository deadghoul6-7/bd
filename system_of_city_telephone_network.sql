-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 18 2023 г., 08:00
-- Версия сервера: 10.4.24-MariaDB
-- Версия PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `tel_kursach`
--

-- --------------------------------------------------------

--
-- Структура таблицы `abonents`
--

CREATE TABLE `abonents` (
  `id_abonent` int(11) NOT NULL,
  `surname` text DEFAULT NULL,
  `name` text DEFAULT NULL,
  `patronymic` text DEFAULT NULL,
  `gender` text DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `id_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='абоненты .id_абонимента, фамилия, имя, отчество, пол,  возраст, id_гатегории';

--
-- Дамп данных таблицы `abonents`
--

INSERT INTO `abonents` (`id_abonent`, `surname`, `name`, `patronymic`, `gender`, `age`, `id_category`) VALUES
(1, 'иванов', 'иван', 'иванович', 'мужчина', 35, 1),
(2, 'Пановна', 'Ольга', 'Агапова', 'женщина', 60, 2),
(3, 'Павлов', 'Павел', 'Павлович', 'мужчина', 27, 1),
(5, 'Бобиков', 'Боб', 'Бобковивич', 'Мужской', 17, 1),
(6, 'Вафля', 'Влад', 'Санович', 'Мужской', 65, 2),
(7, 'Купач', 'Клава', 'Колава', 'Женский', 43, 1),
(9, 'Чача', 'Вус', 'Вуком', 'Мужской', 22, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ats`
--

CREATE TABLE `ats` (
  `id_ats` int(11) NOT NULL,
  `name_ats` varchar(255) NOT NULL,
  `location_ats` varchar(255) NOT NULL,
  `id_phone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `ats`
--

INSERT INTO `ats` (`id_ats`, `name_ats`, `location_ats`, `id_phone`) VALUES
(1, 'qweq', 'qweqweqweqweqw', 1),
(2, 'wwqewe', 'eeeeeee', 2),
(3, 'qweq', 'qweqweqweqweqw', 3),
(4, 'вфыв', 'фывфыв', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id_category` int(11) NOT NULL,
  `category_name` text DEFAULT NULL,
  `discounts` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='категории. id_категории, название категории, скидка';

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id_category`, `category_name`, `discounts`) VALUES
(1, 'не льготник ', 0),
(2, 'пенсионер', 50);

-- --------------------------------------------------------

--
-- Структура таблицы `disconnections`
--

CREATE TABLE `disconnections` (
  `id_disconnection` int(11) NOT NULL,
  `id_phone` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `reason` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='отключения. id_отключения, id_телефона, дата отключения, причина';

--
-- Дамп данных таблицы `disconnections`
--

INSERT INTO `disconnections` (`id_disconnection`, `id_phone`, `date`, `reason`) VALUES
(1, 3, '2023-02-01', 'не уплата'),
(2, 4, '2023-05-18', '12312');

-- --------------------------------------------------------

--
-- Структура таблицы `long_distance_negotiations`
--

CREATE TABLE `long_distance_negotiations` (
  `id_call` int(11) NOT NULL,
  `id_phone` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time_start` time DEFAULT NULL,
  `time_end` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Межгород. id_звонка, дата звонка, начало звонка, конец звонка';

--
-- Дамп данных таблицы `long_distance_negotiations`
--

INSERT INTO `long_distance_negotiations` (`id_call`, `id_phone`, `date`, `time_start`, `time_end`) VALUES
(1, 1, '2023-05-01', '08:46:51', '08:53:00'),
(2, 2, '2023-05-19', '15:22:22', '15:26:00'),
(3, 4, '2023-05-18', '10:58:00', '10:59:00');

-- --------------------------------------------------------

--
-- Структура таблицы `payments`
--

CREATE TABLE `payments` (
  `id_payment` int(11) NOT NULL,
  `id_abonent` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='платежи. id_платежа, id_абонента, дата уплаты,  заплатил';

--
-- Дамп данных таблицы `payments`
--

INSERT INTO `payments` (`id_payment`, `id_abonent`, `date`, `amount`) VALUES
(1, 1, '2023-05-16', 2000),
(2, 2, '2023-05-17', 1000);

-- --------------------------------------------------------

--
-- Структура таблицы `phones`
--

CREATE TABLE `phones` (
  `id_phone` int(11) NOT NULL,
  `id_abonent` int(11) DEFAULT NULL,
  `number` text DEFAULT NULL,
  `indexx` text DEFAULT NULL,
  `district` text DEFAULT NULL,
  `street` text DEFAULT NULL,
  `house` text DEFAULT NULL,
  `apartment` text DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='телефон. Айди телефона,  айди абонента,  номер телефона (+8-951-999-39-39), индекс, район, улица, дом, квартира';

--
-- Дамп данных таблицы `phones`
--

INSERT INTO `phones` (`id_phone`, `id_abonent`, `number`, `indexx`, `district`, `street`, `house`, `apartment`, `city`) VALUES
(1, 1, '76158711811', '1', 'центральный', 'па', '1', '1', 'ф'),
(2, 2, '73874674377', '2', 'западный', 'ва', '2', '2', 'ф'),
(3, 3, '762585207816', '3', 'восточный', 'фы', '3', '3', 'ы'),
(4, 5, '11111111111', '4', 'северный', 'ыы', '4', '4', 'а');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `abonents`
--
ALTER TABLE `abonents`
  ADD PRIMARY KEY (`id_abonent`),
  ADD KEY `id_category` (`id_category`);

--
-- Индексы таблицы `ats`
--
ALTER TABLE `ats`
  ADD PRIMARY KEY (`id_ats`),
  ADD KEY `id_phone` (`id_phone`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_category`);

--
-- Индексы таблицы `disconnections`
--
ALTER TABLE `disconnections`
  ADD PRIMARY KEY (`id_disconnection`),
  ADD KEY `id_phone` (`id_phone`);

--
-- Индексы таблицы `long_distance_negotiations`
--
ALTER TABLE `long_distance_negotiations`
  ADD PRIMARY KEY (`id_call`),
  ADD KEY `id_phone` (`id_phone`);

--
-- Индексы таблицы `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id_payment`),
  ADD KEY `id_abonent` (`id_abonent`);

--
-- Индексы таблицы `phones`
--
ALTER TABLE `phones`
  ADD PRIMARY KEY (`id_phone`),
  ADD KEY `id_abonent` (`id_abonent`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `abonents`
--
ALTER TABLE `abonents`
  MODIFY `id_abonent` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `ats`
--
ALTER TABLE `ats`
  MODIFY `id_ats` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `disconnections`
--
ALTER TABLE `disconnections`
  MODIFY `id_disconnection` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `long_distance_negotiations`
--
ALTER TABLE `long_distance_negotiations`
  MODIFY `id_call` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `payments`
--
ALTER TABLE `payments`
  MODIFY `id_payment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `phones`
--
ALTER TABLE `phones`
  MODIFY `id_phone` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `abonents`
--
ALTER TABLE `abonents`
  ADD CONSTRAINT `abonents_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_category`);

--
-- Ограничения внешнего ключа таблицы `ats`
--
ALTER TABLE `ats`
  ADD CONSTRAINT `ats_ibfk_1` FOREIGN KEY (`id_phone`) REFERENCES `phones` (`id_phone`);

--
-- Ограничения внешнего ключа таблицы `disconnections`
--
ALTER TABLE `disconnections`
  ADD CONSTRAINT `disconnections_ibfk_1` FOREIGN KEY (`id_phone`) REFERENCES `phones` (`id_phone`);

--
-- Ограничения внешнего ключа таблицы `long_distance_negotiations`
--
ALTER TABLE `long_distance_negotiations`
  ADD CONSTRAINT `long_distance_negotiations_ibfk_1` FOREIGN KEY (`id_phone`) REFERENCES `phones` (`id_phone`);

--
-- Ограничения внешнего ключа таблицы `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`id_abonent`) REFERENCES `abonents` (`id_abonent`);

--
-- Ограничения внешнего ключа таблицы `phones`
--
ALTER TABLE `phones`
  ADD CONSTRAINT `phones_ibfk_1` FOREIGN KEY (`id_abonent`) REFERENCES `abonents` (`id_abonent`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
