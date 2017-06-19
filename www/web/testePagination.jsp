<%-- 
    Document   : testePagination
    Created on : Jun 17, 2017, 3:25:21 PM
    Author     : porperyus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link type="text/css" rel="stylesheet" href="assets/css/simplePagination.css"/>
        <script type="text/javascript" src="assets/js/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="assets/js/jquery.simplePagination.js"></script>
        <script>
            jQuery(function ($) {
                $(".pagination-page").pagination({
                    items: 20,
                    cssStyle: "light-theme",

                    // This is the actual page changing functionality.
                    onPageClick: function (pageNumber) {
//                        $.ajax({
//                            type: "GET", 
//                            url: "TestePaginação?pag=" + pageNumber, 
//                            dataType: "html", 
//                            data: {pageNumber},
//                            success: function(data, textStatus, jqXHR) {
//                              $('#tbody').html(data);
//                              alert(data);
//                            }
//                        });                       
//                        
                        /*Aqui entra um AJAX para pegar o conteúdo necessário*/
                        $.get("/TestePaginacao?pag=" + pageNumber, function (data, status) {
                            //alert("Data: " + data + "\nStatus: " + status);
                            document.getElementById('tbody').innerHTML = (data);

                        });
                    }
                });


                // Essa função serve para mudar de página quando o usuário muda a url e não clica no botão
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
        </script>   
    </head>
    <body>
        <h1>Hello World!</h1>

        <div id="content">
            <table>
                <thead>
                    <tr>
                        <td style="text-align: left">Movie Id</td>
                        <td style="text-align: left">Title</td>
                        <td style="text-align: left">Genre</td>
                        <td style="text-align: left">Actor</td> 
                    </tr>
                </thead>
                <tbody name="tbody" id="tbody">
                </tbody>
            </table>
        </div>
        
        <form method="POST" action="ListaGenero">
            
            
            <div class="pagination-holder clearfix">
                <div id="light-pagination" class="pagination-page"></div>
            </div>            
        </form>

    </body>


</html>
