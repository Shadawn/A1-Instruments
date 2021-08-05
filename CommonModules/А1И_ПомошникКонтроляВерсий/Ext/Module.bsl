﻿Функция НастройкиМеханизма() Экспорт
	Настройки = А1Э_Механизмы.НовыйНастройкиМеханизма();
	
	Настройки.Обработчики.Вставить("ФормаПриСозданииОбъектов", Истина);
	Настройки.Обработчики.Вставить("ФормаПриСозданииНаСервере", Истина);
	Настройки.Обработчики.Вставить("ФормаПриОткрытии", Истина);
	
	Возврат Настройки;
КонецФункции

#Если НЕ Клиент Тогда
	
	Функция ФормаПриСозданииОбъектов(Форма, Отказ, МассивОписаний) Экспорт
		А1Э_Формы.ДобавитьОписаниеГруппыСтраниц(МассивОписаний, "Страницы");
		
		А1Э_Формы.ДобавитьОписаниеСтраницы(МассивОписаний, "СтраницаРасширения", "Расширения", "Страницы");
		А1И.А1БК_СохраняемаяВНастройкахТаблица().ДобавитьОписание(МассивОписаний, "Расширения", 
		"Флаг:Булево,Имя:Строка,ХранилищеКода:Строка,СхемаВерсий:Строка,ТекущаяВерсия:Строка,ВерсияВХранилище:Строка,Гит:Булево,ВетвьГит:Строка,КомментарийГит:Строка",
		"Имя,ХранилищеКода,Гит,ВетвьГит", , "СтраницаРасширения", , ,
		А1Э_Структуры.Создать(
		"ФормаПриЗагрузкеДанныхИзНастроекНаСервере", ИмяМодуля() + ".ПриЗагрузкеДанныхИзНастроекНаСервере",
		));
		А1Э_Формы.ДобавитьОписаниеКомандыИКнопки(МассивОписаний, "ДобавитьПапку", ИмяМодуля() + ".ДобавитьПапку", , "Добавить каталог", "РасширенияКоманднаяПанель"); 
		А1Э_Формы.ДобавитьОписаниеКомандыИКнопки(МассивОписаний, "ОбновитьИнформацию", ИмяМодуля() + ".ОбновитьИнформациюСервер:НаСервере," + ИмяМодуля() + ".ОбновитьИнформациюКлиент", Ложь, "Обновить", "РасширенияКоманднаяПанель");
		А1Э_Формы.ДобавитьОписаниеКомандыИКнопки(МассивОписаний, "ОтметитьОбновления", ИмяМодуля() + ".ОтметитьОбновления", Ложь, "Отметить обновления", "РасширенияКоманднаяПанель");
		А1Э_Формы.ДобавитьОписаниеКомандыИКнопки(МассивОписаний, "ВыгрузитьОтмеченные", ИмяМодуля() + ".ВыгрузитьОтмеченные", Ложь, "Выгрузить отмеченные", "РасширенияКоманднаяПанель");
		
		
		А1Э_Формы.ДобавитьОписаниеСтраницы(МассивОписаний, "СтраницаНастройки", "Настройки", "Страницы");
		
		А1Э_Формы.ДобавитьОписаниеРеквизитаИЭлемента(МассивОписаний, "Пароль", "Строка", , , "СтраницаНастройки", , А1Э_Структуры.Создать(
		"РежимПароля", Истина,
		));
		А1Э_Формы.ДобавитьОписаниеРеквизитаИЭлемента(МассивОписаний, "ПоказатьСкрипт", "Булево", , "Показать скрипт (вместо выгрузки)", "СтраницаНастройки");
		А1Э_Формы.ДобавитьОписаниеВертикальнойГруппы(МассивОписаний, "АвтономныйСервер", "Автономный сервер", "СтраницаНастройки");
		А1И.А1БК_СохраняемоеПоле().ДобавитьОписание(МассивОписаний, "АвтономныйСервер__Использовать", "Булево", "Использовать", "АвтономныйСервер");
		А1И.А1БК_СохраняемоеПоле().ДобавитьОписание(МассивОписаний, "АвтономныйСервер__СерверСУБД", "Строка", "Сервер СУБД", "СтраницаНастройки");
		А1И.А1БК_СохраняемоеПоле().ДобавитьОписание(МассивОписаний, "АвтономныйСервер__ВидСервераСУБД", "Строка", "Вид Сервера СУБД", "СтраницаНастройки");
		А1И.А1БК_СохраняемоеПоле().ДобавитьОписание(МассивОписаний, "АвтономныйСервер__БазаДанных", "Строка", "Вид Сервера СУБД", "СтраницаНастройки");
		А1И.А1БК_СохраняемоеПоле().ДобавитьОписание(МассивОписаний, "АвтономныйСервер__Логин", "Строка", "Логин", "СтраницаНастройки");
		А1И.А1БК_СохраняемоеПоле().ДобавитьОписание(МассивОписаний, "АвтономныйСервер__Пароль", "Строка", "Пароль", "СтраницаНастройки");
	КонецФункции 
	
	Функция ФормаПриСозданииНаСервере(Форма, Отказ, СтандартнаяОбработка) Экспорт
		
		А1И.А1БК_ПолеВыбораФайла().ДобавитьОбработчикЭлементаФормы(Форма, Форма.Элементы.РасширенияХранилищеКода, А1Э_Структуры.Создать(
		"Режим", "ВыборКаталога",
		"Заголовок", "Укажите каталог, в котором хранятся файлы расширения.",
		));
		Форма.Элементы.РасширенияГит.Видимость = Ложь;
		Форма.Элементы.РасширенияВетвьГит.Видимость = Ложь;
		Форма.Элементы.РасширенияКомментарийГит.Видимость = Ложь;
	КонецФункции 
	
	Функция ПриЗагрузкеДанныхИзНастроекНаСервере(ИмяКомпонента, Форма, Настройки) Экспорт  
		ОбновитьИнформациюСервер(Форма);
	КонецФункции
	
	Функция ОбновитьИнформациюСервер(Форма, ИмяКоманды = Неопределено) Экспорт 
		Таблица = Форма.Расширения; 
		Если Таблица.Количество() = 0 Тогда Возврат Неопределено; КонецЕсли;
		
		Для Каждого Строка Из Таблица Цикл
			Расширение = А1Э_Расширения.Получить(Строка.Имя);
			Если Расширение = Неопределено Тогда
				Сообщить("Расширение " + Строка.Имя + " не найдено!");
				Продолжить;
			КонецЕсли;
			Строка.ТекущаяВерсия = Расширение.Версия;
		КонецЦикла;
	КонецФункции 
	
	Функция ИменаСуществующихРасширений(Имена) Экспорт
		ИменаСуществующихРасширений = Новый Массив;
		Для Каждого Имя Из Имена Цикл
			Расширение = А1Э_Расширения.Получить(Имя);
			Если Расширение <> Неопределено Тогда
				ИменаСуществующихРасширений.Добавить(Имя);
			КонецЕсли;
		КонецЦикла;
		
		Возврат ИменаСуществующихРасширений;
	КонецФункции 
	
	Функция ДвоичныеДанныеРасширения(Имя) Экспорт
		Расширение = А1Э_Расширения.Получить(Имя);
		Возврат Расширение.ПолучитьДанные();
	КонецФункции
	
