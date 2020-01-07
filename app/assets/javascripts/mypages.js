document.addEventListener('DOMContentLoaded', function(){
	// タブに対してクリックイベントを適用
	const tabs = document.getElementsByClassName('tab1');
	for(let i = 0; i < tabs.length; i++) {
		tabs[i].addEventListener('click', tabSwitch);
	}

	// タブをクリックすると実行する関数
	function tabSwitch(){
		// タブのclassの値を変更
		document.getElementsByClassName('is-active1')[0].classList.remove('is-active1');
		this.classList.add('is-active1');
		// コンテンツのclassの値を変更
		document.getElementsByClassName('is-show1')[0].classList.remove('is-show1');
		const arrayTabs = Array.prototype.slice.call(tabs);
		const index = arrayTabs.indexOf(this);
		document.getElementsByClassName('panel1')[index].classList.add('is-show1');
	};
});

document.addEventListener('DOMContentLoaded', function(){
	// タブに対してクリックイベントを適用
	const tabs = document.getElementsByClassName('tab2');
	for(let i = 0; i < tabs.length; i++) {
		tabs[i].addEventListener('click', tabSwitch);
	}

	// タブをクリックすると実行する関数
	function tabSwitch(){
		// タブのclassの値を変更
		document.getElementsByClassName('is-active2')[0].classList.remove('is-active2');
		this.classList.add('is-active2');
		// コンテンツのclassの値を変更
		document.getElementsByClassName('is-show2')[0].classList.remove('is-show2');
		const arrayTabs = Array.prototype.slice.call(tabs);
		const index = arrayTabs.indexOf(this);
		document.getElementsByClassName('panel2')[index].classList.add('is-show2');
	};
});