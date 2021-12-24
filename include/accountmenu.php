<div id="accountmenu" class="col accountmenu cache">
    <?php
        if($est_connecte){
            include "../include/account_menu/connecte.php";
        }
        else{
            include "../include/account_menu/non_connecte.php";
        }
    ?>
</div>