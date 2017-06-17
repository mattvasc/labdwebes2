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
            jQuery(function($) {
                // Consider adding an ID to your table
                // incase a second table ever enters the picture.
                var items = $("table tbody tr");

                var numItems = items.length;
                var perPage = 2;

                // Only show the first 2 (or first `per_page`) items initially.
                items.slice(perPage).hide();

                // Now setup the pagination using the `.pagination-page` div.
                $(".pagination-page").pagination({
                    items: numItems,
                    itemsOnPage: perPage,
                    cssStyle: "light-theme",

                    // This is the actual page changing functionality.
                    onPageClick: function(pageNumber) {
                        // We need to show and hide `tr`s appropriately.
                        var showFrom = perPage * (pageNumber - 1);
                        var showTo = showFrom + perPage;

                        // We'll first hide everything...
                        items.hide()
                             // ... and then only show the appropriate rows.
                             .slice(showFrom, showTo).show();
                    }
                });

                // EDIT: Let's cover URL fragments (i.e. #page-3 in the URL).
                // More thoroughly explained (including the regular expression) in: 
                // https://github.com/bilalakil/bin/tree/master/simplepagination/page-fragment/index.html

                // We'll create a function to check the URL fragment
                // and trigger a change of page accordingly.
                function checkFragment() {
                    // If there's no hash, treat it like page 1.
                    var hash = window.location.hash || "#page-1";

                    // We'll use a regular expression to check the hash string.
                    hash = hash.match(/^#page-(\d+)$/);

                    if(hash) {
                        // The `selectPage` function is described in the documentation.
                        // We've captured the page number in a regex group: `(\d+)`.
                        $(".pagination-page").pagination("selectPage", parseInt(hash[1]));
                    }
                };

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
        
        <table>
            <thead>
                <tr>
                    <td><input type="checkbox" name="select-all" id="select-all" /></td>
                    <td style="text-align: left">Name</td>
                    <td style="text-align: left">Created By</td>
                    <td style="text-align: left">Created Date</td>
                </tr>
            </thead>
            <tbody>
                    <tr class="post">
                        <td><p><input Length="0" name="314" type="checkbox" value="true" /><input name="314" type="hidden" value="false" /></p></td>
                        <td>Window</td>
                        <td>John</td>
                        <td>01/01/2014 12:00:00 AM</td>
                    </tr>
                    <tr class="post">
                        <td><p><input Length="0" name="314" type="checkbox" value="true" /><input name="314" type="hidden" value="false" /></p></td>
                        <td>Door</td>
                        <td>Chris</td>
                        <td>01/01/2014 12:00:00 AM</td>
                    </tr>
                    <tr class="post">
                        <td><p><input Length="0" name="314" type="checkbox" value="true" /><input name="314" type="hidden" value="false" /></p></td>
                        <td>Floor</td>
                        <td>Michael</td>
                        <td>01/01/2014 12:00:00 AM</td>
                    </tr>
                    <tr class="post">
                        <td><p><input Length="0" name="314" type="checkbox" value="true" /><input name="314" type="hidden" value="false" /></p></td>
                        <td>Car</td>
                        <td>James</td>
                        <td>01/01/2014 12:00:00 AM</td>
                    </tr>
                    <tr class="post">
                        <td><p><input Length="0" name="314" type="checkbox" value="true" /><input name="314" type="hidden" value="false" /></p></td>
                        <td>Bike</td>
                        <td>Steven</td>
                        <td>01/01/2014 12:00:00 AM</td>
                    </tr>
            </tbody>
        </table>
        
        <div class="pagination-holder clearfix">
            <div id="light-pagination" class="pagination-page"></div>
	</div>
        
    </body>
    
    
</html>
