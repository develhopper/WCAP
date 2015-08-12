    /*get the client time for the monitor time transmission*/
    /*NOTE: var maxTiral= The number of trials in Go/NoGo task. Declared in gonogos#show*/
	var date1  = new Date() ;
	date1.timeMSec = date1.getTime() ;
	date1.timeSec = Math.round((date1.timeMSec)/1000) ;	
	var firstTime = date1.timeSec ;
	var counter = -1 ; // count the number of number of trials
	var play; 
	var charCode  ; // charcode of clicked button
    var rectangle_index = 0;


    /*time variables of each trial */
	var clearTimeOutTime = 1500; //???
	var GOorNOGOcue = 500; // 100,200,300,500
	var blankScreen = 500;
	var fixCross = 800;
	var totalTime = 5000;
    /*state determine which rectangle is shown
    1 : Blue Vertical
    2 : Green Vertical
    3 : Blue Horizental
    4 : Green Horizental
    */
	var state = 0;
	var is_clicked = 0; // aya button e click shode buttone morede nazar ast ya kheir
    
    /*constant_clicked determine which button must be pressed
      49 : 1 button in keybord .
      */
    var constant_clicked = 49 ;
    /* show time in console */
function getTime(comment) {
    var date = new Date();
    date.timeMSec = date.getTime();
    date.timeSec = Math.round((date.timeMSec) / 1000);
    console.log(comment + " : " + date.timeMSec);
}
    /* show time in console */
function getTimeMSec() {
    var date = new Date();
    date.timeMSec = date.getTime();
    date.timeSec = Math.round((date.timeMSec) / 1000);
    return date.timeMSec ;
}
/*listener that called in addEventListener for keyPress event */
var listener =  function (event , CharCode) {
    console.log("in function listener == ", event.charCode);
    window.charCode = event.charCode;
    //console.log("#################charcode is " + event.charCode);
    if (window.charCode == constant_clicked) {
        window.is_clicked = 1;
        var date1 = new Date();
        date1.timeMSec = date1.getTime();
        console.log("when clickeddddd : " + date1.timeMSec);
        //save "Click Time" in MSec
        document.getElementById(rectangle_index.toString().concat('_response_time')).value = getTimeMSec();
        document.removeEventListener("keypress", listener);
    }
    console.log("is_clicked is == " + window.is_clicked);
}

