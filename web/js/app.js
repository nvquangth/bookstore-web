/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var type = "All";

//$.ajax({
//    url: "data/dataoutput.json",
//    dataType: "text",
//    success: function (data) {
//        obj = JSON.parse(data);
////        displayPageForAll();
//
////        showDetailBook();
//    },
//    error: function (data) {
//        alert("Failed");
//    }
//});

// $('.new-bookq').css('display','none');

// loc sach theo the loai
$('.filter-book-1').click(function () {
    var value = $(this).text();
    displayPageForType(value);
    type = value;
})

$('.filter-book-2').click(function () {
    var value = $(this).text();
    if (value == "All") {
        type = value;
    }
    switch (value) {
        case "All":
        {
            displayPageForAll();
            break;
        }
        case "TOP 10":
        {
            displayPageForTop(10);
            break;
        }
        case "TOP 20":
        {
            displayPageForTop(20);
            break;
        }
        case "TOP 30":
        {
            displayPageForTop(30);
            break;
        }
        case "Giá tăng dần":
        {
            sortBookForPrice_Ascending();
            displayPageForTop(obj.length);
            break;
        }
        case "Giá giảm dần":
        {
            sortBookForPrice_Decrease();
            displayPageForTop(obj.length);
            break;
        }
        case "0-50k":
        {
            displayPageForPrice(0, 50);
            break;
        }
        case "50k-100k":
        {
            displayPageForPrice(50, 100);
            break;
        }
        case "100k-150k":
        {
            displayPageForPrice(100, 150);
            break;
        }
        case "Trên 150k":
        {
            displayPageForPrice(150, 1000000);
            break;
        }
        case "Sách mới":
        {
            displayPageForNewBook();
            break;
        }
        case "Noti":
        {
            showNoti();
            break;
        }
        case "View1":
        {
            $('.bookq-container').removeClass('row-1');
            $('.bookq-container').addClass('row-3');
            break;
        }
        case "View2":
        {
            $('.bookq-container').removeClass('row-3');
            $('.bookq-container').addClass('row-1');
            break;
        }
        case "View3":
        {
            $('.bookq-container').removeClass('row-3');
            $('.bookq-container').removeClass('row-1');
            break;
        }
    }
})

function filterBookk(value) {

}

// sort book theo danh gia: giam dan
function sortBook() {
    for (var i = 0; i < obj.length; i++) {
        for (var j = 0; j < obj.length; j++) {
            if (obj[i].danhgia > obj[j].danhgia) {
                var tmp = obj[i];
                obj[i] = obj[j];
                obj[j] = tmp;
            }
        }
    }
}

// sort book theo gia tang dan
function sortBookForPrice_Ascending() {
    for (var i = 0; i < obj.length; i++) {
        for (var j = 0; j < obj.length; j++) {
            if (obj[i].gia < obj[j].gia) {
                var tmp = obj[i];
                obj[i] = obj[j];
                obj[j] = tmp;
            }
        }
    }
}

// sort book theo gia giam dan
function sortBookForPrice_Decrease() {
    for (var i = 0; i < obj.length; i++) {
        for (var j = 0; j < obj.length; j++) {
            if (obj[i].gia > obj[j].gia) {
                var tmp = obj[i];
                obj[i] = obj[j];
                obj[j] = tmp;
            }
        }
    }
}

function displayOneBook(book, dateCur) {
    // rate 
    var x = "<img class='star-rate st_1' src='image/star-icon.png'>";
    var rate = "";
    for (var j = 1; j <= book.danhgia; j++) {
        rate = rate + x;
    }

    // date: sach moi (30 ngay)
    var sNewBook = "<img class='new-bookq' src='image/new-icon.png' >";
    var dateb = new Date(book.date);
    var n = (dateCur - dateb) / (24 * 60 * 60 * 1000);
    if (n > 30) {
        sNewBook = "";
    }
    var result = "";
    result = result +
            "<div class='bookq-container'>" +
            "<div class='bookq'>" +
            "<a href='DetailBook.jsp?bookid=" + book.ma + "'><img class='photo-bookq' src='data/image/" + book.linkImage + "' /></a>" +
            "<div class='info_book'>" +
            "<p class='name-bookq'>" + book.ten + "</p>" +
            "<p class='author-bookq'>" + book.tacgia + "</p>" +
            "<p class='price-bookq'>" + book.gia + "</p>" +
            "<p class='type-bookq'>" + book.theloai + "</p>" +
            sNewBook +
            "<div class='rate-bookq'>" +
            rate +
            "</div>" +
            "</div>" +
            "</div>" +
            "</div>";
    return result;
}

