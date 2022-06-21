var ajax = new XMLHttpRequest();

function firstRequest() {
    ajax.onreadystatechange = function () {
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
    ajax.onreadystatechange = function () {
        if (ajax.readyState === 4) {
            if (ajax.status === 200) {
                console.dir(ajax);
                let rows = ajax.responseXML.firstChild.children;
                let result = "";
                result += "<ol>";
                for (var i = 0; i < rows.length; i++) {
                    result += "<li>" + rows[i].children[0].firstChild.nodeValue + "</li>";
                }
                document.getElementById("info-body").innerHTML = result;
                result += "</ol>";
            }
        }
    }
    var software = document.getElementById("software").value;
    ajax.open("get", "query_2.php?software=" + software);
    ajax.send();
}

function thirdRequest() {
    ajax.onreadystatechange = function () {
        if (ajax.readyState === 4) {
            if (ajax.status === 200) {
                try {
                    var responseText = JSON.parse(ajax.responseText);
                    var newArray = Object.keys(responseText)
                        .map(function (key) {
                            return responseText[key];
                        });
                    let result = "<ol>";

                    for (var i = 0; i < newArray.length; i++) {
                        result += "<li>" + newArray[i].netname + "</li>";
                    }
                    result = result + "</ol>";
                    document.getElementById("info-body").innerHTML = result;
                } catch (e) {
                    console.log(e)
                }
            }
        }
    };
    var user_date = document.getElementById("user_date").value;
    ajax.open("get", "query_3.php?user_date=" + user_date);
    ajax.send();
}