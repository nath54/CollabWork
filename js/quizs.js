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