function searchPosts() {
    var searchInput = document.getElementById('searchInput').value.toLowerCase();
    var postItems = document.querySelectorAll('.om_post-item');

    postItems.forEach(function (item) {
        var postTitle = item.querySelector('h2').textContent.toLowerCase();

        if (postTitle.includes(searchInput)) {
            item.style.display = 'block'; 
        } else {
            item.style.display = 'none'; 
        }
    });
}