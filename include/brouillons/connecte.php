<div class="container" style="margin: 20px;">
    <!--  Feuilles de brouillon  -->
    <div class="row c_pointer" onclick="toggle_brouillons();">
        <span id="triangle1" style="z-index:-1; transition: all 0.4s; transform:rotate(90deg); margin-top:auto; margin-bottom:auto; margin-right: 10px;">&#9654;</span>
        <h1>Vos brouillons :</h1>
    </div>
    <div id="lst_brouillons" class="col">
        <?php

            if(count($brouillons) == 0){
                echo "<p>Vous n'avez pas de brouillons</p>";
            }
            else{
                foreach($brouillons as $br){
                    $id = $br["id"];
                    $titre = $br["titre"];
                    $date = $br["last_modif"];
                    // $text_date = "hier";
                    $text_date = $date;
                    echo "<div id='$id' class='bt_item row' style='cursor:default;'><div class='col' style='width:100%; padding:5px; margin:auto; '><h2>$titre</h2><i style='font-size:0.9em;'>Dernière modification : $text_date</i></div> <div class='row'><img class='bt_svg' src='../res/pencil.svg' onclick=\"send_form('../web/brouillon.php', [['type', 'request'], ['brouillon_id', $id]]);\"  /> <img class='bt_svg' src='../res/trash.svg' onclick=\"send_form('../web/brouillons.php', [['type', 'delete'], ['brouillon_id', $id]]);\"/></div></div>";
                }
            }

        ?>
        
        <div style="margin:2vh;">
            <button class="bt1" onclick="window.location.href='brouillon.php'" >+ Nouveau brouillon</button>
        </div>
    </div>
    <!-- Exercices traités -->
    <div class="row c_pointer" onclick="toggle_exos();">
        <span id="triangle2" style="z-index:-1; transition: all 0.4s; transform:rotate(90deg); margin-top:auto; margin-bottom:auto; margin-right: 10px;">&#9654;</span>
        <h1>Les exercices sur lesquels vous avez travaillé :</h1>
    </div>
    <div id="lst_exos" class="col">
        <?php

            if(count($exercices) == 0){
                echo "<p>Vous avez travaillé sur aucun exercice</p>";
            }
            else{
                foreach($exercices as $ex){
                    $id = $ex["id"];
                    $titre = $ex["titre"];
                    $date = $ex["last_modif"];
                    $text_date = "hier";
                    echo "<div id='$id' class='bt_item row' style='cursor:default;'><div class='col' style='width:100%; padding:5px; margin:auto; '><h2>$titre</h2><i style='font-size:0.9em;'>Dernière modification : $text_date</i></div> <div class='row'><img class='bt_svg' src='../res/pencil.svg' /> <img class='bt_svg' src='../res/trash.svg' /></div></div>";
                }
            }

        ?>
    </div>
</div>

</form>


<script>

function toggle_brouillons(){
    var div = document.getElementById("lst_brouillons");
    var triangle = document.getElementById("triangle1");
    if(div.style.display=="none"){
        div.style.display = "block";
        triangle.style.transform = "rotate(90deg)";
    }
    else{
        div.style.display = "none";
        triangle.style.transform = "rotate(0)";
    }
}


function toggle_exos(){
    var div = document.getElementById("lst_exos");
    var triangle = document.getElementById("triangle2");
    if(div.style.display=="none"){
        div.style.display = "block";
        triangle.style.transform = "rotate(90deg)";
    }
    else{
        div.style.display = "none";
        triangle.style.transform = "rotate(0)";
    }
}

</script>