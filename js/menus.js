function toggle_sidemenu() {
    var bt = document.getElementById("bt_hamburger");
    if (bt.classList.contains('menu_3bandes_down')) {
        bt.classList.remove('menu_3bandes_down');
    } else {
        bt.classList.add('menu_3bandes_down');
    }
    var m = document.getElementById("sidemenu");
    if (m.classList.contains("sidemenu_open")) {
        m.classList.remove("sidemenu_open");
    } else {
        m.classList.add("sidemenu_open");
    }
}

function toggle_account_menu() {
    var m = document.getElementById("accountmenu");
    if (m.classList.contains("account_menu_cache")) {
        m.classList.remove("account_menu_cache");
    } else {
        m.classList.add("account_menu_cache");
    }
}