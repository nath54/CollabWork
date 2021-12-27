
<div class="row">
    <h1>Groupe : <?php echo $nom_groupe; ?></h1>
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

<div>
    <button class="bt3" style="margin-top:5vh;" >Quitter le groupe</button>
</div>