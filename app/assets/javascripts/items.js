$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = (num)=> {
    const html = `<label data-index="${num}" class="item-num-0">
                    <input class="js-file" type="file"
                    name="item[item_images_attributes][${num}][image]"
                    id="item_item_images_attributes_${num}_image">
                    <pre>ドラッグアンドドロップ<br>またはクリックしてファイルをアップロード</pre>
                  </label>`;
    return html;
  }

  // プレビュー用のimgタグを生成する関数
  const buildImg = (index=0, url)=> {
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
  let fileIndex = [0,1,2,3,4,5,6,7,8,9];
  // 既に使われているindexを除外
  lastIndex = $('.item-num-0:last').data('index');
  fileIndex.splice(0, lastIndex);

  if ($('.js-file').css("display")=="none"){
  $('.js-file:last').hide();
  $('#image-box__container').append(buildFileField(fileIndex[0]));
  }

  $('#image-box__container').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[1]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('#previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box__container').append(buildFileField(fileIndex[1]));
      $(this).parent().hide();

      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
      if ($('#previews').children().length == 10) $('#image-box__container').hide();
    }
  });
  $(document).on("click", '.js-remove', function(){
    var target_image = $(this).parent().parent()
    var target_image_id = target_image.children('img').attr(`data-index`)
    var target_value = $('.item-num-0').children(`input[id*="${target_image_id}"]`);
    target_image.remove();
    target_value.val("")
  });

  $(document).on("click", '.js-remove2', function(){
    var target_image = $(this).parent().parent()
    var target_image_id = target_image.children('img').attr('id')
    var target_value = $('.item-num-0').children(`input[id*="${target_image_id}__destroy"]`);
    target_image.remove();
    target_value.attr('value', 'true');
  });
});

