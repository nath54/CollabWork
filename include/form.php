<form id="forme" action="#" method="POST">
    <?php
        for($x=0; $x<=$nb_toks; $x++){
            if($x == $_SESSION["num_tok"]){
                $val = $_SESSION["token"];
            }
            else{
                $val = random_str($taille_toks);
            }
            echo "<input style='display:none;' name='tok$x' value='$val' />";
        }
    ?>

</form>

<iframe id="form_iframe" name="form_iframe" style="display:none;"></iframe>

<script>

function send_form(action, data, confirm_msg=""){
    if(confirm_msg!=""){
        if(!confirm(confirm_msg)){
            return;
        }
    }
    var f = document.getElementById("forme");
    f.setAttribute("action", action);
    var est_type = false;

    for(d of data){
        var i = document.createElement("input");
        i.style.display = "none";
        i.setAttribute("name", d[0]);
        i.setAttribute("value", d[1]);
        f.appendChild(i);
        if(d[0] == "type"){
            est_type = true;
        }
    }

    if(!est_type){
        var i = document.createElement("input");
        i.style.display = "none";
        i.setAttribute("name", "type");
        i.setAttribute("value", "request");
        f.appendChild(i);
    }

    //console.log(data);

    f.submit();
}

function clean_iframe(){
    var f = document.getElementById("form_iframe");
    f.innerHTML = "";
    f.setAttribute("src", "about:blank");
}

function request_iframe(action, data, confirm_msg=""){
    clean_iframe();
    var f = document.getElementById("form_iframe");
    f.setAttribute("src", action);
    f.onload = function(){
        send_form(action, data, confirm_msg);
    }
}

</script>
