// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {

    static targets = ["hora"]


    initialize() {
        const select_ano = document.cookie

        if (window.location.pathname !== "/years/new") {
            if (select_ano.indexOf('selected_year') == -1) {
                $('#ano_modal').modal({ backdrop: 'static', keyboard: false })
            }

        }



        $('input[type=text]').keyup(function() {
            this.value = this.value.toUpperCase()

        })





    }
    connect() {
        this.time()
    }


    time() {

        function startTimer(duration, display) {
            var timer = duration,
                minutes, seconds;


            setInterval(function() {
                minutes = parseInt(timer / 60, 10)
                seconds = parseInt(timer % 60, 10);

                minutes = minutes < 10 ? "0" + minutes : minutes;
                seconds = seconds < 10 ? "0" + seconds : seconds;

                display.text(minutes + ":" + seconds);



                if (--timer < 0) {
                    timer = duration;
                }
            }, 1000);
        }

        var fiveMinutes = 60 * 30
        let display = $(this.horaTarget)
        startTimer(fiveMinutes, display)



    }

}