// hien thi theo muc gia: 50k, 100k, 150k, ...
function displayPageForPrice(price1, price2) {
    $('.list-bookq').html("");
    var result = "";
    var dateCur = new Date();
    if (type == "All") {
        for (var i = 0; i < obj.length; i++) {
            if (obj[i].gia >= price1 && obj[i].gia < price2) {
                result = result + displayOneBook(obj[i], dateCur);
            }
        }
    } else {
        for (var i = 0; i < obj.length; i++) {
            if (obj[i].gia >= price1 && obj[i].gia < price2 && obj[i].theloai == type) {
                result = result + displayOneBook(obj[i], dateCur);
            }

        }
    }
    $(".list-bookq").append(result);
//    showDetailBook();
}

// top 10, 20, 30
function displayPageForTop(length) {
    $('.list-bookq').html("");
    var result = "";
    var dateCur = new Date();
    if (type == "All") {
        for (var i = 0; i < length; i++) {
            result = result + displayOneBook(obj[i], dateCur);
        }
    } else {
        var i = 0, dem = 0;
        while (i < obj.length && dem < length) {
            if (obj[i].theloai == type) {
                result = result + displayOneBook(obj[i], dateCur);
                dem++;
            }
            i++;
        }
    }
    $(".list-bookq").append(result);
//    showDetailBook();
}

function displayPageForAll() {
    $('.list-bookq').html("");
    var result = "";
    var dateCur = new Date();
    for (var i = 0; i < obj.length; i++) {
        result = result + displayOneBook(obj[i], dateCur);
    }
    $(".list-bookq").append(result);
//    showDetailBook();
}

// theo the loai
function displayPageForType(type) {
    $('.list-bookq').html("");
    var result = "";
    var dateCur = new Date();
    for (var i = 0; i < obj.length; i++) {
        if (obj[i].theloai.toUpperCase() == type.toUpperCase()) {
            result = result + displayOneBook(obj[i], dateCur);
        }

    }
    $(".list-bookq").append(result);
//    showDetailBook();
}

// sach moi: 30 ngay
function displayPageForNewBook() {
    $('.list-bookq').html("");
    var result = "";
    var dateCur = new Date();
    for (var i = 0; i < obj.length; i++) {

        // rate 
        var x = "<img class='star-rate st_1' src='image/star-icon.png'>";
        var rate = "";
        for (var j = 1; j <= obj[i].danhgia; j++) {
            rate = rate + x;
        }

        // date: sach moi (30 ngay)
        var sNewBook = "<img class='new-bookq' src='image/new-icon.png' >";
        var dateb = new Date(obj[i].date);
        var n = (dateCur - dateb) / (24 * 60 * 60 * 1000);
        if (n <= 30 && (obj[i].theloai == type || type == "All")) {
            result = result +
                    "<div class='bookq-container'>" +
                    "<div class='bookq'>" +
                    "<a href='DetailBook.jsp?bookid=" + obj[i].ma + "'><img class='photo-bookq' src='data/image/" + obj[i].linkImage + "' /></a>" +
                    "<div class='info_book'>" +
                    "<p class='name-bookq'>" + obj[i].ten + "</p>" +
                    "<p class='author-bookq'>" + obj[i].tacgia + "</p>" +
                    "<p class='price-bookq'>" + obj[i].gia + "</p>" +
                    "<p class='type-bookq'>" + obj[i].theloai + "</p>" +
                    sNewBook +
                    "<div class='rate-bookq'>" +
                    rate +
                    "</div>" +
                    "</div>" +
                    "</div>" +
                    "</div>";
        }
    }
    $(".list-bookq").append(result);
//    showDetailBook();
}

function showNoti() {
    var dateCur = new Date();
    var dem = 0;
    for (var i = 0; i < obj.length; i++) {
        var dateb = new Date(obj[i].date);
        var n = (dateCur - dateb) / (24 * 60 * 60 * 1000);
        if (n <= 30) {
            show(i);
            dem++;
            if (dem >= 5) {
                break;
            }
        }
    }
}

function show(i) {
    if (Notification.permission === "granted") {
        var notification = new Notification("Nhà sách ABC thông báo ", {
            icon: "./data/image/" + obj[i].linkImage,
            body: "Tác giả " + obj[i].tacgia + " vừa xuất bản cuốn " + obj[i].ten + " rất hay! Mời bạn đọc ghé thăm!",
        });

        notification.onclick = function () {
            window.open("#");
        };

        setTimeout(function () {
            notification.close();
        }, 5000);
    } else {
        Notification.requestPermission();
    }
}

//function showDetailBook() {
//    $('.photo-bookq').click(function () {
//        var index = $(this).parent().parent().index();
//        console.log("index = " + index);
////        window.location.href = 'DetailBook.jsp?id=1';
//    });
//}
//
//$('.photo-bookq').click(function () {
//        var index = $(this).parent().parent().index();
//        console.log("index = " + index);
////        window.location.href = 'DetailBook.jsp?id=1';
//    });
//    
//$('.photo-bookq').click(function () {
//    var id = $(this).parent().attr('id');
//    window.location.href = "DetailBook.jsp?id=" + id;
//});

