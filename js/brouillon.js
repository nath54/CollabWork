var input = document.getElementById("texte")
var div_result = document.getElementById("result");
var converter = new showdown.Converter();


function key_compile() {
    var live_compile = (document.getElementById("div_checkbox").style.display == "block") && (document.getElementById("checkbox_live_compil").checked)
        // console.log("live_compile = ", live_compile);
    if (live_compile) {
        compile();
    }
}

function compile() {
    // Nettoyage
    for (c of div_result.children) {
        div_result.removeChild(c);
    }
    // Update
    div_result.innerHTML = converter.makeHtml(input.value);
    // Compilation latex
    MathJax.typesetPromise();
    // Compilation markdown
    // div_result.innerHTML = div_result.innerHTML);
}

function retour() {
    // En vrai, on fera une sauvegarde en envoyant une requete a la page brouillon, qui va ensuite rediriger vers brouillons.php
    window.location.href = "brouillons.php";
}

function edit() {
    // Boutons
    var bt1 = document.getElementById("bt_edit");
    var bt2 = document.getElementById("bt_view");
    if (bt1.classList.contains("bt_tab")) {
        bt1.classList.replace("bt_tab", "bt_tab_active");
    }
    if (bt2.classList.contains("bt_tab_active")) {
        bt2.classList.replace("bt_tab_active", "bt_tab");
    }
    //
    document.getElementById("div_textarea").style.display = "initial";
    document.getElementById("div_result").style.display = "none";
}

function view() {
    // Boutons
    var bt2 = document.getElementById("bt_edit");
    var bt1 = document.getElementById("bt_view");
    if (bt1.classList.contains("bt_tab")) {
        bt1.classList.replace("bt_tab", "bt_tab_active");
    }
    if (bt2.classList.contains("bt_tab_active")) {
        bt2.classList.replace("bt_tab_active", "bt_tab");
    }
    //
    document.getElementById("div_textarea").style.display = "none";
    document.getElementById("div_result").style.display = "initial";
    compile();
}

function save_brouillon() {
    var texte = encodeURI(input.value);
    var titre = document.getElementById("input_titre").value;
    send_form("../web/brouillon.php", [
        ["type", "save"],
        ["titre", titre],
        ["texte", texte],
        ["brouillon_id", window.id_brouillon]
    ]);
}