
// 
function displayDateTime() {
    const currentTimeElement = document.getElementById("current-time");
    const currentDateElement = document.getElementById("current-date");

    const now = new Date();
    const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
    const formattedDate = now.toLocaleDateString('en-US', options);
    const formattedTime = now.toLocaleTimeString('en-US');

    currentTimeElement.textContent = `현재 시간: ${formattedTime}`;
    currentDateElement.textContent = `오늘의 날짜: ${formattedDate}`;
}

// 페이지 로드시 시간 날짜
window.onload = function() {
    displayDateTime();
    // 실시간
    setInterval(displayDateTime, 1000);
};
