﻿#Область ОбработчикиМеханизмов2_0_0
#Область СписокИзменений
//1.1.0 - добавлен обработчик "ПередЗакрытиемНаСервере"
//2.0.0 - добавлены серверные обработчики для всех клиентских обработчиков, обработчик "ПередЗакрытиемНаСервере" удален.
#КонецОбласти

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	А1Э_Механизмы.ФормаПриСозданииНаСервере(ЭтаФорма, Отказ, СтандартнаяОбработка);
КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	А1Э_Механизмы.ФормаПриЧтенииНаСервере(ЭтаФорма, ТекущийОбъект);
КонецПроцедуры

&НаСервере
Процедура ПередЗаписьюНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	А1Э_Механизмы.ФормаПередЗаписьюНаСервере(ЭтаФорма, Отказ, ТекущийОбъект, ПараметрыЗаписи);
КонецПроцедуры

&НаСервере
Процедура ПриЗаписиНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	А1Э_Механизмы.ФормаПриЗаписиНаСервере(ЭтаФорма, Отказ, ТекущийОбъект, ПараметрыЗаписи);
КонецПроцедуры

&НаСервере
Процедура ПослеЗаписиНаСервере(ТекущийОбъект, ПараметрыЗаписи)
	А1Э_Механизмы.ФормаПослеЗаписиНаСервере(ЭтаФорма, ТекущийОбъект, ПараметрыЗаписи);
КонецПроцедуры

&НаСервере
Процедура ОбработкаПроверкиЗаполненияНаСервере(Отказ, ПроверяемыеРеквизиты)
	А1Э_Механизмы.ФормаОбработкаПроверкиЗаполненияНаСервере(ЭтаФорма, Отказ, ПроверяемыеРеквизиты);
КонецПроцедуры

&НаСервере
Процедура ПриСохраненииДанныхВНастройкахНаСервере(Настройки)
	А1Э_Механизмы.ФормаПриСохраненииДанныхВНастройкахНаСервере(ЭтаФорма, Настройки);
КонецПроцедуры

&НаСервере
Процедура ПередЗагрузкойДанныхИзНастроекНаСервере(Настройки)
	А1Э_Механизмы.ФормаПередЗагрузкойДанныхИзНастроекНаСервере(ЭтаФорма, Настройки);
КонецПроцедуры

&НаСервере
Процедура ПриЗагрузкеДанныхИзНастроекНаСервере(Настройки)
	А1Э_Механизмы.ФормаПриЗагрузкеДанныхИзНастроекНаСервере(ЭтаФорма, Настройки);
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	А1Э_Механизмы.ФормаПриОткрытии(ЭтаФорма, Отказ);
	Если А1Э_Механизмы.ЗапланированыСерверныеОбработчики(ЭтаФорма) Тогда
		ПриОткрытии__НаСервере(Отказ);
	КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура ПриОткрытии__НаСервере(Отказ)
	А1Э_Механизмы.ВыполнитьСерверныеОбработчики(ЭтаФорма, Отказ);
КонецПроцедуры

&НаКлиенте
Процедура ПриПовторномОткрытии()
	А1Э_Механизмы.ФормаПриПовторномОткрытии(ЭтаФорма);
	Если А1Э_Механизмы.ЗапланированыСерверныеОбработчики(ЭтаФорма) Тогда
		ПриПовторномОткрытии__НаСервере();
	КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура ПриПовторномОткрытии__НаСервере()
	А1Э_Механизмы.ВыполнитьСерверныеОбработчики(ЭтаФорма);
КонецПроцедуры

&НаКлиенте
Процедура ПередЗакрытием(Отказ, ЗавершениеРаботы, ТекстПредупреждения, СтандартнаяОбработка)
	А1Э_Механизмы.ФормаПередЗакрытием(ЭтаФорма, Отказ, ЗавершениеРаботы, ТекстПредупреждения, СтандартнаяОбработка);
	Если А1Э_Механизмы.ЗапланированыСерверныеОбработчики(ЭтаФорма) Тогда
		ПередЗакрытием__НаСервере(Отказ, ЗавершениеРаботы, ТекстПредупреждения, СтандартнаяОбработка);
	КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура ПередЗакрытием__НаСервере(Отказ, ЗавершениеРаботы, ТекстПредупреждения, СтандартнаяОбработка)
	А1Э_Механизмы.ВыполнитьСерверныеОбработчики(ЭтаФорма, Отказ, ЗавершениеРаботы, ТекстПредупреждения, СтандартнаяОбработка);
