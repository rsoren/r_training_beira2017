## Bem-vindo à Análise de Dados com R!  
Beira, Moçambique - 17 de julho a 28 de julho de 2017  
[Click here](index.md) to view this page in English. 

&nbsp;&nbsp;[Introdução](#intro)  
&nbsp;&nbsp;[Configurando R no seu computador](#setup)  
&nbsp;&nbsp;[Material de curso](#materials)  
&nbsp;&nbsp;[Recursos adicionais para aprender R](#resources)  
&nbsp;&nbsp;[Sobre o instrutor](#about)  

<br>

---

<a id="intro"></a>
### Introdução 

Neste treinamento, aprenderemos os conceitos básicos de como usar R para explorar, analisar e visualizar seus dados. Este site será atualizado após cada dia do curso, incluindo exemplos de código e um resumo do que aprendemos. 

O objetivo do treinamento é dar-lhe habilidades práticas. Vamos nos concentrar em tarefas comuns e problemas que você encontra no seu trabalho diário. Se você estiver trabalhando atualmente em um projeto e quer assistência pessoal, sinta-se à vontade para entrar em contato comigo (consulte "Sobre o instrutor" abaixo). Sua análise pode ser um bom exemplo para trazer para o grupo completo.

Muitas opções de software estão disponíveis para análise de dados, mas você pode preferir R por alguns motivos:
- Ao contrário de SAS, SPSS, Matlab, Stata, Minitab e outros, R é completamente grátis.
- Ao contrário dos programas de apontar e clicar como o Excel, R usa o código. Isso permite que você automatize tarefas repetitivas e acompanhe / reproduza seu trabalho. 
- Como R é de código aberto, milhares de pessoas contribuíram com pacotes que adicionam funcionalidade. Além dos métodos estatísticos, R pode fazer [belos gráficos](http://www.r-graph-gallery.com/all-graphs/), gerar [relatórios automáticos](http://rpubs.com/) e faça aplicações interativas [aplicações web](https://www.rstudio.com/products/shiny/shiny-user-showcase/). 
- R é o [idioma de escolha entre os estatísticos](https://www.fastcompany.com/3030716/the-9-best-languages-for-crunching-data) e está [na demanda](http://blog.revolutionanalytics.com/2014/05/companies-using-r-in-2014.html) em grandes empresas como Google e Facebook. 
- É divertido! 

<br>

---

<a id="setup"></a>
### Configurando R no seu computador
1. Baixe o R [aqui](https://cran.r-project.org/bin/windows/base/). Clique em "Download R 3.4.1 for Windows" e execute o instalador. 
2. Baixe o RStudio [aqui](https://www.rstudio.com/products/rstudio/download/). Clique em "RStudio 1.0.143 - Windows Vista/7/8/10" e execute o instalador. 

*Nota:* Se o seu computador tiver o OS X ou outro sistema operacional, vá para os mesmos sites de 1 e 2 e use os instaladores específicos para o seu computador.

3. Quando estiver pronto para começar, **abra RStudio**, não R. RStudio é um ambiente de desenvolvimento projetado para tornar a experiência de escrever código mais confortável.
4. Depois de abrir o RStudio, selecione a janela "Console", digite `install.packages ("dplyr")` e siga as instruções. Isso instala um pacote R chamado "dplyr" que eu recomendo para manusear dados semelhantes a planilhas. 

<br>

---

<a id="materials"></a>
### Material de curso 

<table align="center">
    <tr>
        <td white-space: nowrap>Dia 1, 17 de julho</td>
        <td>Executar código no RStudio; R como calculadora; variáveis e vetores; usando funções de R</td>
        <td><a href="https://github.com/rsoren/r_training_beira2017/blob/master/scripts/day1_script.R">Código</a></td>
    </tr>
    <tr>
        <td white-space: nowrap>Dia 2, 18 de julho</td>
        <td>Criando vetores; operadores lógicos; indexando um vetor; cordas de caracteres; documentação de ajuda de R</td>
        <td><a href="https://github.com/rsoren/r_training_beira2017/blob/master/scripts/day2_script.R">Código</a></td>
    </tr>
    <tr>
        <td white-space: nowrap>Dia 3, 19 de julho</td>
        <td>Usando Coursera.org; exemplo de análise de dados; cordas de caracteres; indexando matrices</td>
        <td><a href="https://github.com/rsoren/r_training_beira2017/blob/master/scripts/day3_script.R">Código</a></td>
    </tr>
    <tr>
        <td white-space: nowrap>Dia 4, 20 de julho</td>
        <td>R documentação e ajuda on-line; escreve suas próprias funções; "data frames"; salvando e carregando arquivos</td>
        <td><a href="https://github.com/rsoren/r_training_beira2017/blob/master/scripts/day4_script.R">Código</a></td>
    </tr>
    <tr>
        <td white-space: nowrap>Dia 5, 21 de julho</td>
        <td>Manipulação de "data frames"; estatísticas de resumo; alguns gráficos; salvando e carregando arquivos</td>
        <td><a href="https://github.com/rsoren/r_training_beira2017/blob/master/scripts/day5_script.R">Código</a></td>
    </tr>
    <tr>
        <td white-space: nowrap>Dia 6, 24 de julho</td>
        <td>Funções de "dplyr" para manipulação de 'data frames' e estatísticas de resumo</td>
        <td><a href="https://github.com/rsoren/r_training_beira2017/blob/master/scripts/day6_script.R">Código</a></td>
    </tr>
    <tr>
        <td white-space: nowrap>Dia 7, 25 de julho</td>
        <td>Introdução à regressão; gráficos para diferentes tipos de variáveis; cargando arquivos de outros programas</td>
        <td><a href="https://github.com/rsoren/r_training_beira2017/blob/master/scripts/day7_script.R">Código</a></td>
    </tr>
    <tr>
        <td white-space: nowrap>Dia 8, 26 de julho</td>
        <td>TBD</td>
        <td>Código</td>
    </tr>
    <tr>
        <td white-space: nowrap>Dia 9, 27 de julho</td>
        <td>TBD</td>
        <td>Código</td>
    </tr>
    <tr>
        <td white-space: nowrap>Dia 10, 28 de julho</td>
        <td>TBD</td>
        <td>Código</td>
    </tr>
</table>


<br>

---

<a id="resources"></a>
### Recursos adicionais para aprender R

<dl>
  <dt>"Try R" site</dt>
    <dd>Um tutorial interativo que vive no seu navegador. Se você é novo para R, este seria um ótimo lugar para começar. Requer internet.  <br />
    http://tryr.codeschool.com/ </dd>
  
  <dt>"R for Beginners" por Emmanuel Paradis</dt>
    <dd>Uma revisão dos conceitos essenciais de R. A maioria de suas 72 páginas são usadas explicando os exemplos; É um dos tutoriais mais legíveis lá fora.  <br />
    https://cran.r-project.org/doc/contrib/Paradis-rdebuts_en.pdf </dd>
  
  <dt>"The Art of R Programming" por Norman Matloff</dt>
    <dd>Uma revisão mais abrangente (~350 páginas) de conceitos R. Todos os conceitos têm código de exemplo. Se você deseja investir tempo para aprender bem, recomendo digitar cada exemplo.  <br />
    http://www.atmos.albany.edu/facstaff/timm/ATM315spring14/R/The%20Art%20of%20R%20Programming.pdf </dd>
    
  <dt>Certificado de Data Science da Johns Hopkins University</dt>
    <dd>Pode seguir esses cursos gratuitamente no Coursera.org. Eu recomendo os primeiros 4 cursos da série: "The Data Scientist's Toolbox", "R Programming", "Getting and Cleaning Data" e "Exploratory Data Analysis". Se você estiver interessado em testes de hipóteses (por exemplo, obter p-value e intervalo de confiança), veja tambem os cursos "Inferência estatística" e "Modelos de regressão".<br />
    https://www.coursera.org/specializations/jhu-data-science</dd>
    
  <dt>Recursos em português</dt>
    <dd>Este site contém links para muitos recursos (os escritos em português começam no número 25). <br />
        https://producaoanimalcomr.wordpress.com/2015/12/15/livros-r-gratuitos-para-downloads/ </dd>

    
</dl>


<br>

---

<a id="about"></a>
### Sobre o instrutor 

Nome: Reed Sorensen  
Email: rsoren@uw.edu

Sou um estudante de doutorado na Universidade de Washington, visitando Moçambique como parte de uma oportunidade de estudo de três meses no exterior. Com antecedentes em epidemiologia, meu trabalho se concentra na compreensão dos padrões de doença e mortalidade em uma população, e usando métodos quantitativos para determinar as formas mais eficazes de tornar as pessoas mais saudáveis. Por exemplo, no Institute for Health Metrics and Evaluation (IHME), faço simulações para prever os custos e os benefícios para a saúde que resultariam de um programa ou política proposta. Da mesma forma, minha dissertação se concentrará em estimar o quanto da carga de doenças futuras de uma população poderia ser evitada. Eu uso R para o meu trabalho diário desde 2011 e me considere um defensor da ciência aberta e pesquisas reprodutíveis. Eu vivo em Seattle com minha esposa, Lisa e nosso golden retriever, Oliver.
