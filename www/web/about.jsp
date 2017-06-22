<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="assets/ico/favicon.png">
        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <title>Sobre</title>

        <!-- Bootstrap core CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <link href="assets/css/font-awesome.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="assets/css/newcss.css" rel="stylesheet">
    </head>
    
    <body>
        <%@include file= "cabecalho.jsp" %>
        <section>
            <div class="container w" id="containAbout">
                <div class="row centered">
                    <br><br>
                    <div class="col-lg-3">
                        <img class="img-circle" src="assets/img/pic.jpg" width="110" height="110" alt="">
                        <h4>Carla Gama</h4>
                        <p>BD, ES2 e WEB.</p>
                        <p><a href="https://www.facebook.com/carlagaama">@carlagaama</a></p>
                    </div><!-- col-lg-3 -->

                    <div class="col-lg-3">
                        <img class="img-circle" src="assets/img/pic2.jpg" width="110" height="110" alt="">
                        <h4>Eduardo Cruz</h4>
                        <p>BD e WEB.</p>
                        <p><a href="https://www.facebook.com/ed.rc.5">@ed.rc.5</a></p>
                    </div><!-- col-lg-3 -->

                    <div class="col-lg-3">
                        <img class="img-circle" src="assets/img/pic3.jpg" width="110" height="110" alt="">
                        <h4>Ingrid Santos</h4>
                        <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form.</p>
                        <p><a href="#">@urlAqui</a></p>
                    </div><!-- col-lg-3 -->

                    <div class="col-lg-3">
                        <img class="img-circle" src="assets/img/pic4.jpg" width="110" height="110" alt="">
                        <h4>Mateus Vasconcelos</h4>
                        <p>BD, ES2 e WEB.</p>
                        <p><a href="#">@mattvasc</a></p>
                    </div><!-- col-lg-3 -->
                </div><!-- row -->
                <br>
                <br>
            </div>
        </section>
        <%@include file="rodape.jsp"%>
        
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function(){
              $("#l4").addClass("active");
            });   
        </script>
    </body>
</html>
