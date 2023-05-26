$(document).ready(function () {
    $(".nav-link.active .sub-menu").slideDown();
    // $("p").slideUp();

    $("#sidebar-menu .arrow").click(function () {
        $(this).parents("li").children(".sub-menu").slideToggle();
        $(this).toggleClass("fa-angle-right fa-angle-down");
    });

    $("input[name='checkall']").click(function () {
        var checked = $(this).is(":checked");
        $(".table-checkall tbody tr td input:checkbox").prop(
            "checked",
            checked
        );
    });
});

$(function () {
    var inputFile = $("#file");
    $("#upload_single_bt").click(function (event) {
        var URI_single = $("#form-upload-single #file").attr("data-uri");
        var fileToUpload = inputFile[0].files[0];
        var formData = new FormData();
        formData.append("file", fileToUpload);
        $.ajax({
            url: URI_single,
            type: "post",
            data: formData,
            contentType: false,
            processData: false,
            dataType: "json",
            success: function (data) {
                console.log(data);
                if (data.status == "ok") {
                    showThumbUpload(data);
                    $("#thumbnail_url").val(data.file_path);
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(xhr.status);
                alert(thrownError);
            },
        });
        return false;
    });

    function showThumbUpload(data) {
        var items;
        items = '<img src="' + data.file_path + '"/>';
        $("#show_list_file").html(items);
    }
});