#КонецЕсли
#Если Клиент Тогда
	
	Функция ФормаПриОткрытии(Форма, Отказ) Экспорт
		ОбновитьИнформациюКлиент(Форма);
		ОтметитьОбновления(Форма);	
	КонецФункции
	
	Функция ДобавитьПапку(Форма, Команда = Неопределено) Экспорт
		А1Э_Файлы.ПоказатьВыборФайла("ДобавитьПапкуПослеВыбора", ЭтотОбъект, А1Э_Структуры.Создать(
		"Режим", "ВыборКаталога",
		"Форма", Форма,
		));
	КонецФункции
	
	Функция ДобавитьПапкуПослеВыбора(Результат, Контекст) Экспорт
		Если НЕ ЗначениеЗаполнено(Результат) Тогда Возврат Неопределено; КонецЕсли;
		Форма = Контекст.Форма;
		Каталог = Результат[0];
		Файлы = НайтиФайлы(Каталог, "*",Ложь);
		ИменаРасширений = Новый Массив;
		Для Каждого Файл Из Файлы Цикл
			Если НЕ Файл.ЭтоКаталог() Тогда Продолжить; КонецЕсли;
			ИменаРасширений.Добавить(Файл.Имя);
		КонецЦикла;
		ИменаСуществующихРасширений = А1Э_ОбщееСервер.РезультатФункции(ИмяМодуля() + ".ИменаСуществующихРасширений", ИменаРасширений);
		Для Каждого Имя Из ИменаСуществующихРасширений Цикл
			УжеДобавлено = Ложь;
			Для Каждого Строка Из Форма.Расширения Цикл
				Если Строка.Имя = Имя Тогда
					УжеДобавлено = Истина;
					Прервать;
				КонецЕсли;
			КонецЦикла;
			Если УжеДобавлено Тогда Продолжить; КонецЕсли;
			Строка = Форма.Расширения.Добавить();
			Строка.Имя = Имя;
			Строка.ХранилищеКода = А1Э_Файлы.СложитьПути(Каталог, Имя);
		КонецЦикла;
		ОбновитьИнформациюКлиент(Форма);
		Форма.СохраняемыеВНастройкахДанныеМодифицированы = Истина;
	КонецФункции
	
	Функция ОбновитьИнформациюКлиент(Форма, Команда = Неопределено) Экспорт 
		Для Каждого Строка Из Форма.Расширения Цикл
			Если НЕ ЗначениеЗаполнено(Строка.ХранилищеКода) Тогда Продолжить; КонецЕсли;
			
			ПутьКОписанию = А1Э_Файлы.СложитьПути(Строка.ХранилищеКода, "Configuration.xml");
			Если НЕ А1Э_Файлы.ФайлСуществует(ПутьКОписанию) Тогда Продолжить; КонецЕсли;
			ОписаниеДОМ = А1Э_Сериализация.ДОМ_ИзФайлаХМЛ(ПутьКОписанию);
			Строка.ВерсияВХранилище = ОписаниеДОМ.ПолучитьЭлементыПоИмени("Version")[0].ТекстовоеСодержимое;
			Если СтрНайти(ОписаниеДОМ.ПолучитьЭлементыПоИмени("Comment")[0].ТекстовоеСодержимое, "[SemVer]") > 0 Тогда
				Строка.СхемаВерсий = "SemVer";
			КонецЕсли;
		КонецЦикла;
	КонецФункции
	
	Функция ОтметитьОбновления(Форма, Команда = Неопределено) Экспорт 
		Для Каждого Строка Из Форма.Расширения Цикл
			Строка.Флаг = А1И_Версии.Больше(Строка.ТекущаяВерсия, Строка.ВерсияВХранилище, Строка.СхемаВерсий)  И ЗначениеЗаполнено(Строка.ХранилищеКода);
		КонецЦикла;
	КонецФункции
	
	Функция ВыгрузитьОтмеченные(Форма, Команда = Неопределено) Экспорт 
		Если НЕ Форма.ПоказатьСкрипт И НЕ Форма.АвтономныйСервер__Использовать Тогда
			Если А1Э_Конфигуратор.Открыт() Тогда
				Сообщить("Для выгрузки расширений необходимо закрыть конфигуратор!");
				Возврат Неопределено;
			КонецЕсли;
		КонецЕсли;
		
		Для Каждого Строка Из Форма.Расширения Цикл
			Если НЕ Строка.Флаг Тогда Продолжить; КонецЕсли;
			Если НЕ ЗначениеЗаполнено(Строка.ХранилищеКода) Тогда
				Сообщить("Выгрузка расширения " + Строка.Имя + " невозможна: не указано хранилище кода (каталог выгрузки)");
			КонецЕсли;
			Ошибка = Ложь;
			Попытка
				СохранитьКонфигурациюВФайл(Форма, Строка);
			Исключение
				Ошибка = Истина;
				ОписаниеОшибки = ОписаниеОшибки();
				Сообщить(ОписаниеОшибки);
			КонецПопытки;
			Попытка
				СохранитьКонфигурациюВФайлы(Форма, Строка);
			Исключение
				Ошибка = Истина;
				ОписаниеОшибки = ОписаниеОшибки();
				Сообщить(ОписаниеОшибки);
			КонецПопытки;
			Попытка
				УдалитьФайлы(А1Э_Файлы.СложитьПути(Строка.ХранилищеКода, "ConfigDumpInfo.xml"));
			Исключение
				ОписаниеОшибки = ОписаниеОшибки();
			КонецПопытки;
			
			Если Ошибка Тогда Сообщить("При сохранении возникла ошибка!") КонецЕсли;
		КонецЦикла;
		
	КонецФункции 
	
	Функция СохранитьКонфигурациюВФайл(Форма, Строка) 
		ПутьСохранения = А1Э_Файлы.СложитьПути(Строка.ХранилищеКода, "extension.cfe"); 
		Если НЕ Форма.АвтономныйСервер__Использовать Тогда
			//КонтекстВыполнения = КонтекстВыполненияДляКонфигуратора(Форма);
			//А1Э_Конфигуратор.СохранитьКонфигурациюВФайл(ПутьСохранения, Строка.Имя, КонтекстВыполнения);
			ДвоичныеДанные = А1Э_ОбщееСервер.РезультатФункции(ИмяМодуля() + ".ДвоичныеДанныеРасширения", Строка.Имя);
			ДвоичныеДанные.Записать(ПутьСохранения);
		Иначе
			ТекстКоманды = АвтономныйСервер__ТекстКоманды(Форма, "config save", Строка.Имя, ПутьСохранения);
			Если Форма.ПоказатьСкрипт Тогда
				Сообщить(ТекстКоманды);
			Иначе
				Если НЕ АвтономныйСервер__Доступен() Тогда
					Сообщить("Утилита автономного сервера ibcmd не установлена! Установите сервер 1С:Предприятия или используйте выгрузку через конфигуратор!");
					Возврат Неопределено;
				КонецЕсли;
				А1Э_ОбщееКлиент.ВыполнитьСкрипт(ТекстКоманды);
			КонецЕсли;
		КонецЕсли;
	КонецФункции
	
	Функция СохранитьКонфигурациюВФайлы(Форма, Строка)
		Если НЕ Форма.АвтономныйСервер__Использовать Тогда
			КонтекстВыполнения = КонтекстВыполненияДляКонфигуратора(Форма);
			А1Э_Конфигуратор.СохранитьКонфигурациюВФайлы(Строка.ХранилищеКода, Строка.Имя, , КонтекстВыполнения);
		Иначе
			ТекстКоманды = АвтономныйСервер__ТекстКоманды(Форма, "config export", Строка.Имя, Строка.ХранилищеКода); 
			Если Форма.ПоказатьСкрипт Тогда
				Сообщить(ТекстКоманды);
			Иначе
				Если НЕ АвтономныйСервер__Доступен() Тогда
					Сообщить("Утилита автономного сервера ibcmd не установлена! Установите сервер 1С:Предприятия или используйте выгрузку через конфигуратор!");
					Возврат Неопределено;
				КонецЕсли;
				А1Э_ОбщееКлиент.ВыполнитьСкрипт(ТекстКоманды);
			КонецЕсли;
		КонецЕсли;
	КонецФункции
	
	Функция КонтекстВыполненияДляКонфигуратора(Форма)
		Если Форма.ПоказатьСкрипт Тогда 
			КонтекстВыполнения = А1Э_Структуры.Создать(
			"Пароль", Форма.Пароль,
			"Контекст", А1Э_Структуры.Создать(
			"ПоказатьСкрипт", Форма.ПоказатьСкрипт,
			),
			);
		Иначе
			КонтекстВыполнения = Форма.Пароль;
		КонецЕсли;
		Возврат КонтекстВыполнения; 
	КонецФункции
	
