/**
 * Description:  后台管理 公告 JS代码
 * 创建日期: 5/4  14:28
 * @author: sjin QQ: 928990049
 */

/**
 * init
 */
$(function (){
    $(document).on('click', 'th input:checkbox', function () {
        var that = this;
        $(this).closest('table').find('tr > td:first-child input:checkbox')
            .each(function () {
                this.checked = that.checked;
                $(this).closest('tr').toggleClass('selected');
            });
    });
})
