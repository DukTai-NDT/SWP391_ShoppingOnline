document.addEventListener('DOMContentLoaded', () => {
    // Lọc đơn hàng theo trạng thái
    const statusLinks = document.querySelectorAll('.breadcrumb-item');
    const rows = document.querySelectorAll('.table tbody tr');

    statusLinks.forEach(link => {
        link.addEventListener('click', (e) => {
            e.preventDefault();
            const selectedStatus = link.getAttribute('data-status');

            // Xóa trạng thái active khỏi tất cả các tab
            statusLinks.forEach(s => s.removeAttribute('aria-current'));
            link.setAttribute('aria-current', 'page');

            rows.forEach(row => {
                const rowStatus = row.getAttribute('data-status');
                if (selectedStatus === 'all' || rowStatus === selectedStatus) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });
    });

    // Thêm sự kiện cho các nút
    document.querySelectorAll('.btn-rate').forEach(button => {
        button.addEventListener('click', () => {
            alert('Đánh giá đơn hàng!');
        });
    });

    document.querySelectorAll('.btn-buy').forEach(button => {
        button.addEventListener('click', () => {
            alert('Mua lại sản phẩm!');
        });
    });

    document.querySelectorAll('.btn-cancel').forEach(button => {
        button.addEventListener('click', () => {
            if (confirm('Bạn có chắc muốn hủy đơn hàng này?')) {
                alert('Đơn hàng đã được hủy!');
            }
        });
    });

    document.querySelectorAll('.btn-track').forEach(button => {
        button.addEventListener('click', () => {
            alert('Theo dõi đơn hàng!');
        });
    });

    document.getElementById('viewMoreBtn').addEventListener('click', () => {
        alert('Tải thêm đơn hàng!');
    });
});