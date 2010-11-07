var Whurl = {
    computePermalink: function() {

    },
    addHeader: function() {
        var $headerFields = $('.header_pair:last').clone();
        $headerFields.children('input').val("");
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
        $paramFields.hide().appendTo('#params');
        $paramFields.slideDown('fast');
    },
    deleteParam: function(element) {
        var $paramFields = $(element).closest(".param_pair");
        $paramFields.slideUp(function() {
            $paramFields.remove();
        });
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
});