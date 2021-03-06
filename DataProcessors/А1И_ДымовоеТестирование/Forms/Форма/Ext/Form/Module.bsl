﻿
&НаСервере
Процедура ПолучитьТестыНаСервере()
	ОписанияТестов = А1Э_Тестирование.ПолучитьТесты();
	ТестыВТаблицу(ОписанияТестов, ТаблицаТестов);
КонецПроцедуры

&НаКлиенте
Процедура ПолучитьТесты(Команда)
	ПолучитьТестыНаСервере();
КонецПроцедуры


&НаКлиенте
Процедура ВыполнитьТесты(Команда)
	Если ТаблицаТестов.Количество() = 0 Тогда
		ПолучитьТестыНаСервере()
	КонецЕсли;
	Тесты = ТестыИзТаблицы(ТаблицаТестов);
	Попытка
		А1Э_Тестирование.ВыполнитьКлиентскиеТесты(ТаблицаТестов);
	Исключение
	КонецПопытки;
	
	Тесты = ТестыИзТаблицы(ТаблицаТестов);
	Попытка
		А1Э_ОбщееСервер.РезультатФункции("А1Э_Тестирование.ВыполнитьСерверныеТесты", Тесты);
	Исключение
	КонецПопытки;
	ТестыВТаблицу(Тесты, ТаблицаТестов);
КонецПроцедуры

&НаКлиенте
Процедура ВыполнитьТекущийТест(Команда)
	Если Элементы.ТаблицаТестов.ТекущиеДанные = Неопределено Тогда Возврат; КонецЕсли;
	Тесты = Новый Массив;
	Тест = А1Э_Тестирование.НовыйОписаниеТеста();
	ЗаполнитьЗначенияСвойств(Тест, Элементы.ТаблицаТестов.ТекущиеДанные);
	Тесты.Добавить(Тест);
	А1Э_Тестирование.ВыполнитьТесты(Тесты);
	ЗаполнитьЗначенияСвойств(Элементы.ТаблицаТестов.ТекущиеДанные, Тест);
КонецПроцедуры

&НаКлиентеНаСервереБезКонтекста
Функция ТестыВТаблицу(Массив, Таблица)
	Таблица.Очистить();
	Для Каждого Элемент Из Массив Цикл
		Строка = Таблица.Добавить();
		ЗаполнитьЗначенияСвойств(Строка, Элемент);
	КонецЦикла;
КонецФункции

&НаКлиентеНаСервереБезКонтекста
Функция ТестыИзТаблицы(Таблица)
	Результат = Новый Массив;
	Для Каждого Строка Из Таблица Цикл
		ОписаниеТеста = А1Э_Тестирование.НовыйОписаниеТеста();
		ЗаполнитьЗначенияСвойств(ОписаниеТеста, Строка);
		Результат.Добавить(ОписаниеТеста);
	КонецЦикла;
	Возврат Результат;
КонецФункции 



