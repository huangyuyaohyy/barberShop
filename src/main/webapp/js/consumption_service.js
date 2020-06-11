/**
 * 添加消费服务信息
 */
$(document).ready(function() {
    $("#consumption_service_add").click(function () {
        var serviceName=document.getElementById("serviceName").value;
        var price=document.getElementById("price").value;

        if(serviceName!=""&&price!=""){
            $.ajax({
                type:"POST",
                url:"consumption_services/add",
                data:$("#form").serialize(),
                dataType:"json",
                success:function (data) {
                    if(data.msg=="success"){
                        alert("添加成功！");
                        window.location.href = 'consumption_services/consumption_serviceList';
                    }else {
                        alert("添加失败！");
                    }
                }
            })}
        else{
            alert("名称、价格不能为空！");
        }

    })
})


/**
 * 修改消费服务信息
 */
$(function () {
    $("#consumption_service_edit").click(function () {

        var serviceName=document.getElementById("serviceName").value;
        var price=document.getElementById("price").value;

        if(serviceName!=""&&price!=""){
        $.ajax({
            type:"POST",
            url:"consumption_services/edit",
            data:$("#form").serialize(),
            dataType:"json",
            success:function (data) {
                if(data.msg=="success"){
                    alert("修改成功！");
                    window.location.href = 'consumption_services/consumption_serviceList';

                }else {
                    alert("修改失败！");
                }
            }
        })

    }})
})
