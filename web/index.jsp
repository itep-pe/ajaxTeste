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
                    //make the AJAX request, dataType is set to json
                    //meaning we are expecting JSON data in response from the server
                    $.ajax({
                        type: "POST",
                        url: "adicionarColaboradorController",
                        data: dataString,
                        dataType: "json",
                        //if received a response from the server
                        success: function (data, textStatus, jqXHR) {
                            $("#loader").hide();
                            vetorNomes = new Array();
                            vetorNomes.push(data);
                            //our test code was correct so we have some information to display
                            if (data.success) {
                                $("#ajaxResponse").html("");
                                $("#pessoa").slideUp(1000).fadeIn(200).append("<li TYPE='none' id='pessoa" + data.testInfo.id + "' value='" + data.testInfo.firstname + " " + data.testInfo.lastname + "'>" + data.testInfo.firstname + " " + data.testInfo.lastname + "</li>");
                            }
                            //display error message
                            else {
                                $("#ajaxResponse").html("<div><b>Nome inv�lido!</b></div>");
                            }
                        },
                        //If there was no resonse from the server
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log("Algo ruim aconteceu: " + textStatus);
                            $("#ajaxResponse").html(jqXHR.responseText);
                        },
                        //capture the request before it was sent to server
                        beforeSend: function (jqXHR, settings) {
                            $("#loader").show().delay(10).fadeIn(  ).slideUp(600);
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

        <div>
            <form id="myAjaxRequestForm" >
                <fieldset>
                    <legend>Colaborador Participante</legend>
                    <p>
                        <label for="personCode">Nome:</label>
                        <input id="personCode" type="text" name="personCode" />                  
                    </p>
                    
                    <p>
                        <input id="myButton" type="button" value="Adicionar" />
                    </p>
                </fieldset>
            </form>
        </div>
        <div id="anotherSection">
            <fieldset>
                <legend>Colaboradores Adicionados</legend>
                <div id="ajaxResponse"></div>
                <div>
                    <ul id="pessoa"></ul>
                </div>
            </fieldset>
        </div>
    </body>
</html>