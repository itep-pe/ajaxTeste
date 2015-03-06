<html>
    <head>
        <title>Exemplo Ajax Nome POST</title>

        <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />


        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js" type="text/javascript"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>


        <!-- script type="text/javascript" src="app.js"></script> -->

    </head>
    <body>

        <script>
            $(document).ready(function () {

                //Stops the submit request
                $("#myAjaxRequestForm").submit(function (e) {
                    e.preventDefault();
                });

                //checks for the button click event
                $("#myButton").click(function (e) {

                    //get the form data and then serialize that
                    dataString = $("#myAjaxRequestForm").serialize();

                    //get the form data using another method 
                    var personCode = $("input#personCode").val();
                    dataString = "personCode=" + personCode;

                    //alert(dataString);
                    //make the AJAX request, dataType is set to json
                    //meaning we are expecting JSON data in response from the server
                    $.ajax({
                        type: "POST",
                        url: "testInformation",
                        data: dataString,
                        dataType: "json",
                        //if received a response from the server
                        success: function (data, textStatus, jqXHR) {
                            $("loader").hide();
                            //our test code was correct so we have some information to display
                            if (data.success) {
                                //alert("1");
                                $("#ajaxResponse").html("");
                                //$("#ajaxResponse").append("<b>Country Code:</b> 1");
                                //$("#pessoa").append("<b> Nome:</b> " + data.testInfo.firstname + " " + data.testInfo.lastname + "<br>");

                                $("#pessoa").append("<ul>" + data.testInfo.firstname + " " + data.testInfo.lastname + "</ul>");
                                //$("#ajaxResponse").append("<b>Country Code:</b> 2");
                                /*$("#ajaxResponse").append("<b>Country Code:</b> " + data.countryInfo.code + "
                                 ");
                                 $("#ajaxResponse").append("<b>Country Name:</b> " + data.countryInfo.name + "
                                 ");
                                 $("#ajaxResponse").append("<b>Continent:</b> " + data.countryInfo.continent + "
                                 ");
                                 $("#ajaxResponse").append("<b>Region:</b> " + data.countryInfo.region + "
                                 ");
                                 $("#ajaxResponse").append("<b>Life Expectancy:</b> " + data.countryInfo.lifeExpectancy + "
                                 ");
                                 $("#ajaxResponse").append("<b>GNP:</b> " + data.countryInfo.gnp + "
                                 ");*/
                            }
                            //display error message
                            else {
                                //alert("2");
                                $("#ajaxResponse").html("<div><b>Nome inválido!</b></div>");
                            }
                        },
                        //If there was no resonse from the server
                        error: function (jqXHR, textStatus, errorThrown) {
                            //alert("3");
                            console.log("Algo ruim aconteceu: " + textStatus);
                            $("#ajaxResponse").html(jqXHR.responseText);
                        },
                        //capture the request before it was sent to server
                        beforeSend: function (jqXHR, settings) {
                            $("loader").show();
                            //adding some Dummy data to the request
                            settings.data += "&dummyData=whatever";
                            //disable the button until we get the response
                            $('#myButton').attr("disabled", true);
                        },
                        //this is called after the response or error functions are finsihed
                        //so that we can take some action
                        complete: function (jqXHR, textStatus) {
                            //enable the button 
                            $('#myButton').attr("disabled", false);
                        }

                    });
                });

            });

        </script>

        <form id="myAjaxRequestForm" >
            <fieldset>
                <legend>Formulário de Cadastro</legend>

                <p>
                    <label for="personCode">Nome da Pessoa:</label>

                    <input id="personCode" type="text" name="personCode" />
                    <!--                    <img src="./img/add.jpg" alt="Add" style="vertical-align: middle;"
                                             onclick="selectIngredient($(this).prev().get(0));" />-->
                </p>
                <span id="loader" style="display:none" src="/img/loader.git">carregando...</span>
                <p>
                    <input id="myButton" type="button" value="Adicionar" />
                </p>
            </fieldset>
        </form>
        <div id="anotherSection">
            <fieldset>
                <legend>Reposta de requisição Ajax</legend>
                <div id="ajaxResponse"></div>
                <div id="pessoa" ></div>

            </fieldset>
        </div>   

    </body>
</html>