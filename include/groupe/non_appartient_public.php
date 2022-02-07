
<h1>Groupe : <?php echo $nom_groupe; ?></h1>

<div>
    <button class="bt1" style="margin-top:2vh;" onclick="send_form('groupe_cours.php', [['type', 'request'], ['id_groupe', <?php echo $id; ?>]]);" >Voir les cours partagés à ce groupe</button>
</div>

<div>
    <button class="bt1" style="margin-top:2vh;">Voir les fiches partagées à ce groupe</button>
</div>

<div>
    <button class="bt1" style="margin-top:2vh;" onclick="send_form('groupe_membres.php', [['type', 'request'], ['id_groupe', <?php echo $id; ?>]]);">Voir les membres du groupe</button>
</div>
