$(document).on('turbolinks:load', function () {
    var input_tag = $('.sell-upload-drop-file-input');
    var images = [];
    var preview = $('.sell-upload-items ul');
    var img_container = $('.sell-upload-items');

    input_tag.on('change', function () {
        var file = $(this).prop('files')[0];
        var reader = new FileReader();
        var img = $(`<li class="sell-upload-item">
                  <figure class="sell-upload-figure landscape">
                    <img>
                  </figure>
                 </li>`);
        reader.onload = function (e) {
            var btn_wrapper = $(`<div class="sell-upload-button"><a class="sell-upload-edit">編集</a><a>削除</a></div>`);
            img.append(btn_wrapper);
            img.find("img").attr({
                src: e.target.result
            });
        };
        reader.readAsDataURL(file);
        images.push(img);

        if (images.length <= 4) {
            $.each(images, function (index, image) {
                preview.append(image);
            });
            $('.sell-upload-dropbox').css({
                'width': `calc(100% - (21% * ${images.length}))`,
                float: 'right'
            });
            img_container.css({
                'width': `calc(20% * ${images.length})`,
                display: 'block'
            });
        } else if (images.length === 5) {
            $.each(images, function (index, image) {
                preview.append(image);
            });
            $('.sell-upload-dropbox').css({
                display: 'none'
            });
            img_container.css({
                width: '100%'
            })
        }
    });
});
