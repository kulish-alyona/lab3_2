var ajax = new XMLHttpRequest();

function firstRequest() {
    ajax.onreadystatechange = function() {
        if (ajax.readyState === 4) {
            if (ajax.status === 200) {
                console.dir(ajax.responseText);
                document.getElementById("info-body").innerHTML = ajax.response;
            }
        }
    }
    var processor = document.getElementById("processor").value;
    ajax.open("get", "query_1.php?processor=" + processor);
    ajax.send();
}

function secondRequest() {
    ajax.onreadystatechange = function() {
        if (ajax.readyState === 4) {
            if (ajax.status === 200) {
                console.dir(ajax.responseText);
                document.getElementById("info-body").innerHTML = ajax.response;
            }
        }
    }
    var software = document.getElementById("software").value;
    ajax.open("get", "query_2.php?software=" + software);
    ajax.send();
}

function thirdRequest() {
    ajax.onreadystatechange = function() {
        if (ajax.readyState === 4) {
            if (ajax.status === 200) {
                console.dir(ajax.responseText);
                document.getElementById("info-body").innerHTML = ajax.response;
            }
        }
    }
    var userData = document.getElementById("user_date").value;
    ajax.open("get", "query_3.php?user_date=" + userData);
    ajax.send();
}