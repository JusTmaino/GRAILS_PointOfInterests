$(function() {
    $( ".sortable_list" ).sortable({
        connectWith: ".connectedSortable",
        receive: function(event, ui) {
            //alert(ui.item[0].innerHTML.substring(44,45)); // Where the item is dropped
            //alert("sender = " + ui.sender[0].id);
            if(ui.item[0].innerHTML.substring(45,46).includes('"'))
                window.location='/groupe/index?oldGroupeID='+ui.sender[0].id+'&newGroupeID='+this.id+'&pointID='+ui.item[0].innerHTML.substring(44,45);
            else
                window.location='/groupe/index?oldGroupeID='+ui.sender[0].id+'&newGroupeID='+this.id+'&pointID='+ui.item[0].innerHTML.substring(44,46);
        }
    }).disableSelection();
});