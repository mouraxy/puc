
<img src="https://raw.githubusercontent.com/mouraxy/puc/main/data_engineering/img/puc.png" align="right"
     alt="puc-rio" height="200">


`Última atualização: 27/08/2023 as 17:20.`

## Description/objective...





## Extract...
<dl>
    <dd>
         
<details><summary>Dados e armazenamento...</summary>
<br>
Para acompanhar o histórico da população brasileira, incluindo informações sobre a população em situação de rua e índices socioeconômicos, foram realizadas pesquisas e compilações de diversos conjuntos de dados. O objetivo era criar uma base de dados abrangente e significativa.

## Pipeline ...
Utilizou-se o Azure Data Factory para criar um pipeline de ingestão automatizada dos dados no Data Lake. O pipeline permitiu reunir os dados de diferentes fontes e formatos, simplificando o processo de coleta e armazenamento.

#### Armazenamento...
Todos os conjuntos de dados foram armazenados no **Data Lake Storage Gen2**, o Datalake da Microsoft. Para essa etapa, foi utilizado o **Azure Data Factory**, uma ferramenta para criar pipelines de ingestão automatizada.

#### Erros de conexão...

Para garantir a integridade dos dados e evitar possíveis erros de conexão, implementou-se um tratamento de erros. Um aplicativo lógico foi configurado para monitorar a conexão e, caso ocorressem problemas, acionaria uma notificação por e-mail.

<dl>
    <dd>

<details><summary>Configuração do aplicativo lógico...</summary>
  
<br>
  
```json
{
    "properties": {
        "DataFactoryName": {
            "type": "string"
        },
        "ErrorMessage": {
            "type": "string"
        },
        "Pipeline": {
            "type": "string"
        },
        "Runid": {
            "type": "string"
        }
    },
    "type": "object"
}
```
</details>

  </dd>
</dl>


</details>

  </dd>
