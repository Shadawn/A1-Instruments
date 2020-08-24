﻿//by Medvedev Anton Alexandrovich 2016
//Если вам помогла эта обработка, можете отблагодарить на paypal: medanton@km.ru
//Связать со мной можно по e-mail: medant@rambler.ru

//Должен быть синхронный с мМета
&НаСервере
Функция мМетаМассив()
	мМета = Новый Массив;
	
	мМета.Добавить(Метаданные);
	мМета.Добавить(Метаданные.Подсистемы);
	мМета.Добавить(Метаданные.ПараметрыСеанса);
	мМета.Добавить(Метаданные.ОбщиеРеквизиты);
	мМета.Добавить(Метаданные.ПланыОбмена);
	мМета.Добавить(Метаданные.КритерииОтбора);
	мМета.Добавить(Метаданные.ОбщиеФормы);
	мМета.Добавить(Метаданные.ОбщиеКоманды);
	мМета.Добавить(Метаданные.Константы);
	мМета.Добавить(Метаданные.Справочники);
	мМета.Добавить(Метаданные.Документы);
	мМета.Добавить(Метаданные.ЖурналыДокументов);
	мМета.Добавить(Метаданные.Отчеты);
	мМета.Добавить(Метаданные.Обработки);
	мМета.Добавить(Метаданные.ПланыВидовХарактеристик);
	мМета.Добавить(Метаданные.ПланыСчетов);
	мМета.Добавить(Метаданные.ПланыВидовРасчета);
	мМета.Добавить(Метаданные.РегистрыСведений);
	мМета.Добавить(Метаданные.РегистрыНакопления);
	мМета.Добавить(Метаданные.РегистрыБухгалтерии);
	мМета.Добавить(Метаданные.РегистрыРасчета);
	мМета.Добавить(Метаданные.БизнесПроцессы);
	мМета.Добавить(Метаданные.Задачи);
	мМета.Добавить(Метаданные.ВнешниеИсточникиДанных);
	
	Возврат мМета;
КонецФункции

//Должен быть синхронный с сМета
&НаСервере
Функция сМетаМассив()
	сМета = Новый Массив;
	
	сМета.Добавить("Метаданные");
	сМета.Добавить("Подсистемы");
	сМета.Добавить("ПараметрыСеанса");
	сМета.Добавить("ОбщиеРеквизиты");
	сМета.Добавить("ПланыОбмена");
	сМета.Добавить("КритерииОтбора");
	сМета.Добавить("ОбщиеФормы");
	сМета.Добавить("ОбщиеКоманды");
	сМета.Добавить("Константы");
	сМета.Добавить("Справочники");
	сМета.Добавить("Документы");
	сМета.Добавить("ЖурналыДокументов");
	сМета.Добавить("Отчеты");
	сМета.Добавить("Обработки");
	сМета.Добавить("ПланыВидовХарактеристик");
	сМета.Добавить("ПланыСчетов");
	сМета.Добавить("ПланыВидовРасчета");
	сМета.Добавить("РегистрыСведений");
	сМета.Добавить("РегистрыНакопления");
	сМета.Добавить("РегистрыБухгалтерии");
	сМета.Добавить("РегистрыРасчета");
	сМета.Добавить("БизнесПроцессы");
	сМета.Добавить("Задачи");
	сМета.Добавить("ВнешниеИсточникиДанных");
	
    Возврат сМета;
КонецФункции

///Раскладывает строку в массив с указанным разделителем
Функция  СтрокуВМассив(Стр, Разделитель = ",")
	
	Если СтрДлина(Разделитель) > 1 Тогда
		Возврат Неопределено;
	КонецЕсли;
	
	НовыйМас = Новый Массив;
	ТекСтр = Стр;
	Пока СтрДлина(ТекСтр) > 0 Цикл
		//Поз = СтрНайти(ТекСтр, Разделитель);//Только для 8.3 работает
		Поз = Найти(ТекСтр, Разделитель);
		Если Поз > 0 Тогда
			НовыйМас.Добавить(Лев(ТекСтр, Поз-1));
			ТекСтр = Сред(ТекСтр, Поз+1);
		Иначе
			НовыйМас.Добавить(ТекСтр);
			ТекСтр = "";
		КонецЕсли;
	КонецЦикла;
	Возврат НовыйМас;
КонецФункции

