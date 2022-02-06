
<div class="row">
    <div style="flex-wrap:wrap;" class="row">
        <h1 id="nom">Groupe : <?php echo $nom_groupe; ?></h1>
        <div class="row" style="flex-wrap:wrap; <?php if(!$est_createur){ echo 'display:none;'; } ?>">
            <input id="input_nom" value="<?php echo $nom_groupe; ?>" style="display:none;"/>
            <button id="bt_modif_nom" onclick="modif_nom();" class="bt1" style="margin:2vh;">Modifier</button>
            <button id="bt_save_nom" onclick="save_nom();" class="bt1" style="margin:2vh; display:none;">Sauvegarder</button>
            <button id="bt_annule_nom" onclick="annule_nom();" class="bt1" style="margin:2vh; display:none;">Annuler</button>
        </div>
    </div>
    <button class="bt1" style="margin:2vh; <?php if(!$est_createur){ echo "display:none;"; } ?>">Modifier</button>
</div>

<div>
    <button class="bt1" style="margin-top:2vh;">Discussion</button>
</div>

<div>
    <button class="bt1" style="margin-top:2vh;"  onclick="window.location.href='groupe_cours.php';" >Voir les cours partagés à ce groupe</button>
</div>

<div>
    <button class="bt1" style="margin-top:2vh;">Voir les fiches partagées à ce groupe</button>
</div>

<div>
    <button class="bt1" style="margin-top:2vh;">Voir les membres du groupe</button>
</div>

<div style="margin-top:2vh; <?php if(!$est_createur){ echo "display:none;"; } ?>">
    <input style="margin-left:2vh; margin-bottom:2vh; " type="checkbox" id="input_est_public" onclick="save_est_public();" <?php if($est_public){ echo "checked"; } ?>/>
    <label>Public</label>
</div>

<div>
    <button class="bt3" style="margin-top:5vh;" >Quitter le groupe</button>
</div>