КонецПроцедуры

&НаКлиенте
Процедура ПриЗакрытии(ЗавершениеРаботы)
	А1Э_Механизмы.ФормаПриЗакрытии(ЭтаФорма, ЗавершениеРаботы);
	Если А1Э_Механизмы.ЗапланированыСерверныеОбработчики(ЭтаФорма) Тогда
		ПриЗакрытии__НаСервере(ЗавершениеРаботы);
	КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура ПриЗакрытии__НаСервере(ЗавершениеРаботы)
	А1Э_Механизмы.ВыполнитьСерверныеОбработчики(ЭтаФорма, ЗавершениеРаботы);
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаВыбора(ВыбранноеЗначение, ИсточникВыбора)
	А1Э_Механизмы.ФормаОбработкаВыбора(ЭтаФорма, ВыбранноеЗначение, ИсточникВыбора);
	Если А1Э_Механизмы.ЗапланированыСерверныеОбработчики(ЭтаФорма) Тогда
		ОбработкаВыбора__НаСервере(ВыбранноеЗначение, ИсточникВыбора);
	КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура ОбработкаВыбора__НаСервере(ВыбранноеЗначение, ИсточникВыбора)
	А1Э_Механизмы.ВыполнитьСерверныеОбработчики(ЭтаФорма, ВыбранноеЗначение, ИсточникВыбора);
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаОповещения(ИмяСобытия, Параметр, Источник)
	А1Э_Механизмы.ФормаОбработкаОповещения(ЭтаФорма, ИмяСобытия, Параметр, Источник);
	Если А1Э_Механизмы.ЗапланированыСерверныеОбработчики(ЭтаФорма) Тогда
		ОбработкаОповещения__НаСервере(ИмяСобытия, Параметр, Источник);
	КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура ОбработкаОповещения__НаСервере(ИмяСобытия, Параметр, Источник)
	А1Э_Механизмы.ВыполнитьСерверныеОбработчики(ЭтаФорма, ИмяСобытия, Параметр, Источник);
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаАктивизации(АктивныйОбъект, Источник)
	А1Э_Механизмы.ФормаОбработкаАктивизации(ЭтаФорма, АктивныйОбъект, Источник);
	Если А1Э_Механизмы.ЗапланированыСерверныеОбработчики(ЭтаФорма) Тогда
		ОбработкаАктивизации__НаСервере(АктивныйОбъект, Источник);
	КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура ОбработкаАктивизации__НаСервере(АктивныйОбъект, Источник)
	А1Э_Механизмы.ВыполнитьСерверныеОбработчики(ЭтаФорма, АктивныйОбъект, Источник);
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаЗаписиНового(НовыйОбъект, Источник, СтандартнаяОбработка)
	А1Э_Механизмы.ФормаОбработкаЗаписиНового(ЭтаФорма, НовыйОбъект, Источник, СтандартнаяОбработка);
	Если А1Э_Механизмы.ЗапланированыСерверныеОбработчики(ЭтаФорма) Тогда
		ОбработкаЗаписиНового__НаСервере(НовыйОбъект, Источник, СтандартнаяОбработка);
	КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура ОбработкаЗаписиНового__НаСервере(НовыйОбъект, Источник, СтандартнаяОбработка)
	А1Э_Механизмы.ВыполнитьСерверныеОбработчики(ЭтаФорма, НовыйОбъект, Источник, СтандартнаяОбработка);
КонецПроцедуры

