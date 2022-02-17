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



function save_titre() {
    var titre = document.getElementById("input_titre").value;
    send_form("chapitre.php", [
        ["type", "save_titre"],
        ["titre", titre],
        ["id_chapitre", window.id_chapitre]
    ]);
}

function save_description() {
    var description = document.getElementById("input_description").value;
    send_form("chapitre.php", [
        ["type", "save_description"],
        ["description", description],
        ["id_chapitre", window.id_chapitre]
    ]);
}

function change_view_list() {
    send_form("chapitre.php", [
        ["type", "request"],
        ["id_chapitre", window.id_chapitre]
    ])
}

function change_view_rendu() {
    send_form("chapitre_rendu.php", [
        ["type", "request"],
        ["id_chapitre", window.id_chapitre]
    ])
}


function save_scroll_position() {
    var div = document.getElementById("main_body");
    var path = window.location.pathname;
    sessionStorage["page_path"] = path;
    sessionStorage["scroll_page"] = div.scrollTop;
}

function page_init() {
    MathJax.typesetPromise();
    var path = window.location.pathname;
    if (path == sessionStorage.getItem("page_path")) {
        var val = sessionStorage.getItem("scroll_page");
        if (val != null) {
            var div = document.getElementById("main_body");
            div.scrollTop = val;
        }
    }
    sessionStorage.removeItem('page_path');
    sessionStorage.removeItem('scroll_page');
}

function launch_quiz(quiz_id) {
    send_form('quiz.php', [
        ['type', 'request'],
        ['chapfiches', '[["chapitre",  ' + quiz_id + ']]'],
        ['toutes_questions', true],
        ['nb_questions', 20]
    ]);
}