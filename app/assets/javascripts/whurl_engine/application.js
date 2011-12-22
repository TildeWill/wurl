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
    computePermalink: function() {

    },
    addHeader: function() {
        var $headerFields = $('.header_pair:last').clone();
        $headerFields.children('input').val("");
        $headerFields.children('input').attr('disabled', false);
        $($headerFields.children('input')[1]).focusin(function() {
            if($('.header_pair:last').children('input').val() != "") {
                Whurl.addHeader();
            }
        });
        $headerFields.hide().appendTo('#headers');
        var temp = Whurl.addHeader;
        $headerFields.slideDown('fast', function () { Whurl.addHeader = temp; });

        $(".header_pair:last").children(":eq(0)").autocomplete({source: headers});

        Whurl.addHeader = function () {};
    },
    deleteHeader: function(element) {
        var $paramFields = $(element).closest(".header_pair");
        $paramFields.slideUp(function() {
            $paramFields.remove();
        });
    },
    addParam: function() {
        var $paramFields = $('.param_pair:last').clone();
        $paramFields.children('input').val("");
        $paramFields.children('input').attr('disabled', false);
        $($paramFields.children('input')[1]).focusin(function() {
            if($('.param_pair:last').children('input').val() != "") {
                Whurl.addParam();
            }
        });
        $paramFields.hide().appendTo('#params');
        var temp = Whurl.addParam;
        $paramFields.slideDown('fast',  function () { Whurl.addParam = temp; });
        Whurl.addParam = function () {};
    },
    deleteParam: function(element) {
        var $paramFields = $(element).closest(".param_pair");
        $paramFields.slideUp(function() {
            $paramFields.remove();
        });
    },
    updateBodyInput: function() {
        if($.inArray($('#whurl_request_http_method').val(), ["PUT", "POST"]) > -1) {
            $('textarea#whurl_request_body').attr('disabled', false);
            $('textarea#whurl_request_body').removeClass('textarea_disabled');
        } else {
            $('textarea#whurl_request_body').attr('disabled', true);
            $('textarea#whurl_request_body').addClass('textarea_disabled');
        }
    }
};

$(document).ready(function() {
    $(".header_pair:eq(1)").children(":eq(0)").autocomplete({source: headers});

    $('#add_header').click(function() {
        Whurl.addHeader();
    });

    $("#clearFields").click(function() {
        var restoreTextBox = $("#permalink_text_box").val();
       $("input[type=text]").val("");
       $("textarea").val("");
        $("#permalink_text_box").val(restoreTextBox);
    });

    $('.delete_header').live('click', function() {
        Whurl.deleteHeader(this);
    });

    $('#add_param').click(function() {
        Whurl.addParam();
    });

    $('.delete_param').live('click', function() {
        Whurl.deleteParam(this);
    });

    $('#permalink').click(function() {
        Whurl.generatePermalink();
    });

    $("#trashheaders").click(function() {
        $(".header_pair").each(function(i,e) {
           if (i != 0) {
               $(e).remove();
           }
        });
        Whurl.addHeader();
    });

    $("#trashqueries").click(function() {
        $(".param_pair").each(function(i,e) {
           if (i != 0) {
               $(e).remove();
           }
        });
        Whurl.addParam();
    });

    $('.header_pair').each(function(i) {
        $($(this).children('input')[1]).focusin(function() {
            if($('.header_pair:last').children('input').val() != "") {
                Whurl.addHeader();
            }
        });
    });

    $('.param_pair').each(function(i) {
        $($(this).children('input')[1]).focusin(function() {
            if($('.param_pair:last').children('input').val() != "") {
                Whurl.addParam();
            }
        });
    });

    $('#whurl_request_http_method').change(function() {
        Whurl.updateBodyInput();
    });
    Whurl.updateBodyInput();
});
