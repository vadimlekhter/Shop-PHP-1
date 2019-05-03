-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 14 2018 г., 17:38
-- Версия сервера: 5.7.20
-- Версия PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `shop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admin`
--

CREATE TABLE `admin` (
  `login_admin` text NOT NULL,
  `password_admin` text NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `admin`
--

INSERT INTO `admin` (`login_admin`, `password_admin`, `id`) VALUES
('admin', '202cb962ac59075b964b07152d234b70', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--

CREATE TABLE `cart` (
  `id_cart` int(3) NOT NULL,
  `idx` int(6) NOT NULL,
  `sessid` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cart`
--

INSERT INTO `cart` (`id_cart`, `idx`, `sessid`) VALUES
(1, 1, 'qv3almkq42gmrr00s22f84f185rhdl7j'),
(2, 2, 'qv3almkq42gmrr00s22f84f185rhdl7j'),
(3, 3, 'qv3almkq42gmrr00s22f84f185rhdl7j'),
(5, 1, 'bgdopo1vav01mvf1540o0a30rjj477qi'),
(6, 2, '2jh8ieab35o5t9ttoog8sdff7hn9s7kh'),
(7, 3, 'rbfctub81qu2u51blq03jl04a68dtifp');

-- --------------------------------------------------------

--
-- Структура таблицы `goods`
--

CREATE TABLE `goods` (
  `idx` int(6) NOT NULL,
  `name` varchar(48) NOT NULL,
  `small` varchar(32) NOT NULL,
  `big` varchar(32) NOT NULL,
  `descrsm` text NOT NULL,
  `descrbig` text NOT NULL,
  `price` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `goods`
--

INSERT INTO `goods` (`idx`, `name`, `small`, `big`, `descrsm`, `descrbig`, `price`) VALUES
(1, 'Ноутбук', '/img/small/item1.jpg', '/img/big/item1.jpg', 'Короткое описание товара', 'Полное описание товара', 10000),
(2, 'Ноутбук', '/img/small/item2.jpg', '/img/big/item2.jpg', 'Короткое описание товара', 'Полное описание товара', 20000),
(3, 'Ноутбук', '/img/small/item3.jpg', '/img/big/item3.jpg', 'Короткое описание товара', 'Полное описание товара', 30000);

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `id` int(3) NOT NULL,
  `tel` text NOT NULL,
  `sessid` text NOT NULL,
  `status` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`id`, `tel`, `sessid`, `status`) VALUES
(1, '1111', 'qv3almkq42gmrr00s22f84f185rhdl7j', 'payd'),
(2, '2222', 'bgdopo1vav01mvf1540o0a30rjj477qi', 'sent'),
(3, '3333', '2jh8ieab35o5t9ttoog8sdff7hn9s7kh', 'delivered'),
(4, '4444', 'rbfctub81qu2u51blq03jl04a68dtifp', 'delete');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id_cart`);

--
-- Индексы таблицы `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`idx`);

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cart`
--
ALTER TABLE `cart`
  MODIFY `id_cart` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `goods`
--
ALTER TABLE `goods`
  MODIFY `idx` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
