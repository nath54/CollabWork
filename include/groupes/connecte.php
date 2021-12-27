<div class="row c_pointer" onclick="toggle_vosgroupes();">
    <span id="triangle1" style="z-index:-1; transition: all 0.4s; transform:rotate(90deg); margin-top:auto; margin-bottom:auto; margin-right: 10px;">&#9654;</span>
    <h1>Vos groupes :</h1>
</div>
<div id="div_vosgroupes" class="col">
    <?php

        if(count($mes_groupes) == 0){
            echo "<p>Vous n'avez pas créé de groupes</p>";
        }
        else{
            foreach($mes_groupes as $grp){
                $id = $grp["id"];
                $nom = $grp["nom"];
                echo "<div id='$id' class='bt_item row' onclick='window.location.href=\"groupe.php\"'><div class='col' style='width:100%; padding:5px; margin:auto; '><h2>$nom</h2></div> </div>";
            }
        }

    ?>
    <div>
        <button class="bt1" style="margin:2vh;" onclick="window.location.href='groupe.php'" >+ Créer un groupe</button>
    </div>
</div>

<div class="row c_pointer" onclick="toggle_groupes_appartient();">
    <span id="triangle2" style="z-index:-1; transition: all 0.4s; transform:rotate(90deg); margin-top:auto; margin-bottom:auto; margin-right: 10px;">&#9654;</span>
    <h1>Groupes auxquels vous appartenez :</h1>
</div>
<div id="div_groupes_appartient" class="col">
    <?php

        if(count($groupes) == 0){
            echo "<p>Vous n'appartenez à aucun groupe !</p>";
        }
        else{
            foreach($groupes as $grp){
                $id = $grp["id"];
                $nom = $grp["nom"];
                echo "<div id='$id' class='bt_item row' onclick='window.location.href=\"groupe.php\"'><div class='col' style='width:100%; padding:5px; margin:auto; '><h2>$nom</h2></div> </div>";
            }
        }

    ?>
</div>