//Возвращает массив строк в котором указаны права доступа для объекта метаданных
Функция ПолучитьПраваДляОпроса(нМетаданные, нПрава8_3 = Ложь)
	
	НаборПрав = Новый Массив;
	
	Если нМетаданные = "Метаданные" Тогда
		НаборПрав = СтрокуВМассив("Администрирование,АдминистрированиеДанных,ОбновлениеКонфигурацииБазыДанных,МонопольныйРежим,АктивныеПользователи,ЖурналРегистрации,ТонкийКлиент,ВебКлиент,ТолстыйКлиент,ВнешнееСоединение,Automation,РежимВсеФункции,СохранениеДанныхПользователя,ИнтерактивноеОткрытиеВнешнихОбработок,ИнтерактивноеОткрытиеВнешнихОтчетов,Вывод"+?(нПрава8_3, ",АдминистрированиеРасширенийКонфигурации", ""), ",");
	КонецЕсли;
	
	Если нМетаданные = "Подсистемы" Тогда
		НаборПрав.Добавить("Просмотр");
	КонецЕсли;
	
	Если нМетаданные = "ПараметрыСеанса" Тогда
		НаборПрав = СтрокуВМассив("Получение,Установка");
	КонецЕсли;
	
	Если нМетаданные = "ОбщиеРеквизиты" Тогда
		НаборПрав = СтрокуВМассив("Просмотр,Редактирование");
	КонецЕсли;
	
	Если нМетаданные = "ПланыОбмена" Тогда
		НаборПрав = СтрокуВМассив("Чтение,Добавление,Изменение,Удаление,Просмотр,ИнтерактивноеДобавление,Редактирование,ИнтерактивноеУдаление,ИнтерактивнаяПометкаУдаления,ИнтерактивноеСнятиеПометкиУдаления,ИнтерактивноеУдалениеПомеченных,ВводПоСтроке");
	КонецЕсли;
	
	Если нМетаданные = "КритерииОтбора" Тогда
		НаборПрав.Добавить("Просмотр");
	КонецЕсли;
	
	Если нМетаданные = "ОбщиеФормы" Тогда
		НаборПрав.Добавить("Просмотр");
	КонецЕсли;
	
	Если нМетаданные = "ОбщиеКоманды" Тогда
		НаборПрав.Добавить("Просмотр");
	КонецЕсли;
	
	Если нМетаданные = "Константы" Тогда
		НаборПрав = СтрокуВМассив("Чтение,Изменение,Просмотр,Редактирование");
	КонецЕсли;
	
	Если нМетаданные = "Справочники" Тогда
		НаборПрав = СтрокуВМассив("Чтение,Добавление,Изменение,Удаление,Просмотр,ИнтерактивноеДобавление,Редактирование,ИнтерактивноеУдаление,ИнтерактивнаяПометкаУдаления,ИнтерактивноеСнятиеПометкиУдаления,ИнтерактивноеУдалениеПомеченных,ВводПоСтроке"+?(нПрава8_3, ",ИнтерактивноеУдалениеПредопределенныхДанных,ИнтерактивнаяПометкаУдаленияПредопределенныхДанных,ИнтерактивноеСнятиеПометкиУдаленияПредопределенныхДанных",""));//,ИнтерактивноеУдалениеПомеченныхПредопределенныхДанных "); //Почему то выдает ошибку
	КонецЕсли;
	
	Если нМетаданные = "Документы" Тогда
		НаборПрав = СтрокуВМассив("Чтение,Добавление,Изменение,Удаление,Проведение,ОтменаПроведения,Просмотр,ИнтерактивноеДобавление,Редактирование,ИнтерактивноеУдаление,ИнтерактивнаяПометкаУдаления,ИнтерактивноеСнятиеПометкиУдаления,ИнтерактивноеУдалениеПомеченных,ИнтерактивноеПроведение,ИнтерактивноеПроведениеНеОперативное,ИнтерактивнаяОтменаПроведения,ИнтерактивноеИзменениеПроведенных,ВводПоСтроке");
	КонецЕсли;
	
	Если нМетаданные = "ЖурналыДокументов" Тогда
		НаборПрав = СтрокуВМассив("Чтение,Просмотр");
	КонецЕсли;
	
	Если нМетаданные = "Отчеты" Тогда
		НаборПрав = СтрокуВМассив("Использование,Просмотр");
	КонецЕсли;
	
	Если нМетаданные = "Обработки" Тогда
		НаборПрав = СтрокуВМассив("Использование,Просмотр");
	КонецЕсли;
	
	Если нМетаданные = "ПланыВидовХарактеристик" Тогда
		НаборПрав = СтрокуВМассив("Чтение,Добавление,Изменение,Удаление,Просмотр,ИнтерактивноеДобавление,Редактирование,ИнтерактивноеУдаление,ИнтерактивнаяПометкаУдаления,ИнтерактивноеСнятиеПометкиУдаления,ИнтерактивноеУдалениеПомеченных,ВводПоСтроке"+?(нПрава8_3, ",ИнтерактивноеУдалениеПредопределенныхДанных,ИнтерактивнаяПометкаУдаленияПредопределенныхДанных,ИнтерактивноеСнятиеПометкиУдаленияПредопределенныхДанных",""));//,ИнтерактивноеУдалениеПомеченныхПредопределенныхДанных ");
	КонецЕсли;
	
	Если нМетаданные = "ПланыСчетов" Тогда
		НаборПрав = СтрокуВМассив("Чтение,Добавление,Изменение,Удаление,Просмотр,ИнтерактивноеДобавление,Редактирование,ИнтерактивноеУдаление,ИнтерактивнаяПометкаУдаления,ИнтерактивноеСнятиеПометкиУдаления,ИнтерактивноеУдалениеПомеченных,ВводПоСтроке"+?(нПрава8_3, ",ИнтерактивноеУдалениеПредопределенныхДанных,ИнтерактивнаяПометкаУдаленияПредопределенныхДанных,ИнтерактивноеСнятиеПометкиУдаленияПредопределенныхДанных",""));//,ИнтерактивноеУдалениеПомеченныхПредопределенныхДан");
	КонецЕсли;
	
	Если нМетаданные = "ПланыВидовРасчета" Тогда
		НаборПрав = СтрокуВМассив("Чтение,Добавление,Изменение,Удаление,Просмотр,ИнтерактивноеДобавление,Редактирование,ИнтерактивноеУдаление,ИнтерактивнаяПометкаУдаления,ИнтерактивноеСнятиеПометкиУдаления,ИнтерактивноеУдалениеПомеченных,ВводПоСтроке"+?(нПрава8_3, ",ИнтерактивноеУдалениеПредопределенныхДанных,ИнтерактивнаяПометкаУдаленияПредопределенныхДанных,ИнтерактивноеСнятиеПометкиУдаленияПредопределенныхДанных",""));//,ИнтерактивноеУдалениеПомеченныхПредопределенныхДан");
	КонецЕсли;
	
	Если нМетаданные = "РегистрыСведений" Тогда
		НаборПрав = СтрокуВМассив("Чтение,Изменение,Просмотр,Редактирование");
	КонецЕсли;
	
	Если нМетаданные = "РегистрыНакопления" Тогда
		НаборПрав = СтрокуВМассив("Чтение,Изменение,Просмотр,Редактирование,УправлениеИтогами");
	КонецЕсли;
	
	Если нМетаданные = "РегистрыБухгалтерии" Тогда
		НаборПрав = СтрокуВМассив("Чтение,Изменение,Просмотр,Редактирование,УправлениеИтогами");
	КонецЕсли;
	
	Если нМетаданные = "РегистрыРасчета" Тогда
		НаборПрав = СтрокуВМассив("Чтение,Изменение,Просмотр,Редактирование");
	КонецЕсли;
	
	Если нМетаданные = "БизнесПроцессы" Тогда
		НаборПрав = СтрокуВМассив("Чтение,Добавление,Изменение,Удаление,Просмотр,ИнтерактивноеДобавление,Редактирование,ИнтерактивноеУдаление,ИнтерактивнаяПометкаУдаления,ИнтерактивноеСнятиеПометкиУдаления,ИнтерактивноеУдалениеПомеченных,ВводПоСтроке,ИнтерактивнаяАктивация,Старт,ИнтерактивныйСтарт");
	КонецЕсли;
	
	Если нМетаданные = "Задачи" Тогда
		НаборПрав = СтрокуВМассив("Чтение,Добавление,Изменение,Удаление,Просмотр,ИнтерактивноеДобавление,Редактирование,ИнтерактивноеУдаление,ИнтерактивнаяПометкаУдаления,ИнтерактивноеСнятиеПометкиУдаления,ИнтерактивноеУдалениеПомеченных,ВводПоСтроке,ИнтерактивнаяАктивация,Выполнение,ИнтерактивноеВыполнение");
	КонецЕсли;
	
	Если нМетаданные = "ВнешниеИсточникиДанных" Тогда
		НаборПрав = СтрокуВМассив("Использование,Администрирование,ИзменениеСтандартнойАутентификации,ИзменениеСтандартнойАутентификацииСеанса"+?(нПрава8_3, ",ИзменениеАутентификацииОССеанса",""));
	КонецЕсли;
	Возврат НаборПрав;
