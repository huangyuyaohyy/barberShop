/**
 * 添加理发师信息
 */
$(document).ready(function() {
    $("#barber_add").click(function () {
        var barberName=document.getElementById("barberName").value;

        if(barberName!=""){
        $.ajax({
            type:"POST",
            url:"barbers/add",
            data:$("#form").serialize(),
            dataType:"json",
            success:function (data) {
                if(data.msg=="success"){
                    alert("添加成功！");
                    window.location.href = 'barbers/barberList';
                }else {
                    alert("添加失败！");
                }
            }
        })}
        else{
            alert("姓名不能为空！");
        }

    })
})


/**
 * 修改理发师信息
 */
$(function () {
    $("#barber_edit").click(function () {
        var barberName=document.getElementById("barberName").value;
        if(barberName!=""){
        $.ajax({
            type:"POST",
            url:"barbers/edit",
            data:$("#form").serialize(),
            dataType:"json",
            success:function (data) {
                if(data.msg=="success"){
                     alert("修改成功！");
                     window.location.href = 'barbers/barberList';

                }else {
                     alert("修改失败！");
                }
            }
        })

    }})
})