#КонецЕсли

#Область АвтономныйСервер
#Если Клиент И НЕ ВебКлиент Тогда
	
	Функция АвтономныйСервер__Доступен()
		Возврат А1Э_Файлы.ФайлСуществует(КаталогПрограммы() + "ibcmd.exe");
	КонецФункции
	
	Функция АвтономныйСервер__ТекстКоманды(Знач Форма, Знач ИмяКоманды, Знач Расширение, Знач ПутьСохранения)
		Если А1Э_Общее.ИнформационнаяБазаФайловая() Тогда
			СтрокаПодключения = "--db-path=""" + А1Э_Общее.КаталогИнформационнойБазы() + """";
		Иначе
			//СтрокаПодключения = "--dbms=" + Форма.АвтономныйСервер__ВидСервераСУБД + " --db-server=" + Форма.
		КонецЕсли;
		
		Результат = """" + КаталогПрограммы() + "ibcmd.exe"" infobase " + ИмяКоманды + " " + СтрокаПодключения + " -e " + Расширение + " """ + ПутьСохранения + """";  
		Возврат Результат;
	КонецФункции 
	
#КонецЕсли
#КонецОбласти 

Функция ИмяМодуля() Экспорт
	Возврат "А1И_ПомошникКонтроляВерсий";
КонецФункции 

