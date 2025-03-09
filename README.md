# Netflix - Análisis y Visualización de Datos

## Descripción del Proyecto

El dataset fue extraido de Kaggle 'https://www.kaggle.com/datasets/shivamb/netflix-shows'
Y el apoyo con el codigo fue extraido de 'https://www.kaggle.com/datasets/ariyoomotade/netflix-data-cleaning-analysis-and-visualization'

Para este proyecto voy a describir un caso de negocio ficticio:
  "Estoy en una reunion con los productores de Netflix, y quieren empezar la produccion de nuevos shows quieren saber con exactitud la cantidad de shows (tanto series como peliculas) que ya hay en la plataforma,
  para tener una guia y decidir que tipo de producciones empezar a rodar. La Junta de productores tiene un historial de distintas series y peliculas publicadas en netflix, con la siguiente informacion:
    * Director a cargo
    * Pais o paises donde se realizo la produccion
    * Fecha en la que se subio a la plataforma
    * Año en la que fue producida
    * Clasificacion
    * Duracion
    * Genero
    
  Mi tarea como Analista de Datos es:
    * Indicar el porcentaje total de produccion de series y peliculas
    * Mostrar el numero de producciones totales realizadas en cada año desde 2008
    * Graficar la proporcion de producciones totales en cada pais
    * Comparar el tipo de contenido producido en cada pais (Series o Peliculas)
    * Indicar el Top 10 de directores y generos, y el Top de Clasificaciones
    * Que producciones son las mas antiguas?
    * Que tantas producciones de cada tipo se fueron agregando por año?"
    
Este proyecto para mi portafolio demuestra mis habilidades en limpieza, análisis y visualización de datos.


## Herramientas Utilizadas

* **SQL:** Para la limpieza y transformación de datos.
* **Power BI:** Para la creación de un dashboard interactivo y la visualización de datos.

## Proceso

1.  **Limpieza de Datos (SQL):**
    * Se realizó la limpieza y transformación de datos utilizando consultas SQL.
    * Se identificaron y corrigieron errores en los datos, como valores nulos, duplicados e inconsistencias.
    * Se crearon nuevas y tablas artificiales (CTE) para facilitar el análisis.

2.  **Análisis de Datos (Power BI):**
    * Se importaron los datos limpios a Power BI.
    * Se crearon medidas y cálculos DAX para obtener información relevante.
    * Se diseñó un dashboard interactivo con visualizaciones claras y concisas.