КонецФункции

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Элементы.ДеревоМетаданныхВыбран.ТриСостояния = Истина;
	Элементы.ДеревоМетаданныхВыбран.РежимРедактирования = РежимРедактированияКолонки.Непосредственно;
		
	мМета = мМетаМассив();
		
	сМета = сМетаМассив();
	НовСтр = Объект.ТЧМетаданные.Добавить();
	НовСтр.СтрНаименование = мМета[0];
	НовСтр.СтрМетаданные = сМета[0];
	
	Для н=1 по мМета.Количество()-1 Цикл
		Для Каждого Стр Из мМета[н] Цикл
			Если ЭтоПодсистема(Стр) Тогда
				ДобавитьПодсистемуИПодчиненныеРекурсивно(Стр, н, "");
			Иначе
				НовСтр = Объект.ТЧМетаданные.Добавить();
				НовСтр.СтрНаименование = Стр.Имя;
				НовСтр.СтрМетаданные = сМета[н];
			КонецЕсли;
		КонецЦикла;
	КонецЦикла;
	Объект.ТЧМетаданные.Сортировать("СтрМетаданные,СтрНаименование");
	Объект.ТЧМетаданные[0].Флаг = Истина;
	
	//Страничка с ролями
	Для каждого Роль Из Метаданные.Роли Цикл
		НовСтр = Объект.ТЧРоли.Добавить();
		НовСтр.Роль = Роль.Имя;
		
		НовСтр = ТчРолиПользователя.Добавить();
		НовСтр.Роль = Роль.Имя;
	КонецЦикла;
	
	МассивПользователей = ЗаполнитьМассивПользователями();
	
	Для Каждого ТекЭлемент Из МассивПользователей Цикл
		НовСтр = ТчПользователи.Добавить();
		НовСтр.Пользователь = ТекЭлемент.Имя;
		НовСтр.Идентификатор = ТекЭлемент.УникальныйИдентификатор;
	КонецЦикла;
	
КонецПроцедуры

//А1
&НаСервере 
Функция ЭтоПодсистема(ОбъектМетаданных) 
	Структура = Новый Структура("Подсистемы");
	ЗаполнитьЗначенияСвойств(Структура, ОбъектМетаданных);
	Возврат Структура.Подсистемы <> Неопределено;
КонецФункции 

//А1
&НаСервере 
Функция ДобавитьПодсистемуИПодчиненныеРекурсивно(Подсистема, н, Префикс)
	НовСтр = Объект.ТЧМетаданные.Добавить();
	НовСтр.СтрНаименование = Префикс + Подсистема.Имя;
	НовСтр.СтрМетаданные = "Подсистемы";
	Для Каждого ПодчиненнаяПодсистема Из Подсистема.Подсистемы Цикл
		ДобавитьПодсистемуИПодчиненныеРекурсивно(ПодчиненнаяПодсистема, н, Префикс + Подсистема.Имя + ".");
	КонецЦикла;
КонецФункции

&НаСервере
Процедура ПолучитьПраваСервер()
	мМета = мМетаМассив();
	сМета = сМетаМассив();
	//Для вывода прав администрирования
	мДополнение = Новый Массив;
	мДополнение.Добавить(Метаданные);
	мМета.Вставить(1, мДополнение);
	ОтчетРоли.Очистить();
	
	ПараметрыОтбора = Новый Структура("Флаг", Истина);
	НайденныеСтроки = Объект.ТЧРоли.НайтиСтроки(ПараметрыОтбора);
	
	ОбработкаОбъект = РеквизитФормыВЗначение("Объект");
	Макет = ОбработкаОбъект.ПолучитьМакет("Макет");
	
	ОблШапки1 = Макет.ПолучитьОбласть("Шапка1");
	ОблШапки1.Параметры.ЗаголовокОсновной = "Отчет по ролям";
	ОтчетРоли.Вывести(ОблШапки1);
	
	ОблШапки2 = Макет.ПолучитьОбласть("Шапка2");
	
	ОблШапки3 = Макет.ПолучитьОбласть("Шапка3|Столбец");
	
	ОблСтрока = Макет.ПолучитьОбласть("Строка|Столбец");
	
	ОблПустаяСтрока = Макет.ПолучитьОбласть("ПустаяСтрока");
	
	ОблСтрокаОтбора = Макет.ПолучитьОбласть("СтрокаОтбора");
	
	//Выбранные значения
	ОблШапки2.Параметры.ЗаголовокТаблицы = "Выбранные роли:";
	ОтчетРоли.Вывести(ОблШапки2);
	ОтчетРоли.НачатьГруппуСтрок("Выбранные роли", Истина);
	Для Каждого Стр Из НайденныеСтроки Цикл
		ОблСтрокаОтбора.Параметры.ЗначениеОтбора = СокрЛП(Стр.Роль);
		ОтчетРоли.Вывести(ОблСтрокаОтбора);
	КонецЦикла;
	ОтчетРоли.ЗакончитьГруппуСтрок();
	
	//Вывод результата отчета
	мРезультат = Новый Массив;
	ВывестиШапку = Истина;
	
	Для Каждого Стр Из НайденныеСтроки Цикл
		Если НЕ Стр.Флаг Тогда
			Продолжить;
		КонецЕсли;
		
		//Заголовок - Роль
		ОтчетРоли.Вывести(ОблПустаяСтрока);
		ОблШапки2.Параметры.ЗаголовокТаблицы = Стр.Роль + "  # " + Метаданные.Роли[Стр.Роль].Синоним;
		ОтчетРоли.Вывести(ОблШапки2);
		ОтчетРоли.НачатьГруппуСтрок(Метаданные.Роли[Стр.Роль].Синоним, Истина);//Начало группировки
		
		Для н=1 по мМета.Количество()-1 Цикл
			Если Не ВывестиШапку Тогда//Значит уже выводили шапку, надо закрыть группировку
				ОтчетРоли.ЗакончитьГруппуСтрок();
			КонецЕсли;
			ВывестиШапку = Истина;
			
			ПраваДляОпроса = ПолучитьПраваДляОпроса(сМета[н-1], Права8_3);
			
			Для Каждого ЭлМ Из мМета[н] Цикл
				
				мРезультат.Очистить();
				ФлагВыводить=Ложь;
				
				Для Каждого ПраваОбъекта Из ПраваДляОпроса Цикл
					Попытка
						РезультатОпроса = ПравоДоступа(ПраваОбъекта, ЭлМ, Метаданные.Роли[Стр.Роль]);
					Исключение
						Сообщить(ОписаниеОшибки());
						РезультатОпроса = Ложь;
					КонецПопытки;
					мРезультат.Добавить(РезультатОпроса);
					Если РезультатОпроса Тогда
						ФлагВыводить = Истина;
					КонецЕсли;
				КонецЦикла;
				
				Если Не ФлагВыводить Тогда//Нет прав ни чего не выводим
					Продолжить;
				КонецЕсли;
				
				Если ВывестиШапку Тогда//Один раз выводим шапку для каждого типа метаданных
					//Заголовок - Документы
					ОтчетРоли.Вывести(ОблПустаяСтрока);
					ОблШапки2.Параметры.ЗаголовокТаблицы = сМета[н-1];
					ОтчетРоли.Вывести(ОблШапки2);
					ОтчетРоли.НачатьГруппуСтрок(сМета[н-1], Истина);//Каждую табличку тоже свернем
					
					ОблШапки3.Параметры.ШапкаТаблицы = "Объект";
					ОтчетРоли.Вывести(ОблШапки3);
					ОблШапки3.Параметры.ШапкаТаблицы = "Синоним объекта";
					ОтчетРоли.Присоединить(ОблШапки3);
					Для Каждого ПраваОбъекта Из ПраваДляОпроса Цикл//Вывод шапки таблицы
						ОблШапки3.Параметры.ШапкаТаблицы = ПраваОбъекта;
						ОтчетРоли.Присоединить(ОблШапки3);
					КонецЦикла;
					
					ВывестиШапку = Ложь;
				КонецЕсли;
				
				//Теперь выводим строки
				ОблСтрока.Параметры.ЗначениеСтроки = ЭлМ.Имя;
				ОтчетРоли.Вывести(ОблСтрока);
				ОблСтрока.Параметры.ЗначениеСтроки = ЭлМ.Синоним;
				ОтчетРоли.Присоединить(ОблСтрока);
				Для м=0 По мРезультат.Количество()-1 Цикл
					Если Строка(мРезультат[м]) Тогда
						ОблСтрока.Параметры.ЗначениеСтроки = Строка(мРезультат[м]);
					Иначе
						ОблСтрока.Параметры.ЗначениеСтроки = "";
					КонецЕсли;
					ОтчетРоли.Присоединить(ОблСтрока);
				КонецЦикла;
			КонецЦикла;
		КонецЦикла;
		Если Не ВывестиШапку Тогда//Значит уже выводили шапку, надо закрыть группировку
			ОтчетРоли.ЗакончитьГруппуСтрок();
		КонецЕсли;
		ОтчетРоли.ЗакончитьГруппуСтрок();
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте
Процедура ПолучитьПрава(Команда)
	
	ПолучитьПраваСервер();
	
