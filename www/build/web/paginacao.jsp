<%-- 
    Document   : paginacao
    Created on : Jun 15, 2017, 5:31:01 PM
    Author     : spectrus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Endless Scroll Demo (by Fred Wu)</title>
        <script src="assets/js/jquery-1.7.2min.js"></script>
        <script src="assets/js/jquery.endless-scroll.js"></script>

        <style type="text/css" media="screen">
            * { margin: auto; }
            body { margin: 20px 0; background: #abc; color: #111; font-family: Helvetica, Arial, Verdana, 'Lucida Grande', sans-serif; }
            h1, h3, p { text-align: center; }
            div.example { padding: 20px; margin: 10px auto; background: #bcd; width: 750px; }
            div.example h3 { margin-bottom: 10px; }
            ul, ol { padding: 0; }
            #list { width: 50px; height: 150px; overflow-y: scroll; }
            #images { width: 600px;  overflow-x: hidden; text-align: center; list-style: none; }
            .endless_scroll_loader { position: fixed; top: 10px; right: 20px; }
            #numbers {
                margin: 2em auto;
                padding: 0;
                width: 15em;
                height: 10em;
                overflow: auto;
                text-align: center;
                list-style-type: none;
            }
        </style>
    </head>
    <body>
        <h1>Hello World!</h1>
        Antes da div <br />
        <div class="example">
            <ul id="images" class="jscroll"> <li>Conteúdo Inicial! <br /> </li><li>Conteúdo Inicial! <br /> </li><li>Conteúdo Inicial!</li></ul> 
        </div>

        Depois da div.
        <div class="example">
            <ul id="numbers">
                <li>1</li>
                <li>2</li>
                <li>3</li>
                <li>4</li>
                <li>5</li>

            </ul>

        </div>
        <script type="text/javascript" charset="utf-8">
            $(document).ready(function () {
                console.log("Pronto!");
                $('#numbers').endlessScroll({
                    fireOnce: false,
                    fireDelay: false,
                    loader: '',
                    insertAfter: '#numbers li:last',
                    content: function (i) {
                        return '<li>' + (i + offset) + '</li>';
                    }
                });

                $('#images').endlessScroll({
                    loader: '<small> "Loading" ... </small>',
                    callback: function (p) {
                        console.log("test");
                    },
                    pagesToKeep: 10,
                    fireOnce: false,
                    content: function (i, p) {
                        console.log(i, p)
                        return '<li>' + p + '</li>'
                    }

                });
                console.log("após coiso lá");
            });

        </script>
    </body>
</html>
