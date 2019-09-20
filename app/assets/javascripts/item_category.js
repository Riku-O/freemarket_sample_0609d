$(function () {
    function buildSelect(){
        var html = `
            <div class="select-wrap" id="subcategory">
              <i class="fa fa-angle-down"></i>
              <select class="select-default subcategory-select" name="item_registration_form[category_id]" id="item_registration_form_category_id">
                <option value=""> --- </option>
                </select>
              </div>`
        $('#appending_form').append(html);
        $('.subcategory-select').on('change', function () {
            var sub_category_id = $(this).val();
            $.ajax({
                url: '/categories',
                type: 'GET',
                data: {category_id: sub_category_id},
                dataType: 'json'
            })
            .done(function (sub_categories) {
                if (sub_categories.length === 0) {
                    return false
                } else {
                    buildSelect();
                    sub_categories.forEach(function (sub_category) {
                        buildSelectOption(sub_category)
                    });
                }
            })
        })
    }
    function buildSelectOption(subcategory){
        var html =
            `<option value="${ subcategory.id }">
               ${ subcategory.name }
              </option>`
        $('.subcategory-select').append(html);
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
        return html
    }

    $(document).on('change', '.parent-category', function () {
        var category_id = $(this).val();
        $.ajax({
            url: '/categories',
            type: 'GET',
            data: {category_id: category_id},
            dataType: 'json'
        })
        .done(function (sub_categories) {
            if (sub_categories.length === 0){
                $('.subcategory-select').empty();
                $('.subcategory-select').remove();
                $('#subcategory').remove();
            } else {
                buildSelect();
                sub_categories.forEach(function (sub_category) {
                    buildSelectOption(sub_category)
                });
            }
        });
    });
});