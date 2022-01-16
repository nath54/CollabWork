<div class="container" style="margin: 20px;">
    <div class="row c_pointer" onclick="toggle_voscours();">
        <span id="triangle" style="z-index:-1; transition: all 0.4s; transform:rotate(90deg); margin-top:auto; margin-bottom:auto; margin-right: 10px;">&#9654;</span>
        <h1>Vos exercices :</h1>
    </div>
    <div id="div_voscours" class="col">
        <?php

            if(count($exercices) == 0){
                echo "<p>Vous n'avez pas créé d'exercices</p>";
            }
            else{
                $i = 0;         
                foreach($exercices as $ex){
                    $i++;
                    $id = $ex["id"];
                    $titre = $ex["titre"];
                    $chapitres = $ex["id_chapitres"];
                    echo "<div id='$id' class='bt_item row' >
                            <div class='col' style='width:100%; padding:5px; margin:auto; ' onclick='send_form(\"../web/exercice.php\", [[\"type\", \"request\"], [\"id_exercice\", $id]])'>
                                <h2>$titre</h2>
                            </div>
                            <div style='margin:2vh; margin-left:auto;'>
                                <img class='bt_svg' src='../res/pencil.svg' onclick=\"send_form('../web/modif_exercice.php', [['type', 'request'], ['id_exercice', $id]]);\"  />
                            </div>
                        </div>";
                }
            }

        ?>
        <div>
            <button class="bt1" style="margin:2vh;" onclick="send_form('../web/exercices.php', [['type', 'new']]);" >+ Nouvel exercice</button>
        </div>
    </div>
</div>