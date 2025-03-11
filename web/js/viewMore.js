document.addEventListener("DOMContentLoaded", function () {
    const hiddenItems = document.querySelectorAll('.hidden-item');
    const viewMoreBtn = document.getElementById('viewMoreBtn');

    // Ẩn tất cả sản phẩm có class "hidden-item" khi trang tải
    hiddenItems.forEach(item => {
        item.style.display = 'none';
    });

    function toggleViewMore() {
        let isHidden = false;
        hiddenItems.forEach(item => {
            if (item.style.display === 'none') {
                item.style.display = 'table-row'; // Hiển thị sản phẩm ẩn
                isHidden = true;
            } else {
                item.style.display = 'none'; // Ẩn lại nếu nhấn lần nữa
            }
        });

        // Cập nhật text của nút
        viewMoreBtn.textContent = isHidden ? 'View Less' : 'View More';
    }

    // Gắn sự kiện click vào nút View More
    viewMoreBtn.addEventListener('click', toggleViewMore);
});
