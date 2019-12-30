$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="item[item_images_attributes][${num}][image]"
                    id="item_item_images_attributes_${num}_image"><br>
                  </div>`;
    return html;
  }

  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<div class=label>
                    <img data-index="${index}" src="${url}" width="114px" height="72px">
                    <div class="js">
                      <a class="js-edit">編集</a>
                      <a class="js-remove">削除</a>
                    </div>
                  </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('#image-box__container').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('#previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box__container').append(buildFileField(fileIndex[0]));
      $(this).parent().hide();

      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
      if ($('.label').length == 10) $('#image-box__container').hide();
    }
  });
  var dataBox = new DataTransfer();
  var file_field = document.querySelector('input[type=file]')
  $(document).on("click", '.js-remove', function(){
    //プレビュー要素を取得
    var target_image = $(this).parent().parent()
    var num = $(this).parent().parent().children('img').data('index')
    $(this).parent().parent().parent().parent().children('.item-num-0').children().children('input[id*=num]').remove()
    //DataTransferオブジェクトに入ったfile一覧をfile_fieldの中に再度代入
    file_field.files = dataBox.files
    //プレビューを削除
    target_image.remove();
    //image-box__containerクラスをもつdivタグのクラスを削除のたびに変更
    var num = $('.label').length
    $('#image-box-1').attr('class', `item-num-${num}`)
  })
});