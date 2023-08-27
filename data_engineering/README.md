<br><br>
## Description/objective...
## Extract...
## Modeling...
<dl><dd><dl><dd>
<details><summary>Organização dos dados...</summary>

## *Star schema...*
Modelo em data warehouses, o Star Schema conecta tabela de `fatos` e `dimensões` por indentificadores distintos, formando uma estrutura de estrela. 

> <b>...</b> <br>
Embora reduza a necessidade de junções complexas, armazenamento e redundância são possíveis riscos associados.

<br>Dado seu enfoque em ambientes de Business Intelligence (BI), `este modelo será incorporado ao MVP` com as respectivas **[tabelas...]()**

</details>

<details><summary>Metadados...</summary>

## Catálogo de dados...
Um catálogo ou dicionário de dados é uma coleção dos metadados, facilitando a localização, compreensão e uso eficaz das informações, promovendo a colaboração e a governança dos dados.

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