var BlockWhitePlus = function () {
    var WhitePlus = document.getElementById("WhitePlus");
    WhitePlus.setAttribute('style', 'display:block');
}
var BlockWhiteVert = function () {
    var WhitePlus = document.getElementById("WhitePlus");
    WhitePlus.setAttribute('style', 'display:none');
    var WhiteVert = document.getElementById("WhiteVert");
    WhiteVert.setAttribute('style', 'display:block');
}
var BlockBlueVert = function () {
    var WhiteVert = document.getElementById("WhiteVert");
    WhiteVert.setAttribute('style', 'display:none');
    var BlueVert = document.getElementById("BlueVert");
    BlueVert.setAttribute('style', 'display:none');
}
/*clear screen from all DIVs */
var NoneAll = function () {
    var WhitePlus = document.getElementById("WhitePlus");
    WhitePlus.setAttribute('style', 'display:none');

    var WhiteVert = document.getElementById("WhiteVert");
    WhiteVert.setAttribute('style', 'display:none');
    var BlueVert = document.getElementById("BlueVert");
    BlueVert.setAttribute('style', 'display:none');
    var GreenVert = document.getElementById("GreenVert");
    GreenVert.setAttribute('style', 'display:none');

    var WhiteHori = document.getElementById("WhiteHori");
    WhiteHori.setAttribute('style', 'display:none');
    var BlueHori = document.getElementById("BlueHori");
    BlueHori.setAttribute('style', 'display:none');
    var GreenHori = document.getElementById("GreenHori");
    GreenHori.setAttribute('style', 'display:none');
    var WhiteWithNoBorder = document.getElementById("WhiteWithNoBorder");
    WhiteWithNoBorder.setAttribute('style', 'display:none');
}
/*show the blue Vertical rectangels*/
function PlayBlueVert() {
    state = 1;
    getTime("0");
    BlockWhitePlus();
    setTimeout(function () {
        var WhitePlus = document.getElementById("WhitePlus");
        WhitePlus.setAttribute('style', 'display:none');
        var WhiteWithNoBorder = document.getElementById("WhiteWithNoBorder");
        WhiteWithNoBorder.setAttribute('style', 'display:block');
        setTimeout(function () {
            getTime("2");
            var WhiteWithNoBorder = document.getElementById("WhiteWithNoBorder");
            WhiteWithNoBorder.setAttribute('style', 'display:none');
            var WhiteVert = document.getElementById("WhiteVert");
            WhiteVert.setAttribute('style', 'display:block');
            setTimeout(function () {
                getTime("4");
                var WhiteVert = document.getElementById("WhiteVert");
                WhiteVert.setAttribute('style', 'display:none');
                var BlueVert = document.getElementById("BlueVert");
                BlueVert.setAttribute('style', 'display:block');
                //Save "display Time" in Msec
                document.getElementById(rectangle_index.toString().concat('_display_time')).value = getTimeMSec();
                document.addEventListener("keypress", listener);
                console.log("Counter == " + counter);

                setTimeout(function () {
                    console.log(" charcode in loop == " + window.charCode);
		    document.getElementById(rectangle_index.toString().concat('_state')).value = state ;
		    document.getElementById(rectangle_index.toString().concat('_is_clicked')).value = 0;
                    if (window.charCode == constant_clicked) {
                        console.log("fahmidaaaaaaam : " + window.charCode);
			document.getElementById(rectangle_index.toString().concat('_is_clicked')).value = 1;
                    }
                if (window.is_clicked == 0) {
                    //save "Click Time" in MSec
                    document.getElementById(rectangle_index.toString().concat('_response_time')).value = getTimeMSec();
                }
		    $("#".concat(rectangle_index.toString()).concat("_submit_rectangle")).click();
			        rectangle_index = rectangle_index + 1;
                if (counter >= maxTiral) {
                    clearTimeout(play);
                    console.log('canceled');
		    document.getElementById("finish").click();
			
                }
                    document.removeEventListener("keypress", listener);
                    window.charCode = null;
                    NoneAll();
                    state = 0;
                    window.is_clicked = 0;
                }, clearTimeOutTime); // Idont Know ???
            }, GOorNOGOcue);//goOrNOGO Cue 100,200,300,400,500
        }, blankScreen); //blank Screen
    }, fixCross); //Fix Cross
}

