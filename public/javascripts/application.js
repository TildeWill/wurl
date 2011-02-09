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
        $headerFields.slideDown('fast');
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
        $paramFields.slideDown('fast');
    },
    deleteParam: function(element) {
        var $paramFields = $(element).closest(".param_pair");
        $paramFields.slideUp(function() {
            $paramFields.remove();
        });
    },
    updateBodyInput: function() {
        if($.inArray($('#http_method').val(), ["PUT", "POST"]) > -1) {
            $('textarea#body').attr('disabled', false);
            $('textarea#body').removeClass('textarea_disabled');
        } else {
            $('textarea#body').attr('disabled', true);
            $('textarea#body').addClass('textarea_disabled');
        }
    }
};

$(document).ready(function() {
    $('#add_header').click(function() {
        Whurl.addHeader();
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

    $('#http_method').change(function() {
        Whurl.updateBodyInput();
    });
    Whurl.updateBodyInput();
});