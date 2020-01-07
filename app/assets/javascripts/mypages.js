var active1 = 'is-active1'
var show1 = 'is-show1'
var tab1 = 'tab1'
var panel1 = 'panel1'
var active2 = 'is-active2'
var show2 = 'is-show2'
var tab2 = 'tab2'
var panel2 = 'panel2'

document.addEventListener('DOMContentLoaded', function(){
	// タブに対してクリックイベントを適用
	const tabs = document.getElementsByClassName(tab1);
	for(let i = 0; i < tabs.length; i++) {
		tabs[i].addEventListener('click', tabSwitch);
	}

	// タブをクリックすると実行する関数
	function tabSwitch(){
		// タブのclassの値を変更
		document.getElementsByClassName(active1)[0].classList.remove(active1);
		this.classList.add(active1);
		// コンテンツのclassの値を変更
		document.getElementsByClassName(show1)[0].classList.remove(show1);
		const arrayTabs = Array.prototype.slice.call(tabs);
		const index = arrayTabs.indexOf(this);
		document.getElementsByClassName(panel1)[index].classList.add(show1);
	};
});

document.addEventListener('DOMContentLoaded', function(){
	// タブに対してクリックイベントを適用
	const tabs = document.getElementsByClassName(tab2);
	for(let i = 0; i < tabs.length; i++) {
		tabs[i].addEventListener('click', tabSwitch);
	}

	// タブをクリックすると実行する関数
	function tabSwitch(){
		// タブのclassの値を変更
		document.getElementsByClassName(active2)[0].classList.remove(active2);
		this.classList.add(active2);
		// コンテンツのclassの値を変更
		document.getElementsByClassName(show2)[0].classList.remove(show2);
		const arrayTabs = Array.prototype.slice.call(tabs);
		const index = arrayTabs.indexOf(this);
		document.getElementsByClassName(panel2)[index].classList.add(show2);
	};
});