function PlayGreenVert() {
    state = 2;
    getTime("0");
    BlockWhitePlus();
    setTimeout(function () {
        var WhitePlus = document.getElementById("WhitePlus");
        WhitePlus.setAttribute('style', 'display:none');
        var WhiteWithNoBorder = document.getElementById("WhiteWithNoBorder");
        WhiteWithNoBorder.setAttribute('style', 'display:block');
    setTimeout(function () {
        getTime("2");
        var WhiteWithNoBorder = document.getElementById("WhiteWithNoBorder");
        WhiteWithNoBorder.setAttribute('style', 'display:none');
        var WhiteVert = document.getElementById("WhiteVert");
        WhiteVert.setAttribute('style', 'display:block');
        setTimeout(function () {
            getTime("4");
            var WhiteVert = document.getElementById("WhiteVert");
            WhiteVert.setAttribute('style', 'display:none');
            var GreenVert = document.getElementById("GreenVert");
            GreenVert.setAttribute('style', 'display:block');
                //Save "display Time" in Msec
                document.getElementById(rectangle_index.toString().concat('_display_time')).value = getTimeMSec();
            document.addEventListener("keypress", listener);
            console.log("Counter in loop = " + counter);

                setTimeout(function () {
                    console.log(" charcode in loop == " + window.charCode);
		    document.getElementById(rectangle_index.toString().concat('_state')).value = state ;
		    document.getElementById(rectangle_index.toString().concat('_is_clicked')).value = 0;
                    if (window.charCode == constant_clicked) {
                        console.log("fahmidaaaaaaam : " + window.charCode);
			document.getElementById(rectangle_index.toString().concat('_is_clicked')).value = 1;
                    }
                if (window.is_clicked == 0) {
                    //save "Click Time" in MSec
                    document.getElementById(rectangle_index.toString().concat('_response_time')).value = getTimeMSec();
                }
		    $("#".concat(rectangle_index.toString()).concat("_submit_rectangle")).click();
			        rectangle_index = rectangle_index + 1;
            if (counter >= maxTiral) {
                clearTimeout(play);
                console.log('canceled');
		    document.getElementById("finish").click();
                }
                document.removeEventListener("keypress", listener);
                window.charCode = null;
                NoneAll();
		state = 0;
                    window.is_clicked = 0;
            }, clearTimeOutTime); // Idont Know ???
        }, GOorNOGOcue);//goOrNOGO Cue 100,200,300,400,500
    }, blankScreen); //blank Screen
    }, fixCross); //Fix Cross
}

function PlayBlueHori() {
    state = 3;
    getTime("0");
    BlockWhitePlus();
    setTimeout(function () {
        var WhitePlus = document.getElementById("WhitePlus");
        WhitePlus.setAttribute('style', 'display:none');
        var WhiteWithNoBorder = document.getElementById("WhiteWithNoBorder");
        WhiteWithNoBorder.setAttribute('style', 'display:block');
    setTimeout(function () {
        getTime("2");
        var WhiteWithNoBorder = document.getElementById("WhiteWithNoBorder");
        WhiteWithNoBorder.setAttribute('style', 'display:none');
        var WhiteHori = document.getElementById("WhiteHori");
        WhiteHori.setAttribute('style', 'display:block');
        setTimeout(function () {
            getTime("4");
            var WhiteHori = document.getElementById("WhiteHori");
            WhiteHori.setAttribute('style', 'display:none');
            var BlueHori = document.getElementById("BlueHori");
            BlueHori.setAttribute('style', 'display:block');
            //Save "display Time" in Msec
            document.getElementById(rectangle_index.toString().concat('_display_time')).value = getTimeMSec();
            document.addEventListener("keypress", listener);
            console.log("Counter in loop = " + counter);

                setTimeout(function () {
                    console.log(" charcode in loop == " + window.charCode);
		    document.getElementById(rectangle_index.toString().concat('_state')).value = state ;
		    document.getElementById(rectangle_index.toString().concat('_is_clicked')).value = 0;
                    if (window.charCode == constant_clicked) {
                        console.log("fahmidaaaaaaam : " + window.charCode);
			document.getElementById(rectangle_index.toString().concat('_is_clicked')).value = 1;
                    }
                if (window.is_clicked == 0) {
                    //save "Click Time" in MSec
                    document.getElementById(rectangle_index.toString().concat('_response_time')).value = getTimeMSec();
                }
		    $("#".concat(rectangle_index.toString()).concat("_submit_rectangle")).click();
			        rectangle_index = rectangle_index + 1;
	            if (counter >= maxTiral) {
                clearTimeout(play);
                console.log('canceled');
		    document.getElementById("finish").click();
                }
                document.removeEventListener("keypress", listener);
                window.charCode = null;
                NoneAll();
                state = 0;
                    window.is_clicked = 0;
            }, clearTimeOutTime); // Idont Know ???
        }, GOorNOGOcue);//goOrNOGO Cue 100,200,300,400,500
    }, blankScreen); //blank Screen
    }, fixCross); //Fix Cross
}

