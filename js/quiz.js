var div_result;
var titre;
var converter = new showdown.Converter();
window.nb_questions_faites = 0;
window.score = 0;
window.questions_reussies = [];
window.questions_rates = [];
window.id_question = 0;
window.etape = 0; // 0 = pas commencé, 1 = en train d'afficher la question, 2 =  juste / faux, 3 = fini

// ON SUPPOSE QU'IL Y A AU MOINS 3 QUESTIONS

// window.questions;
// window.all_questions;
// window.nb_questions;


/* ------------------------ COMPILATION / PAGE ------------------------ */
function key_compile() {
    var live_compile = (document.getElementById("div_checkbox").style.display == "block") && (document.getElementById("checkbox_live_compil").checked)
        // console.log("live_compile = ", live_compile);
    if (live_compile) {
        compile();
    }
}

function update_md() {
    div_result.innerHTML = converter.makeHtml(div_result.innerHTML);
}

function compile() {
    // Nettoyage
    for (c of div_result.children) {
        div_result.removeChild(c);
    }

    div_result.innerHTML = div_result.innerHTML;

    // Compilation latex
    MathJax.typesetPromise();

    // Compilation markdown
    setTimeout(update_md(), 1000);
}

function retour() {
    // En vrai, on fera une sauvegarde en envoyant une requete a la page brouillon, qui va ensuite rediriger vers brouillons.php
    window.location.href = "quizs.php";
}

/* ------------------------------- QUIZ ------------------------------- */

function init() {
    // On initialise les variables
    window.nb_questions_faites = 0;
    window.score = 0;
    window.questions_reussies = [];
    window.questions_rates = [];
    window.id_question = 0;
    window.etape = 0;
    // On récupère les éléments HTML
    div_result = document.getElementById("result");
    titre = document.getElementById("titre");
    // On lance le quiz
    next_state();
}

function next_state() {
    if (window.etape == 0) {
        create_question();
        window.etape = 1;
    } else if (window.etape == 1) {
        affiche_reponse();
        window.etape = 2;
    } else if (window.etape == 2) {
        if (!window.all_questions) {
            if (window.nb_questions_faites > window.nb_questions) {
                ecran_fin();
                window.etape = 3;
            } else if (windows.questions.length > 0) {
                if (window.questions_rates.length > 0) {
                    window.questions = window.questions_rates;
                    window.questions_rates = [];
                } else {
                    window.questions = window.questions_reussies;
                    window.questions_reussies = [];
                }
            }
            // Il devrait y avoir des éléments dans question normalement
            create_question();
            window.etape = 1;
        } else {
            if (window.questions.length > 0) {
                create_question();
                window.etape = 1;
            } else {
                ecran_fin();
                window.etape = 3;
            }
        }
    }
    // Normalement, on n'a plus rien d'autre à faire
}

function create_question() { // On suppose qu'il y a des questions dans window.questions
    // On tire au sort une question
    window.id_question = parseInt(Math.random() * window.questions.length);
    // On prépare les elements HTML
    titre.innerHTML = window.questions[window.id_question].titre;
    div_result.innerHTML = window.questions[window.id_question].texte;
    compile();
    // On n'affiche que les bons 
    div_result.style.display = "none";
}