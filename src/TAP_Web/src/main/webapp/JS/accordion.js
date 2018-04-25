var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
    acc[i].addEventListener("click", function() {
        this.classList.toggle("active");
        if(this.tagName === "TR") {
            var panel = this.nextElementSibling;
            var detail = true;
            while(detail) {
                if(panel.className === "panel") {
                    if (panel.style.display === "") {
                        panel.style.display = "none";
                    } else {
                        panel.style.display = "";
                    }
                } else {
                    detail = false;
                }
                panel = panel.nextElementSibling;
            }
        } else {
            var panel = this.nextElementSibling;
            if (panel.style.display === "") {
                panel.style.display = "none";
            } else {
                panel.style.display = "";
            }
        }
    });
}