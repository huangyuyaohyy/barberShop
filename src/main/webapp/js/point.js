/**
 * 查询积分
 * 通过会员姓名
 */
$(function () {
    $("#search").click(function () {
            $.ajax({
                type:"POST",
                url:"members/memberExist",
                data:$("#form-select").serialize(),
                dataType:"json",
                success:function (data) {
                    // 存在该会员姓名
                    if(data.msg=="be"){
                        var memberName=document.querySelector("#memberName").value;
                        window.location.href = 'members/selectByMemberName?memberName='+memberName;
                    }
                    // 不存在该会员姓名
                    else {
                        alert("不存在此会员！");
                    }
                }
            })

        })
})
