/**
 * 添加消费记录信息
 */
$(document).ready(function() {
    $("#consumption_add_byMember").click(function () {

        $.ajax({
            type: "POST",
            url: "consumption_records/add",
            data: $("#form").serialize(),
            dataType: "json",
            success: function (data) {
                if (data.msg == "success") {
                    alert("添加成功！");
                    window.location.href = 'consumption_records/consumption_recordList';
                } else {
                    alert("添加失败！");
                }
            }
        })


    })
})


/**
 * 修改消费记录信息
 */
$(function () {
    $("#consumption_record_edit").click(function () {

            $.ajax({
                type:"POST",
                url:"consumption_records/edit",
                data:$("#form").serialize(),
                dataType:"json",
                success:function (data) {
                    if(data.msg=="success"){
                        alert("修改成功！");
                        window.location.href = 'consumption_records/consumption_recordList';

                    }else {
                        alert("修改失败！");
                    }
                }
            })

        })
})

/**
 * 查询消费记录
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
                    window.location.href = 'consumption_records/selectByName?memberName='+memberName;
                }
                // 不存在该会员姓名
                else {
                    alert("不存在此会员！");
                }
            }
        })

    })
})

