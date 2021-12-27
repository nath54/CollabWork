function toggle_vosgroupes() {
    var div = document.getElementById("div_vosgroupes");
    var triangle = document.getElementById("triangle1");
    if (div.style.display == "none") {
        div.style.display = "block";
        triangle.style.transform = "rotate(90deg)";
    } else {
        div.style.display = "none";
        triangle.style.transform = "rotate(0)";
    }
}

function toggle_groupes_appartient() {
    var div = document.getElementById("div_groupes_appartient");
    var triangle = document.getElementById("triangle2");
    if (div.style.display == "none") {
        div.style.display = "block";
        triangle.style.transform = "rotate(90deg)";
    } else {
        div.style.display = "none";
        triangle.style.transform = "rotate(0)";
    }
}

function toggle_public() {
    var div = document.getElementById("div_public");
    var triangle = document.getElementById("triangle3");
    if (div.style.display == "none") {
        div.style.display = "block";
        triangle.style.transform = "rotate(90deg)";
    } else {
        div.style.display = "none";
        triangle.style.transform = "rotate(0)";
    }
}