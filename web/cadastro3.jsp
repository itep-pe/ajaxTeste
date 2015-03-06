<%@page contentType="text/html" pageEncoding="iso-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>

<html>
    <head>
        <meta charset="iso-8859-1">
        <meta name="description" content="Sistema de geolocalização realizado em parceria com CPRH, Governo de Pernambuco e ITEP que oferece um serviÃ§o diferenciado e gratuito para a populaÃ§Ã£o">
        <meta name="keywords" content="SIG, Sistema de Informações Geoambientais, Caburé, Pernambuco, Geoambiental, Geolocalização, CPRH, Governo de Pernambuco, ITEP, Instituto de Tecnologia de Pernambuco">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="author" content="Daniel Vilas-Boas">
        <noscript>
        Para completa funcionalidade deste site é necessário habilitar o
        JavaScript. Aqui estão as <a
        href="http://www.enable-javascript.com/pt/" target="_blank">
        instruções de como habilitar o JavaScript no seu navegador</a>.
    </noscript>
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
    <link href="css/style.css" type="text/css" media="all" rel="stylesheet" />
    <!-- Importa o bootstrap link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"-->
    <title>SIG Cabure - Cadastro</title>
    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date();
            a = s.createElement(o),
                    m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
        ga('create', 'UA-49390512-1', 'pe.gov.br');
        ga('send', 'pageview');
    </script>

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="http://code.jquery.com/ui/1.11.2/jquery-ui.min.js"></script>

    <!-- CSS -->
    <style>
        .ui-widget-header,.ui-state-default, ui-button{
            background:#b9cd6d;
            border: 1px solid #b9cd6d;
            color: #FFFFFF;
            font-weight: bold;
        }
    </style>

