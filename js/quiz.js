var txt_result;
var div_result;
var titre;
var converter = new showdown.Converter();
window.nb_questions_faites = 0;
window.score = 0;
window.questions_reussies = [];
window.questions_rates = [];
window.id_question = 0;
window.etape = 0; // 0 = pas commencé, 1 = en train d'afficher la question, 2 =  juste / faux, 3 = fini
// Pour l'équivalent du php : html_entity_decode
Encoder.EncodeType = "entity";


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
    txt_result.innerHTML = converter.makeHtml(txt_result.innerHTML);
}

function compile() {
    // Nettoyage
    for (c of txt_result.children) {
        txt_result.removeChild(c);
    }

    txt_result.innerHTML = txt_result.innerHTML;

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
    div_result = document.getElementById("div_result");
    txt_result = document.getElementById("result");
    titre = document.getElementById("titre");
    // On lance le quiz
    next_state();
}

function next_state() {
    update_score();
    if (window.etape == 0) {
        create_question();
        window.etape = 1;
    } else if (window.etape == 1) {
        affiche_reponse();
        window.etape = 2;
    } else if (window.etape == 2) {
        if (!window.all_questions) {
            if (window.nb_questions_faites >= window.nb_questions) {
                ecran_fin();
                window.etape = 3;
            } else if (window.questions.length == 0) {
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

function affiche_reponse() {
    div_result.style.display = "block";
    document.getElementById("bt_aff").style.display = "none";
    document.getElementById("boutons_reussis").style.display = "block";
}

function create_question() { // On suppose qu'il y a des questions dans window.questions
    // On tire au sort une question
    window.id_question = parseInt(Math.random() * window.questions.length);
    // On prépare les elements HTML
    titre.innerHTML = "Question : " + window.questions[window.id_question].titre;
    var txt = window.questions[window.id_question].texte;
    txt_result.innerHTML = Encoder.htmlDecode(txt);
    compile();
    // On n'affiche que les bons 
    document.getElementById("bt_aff").style.display = "block";
    div_result.style.display = "none";
    document.getElementById("boutons_reussis").style.display = "none";
    document.getElementById("boutons_fins").style.display = "none";
    document.getElementById("p_score").style.display = "block";

}

function rate() {
    window.nb_questions_faites += 1;
    window.questions_rates.push(window.questions[window.id_question]);
    window.questions.splice(window.id_question, 1);
    next_state();
}

function reussi() {
    window.nb_questions_faites += 1;
    window.score += 1;
    window.questions_reussies.push(window.questions[window.id_question]);
    window.questions.splice(window.id_question, 1);
    next_state();
}

function update_score() {
    document.getElementById("s_score").innerHTML = window.score;
    document.getElementById("s_faites").innerHTML = window.nb_questions_faites;
    if (window.all_questions) {
        document.getElementById("s_restantes").innerHTML = window.questions.length;
    } else {
        document.getElementById("s_restantes").innerHTML = window.nb_questions - window.nb_questions_faites;
    }
}

function ecran_fin() {
    // On modifie les éléments
    titre.innerHTML = "Quiz fini ! Score : " + window.score + "/" + window.nb_questions_faites + " (" + parseInt(window.score / window.nb_questions_faites * 100.0) + "%)";
    // On affiche que les bonnes choses
    document.getElementById("p_score").style.display = "none";
    document.getElementById("boutons_fins").style.display = "block";
    document.getElementById("boutons_reussis").style.display = "none";
    div_result.style.display = "none";
}

function desactiver_connus() {
    var questions_reussies = JSON.stringify(window.questions_reussies);
    request_iframe();
}