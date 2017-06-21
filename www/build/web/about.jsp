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

        <div class="container w">
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
        </div><!-- container -->

<!--         PORTFOLIO SECTION 
        <div id="dg">
            <div class="container">
                <div class="row centered">
                    <h4>OUR SKILLS</h4>
                    <br>

                     First Chart 
                    <div class="col-lg-3">
                        <canvas id="canvas" height="130" width="130"></canvas>
                        <br>
                        <script>
                            var doughnutData = [
                                {
                                    value: 70,
                                    color:"#3498db"
                                },
                                {
                                    value : 30,
                                    color : "#ecf0f1"
                                }
                            ];
                            var myDoughnut = new Chart(document.getElementById("canvas").getContext("2d")).Doughnut(doughnutData);
                        </script>
                        <p><b>Design & Brand</b></p>
                        <p><small>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form.</small></p>
                    </div> /col-lg-3 

                     Second Chart 
                    <div class="col-lg-3">
                        <canvas id="canvas2" height="130" width="130"></canvas>
                        <br>
                        <script>
                            var doughnutData = [
                                {
                                    value: 90,
                                    color:"#3498db"
                                },
                                {
                                    value : 10,
                                    color : "#ecf0f1"
                                }
                            ];
                            var myDoughnut = new Chart(document.getElementById("canvas2").getContext("2d")).Doughnut(doughnutData);
                        </script>
                        <p><b>Web Development</b></p>
                        <p><small>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form.</small></p>
                    </div> /col-lg-3 

                     Third Chart 
                    <div class="col-lg-3">
                        <canvas id="canvas3" height="130" width="130"></canvas>
                        <br>
                        <script>
                            var doughnutData = [
                                {
                                    value: 50,
                                    color:"#3498db"
                                },
                                {
                                    value : 50,
                                    color : "#ecf0f1"
                                }
                            ];
                            var myDoughnut = new Chart(document.getElementById("canvas3").getContext("2d")).Doughnut(doughnutData);
                        </script>
                        <p><b>Seo Services</b></p>
                        <p><small>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form.</small></p>
                    </div> /col-lg-3 

                     Fourth Chart 
                    <div class="col-lg-3">
                        <canvas id="canvas4" height="130" width="130"></canvas>
                        <br>
                        <script>
                            var doughnutData = [
                                {
                                    value: 80,
                                    color:"#3498db"
                                },
                                {
                                    value : 20,
                                    color : "#ecf0f1"
                                }
                            ];
                            var myDoughnut = new Chart(document.getElementById("canvas4").getContext("2d")).Doughnut(doughnutData);
                        </script>
                        <p><b>Printing</b></p>
                        <p><small>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form.</small></p>
                    </div> /col-lg-3 
                </div> row 
            </div> container 
        </div> DG -->

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
