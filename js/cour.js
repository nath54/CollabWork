function modif_titre() {
    document.getElementById("titre").style.display = "none";
    document.getElementById("bt_modif_titre").style.display = "none";
    document.getElementById("input_titre").style.display = "block";
    document.getElementById("bt_save_titre").style.display = "block";
    document.getElementById("bt_annule_titre").style.display = "block";
}

function annule_titre() {
    document.getElementById("titre").style.display = "block";
    document.getElementById("bt_modif_titre").style.display = "block";
    document.getElementById("input_titre").style.display = "none";
    document.getElementById("bt_save_titre").style.display = "none";
    document.getElementById("bt_annule_titre").style.display = "none";
}

function modif_description() {
    document.getElementById("description").style.display = "none";
    document.getElementById("bt_modif_description").style.display = "none";
    document.getElementById("input_description").style.display = "block";
    document.getElementById("bt_save_description").style.display = "block";
    document.getElementById("bt_annule_description").style.display = "block";
}

function annule_description() {
    document.getElementById("description").style.display = "block";
    document.getElementById("bt_modif_description").style.display = "block";
    document.getElementById("input_description").style.display = "none";
    document.getElementById("bt_save_description").style.display = "none";
    document.getElementById("bt_annule_description").style.display = "none";
}

function ajout_groupe() {
    document.getElementById("div_ajout_groupe").style.display = "block";
}

function annule_ajout_groupe() {
    document.getElementById("div_ajout_groupe").style.display = "none";
}

function save_est_public() {
    var inp = document.getElementById("input_est_public");
    var est_public = inp.checked;
    if (est_public) {
        est_public = 1;
    } else {
        est_public = 0;
    }
    send_form("cour.php", [
        ["type", "save_est_public"],
        ["est_public", est_public],
        ["id_cour", window.id_cour]
    ]);
}

function save_titre() {
    var titre = document.getElementById("input_titre").value;
    send_form("cour.php", [
        ["type", "save_titre"],
        ["titre", titre],
        ["id_cour", window.id_cour]
    ]);
}

function save_description() {
    var description = document.getElementById("input_description").value;
    send_form("cour.php", [
        ["type", "save_description"],
        ["description", description],
        ["id_cour", window.id_cour]
    ]);
}