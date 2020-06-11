/**
 * 添加礼品信息
 */
$(document).ready(function() {
    $("#gift_add").click(function () {
        var giftName=document.getElementById("giftName").value;
        var num=document.getElementById("num").value;
        var exchangePoint=document.getElementById("exchangePoint").value;
        if(giftName!=""&&num!=""&&exchangePoint!=""){
            $.ajax({
                type:"POST",
                url:"gifts/add",
                data:$("#form").serialize(),
                dataType:"json",
                success:function (data) {
                    if(data.msg=="success"){
                        alert("添加成功！");
                        window.location.href = 'gifts/giftList';
                    }else {
                        alert("添加失败！");
                    }
                }
            })}
        else{
            alert("名称、数量、所需积分不能为空！");
        }

    })
})


/**
 * 修改礼品信息
 */
$(function () {
    $("#gift_edit").click(function () {
        var giftName=document.getElementById("giftName").value;
        var num=document.getElementById("num").value;
        var exchangePoint=document.getElementById("exchangePoint").value;
        if(giftName!=""&&num!=""&&exchangePoint!=""){
            $.ajax({
                type:"POST",
                url:"gifts/edit",
                data:$("#form").serialize(),
                dataType:"json",
                success:function (data) {
                    if(data.msg=="success"){
                        alert("修改成功！");
                        window.location.href = 'gifts/giftList';

                    }else {
                        alert("修改失败！");
                    }
                }
            })

        } else{
            alert("名称、数量、所需积分不能为空！");
        }
    })

})

    /**
     * 点击兑换
     */
    function exchange(giftId,pointId) {
        $.ajax({
            type:"GET",
            url:"point_gifts/exchange?giftId="+giftId+"&pointId="+pointId,
            dataType:"json",
            success:function (data) {
                if(data.msg =="success")
                {
                    alert("兑换成功！请到店领取~!");
                    window.location.href = 'members/pointShop?memberName='+data.para;
                }else if(data.msg =="pointNo"){
                    alert("积分不足!");
                }
                else if(data.msg =="NumNo"){
                    alert("数量不足!");
                }
                else {
                    alert("兑换失败");
                }
            }
        });
    }
