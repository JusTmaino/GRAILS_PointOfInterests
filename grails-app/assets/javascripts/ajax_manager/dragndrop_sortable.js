$(function() {
    $( ".sortable_list" ).sortable({
        connectWith: ".connectedSortable",
        receive: function(event, ui) {
            //alert(ui.item[0].innerHTML.substring(44,45)); // Where the item is dropped
            //alert("sender = " + ui.sender[0].childElementCount);
            if(ui.sender[0].childElementCount != 0) {
                if (ui.item[0].innerHTML.substring(62, 63).includes('"'))
                    window.location = '/groupe/index?oldGroupeID=' + ui.sender[0].id + '&newGroupeID=' + this.id + '&pointID=' + ui.item[0].innerHTML.substring(61, 62) + '&#mainBoxes';
                else
                    window.location = '/groupe/index?oldGroupeID=' + ui.sender[0].id + '&newGroupeID=' + this.id + '&pointID=' + ui.item[0].innerHTML.substring(62, 64) + '&#mainBoxes';
            }
            else {
                alert('Min 1 Point on a Group')
            }
        }
    }).disableSelection();
});