function PlayGreenHori() {
    state = 4;
    getTime("0");
    BlockWhitePlus();
    setTimeout(function () {
        var WhitePlus = document.getElementById("WhitePlus");
        WhitePlus.setAttribute('style', 'display:none');
        var WhiteWithNoBorder = document.getElementById("WhiteWithNoBorder");
        WhiteWithNoBorder.setAttribute('style', 'display:block');
    setTimeout(function () {
        getTime("2");
        var WhiteWithNoBorder = document.getElementById("WhiteWithNoBorder");
        WhiteWithNoBorder.setAttribute('style', 'display:none');
        var WhiteHori = document.getElementById("WhiteHori");
        WhiteHori.setAttribute('style', 'display:block');
        setTimeout(function () {
            getTime("4");
            var WhiteHori = document.getElementById("WhiteHori");
            WhiteHori.setAttribute('style', 'display:none');
            var GreenHori = document.getElementById("GreenHori");
            GreenHori.setAttribute('style', 'display:block');
            //Save "display Time" in Msec
            document.getElementById(rectangle_index.toString().concat('_display_time')).value = getTimeMSec();
            document.addEventListener("keypress", listener);

            console.log("Counter in loop = " + counter);

                setTimeout(function () {
                    console.log(" charcode in loop == " + window.charCode);
		    document.getElementById(rectangle_index.toString().concat('_state')).value = state ;
		    document.getElementById(rectangle_index.toString().concat('_is_clicked')).value = 0;
                    if (window.charCode == constant_clicked) {
                        console.log("fahmidaaaaaaam : " + window.charCode);
			document.getElementById(rectangle_index.toString().concat('_is_clicked')).value = 1;
                    }
                if (window.is_clicked == 0) {
                    //save "Click Time" in MSec
                    document.getElementById(rectangle_index.toString().concat('_response_time')).value = getTimeMSec();
                }
		    $("#".concat(rectangle_index.toString()).concat("_submit_rectangle")).click();
			rectangle_index = rectangle_index + 1;
            if (counter >= maxTiral) {
                clearTimeout(play);
                console.log('canceled');
		    document.getElementById("finish").click();
                }
                document.removeEventListener("keypress", listener);
                window.charCode = null;
                NoneAll();
                state = 0;
                    window.is_clicked = 0;
            }, clearTimeOutTime); // Idont Know ???
        }, GOorNOGOcue);//goOrNOGO Cue 100,200,300,400,500
    }, blankScreen); //blank Screen
    }, fixCross); //Fix Cross
}




function loop ()
{
	++counter ;
	getTime("beggining of loop");
	//PlayBlueVert();
	//PlayGreenVert();
	//PlayGreenHori();
	//PlayBlueHori();

    /*select which rectangels must be shown based on the rule of GoNoGo Test*/
	var rnd1_2 = Math.floor((Math.random() * 2) + 1 );
	console.log("rnd1_2  == " + rnd1_2);
	var rnd1_5 = Math.floor((Math.random() * 5) + 1);
	console.log("rnd1_5  == " + rnd1_5);

	if (rnd1_2 == 1 && rnd1_5 == 1) {
	    PlayBlueVert();
	} else if (rnd1_2 == 1 && rnd1_5 != 1) {
	    PlayGreenVert();
	}
	if (rnd1_2 == 2 && rnd1_5 == 1) {
	    PlayGreenHori();
	} else if (rnd1_2 == 2 && rnd1_5 != 1) {
	    PlayBlueHori();
	}
}


function playTest (everymSec)
{
	finalTime = date1.timeSec + 12000 ;
	play = setInterval(loop, everymSec);	
	//setTimeout(loop , 5000) ;
	//clearTimeout(play);
}

function start() {
//	    alert("Test is beggining!!!");
    playTest(3500);
    loop();
    document.getElementById("start").style.visibility = "hidden" ;
}