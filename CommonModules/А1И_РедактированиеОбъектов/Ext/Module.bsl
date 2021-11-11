﻿Функция НастройкиМеханизма() Экспорт
	Настройки = А1Э_Механизмы.НовыйНастройкиМеханизма();
	
	Настройки.Обработчики.Вставить("ФормаПриСозданииОбъектов", Истина);
	
	Настройки.ПорядокВыполнения = 1000000;
	
	Возврат Настройки;
КонецФункции

#Если НЕ Клиент Тогда
	
	Функция ФормаПриСозданииОбъектов(Форма, Отказ, МассивОписаний) Экспорт
		Если НЕ РольДоступна("А1И_Инструменты") Тогда Возврат Неопределено; КонецЕсли;
		Если НЕ А1Э_Общее.РавноОдномуИз(А1Э_Формы.ТипФормы(Форма), "ФормаЭлемента", "ФормаСписка") Тогда Возврат Неопределено; КонецЕсли; 
		
		А1Э_Формы.ДобавитьОписаниеКомандыИКнопки2(МассивОписаний, "А1И_РедактированиеОбъектов_Открыть", ИмяМодуля() + ".КомандаОткрыть", "Открыть в редакторе", А1Э_Формы.КоманднаяПанель(Форма)); 	
	КонецФункции
	
	Функция УниверсальнаяФормаОбъектаПриСозданииНаСервере(Форма, Отказ, СтандартнаяОбработка) Экспорт
		Ссылка = Форма.Параметры.Ссылка;
		Объект = Ссылка.ПолучитьОбъект();
		МассивОписаний = Новый Массив;
		А1Э_Формы.ДобавитьОписаниеРеквизита(МассивОписаний, "Объект", ТипЗнч(Объект));
		А1Э_УниверсальнаяФорма.ДобавитьРеквизитыИЭлементы(Форма, МассивОписаний);
		МассивОписаний.Очистить();
		А1БК_СтандартнаяФорма.ФормаЭлементаПриСозданииОбъектов(Форма, Отказ, МассивОписаний);
		А1Э_Формы.ДобавитьОписаниеКомандыИКнопки2(МассивОписаний, "СохранитьИзменения", ИмяМодуля() + ".СохранитьИзменения:НаСервере", "Сохранить изменения", "ФормаКоманднаяПанель"); 
		А1Э_УниверсальнаяФорма.ДобавитьРеквизитыИЭлементы(Форма, МассивОписаний);
		Форма.ЗначениеВРеквизитФормы(Объект, "Объект");
	КонецФункции
	
	Функция СохранитьИзменения(Форма, ИмяКоманды) Экспорт 
		Объект = Форма.РеквизитФормыВЗначение("Объект");
		А1Э_Объекты.Записать(Объект);
		Форма.ЗначениеВРеквизитФормы(Объект, "Объект");
	КонецФункции
	
#КонецЕсли
#Если Клиент Тогда
	
	Функция КомандаОткрыть(Форма, Команда) Экспорт 
		ТекущаяСсылка = А1Э_Формы.ТекущаяСсылка(Форма);
		Если НЕ ЗначениеЗаполнено(ТекущаяСсылка) Тогда
			Сообщить("Текущая ссылка не обнаружена!");
		КонецЕсли;
		А1Э_УниверсальнаяФорма.Открыть("Универсальная форма объекта", ИмяМодуля() + ".УниверсальнаяФормаОбъектаПриСозданииНаСервере", А1Э_Структуры.Создать(
		"Ссылка", ТекущаяСсылка,
		)); 	
	КонецФункции
	
#КонецЕсли

Функция ИмяМодуля() Экспорт
	Возврат "А1И_РедактированиеОбъектов";	
КонецФункции