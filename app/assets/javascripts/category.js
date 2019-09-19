$(function () {
    function buildSelect(){
        var html = `
            <div class="select-wrap" id="subcategory-select">
              <i class="fa fa-angle-down"></i>
              <select class="select-default"></select>
              </div>`
        $('#appending_form').append(html);
        $('#subcategory-select').append(buildBrand());
    }
    function buildSelectOption(){

    }
    function buildBrand(){
        var html =
            `<div class="form-group brand-text">
              <label>
                ブランド
                <span class="form-arbitrary">任意</span>
                </label>
              <div>
                <input class="input-default" placeholder="例）シャネル" value="" name="brand">
                </div>  
              </div>`
    }

    $('#parent-category').on('change', function () {
        var category = $(this).val();
        $.ajax({
            url: '/categories',
            type: 'GET',
            data: {category_id: category},
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