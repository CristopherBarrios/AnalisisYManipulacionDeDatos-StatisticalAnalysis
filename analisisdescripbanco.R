
##  PRIMERA PARTE: AN?LISIS EXPLORATORIO DE DATOS

# Leer el archivo de datos

# no olvidar primero establecer el directorio de trabajo

banco <- read.csv("bank-data.csv",header=T)

# ver la estructura de los datos y ver un resumen
# de las principales variables

str(banco)

summary(banco)

head(banco)
tail(banco)

# seleccionemos una variable cuantitativa y realicemos
# un an?lisis estad?stico descriptivo de la misma

# la variable Ingreso (income) es cuantitativa continua:

summary(banco$income)  # nos da un resumen de algunas medidas estad?sticas

mean(banco$income)    # si queremos calcular solo la media

median(banco$income)  # si queremos calcular solo la mediana

max(banco$income)     # si queremos calcular el maximo

min(banco$income)     # si queremos calcular el minimo

range(banco$income) # podemos calcular el rango

sd(banco$income)   #  calcular la desviacion estandar

var(banco$income)   # calcular la varianza

# veamoslo graficamente:

hist(banco$income,col="yellow")   # construir un histograma

# tracemos una linea en la media

abline(v=mean(banco$income), col="red")

# ahora tracemos una linea en la mediana

abline(v=median(banco$income), col="blue")

## discuta sobre la forma del histograma y las causas de dicha forma

boxplot(banco$income,col="green")  # construir un grafico de cajas

# calculo de las medidas de orden

quantile(banco$income, 0.25)  # percentil 25 o cuartil 1

quantile(banco$income, 0.5)  # percentil 50 o cuartil 2 o mediana

quantile(banco$income, 0.75)  # percentil 75 o cuartil 3


## veamos cuantas personas hay arriba del percentil 90

p90 <- quantile(banco$income, 0.9)   # percentil 90

ricos <- banco[banco$income > p90,]  ## data frame del top 10% 

nrow(ricos)   # n?mero de filas de los "ricos"

## responda cu?ntas personas pertenecen al top 10% y a qu?
# R/ solamente 60 personas pertenece a este top de 10%

## porcentaje de la muestra corresponde
# R/ 10%

# trazar lineas horizontales para definir algunos percentiles

abline(h=quantile(banco$income,0.9), col="red")

abline(h=quantile(banco$income,0.75), col="blue")


# analicemos una variable cuantitativa discreta

# la media de una variable discreta no tiene interpretacion real

mean(banco$children)  

# cuando son pocos valores, se puede construir una tabla

table(banco$children)  

# puedo asignar la tabla a una variable

hijos <- table(banco$children)

# para graficar, puedo utilizar un grafico de barras

barplot(hijos)

# al igual que las variables discretas, las variables
# cualitativas se analizan por medio de tablas de frecuencia

reg <- table(banco$region)

reg

pie(reg)


## exploremos algunas relaciones entre 2 variables

## veamos si hay diferencia entre los ingresos para hombres y mujeres

boxplot(income ~ sex, data=banco, col=c("pink", "cyan"))

##  discuta si en su opini?n existen diferencias significativas
# R/ en general estan muy parecidos pero se puede observar que en el lado 
#    de las mujeres hay mas datos atipicos

## ahora debe constru?r un boxplot para explorar si existe
## diferencia entre los ingresos para casados y no casados

##  su c?digo aqu?:

boxplot(income ~ married, data=banco, col=c("blue", "red"))


##  discuta sobre el gr?fico

# R/ Como se puede observar, no existe mayor diferencia entre las personas que
#    estan casadas, lo unico que se puede ver esque como media los que
#    estan cadados ganan un poco menos que los que no pero existe mas personas
#    que tienden a ganar mas que las que no estan cadadas

## construya un histograma de la variable "age" (edad) y discuta
## sobre la forma del mismo

## su c?digo aqu?:

hist(banco$age)


## veamos si existe relaci?n entre la edad  y los ingresos

plot(banco$age, banco$income, col="blue")

## basado en el gr?fico, b?sque en google el t?rmino HETEROCEDASTICIDAD
## y discuta sobre esto

# R/ se utiliza para describir la situación en la que la varianza de los errores de un 
#    modelo estadístico es variable en relación con una o más variables explicativas.
#    En otras palabras, implica que la dispersión de los errores no es constante en todo 
#     el rango de los valores de las variables independientes.

## Ahora exploremos la relaci?n entre 2 variables cualitativas

## Las variables "sex" (sexo) y "pep" (persona pol?ticamente expuesta)

tabla1 <- table(banco$sex, banco$pep)

mosaicplot(tabla1, color=T)

## basado en el gr?fico, parece que no hay una marcada
## diferencia entre los  hombres y mujeres respecto a ser
## personas pol?ticamente expuestas

## siempre la primera variable que se coloca al construir
## la tabla v? en el eje X y la segunda en el eje Y

## ahora su turno, explore la relaci?n entre las variables
## "pep" y "married", es decir, son m?s expuestos los
## casados que los no casados?

## su c?digo aqu?:
tabla2 <- table(banco$married, banco$pep)
mosaicplot(tabla2, color=T)



##  SEGUNDA PARTE:  PROBABIIDADES



















