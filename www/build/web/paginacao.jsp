<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="assets/img/pic4.jpg">

        <script type="text/javascript" src="assets/js/jquery-3.2.1.slim.min.js"></script>
        <script type="text/javascript" src="assets/js/jquery.simplePagination.js"></script>
        <title>CineData: Consulta 2</title>

        <!-- Bootstrap core CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <link href="assets/css/font-awesome.min.css" rel="stylesheet">

    </head>
    <body>
 <script type="text/javascript">
                        $(document).ready(function () {
                            $('#qtd').hide();
                            $('input:radio[name="linguas"]').change(function () {
                                if ($(this).val() == '1') {
                                    $("#qtd").show();
                                } else {
                                    $('#qtd').hide();
                                }
                            });


                            function checkFragment() {
                                // If there's no hash, treat it like page 1.
                                var hash = window.location.hash || "#page-1";
                                // We'll use a regular expression to check the hash string.
                                hash = hash.match(/^#page-(\d+)$/);
                                if (hash) {
                                    // The `selectPage` function is described in the documentation.
                                    // We've captured the page number in a regex group: `(\d+)`.
                                    $(".pagination-page").pagination("selectPage", parseInt(hash[1]));
                                }
                            }
                            ;
                            // We'll call this function whenever back/forward is pressed...
                            $(window).bind("popstate", checkFragment);
                            // ... and we'll also call it when the page has loaded
                            // (which is right now).
                            checkFragment();



                        });

                        // Roda quando a pessoa clica em Gerar!
                        function validar() {
                            if (document.getElementById('apenas_x_linguas').checked) {
                                // VALIDAR ENTRADA ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
                                $("#n_linguas").val($("#x").val());

                            } else if (document.getElementById('todas_as_linguas').checked) {
                                $("#n_linguas").val('1');
                            }

                            // Chama ajax pro servelet /Ranking passando as informações criar=1, e o n_lang
                            $.ajax({
                                type: "GET",
                                url: "Ranking?criar=1&n_lang=" + $("#n_linguas").val(),
                                dataType: "json",
                                success: function (data, textStatus, jqXHR) {
                                    // $('#content').append(");
                                    alert(data);
                                }
                            });
                            // A partir daí vai ser só outros ajaxes para o infinte scrolling.
                        }/*
                         $(".pagination-page").pagination({
                         items: 20,
                         cssStyle: "light-theme",
                         // This is the actual page changing functionality.
                         onPageClick: function (pageNumber) {} 
                         });*/

        </script>
        
         <script src="assets/js/bootstrap.min.js"></script>
    </body>