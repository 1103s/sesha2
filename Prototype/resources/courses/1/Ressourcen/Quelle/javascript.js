var player = document.getElementById('player');
document.getElementById('playercontainer').style.visibility='hidden';

function displayVideo(videoPath, videoTitle){
	document.getElementById('background').style.display = "block";
	document.getElementById('playercontainer').style.visibility='visible';
	document.getElementById('playertitle').innerHTML = videoTitle;
	var source = document.createElement('source');
	source.setAttribute('src',videoPath);
	player.innerHTML = "";
	player.appendChild(source);
	player.load();
	if(videoPath.endsWith(".mp3")){
		player.style.height = '100px';
	}
	else if(videoPath.endsWith(".mp4")){
		player.style.height = '';
	}
}
function closeVideo(){
	document.getElementById('background').style.display = "none";
	document.getElementById('playercontainer').style.visibility='hidden';
	document.getElementById('playertitle').innerHTML = "";
	player.innerHTML = "";
	player.load();
}