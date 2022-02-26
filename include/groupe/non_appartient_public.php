
<h1>Groupe : <?php echo $nom_groupe; ?></h1>

<div style="display: <?php if($est_connecte){echo "block;"; }else{echo "none;";} ?>">
    <button class="bt1" style="margin-top:2vh;" onclick="send_form('groupe.php', [['type', 'rejoindre_groupe'], ['id_groupe', <?php echo $id; ?>]]);">Rejoindre le groupe</button>
</div>

<div>
    <button class="bt1" style="margin-top:2vh;" onclick="send_form('groupe_cours.php', [['type', 'request'], ['id_groupe', <?php echo $id; ?>]]);" >Voir les cours partagés à ce groupe</button>
</div>

<div>
    <button class="bt1" style="margin-top:2vh;">Voir les fiches partagées à ce groupe</button>
</div>

<div>
    <button class="bt1" style="margin-top:2vh;" onclick="send_form('groupe_membres.php', [['type', 'request'], ['id_groupe', <?php echo $id; ?>]]);">Voir les membres du groupe</button>
</div>