&НаКлиенте
Процедура ПередЗаписью(Отказ, ПараметрыЗаписи)
	А1Э_Механизмы.ФормаПередЗаписью(ЭтаФорма, Отказ, ПараметрыЗаписи);
	Если А1Э_Механизмы.ЗапланированыСерверныеОбработчики(ЭтаФорма) Тогда
		ПередЗаписью__НаСервере(Отказ, ПараметрыЗаписи);
	КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура ПередЗаписью__НаСервере(Отказ, ПараметрыЗаписи)
	А1Э_Механизмы.ВыполнитьСерверныеОбработчики(ЭтаФорма, Отказ, ПараметрыЗаписи);
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗаписи(ПараметрыЗаписи)
	А1Э_Механизмы.ФормаПослеЗаписи(ЭтаФорма, ПараметрыЗаписи);
	Если А1Э_Механизмы.ЗапланированыСерверныеОбработчики(ЭтаФорма) Тогда
		ПослеЗаписи__НаСервере(ПараметрыЗаписи);
	КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура ПослеЗаписи__НаСервере(ПараметрыЗаписи)
	А1Э_Механизмы.ВыполнитьСерверныеОбработчики(ЭтаФорма, ПараметрыЗаписи);
КонецПроцедуры

&НаКлиенте
Процедура ВнешнееСобытие(Источник, Событие, Данные)
	А1Э_Механизмы.ФормаВнешнееСобытие(ЭтаФорма, Источник, Событие, Данные);
	Если А1Э_Механизмы.ЗапланированыСерверныеОбработчики(ЭтаФорма) Тогда
		ВнешнееСобытие__НаСервере(Источник, Событие, Данные);
	КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура ВнешнееСобытие__НаСервере(Источник, Событие, Данные)
	А1Э_Механизмы.ВыполнитьСерверныеОбработчики(ЭтаФорма, Источник, Событие, Данные);
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаНавигационнойСсылки(НавигационнаяСсылкаФорматированнойСтроки, СтандартнаяОбработка)
	А1Э_Механизмы.ФормаОбработкаНавигационнойСсылки(ЭтаФорма, НавигационнаяСсылкаФорматированнойСтроки, СтандартнаяОбработка);
	Если А1Э_Механизмы.ЗапланированыСерверныеОбработчики(ЭтаФорма) Тогда
		ОбработкаНавигационнойСсылки__НаСервере(НавигационнаяСсылкаФорматированнойСтроки, СтандартнаяОбработка);
	КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура ОбработкаНавигационнойСсылки__НаСервере(НавигационнаяСсылкаФорматированнойСтроки, СтандартнаяОбработка)
	А1Э_Механизмы.ВыполнитьСерверныеОбработчики(ЭтаФорма, НавигационнаяСсылкаФорматированнойСтроки, СтандартнаяОбработка);
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаПерехода(ОбъектПерехода, СтандартнаяОбработка)
	А1Э_Механизмы.ФормаОбработкаПерехода(ЭтаФорма, ОбъектПерехода, СтандартнаяОбработка);
	Если А1Э_Механизмы.ЗапланированыСерверныеОбработчики(ЭтаФорма) Тогда
		ОбработкаПерехода__НаСервере(ОбъектПерехода, СтандартнаяОбработка);
	КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура ОбработкаПерехода__НаСервере(ОбъектПерехода, СтандартнаяОбработка)
	А1Э_Механизмы.ВыполнитьСерверныеОбработчики(ЭтаФорма, ОбъектПерехода, СтандартнаяОбработка);
КонецПроцедуры

&НаКлиенте
Процедура ВыборЗначения(СтандартнаяОбработка)
	А1Э_Механизмы.ФормаВыборЗначения(ЭтаФорма, СтандартнаяОбработка);
	Если А1Э_Механизмы.ЗапланированыСерверныеОбработчики(ЭтаФорма) Тогда
		ВыборЗначения__НаСервере(СтандартнаяОбработка);
	КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура ВыборЗначения__НаСервере(СтандартнаяОбработка)
	А1Э_Механизмы.ВыполнитьСерверныеОбработчики(ЭтаФорма, СтандартнаяОбработка);
КонецПроцедуры

&НаКлиенте
Процедура ПриИзмененииПараметровЭкрана()
	А1Э_Механизмы.ФормаПриИзмененииПараметровЭкрана(ЭтаФорма);
	Если А1Э_Механизмы.ЗапланированыСерверныеОбработчики(ЭтаФорма) Тогда
		ПриИзмененииПараметровЭкрана__НаСервере();
	КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура ПриИзмененииПараметровЭкрана__НаСервере()
	А1Э_Механизмы.ВыполнитьСерверныеОбработчики(ЭтаФорма);
КонецПроцедуры

