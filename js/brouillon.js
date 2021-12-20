var input = document.getElementById("texte")
var div_result = document.getElementById("result");
var converter = new showdown.Converter();

function compile() {
    // Nettoyage
    for (c of div_result.children) {
        div_result.removeChild(c);
    }
    // Update
    div_result.innerHTML = converter.makeHtml(input.value);
    // Compilation
    MathJax.typesetPromise();
}