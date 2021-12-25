<div class="container" style="margin: 20px;">
    <button class="bt1" onclick="window.location.href='brouillon.php'" >Nouveau brouillon</button>
    <h1>Vos brouillons :</h1>
    <div class="col">
    <?php

        if(count($brouillons) == 0){
            echo "<p>Vous n'avez pas de brouillons</p>";
        }
        else{
            foreach($brouillons as $br){
                $id = $br["id"];
                $titre = $br["titre"];
                $date = $br["derniere_modif"];
                $text_date = "hier";
                echo "<div id='$id' class='bt_item row'><div class='col' style='width:100%; padding:5px; margin:auto; '><h2>$titre</h2><i style='font-size:0.9em;'>Dernière modification : $text_date</i></div> <div class='row'><img class='bt_svg' src='../res/pencil.svg' /> <img class='bt_svg' src='../res/trash.svg' /></div></div></div>";
            }
        }

    ?>
    </div>
</div>