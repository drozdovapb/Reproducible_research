# Приблизительный шаблон оформления задания по курсу «Воспроизводимые исследования в биологии»

## Резюме
*Опираясь на резюме оригинальной статьи, соберите краткое описание своего анализа.*

## Methods / Методы

*Подробно приведите код и информацию о других манипуляциях, использованных для анализа данных, с необходимыми пояснениями*

Данные для анализа были получены из следующего источника следующим образом: ...

`fasterq-dump -A SRXXXX`

Далее были проведены следующие манипуляции с данными: 

```
./bwa mem ref.fa read-se.fq.gz | gzip -3 > aln-se.sam.gz
```

График строили следующим образом

```{r}
library(ggplot2)
ggplot()
```

## Результаты и обсуждение

В результате анализа получились следующие графики:

В оригинальной статье результаты представлены следующим образом:

Полученные результаты полностью повторяют / принципиально повторяют / частично повторяют / не повторяют результаты, полученные в исходной статье. Различия можно объяснить тем, что...

## Список литературы

*Lобавьте сюда информацию об источниках, использованных в ходе подготовки работы (оригинальную статью и другие источники).*
