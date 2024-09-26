# Дымчатые леопарды

## Резюме

Дымчатые леопарды — это представители сем. Кошачьи (Felidae), которые до начала XXI века принято было объединять в несколько подвидов вида _Neofelis nebulosa_. Привлечение молекулярных данных (секвенирование коротких участков нескольких митохондриальных генов) показало, что дымчатого леопарда с о. Борнео следует выделить из вида _Neofelis nebulosa_ в отдельный вид _Neofelis diardi_, поскольку предки дымчатых леопардов с материка и островов разошлись около 1,4 млн лет назад. Впоследствии были проведены полногеномные исследования для этих видов. Авторы одного из этих исследований оценили время расхождения _N. nebulosa_ и _N. diardi_ как приблизительно 2 млн лет, а другого — как около 5 млн лет.
Цель данного микропроекта — оценить время расхождения _N. nebulosa_ и _N. diardi_ по данным секвенирования гена _ATP8_ с помощью двух подходов: по известной скорости накопления мутаций в митохондриальной ДНК млекопитающих и по палеонтологическим данным.
Проведённый анализ показал, что в зависимости от подбора настроек действительно можно получить различные оценки в диапазоне от ... до ... .
Следует отметить, что оценка по последовательности короткого фрагмента ( ... н.п.) является приблизительной и не может являться основанием для научных выводов. Проект имеет в первую очередь учебную ценность.

## Методы

Использованные программы: 

Скачиваем даннные (последовательности _ATP8_):
`efetch -db popset -id 126256179 -format fasta >felidae_atp8.fa ## might not work, then go to NCBI`

Правим заголовки в fasta, чтобы потом было удобнее:
`cut -d ' ' -f 1,2,3 felidae_atp8.fa | sed -e 's/ /_/g' > felidae_atp8.renamed.fa`

Выравнивание: 
`mafft --auto felidae_atp8.renamed.fa >felidae_atp8.aln`

Обрезка выравнивания:
`trimal -in felidae_atp8.aln -out felidae_atp8.trim.fas -nogaps`

Построение дерева:
`iqtree2 -s felidae_atp8.trim.fas -o EF437591.1_Felis_catus -alrt 1000 -abayes`

Датировка:
- Настройка в beauti (GUI)
- Запуск beast:`beast felidae_2percent.xml`
- Проверка качества сходимости в Tracer ­(GUI)
- Получение единого консенсусного дерева в treeannotator (GUI)

Строим дерево в R с помощью ggtree:
```{r}
library(ggtree)
#if (!require("BiocManager", quietly = TRUE))
#    install.packages("BiocManager")
#BiocManager::install("treeio")

library(treeio)

felidae2percentTree <- read.beast("felidae_2percent-felidae_atp8.tree")
ggtree(felidae2percentTree) + 
  geom_tiplab() +
  xlim(0, 25) + 
  theme_tree2()
```

## Результаты и обсуждение

В результате проделанного анализа получена следующая филогения исследованных видов: 

В оригинальной статье результаты представлены следующим образом:

Полученные результаты принципиально повторяют результаты, полученные в исходных статьях. Интересно, что, используя фрагмент всего в 100 н.п., мы получили датировку внутри диапазона.

## Список литературы

  - Bursell MG, Dikow RB, Figueiró HV, Dudchenko O, Flanagan JP, Aiden EL, Goossens B, Nathan SK, Johnson WE, Koepfli KP, Frandsen PB. Whole genome analysis of clouded leopard species reveals an ancient divergence and distinct demographic histories. Iscience. 2022 Dec 22;25(12). [https://doi.org/10.1016/j.isci.2022.105647]
  - Yuan J, Wang G, Zhao L, Kitchener AC, Sun T, Chen W, Huang C, Wang C, Xu X, Wang J, Lu H. How genomic insights into the evolutionary history of clouded leopards inform their conservation. Science Advances. 2023 Oct 6;9(40):eadh9143. [https://doi.org/10.1126/sciadv.adh9143]
  - Buckley-Beason VA, Johnson WE, Nash WG, Stanyon R, Menninger JC, Driscoll CA, Howard J, Bush M, Page JE, Roelke ME, Stone G. Molecular evidence for species-level distinctions in clouded leopards. Current Biology. 2006 Dec 5;16(23):2371-6. [https://doi.org/10.1016/j.cub.2006.08.066]

