//イメージ10枚追加できる仕様に後ほど修正
$(function () {
    
    function changeClass() {
        $('.sell-upload-items').removeClass('have-item-0');
        $('.sell-upload-items').addClass('have-item-1');
    }
    
   function buildImages1(item_imageUrl) {
       var img = item_imageUrl;
       var html =
           `<li class="sell-upload-item">
              <figure class="sell-upload-items--image">
                 ${ img }
                </figure>
              <div class="sell-upload-items--image--button">
                 <a class="sell-upload-items--image--button--edit">編集</a>
                 <a href>削除</a>               
                </div>    
             </li>`;
       changeClass();
       return html
   }

   $(function() {
       function readURL(input) {
           if (input.files && input.files[0]) {
               var reader = new FileReader();
               reader.onload = function (e) {
                   $('#item_registration_form_item_images_attributes_image').attr('src', e.result);
               };
               reader.readAsDataURL(input.files[0]);
           }
       }
       $("#item_registration_form_item_images_attributes_image").change(function () {
           $('#upload-images').append(buildImages1(readURL(this)));
       })
   });
});