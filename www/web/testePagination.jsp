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
                // Consider adding an ID to your table
                // incase a second table ever enters the picture.
                var items = $("table tbody tr");

                var numItems = items.length;
                var perPage = 2;

                // Only show the first 2 (or first `per_page`) items initially.
                items.slice(perPage).hide();

                // Now setup the pagination using the `.pagination-page` div.
                $(".pagination-page").pagination({
                    items: 20,
                    itemsOnPage: perPage,
                    cssStyle: "light-theme",

                    // This is the actual page changing functionality.
                    onPageClick: function (pageNumber) {

                        /*Aqui entra um AJAX para pegar o conteúdo necessário*/
                        $.get("/TestePaginacao?pag=" + pageNumber, function (data, status) {
                            //alert("Data: " + data + "\nStatus: " + status);
                            document.getElementById('content').innerHTML = (data);

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
            Página 1
        </div>

        <div class="pagination-holder clearfix">
            <div id="light-pagination" class="pagination-page"></div>
        </div>

    </body>


</html>