&НаКлиенте
Процедура АвтоПодборПользователейСистемыВзаимодействия(Текст, ДанныеВыбора, НазначениеВыбора, СтандартнаяОбработка)
	А1Э_Механизмы.ФормаАвтоПодборПользователейСистемыВзаимодействия(ЭтаФорма, Текст, ДанныеВыбора, НазначениеВыбора, СтандартнаяОбработка);
	Если А1Э_Механизмы.ЗапланированыСерверныеОбработчики(ЭтаФорма) Тогда
		АвтоПодборПользователейСистемыВзаимодействия__НаСервере(Текст, ДанныеВыбора, НазначениеВыбора, СтандартнаяОбработка);
	КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура АвтоПодборПользователейСистемыВзаимодействия__НаСервере(Текст, ДанныеВыбора, НазначениеВыбора, СтандартнаяОбработка)
	А1Э_Механизмы.ВыполнитьСерверныеОбработчики(ЭтаФорма, Текст, ДанныеВыбора, НазначениеВыбора, СтандартнаяОбработка);
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаПолученияФормыВыбораПользователейСистемыВзаимодействия(НазначениеВыбора, Параметры, ВыбраннаяФорма, СтандартнаяОбработка)
	А1Э_Механизмы.ФормаОбработкаПолученияФормыВыбораПользователейСистемыВзаимодействия(ЭтаФорма, НазначениеВыбора, Параметры, ВыбраннаяФорма, СтандартнаяОбработка);
	Если А1Э_Механизмы.ЗапланированыСерверныеОбработчики(ЭтаФорма) Тогда
		ОбработкаПолученияФормыВыбораПользователейСистемыВзаимодействия__НаСервере(НазначениеВыбора, Параметры, ВыбраннаяФорма, СтандартнаяОбработка);
	КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура ОбработкаПолученияФормыВыбораПользователейСистемыВзаимодействия__НаСервере(НазначениеВыбора, Параметры, ВыбраннаяФорма, СтандартнаяОбработка)
	А1Э_Механизмы.ВыполнитьСерверныеОбработчики(ЭтаФорма, НазначениеВыбора, Параметры, ВыбраннаяФорма, СтандартнаяОбработка);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиУниверсальнойФормы1_1_3

#Область СписокИзменений
//1.0.1 - добавлены нажатия для гиперссылок.
//1.1.0 - добавлено подключение произвольных обработчиков ожидания.
//1.1.1 - исправлена ошибка, возникающая когда имя общего модуля равно имени реквизита формы.
//1.1.2 - исправлена ошибка, при которой серверные обработчики падают если в ходе их выполнения был удален исходный элемент, убраны потенциальные коллизии.
//1.1.3 - исправлена ошибка перезаписи реквизита формы "Результат".
#КонецОбласти

#Область Общее

&НаКлиенте 
Функция А1_ОбработчикУниверсальнойФормы__Действие(Элемент, Событие = Неопределено, П1 = Null, П2 = Null, П3 = Null, П4 = Null, П5 = Null) 
	А1_ОбработчикУниверсальнойФормы__ДействиеПродолжение(0, Элемент, Событие, П1, П2, П3, П4, П5);
КонецФункции

&НаКлиенте
Функция А1_ОбработчикУниверсальнойФормы__ДействиеПродолжение(Индекс, Элемент, Событие = Неопределено, П1 = Null, П2 = Null, П3 = Null, П4 = Null, П5 = Null) 
	А1Э_Обработчики = А1Э_УниверсальнаяФорма.ОбработчикиОбъекта(ЭтаФорма, Элемент, Событие);
	А1Э_ИмяЭлемента = Элемент.Имя;
	Для Сч = Индекс По А1Э_Обработчики.Количество() - 1 Цикл
		Обработчик = А1Э_Обработчики[Сч];
		Если А1Э_УниверсальнаяФорма.НаКлиенте(Обработчик) Тогда
			А1Э_Модуль = А1Э_УниверсальнаяФорма.МодульОбработчика(Обработчик.Имя);
			А1Э_Результат = Вычислить(А1Э_УниверсальнаяФорма.СтрокаВыполненияОбработчика1_1_1(Обработчик.Имя, П1, П2, П3, П4, П5));
		ИначеЕсли А1Э_УниверсальнаяФорма.НаСервере(Обработчик) Тогда
			А1_ОбработчикУниверсальнойФормы__ДействиеСервер(Обработчик, А1Э_ИмяЭлемента, П1, П2, П3, П4, П5);
		ИначеЕсли А1Э_УниверсальнаяФорма.НаКлиентеАсинхронно(Обработчик) Тогда
			А1Э_Модуль = А1Э_УниверсальнаяФорма.МодульОбработчика(Обработчик.Имя);
			А1Э_АсинхронныйКонтекст = А1Э_УниверсальнаяФорма.АсинхронныйКонтекст(Сч, Событие);
			А1Э_Результат = Вычислить(А1Э_УниверсальнаяФорма.СтрокаВыполненияОбработчикаАсинхронно1_1_3(Обработчик.Имя, П1, П2, П3, П4, П5));
			Возврат Неопределено;
		КонецЕсли;	
	КонецЦикла;
