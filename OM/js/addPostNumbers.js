function addPostNumbers() {
    var postItems = document.querySelectorAll('.om_post-item');

    postItems.forEach(function (item, index) {
        var postNumber = document.createElement('span');
        postNumber.textContent = '게시물 ' + (index + 1) + ': ';
        item.insertBefore(postNumber, item.firstChild);
    });
}

window.addEventListener('load', addPostNumbers);