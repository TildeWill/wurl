var headers = ["Accept",
    "Accept-Charset",
    "Accept-Encoding",
    "Accept-Language",
    "Authorization",
    "Cache-Control",
    "Connection",
    "Cookie",
    "Content-Length",
    "Content-MD5",
    "Content-Type",
    "Date",
    "Expect",
    "From",
    "Host",
    "If-Match",
    "If-Modified-Since",
    "If-None-Match",
    "If-Range",
    "If-Unmodified-Since",
    "Max-Forwards",
    "Pragma",
    "Proxy-Authorization",
    "Range",
    "Referer",
    "TE",
    "Upgrade",
    "User-Agent",
    "Via",
    "Warning"];


var Whurl = {
    addHeader:function (elem) {
        var $form = $(elem).closest('form');
        var $fields = $form.find('.header_pair').first().clone();
        $fields.children('input').val("").attr('disabled', false);
        $fields.hide().appendTo($form.find('.headers')).slideDown('fast');
    },
    deleteHeader:function (element) {
        var $paramFields = $(element).closest(".header_pair");
        $paramFields.slideUp(function () {
            $paramFields.remove();
        });
    },
    addParam:function (elem) {
        var $form = $(elem).closest('form');
        var $fields = $form.find('.param_pair').first().clone();
        $fields.children('input').val("").attr('disabled', false);
        $fields.hide().appendTo($form.find('.params')).slideDown('fast');
    },
    deleteParam:function (element) {
        var $paramFields = $(element).closest(".param_pair");
        $paramFields.slideUp(function () {
            $paramFields.remove();
        });
    },
    trashHeaders:function (elem) {
        $(elem).closest('form').find(".header_pair:visible").each(function (i, element) {
            $(element).slideUp(function () {
                $(element).remove();
            });
        });
        Whurl.addHeader(elem);
    },
    trashQueries:function (elem) {
        $(elem).closest('form').find(".param_pair:visible").each(function (i, element) {
            $(element).slideUp(function () {
                $(element).remove();
            });
        });
        Whurl.addParam(elem);
    },
    updateBodyInput:function (elem) {
        var method = $(elem).val();
        if ($.inArray(method, ["PUT", "POST"]) > -1) {
            $('#whurl_request_body').attr('disabled', false).removeClass('textarea_disabled');
        } else {
            $('#whurl_request_body').attr('disabled', true).addClass('textarea_disabled');
        }
    }
};

$(document).ready(function () {
    $(".header_pair input.key").livequery(function() {
        $(this).autocomplete({source:headers});
    });

    $('.header_pair input.value').live('focusin', (function () {
        if ($(this).closest('form').find('.header_pair:last input').val() != "") {
            Whurl.addHeader(this);
        }
    }));

    $('.param_pair input.value').live('focusin', (function () {
        if ($(this).closest('form').find('.param_pair:last input').val() != "") {
            Whurl.addParam(this);
        }
    }));

    $(".clear_fields").click(function () {
        var $form = $(this).closest('form');
        $form.find("input[type=text], textarea").val("");
        Whurl.trashHeaders(this);
        Whurl.trashQueries(this);
    });

    $('.add_header').click(function () {
        Whurl.addHeader(this);
    });

    $('.delete_header').live('click', function () {
        Whurl.deleteHeader(this);
    });

    $('.add_param').click(function () {
        Whurl.addParam(this);
    });

    $('.delete_param').live('click', function () {
        Whurl.deleteParam(this);
    });

    $(".trash_headers").click(function () {
        Whurl.trashHeaders(this);
    });

    $(".trash_queries").click(function () {
        Whurl.trashQueries(this);
    });

    $('.url select').change(function () {
        Whurl.updateBodyInput(this);
    });
//    Whurl.updateBodyInput();
});
