function modif_nom() {
    document.getElementById("nom").style.display = "none";
    document.getElementById("bt_modif_nom").style.display = "none";
    document.getElementById("input_nom").style.display = "block";
    document.getElementById("bt_save_nom").style.display = "block";
    document.getElementById("bt_annule_nom").style.display = "block";
}

function annule_nom() {
    document.getElementById("nom").style.display = "block";
    document.getElementById("bt_modif_nom").style.display = "block";
    document.getElementById("input_nom").style.display = "none";
    document.getElementById("bt_save_nom").style.display = "none";
    document.getElementById("bt_annule_nom").style.display = "none";
}

function save_est_public() {
    var inp = document.getElementById("input_est_public");
    var est_public = inp.checked;
    if (est_public) {
        est_public = 1;
    } else {
        est_public = 0;
    }
    send_form("groupe.php", [
        ["type", "save_est_public"],
        ["est_public", est_public],
        ["id_groupe", window.id_groupe]
    ]);
}

function save_nom() {
    var nom = document.getElementById("input_nom").value;
    send_form("groupe.php", [
        ["type", "save_nom"],
        ["nom", nom],
        ["id_groupe", window.id_groupe]
    ]);
}