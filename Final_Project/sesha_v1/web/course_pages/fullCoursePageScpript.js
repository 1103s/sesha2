var $search = document.querySelector('#search');

const typeHandler = function(e) {
	 bySearchTerm(e.target.value);
}

$search.addEventListener('input', typeHandler)
	

var outerDiv;

function displayCurrentSet()
{
	//Resets all of the pages HTML
	document.getElementById("mainpage").innerHTML = "";
	document.getElementById("about").innerHTML = "";
	document.getElementById("aboutTag").innerHTML = "";
	document.getElementById("textBox").value = "";

	//Creates a reset button to go back to the current view, then makes it invisible
	document.getElementById("reset").style.visibility='hidden';
	document.getElementById("resetTag").style.visibility='hidden';

	//Displays each element in the array
        
	
	//Scrolls to the top of the page
	document.documentElement.scrollTop = 0;
}
	


var player = document.getElementById('player');
document.getElementById('videooverlay').style.visibility='hidden';

function displayVideo(videoURL,videoTitle,videoDESC){
	document.getElementById('background').style.display = "block";
	document.getElementById('videooverlay').style.visibility='visible';
	var source = document.createElement('source');
	source.setAttribute('src', videoURL);
        if(videoTitle!="null"){
	document.getElementById('title').innerHTML = videoTitle;}
        if(videoDESC!="null"){
	document.getElementById('description').innerHTML = videoDESC;}
	player.innerHTML = "";
	player.appendChild(source);
	player.load();
}
function closeVideo(){
	document.getElementById('background').style.display = "none";
	document.getElementById('videooverlay').style.visibility='hidden';
	document.getElementById('title').innerHTML = "";
	document.getElementById('description').innerHTML = "";
	player.innerHTML = "";
	player.load();			
}