КонецПроцедуры

&НаСервере
Процедура ПолучитьРолиПользователейСервер(Переключатель)
	
	ДеревоОбъект = РеквизитФормыВЗначение("ДеревоМетаданных");
	ПараметрыОтбора = Новый Структура("Выбран", 1);
	НайденныеСтроки = ДеревоОбъект.Строки.НайтиСтроки(ПараметрыОтбора, Истина);
	
	ОбработкаОбъект = РеквизитФормыВЗначение("Объект");
	Макет = ОбработкаОбъект.ПолучитьМакет("Макет");
	
	Выборка = Неопределено;
	Если Переключатель Тогда
		Выборка = Метаданные.Роли;
	Иначе
		Выборка = ПользователиИнформационнойБазы.ПолучитьПользователей();
	КонецЕсли;
	
	ОтчетПрава.Очистить();
	
	ОблШапки1 = Макет.ПолучитьОбласть("Шапка1");
	ОблШапки1.Параметры.ЗаголовокОсновной = "Отчет по метаданным";
	ОтчетПрава.Вывести(ОблШапки1);
	
	ОблШапки2 = Макет.ПолучитьОбласть("Шапка2");
	
	ОблШапки3 = Макет.ПолучитьОбласть("Шапка3|Столбец");
	
	ОблСтрока = Макет.ПолучитьОбласть("Строка|Столбец");
	
	ОблПустаяСтрока = Макет.ПолучитьОбласть("ПустаяСтрока");
	
	ОблСтрокаОтбора = Макет.ПолучитьОбласть("СтрокаОтбора");
	
	//Вывод выбранных значений
	ОблШапки2.Параметры.ЗаголовокТаблицы = "Выбранные метаданные:";
	ОтчетПрава.Вывести(ОблШапки2);
	ОтчетПрава.НачатьГруппуСтрок("Выбранные метаданные", Истина);
	Для Каждого Стр Из НайденныеСтроки Цикл
		Если СокрЛП(Стр.Объект) = "" Тогда
			Продолжить;
		КонецЕсли;
		ОблСтрокаОтбора.Параметры.ЗначениеОтбора = СокрЛП(Стр.Метаданные)+": "+СокрЛП(Стр.Объект);
		ОтчетПрава.Вывести(ОблСтрокаОтбора);
	КонецЦикла;
	ОтчетПрава.ЗакончитьГруппуСтрок();
	
	//Вывод результата по правам
	ПраваДляОпроса = "";
	ПредЗнач = "";
	мРезультат = Новый Массив;
	ЗакрытьГруппу = Ложь;
	
	Для Каждого Стр Из НайденныеСтроки Цикл
		Если СокрЛП(Стр.Объект) = "" Тогда
			Продолжить;
		КонецЕсли;
		
		Если Стр.Метаданные <> ПредЗнач Тогда//Выводим шапку для метаданных
			Если ЗакрытьГруппу Тогда
				ОтчетПрава.ЗакончитьГруппуСтрок();
				ЗакрытьГруппу = Ложь;
			КонецЕсли;
			ОтчетПрава.Вывести(ОблПустаяСтрока);
			ОблШапки2.Параметры.ЗаголовокТаблицы = СокрЛП(Стр.Метаданные);
			ОтчетПрава.Вывести(ОблШапки2);
			ОтчетПрава.НачатьГруппуСтрок(СокрЛП(Стр.Метаданные), Истина);//Начало группировки
			ЗакрытьГруппу = Истина;
			ПраваДляОпроса = ПолучитьПраваДляОпроса(СокрЛП(Стр.Метаданные), Права8_3);//Это можно один раз получать
			ОблШапки3.Параметры.ШапкаТаблицы = "Объект";
			ОтчетПрава.Вывести(ОблШапки3);
			ОблШапки3.Параметры.ШапкаТаблицы = ?(Переключатель,"Имя роли", "Имя пользователя");
			ОтчетПрава.Присоединить(ОблШапки3);
			ОблШапки3.Параметры.ШапкаТаблицы = ?(Переключатель,"Синоним роли", "Пользователь");
			ОтчетПрава.Присоединить(ОблШапки3);
			Для Каждого ПраваОбъекта Из ПраваДляОпроса Цикл//Вывод шапки таблицы
				ОблШапки3.Параметры.ШапкаТаблицы = ПраваОбъекта;
				ОтчетПрава.Присоединить(ОблШапки3);
			КонецЦикла;
			
		КонецЕсли;
		ПредЗнач = Стр.Метаданные;
		
		//Проверяем по всем ролям
		Для Каждого Элемент Из Выборка Цикл
			
			мРезультат.Очистить();
			ФлагВыводить=Ложь;
			//Проверим есть ли права у данной роли 
			Для Каждого ПраваОбъекта Из ПраваДляОпроса Цикл
				Если СокрЛП(Стр.Метаданные) = "Метаданные" Тогда
					РезультатОпроса = ПравоДоступа(ПраваОбъекта, Метаданные, Элемент);
				Иначе
					Попытка
						Если Лев(Стр.Метаданные, 10) = "Подсистемы" Тогда
							НашОбъект = Метаданные.Подсистемы;
							МассивИерархииПодсистем = СтроковыеФункцииКлиентСервер.РазложитьСтрокуВМассивПодстрок(Стр.Объект, ".",,Истина);
							НашОбъект = НашОбъект[МассивИерархииПодсистем[0]];
							Для Сч = 1 По МассивИерархииПодсистем.Количество() - 1 Цикл
								НашОбъект = НашОбъект["Подсистемы"][СокрЛП(МассивИерархииПодсистем[Сч])];
							КонецЦикла;
							РезультатОпроса = ПравоДоступа(ПраваОбъекта, НашОбъект, Элемент); 
						Иначе	
							РезультатОпроса = ПравоДоступа(ПраваОбъекта, Метаданные[СокрЛП(Стр.Метаданные)][СокрЛП(Стр.Объект)], Элемент);
						КонецЕсли;
					Исключение
						Сообщить(ОписаниеОшибки());
						РезультатОпроса = Ложь;
					КонецПопытки;
				КонецЕсли;
				мРезультат.Добавить(РезультатОпроса);
				Если РезультатОпроса Тогда
					ФлагВыводить = Истина;
				КонецЕсли;
			КонецЦикла;
			
			Если НЕ ФлагВыводить Тогда//Нет прав нечего выводит тогда
				Продолжить;
			КонецЕсли;
			
			//Выводи результат по ролям
			//Имя роли
			ОблСтрока.Параметры.ЗначениеСтроки = СокрЛП(Стр.Объект);
			ОтчетПрава.Вывести(ОблСтрока);
			ОблСтрока.Параметры.ЗначениеСтроки = Элемент.Имя;
			ОтчетПрава.Присоединить(ОблСтрока);
			ОблСтрока.Параметры.ЗначениеСтроки = ?(Переключатель, Элемент.Синоним, Элемент.ПолноеИмя);
			ОтчетПрава.Присоединить(ОблСтрока);
			//Результат по объекту
			Для н=0 По мРезультат.Количество()-1 Цикл
				Если Строка(мРезультат[н]) Тогда
					ОблСтрока.Параметры.ЗначениеСтроки = Строка(мРезультат[н]);
				Иначе
					ОблСтрока.Параметры.ЗначениеСтроки = "";
				КонецЕсли;
				ОтчетПрава.Присоединить(ОблСтрока);
			КонецЦикла;
			
		КонецЦикла;
		
		ПредЗнач = Стр.Метаданные;
	КонецЦикла;
	Если ЗакрытьГруппу Тогда//Закроем последнюю группировку
		ОтчетПрава.ЗакончитьГруппуСтрок();
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ПолучитьРоли(Команда)
	
	ПолучитьРолиПользователейСервер(Истина);
	