КонецФункции

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__ДействиеЗавершение(Результат, АсинхронныйКонтейнер) Экспорт 
	А1_ОбработчикУниверсальнойФормы__ДействиеПродолжение(АсинхронныйКонтейнер.АсинхронныйКонтекст.СледующийИндекс,
	АсинхронныйКонтейнер.Элемент, АсинхронныйКонтейнер.АсинхронныйКонтекст.Событие, 
	АсинхронныйКонтейнер.П1, АсинхронныйКонтейнер.П2, АсинхронныйКонтейнер.П3, АсинхронныйКонтейнер.П4, АсинхронныйКонтейнер.П5); 
КонецПроцедуры

&НаСервере 
Функция А1_ОбработчикУниверсальнойФормы__ДействиеСервер(Обработчик, Элемент, П1 = Null, П2 = Null, П3 = Null, П4 = Null, П5 = Null) 
	А1Э_Модуль = А1Э_УниверсальнаяФорма.МодульОбработчика(Обработчик.Имя);
	Результат = Вычислить(А1Э_УниверсальнаяФорма.СтрокаВыполненияОбработчика1_1_1(Обработчик.Имя, П1, П2, П3, П4, П5));  
КонецФункции 

#КонецОбласти 

#Область Команды

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__ВыполнениеКоманды(Команда)
	А1_ОбработчикУниверсальнойФормы__Действие(Команда);	
КонецПроцедуры 

&НаСервере
Функция А1_ОбработчикУниверсальнойФормы__ВыполнениеКоманды_Сервер(ИмяКоманды) 
	А1Э_УниверсальнаяФорма.ВыполнитьОбработчикКомандыСервер(ЭтаФорма, ИмяКоманды);
КонецФункции

&НаКлиенте
Функция А1_ОбработчикУниверсальнойФормы__ВыполнениеКомандыНаСервере(Команда)
	ИмяКоманды = Команда.Имя;
	А1_ОбработчикУниверсальнойФормы__ВыполнениеКоманды_Сервер(ИмяКоманды);
КонецФункции

&НаКлиенте 
Функция А1_ОбработчикУниверсальнойФормы__ВыполнениеКомандыНаКлиентеНаСервере_Завершение(Результат, ДополнительныеПараметры) Экспорт
	А1_ОбработчикУниверсальнойФормы__ВыполнениеКоманды_Сервер(А1Э_Общее.ЗначениеСвойства(ДополнительныеПараметры, "ИмяКоманды", "")); 
КонецФункции

#КонецОбласти 

#Область ОбработчикиОжидания

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__ОбработчикОжидания_Постоянные() 
	А1Э_УниверсальнаяФорма.ВыполнитьОбработчикиОжидания(ЭтаФорма);
КонецПроцедуры

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__ОбработчикОжидания_Однократные() 
	А1Э_УниверсальнаяФорма.ВыполнитьОбработчикиОжидания(ЭтаФорма);
КонецПроцедуры

#КонецОбласти

