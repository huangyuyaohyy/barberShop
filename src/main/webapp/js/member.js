/**
 * 注册
 * 添加会员信息
 */
$(function () {
    $("#member_add").click(function () {
        var name=document.querySelector("#memberName").value;
        var password=document.querySelector("#password").value;
        var password_again=document.querySelector("#password_again").value;
        var tel=document.querySelector("#tel").value;
        var birth=document.querySelector("#birth").value;
        if(name!=""&&password!=""&&password_again!=""&&tel!=""&&birth!="") {
            $.ajax({
                type: "POST",
                url: "members/add",
                data: $("#form").serialize(),
                dataType: "json",
                success: function (data) {
                    if (data.msg == "success") {
                        alert("注册成功");
                        window.location.href = 'jsp/member_login.jsp';
                    } else if (data.msg == "be") {
                        alert("用户名已经存在");
                        document.getElementById("memberName").value = "";
                    } else {
                        alert("注册失败");
                        window.location.href = 'jsp/register.jsp';
                    }
                }
            })
        }
        else {
            alert("请将必填项信息填写完整！");
        }
    })
})



/**
 * 会员修改会员信息
 */
$(function () {
    $("#edit").click(function () {

            $.ajax({
                type: "POST",
                url: "members/edit",
                data: $("#edit-form").serialize(),
                dataType: "json",
                success: function (data) {
                    if (data.msg == "success") {
                        alert("修改成功!");
                        var memberName=document.querySelector("#memberName").value;
                        window.location.href = 'members/information?memberName='+memberName;
                    } else {
                        alert("修改失败！");
                        var memberName=document.querySelector("#memberName").value;
                        window.location.href = 'members/information?memberName='+memberName;
                    }
                }
            })
    })
})