КонецПроцедуры

&НаКлиенте
Процедура ПолучитьПользователей(Команда)
	
	ПолучитьРолиПользователейСервер(Ложь);
	
КонецПроцедуры

//Заполнение списка пользователями
&НаСервере
Функция ЗаполнитьМассивПользователями()
	МассивПользователей = Новый Массив;
	
	мПользователей = ПользователиИнформационнойБазы.ПолучитьПользователей();
	
	Для Каждого ТекПользователь Из мПользователей Цикл
		ТекСтруктура = Новый Структура("УникальныйИдентификатор, Имя");
		ТекСтруктура.УникальныйИдентификатор = ТекПользователь.УникальныйИдентификатор;
		ТекСтруктура.Имя = ТекПользователь.Имя;
		МассивПользователей.Добавить(ТекСтруктура);
	КонецЦикла;
	
	Возврат МассивПользователей;
КонецФункции

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	ОбновитьДеревоМетаданных();
	
КонецПроцедуры

//Процедуры функции для дерева метаданных
&НаСервере
Процедура ОбновитьДеревоМетаданных()
	
	ЭлементыДМ = ДеревоМетаданных.ПолучитьЭлементы();
	ЭлементыДМ.Очистить();
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
	"ВЫБРАТЬ
	|	ЛОЖЬ КАК Выбран,
	|	ВЫРАЗИТЬ(ТабОбъектов.СтрМетаданные КАК СТРОКА(50)) КАК Метаданные,
	|	ВЫРАЗИТЬ(ТабОбъектов.СтрНаименование КАК СТРОКА(250)) КАК Объект
	|ПОМЕСТИТЬ СтрокиМета
	|ИЗ
	|	&ТабРез КАК ТабОбъектов
	|;
	|
	|////////////////////////////////////////////////////////////////////////////////
	|ВЫБРАТЬ
	|	СтрокиМета.Выбран,
	|	СтрокиМета.Метаданные КАК Метаданные,
	|	СтрокиМета.Объект
	|ИЗ
	|	СтрокиМета КАК СтрокиМета
	|ИТОГИ ПО
	|	Метаданные";
	
	ТекТаб = Объект.ТЧМетаданные.Выгрузить();
	Запрос.УстановитьПараметр("ТабРез", ТекТаб);
	
	ДеревоРезультат = Запрос.Выполнить().Выгрузить(ОбходРезультатаЗапроса.ПоГруппировкамСИерархией);
	
	ЗначениеВРеквизитФормы(ДеревоРезультат, "ДеревоМетаданных");
	
КонецПроцедуры

&НаКлиенте
Процедура ДеревоМетаданныхВыбранПриИзменении(Элемент)
	
	Готово = Истина;
	Если Элементы.ДеревоМетаданных.ТекущиеДанные.Объект = "" Тогда//Это корень дерева
		Если Элементы.ДеревоМетаданных.ТекущиеДанные.Выбран = 2 ИЛИ Элементы.ДеревоМетаданных.ТекущиеДанные.Выбран = 0 Тогда//Выключим все подчиненые
			Элементы.ДеревоМетаданных.ТекущиеДанные.Выбран = 0;
			ТекущийКорень = ДеревоМетаданных.НайтиПоИдентификатору(Элементы.ДеревоМетаданных.ТекущаяСтрока);
			ЭлементыДерева = ТекущийКорень.ПолучитьЭлементы();
			Для Каждого ЭлементДерева ИЗ ЭлементыДерева Цикл
				ЭлементДерева.Выбран = 0;
			КонецЦикла;
		Иначе//Включим все подчиненные
			ТекущийКорень = ДеревоМетаданных.НайтиПоИдентификатору(Элементы.ДеревоМетаданных.ТекущаяСтрока);
			ЭлементыДерева = ТекущийКорень.ПолучитьЭлементы();
			Для Каждого ЭлементДерева ИЗ ЭлементыДерева Цикл
				ЭлементДерева.Выбран = 1;
			КонецЦикла;
		КонецЕсли;
	Иначе
		Если Элементы.ДеревоМетаданных.ТекущиеДанные.Выбран = 2 Тогда
			Элементы.ДеревоМетаданных.ТекущиеДанные.Выбран = 0;
		КонецЕсли;
		ЭлементыДерева = ДеревоМетаданных.ПолучитьЭлементы();
			ТекущийКорень = "";
			Для Каждого ЭлементДерева Из ЭлементыДерева Цикл
				Если ЭлементДерева.Метаданные = Элементы.ДеревоМетаданных.ТекущиеДанные.Метаданные Тогда
					ТекущийКорень = ЭлементДерева;
				КонецЕсли;
			КонецЦикла;
			Если НЕ ТекущийКорень = "" Тогда
				ЭлементыДерева = ТекущийКорень.ПолучитьЭлементы();
				ЕстьВыбран = Ложь;
				НетВыбран = Ложь;
				Для Каждого ЭлементДерева Из ЭлементыДерева Цикл
					Если ЭлементДерева.Выбран = 0 Тогда
						НетВыбран = Истина;
					Иначе
						ЕстьВыбран = Истина;
					КонецЕсли;
				КонецЦикла;
				Если НетВыбран И ЕстьВыбран Тогда
					ТекущийКорень.Выбран = 2;
				ИначеЕсли НЕ ЕстьВыбран Тогда
					ТекущийКорень.Выбран = 0;
				Иначе
					ТекущийКорень.Выбран = 1;
				КонецЕсли;
			КонецЕсли;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ДеревоМетаданныхПриОкончанииРедактирования(Элемент, НоваяСтрока, ОтменаРедактирования)
	
