function updateTotal() {
    var checkboxes = document.getElementsByClassName('item-checkbox');
    var total = 0;
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            var row = checkboxes[i].closest('tr');
            var price = parseFloat(row.cells[2].innerText);
            var quantity = parseInt(row.querySelector('input[type=number]').value);
            var itemTotal = price * quantity;
            row.cells[4].innerText = itemTotal.toFixed(2);
            total += itemTotal;
        }
    }
    document.getElementById('cart-total').innerText = total.toFixed(2);
}

function toggleSelectAll(selectAllCheckbox) {
    var checkboxes = document.getElementsByClassName('item-checkbox');
    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = selectAllCheckbox.checked;
    }
    updateTotal();
}

document.addEventListener('DOMContentLoaded', function() {
    var checkboxes = document.getElementsByClassName('item-checkbox');
    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].addEventListener('change', updateTotal);
    }
    updateTotal();
});