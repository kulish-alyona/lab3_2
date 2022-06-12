-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 03 2022 г., 18:06
-- Версия сервера: 10.4.24-MariaDB
-- Версия PHP: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- База данных: `comp`
--

-- --------------------------------------------------------

--
-- Структура таблицы `computer`
--

CREATE TABLE `computer` (
  `ID_Computer` int(11) NOT NULL,
  `netname` varchar(255) NOT NULL,
  `motherboard` varchar(255) NOT NULL,
  `RAM_capacity` int(11) NOT NULL,
  `HDD_capacity` int(11) NOT NULL,
  `monitor` varchar(255) NOT NULL,
  `vendor` varchar(255) NOT NULL,
  `guarantee` float NOT NULL,
  `FID_Processor` int(11) NOT NULL,
  `date_purchase` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `computer`
--

INSERT INTO `computer` (`ID_Computer`, `netname`, `motherboard`, `RAM_capacity`, `HDD_capacity`, `monitor`, `vendor`, `guarantee`, `FID_Processor`, `date_purchase`) VALUES
(1, 'DESKTOP-IS0NKTG', 'PRIME H310M-K R2.0', 8, 512, 'IPS', 'dell', 24, 1, '2022-04-25'),
(2, 'MY-MAC10', 'А2251', 16, 512, 'Retina', 'apple', 24, 2, '2022-04-25'),
(3, 'MY-MAC101', 'А2251', 8, 512, 'Retina', 'apple', 24, 2, '2022-04-25'),
(4, 'MY-MAC11', 'А2251', 8, 256, 'Retina', 'apple', 12, 2, '2020-12-04');

-- --------------------------------------------------------

--
-- Структура таблицы `computer_software`
--

CREATE TABLE `computer_software` (
  `FID_Computer` int(11) NOT NULL,
  `FID_Software` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `computer_software`
--

INSERT INTO `computer_software` (`FID_Computer`, `FID_Software`) VALUES
(1, 1),
(2, 2),
(4, 2),
(3, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `processor`
--

CREATE TABLE `processor` (
  `ID_Processor` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `frequency` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `processor`
--

INSERT INTO `processor` (`ID_Processor`, `name`, `frequency`) VALUES
(1, 'Intel Core i5', '2,5'),
(2, 'Apple M1 Pro', '3,2');

-- --------------------------------------------------------

--
-- Структура таблицы `software`
--

CREATE TABLE `software` (
  `ID_SOFTWARE` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `software`
--

INSERT INTO `software` (`ID_SOFTWARE`, `name`) VALUES
(1, 'windows'),
(2, 'macOS'),
(3, 'linux');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `computer`
--
ALTER TABLE `computer`
  ADD PRIMARY KEY (`ID_Computer`),
  ADD UNIQUE KEY `ID_Computer_2` (`ID_Computer`),
  ADD KEY `FID_Processor` (`FID_Processor`),
  ADD KEY `ID_Computer` (`ID_Computer`);

--
-- Индексы таблицы `computer_software`
--
ALTER TABLE `computer_software`
  ADD KEY `computer_software_ibfk_1` (`FID_Computer`),
  ADD KEY `FID_Software` (`FID_Software`);

--
-- Индексы таблицы `processor`
--
ALTER TABLE `processor`
  ADD PRIMARY KEY (`ID_Processor`),
  ADD KEY `ID_Processor` (`ID_Processor`);

--
-- Индексы таблицы `software`
--
ALTER TABLE `software`
  ADD PRIMARY KEY (`ID_SOFTWARE`),
  ADD KEY `ID_SOFTWARE` (`ID_SOFTWARE`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `processor`
--
ALTER TABLE `processor`
  MODIFY `ID_Processor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `software`
--
ALTER TABLE `software`
  MODIFY `ID_SOFTWARE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `computer`
--
ALTER TABLE `computer`
  ADD CONSTRAINT `computer_ibfk_1` FOREIGN KEY (`FID_Processor`) REFERENCES `processor` (`ID_Processor`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `computer_software`
--
ALTER TABLE `computer_software`
  ADD CONSTRAINT `computer_software_ibfk_1` FOREIGN KEY (`FID_Computer`) REFERENCES `computer` (`ID_Computer`) ON UPDATE CASCADE,
  ADD CONSTRAINT `computer_software_ibfk_2` FOREIGN KEY (`FID_Software`) REFERENCES `software` (`ID_SOFTWARE`) ON UPDATE CASCADE;
COMMIT;
