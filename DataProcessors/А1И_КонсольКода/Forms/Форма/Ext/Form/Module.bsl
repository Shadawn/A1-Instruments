﻿
&НаКлиенте
Процедура НаКлиенте(Команда)
	#Если ВебКлиент Тогда
		Сообщить("Выполнение кода в веб-клиенте доступно только на сервере!");
	#Иначе
		Выполнить(Код);
	#КонецЕсли	
КонецПроцедуры

&НаСервере
Процедура НаСервереНаСервере()
	Выполнить(Код);
КонецПроцедуры

&НаКлиенте
Процедура НаСервере(Команда)
	НаСервереНаСервере();
КонецПроцедуры

&НаСервере
Процедура ДобавитьПоляНаСервере()
	Выполнить("МассивОписаний = Новый Массив;" + Символы.ПС 
	+ Код + ";" + Символы.ПС
	+ "А1Э_Формы.ДобавитьРеквизитыИЭлементы(ЭтаФорма, МассивОписаний);");	
КонецПроцедуры

&НаКлиенте
Процедура ДобавитьПоля(Команда)
	ДобавитьПоляНаСервере();
КонецПроцедуры