КонецПроцедуры

//Получение матрицы по пользователям
&НаКлиенте
Процедура ПолучитьПользователейИРоли(Команда)
	
	ПолучитьПользователейИРолиСервер();
	
КонецПроцедуры

&НаСервере
Процедура ПолучитьПользователейИРолиСервер()
	
	ОтчетРоли.Очистить();
	ОбработкаОбъект = РеквизитФормыВЗначение("Объект");
	Макет = ОбработкаОбъект.ПолучитьМакет("Макет");
	
	ОблШапки1 = Макет.ПолучитьОбласть("Шапка1");
	ОблШапки1.Параметры.ЗаголовокОсновной = "Отчет по ролям пользователей";
	ОтчетРоли.Вывести(ОблШапки1);
	
	
	
	мРолей = Новый Массив;//Состав ролей по которым будем выводить отчет
	Для Каждого Стр Из Объект.ТЧРоли Цикл
		Если Стр.Флаг Тогда
			мРолей.Добавить(Стр.Роль);
		КонецЕсли;
	КонецЦикла;
	
	мПользователей = ПользователиИнформационнойБазы.ПолучитьПользователей();
	
	ОблШапкиП = Макет.ПолучитьОбласть("ШапкаП|СтолбецШ");
	ОтчетРоли.Вывести(ОблШапкиП);
	ОблШапкиП = Макет.ПолучитьОбласть("ШапкаП|СтолбецП");
	Для Каждого ТекПользователь Из мПользователей Цикл
		ОблШапкиП.Параметры.Пользователь = ТекПользователь.Имя;
		ОтчетРоли.Присоединить(ОблШапкиП);
	КонецЦикла;
	
	ОблСтрокаП = Макет.ПолучитьОбласть("СтрокаП|СтолбецШ");
	ОблРезультат = Макет.ПолучитьОбласть("СтрокаП|СтолбецП");
	Для Каждого ТекРоль Из мРолей Цикл
		ОблСтрокаП.Параметры.Роль = ТекРоль;
		ОтчетРоли.Вывести(ОблСтрокаП);
		Для Каждого ТекПользователь Из мПользователей Цикл
			РолиПользователя = ТекПользователь.Роли;
			стрРезультат = "";
			Если РолиПользователя.Содержит(Метаданные.Роли[ТекРоль]) Тогда
				стрРезультат = "Да";
			КонецЕсли;
			ОблРезультат.Параметры.ЗначениеСтроки = стрРезультат;
			ОтчетРоли.Присоединить(ОблРезультат);
			
		КонецЦикла;
	КонецЦикла;
	
КонецПроцедуры

//Установка флажков
&НаКлиенте
Процедура ТЧРолиФлагВкл(Команда)
	Для Каждого Стр Из Объект.ТЧРоли Цикл
		Стр.Флаг = Истина;
	КонецЦикла;
КонецПроцедуры

&НаКлиенте
Процедура ТЧРолиФлагВыкл(Команда)
	Для Каждого Стр Из Объект.ТЧРоли Цикл
		Стр.Флаг = Ложь;
	КонецЦикла;
КонецПроцедуры

&НаКлиенте
Процедура ТчРолиПользователяФлагВыкл(Команда)
	Для Каждого Стр Из ТчРолиПользователя Цикл
		Стр.Флаг = Ложь;
		Стр.Установлены = Ложь;
	КонецЦикла;
	Элементы.ДекорацияПользователь.Заголовок = "Установленные роли у пользователя:";
КонецПроцедуры

&НаКлиенте
Процедура ТчПользователиФлагВыкл(Команда)
	Для Каждого Стр Из ТчПользователи Цикл
		Стр.Флаг = Ложь;
	КонецЦикла;
КонецПроцедуры

///////Функции и процедуры для работы с пользователями
&НаКлиенте
Процедура ПолучитьРолиТекПользователя(Команда)
	
	ТекИдентификатор = Элементы.ТчПользователи.ТекущиеДанные.Идентификатор;
	ПолучитьРолиТекПользователяСервер(ТекИдентификатор, "Установлены");
	Элементы.ДекорацияПользователь.Заголовок = "Установленные роли у пользователя: "+Элементы.ТчПользователи.ТекущиеДанные.Пользователь;
КонецПроцедуры

&НаКлиенте
Процедура УстановитьКакУТекущего(Команда)
	
	ТекИдентификатор = Элементы.ТчПользователи.ТекущиеДанные.Идентификатор;
	ПолучитьРолиТекПользователяСервер(ТекИдентификатор, "Флаг");
	
КонецПроцедуры

&НаСервере
Процедура ПолучитьРолиТекПользователяСервер(ТекИдентификатор, КолонкаФлага = "Установлены")
	
	мПользователей = ПользователиИнформационнойБазы.ПолучитьПользователей();
	
	ТекПользователь = ПользователиИнформационнойБазы.НайтиПоУникальномуИдентификатору(ТекИдентификатор);
	
	ТабРолиПользователей = РеквизитФормыВЗначение("ТчРолиПользователя");
	ТабРолиПользователей.ЗаполнитьЗначения(Ложь, КолонкаФлага);
	
	сОтбор = Новый Структура("Роль");
	Для Каждого ТекРоль Из ТекПользователь.Роли Цикл
		сОтбор.Роль = ТекРоль.Имя;
		нСтроки = ТабРолиПользователей.НайтиСтроки(сОтбор);
		Если нСтроки.Количество()>0 тогда
			нСтроки[0][КолонкаФлага] = Истина;
		КонецЕсли;
	КонецЦикла;
	
	ЗначениеВРеквизитФормы(ТабРолиПользователей, "ТчРолиПользователя");
	
КонецПроцедуры

&НаКлиенте
Процедура ДополнитьНовыеРоли(Команда)
	
	мИдентификаторы = Новый Массив;
	мРолей = Новый Массив;
	Для Каждого Стр Из ТчПользователи Цикл
		Если Стр.Флаг Тогда
			мИдентификаторы.Добавить(Стр.Идентификатор);
		КонецЕсли;
	КонецЦикла;
	
	Для Каждого Стр Из ТчРолиПользователя Цикл
		Если Стр.Флаг Тогда
			мРолей.Добавить(Стр.Роль);
		КонецЕсли;
	КонецЦикла;
	
	ОбновитьРолиПользователейСервер(мИдентификаторы, мРолей, Ложь);
