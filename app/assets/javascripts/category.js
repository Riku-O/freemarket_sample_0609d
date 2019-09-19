$(function () {
    function buildSelect(){
        var html = `
            <div class="select-wrap">
              <i class="fa fa-angle-down"></i>
              <select class="select-default"></select>
              </div>`
        $('#appending_form').append(html)
    }
    function buildSelectOption(){

    }

    $().on('change', function () {
        var category = $(this).val();
        var url = $(this).attr('action');
        $.ajax({
            url: url,
            type: 'GET',
            data: category,
            dataType: 'json',
            processData: false,
            contentType: false
        })
        .done(function () {
            buildSelect();
            buildSelectOption();
        })
    })
});