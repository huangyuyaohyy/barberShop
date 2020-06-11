/**
 * 查询未领取
 * 通过会员姓名
 */
$(function () {
    $("#searchZore").click(function () {
        $.ajax({
            type:"POST",
            url:"members/memberExist",
            data:$("#form-select").serialize(),
            dataType:"json",
            success:function (data) {
                // 存在该会员姓名
                if(data.msg=="be"){
                    var memberName=document.querySelector("#memberName").value;
                    window.location.href = 'point_gifts/selectByNameZore?memberName='+memberName;
                }
                // 不存在该会员姓名
                else {
                    alert("不存在此会员！");
                }
            }
        })

    })
})
/**
 * 查询已领取
 * 通过会员姓名
 */
$(function () {
    $("#searchOne").click(function () {
        $.ajax({
            type:"POST",
            url:"members/memberExist",
            data:$("#form-select").serialize(),
            dataType:"json",
            success:function (data) {
                // 存在该会员姓名
                if(data.msg=="be"){
                    var memberName=document.querySelector("#memberName").value;
                    window.location.href = 'point_gifts/selectByNameOne?memberName='+memberName;
                }
                // 不存在该会员姓名
                else {
                    alert("不存在此会员！");
                }
            }
        })

    })
})



/**
 * 到店兑换
 */
function dealToFact(pointGiftId) {
        $.ajax({
            type:"GET",
            url:"point_gifts/dealToFact?pointGiftId="+pointGiftId,
            dataType:"json",
            success:function (data) {
                if(data.msg =="success")
                {
                    alert("领取成功！");
                    window.location.href = 'point_gifts/point_giftList';
                }else {
                    alert("领取失败！");
                }
            }
        });
}