КонецПроцедуры


&НаСервере
Процедура ОбновитьРолиПользователейСервер(мИдентификаторов, мРолей, Очистить)
	
	мПользователей = ПользователиИнформационнойБазы.ПолучитьПользователей();
	
	Для Каждого ТекИдентификатор Из мИдентификаторов Цикл
		
		ТекПользователь = ПользователиИнформационнойБазы.НайтиПоУникальномуИдентификатору(ТекИдентификатор);
		
		Если Очистить Тогда
			ТекПользователь.Роли.Очистить();
		КонецЕсли;
		
		НужноЗаписать = Ложь;
		Для Каждого ТекРоль Из мРолей Цикл
			Если НЕ ТекПользователь.Роли.Содержит(Метаданные.Роли[ТекРоль]) Тогда
				ТекПользователь.Роли.Добавить(Метаданные.Роли[ТекРоль]);
				НужноЗаписать = Истина;
			КонецЕсли;
		КонецЦикла;
		Если НужноЗаписать Тогда
			ТекПользователь.Записать();
			Сообщить("Для пользователя: "+ТекПользователь.Имя+" изменен состав ролей!");
		КонецЕсли;
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте
Процедура ПерезаписатьРоли(Команда)
	мИдентификаторы = Новый Массив;
	мРолей = Новый Массив;
	Для Каждого Стр Из ТчПользователи Цикл
		Если Стр.Флаг Тогда
			мИдентификаторы.Добавить(Стр.Идентификатор);
		КонецЕсли;
	КонецЦикла;
	
	Для Каждого Стр Из ТчРолиПользователя Цикл
		Если Стр.Флаг Тогда
			мРолей.Добавить(Стр.Роль);
		КонецЕсли;
	КонецЦикла;
	
	ОбновитьРолиПользователейСервер(мИдентификаторы, мРолей, Истина);
КонецПроцедуры






//Функции и процедуры работы с пользователями


//Права по всем метаданным
//Метаданные: Администрирование, АдминистрированиеДанных, ОбновлениеКонфигурацииБазыДанных, МонопольныйРежим, АктивныеПользователи, ЖурналРегистрации, ТонкийКлиент, ВебКлиент
//ТолстыйКлиент, ВнешнееСоединение, Automation, РежимВсеФункции, СохранениеДанныхПользователя, АдминистрированиеРасширенийКонфигурации, ИнтерактивноеОткрытиеВнешнихОбработок,
//ИнтерактивноеОткрытиеВнешнихОтчетов, Вывод

//Подсистемы
//Просмотр

//Параметры сеанса
//Получение, Установка

//Общие реквизиты
//Просмотр, Редактирование

//Планы обмена
//Чтение, Добавление, Изменение, Удаление, Просмотр, ИнтерактивноеДобавление, Редактирование, ИнтерактивноеУдаление, ИнтерактивнаяПометкаУдаления, ИнтерактивноеСнятиеПометкиУдаления
//ИнтерактивноеУдалениеПомеченных, ВводПоСтроке

//Критерии отбора
//Просмотр

//Общие формы
//Просмотр

//Общие команды
//Просмотр

//Константы
//Чтение, Изменение, Просмотр, Редактирование

//Справочники
//Чтение, Добавление, Изменение, Удаление, Просмотр, ИнтерактивноеДобавление, Редактирование, ИнтерактивноеУдаление, ИнтерактивнаяПометкаУдаления, ИнтерактивноеСнятиеПометкиУдаления
//ИнтерактивноеУдалениеПомеченных, ВводПоСтроке, ИнтерактивноеУдалениеПредопределенныхДанных, ИнтерактивнаяПометкаУдаленияПредопределенныхДанных, ИнтерактивноеСнятиеПометкиУдаленияПредопределенных, ИнтерактивноеУдалениеПомеченныхПредопределенныхДан 

//Документы
//Чтение, Добавление, Изменение, Удаление, Проведение, Отмена проведения, Просмотр, ИнтерактивноеДобавление, Редактирование, ИнтерактивноеУдаление, ИнтерактивнаяПометкаУдаления, ИнтерактивноеСнятиеПометкиУдаления
//ИнтерактивноеУдалениеПомеченных, ИнтерактивноеПроведение, ИнтерактивноеПроведениеНеОперативное, ИнтерактивнаяОтменаПроведения, ИнтерактивноеИзменениеПроведенных, ВводПоСтроке

//Журнал документов
//Чтение, Просмотр

//Отчеты
//Использование, Просмотр

//Обработки
//Использование, Просмотр

//Планы видов характеристик
//Чтение, Добавление, Изменение, Удаление, Просмотр, ИнтерактивноеДобавление, Редактирование, ИнтерактивноеУдаление, ИнтерактивнаяПометкаУдаления, ИнтерактивноеСнятиеПометкиУдаления
//ИнтерактивноеУдалениеПомеченных, ВводПоСтроке, ИнтерактивноеУдалениеПредопределенныхДанных, ИнтерактивнаяПометкаУдаленияПредопределенныхДанных, ИнтерактивноеСнятиеПометкиУдаленияПредопределенных, ИнтерактивноеУдалениеПомеченныхПредопределенныхДан 

//Планы счетов
//Чтение, Добавление, Изменение, Удаление, Просмотр, ИнтерактивноеДобавление, Редактирование, ИнтерактивноеУдаление, ИнтерактивнаяПометкаУдаления, ИнтерактивноеСнятиеПометкиУдаления
//ИнтерактивноеУдалениеПомеченных, ВводПоСтроке, ИнтерактивноеУдалениеПредопределенныхДанных, ИнтерактивнаяПометкаУдаленияПредопределенныхДанных, ИнтерактивноеСнятиеПометкиУдаленияПредопределенных, ИнтерактивноеУдалениеПомеченныхПредопределенныхДан 

//Планы видов расчетов
//Чтение, Добавление, Изменение, Удаление, Просмотр, ИнтерактивноеДобавление, Редактирование, ИнтерактивноеУдаление, ИнтерактивнаяПометкаУдаления, ИнтерактивноеСнятиеПометкиУдаления
//ИнтерактивноеУдалениеПомеченных, ВводПоСтроке, ИнтерактивноеУдалениеПредопределенныхДанных, ИнтерактивнаяПометкаУдаленияПредопределенныхДанных, ИнтерактивноеСнятиеПометкиУдаленияПредопределенных, ИнтерактивноеУдалениеПомеченныхПредопределенныхДан 

//Регистры сведений
//Чтение, Изменение, Просмотр, Редактирование, УправлениеИтогами

//Регистры накопления
//Чтение, Изменение, Просмотр, Редактирование, УправлениеИтогами

//Регистры бухгалтерии
//Чтение, Изменение, Просмотр, Редактирование, УправлениеИтогами