</head>
<body>
    <!---------- Barra do GovernoPE ------------------>
    <iframe
        src="http://www2.ati.pe.gov.br/SiteAti-theme/topo-governo/topo-governo.html"
        scrolling="no" frameborder="0" width="100%" height="58px"></iframe>
    <!------ /barra do GovernoPE ------------------->
    <!---------- Wrappper ------------------>
    <div class="wrapper">
        <!---------- Topo ------------------>
        <header>
            <div class="block-container">
                <div class="logo">
                    <a href="index.html" title="SIG CaburÃ©"><img
                            src="images/logo-cabure.fw.png" alt="SIG CaburÃ©" /></a>
                </div>
            </div>
        </header>
        <!---------- /Topo ------------------>
        <section class="back-home">
            <div class="inner-container">
                <div class="back-button">
                    <a href="#" onclick="window.history.back();
            return false;"><span><img src="images/ico-btn-voltar.fw.png" alt="Voltar" /> Voltar</span></a>
                </div>
            </div>
        </section>

        <section class="content-title">
            <div class="inner-container">
                <h2 id="superMenu">Fa&ccedila seu Cadastro</h2>
            </div>
        </section>
        <section class="maincontent">
            <div id="menuPassos">
                <div class="passoSelecionado" id="tipoConta">Tipo de conta</div>
                <div class="passoNaoSelecionado" id="dados">Dados</div>
                <div class="passoNaoSelecionado" id="conclusao">Conclus&atilde;o</div>
                <br><br><br><br>
                <p style="color: red"><c:out value="${param.err}"/></p>
            </div>
            <div><p id="tipoContaTexto">Escolha o tipo de conta que mais se adequa &agrave;s suas necessidades </p> </div>

            <div id="buttons">
                <div id="ColaboradorDIV" class="buttonsCadastro" onclick=showColaborador()>
                    <img src="images/ico-screen-cadastro.png" class="imgsCadastro" id="imgColaborador" alt="Colaborador">
                    <div id="txtBotao1" class="textoBotao">
                        <p>Colaborador</p>
                        <span class="textoMenor">Colabore compartilhando fotos, pesquisas e audios de aspectos ambientais e participe da gestao ambiental de Pernambuco enriquecendo o SIG Cabure</span>
                    </div>
                </div>
                <div id="EmpreendedorDIV" class="buttonsCadastro" onclick=showEmpreendedor()>
                    <img src="images/ico-screen-cadastro-empreendedor.png" id="imgEmpreendedor" class="imgsCadastro" alt="Empreendendor">
                    <div id="txtBotao2" class="textoBotao">
                        <p> Empreendedor </p>
                        <span class="textoMenor"> Consulte e gere relatorios sobre influentes em areas de interesse para dar entrada no processo de licenciamento ambiental junto a CPRH</span>
                    </div>
                </div>
            </div>

            <div id="formularioCadastro" style="margin:0 auto; width:65%; padding-top:3em;">
                <form id="formularioColaborador" accept-charset="iso-8859-1" name="formColaborador" method="post" action="Cadastro.do" onsubmit="return validacpf();">
                    <input type="hidden" name="operacao" value="colaborador">
                    <p class="textoForm"> Dados Pessoais </p>

                    <table class="table">
                        <tr>
                            <td class="formLine">
                                <input type="text" title="" id="txt_nome_user" value="<c:out value="${param.txt_nome_user}" default=""/>"
                                       name="txt_nome_user" placeholder="  Nome (*)" required>
                            </td>			

                        </tr>
                    </table>
                    <table class="table">
                        <tr>
                            <td class="formLine">
                                <input type="text" title="" id="txt_cpf" value="<c:out value="${param.txt_cpf}" default=""/>"
                                       name="txt_cpf" placeholder="  CPF (*)" required>
                            </td>

                            <td class="smallTableField">
                                <input type="text"  title="" value="<c:out value="${param.txt_rg}" default=""/>"
                                       name="txt_rg" id="txt_rg" maxlength="15" onkeypress="return numeros(this)" placeholder="  RG (*)" required>
                            </td>

                            <td class="formLine">
                                <input type="text" title=""  value="<c:out value="${param.orgaoemissor}" default=""/>"
                                       id="orgaoemissor" name="orgaoemissor" maxlength="40" placeholder="  Orgao Emissor (*)" required>
                            </td>
                        </tr>

                    </table>

                    <div>
                        <p class="textoForm"> Dados de Contato </p>

                        <table class="table">
                            <tr>
                                <td class="politico">
                                    <input type="text" title=""  class="dadosContato" value="<c:out value="${param.txt_email}" default=""/>"
                                           name="txt_email" id="txt_email" placeholder="  Email (*)" required>
                                </td>
                                <td class="politico">
                                    <input type="text" title=""  class="dadosContato" value="<c:out value="${param.txt_telefone}" default=""/>"
                                           name="txt_telefone" id="txt_telefone" placeholder="  Telefone Fixo">
                                </td>
                            </tr>
                            <tr>
                                <td class="politico">
                                    <input type="text" title=""  name="txt_email_confirmacao" id="txt_email_confirmacao" class="dadosContato" 
                                           style="margin-right:8em;" placeholder="  Confirmar Email (*)" required>
                                </td>

                                <td class="politico">
                                    <input type="text" title="" class="dadosContato" value="<c:out value="${param.txt_telefone_celular}" default=""/>"
                                           name="txt_telefone_celular" id="txt_telefone_celular" placeholder="  Telefone Celular">
                                </td>
                            </tr>
                        </table>
                    </div>	

                    <p class="textoForm"> Dados de endereco </p>

                    <table class="table">
                        <tr>
                            <td class="smallTableField">
                                <input type="text" title="" style="width:100%; display:inline;" value="<c:out value="${param.TXT_CEP}" default=""/>" 
                                       name="TXT_CEP" id="TXT_CEP" onChange="getEndereco()" placeholder="  CEP(*)" required>
                            </td>
                            <td class="formLine">
                                <input type="text" title="" value="<c:out value="${param.TXT_LOGRADOURO}" default=""/>"
                                       name="TXT_LOGRADOURO" id="TXT_LOGRADOURO" placeholder="  Logradouro (*)" required>
                            </td>
                        </tr>
                    </table>

                    <table class="table">
                        <tr>	
                            <td class="smallTableField">
                                <input type="text" title=""  value="<c:out value="${param.TXT_NUMERO}" default=""/>" name="TXT_NUMERO"
                                       onkeypress="return numeros(this)" id="TXT_NUMERO" placeholder="  Numero (*)" required>
                            </td>

                            <td class="formLine">
                                <input type="text" title=""  value="<c:out value="${param.txt_complemento}" default=""/>"
                                       name="txt_complemento" id="txt_complemento" placeholder="  Complemento">
                            </td>

                            <td style="padding-right: 2%;">
                                <input type="text" title="" style="width:100%; display:inline;" value="<c:out value="${param.TXT_BAIRRO}" default=""/>"
                                       name="TXT_BAIRRO" id="TXT_BAIRRO" placeholder="  Bairro (*)">
                            </td>
                        </tr>  
                    </table>

                    <table class="table">
                        <tr>
                            <td style="width: 56%; padding-right: 2%;">
                                <input type="text" title="" value="<c:out value="${param.TXT_CIDADE}" default=""/>"
                                       name="TXT_CIDADE" id="TXT_CIDADE" placeholder="  Municipio (*)" required>
                            </td>

                            <td class="smallTableField">
                                <input type="text" title="" style="width:100%; display:inline;" value="<c:out value="${param.estado}" default=""/>" name="CBO_UF"
                                       id="CBO_UF" autocomplete="OFF" placeholder="  Estado (*)">
                            </td>

                        </tr>
                    </table>

                    <p class="textoForm">	Dados de Acesso ao SIG Cabure </p>

                    <table class="table">
                        <tr>
                            <td class="politico">
                                <input type="password" title="" name="senha" id="Senha" placeholder="  Senha (*)" required>
                            </td>
                            <td class="politico">
                                <input type="password" title="" name="repSenha"   id="repSenha" placeholder="  Confirmar Senha (*)" required>
                            </td>
                        </tr>
                    </table>


                    <p class="miniInfo">(*) Dados de preenchimento obrigat&oacute;rio</p>

                    <input type="checkbox" id="checkboxConcordo" name="concordo" value="" required><span class="concordo">Concordo com os <a href="#">Termos de uso</a> e <a href="#">Politicas de privacidade</a></span>
                    <input type="submit" id="submit" value="Finalizar Cadastro" style="margin-right:9%; width:30%;">

                </form>
                <div id="divEmpreendedor">
                    <form>	
                        <div class="tipoEmpreendedor"><input class="checkboxes" id="pfBox" name="tipo" type="radio" value="pf">Pessoa Fisica</div>
                        <div class="tipoEmpreendedor"><input class="checkboxes" id="pjBox" name="tipo" type="radio" value="pj">Pessoa Juridica</div>
                    </form>
                    <form id="formularioEmpreendedorPJ" accept-charset="iso-8859-1" name="formEmpreendedor" method="post"
                          onsubmit="return validarCNPJ();" action="Cadastro.do">	
                        <input type="hidden" name="operacao" value="empreendedorJuridico">

                        <p class="textoForm"> Dados Empresariais </p>

                        <table class="table">
                            <tr>
                                <td class="formLine">
                                    <input type="text" title="" value="<c:out value="${param.nrs}" default=""/>" name="NomeRazaoSocial"
                                           id="NomeRazaoSocial" placeholder="  Razão Social (*)" required>
                                </td>
                            </tr>
                        </table>

                        <table class="table">
                            <tr>
                                <td class="formLine">
                                    <input type="text" title="" class="dadosContato" value="<c:out value="${param.cnpj}" default=""/>"
                                           name="txt_cnpj" id="txt_cnpj" placeholder="  CNPJ (*)" required>
                                </td>

                                <td class="formLine">
                                    <input type="text" title="" class="dadosContato" value="<c:out value="${param.inscricao}" default=""/>"
                                           id="rg-inscricao" name="rg-inscricao" onkeypress="return numeros(this)" placeholder="  Inscriçao estadual (*)" required>
                                </td>
                            </tr>
                        </table>
                        <div>             
                            <p class="textoForm"> Dados de Contato </p>
                            <table class="table">
                                <tr>
                                    <td class="politico">
                                        <input type="text" title="" class="dadosContato" value="<c:out value="${param.email_e}" default=""/>"
                                               name="txt_email_E" class="required" id="txt_email_E" placeholder="  Email (*)" required>
                                    </td>
                                    <td class="politico">
                                        <input type="text" title=""  class="dadosContato" value="<c:out value="${param.fone_e}" default=""/>"
                                               name="txt_telefone_E" id="txt_telefone_E" placeholder="  Telefone Fixo">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="politico">
                                        <input type="text" title="" class="dadosContato"  name="txt_email_E_confirmacao" id="txt_email_E_confirmacao" style="margin-right:8em;" placeholder="  Confirmar Email  (*)" required>
                                    </td>

                                    <td class="politico">
                                        <input type="text" title="" class="dadosContato" value="<c:out value="${param.celular_e}" default=""/>"
                                               name="txt_telefone_celular_E" id="txt_telefone_celular_E" placeholder="  Telefone Celular">
                                    </td>
                                </tr>
                            </table>

                        </div>

                        <p class="textoForm"> Dados de endereco </p>

                        <table class="table">
                            <tr>
                                <td class="smallTableField">
                                    <input type="text" title="" value="<c:out value="${param.cep_e}" default=""/>"
                                           name="TXT_CEP_E" id="TXT_CEP_E" onChange="getEndereco()" placeholder="  CEP (*)" required>
                                </td>
                                <td class="formLine">
                                    <input type="text" title="" value="<c:out value="${param.logradouro_e}" default=""/>"
                                           name="TXT_LOGRADOURO_E" id="TXT_LOGRADOURO_E" placeholder="  Logradouro (*)" required>
                                </td>
                            </tr>
                        </table>

                        <table class="table">
                            <tr>
                                <td class="smallTableField">
                                    <input type="text" title="" value="<c:out value="${param.numero_e}" default=""/>" name="TXT_NUMERO_E"
                                           onkeypress="return numeros(this)" id="TXT_NUMERO_E" placeholder="  Numero (*)" required>
                                </td>
                                <td class="formLine">
                                    <input type="text" title="" value="<c:out value="${param.complemento_e}" default=""/>"
                                           name="txt_complemento_E" id="txt_complemento_E" placeholder="  Complemento">
                                </td>
                                <td class="formLine">
                                    <input type="text" title="" value="<c:out value="${param.bairro_e}" default=""/>"
                                           name="TXT_BAIRRO_E" id="TXT_BAIRRO_E" placeholder="  Bairro (*)" required>
                                </td>
                            </tr>
                        </table>

                        <table class="table" >
                            <tr>
                                <td style="width: 56%; padding-right: 2%;">
                                    <input type="text" title="" value="<c:out value="${param.cidade_e}" default=""/>"
                                           name="TXT_CIDADE_E" id="TXT_CIDADE_E"  placeholder="  Municipio (*)" required>
                                </td>
                                <td class="smallTableField">
                                    <input type="text" title="" value="<c:out value="${param.estado_e}" default=""/>" name="CBO_UF_E"
                                           id="CBO_UF_E" autocomplete="OFF" placeholder="  Estado (*)" required>
                                </td>

                            </tr>
                        </table>

                        <p class="textoForm">	Dados de Acesso ao SIG Cabure </p>

                        <table class="table">
                            <tr>
                                <td class="politico">
                                    <input type="password" title="" class="dadosAcesso" name="senha_E" id="Senha_E" placeholder="  Senha (*)">
                                </td>
                                <td class="politico">
                                    <input type="password" title="" class="dadosAcesso" name="repSenha_E" id="repSenha_E" placeholder="  Confirmar Senha (*)">
                                </td>
                            </tr>
                        </table>


                        <p class="miniInfo">(*) Dados de preenchimento obrigat&oacute;rio</p>

                        <input type="checkbox" id="checkboxConcordo" name="concordo" value="" required><span class="concordo">Concordo com os <a href="#">Termos de uso</a> e <a href="#">Politicas de privacidade</a></span>
                        <input type="submit" id="submit" value="Finalizar Cadastro" style="margin-right:9%; width:30%;">
                    </form>	

                    <form accept-charset="iso-8859-1" id="formularioEmpreendedorPF" name="formEmpreendedorFisico" method="post" onsubmit="return validarCNPJ();" action="Cadastro.do" >
                        <input type="hidden" name="operacao" value="empreendedorFisico">
                        <p class="textoForm"> Dados Pessoais </p>

                        <table class="table">
                            <tr>
                                <td class="formLine">
                                    <input type="text" title="" value="<c:out value="${param.txt_nome_user}" default=""/>"
                                           name="txt_nome_user" id="txt_nome_user_EF" placeholder="  Nome (*)" required>
                                </td>
                            </tr>
                        </table>

                        <table class="table">
                            <tr>
                                <td class="smallTableField">
                                    <input type="text" title="" value="<c:out value="${param.txt_cpf_E}" default=""/>"
                                           name="txt_cpf" id="txt_cpf_EF" placeholder="  CPF (*)" required>
                                </td>
                                <td class="formLine">
                                    <input type="text" title="" value="<c:out value="${param.txt_rg}" default=""/>"
                                           name="txt_rg" id="txt_rg_EF" maxlength="10" onkeypress="return numeros(this)" placeholder="  RG (*)" required>
                                </td>
                                <td class="formLine">
                                    <input type="text"  title="" value="<c:out value="${param.orgaoemissor}" default=""/>"
                                           id="orgaoemissor_EF" name="orgaoemissor" maxlength="40" placeholder="  Orgao Emissor (*)" required>
                                </td>
                            </tr>
                        </table>
                        <div>

                            <p class="textoForm"> Dados de Contato </p>

                            <table class="table">
                                <tr>
                                    <td class="politico">
                                        <input type="text" title="" class="dadosContato" value="<c:out value="${param.email_ef}" default=""/>"
                                               name="txt_email" class="required" id="txt_email_EF" placeholder="  Email (*)" required>
                                    </td>
                                    <td class="politico">
                                        <input type="text" title=""  class="dadosContato" value="<c:out value="${param.fone_ef}" default=""/>"
                                               name="txt_telefone" id="txt_telefone_EF" placeholder="  Telefone Fixo">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="politico">
                                        <input type="text" title="" name="txt_email_EF_confirmacao" id="txt_email_EF_confirmacao" class="dadosContato" style="margin-right:8em;" placeholder="  Confirmar Email (*)" required>
                                    </td>

                                    <td class="politico">
                                        <input type="text" title="" class="dadosContato" value="<c:out value="${param.celular_ef}" default=""/>"
                                               name="txt_telefone_celular" id="txt_telefone_celular_EF" placeholder="  Telefone Celular">
                                    </td>
                                </tr>
                            </table>
                        </div>	

                        <p class="textoForm"> Dados de endereco </p>

                        <table class="table">
                            <tr>
                                <td class="smallTableField">
                                    <input type="text" title=""  value="<c:out value="${param.cep_ef}" default=""/>"
                                           name="TXT_CEP" id="TXT_CEP_EF" onChange="getEndereco()" placeholder="  CEP (*)" required>
                                </td>
                                <td class="formLine">
                                    <input type="text" title="" value="<c:out value="${param.logradouro_ef}" default=""/>"
                                           name="TXT_LOGRADOURO" id="TXT_LOGRADOURO_EF" placeholder="  Logradouro (*)" required>
                                </td>
                            </tr>
                        </table>

                        <table class="table">
                            <tr>
                                <td class="smallTableField">
                                    <input type="text" title=""  value="<c:out value="${param.numero_ef}" default=""/>" name="TXT_NUMERO"
                                           onkeypress="return numeros(this)" id="TXT_NUMERO_EF" placeholder="  Numero (*)" required>
                                </td>
                                <td class="formLine">
                                    <input type="text" title="" value="<c:out value="${param.complemento_ef}" default=""/>"
                                           name="txt_complemento" id="txt_complemento_EF" placeholder="  Complemento">
                                </td>
                                <td class="formLine">
                                    <input type="text" title=""  value="<c:out value="${param.bairro_ef}" default=""/>"
                                           name="TXT_BAIRRO" id="TXT_BAIRRO_EF" placeholder="  Bairro (*)" required>
                                </td>
                            </tr>
                        </table>

                        <table class="table">
                            <tr>
                                <td style="width: 56%; padding-right: 2%;">
                                    <input type="text" title=""   value="<c:out value="${param.cidade_ef}" default=""/>"
                                           name="TXT_CIDADE" id="TXT_CIDADE_EF" placeholder="  Municipio (*)" required>
                                </td>
                                <td class="smallTableField">

                                    <input type="text" title="" value="<c:out value="${param.estado_ef}" default=""/>" name="CBO_UF"
                                           id="CBO_UF_EF" autocomplete="OFF" placeholder="  Estado (*)" required>
                                </td>     
                            </tr>
                        </table>

                        <p class="textoForm">	Dados de Acesso ao SIG Cabure </p>
                        <table class="table">
                            <tr>
                                <td class="politico">
                                    <input type="password" title=""  name="senha" id="Senha_EF" class="dadosAcesso" placeholder="  Senha (*)" required>
                                </td>
                                <td class="politico">
                                    <input type="password" title="" name="repSenha" id="repSenha_EF" class="dadosAcesso" placeholder="  Confirmar Senha (*)" required>
                                </td>
                            </tr>
                        </table>

                        <p class="miniInfo">(*) Dados de preenchimento obrigat&oacute;rio</p>
                        <input type="checkbox" id="checkboxConcordo" name="concordo" value="" required><span class="concordo">Concordo com os <a href="#">Termos de uso</a> e <a href="#">Politicas de privacidade</a></span>
                        <input type="submit" id="submit" value="Finalizar Cadastro" style="margin-right:9%; width:30%;">
                    </form>
                </div>
                <%--
        <div id="dialog-1" title="Termos de uso">
                 <p class="description">Este termo de responsabilidade estabelece as normas de utilização do serviço de publicação de vídeos, imagens, áudios e textos disponibilizados por meio do site registrado sob o domínio www.cabure.cprh.pe.gov.br (doravante denominado "SIG Caburé"), de propriedade da Agência Estadual de Meio Ambiente - CPRH, Autarquia Estadual de Pernambuco, inscrita no CNPJ N. 06.052.204/0001-52 (doravante denominada CPRH), bem como define as condições legais a que estão subordinados: </p>
                 <p class="description">1. DO OBJETO</p>
                 <p class="description">1.1 Por meio do SIG Caburé, a CPRH coloca à disposição de seus usuários, mediante a aceitação eletrônica deste contrato, uma ferramenta interativa que permite a utilização do serviço de publicação de vídeos, imagens, áudios e textos com o objetivo de divulgação de informações ambientais, nas condições deste Termo.</p>
                 <p class="description">2. DA ACEITAÇÃO</p>
                 <p class="description">2.1 A utilização do SIG Caburé implica a aceitação plena e irrestrita dos itens que constituem este TERMO DE RESPONSABILIDADE.</p>
                 <p class="description">2.2 Torna-se relevante a leitura atenta das condições legais em cada uma das ocasiões que o usuário se propuser a utilizar deste SIG Caburé, visto que todo acesso a serviços e conteúdos nele contidos expressará a incondicional concordância com tais condições.</p>
                 <p class="description">3. DAS CONDIÇÕES DE ACESSO E UTILIZAÇÃO DO SITE</p>
                 <p class="description">3.1 O usuário reconhece que é condição essencial para a utilização do SIG Caburé o preenchimento do formulário de cadastro, sendo obrigado a preenchê-lo com dados verdadeiros, isentando a CPRH de qualquer responsabilidade quanto a dados falsos.</p>
                 <p class="description">3.2 O usuário assume total responsabilidade pelo conteúdo dos vídeos, imagens, áudios e textos publicados, declarando que as mesmas não envolvem desrespeito à imagem de terceiros, e não contêm palavras e/ou expressões contrárias a moral e aos bons costumes, bem como respeita as exigências legais vigentes. </p>
                 <p class="description">3.3 É proibido o uso de vídeos, imagens, áudios e textos de autoria de terceiros, sendo que o usuário deve estar ciente de que será de sua inteira responsabilidade eventuais reclamações por direitos autorais de terceiros, bem como todos os eventuais danos causados pela utilização dos vídeos, imagens, áudios e textos que não sejam de sua autoria.</p>
                 <p class="description">3.4 Havendo medida judicial ou extrajudicial em virtude do disposto neste regulamento, o usuário deve estar ciente de que será denunciado à lide, nos termos do art. 70, III do Código de Processo Civil, responsabilizando-se judicialmente pelo processo demandado por terceiro prejudicado e/ou será acionado pela empresa para o ressarcimento de eventuais valores despendidos para reparar os danos causados pelo usuário.</p>
                 <p class="description">3.5 O usuário fica ciente e concorda que os vídeos, imagens, áudios e textos por ele publicados, por meio do SIG Caburé, poderão ser utilizados e divulgados, de forma gratuita, em qualquer meio de comunicação e veiculação para a divulgação da CPRH, ou por terceiros por ela contratados, em todo território nacional ou exterior, por prazo indeterminado. </p>
                 <p class="description">3.6 O usuário, ao utilizar-se deste SIG Caburé, declara ter ciência de que a eventual publicação dos vídeos, imagens, áudios e textos por ele enviados não dará ensejo ao pagamento de qualquer tipo de indenização pelo uso de suas publicações.</p>
                 <p class="description">3.7 O usuário declara ser maior, capaz, e o único detentor de todos os direitos patrimoniais e morais referentes às suas publicações ou de quem legalmente represente, na hipótese de ser responsável por filhos menores.</p>
        </div>--%>
            </div> 			
        </section> 
        <!---------- /Wrappper ------------------>
        <!---------- InÃ­cio RodapÃ© ------------------>
        <footer>
            <div class="strip"></div>
            <div class="block-container">
                <div class="socials">
                    <span> <!--<a href="#">--> <img
                            src="images/ico-footer-email.fw.png" alt="Enviar Mensagem"
                            title="Enviar Mensagem" /> <!-- </a>-->
                    </span> <span> <a href="http://twitter.com/CPRH_PE" target="_blank">
                            <img src="images/ico-footer-twitter.fw.png"
                                 alt="Siga-nos no Twitter" title="Siga-nos no Twitter" />
                        </a>
                    </span> <span> <a href="http://www.facebook.com/CPRHPE"
                                      target="_blank"> <img
                                src="images/ico-footer-facebook.fw.png"
                                alt="Curta no Facebook" title="Curta no Facebook" />
                        </a>
                    </span> <span class="vline"> <img
                            src="images/ico-footer-ouvidoria.fw.png"
                            alt="Entre em contato com a Ouvidoria" title="Ouvidoria" /> (81)
                        3182-8923
                    </span>
                </div>
                <div class="hline"></div>
                <div class="realizacao">
                    <p>Realizacao</p>
                    <span> <a href="http://www.cprh.pe.gov.br/" target="_blank">
                            <img src="images/logo-cprh.fw.png"
                                 alt="AgÃªncia Estadual do Meio Ambiente"
                                 title="AgÃªncia Estadual do Meio Ambiente" />
                        </a>
                    </span> <span> <a href="http://www.pe.gov.br/" target="_blank">
                            <img src="images/logo-governo-pe-secretaria-ma.fw.png"
                                 alt="Governo de Pernambuco" title="Governo de Pernambuco" />
                        </a>
                    </span>
                </div>
                <div class="hline"></div>
                <div class="development">
                    <p>Desenvolvimento</p>
                    <br> <br> <span> <a href="http://www.itep.br" target="_blank"> <img src="images/logo-itep.fw.png" alt="ITEP" /></a>
                    </span> <br> <br> <br>
                    <p>
                        <a class="goToHeader" href="javascript:;"><img
                                src="images/btn-go-to-header.fw.png"
                                alt="Voltar para Topo" title="Voltar para Topo" /></a>
                    <p>
                </div>
            </div>

            <!-- script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js" type="text/javascript"></script> -->
            <!--script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script> -->
            <script>

                $(document).ready(function () {


                    //checks for the button click event
                    $("#txt_cpf").focusout(function (e) {
                        //alert("Teste abriu funcao focusout txt_cpf ajax ok");
                        //get the form data using another method 
                        var personCode = $("input#txt_cpf").val();
                        dataString = "personCode=" + personCode;

                        //make the AJAX request, dataType is set to json
                        //meaning we are expecting JSON data in response from the server
                        $.ajax({
                            type: "POST",
                            url: "testInformation",
                            data: dataString,
                            dataType: "json",
                            //if received a response from the server
                            success: function (data, textStatus, jqXHR) {
                                // Usuário existente
                                if (data.success) {
                                    //$("input#txt_cpfkk").css("background-color", "white");
                                    //$("input#txt_cpfkk").css("opacity", "0.8");
                                    alert("Achou CPF no banco de dados");
                                    alert("Dado retornado " + data.testInfo.firstname + " " + data.testInfo.lastname + " " + data.testInfo.CPF);

                                }
                                // Usuário inexistente
                                else {
                                    //$("input#txt_cpfkk").css("background-color", "#EEB4B4");
                                    //$("input#txt_cpfkk").css("opacity", "0.8");
                                    alert("Não achou CPF no banco de dados");
                                }
                            },
                            //If there was no resonse from the server
                            error: function (jqXHR, textStatus, errorThrown) {
                                alert("Error");
                                alert("Error: " + textStatus);
                                console.log("Algo ruim aconteceu: " + textStatus);
                            },
                            //capture the request before it was sent to server
                            beforeSend: function (jqXHR, settings) {
                                //adding some Dummy data to the request
                                settings.data += "&dummyData=whatever";
                                //disable the button until we get the response
                                //$('#myButton').attr("disabled", true);
                                //alert("Teste antes de enviar");
                            },
                            //this is called after the response or error functions are finsihed
                            //so that we can take some action
                            complete: function (jqXHR, textStatus) {
                                //enable the button 
                                //$('#myButton').attr("disabled", false);
                                //alert("Teste depois de enviar");
                            }

                        });
                    });
                });

            </script>


        </footer>
        <script>


            /* andamento do menu de passos*/
            function transicaoTipoDados() {
                var passoAnterior = document.getElementById("tipoConta");
                var passoDados = document.getElementById("dados");
                passoAnterior.className = "passoNaoSelecionado";
                passoDados.className = "passoSelecionado";
            }

            function transicaoDadosTipo() {
                var passoAnterior = document.getElementById("dados");
                var passoTipo = document.getElementById("tipoConta");
                passoAnterior.className = "passoNaoSelecionado";
                passoTipo.className = "passoSelecionado";
            }


            /* altera conteudo do texto explicativo*/
            function mudarTextoColaborador() {
                var tipoConta = document.getElementById("tipoContaTexto");
                var text = tipoConta.textContent;
                tipoConta.textContent = "Você escolheu fazer seu cadastro como Colaborador. Preencha os campos com seus dados para finalizar o cadastro.";
            }

            function mudarTextoEmpreendedor() {
                var tipoConta = document.getElementById("tipoContaTexto");
                var text = tipoConta.textContent;
                tipoConta.textContent = "Você escolheu fazer seu cadastro como Empreendedor. Escolha entre cadastrar como pessoa física ou jurídica preencha os campos com seus dados para finalizar o cadastro.";
            }

            function mudarTextoPadrao() {
                var tipoConta = document.getElementById("tipoContaTexto");
                var text = tipoConta.textContent;
                tipoConta.textContent = "Escolha o tipo de conta que mais se adequa às suas necessidades";
            }

            /* Mostra formulario do colaborador*/
            function showColaborador() {
                mudaCssPadraoEmpreendedor();
                mudarTextoColaborador();
                transicaoTipoDados();
                var form = document.getElementById("formularioColaborador");
                document.getElementById("divEmpreendedor").style.display = "none";
                if (form.style.display == "" || form.style.display == "none") {
                    form.style.display = "inline-table";
                    mudaCssColaborador();
                }
                else {
                    mudaCssPadraoColaborador()
                    mudarTextoPadrao();
                    transicaoDadosTipo();
                    form.style.display = "none";
                }
            }

            /* Mostra formulario do empreendedor*/
            function showEmpreendedor() {
                mudaCssPadraoColaborador();
                mudarTextoEmpreendedor();
                transicaoTipoDados();
                var form = document.getElementById("divEmpreendedor");
                document.getElementById("formularioColaborador").style.display = "none";
                if (form.style.display == "" || form.style.display == "none") {
                    form.style.display = "block";
                    mudaCssEmpreendedor();

                }
                else {
                    mudarTextoPadrao();
                    transicaoDadosTipo();
                    mudaCssPadraoEmpreendedor();
                    form.style.display = "none";

                }
            }

            function mudaCssPadraoColaborador() {
                $("#ColaboradorDIV").css("background-color", "#DCEB94"); // fique verde
                $("#imgColaborador").attr('src', 'images/ico-screen-cadastro.png');
                $("#txtBotao1").css('color', 'rgb(139,163,23)');
            }

            function mudaCssPadraoEmpreendedor() {
                $("#EmpreendedorDIV").css("background-color", "#DCEB94"); // fique verde
                $("#imgEmpreendedor").attr('src', 'images/ico-screen-cadastro-empreendedor.png')
                $("#txtBotao2").css('color', 'rgb(139,163,23)');
            }

            function mudaCssColaborador() {
                $("#ColaboradorDIV").css("background-color", "#F3EA2C"); // fique amarelo
                $("#imgColaborador").attr('src', 'images/ico-screen-cadastro-colaborador-on.png');
                $("#txtBotao1").css('color', 'rgb(197,189,28)');
            }

            function mudaCssEmpreendedor() {
                $("#EmpreendedorDIV").css("background-color", "#F3EA2C"); //fique amarelo	
                $("#imgEmpreendedor").attr('src', 'images/ico-screen-cadastro-empreendedor-on.png');
                $("#txtBotao2").css('color', 'rgb(197,189,28)');
            }
            /* Alteracoes de CSS para botoes selecionados ou nao 
             
             function mudaCssPadraoColaborador(){
             $("#ColaboradorBTN").css("background-color","#DCEB94"); // fique verde
             $(".leftImage1").css("background-image", "url(images/ico-screen-cadastro.png)");
             $(".button1Txt").css('color','rgb(139,163,23)');
             }
             
             function mudaCssPadraoEmpreendedor(){
             $("#EmpreendedorBTN").css("background-color","#DCEB94"); // fique verde
             $(".leftImage2").css("background-image", "url(images/ico-screen-cadastro-empreendedor.png)");
             $(".button2Txt").css('color','rgb(139,163,23)');
             }
             
             function mudaCssColaborador(){
             $("#ColaboradorBTN").css("background-color", "#F3EA2C"); // fique amarelo
             $(".leftImage1").css("background-image", "url(images/ico-screen-cadastro-colaborador-on.png)");
             $(".button1Txt").css('color','rgb(197,189,28)');	
             }
             
             function mudaCssEmpreendedor(){
             $("#EmpreendedorBTN").css("background-color", "#F3EA2C"); //fique amarelo
             $(".leftImage2").css("background-image", "url(images/ico-screen-cadastro-empreendedor-on.png)");
             $(".button2Txt").css('color','rgb(197,189,28)');	
             }
             */

            /* Transicao apos preenchimento do formulario*/
            function transicaoDadosSucesso() {
                var passoAnterior = document.getElementById("dados");
                var passoConclusao = document.getElementById("conclusao");
                passoAnterior.className = "passoNaoSelecionado";
                passoConclusao.className = "passoSelecionado";
                document.getElementById("formularioCadastro").style.display = "none";
                document.getElementById("buttons").style.display = "none";
                document.getElementById("tipoContaTexto").style.display = "none";
                document.getElementById("sucesso").style.display = "block";
            }

            /* Mudanca de acordo com o checkBox Selecionado */

            $(document).ready(function () {
                $('input[type=radio]').click(function () {
                    if (this.id == "pfBox") {
                        showFormEmpreendedorPJ();
                    }
                    if (this.id == "pjBox") {
                        showFormEmpreendedorPF();
                    }
                });
            });


            function showFormEmpreendedorPJ() {
                document.getElementById("formularioEmpreendedorPJ").style.display = 'none';
                document.getElementById("formularioEmpreendedorPF").style.display = 'inline-table';
            }

            function showFormEmpreendedorPF() {
                document.getElementById("formularioEmpreendedorPF").style.display = 'none';
                document.getElementById("formularioEmpreendedorPJ").style.display = 'inline-table';

            }

            /* Evita que ao clicar em submit a pagina atualize 
             
             $('#formularioEmpreendedorPF').submit(function () {
             //Manipulacao dos dados e cadastramento deve vir aqui.
             return false;
             });
             
             $('#formularioColaborador').submit(function () {
             //Manipulacao dos dados e cadastramento deve vir aqui.
             return false;
             });
             
             $('#formularioEmpreendedorPJ').submit(function () {
             //Manipulacao dos dados e cadastramento deve vir aqui.
             return false;
             });
             */

        </script>
        <!---------- /RodapÃ© ------------------>
        <!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
 <script src="layer/jquery-1.5.2.min.js"></script> 
 <script src="layer/jquery.maskedinput-1.3.min.js"></script>-->
        <script src="js/jquery.mask.min.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $("select").change(function () {
                    $("select option:selected").each(function () {
                        if ($(this).attr("value") == "Colaborador") {
                            $(".xabox").hide();
                            $(".Colaborador").show();
                            $(".zabox").hide();
                        }
                        if ($(this).attr("value") == "Empreendedor") {
                            $(".xabox").hide();
                            $(".Empreendedor").show();
                            $(".zabox").hide();
                        }
                        if ($(this).attr("value") == "-1") {
                            $(".xabox").hide();
                            $(".zabox").show();
                        }
                    });
                }).change();
            });
            $(document).ready(function () {
                $('input[type="radio"]').click(function () {
                    if ($(this).attr("value") == "Pessoa Física") {
                        $(".cbox").hide();
                        $(".pf").show();
                        $(".pj").hide();
                    }
                    if ($(this).attr("value") == "Pessoa Jurídica") {
                        $(".cbox").hide();
                        $(".pj").show();
                        $(".pf").hide();
                    }
                });
            });

            function validarSenha(form) {
                senha = document.form.oSenha.value
                senhaRepetida = document.form.oSenhaRepeticao.value
                if (senha != senhaRepetida) {
                    $("#o-senha-repeticao").css("background-color", "#EEB4B4");
                    $("#o-senha-repeticao").css("opacity", "0.8");
                    alert("Repita a senha corretamente");
                    return false;
                }
            }

            function IsEmail(email) {
                var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                return regex.test(email);
            }

            // Retorno 0 = Válido
            // Retorno 1 = Vazio
            // Retorno 2 = Possui letra
            // Retorno 3 = Inválido
            // 
            function validaCPF(objTextBox) {
                var pComponente = objTextBox;
                CPF = pComponente.value.toString();

                if (CPF.length == 0)
                    return 1;
                if (!CPF) {
                    return 3;
                }

                cpfv = CPF;

                //if (cpfv.length == 14 || cpfv.length == 11) {
                if (cpfv.length == 14) {
                    cpfv = cpfv.replace('.', '');
                    cpfv = cpfv.replace('.', '');
                    cpfv = cpfv.replace('-', '');

                    var nonNumbers = /\D/;

                    if (nonNumbers.test(cpfv)) {
                        return 2;
                    } else {
                        if (cpfv == "00000000000" ||
                                cpfv == "11111111111" ||
                                cpfv == "22222222222" ||
                                cpfv == "33333333333" ||
                                cpfv == "44444444444" ||
                                cpfv == "55555555555" ||
                                cpfv == "66666666666" ||
                                cpfv == "77777777777" ||
                                cpfv == "88888888888" ||
                                cpfv == "99999999999") {
                            return 3;
                        }
                        var a = [];
                        var b = new Number;
                        var c = 11;

                        for (i = 0; i < 11; i++) {
                            a[i] = cpfv.charAt(i);
                            if (i < 9)
                                b += (a[i] * --c);
                        }
                        if ((x = b % 11) < 2) {
                            a[9] = 0;
                        } else {
                            a[9] = 11 - x;
                        }
                        b = 0;
                        c = 11;
                        for (y = 0; y < 10; y++)
                            b += (a[y] * c--);

                        if ((x = b % 11) < 2) {
                            a[10] = 0;
                        } else {
                            a[10] = 11 - x;
                        }
                        if ((cpfv.charAt(9) != a[9]) || (cpfv.charAt(10) != a[10])) {
                            return 3;
                        }
                    }

                } else {
                    if (cpfv.length == 0) { //SE NADA FOR PREENCHIDO
                        return 1;
                    } else {
                        return 3;
                    }
                }
                return 0;
            }

            // Retorno 0 = Válido
            // Retorno 1 = Vazio
            // Retorno 2 = Possui letra
            // Retorno 3 = Inválido
            // 
            function validaCNPJ(objTextBox) {

                var pComponente = objTextBox;
                cnpj = pComponente.value.toString();

                cnpj = cnpj.replace(/[^\d]+/g, '');

                if (cnpj == '')
                    return 1;

                if (cnpj.length != 14)
                    return 3;

                // Elimina CNPJs invalidos conhecidos
                if (cnpj == "00000000000000" ||
                        cnpj == "11111111111111" ||
                        cnpj == "22222222222222" ||
                        cnpj == "33333333333333" ||
                        cnpj == "44444444444444" ||
                        cnpj == "55555555555555" ||
                        cnpj == "66666666666666" ||
                        cnpj == "77777777777777" ||
                        cnpj == "88888888888888" ||
                        cnpj == "99999999999999")
                    return 3;

                // Valida DVs
                tamanho = cnpj.length - 2
                numeros = cnpj.substring(0, tamanho);
                digitos = cnpj.substring(tamanho);
                soma = 0;
                pos = tamanho - 7;
                for (i = tamanho; i >= 1; i--) {
                    soma += numeros.charAt(tamanho - i) * pos--;
                    if (pos < 2)
                        pos = 9;
                }
                resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
                if (resultado != digitos.charAt(0))
                    return 3;

                tamanho = tamanho + 1;
                numeros = cnpj.substring(0, tamanho);
                soma = 0;
                pos = tamanho - 7;
                for (i = tamanho; i >= 1; i--) {
                    soma += numeros.charAt(tamanho - i) * pos--;
                    if (pos < 2)
                        pos = 9;
                }
                resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
                if (resultado != digitos.charAt(1))
                    return 3;

                return 0;
            }


            ////////////////////////
            // Colaborador Físico
            ////////////////////////
            $("#txt_cpf").focusin(function () {
                $(this).css("background-color", "white");
                $(this).css("opacity", "1.0");
            });

            $("#txt_cpf").focusout(function () {
                //validador = false;		
                var textField = $(this).val().toString();

                // Retorno 0 = Válido
                // Retorno 1 = Vazio
                // Retorno 2 = Possui letra
                // Retorno 3 = Inválido
                var retornoValidaCPF = validaCPF(this);

                if (retornoValidaCPF == 1)
                {
                    $(this).css("background-color", "#EEB4B4");
                    $(this).css("opacity", "1.0");
                    $(this).tooltip("option", "content", "Informe um CPF para cadastrar");
                } else if (retornoValidaCPF == 2) {
                    $(this).css("background-color", "#EEB4B4");
                    $(this).css("opacity", "0.8");
                    $(this).tooltip("option", "content", "Somentes números neste campo");
                } else if (retornoValidaCPF == 3) {
                    $(this).css("background-color", "#EEB4B4");
                    $(this).css("opacity", "0.8");
                    $(this).tooltip("option", "content", "Número de CPF inválido");
                } else if (retornoValidaCPF == 0) {
                    //validador = true;
                    $(this).css("background-color", "white");
                    $(this).css("opacity", "0.8");
                    $(this).tooltip("option", "content", "Número de CPF válido");
                }
            });


            $("#txt_nome_user").focusout(function () {
                //alert($(this).val().toString());	

                /*if(/^[a-z," "]+$/i.test($(this).val().toString()))
                 {
                 $(this).css("background-color", "white");
                 $(this).css("opacity", "0.8");                
                 $(this).tooltip("option", "content", "Válido");
                 }
                 else{
                 $(this).css("background-color", "#EEB4B4");
                 $(this).css("opacity", "0.8");                
                 $(this).tooltip("option", "content", "Somentes letras neste campo");
                 }*/
            });


            $("#txt_email").focusin(function () {
                $(this).css("background-color", "white");
                $(this).css("opacity", "0.8");
                $(this).tooltip("option", "content", "Informe um e-mail para cadastrar");

            });


            $("#txt_email").focusout(function () {
                var ehemail = IsEmail($(this).val().toString());
                if (ehemail) {
                    $(this).css("background-color", "white");
                    $(this).css("opacity", "0.8");
                    $(this).tooltip("option", "content", "E-mail válido");
                } else {
                    $(this).css("background-color", "#EEB4B4");
                    $(this).css("opacity", "0.8");
                    $(this).tooltip("option", "content", "E-mail inválido");
                }

                //return IsEmail();
            });

            $("#txt_email_confirmacao").focusin(function () {
                $(this).css("background-color", "white");
                $(this).css("opacity", "0.8");
                $(this).tooltip("option", "content", "Confirme um e-mail para cadastrar");

            });


            $("#txt_email_confirmacao").keyup(function () {
                var ehemail = IsEmail($(this).val().toString());
                if (ehemail) {
                    $(this).tooltip("option", "content", "E-mail diferente");
                    if ($(this).val().toString() == $("#txt_email").val().toString()) {
                        $(this).css("background-color", "white");
                        $(this).css("opacity", "0.8");
                        $(this).tooltip("option", "content", "E-mail válido");
                    } else {
                        $(this).css("background-color", "#EEB4B4");
                        $(this).css("opacity", "0.8");
                        $(this).tooltip("option", "content", "E-mail diferente");

                    }
                } else {
                    $(this).css("background-color", "#EEB4B4");
                    $(this).css("opacity", "0.8");
                    $(this).tooltip("option", "content", "E-mail inválido");
                }

                //return IsEmail();
            });

            $(function () {
                $("#txt_cpf").tooltip({
                    content: "Informe um CPF para cadastrar",
                });

                $("#txt_nome_user").tooltip({
                    content: "Informe um nome para cadastrar",
                });

                $("#txt_email").tooltip({
                    content: "Informe um e-mail para cadastrar",
                });

                $("#txt_email_confirmacao").tooltip({
                    content: "Confirme um e-mail para cadastrar",
                });

                $("#txt_rg").tooltip({
                    content: "Informe um RG para cadastrar",
                });

                $("#orgaoemissor").tooltip({
                    content: "Informe um orgão emissor para cadastrar",
                });

                $("#txt_telefone_celular").tooltip({
                    content: "Informe um telefone celular para cadastrar",
                });

                $("#txt_telefone").tooltip({
                    content: "Informe um telefone fixo para cadastrar",
                });

                $("#TXT_CEP").tooltip({
                    content: "Informe um CEP para cadastrar",
                });

                $("#TXT_LOGRADOURO").tooltip({
                    content: "Informe um logradouro para cadastrar",
                });

                $("#TXT_NUMERO").tooltip({
                    content: "Informe um número para cadastrar",
                });

                $("#txt_complemento").tooltip({
                    content: "Informe um complemento para cadastrar (opcional)",
                });

                $("#TXT_BAIRRO").tooltip({
                    content: "Informe um bairro para cadastrar",
                });

                $("#TXT_CIDADE").tooltip({
                    content: "Informe uma cidade para cadastrar",
                });

                $("#CBO_UF").tooltip({
                    content: "Informe um estado para cadastrar (Sigla apenas)",
                });

                $("#Senha").tooltip({
                    content: "Informe uma senha para cadastrar",
                });

                $("#repSenha").tooltip({
                    content: "Repita a senha para cadastrar",
                });
            });

            ////////////////////////
            // Empreendedor Jurídico
            ////////////////////////

            $("#txt_cnpj").focusin(function () {
                $(this).css("background-color", "white");
                $(this).css("opacity", "1.0");
            });

            $("#txt_cnpj").focusout(function () {
                //validador = false;		
                var textField = $(this).val().toString();

                // Retorno 0 = Válido
                // Retorno 1 = Vazio
                // Retorno 2 = Possui letra
                // Retorno 3 = Inválido
                var retornoValidaCNPJ = validaCNPJ(this);

                if (retornoValidaCNPJ == 1)
                {
                    $(this).css("background-color", "#EEB4B4");
                    $(this).css("opacity", "1.0");
                    $(this).tooltip("option", "content", "Informe um CNPJ para cadastrar");
                } else if (retornoValidaCNPJ == 2) {
                    $(this).css("background-color", "#EEB4B4");
                    $(this).css("opacity", "0.8");
                    $(this).tooltip("option", "content", "Somentes números neste campo");
                } else if (retornoValidaCNPJ == 3) {
                    $(this).css("background-color", "#EEB4B4");
                    $(this).css("opacity", "0.8");
                    $(this).tooltip("option", "content", "Número de CNPJ inválido");
                } else if (retornoValidaCNPJ == 0) {
                    //validador = true;
                    $(this).css("background-color", "white");
                    $(this).css("opacity", "0.8");
                    $(this).tooltip("option", "content", "Número de CNPJ válido");
                }
            });


            $("#NomeRazaoSocial").focusout(function () {
                //alert($(this).val().toString());	

                /*if(/^[a-z," "]+$/i.test($(this).val().toString()))
                 {
                 $(this).css("background-color", "white");
                 $(this).css("opacity", "0.8");                
                 $(this).tooltip("option", "content", "Válido");
                 }
                 else{
                 $(this).css("background-color", "#EEB4B4");
                 $(this).css("opacity", "0.8");                
                 $(this).tooltip("option", "content", "Somentes letras neste campo");
                 }*/
            });

            $("#txt_email_E").focusin(function () {
                $(this).css("background-color", "white");
                $(this).css("opacity", "0.8");
                $(this).tooltip("option", "content", "Informe um e-mail para cadastrar");

            });


            $("#txt_email_E").focusout(function () {
                var ehemail = IsEmail($(this).val().toString());
                if (ehemail) {
                    $(this).css("background-color", "white");
                    $(this).css("opacity", "0.8");
                    $(this).tooltip("option", "content", "E-mail válido");
                } else {
                    $(this).css("background-color", "#EEB4B4");
                    $(this).css("opacity", "0.8");
                    $(this).tooltip("option", "content", "E-mail inválido");
                }

                //return IsEmail();
            });

            $("#txt_email_E_confirmacao").focusin(function () {
                $(this).css("background-color", "white");
                $(this).css("opacity", "0.8");
                $(this).tooltip("option", "content", "Confirme um e-mail para cadastrar");

            });


            $("#txt_email_E_confirmacao").focusout(function () {
                var ehemail = IsEmail($(this).val().toString());
                if (ehemail) {
                    if ($(this).val().toString() == $("#txt_email_E").val().toString()) {
                        $(this).css("background-color", "white");
                        $(this).css("opacity", "0.8");
                        $(this).tooltip("option", "content", "E-mail válido");
                    } else {
                        $(this).css("background-color", "#EEB4B4");
                        $(this).css("opacity", "0.8");
                        $(this).tooltip("option", "content", "E-mail diferente");
                    }
                } else {
                    $(this).css("background-color", "#EEB4B4");
                    $(this).css("opacity", "0.8");
                    $(this).tooltip("option", "content", "E-mail inválido");
                }

                //return IsEmail();
            });

            $(function () {
                $("#NomeRazaoSocial").tooltip({
                    content: "Informe uma razão social para cadastrar",
                });

                $("#txt_cnpj").tooltip({
                    content: "Informe um CNPJ para cadastrar",
                });

                $("#rg-inscricao").tooltip({
                    content: "Informe uma Inscrição Estadual para cadastrar",
                });

                $("#txt_email_E").tooltip({
                    content: "Informe um e-mail para cadastrar",
                });

                $("#txt_email_E_confirmacao").tooltip({
                    content: "Confirme um e-mail para cadastrar",
                });

                $("#txt_telefone_celular_E").tooltip({
                    content: "Informe um telefone celular para cadastrar",
                });

                $("#txt_telefone_E").tooltip({
                    content: "Informe um telefone fixo para cadastrar",
                });

                $("#TXT_CEP_E").tooltip({
                    content: "Informe um CEP para cadastrar",
                });

                $("#TXT_LOGRADOURO_E").tooltip({
                    content: "Informe um logradouro para cadastrar",
                });

                $("#TXT_NUMERO_E").tooltip({
                    content: "Informe um número para cadastrar",
                });

                $("#txt_complemento_E").tooltip({
                    content: "Informe um complemento para cadastrar (opcional)",
                });

                $("#TXT_BAIRRO_E").tooltip({
                    content: "Informe um bairro para cadastrar",
                });

                $("#TXT_CIDADE_E").tooltip({
                    content: "Informe uma cidade para cadastrar",
                });

                $("#CBO_UF_E").tooltip({
                    content: "Informe um estado para cadastrar (Sigla apenas)",
                });

                $("#Senha_E").tooltip({
                    content: "Informe uma senha para cadastrar",
                });

                $("#repSenha_E").tooltip({
                    content: "Repita a senha para cadastrar",
                });
            });

            ////////////////////////
            // Empreendedor Físico
            ////////////////////////
            $("#txt_cpf_EF").focusin(function () {
                $(this).css("background-color", "white");
                $(this).css("opacity", "1.0");
            });

            $("#txt_cpf_EF").focusout(function () {
                //validador = false;		
                var textField = $(this).val().toString();

                // Retorno 0 = Válido
                // Retorno 1 = Vazio
                // Retorno 2 = Possui letra
                // Retorno 3 = Inválido
                var retornoValidaCPF = validaCPF(this);

                if (retornoValidaCPF == 1)
                {
                    $(this).css("background-color", "#EEB4B4");
                    $(this).css("opacity", "1.0");
                    $(this).tooltip("option", "content", "Informe um CPF para cadastrar");
                } else if (retornoValidaCPF == 2) {
                    $(this).css("background-color", "#EEB4B4");
                    $(this).css("opacity", "0.8");
                    $(this).tooltip("option", "content", "Somentes números neste campo");
                } else if (retornoValidaCPF == 3) {
                    $(this).css("background-color", "#EEB4B4");
                    $(this).css("opacity", "0.8");
                    $(this).tooltip("option", "content", "Número de CPF inválido");
                } else if (retornoValidaCPF == 0) {
                    //validador = true;
                    $(this).css("background-color", "white");
                    $(this).css("opacity", "0.8");
                    $(this).tooltip("option", "content", "Número de CPF válido");
                }
            });


            $("#txt_nome_user_EF").focusout(function () {
                //alert($(this).val().toString());	

                /*if(/^[a-z," "]+$/i.test($(this).val().toString()))
                 {
                 $(this).css("background-color", "white");
                 $(this).css("opacity", "0.8");                
                 $(this).tooltip("option", "content", "Válido");
                 }
                 else{
                 $(this).css("background-color", "#EEB4B4");
                 $(this).css("opacity", "0.8");                
                 $(this).tooltip("option", "content", "Somentes letras neste campo");
                 }*/
            });

            $("#txt_email_EF").focusin(function () {
                $(this).css("background-color", "white");
                $(this).css("opacity", "0.8");
                $(this).tooltip("option", "content", "Informe um e-mail para cadastrar");

            });


            $("#txt_email_EF").focusout(function () {
                var ehemail = IsEmail($(this).val().toString());
                if (ehemail) {
                    $(this).css("background-color", "white");
                    $(this).css("opacity", "0.8");
                    $(this).tooltip("option", "content", "E-mail válido");
                } else {
                    $(this).css("background-color", "#EEB4B4");
                    $(this).css("opacity", "0.8");
                    $(this).tooltip("option", "content", "E-mail inválido");
                }

                //return IsEmail();
            });

            $("#txt_email_EF_confirmacao").focusin(function () {
                $(this).css("background-color", "white");
                $(this).css("opacity", "0.8");
                $(this).tooltip("option", "content", "Confirme um e-mail para cadastrar");

            });


            $("#txt_email_EF_confirmacao").keyup(function () {
                var ehemail = IsEmail($(this).val().toString());
                if (ehemail) {
                    $(this).tooltip("option", "content", "E-mail diferente");
                    if ($(this).val().toString() == $("#txt_email_EF").val().toString()) {
                        $(this).css("background-color", "white");
                        $(this).css("opacity", "0.8");
                        $(this).tooltip("option", "content", "E-mail válido");
                    } else {
                        $(this).css("background-color", "#EEB4B4");
                        $(this).css("opacity", "0.8");
                        $(this).tooltip("option", "content", "E-mail diferente");

                    }
                } else {
                    $(this).css("background-color", "#EEB4B4");
                    $(this).css("opacity", "0.8");
                    $(this).tooltip("option", "content", "E-mail inválido");
                }

                //return IsEmail();
            });

            $(function () {
                $("#txt_cpf_EF").tooltip({
                    content: "Informe um CPF para cadastrar",
                });

                $("#txt_nome_user_EF").tooltip({
                    content: "Informe um nome para cadastrar",
                });

                $("#txt_email_EF").tooltip({
                    content: "Informe um e-mail para cadastrar",
                });

                $("#txt_email_EF_confirmacao").tooltip({
                    content: "Confirme um e-mail para cadastrar",
                });

                $("#txt_rg_EF").tooltip({
                    content: "Informe um RG para cadastrar",
                });

                $("#orgaoemissor_EF").tooltip({
                    content: "Informe um orgão emissor para cadastrar",
                });

                $("#txt_telefone_celular_EF").tooltip({
                    content: "Informe um telefone celular para cadastrar",
                });

                $("#txt_telefone_EF").tooltip({
                    content: "Informe um telefone fixo para cadastrar",
                });

                $("#TXT_CEP_EF").tooltip({
                    content: "Informe um CEP para cadastrar",
                });

                $("#TXT_LOGRADOURO_EF").tooltip({
                    content: "Informe um logradouro para cadastrar",
                });

                $("#TXT_NUMERO_EF").tooltip({
                    content: "Informe um número para cadastrar",
                });

                $("#txt_complemento_EF").tooltip({
                    content: "Informe um complemento para cadastrar (opcional)",
                });

                $("#TXT_BAIRRO_EF").tooltip({
                    content: "Informe um bairro para cadastrar",
                });

                $("#TXT_CIDADE_EF").tooltip({
                    content: "Informe uma cidade para cadastrar",
                });

                $("#CBO_UF_EF").tooltip({
                    content: "Informe um estado para cadastrar (Sigla apenas)",
                });

                $("#Senha_EF").tooltip({
                    content: "Informe uma senha para cadastrar",
                });

                $("#repSenha_EF").tooltip({
                    content: "Repita a senha para cadastrar",
                });
            });

        </script>



        <!-- 
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
        <script src="layer/jquery-1.5.2.min.js"></script>
        <script src="layer/jquery.maskedinput-1.3.min.js"></script> -->


        <script type="text/javascript">
            // Função única que fará a transação
            function getEndereco() {
                /* 
                 Para conectar no serviço e executar o json, precisamos usar a função
                 getScript do jQuery, o getScript e o dataType:"jsonp" conseguem fazer o cross-domain, os outros
                 dataTypes não possibilitam esta interação entre domínios diferentes
                 Estou chamando a url do serviço passando o parâmetro "formato=javascript" e o CEP digitado no formulário
                 http://cep.republicavirtual.com.br/web_cep.php?formato=javascript&cep="+$("#cep").val()
                 */
                // Se o campo CEP não estiver vazio
                if ($.trim($("#TXT_CEP").val()) != "") {
                    $.getScript("http://cep.republicavirtual.com.br/web_cep.php?formato=javascript&cep=" + $("#TXT_CEP").val(), function () {
                        // o getScript dá um eval no script, então é só ler!                 //Se o resultado for igual a 1
                        if (resultadoCEP["resultado"]) {
                            // troca o valor dos elementos
                            $("#TXT_LOGRADOURO").val(unescape(resultadoCEP["tipo_logradouro"]) + ": " + unescape(resultadoCEP["logradouro"]));
                            $("#TXT_BAIRRO").val(unescape(resultadoCEP["bairro"]));
                            $("#TXT_CIDADE").val(unescape(resultadoCEP["cidade"]));
                            $("#CBO_UF").val(unescape(resultadoCEP["uf"]));
                        } else {
                            alert("Endereço não encontrado");
                        }
                    });
                }
                if ($.trim($("#TXT_CEP_E").val()) != "") {
                    $.getScript("http://cep.republicavirtual.com.br/web_cep.php?formato=javascript&cep=" + $("#TXT_CEP_E").val(), function () {
                        // o getScript dá um eval no script, então é só ler!                 //Se o resultado for igual a 1
                        if (resultadoCEP["resultado"]) {
                            // troca o valor dos elementos
                            $("#TXT_LOGRADOURO_E").val(unescape(resultadoCEP["tipo_logradouro"]) + ": " + unescape(resultadoCEP["logradouro"]));
                            $("#TXT_BAIRRO_E").val(unescape(resultadoCEP["bairro"]));
                            $("#TXT_CIDADE_E").val(unescape(resultadoCEP["cidade"]));
                            $("#CBO_UF_E").val(unescape(resultadoCEP["uf"]));
                        } else {
                            alert("Endereço não encontrado");
                        }
                    });
                }
                if ($.trim($("#TXT_CEP_EF").val()) != "") {
                    $.getScript("http://cep.republicavirtual.com.br/web_cep.php?formato=javascript&cep=" + $("#TXT_CEP_EF").val(), function () {
                        // o getScript dá um eval no script, então é só ler!                 //Se o resultado for igual a 1
                        if (resultadoCEP["resultado"]) {
                            // troca o valor dos elementos
                            $("#TXT_LOGRADOURO_EF").val(unescape(resultadoCEP["tipo_logradouro"]) + ": " + unescape(resultadoCEP["logradouro"]));
                            $("#TXT_BAIRRO_EF").val(unescape(resultadoCEP["bairro"]));
                            $("#TXT_CIDADE_EF").val(unescape(resultadoCEP["cidade"]));
                            $("#CBO_UF_EF").val(unescape(resultadoCEP["uf"]));
                        } else {
                            alert("Endereço não encontrado");
                        }
                    });
                }
            }


            function numeros() {
                if (event.keyCode < 48 || event.keyCode > 57) {
                    return false;
                }
            }



            /*jQuery(function ($) {
             $("#txt_telefone").mask("(99) 9999-9999");
             $("#txt_telefone_celular").mask("(99) 9999-9999");
             $("#txt_telefone_E").mask("(99) 9999-9999");
             $("#txt_telefone_celular_E").mask("(99) 9999-9999");
             $("#txt_cpf").mask("999.999.999-99");
             $("#txt_cpf_E").mask("999.999.999-99");
             $("#txt_cnpj").mask("99.999.999/9999-99");
             $("#TXT_CEP_E").mask("99.999-999");
             $("#TXT_CEP_EF").mask("99.999-999");
             $("#TXT_CEP").mask("99.999-999");
             });*/

            /*$(function() {
             $('#myTextBox').keyup(function() {
             $(this).val($(this).val().toUpperCase());
             });
             });*/

            //Todas as máscaras dos campos de cadastros
            $(document).ready(function () {

                var SPMaskBehavior = function (val) {
                    return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
                },
                        spOptions = {
                            onKeyPress: function (val, e, field, options) {
                                field.mask(SPMaskBehavior.apply({}, arguments), options);
                            }
                        };

                ////////////////////////
                // Colaborador Físico
                ////////////////////////
                $('#txt_nome_user').mask('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS',
                        {'translation': {S: {pattern: /[A-Za-z" "áéíóúâêîôûäëïöüçãõàèìòùÁÉÍÓÚÂÊÎÔÛÄËÏÖÜÇÃÕÀÈÌÒÙ-]/}}});
                $('#txt_cpf').mask("000.000.000-00");
                $("#txt_email").mask('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS',
                        {'translation': {S: {pattern: /[A-Za-z0-9@._!#$%&'*+-=?^_`{|}~áéíóúâêîôûäëïöüçãõàèìòùÁÉÍÓÚÂÊÎÔÛÄËÏÖÜÇÃÕÀÈÌÒÙ-]/}}});
                $("#txt_email_confirmacao").mask('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS',
                        {'translation': {S: {pattern: /[A-Za-z0-9@._!#$%&'*+-=?^_`{|}~áéíóúâêîôûäëïöüçãõàèìòùÁÉÍÓÚÂÊÎÔÛÄËÏÖÜÇÃÕÀÈÌÒÙ-]/}}});
                $('#txt_rg').mask('SSSSSSSSSSSSSSS',
                        {'translation': {S: {pattern: /[A-Za-z0-9" "áéíóúâêîôûäëïöüçãõàèìòùÁÉÍÓÚÂÊÎÔÛÄËÏÖÜÇÃÕÀÈÌÒÙ-]/}}});
                $("#orgaoemissor").mask('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSS',
                        {'translation': {S: {pattern: /[A-Za-z0-9" "áéíóúâêîôûäëïöüçãõàèìòùÁÉÍÓÚÂÊÎÔÛÄËÏÖÜÇÃÕÀÈÌÒÙ-]/}}});
                $('#txt_telefone_celular').mask(SPMaskBehavior, spOptions);
                $("#txt_telefone").mask("(00) 0000-0000");
                $("#TXT_CEP").mask("00.000-000");
                $("#TXT_LOGRADOURO").mask('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS',
                        {'translation': {S: {pattern: /[A-Za-z0-9" "áéíóúâêîôûäëïöüçãõàèìòùÁÉÍÓÚÂÊÎÔÛÄËÏÖÜÇÃÕÀÈÌÒÙ-]/}}});
                $("#TXT_NUMERO").mask("0000000000");
                $("#txt_complemento").mask('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSS',
                        {'translation': {S: {pattern: /[A-Za-z0-9" "áéíóúâêîôûäëïöüçãõàèìòùÁÉÍÓÚÂÊÎÔÛÄËÏÖÜÇÃÕÀÈÌÒÙ-]/}}});
                $("#TXT_BAIRRO").mask('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSS',
                        {'translation': {S: {pattern: /[A-Za-z0-9" "áéíóúâêîôûäëïöüçãõàèìòùÁÉÍÓÚÂÊÎÔÛÄËÏÖÜÇÃÕÀÈÌÒÙ-]/}}});
                $("#TXT_CIDADE").mask('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSS',
                        {'translation': {S: {pattern: /[A-Za-z" "áéíóúâêîôûäëïöüçãõàèìòùÁÉÍÓÚÂÊÎÔÛÄËÏÖÜÇÃÕÀÈÌÒÙ-]/}}});
                // A conversão da UF para maiscula está sendo feita na própria chamada do input
                $("#CBO_UF").mask('SS',
                        {'translation': {S: {pattern: /[A-Za-z]/}}});

                ////////////////////////
                // Empreendedor Juridico
                ////////////////////////
                $('#NomeRazaoSocial').mask('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS',
                        {'translation': {S: {pattern: /[A-Za-z" "áéíóúâêîôûäëïöüçãõàèìòùÁÉÍÓÚÂÊÎÔÛÄËÏÖÜÇÃÕÀÈÌÒÙ-]/}}});
                $("#txt_cnpj").mask("00.000.000/0000-00");
                $("#txt_email_E").mask('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS',
                        {'translation': {S: {pattern: /[A-Za-z0-9@._!#$%&'*+-=?^_`{|}~áéíóúâêîôûäëïöüçãõàèìòùÁÉÍÓÚÂÊÎÔÛÄËÏÖÜÇÃÕÀÈÌÒÙ-]/}}});
                $("#txt_email_E_confirmacao").mask('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS',
                        {'translation': {S: {pattern: /[A-Za-z0-9@._!#$%&'*+-=?^_`{|}~áéíóúâêîôûäëïöüçãõàèìòùÁÉÍÓÚÂÊÎÔÛÄËÏÖÜÇÃÕÀÈÌÒÙ-]/}}});
                $('#rg-inscricao').mask('SSSSSSSSSSSSSSS',
                        {'translation': {S: {pattern: /[A-Za-z0-9" "áéíóúâêîôûäëïöüçãõàèìòùÁÉÍÓÚÂÊÎÔÛÄËÏÖÜÇÃÕÀÈÌÒÙ-]/}}});
                $("#TXT_CEP_E").mask("00.000-000");
                $("#TXT_LOGRADOURO_E").mask('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS',
                        {'translation': {S: {pattern: /[A-Za-z0-9" "áéíóúâêîôûäëïöüçãõàèìòùÁÉÍÓÚÂÊÎÔÛÄËÏÖÜÇÃÕÀÈÌÒÙ-]/}}});
                $("#TXT_NUMERO_E").mask("0000000000");
                $("#txt_complemento_E").mask('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSS',
                        {'translation': {S: {pattern: /[A-Za-z0-9" "áéíóúâêîôûäëïöüçãõàèìòùÁÉÍÓÚÂÊÎÔÛÄËÏÖÜÇÃÕÀÈÌÒÙ-]/}}});
                $("#TXT_BAIRRO_E").mask('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSS',
                        {'translation': {S: {pattern: /[A-Za-z0-9" "áéíóúâêîôûäëïöüçãõàèìòùÁÉÍÓÚÂÊÎÔÛÄËÏÖÜÇÃÕÀÈÌÒÙ-]/}}});
                $("#TXT_CIDADE_E").mask('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSS',
                        {'translation': {S: {pattern: /[A-Za-z" "áéíóúâêîôûäëïöüçãõàèìòùÁÉÍÓÚÂÊÎÔÛÄËÏÖÜÇÃÕÀÈÌÒÙ-]/}}});
                // A conversão da UF para maiscula está sendo feita na própria chamada do input
                $("#CBO_UF_E").mask('SS',
                        {'translation': {S: {pattern: /[A-Za-z]/}}});
                $("#txt_telefone_E").mask("(00) 0000-0000");
                $('#txt_telefone_celular_E').mask(SPMaskBehavior, spOptions);

                ////////////////////////
                // Empreendedor Físico
                ////////////////////////
                $('#txt_nome_user_EF').mask('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS',
                        {'translation': {S: {pattern: /[A-Za-z" "áéíóúâêîôûäëïöüçãõàèìòùÁÉÍÓÚÂÊÎÔÛÄËÏÖÜÇÃÕÀÈÌÒÙ-]/}}});
                $('#txt_cpf_EF').mask("000.000.000-00");
                $("#txt_email_EF").mask('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS',
                        {'translation': {S: {pattern: /[A-Za-z0-9@._!#$%&'*+-=?^_`{|}~áéíóúâêîôûäëïöüçãõàèìòùÁÉÍÓÚÂÊÎÔÛÄËÏÖÜÇÃÕÀÈÌÒÙ-]/}}});
                $("#txt_email_EF_confirmacao").mask('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS',
                        {'translation': {S: {pattern: /[A-Za-z0-9@._!#$%&'*+-=?^_`{|}~áéíóúâêîôûäëïöüçãõàèìòùÁÉÍÓÚÂÊÎÔÛÄËÏÖÜÇÃÕÀÈÌÒÙ-]/}}});
                $('#txt_rg_EF').mask('SSSSSSSSSSSSSSS',
                        {'translation': {S: {pattern: /[A-Za-z0-9" "áéíóúâêîôûäëïöüçãõàèìòùÁÉÍÓÚÂÊÎÔÛÄËÏÖÜÇÃÕÀÈÌÒÙ-]/}}});
                $("#orgaoemissor_EF").mask('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSS',
                        {'translation': {S: {pattern: /[A-Za-z0-9" "áéíóúâêîôûäëïöüçãõàèìòùÁÉÍÓÚÂÊÎÔÛÄËÏÖÜÇÃÕÀÈÌÒÙ-]/}}});
                $('#txt_telefone_celular_EF').mask(SPMaskBehavior, spOptions);
                $("#txt_telefone_EF").mask("(00) 0000-0000");
                $("#TXT_CEP_EF").mask("00.000-000");
                $("#TXT_LOGRADOURO_EF").mask('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS',
                        {'translation': {S: {pattern: /[A-Za-z0-9" "áéíóúâêîôûäëïöüçãõàèìòùÁÉÍÓÚÂÊÎÔÛÄËÏÖÜÇÃÕÀÈÌÒÙ-]/}}});
                $("#TXT_NUMERO_EF").mask("0000000000");
                $("#txt_complemento_EF").mask('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSS',
                        {'translation': {S: {pattern: /[A-Za-z0-9" "áéíóúâêîôûäëïöüçãõàèìòùÁÉÍÓÚÂÊÎÔÛÄËÏÖÜÇÃÕÀÈÌÒÙ-]/}}});
                $("#TXT_BAIRRO_EF").mask('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSS',
                        {'translation': {S: {pattern: /[A-Za-z0-9" "áéíóúâêîôûäëïöüçãõàèìòùÁÉÍÓÚÂÊÎÔÛÄËÏÖÜÇÃÕÀÈÌÒÙ-]/}}});
                $("#TXT_CIDADE_EF").mask('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSS',
                        {'translation': {S: {pattern: /[A-Za-z" "áéíóúâêîôûäëïöüçãõàèìòùÁÉÍÓÚÂÊÎÔÛÄËÏÖÜÇÃÕÀÈÌÒÙ-]/}}});
                // A conversão da UF para maiscula está sendo feita na própria chamada do input
                $("#CBO_UF_EF").mask('SS',
                        {'translation': {S: {pattern: /[A-Za-z]/}}});
            });

        </script>
</body>
</html>