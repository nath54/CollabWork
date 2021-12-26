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