//Регистры расчета
//Чтение, Изменение, Просмотр, Редактирование

//Бизнес процессы
//Чтение, Добавление, Изменение, Удаление, Просмотр, ИнтерактивноеДобавление, Редактирование, ИнтерактивноеУдаление, ИнтерактивнаяПометкаУдаления
//ИнтерактивноеСнятиеПометкиУдаления, ИнтерактивноеУдалениеПомеченных, ВводПоСтроке, Интерактивная активация, Старт, ИнтерактивныйСтарт

//Задачи
//Чтение, Добавление, Изменение, Удаление, Просмотр, ИнтерактивноеДобавление, Редактирование, ИнтерактивноеУдаление, ИнтерактивнаяПометкаУдаления
//ИнтерактивноеСнятиеПометкиУдаления, ИнтерактивноеУдалениеПомеченных, ВводПоСтроке, Интерактивная активация, Выполнение, ИнтерактивноеВыполнение

//Внешние источники данных
//Использование, Администрирование, ИзменениеСтандартнойАутентификации, ИзменениеСтандартнойАутентификацииСеанса, ИзменениеАутентификацииОССеанса


//Строковые значения право доступа
//Чтение (Read) - чтение; 
//Добавление (Insert) - добавление; 
//Изменение (Update) - изменение; 
//Удаление (Delete) - удаление; 
//Проведение (Posting) - проведение документов; 
//ОтменаПроведения (UndoPosting) - отмена проведения документов; 
//Просмотр (View) - просмотр; 
//ИнтерактивноеДобавление (InteractiveInsert) - интерактивное добавление; 
//Редактирование (Edit) - редактирование; 
//ИнтерактивнаяПометкаУдаления (InteractiveSetDeletionMark) - интерактивная пометка на удаление; 
//ИнтерактивноеСнятиеПометкиУдаления (InteractiveClearDeletionMark) - интерактивное снятие пометки на удаление; 
//ИнтерактивноеУдалениеПомеченных (InteractiveDeleteMarked) - интерактивное удаление помеченных объектов; 
//ИнтерактивноеПроведение (InteractivePosting) - интерактивное проведение; 
//ИнтерактивноеПроведениеНеОперативное (InteractivePostingRegular) - интерактивное проведение (стандартными командами форм) документа в неоперативном режиме; 
//ИнтерактивнаяОтменаПроведения (InteractiveUndoPosting) - интерактивная отмена проведения; 
//ИнтерактивноеИзменениеПроведенных (InteractiveChangeOfPosted) - интерактивное редактирование проведенного документа. Если право не установлено, то пользователь не может проведенный документ удалить, установить пометку удаления, перепровести или сделать непроведенным. Форма такого документа открывается в режиме просмотра; 
//ВводПоСтроке (InputByString) - использование режима ввода по строке; 
//УправлениеИтогами (TotalsControl) - управление итогами регистра бухгалтерии и регистра накопления (установка периода, по который рассчитаны итоги, и пересчет итогов); 
//Использование (Use) - использование; 
//ИнтерактивноеУдаление (InteractiveDelete) - интерактивное непосредственное удаление; 
//Администрирование (Administration) - администрирование информационной базы; требуется наличия права "Администрирование данных"; 
//АдминистрированиеДанных (DataAdministration) - право на административные действия над данными; 
//МонопольныйРежим (ExclusiveMode) - использование монопольного режима; 
//АктивныеПользователи (ActiveUsers) - просмотр списка активных пользователей; 
//ЖурналРегистрации (EventLog) - журнал регистрации; 
//ВнешнееСоединение (ExternalConnection) - внешнее соединение; 
//Automation (Automation) - использование automation; 
//ИнтерактивноеОткрытиеВнешнихОбработок (InteractiveOpenExtDataProcessors) - интерактивное открытие внешних обработок; 
//ИнтерактивноеОткрытиеВнешнихОтчетов (InteractiveOpenExtReports) - интерактивное открытие внешних отчетов; 
//Получение (Get) - получение значения, не хранящегося в базе данных; 
//Установка (Set) - установка значения, не сохраняемого в базе данных; 
//ИнтерактивнаяАктивация (InteractiveActivate) - интерактивная активация; 
//Старт (Start) - старт бизнес-процесса; 
//ИнтерактивныйСтарт (InteractiveStart) - интерактивный старт бизнес-процесса; 
//Выполнение (Execute) - выполнение задачи; 
//ИнтерактивноеВыполнение (InteractiveExecute) - интерактивное выполнение задачи; 
//Вывод (Output) - вывод на печать, запись и копирование в буфер обмена; 
//ОбновлениеКонфигурацииБазыДанных (UpdateDataBaseConfiguration) - обновление конфигурации базы данных; 
//ТонкийКлиент (ThinClient) - право запуска тонкого клиента; 
//ВебКлиент (WebClient) - право запуска веб-клиента; 
//ТолстыйКлиент (ThickClient) - право запуска толстого клиента; 
//РежимВсеФункции (AllFunctionsMode) - право на использования режима "Все функции"; 
//СохранениеДанныхПользователя (SaveUserData) - право на сохранение данных пользователя (настроек, избранного, истории); 
//ИзменениеСтандартнойАутентификации (StandardAuthenticationChange) - пользователь имеет право изменять свои сохраненные параметры стандартной аутентификации внешнего источника данных; 
//ИзменениеСтандартнойАутентификацииСеанса (SessionStandardAuthenticationChange) - пользователь имеет право изменять параметры стандартной аутентификации внешнего источника данных для текущего сеанса; 
//ИзменениеАутентификацииОССеанса (SessionOSAuthenticationChange) - пользователь имеет право изменять параметры стандартной аутентификации внешнего источника данных для текущего сеанса и текущего пользователя; 
//ИнтерактивноеУдалениеПредопределенныхДанных (InteractiveDeletePredefinedData) - интерактивное удаление предопределенных данных; 
//ИнтерактивнаяПометкаУдаленияПредопределенныхДанных (InteractiveSetDeletionMarkPredefinedData) - интерактивная пометка предопределенных данных; 
//ИнтерактивноеСнятиеПометкиУдаленияПредопределенных (InteractiveClearDeletionMarkPredefinedData) - интерактивное снятие пометки предопределенных данных; 
//ИнтерактивноеУдалениеПомеченныхПредопределенныхДан (InteractiveDeleteMarkedPredefinedData) - интерактивное удаление помеченных предопределенных данных; 
//АдминистрированиеРасширенийКонфигурации (ConfigExtensionsAdministration) - право на администрирование расширений конфигурации.




//Метаданные
//Подсистемы
//Параметры сеанса
//Общие реквизиты
//Планы обмена
//Критерии отбора
//Общие формы
//Общие команды
//Константы
//Справочники
//Документы
//Журнал документов
//Отчеты
//Обработки
//Планы видов характеристик
//Планы счетов
//Планы видов расчетов
//Регистры сведений
//Регистры накопления
//Регистры бухгалтерии
//Регистры расчета
//Бизнес процессы
//Задачи
//Внешние источники данных
















