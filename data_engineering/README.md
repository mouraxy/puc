
<img src="https://github.com/mouraxy/puc/blob/main/data_engineering/img/puc.png" align="right"
     alt="puc-rio" height="120">
`Última atualização: 27/08/2023`

## Description/objective...





## Extract...

<details><summary>Dados e armazenamento...</summary>

  
  Para acompanhar o histórico da população brasileira, incluindo informações sobre a população em situação de rua e índices socioeconômicos, foram realizadas pesquisas e compilações de diversos conjuntos de dados. O objetivo era criar uma base de dados abrangente e significativa.



## Pipeline ...
Utilizou-se o Azure Data Factory para criar um pipeline de ingestão automatizada dos dados no Data Lake. O pipeline permitiu reunir os dados de diferentes fontes e formatos, simplificando o processo de coleta e armazenamento.

#### Armazenamento...
Todos os conjuntos de dados foram armazenados no **Data Lake Storage Gen2**, o Datalake da Microsoft. Para essa etapa, foi utilizado o **Azure Data Factory**, uma ferramenta para criar pipelines de ingestão automatizada.

#### Erros de conexão...

Para garantir a integridade dos dados e evitar possíveis erros de conexão, implementou-se um tratamento de erros. Um aplicativo lógico foi configurado para monitorar a conexão e, caso ocorressem problemas, acionaria uma notificação por e-mail.





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

</details>











  








    
## Modeling...
  <dl>
    <dd>

  <details open><summary>Organização dos dados...</summary>
  
  ## *Star schema...*
  Modelo em data warehouses, o Star Schema conecta tabela de `fatos` e `dimensões` por indentificadores distintos, formando uma estrutura de estrela. 
  
  
  > <b>...</b> <br>
  Embora reduza a necessidade de junções complexas, armazenamento e redundância são possíveis riscos associados.
  
  <br>Dado seu enfoque em ambientes de Business Intelligence (BI), `este modelo será incorporado ao MVP` com as respectivas **[tabelas...]()**
  
  </details>
  
  <details open><summary>Metadados...</summary>

  ## Catálogo de dados...
  Um catálogo ou dicionário de dados é uma estrutura de governança e consiste em uma compilação de metadados em uma disposição informacional.
  
  ```Entidade: DW MORADORES_SITUACAO_RUA```
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








## ETL/load...

`Databricks` <img align="center" src="https://cdn.safe.com/wp-content/uploads/sites/2/2023/03/27112124/databricks-icon.svg" alt="drawing" width="18"/> é uma plataforma escalável em nuvem que harmoniza os processos de Extração, Transformação e Carga (ETL) paralelamente.