#Область СобытияРеквизитов

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__ПриИзменении(Элемент)
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "ПриИзменении");
КонецПроцедуры

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__НачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "НачалоВыбора", ДанныеВыбора, СтандартнаяОбработка);
КонецПроцедуры

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__НачалоВыбораИзСписка(Элемент, СтандартнаяОбработка)
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "НачалоВыбораИзСписка", СтандартнаяОбработка);
КонецПроцедуры

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__Очистка(Элемент, СтандартнаяОбработка)
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "Очистка", СтандартнаяОбработка);	
КонецПроцедуры

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__Регулирование(Элемент, Направление, СтандартнаяОбработка)
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "Регулирование", Направление, СтандартнаяОбработка);	
КонецПроцедуры

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__Открытие(Элемент, СтандартнаяОбработка)
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "Открытие", СтандартнаяОбработка);	
КонецПроцедуры

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__Создание(Элемент, СтандартнаяОбработка)
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "Создание", СтандартнаяОбработка);	
КонецПроцедуры

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__ОбработкаВыбора(Элемент, ВыбранноеЗначение, СтандартнаяОбработка)
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "ОбработкаВыбора", ВыбранноеЗначение, СтандартнаяОбработка);	
КонецПроцедуры

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__ИзменениеТекстаРедактирования(Элемент, Текст, СтандартнаяОбработка)
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "ИзменениеТекстаРедактирования", Текст, СтандартнаяОбработка);	
КонецПроцедуры

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__АвтоПодбор(Элемент, Текст, ДанныеВыбора, ПараметрыПолученияДанных, Ожидание, СтандартнаяОбработка)
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "АвтоПодбор", Текст, ДанныеВыбора, ПараметрыПолученияДанных, Ожидание, СтандартнаяОбработка);	
КонецПроцедуры

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__ОкончаниеВводаТекста(Элемент, Текст, ДанныеВыбора, ПараметрыПолученияДанных, СтандартнаяОбработка)
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "ОкончаниеВводаТекста", Текст, ДанныеВыбора, ПараметрыПолученияДанных, СтандартнаяОбработка);	
КонецПроцедуры

#КонецОбласти 

#Область СобытияТабличныхЧастей 

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__Выбор(Элемент, ВыбраннаяСтрока, Поле, СтандартнаяОбработка)
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "Выбор", ВыбраннаяСтрока, Поле, СтандартнаяОбработка);
КонецПроцедуры

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__ПриАктивизацииСтроки(Элемент)
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "ПриАктивизацииСтроки");
КонецПроцедуры

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__ВыборЗначения(Элемент, Значение, СтандартнаяОбработка)
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "ВыборЗначения", Значение, СтандартнаяОбработка);
КонецПроцедуры

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__ПриАктивизацииПоля(Элемент)
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "ПриАктивизацииПоля");
КонецПроцедуры

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__ПриАктивизацииЯчейки(Элемент)
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "ПриАктивизацииЯчейки");
КонецПроцедуры

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__ПередНачаломДобавления(Элемент, Отказ, Копирование, Родитель, Группа, Параметр)
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "ПередНачаломДобавления", Отказ, Копирование, Родитель, Группа, Параметр);
КонецПроцедуры

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__ПередНачаломИзменения(Элемент, Отказ)
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "ПередНачаломИзменения", Отказ);
КонецПроцедуры

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__ПередУдалением(Элемент, Отказ)
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "ПередУдалением", Отказ);
КонецПроцедуры

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__ПриНачалеРедактирования(Элемент, НоваяСтрока, Копирование)
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "ПриНачалеРедактирования", НоваяСтрока, Копирование);
КонецПроцедуры

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__ПередОкончаниемРедактирования(Элемент, НоваяСтрока, ОтменаРедактирования, Отказ)
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "ПередОкончаниемРедактирования", НоваяСтрока, ОтменаРедактирования, Отказ);
КонецПроцедуры

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__ПриОкончанииРедактирования(Элемент, НоваяСтрока, ОтменаРедактирования)
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "ПриОкончанииРедактирования", НоваяСтрока, ОтменаРедактирования);
КонецПроцедуры

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__ПередРазворачиванием(Элемент, Строка, Отказ)
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "ПередРазворачиванием", Строка, Отказ);
КонецПроцедуры

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__ПередСворачиванием(Элемент, Строка, Отказ)
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "ПередСворачиванием", Строка, Отказ);
КонецПроцедуры

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__ПослеУдаления(Элемент)
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "ПослеУдаления");
КонецПроцедуры

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__ПриСменеТекущегоРодителя(Элемент)
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "ПриСменеТекущегоРодителя");
КонецПроцедуры

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__НачалоПеретаскивания(Элемент, ПараметрыПеретаскивания, Выполнение)
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "НачалоПеретаскивания", ПараметрыПеретаскивания, Выполнение);
КонецПроцедуры

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__ПроверкаПеретаскивания(Элемент, ПараметрыПеретаскивания, СтандартнаяОбработка, Строка, Поле)
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "ПроверкаПеретаскивания", ПараметрыПеретаскивания, СтандартнаяОбработка, Строка, Поле);
КонецПроцедуры

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__ОкончаниеПеретаскивания(Элемент, ПараметрыПеретаскивания, СтандартнаяОбработка)
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "ОкончаниеПеретаскивания", ПараметрыПеретаскивания, СтандартнаяОбработка);
КонецПроцедуры

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__Перетаскивание(Элемент, ПараметрыПеретаскивания, СтандартнаяОбработка, Строка, Поле)
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "Перетаскивание", ПараметрыПеретаскивания, СтандартнаяОбработка, Строка, Поле);
КонецПроцедуры

