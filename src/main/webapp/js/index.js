$(document).ready(function(){
    $("dd").hide();
    var n1=0;
    var n2=0;
    var n3=0;
    var n4=0;
    $("#show1").click(function(){
        n1=n1+1;
        if(n1%2!=0) {
            $("#show11").show();
        }
        else{
            $("#show11").hide();
        }
    });

    $("#show2").click(function(){
        n2=n2+1;
        if(n2%2!=0) {
            $("#show22").show();
        }
        else{
            $("#show22").hide();
        }
    });

    $("#show3").click(function(){
        n3=n3+1;
        if(n3%2!=0) {
            $("#show33").show();
        }
        else{
            $("#show33").hide();
        }
    });

    $("#show4").click(function(){
        n4=n4+1;
        if(n4%2!=0) {
            $("#show44").show();
        }
        else{
            $("#show44").hide();
        }
    });

    $("#show5").click(function(){
        n2=n2+1;
        if(n2%2!=0) {
            $("#show55").show();
        }
        else{
            $("#show55").hide();
        }
    });
});