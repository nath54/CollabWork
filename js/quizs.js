function toggle_selectionnes() {
    var div = document.getElementById("div_selectionnes");
    var triangle = document.getElementById("triangle3");
    if (div.style.display == "none") {
        div.style.display = "block";
        triangle.style.transform = "rotate(90deg)";
    } else {
        div.style.display = "none";
        triangle.style.transform = "rotate(0)";
    }
}

function save_selectionnes() {

}

function update_nb_questions() {

}

function lancer_quiz() {
    var page = "quiz.php";
    if (document.getElementById("select_type").value == 2) { page = "quiz_ecrire.php"; }
    send_form(
        page, [
            ["type", "request"],
            ["chapfiches", window.data_quiz],
            ["toutes_questions", document.getElementById("select_nb_questions").value == 1],
            ["nb_questions", document.getElementById("input_nb_questions").value]
        ]
    );
}