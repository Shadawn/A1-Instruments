﻿Функция НастройкиМеханизма() Экспорт
	Настройки = А1Э_Механизмы.НовыйНастройкиМеханизма();
	
	Настройки.Обработчики.Вставить("ФормаПриСозданииОбъектов", Истина);
	
	Возврат Настройки;
КонецФункции

#Если НЕ Клиент Тогда
	
	Функция ФормаПриСозданииОбъектов(Форма, Отказ, МассивОписаний) Экспорт 
		А1Э_Формы.ДобавитьОписаниеРеквизитаИЭлемента(МассивОписаний, "Идентификатор", "Строка");
		А1Э_Формы.ДобавитьОписаниеКомандыИКнопки2(МассивОписаний, "Показать", ИмяМодуля() + ".Показать");
	КонецФункции
	
#КонецЕсли
#Если Клиент Тогда
	
	Функция Показать(Форма, Команда) Экспорт  
		Ссылка = А1Э_ОбщееСервер.РезультатФункции("А1Э_Метаданные.СсылкаПоИдентификатору", Форма.Идентификатор);
		ПоказатьЗначение(, Ссылка);	
	КонецФункции
	
#КонецЕсли

Функция ИмяМодуля() Экспорт
	Возврат "А1И_ПомощникРаботыСИдентификаторами";	
КонецФункции

