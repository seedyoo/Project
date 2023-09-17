// 버튼 요소와 카드 정보 요소들을 가져옵니다.
const editButton = document.getElementById('edit-button');
const deleteButton = document.getElementById('delete-button');
const cardContent = document.querySelector('.card-content');
const editForm = document.querySelector('.edit-form');

// 수정 버튼 클릭 시 수정 폼을 보여주는 이벤트 리스너를 추가합니다.
editButton.addEventListener('click', () => {
    // 카드 정보 숨깁니다.
    cardContent.style.display = 'none';

    // 수정 폼을 보여줍니다.
    editForm.style.display = 'block';

    // TODO: 수정 폼에 카드 정보를 불러와서 표시하는 로직을 추가하세요.
});

// 삭제 버튼 클릭 시 카드를 삭제하는 이벤트 리스너를 추가합니다.
deleteButton.addEventListener('click', () => {
    // TODO: 카드 삭제 로직을 추가하세요.
});


