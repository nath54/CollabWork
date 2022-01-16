window.type_nouveau = "texte";


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


function ajout_groupe() {
    document.getElementById("div_ajout_groupe").style.display = "block";
}

function annule_ajout_groupe() {
    document.getElementById("div_ajout_groupe").style.display = "none";
}

function ajout_chapitre() {
    document.getElementById("div_ajout_chapitre").style.display = "block";
}

function annule_ajout_chapitre() {
    document.getElementById("div_ajout_chapitre").style.display = "none";
}

function modif_contenu(id) {
    var txt = document.getElementById("texte_contenu_" + id);
    var input = document.getElementById("input_contenu_" + id);
    var bt_modif = document.getElementById("bt_modif_contenu_" + id);
    var bt_supprime = document.getElementById("bt_supprime_contenu_" + id);
    var bt_save = document.getElementById("bt_save_contenu_" + id);
    var bt_annule = document.getElementById("bt_annule_contenu_" + id);
    txt.style.display = "none";
    input.style.display = "block";
    bt_modif.style.display = "none";
    bt_supprime.style.display = "none";
    bt_save.style.display = "block";
    bt_annule.style.display = "block";
}

function annule_modif_contenu(id) {
    var txt = document.getElementById("texte_contenu_" + id);
    var input = document.getElementById("input_contenu_" + id);
    var bt_modif = document.getElementById("bt_modif_contenu_" + id);
    var bt_supprime = document.getElementById("bt_supprime_contenu_" + id);
    var bt_save = document.getElementById("bt_save_contenu_" + id);
    var bt_annule = document.getElementById("bt_annule_contenu_" + id);
    txt.style.display = "block";
    input.style.display = "none";
    bt_modif.style.display = "block";
    bt_supprime.style.display = "block";
    bt_save.style.display = "none";
    bt_annule.style.display = "none";
}


function save_titre() {
    var titre = document.getElementById("input_titre").value;
    send_form("modif_exercice.php", [
        ["type", "save_titre"],
        ["titre", titre],
        ["id_exercice", window.id_exercice]
    ])
}

function save_est_public() {
    var inp = document.getElementById("input_est_public");
    var est_public = inp.checked;
    if (est_public) {
        est_public = 1;
    } else {
        est_public = 0;
    }
    send_form("modif_exercice.php", [
        ["type", "save_est_public"],
        ["est_public", est_public],
        ["id_exercice", window.id_exercice]
    ])
}

function supprime_contenu(id) {
    send_form("modif_exercice.php", [
        ["type", "delete_element"],
        ["id_question", id],
        ["id_exercice", window.id_exercice]
    ])
}

function sauvegarde_contenu(id) {
    var texte = document.getElementById("input_contenu_" + id).value;
    send_form("modif_exercice.php", [
        ["type", "save_element"],
        ["texte", texte],
        ["id_question", id],
        ["id_exercice", window.id_exercice]
    ])
}

function nouvelle_question() {
    window.type_nouveau = "question";
    document.getElementById("div_nouveau").style.display = "block";
    document.getElementById("input_nouveau").placeholder = "Énoncé de la question";
    document.getElementById("input_nouveau").value = "";
    document.getElementById("titre_nouveau").innerHTML = "Nouvelle question";
}

function nouveau_texte() {
    window.type_nouveau = "texte";
    document.getElementById("div_nouveau").style.display = "block";
    document.getElementById("input_nouveau").placeholder = "Texte...";
    document.getElementById("input_nouveau").value = "";
    document.getElementById("titre_nouveau").innerHTML = "Nouveau texte";
}

function send_nouveau() {
    texte = document.getElementById("input_nouveau").value;
    type = window.type_nouveau;
    send_form("modif_exercice.php", [
        ["type", "add_element"],
        ["_type", type],
        ["texte", texte],
        ["id_exercice", window.id_exercice]
    ])
}

function annule_nouveau() {
    document.getElementById("div_nouveau").style.display = "none";
}

function supprime_exercice() {
    send_form("modif_exercice.php", [
        ["type", "supprime_exercice"],
        ["id_exercice", window.id_exercice]
    ])
}