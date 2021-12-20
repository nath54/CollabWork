<!doctype HTML>
<html>


    <script src="../js/MATHJAX_CONFIG.js"></script>
    <script src="../js/tex-mml-chtml.js"></script>
    <script src="../js/showdown.min.js"></script>

    <head>
        <meta charset="utf-8" />
        <title>CollabWork - Feuille de brouillon</title>
        <!-- STYLES ... -->
        <link href="../style/style.css" rel="stylesheet" />
    </head>
    <body>
        <div class="container row">

            <div style="border: 1px solid black; width:max; height: max;">
                <textarea id="texte" placeholder="Ecrire son texte ici" onchange="compile();" onkeypress="compile();" onkeyup="compile();" ></textarea>    
            </div>

            <div style="border: 1px solid black; width: max; height: max;">
                <div id="result">

                </div>
            </div>

        </div>

        <button onclick="compile();">Compile</button>

    </body>

    <script src="../js/brouillon.js"></script>
</html>