3.  **Visualización de Datos (Power BI):**

    * **Dashboard Interactivo:**
        * Este dashboard permite explorar los datos de forma interactiva y obtener información valiosa sobre \[indicar el tema del dashboard].
        * [![Ver Dashboard](Proyecto-Netflix/Dashboard.png)](https://app.powerbi.com/view?r=eyJrIjoiMTY2MGI4MjctZjFhNy00MmQ5LTgxZjUtMGJjYWM0NTgzMWY0IiwidCI6ImNkZWMyMTM0LTAzNjMtNGZkNC04MTU2LTYwMDMwMThmZjQ1MSIsImMiOjR9&pageName=b2429c7251b581496d58)

    * **Gráficos Clave:**

        * **Porcentaje de Tipo de Contenido creado en Netflix:**
            * ![Grafico 1](https://github.com/ENYEL00/Netflix---Data-Cleaning-Analisis-y-Visualizacion/blob/e1367ecddc8b78c39afb175cf78944749db68fdf/Proyecto%20Netflix/Grafico%201.png)
            * En este grafico se puede observar que claramente el contenido que mas se encuentra en la plataforma
              es el de peliculas. Es decir, son mas las peliculas en netflix que las series, tanto las propias producciones
              como la compra de derechos de transmision.

        * **Cantidad de contenido creado por año desde el 2008:**
            * ![Grafico 2](Proyecto-Netflix/Grafico-2.png)
            * En este grafico se observa que la cantidad de producciones propias de Netflix empezaron a despegar alrededor
              de los años 2014 y 2015. Es decir, antes de estos años habian muy pocas produccione propias de Netflix en la
              plataforma, y la mayoria de su contenido era de otras productoras. Y es a entre los años 2018 y 2020 que se
              encuentran la mayor cantidad de producciones propias en Netflix, con 1418 producciones el 2018, 1681 el 2019
              (la mas alta) y 1636 el 2020.

        * **Proporcion de producciones creadas por pais**
            * ![Grafico 3](Proyecto-Netflix/Grafico-3.png)
            * En este grafico se observa un mapa mundi, con la proporcion de la cantidad de producciones creadas por Pais.
              En resumen, mientras mas grande es el circulo que rodea al pais, quiere decir que mayor cantidad de
              producciones hay en la plataforma de ese pais. Por ende se detalla que Estados Unidos tiene la mayor
              proporcion. Esto es de esperarse ya que Netflix es una compañia establecida en los Estados Unidos, ademas de
              que tienen la mayor industria del cine y entretenimiento. Posteriormente vemos que los que mas proporcion
              son Reino Unido y la India. Reino Unido por su gran cantidad de productoras, directores y actores con
              contratos con Netflix, y la India por su cultura de produccion televisiva que la situan entre una de las
              industrias mas grandes del entretenimiento.

        * * **Comparacion de Tipo de contenido creado por Pais**
            * ![Grafico 4](Proyecto-Netflix/Grafico-4.png)
            * En este grafico, se observa una tendencia similar a la del grafico anterior, con USA, la India y el Reino
              Unido, siendo los lideres en esta industria. Y es de destacar que cada una de las industrias en este podio
              apuesta mayormente por peliculas, en vez de series. Y en su mayoria esto se ve asi en casi todos los paises.
              Sin embargo hay distintas excepciones que tienen esta tendencia a la inversa muy marcada. Es decir, hay paises
              con una preferencia a la produccion de series mas que de peliculas. Por ejemplo, Japon. Esta diferencia se ve
              muy marcada por la razon de la cultura del anime. Esto debido a que Netflix muestra una gran cantidad de
              series de tipo anime en su plataforma, tanto producidas por terceros, como producciones propias. Un ejemplo
              adicional muy claro es otro gigante del entretenimiento asiatico, que es Korea del Sur. Esto debido al genero
              K-Drama, que es muy demandado por el publico joven. Otros ejemplos de paises que apuestan por el formato de
              series son Irlanda, Australia y Taiwan. Estos casos pueden deberse a menos restricciones en la produccion,
              escenarios, actores, directores, entre otros.
              
        * * **Top 10 Directores**
            * ![Grafico 5](Proyecto-Netflix/Grafico-5.png)
            * En este grafico se puede observar el ranking de los Top 10 Directores que mas producciones han realizado
              en Netflix. Se distingue una preferencia por la direccion y produccion de peliculas.
              
        * * **Top 10 Generos**
            * ![Grafico 6](Proyecto-Netflix/Grafico-6.png)
            * En este grafico se puede observar el ranking de los Top 10 Generos mas producidos en la plataforma.
              Se puede ver que en su mayoria son peliculas de Drama y comedia, mezclados con otros generos como
              Infantil y familiar, y peliculas romanticas. Pero los generos mas predominantes son de Drama y Comedia.

        * * **Tipo de contenido agregado por año desde 2008**
            * ![Grafico 9](Proyecto-Netflix/Grafico-9.png)
            * En este grafico se puede observar la tendencia de las producciones agregadas a traves de los años a la
              plataforma. En este grafico, estamos tomando en cuenta producciones tanto propias, como de terceros, y se
              separa la linea dependiendo si es Serie o Pelicula. La tendencia mas pronunciada es la de las peliculas
              esto debido al primer grafico que se muestra, existen mas peliculas en Netflix que series, en general. Sin
              embargo las tendencias son similares, tomando en cuentra que las curvas mas pronunciadas se realizan desde
              el año 2014, donde se empiezan a publicar mas series y peliculas. Nuevamente, al rededor de los años 2018 y
              2020 se notan los picos de publicacion en la plataforma.

              
## Conclusiones

En resumen, las producciones publicadas en la plataforma tienen una proporcion 70-30 para las peliculas y series (respectivamente). Las industrias que mejor se adaptan para uno o unos nuevos proyectos, podrian ser USA, UK y la India,
dadas sus robustas industrias para el entretenimiento. En el caso de la direccion, si hay que realizar una pelicula, la gran
mayoria de los directores con los que se ha trabajado tienen basta experiencia en peliculas, ya solo basta verificar el trabajo de cada uno. Si es para serie, un director que podria caber en el papel es Alastair Fothrgill, ya que tiene mas trayectoria en la produccion de series. Y los generos que mas han 'pegado' (dicho coloquialmente) estan alrededor del drama,
y comedia, ya que son las producciones con las que mas ha trabajado Netflix, y las que el publico en general puede disfrutar.

## Contacto

* Correo: angelgdiaze@gmail.com
* [Linkedin](www.linkedin.com/in/angel-diaz-372748252)
