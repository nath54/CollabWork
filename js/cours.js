function toggle_voscours() {
    var div = document.getElementById("div_voscours");
    var t = document.getElementById("triangle");
    if (div.style.display == "none") {
        div.style.display = "flex";
        t.style.transform = "rotate(90deg)";
    } else {
        div.style.display = "none";
        t.style.transform = "rotate(0)";
    }
}

function aff_vosgroupes() {
    var bt1 = document.getElementById("bt_vosgroupes");
    var bt2 = document.getElementById("bt_public");
    var div1 = document.getElementById("div_vosgroupes");
    var div2 = document.getElementById("div_public");
    if (!bt1.classList.contains("souligne")) { bt1.classList.add("souligne"); }
    if (bt2.classList.contains("souligne")) { bt2.classList.remove("souligne"); }
    div1.style.display = "flex";
    div2.style.display = "none";
}

function aff_public() {
    var bt2 = document.getElementById("bt_vosgroupes");
    var bt1 = document.getElementById("bt_public");
    var div2 = document.getElementById("div_vosgroupes");
    var div1 = document.getElementById("div_public");
    if (!bt1.classList.contains("souligne")) { bt1.classList.add("souligne"); }
    if (bt2.classList.contains("souligne")) { bt2.classList.remove("souligne"); }
    div1.style.display = "flex";
    div2.style.display = "none";
}