</dl>










  








    
## Modeling...
  <dl>
    <dd>

  <details><summary>Organização dos dados...</summary>
  
  ## *Star schema...*
  Modelo em data warehouses, o Star Schema conecta tabela de `fatos` e `dimensões` por indentificadores distintos, formando uma estrutura de estrela. 
  
  
  > <b>...</b> <br>
  Embora reduza a necessidade de junções complexas, armazenamento e redundância são possíveis riscos associados.
  
  <br>Dado seu enfoque em ambientes de Business Intelligence (BI), `este modelo será incorporado ao MVP` com as respectivas **[tabelas...](https://github.com/mouraxy/puc/tree/main/data_engineering/data_lake)**
  
  </details>
  
  <details><summary>Metadados...</summary>

  ## Catálogo de dados...
  Um catálogo ou dicionário de dados é uma estrutura de governança e consiste em uma compilação de metadados em uma disposição informacional.
  
  ```Entidade: DW FACT_MORADORES_SITUACAO_RUA```
  | id | variavel                                     | tipo          | minimo       | maximo       | fonte                                                                                                           |
  |----|:---------------------------------------------|:-----:|:------------:|:------------:|:-----------------------------------------------------------------------------------------------------------------------:|       
  | 1  | id_municipio                                 |‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ inteiro‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ | 1.100.015    | 5.222.203    | [SNAS²](http://blog.mds.gov.br/redesuas/wp-content/uploads/2018/06/Lista_Munic%C3%ADpios_com_IBGE_Brasil_Versao_CSV.csv) |
  | 2  | id_porte                                     |inteiro‎|‎‎1‎‎ |‎ ‎ ‎ ‎ ‎ ‎ 5‎ ‎ ‎ ‎ ‎ ‎   |[SNAS²](http://blog.mds.gov.br/redesuas/wp-content/uploads/2018/06/Lista_Munic%C3%ADpios_com_IBGE_Brasil_Versao_CSV.csv) |
  | 3  | id_uf                                        |inteiro| 1            | 27           | [SNAS²](http://blog.mds.gov.br/redesuas/wp-content/uploads/2018/06/Lista_Munic%C3%ADpios_com_IBGE_Brasil_Versao_CSV.csv) |
  | 4  | id_regiao                                    |inteiro| 1            | 5            | [SNAS²](http://blog.mds.gov.br/redesuas/wp-content/uploads/2018/06/Lista_Munic%C3%ADpios_com_IBGE_Brasil_Versao_CSV.csv) |
  | 5  | latitude                                     |decimal| -33,69       | 4,60         | [Github](https://raw.githubusercontent.com/kelvins/Municipios-Brasileiros/main/csv/municipios.csv)                       |
  | 6  | longitude                                    |decimal‎|‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ -72,90‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ | -32,41       | [Github](https://raw.githubusercontent.com/kelvins/Municipios-Brasileiros/main/csv/municipios.csv)                       |
  | 7  | pop_censo_2010‎‎‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎  ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎  ‎ ‎ ‎ ‎ ‎   |inteiro| 805          |‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ 11.253.503‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ | [SNAS²](http://blog.mds.gov.br/redesuas/wp-content/uploads/2018/06/Lista_Munic%C3%ADpios_com_IBGE_Brasil_Versao_CSV.csv) |
  | 7  | pop_censo_2022‎‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎‎| inteiro      | -            | -            | [IBGE¹](https://ftp.ibge.gov.br/Censos/Censo_Demografico_2022/Previa_da_Populacao/POP2022_Municipios_20230622.xls)          |
  | 8  | pop_rua                                      | inteiro       | 0            | 48.134       | [UFMG³](https://obpoprua.direito.ufmg.br/tabelas/municipios_serie_historica_pop_rua.xlsx)                        |
  | 9  | pop_rua_ano                                  | inteiro       |     2012     | 2021         | [UFMG³](https://obpoprua.direito.ufmg.br/tabelas/municipios_serie_historica_pop_rua.xlsx)                        |
  
  <sub>¹ Instituto Brasileiro de Geografia e Estatística<br>
  ² Sistema Nacional de Assistência Social<br>
  ³ Universidade Federal de Minas Gerais<br>
  </sub>
  
  </details>

  </dd>
</dl>








## Carga...

`Databricks` <img align="center" src="https://cdn.safe.com/wp-content/uploads/sites/2/2023/03/27112124/databricks-icon.svg" alt="drawing" width="18"/> é uma plataforma escalável em nuvem que harmoniza os processos de Extração, Transformação e Carga (ETL) paralelamente.

> <b>...</b> <br>
Execução paralela envolve a realização simultânea de diversas operações visando otimizar a eficiência computacional.

<br>O uso do Databricks se mostra mais vantajoso em comparação ao emprego do **[expressor de consultas](https://learn.microsoft.com/en-us/azure/data-factory/data-flow-transformation-overview)** do `Azure Data Factory` <img align="center" src="https://ww1.freelogovectors.net/wp-content/uploads/2022/03/azure_data_factory_logo_freelogovectors.net_.png" alt="drawing" width="18"/>, devido à relativa complexidade estrutural do projeto e à capacidade de integração de linguagens (Python e SQL), além de conectores diversificados. 
<br>

<dl>
    <dd>
         
### Código ETL...

`1. Ponto de montagem...`
Recuperar os dados do contêiner (diretório) associado ao Data Lake da Azure.

<details><summary>Mostrar código...</summary>

```py
dbutils.fs.mount(source = "wasbs://puc@datalakenoblesix.blob.core.windows.net", mount_point = "/mnt/puc",
                 extra_configs = {"fs.azure.account.key.datalakenoblesix.blob.core.windows.net":"chave-de-acesso"})
```

</details>

</details>

<br>

`2. Ler aquivos...`
Criar DataFrames/visualizações temporárias com os dados do DL para tratativas subsequentes.

<details><summary>Mostrar código...</summary>

```py
df_moradores_rua = spark.read.format("csv")\
                                  .option("sep", ",")\
                                  .option("header", "true")\
                                  .option("inferSchema", "true")\
                                  .load("/mnt/puc/mvp/engenharia_dados/populacao_sem_teto.csv")

df_moradores_rua.createOrReplaceTempView("populacao_sem_teto")

df_municipios = spark.read.format("csv")\
                                          .option("sep", ";")\
                                          .option("header", "true")\
                                          .option("inferSchema", "true")\
                                          .option("encoding", "ISO-8859-1")\
                                          .load("/mnt/puc/mvp/engenharia_dados/municipios.csv")

df_coordenadas_dos_municipios = spark.read.format("csv")\
                                          .option("sep", ",")\
                                          .option("header", "true")\
                                          .option("inferSchema", "true")\
                                          .load("/mnt/puc/mvp/engenharia_dados/dim_coordenadas_municipios.csv")
```

</details>

<br>

`3. Tratar dados...`
1. Alteração dos rótulos das colunas e eliminação de variáveis não pertinentes ao projeto.

<dl>
    <dd>

<details><summary>Mostrar código...</summary>

```py
colunas_para_excluir = ['ConcatUF+Mun', 'IBGE', 'Capital', '_c9']
df_municipios = df_municipios.drop(*colunas_para_excluir)

df_municipios = df_municipios.withColumnRenamed('IBGE7', 'id_municipio')\
                             .withColumnRenamed('UF', 'uf')\
                             .withColumnRenamed('Município', 'municipio')\
                             .withColumnRenamed('Região', 'regiao')\
                             .withColumnRenamed('População 2010', 'populacao_censo_2010')\
                             .withColumnRenamed('Porte', 'porte')

df_moradores_rua = df_moradores_rua.withColumnRenamed('populacao', 'moradores_rua')\
                                             .withColumnRenamed('ano', 'ano_levantamento')
```

</details>

  </dd>
</dl>

2. Reestruturação das tabelas seguindo o modelo de dados estrela. A criação de um DW nesse esquema facilitará substancialmente o trabalho no Power BI.

<dl>
    <dd>

<details><summary>Mostrar código...</summary>

```py
df_coordenadas_dos_municipios.createOrReplaceTempView("COORDENADAS_MUNICIPIOS")
df_municipios.createOrReplaceTempView("MUNICIPIOS")
df_moradores_rua.createOrReplaceTempView("MORADORES_RUA")

df_municipios_id = spark.sql(""" SELECT municipio
                          FROM MUNICIPIOS
                          ORDER BY municipio
""")

df_municipios_id = df_municipios_id.withColumn('id_municipio', monotonically_increasing_id()+1)
df_municipios_id.createOrReplaceTempView("DIM_MUNICIPIOS")

df_regiao = spark.sql(""" SELECT DISTINCT regiao
                          FROM MUNICIPIOS
                          ORDER BY regiao
""")

df_regiao = df_regiao.withColumn('id_regiao', monotonically_increasing_id()+1)
df_regiao.createOrReplaceTempView("DIM_REGIAO")

df_estado = spark.sql(""" SELECT DISTINCT uf
                          FROM MUNICIPIOS
                          ORDER BY uf
""")

df_estado = df_estado.withColumn('id_uf', monotonically_increasing_id()+1)
df_estado.createOrReplaceTempView("DIM_UNIDADE_FEDERATIVA")

df_porte = spark.sql(""" SELECT DISTINCT porte
                          FROM MUNICIPIOS
                          ORDER BY porte
""")

df_porte = df_porte.withColumn('id_porte', monotonically_increasing_id()+1)
df_porte.createOrReplaceTempView("DIM_PORTE_MUNICIPIO")

df_fato = spark.sql("""
                    SELECT 
                        M.id_municipio, U.id_uf, R.id_regiao, C.latitude, C.longitude, P.id_porte,
                        M.populacao_censo_2010, MR.moradores_rua, MR.ano_levantamento

                        FROM MUNICIPIOS M
                        LEFT JOIN MORADORES_RUA MR ON MR.id_municipio = M.id_municipio
                        LEFT JOIN COORDENADAS_MUNICIPIOS C ON C.id_municipio = M.id_municipio
                        LEFT JOIN DIM_REGIAO R ON R.regiao = M.regiao
                        LEFT JOIN DIM_UNIDADE_FEDERATIVA U ON U.uf = M.uf
                        LEFT JOIN DIM_PORTE_MUNICIPIO P ON P.porte = M.porte

                        ORDER BY M.id_municipio
""")

```

  </dd>
</dl>

</details>

<br>

`4. Carregar...`
Importar os dados para o banco de dados SQL na nuvem. 
  > <b>...</b> <br>
  Previamente, foi necessário preparar o ambiente na Azure por meio das instruções DDL, você pode acessá-las **[aqui!](https://github.com/mouraxy/puc/blob/main/data_engineering/sql/ddl.sql)**

<details><summary>Mostrar código...</summary>

```py
def carga_sql(df, tabela):
    df.write.format("jdbc")\
            .mode("append")\
            .option("url", "jdbc:sqlserver://mouraxy.database.windows.net")\
            .option("port", "1433")\
            .option("user", "mouraxy")\
            .option("password", "senha-banco-de-dados")\
            .option("database", "bd_mouraxy")\
            .option("dbtable", tabela)\
            .save()

carga_sql(df_municipios_id, "DW.DIM_MUNICIPIOS")
carga_sql(df_regiao, "DW.DIM_REGIAO")
carga_sql(df_estado, "DW.DIM_UNIDADE_FEDERATIVA")
carga_sql(df_porte, "DW.DIM_PORTE_MUNICIPIO")
carga_sql(df_fato, "DW.FACT_MORADORES_SITUACAO_RUA")
```

</details>



























  </dd>
</dl>