#КонецОбласти

#Область СобытияТабличныхДокументов

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__ОбработкаРасшифровки(Элемент, Расшифровка, СтандартнаяОбработка, ДополнительныеПараметры)
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "ОбработкаРасшифровки", Расшифровка, СтандартнаяОбработка, ДополнительныеПараметры);
КонецПроцедуры

#КонецОбласти

#Область СобытияПланировщика

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__ПриАктивизации(Элемент) 
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "ПриАктивизации");
КонецПроцедуры 

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__ПередСозданием(Элемент, Начало, Конец, Значения, Текст, СтандартнаяОбработка) 
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "ПередСозданием", Начало, Конец, Значения, Текст, СтандартнаяОбработка);
КонецПроцедуры

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__ПередНачаломРедактирования(Элемент, НовыйЭлемент, СтандартнаяОбработка) 
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "ПередНачаломРедактирования", НовыйЭлемент, СтандартнаяОбработка);
КонецПроцедуры

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__ПриСменеТекущегоПериодаОтображения(Элемент, ТекущиеПериодыОтображения, СтандартнаяОбработка) 
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "ПриСменеТекущегоПериодаОтображения", ТекущиеПериодыОтображения, СтандартнаяОбработка);
КонецПроцедуры

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__ПередНачаломБыстрогоРедактирования(Элемент, СтандартнаяОбработка) 
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "ПередНачаломБыстрогоРедактирования", СтандартнаяОбработка);
КонецПроцедуры 

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__ОбработкаФормированияКоманд(Элемент, Параметры, Команды, КомандаПоУмолчанию) 
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "ОбработкаФормированияКоманд", Параметры, Команды, КомандаПоУмолчанию);
КонецПроцедуры 

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__НажатиеНаЭлементеИзмерения(Элемент, ЭлементИзмерения, ЗначенияИзмерений, СтандартнаяОбработка) 
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "НажатиеНаЭлементеИзмерения", ЭлементИзмерения, ЗначенияИзмерений, СтандартнаяОбработка);
КонецПроцедуры 

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__НажатиеНаЭлементеШкалыВремени(Элемент, ЭлементШкалыВремени, Дата)  
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "НажатиеНаЭлементеШкалыВремени", ЭлементШкалыВремени, Дата); 
КонецПроцедуры 

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__НажатиеНаПеренесенномЗаголовкеШкалыВремени(Элемент, Дата)  
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "НажатиеНаПеренесенномЗаголовкеШкалыВремени", Дата); 
КонецПроцедуры 

#КонецОбласти

#Область СобытияСтраниц

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__ПриСменеСтраницы(Элемент, ТекущаяСтраница) 
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "ПриСменеСтраницы", ТекущаяСтраница);
КонецПроцедуры 

#КонецОбласти

#Область СобытияГиперСсылок

&НаКлиенте
Процедура А1_ОбработчикУниверсальнойФормы__Нажатие(Элемент, СтандартнаяОбработка) 
	А1_ОбработчикУниверсальнойФормы__Действие(Элемент, "Нажатие", СтандартнаяОбработка);
КонецПроцедуры

#КонецОбласти

#КонецОбласти
