var $search = document.querySelector('#search');

const typeHandler = function(e) {
	 bySearchTerm(e.target.value);
}

$search.addEventListener('input', typeHandler)
	
var arrayVariable = [
	["1001_Solar Powered Cars" , "1001_Solar Powered Cars" , "Using the energy it takes to run a hair dryer, this solar-powered car travels 200 miles at speeds of 50 to 65 mph." , [["Measurement", "area", "rate"] , ["Percents", "efficiency"] , ["Trigonometry" , "trig. ratios"] , ["Physical Science", "energy"]]],
	["1002_The Pterodactyl Flies Again" , "1002_The Pterodactyl Flies Again" , "A young aeronautical designer creates a flying replica of a prehistoric dinosaur." , [["Measurement", "area", "rate"] , ["Ratios"] , ["Algebra" , "expressions"] , ["Physical Science" , "force"]]],
	["1003_Flights of Imagination" , "1003_Flights of Imagination" , "Aeronautical inventor Paul MacCready describes how he built a human-powered airplane." , [["Measurement" , "area" , "rate"] , ["Ratios"] , ["Algebra" , "expressions"] , ["Physical Science" , "force"]]],
	["1004_Maglev Trains" , "1004_Maglev Trains" , "Gliding on a wave of electromagnetic force, a maglev (magnetic levitation) train could travel at 300 miles per hour or faster." , [["Measurement" , "area" , "rate"] , ["Algebra" , "equations" , "functions"] , ["Physical Science" , "electricity and magnetism"]]],
	["1005_An Engineer and Her Robot" , "1005_An Engineer and Her Robot" , "To build an anthropomorphic (human-shaped) robot, an engineer has to know biology, electronics, computer programming, physics, math—and which music she wants to have it dance to." , [["Decimals" , "tolerances"] , ["Geometry" , "angles"] , ["Algebra" , "functions"] , ["Computer Science" , "robotics"]]],
	["1006_Testing the Robotic Hand" , "1006_Testing the Robotic Hand" , "NASA engineer Larry Li has built a robot’s hand that can catch a baseball—or recover an essential tool in the vacuum of space." , [["Geometry" , "angles"] , ["Algebra" , "coordinate systems" , "functions"] , ["Trigonometry" , "trig. ratios"] , ["Computer Science" , "robotics"]]],
	["1007_Inventing with Polygons" , "1007_Inventing with Polygons" , "This inventor uses polygons to build amazing expandable structures." , [["Measurement" , "volume" , "area"] , ["Ratios"] , ["Geometry" , "polygons" , "polyhedrons"]]],
	["1008_Roller Coasters" , "1008_Roller Coasters" , "Designing safe roller coasters requires an understanding of forces, so that engineers know exactly how the trains will move before anything is built." , [["Measurement" , "energy" , "power"] , ["Algebra" , "equations"] , ["Physical Science" , "motion"]]],
	["1009_Geometry & Structural Engineering" , "1009_Geometry & Structural Engineering" , "Structural engineers use shapes to design huge buildings and bridges." , [["Percents"] , ["Geometry" , "polygons" , "polyhedrons"] , ["Ratios"]]],
	["1010_Electricity from the Wind" , "1010_Electricity from the Wind" , "The natural force of the wind is harnessed by mathematics and physics to generate clean electricity." , [["Percents"] , ["Geometry" , "circles"] , ["Algebra" , "coordinate systems"] , ["Physical Science" , "energy" , "power"]]],
	["1011_Windsails" , "1011_Windsails" , "Windsail designer Trevor Baylis develops the shape of a sail on his computer, builds it in his shop and tests it out on the waves." , [["Algebra" , "coordinate systems", "Quadratic functions"]]],
	["1012_Bicycle Design" , "1012_Bicycle Design" , "Making bicycles that are strong enough for stunts requires the right combination of triangles and circles." , [["Measurement" , "rate"] , ["Geometry" , "circles" , "triangles"] , ["Ratios"] , ["Physical Science" , "motion"]]],
	["1013_Concert Acoustics" , "1013_Concert Acoustics" , "Elizabeth Cohen tests sound systems for concert halls and theatres." , [["Ratios"] , ["Algebra" , "equations" , "logarithms"] , ["Physical Science" , "sound"]]],
	["1014_Prototypes" , "1014_Prototypes" , "Eastman Kodak senior industrial designer Carole Bilson explains how an idea goes from sketch to prototype to product." , [["Measurement" , "distance"] , ["Statistics"] , ["Ratios"] , ["Trigonometry" , "trig. ratios"]]],
	["1017_The Bose Speaker" , "1017_The Bose Speaker" , "\“You can never do anything better unless it is different\” according to Dr. Amar Bose, who uses the rules of mathematics to achieve superior sound quality in his Bose radio and speakers." , [["Ratios"] , ["Algebra" , "equations" , "logarithms"] , ["Trigonometry" , "trig. functions"] , ["Physical Science" , "sound"]]],
	["1018_Solar Power Plants" , "1018_Solar Power Plants" , "Concentrated solar energy creates heat to drive steam through a turbine and produce electricity cleanly and efficiently." , [["Measurement" , "energy" , "power"] , ["Percents"] , ["Algebra" , "quadratic functions"] , ["Physical Science" , "energy" , "power"]]],
	["1019_Making Sparks 1 - Where Energy Comes From" , "1019_1020_1021_Making Sparks" , "When you turn on your lights, you are plugging into a power grid which is fed by fossil fuel, nuclear and hydroelectric power plants." , [["Measurement" , "area" , "energy"] , ["Percents"] , ["Trigonometry" , "trig. ratios"] , ["Physical Science" , "energy" , "power"]]],
	["1020_Making Sparks 2 - Photovoltaics" , "1019_1020_1021_Making Sparks" , "Sunlight can be converted directly into electricity with a device made of one of Earth’s most plentiful elements." , [["Measurement" , "area" , "energy"] , ["Percents"] , ["Trigonometry" , "trig. ratios"] , ["Physical Science" , "energy" , "power"]]],
	["1021_Making Sparks 3 - How it Works" , "1019_1020_1021_Making Sparks" , "Solar panels are a practical source of electricity for an individual or a nation." , [["Measurement" , "area" , "energy"] , ["Percents"] , ["Trigonometry" , "trig. ratios"] , ["Physical Science" , "energy" , "power"]]],
	["1022_Off the Grid 1 - Culture Shock" , "1022_1023_1024_Off the Grid" , "Most people in the world don’t have access to electricity." , [["Measurement" , "area" , "energy"] , ["Percents"] , ["Trigonometry" , "trig. ratios"] , ["Physical Science" , "energy" , "power"]]],
	["1023_Off the Grid 2 - The Solar Solution" , "1022_1023_1024_Off the Grid" , "For people in remote locations without access to a power grid, solar panels can provide a a solution to their energy problems." , [["Measurement" , "area" , "energy"] , ["Percents"] , ["Trigonometry" , "trig. ratios"] , ["Physical Science" , "energy" , "power"]]],
	["1024_Off the Grid 3 - Delivering Energy" , "1022_1023_1024_Off the Grid" , "Engineers from Sandia Laboratories install a solar panel in a small roadside store in Honduras." , [["Measurement" , "area" , "energy"] , ["Percents"] , ["Trigonometry" , "trig. ratios"] , ["Physical Science" , "energy" , "power"]]],
	["2001_The Disappearing Call of the Wild" , "2001_The Disappearing Call of the Wild" , "Archiving and analyzing over 2,000 hours of rainforest sounds, bio-acoustician Bernie Krause measures the decline of species as habitats disappear." , [["Algebra" , "equations" , "patterns" , "logarithms"] , ["Physical Science" , "sound"] , ["Biology" , "ecology"]]],
	["2002_Healing Injured Wild Animals" , "2002_Healing Injured Wild Animals" , "Veterinarian Mark Pokras assesses, treats and nurses injured wild animals on their road back to health." , [["Percents"] , ["Statistics"] , ["Biology" , "zoology"]]],
	["2003_Growing Bugs" , "2003_Growing Bugs" , "Most farmers know that good bugs will get rid of bad bugs, but where do you get the good bugs?" , [["Statistics"] , ["Ratios"] , ["Biology" , "entomology"] , ["Agriculture"]]],
	["2004_Life Under the Ocean" , "2004_Life Under the Ocean" , "A marine biologist studies the jellyfish-like animals living at 3,000 feet below the surface, where it is cold, dark and quiet." , [["Decimals"] , ["Statistics"] , ["Ratios"] , ["Biology" , "marine"]]],
	["2005_The Lundberg Farms" , "2005_The Lundberg Farms" , "Bryce Lundberg raises organic rice in central California. It’s a satisfying job that requires an understanding of variables." , [["Measurement" , "volume"] , ["Probability"] , ["Algebra" , "variables"] , ["Agriculture"]]],
	["2006_Cheetahs" , "2006_Cheetahs" , "To help save an endangered species like the cheetah, you must start by understanding its behavior. Only the brave need apply for this job, however, because this kind of biological study is up close and personal." , [["Fractions"] , ["Statistics"] , ["Probability"] , ["Biology" , "zoology"]]],
	["2007_Bats" , "2007_Bats" , "Bats are an essential and fascinating part of the ecology of many environments." , [["Decimals"] , ["Ratios"] , ["Statistics"] , ["Biology" , "zoology" , "ecology"]]],
	["2009_First One in the Ballpark" , "2009_First One in the Ballpark" , "Lisa Winston reports the facts on baseball players by arriving early and keeping a close watch on statistics." , [["Decimals"] , ["Percents"] , ["Statistics"]]],
	["2010_Forest Rangers" , "2010_Forest Rangers" , "Forest rangers describe some of the techniques used to keep hundreds of thousands of acres of trees healthy." , [["Ratios"] , ["Statistics"] , ["Biology" , "ecology"]]],
	["2011_Voyage of the Ventana 1" , "2011_2012_Voyage of the Ventana" , "The ocean has a tremendous influence on all life on Earth, yet we know relatively little about it. One reason is that the high pressures of the ocean’s depths creates an environment which is extremely inhospitable to humans." , [["Decimals"] , ["Measurement" , "length" , "volume"] , ["Algebra" , "linear functions"]]],
	["2012_Voyage of the Ventana 2" , "2011_2012_Voyage of the Ventana" , "The undersea exploration vehicle Ventana is fully equipped to be the eyes, ears and hands of oceanographers who wish to explore the deep ocean." , [["Decimals"] , ["Measurement" , "length" , "volume"] , ["Algebra" , "linear functions"]]],
	["2013_Voyage of the Ventana 3" , "2013_2014_2015_Voyage of the Ventana" , "Making a mission succeed with the undersea vehicle Ventana requires careful planning and preparation." , [["Geometry" , "circles"] , ["Algebra" , "expressions"] , ["Geometry" , "right triangles"]]],
	["2014_Voyage of the Ventana 4" , "2013_2014_2015_Voyage of the Ventana" , "Journey to the bottom of the Monterey Bay on a mission of science with the pilot of the Ventana." , [["Geometry" , "circles"] , ["Algebra" , "expressions"] , ["Geometry" , "right triangles"]]],
	["2015_Voyage of the Ventana 5" , "2013_2014_2015_Voyage of the Ventana" , "Some of the answers to how the Earth’s atmosphere works may lie at the bottom of the ocean. As the Ventana completes its mission, ocean scientists are one step closer to those answers." , [["Geometry" , "circles"] , ["Algebra" , "expressions"] , ["Geometry" , "right triangles"]]],
	["3001_Searching for Water on Mars" , "3001_Searching for Water on Mars" , "If we can find water on Mars, then astronauts won't have to take it with them. But how do you find the water before you send a manned mission." , [["Probability"] , ["Geometry" , "circles"] , ["Space Science"]]],
	["3002_Tornado Chase" , "3002_Tornado Chase" , "Tornado-chasing meteorologists do research in the path of the storm’s edge as they strive to better understand tornadoes for more accurate, faster forecasting." , [["Probability"] , ["Algebra" , "coordinate systems"] , ["Earth Science" , "meteorology"]]],
	["3003_Undersea Treasure" , "3003_Undersea Treasure" , "A probability map, constructed by a mathematician, locates a sunken U.S. ship with the largest sunken gold treasure in U.S. history, and reveals even greater wonders." , [["Measurement" , "distance" , "rate"] , ["Algebra" , "coordinate systems"] , ["Probability"]]],
	["3004_Space Weather" , "3004_Space Weather" , "With solar flares 200,000 miles across releasing the equivalent of all the energy ever produced on the Earth at one time, space weather forecasters will become an important feature on the future news." , [["Probability"] , ["Algebra" , "coordinate systems"]]],
	["3005_Eyes on the Universe 1" , "3005_3006_Eyes on the Universe" , "Astronomers think of telescopes as “bigger eyes” that allow them to look, not only deep into space, but back into time." , [["Scientific Notation"] , ["Algebra" , "Equations" , "quadratic functions"] , ["Astronomy"] , ["Physical Science" , "optics"]]],
	["3006_Eyes on the Universe 2" , "3005_3006_Eyes on the Universe" , "New telescopes will soon allow astronomers to study the planetary systems of other stars and compare them to our own Solar System." , [["Scientific Notation"] , ["Algebra" , "Equations" , "quadratic functions"] , ["Astronomy"] , ["Physical Science" , "optics"]]],
	["3007_Eyes on the Universe 3" , "3007_3008_Eyes on the Universe" , "Building a large telescope mirror is a complex engineering task." , [["Scientific Notation"] , ["Algebra" , "Equations" , "quadratic functions"] , ["Astronomy"] , ["Physical Science" , "optics"]]],
	["3008_Eyes on the Universe 4" , "3007_3008_Eyes on the Universe" , "When observatories move from Earth’s mountaintops to above its atmosphere, astronomers will be able to look for signs of life on planets orbiting other stars." , [["Scientific Notation"] , ["Algebra" , "Equations" , "quadratic functions"] , ["Astronomy"] , ["Physical Science" , "optics"]]],
	["4001_Drumming in Fractions" , "4001_Drumming in Fractions" , "Understanding fractions is an essential skill for playing the drums." , [["Fractions"] , ["Ratios"]]],
	["4002_Percussion Instruments" , "4002_Percussion Instruments" , "There’s a lot more to percussion instruments than a set of drums." , [["Fractions"] , ["Ratios"] , ["Algebra" , "patterns"]]],
	["4003_Sports Photography" , "4003_Sports Photography" , "Sports photography requires an expert’s understanding of light, lenses and shutter speed." , [["Fractions"] , ["Decimals"] , ["Trigonometry" , "trig. ratios"] , ["Physical Science" , "optics"]]],
	["4004_The Art Director" , "4004_The Art Director" , "A set is a place where actors can be placed for filming. Creating a set where everything fits just right calls for an understanding of area." , [["Measurement" , "area"] , ["Geometry" , "right triangles"]]],
	["4005_Models for Movies" , "4005_Models for Movies" , "Building miniature replicas with a full-scale imagination, Greg Jein reproduces every detail of the Star Trek space vessels." , [["Measurement" , "distance"] , ["Ratios"]]],
	["4006_Music for Movies" , "4006_Music for Movies" , "To write and play music, you need to know how to work with patterns." , [["Algebra" , "coordinate systems" , "patterns"]]],
	["4007_Creating an Advertising Campaign" , "4007_Creating an Advertising Campaign" , "Creating an advertising campaign requires inspiration, design skills and computer know-how." , [["Fractions"] , ["Percents"] , ["Probability"]]],
	["4008_Corporate Graphics" , "4008_Corporate Graphics" , "To make one design fit on business cards, trucks and buildings, you need to be an expert on the concept of scale." , [["Measurement"] , ["Ratios"] , ["Computer Science" , "graphics programs"]]],
	["4009_Creating a Campground" , "4009_Creating a Campground" , "Creating campsites in the New Mexico wilderness calls for a knowledge of ratios and proportions." , [["Ratios"] , ["Percents"]]],
	["4010_The ABCs of Architecture" , "4010_The ABCs of Architecture" , "When Penn Station needed a new front entrance, they called upon architect Frances Halsband, and she called upon her knowledge of geometry." , [["Measurement" , "area"] , ["Geometry" , "polygons"]]],
	["4011_Designing Dolls" , "4011_Designing Dolls" , "Next year’s Barbie dolls are the result of a great deal of planning and creative work by this year’s designers." , [["Ratios"] , ["Statistics"]]],
	["4012_Designing Sunglasses" , "4012_Designing Sunglasses" , "Watch as a new model of sunglasses goes from design sketch to finished product." , [["Decimals"] , ["Percents"]]],
	["4013_Designing Toy Cars" , "4013_Designing Toy Cars" , "These toy cars are near-exact replicas, and that requires an understanding of the concept of scale." , [["Measurement" , "distance"] , ["Fractions"] , ["Ratios"]]],
	["4014_The Head Chef" , "4014_The Head Chef" , "The head chef is responsible for everything that happens in the kitchen—and for everything that comes out of it." , [["Fractions"] , ["Measurement" , "volume"]]],
	["4015_The Tools of Graphic Design" , "4015_The Tools of Graphic Design" , "Graphic artists lay out images and type with tools like rulers, triangles, compasses and computers, so the printer can perfectly recreate the designer’s work." , [["Measurement" , "distance"] , ["Percents"]]],
	["4016_Float Designer" , "4016_Float Designer" , "To create a beautiful float for the Rose Parade, you have to think about what goes underneath all of those flowers." , [["Decimals"] , ["Geometry" , "solid figures"] , ["Ratios"]]],
	["5001_Water Supply" , "5001_Water Supply" , "The water that comes out of your tap has traveled a long way to get there." , [["Measurement" , "volume"] , ["Percents"]]],
	["5002_Tunnel Number 3" , "5002_Tunnel Number 3" , "Go deep underground with an engineer as she works to ensure a continuous water supply for millions of people." , [["Measurement" , "volume"] , ["Algebra" , "functions"]]],
	["5003_Communication at the Speed of Light" , "5003_Communication at the Speed of Light" , "Tiny glass filaments carry so much information that all the books ever written could be transmitted over a single fiber optic cable in a few seconds." , [["Percents"] , ["Algebra" , "expressions" , "exponential functions"] , ["Physical Science" , "optics"]]],
	["5004_Communications Satellites" , "5004_Communications Satellites" , "A system of satellites that orbit the Earth at various distances make it possible to communicate from anywhere, to anywhere." , [["Measurement" , "rate"] , ["Trigonometry" , "trig. ratios"] , ["Algebra" , "solving equations"] , ["Space Science"]]],
	["5005_The New York City Subway" , "5005_The New York City Subway" , "The New York City subway moves millions of people every day, thanks to the skills of a team of remarkable people." , [["Measurement" , "rate"] , ["Networks"]]],
	["5006_Water Tanks" , "5006_Water Tanks" , "Almost every building in New York City is topped by a water tank." , [["Measurement" , "volume"] , ["Geometry" , "cylinders"]]],
	["5007_Popcorn Peanuts Hot Dogs" , "5007_Popcorn Peanuts Hot Dogs" , "If your job is to feed 20,000 hungry fans at Yankee Stadium, your motto had better be \“Be Prepared\”." , [["Statistics"]]]
];
var currentSet = arrayVariable;
var tags = [
	["Agriculture"],
	["Algebra" , "expressions" , "equations" , "functions" , "coordinate systems" , "quadratic functions" , "variables" , "linear functions" , "Equations" , "patterns" , "solving equations"],
	["Astronomy"],
	["Biology" , "ecology" , "zoology" , "entomology" , "marine"],
	["Computer Science" , "robotics" , "graphics programs"],
	["Decimals" , "tolerances"],
	["Earth Science" , "meteorology"],
	["Fractions"],
	["Geometry" , "angles" , "polygons" , "polyhedrons" , "circles" , "right triangles" , "solid figures" , "cylinders"],
	["Measurement" , "area" , "rate" , "volume" , "energy" , "power" , "distance" , "length"],
	["Networks"],
	["Percents" , "efficiency"],
	["Physical Science" , "energy" , "force" , "electricity and magnetism" , "motion" , "sound" , "optics"],
	["Probability"],
	["Ratios"],
	["Scientific Notation"],
	["Space Science"],
	["Statistics"],
	["Trigonometry" , "trig. ratios" , "trig. functions"]];
var tempElement;
var tempString;
var outerDiv;
var currentSection = 0;
	
//Main Display Functions	
function displayAll()
{
	//Sets current set to full set, then displays
	currentSet = arrayVariable;
	displayCurrentSet();
}	

function bySection(a)
{	
	//Sets current set to full set, then sorts based on the pre determined section lengths
	currentSet = arrayVariable; 
	//Sets the current seciton so it can be reset
	currentSection = a;
	
	if(a==1000){
		byElementNumRange(0,21);
	}
	else if(a==2000){
		byElementNumRange(22,35);
	}
	else if(a==3000){
		byElementNumRange(36,43);
	}
	else if(a==4000){
		byElementNumRange(44,59);
	}
	else if(a==5000){
		byElementNumRange(60,66);
	}
}
	
function byElementNumRange(i,j)
{		
	//Resets all of the pages HTML
	document.getElementById("mainpage").innerHTML = "";
	
	//Slices the current set
	currentSet = currentSet.slice(i,j);
			
	//Makes the reset button invisible
	document.getElementById("reset").style.visibility='hidden';
	document.getElementById("resetTag").style.visibility='hidden';
	document.getElementById("about").innerHTML = "";
	
	//Displays the current set
	displayCurrentSet()
}

function displayTagsSubTag()
{
	//Creates the outermost div for each element
	document.getElementById("tags").innerHTML = "";
	outerDiv = document.createElement('div');
	outerDiv.className = "tagList";
	currentSet = arrayVariable;
	
	tempString = "";
	
	//itterates through the tags
	for(var j in tags){
		
		var alltags = tags[j];

		tempString += "<div class = \"element\"><a class = \"button tag\" onclick=\"bytag(\'" + alltags[0] + "\', \'\')\">" + alltags[0] + "</a>";
		if(alltags.length == 1){
			tempString += "</div>";
		}
		//itterates through each sub tag, attaching its HTML
		for(var k = 1; k < alltags.length;k++)
		{
			if( k == 1){
				tempString += "&nbsp;&nbsp;(";
			}				
			tempString += "<a class = \"button tag\"  onclick=\"bytag(\'" + alltags[0] + "\', \'" + alltags[k] + "\')\">" + alltags[k] + "</a>";
			if( k == alltags.length - 1){
				tempString += ")</div>";
			}
			else{
				tempString += ",";
			}
		}
	}
	outerDiv.innerHTML = tempString;
	
	//Appends the final div to the document itself
	document.getElementById("tags").appendChild(outerDiv);		
}

function displayTags()
{
	//Creates the outermost div for each element
	document.getElementById("tags").innerHTML = "";
	outerDiv = document.createElement('div');
	outerDiv.className = "tagList";
	currentSet = arrayVariable;
	
	tempString = "<p>Search By Tags</p>";
	
	//itterates through the tags
	for(var j in tags){
		tempString += "<div class = \"elementTag\"><a class = \"button tag\"  onclick=\"bytag(\'" + tags[j][0] + "\', \'\')\">" + tags[j][0] + "</a></div>";
	}
	outerDiv.innerHTML = tempString;
	
	//Appends the final div to the document itself
	document.getElementById("tags").appendChild(outerDiv);		
}
	
	
//Sub Search Functions
function bySearchTerm(a)
{
	if(a == ''){
		bySection(currentSection);
	}
	else{
		//Searches Everything
		currentSet = arrayVariable;
		
		
		//Resets page HTML to nothing
		document.getElementById("mainpage").innerHTML = "";

		var numHits = 0;
		var hitsDescription = [];
		//Enables the reset button set up by the original generator
		document.getElementById("reset").style.visibility='visible';		
		document.getElementById("aboutTag").innerHTML = "";
		document.getElementById("resetTag").style.visibility='hidden';

		//Itterates through each tag and searches for a match
		for (var i in currentSet) {
			var tester = true;
			if(a != '')
			{
				tester = false;
				var searchString = currentSet[i][0].toLowerCase();
				if(searchString.indexOf(a.toLowerCase()) > -1){
					tester = true;
				}
			}

			if(tester)
			{	
				numHits++;
				byElementNum(i);
			}
			else
			{
				var searchString = currentSet[i][2].toLowerCase();
				if(searchString.indexOf(a.toLowerCase()) > -1){
					hitsDescription.push(i);
				}
			}
		}
		for (var i in hitsDescription)
		{
			numHits++;
			byElementNum(hitsDescription[i]);
		}

		//Displays the search category at the top
		document.getElementById("about").innerHTML = numHits + " Results";
	}
			
	
}

function bytag(a,b) 
{	
	//adds history item
	//history.pushState({page: 1}, "title 1", "#" + a + "#" b);
	
	//Resets page HTML to nothing
	document.getElementById("mainpage").innerHTML = "";
	document.getElementById("textBox").value = "";
	document.getElementById("search").style.visibility='visible';
	document.getElementById("about").innerHTML = "";
	document.getElementById("reset").style.visibility='hidden';
	currentSet = arrayVariable;
	
	//Displays the search category at the top
	document.getElementById("aboutTag").innerHTML = "Lectures about: " + a;
	if(b!=''){
		document.getElementById("aboutTag").append(" (" + b + ")");
	}
	//Enables the reset button set up by the original generator
	document.getElementById("resetTag").style.visibility='visible';
	
	//Itterates through each tag and searches for a match
	for (var i in currentSet) {
		var tester = true;
		if(a != '')
		{
			tester = false;
			for (var l in currentSet[i][3]){
				if(currentSet[i][3][l][0]==a)
				{
					if(b!=''){
						for(var m = 1; m < currentSet[i][3][l].length;m++){
							if(currentSet[i][3][l][m] == b){
								tester = true;
								break;
							}
						}
					}
					else{
						tester = true;
						break;
					}
				}					
			}
		}
		
		if(tester)
		{	
			byElementNum(i);
		}
	}
	
	//Scrolls to the top of the page
  	document.documentElement.scrollTop = 0;
}	
	
	
//Tool Function
function byElementNum(i)	
{
	//Creates the outermost div for each element
	outerDiv = document.createElement('div');
	outerDiv.className = "element";
	
	//Creates the video and PDF links for each element and appends it to the div
	tempElement = document.createElement('table');
	tempElement.className = "row1";
	tempElement.innerHTML = "<a class=\"video\" title=\"" +  currentSet[i][2] + "\" onclick=\"displayVideo(" + i + ")\">"+ currentSet[i][0] + "</a><a class=\"spacer\">&nbsp;&nbsp;|&nbsp;&nbsp;</a>" + "<a class=\"pdf\" href=\"PDF\\" + currentSet[i][1] + ".pdf\" target=\"_blank\"> Lesson Plans (PDF) </a>";	
	outerDiv.appendChild(tempElement);

	
	//Creates the description text for the element and appends it to the div
	tempElement = document.createElement('div');
	tempElement.className = "row2";
	tempElement.innerHTML = currentSet[i][2];	
	outerDiv.appendChild(tempElement);
	
	
	//Creates the tag array and appends it to the div
	tempElement = document.createElement('table');;
	tempElement.className = "row3";
	tempString = "";
	//itterates through the tags
	for(var j in currentSet[i][3]){
		
		var alltags = currentSet[i][3][j];

		tempString += "<td class=\"tag\"><a class = \"button\"  onclick=\"bytag(\'" + alltags[0] + "\',\'\')\">" + alltags[0] + "</a>";
		if(alltags.length == 1){
			tempString += "&nbsp;&nbsp;&nbsp;</td>";
		}
			
		//itterates through each sub tag, attaching its HTML
		for(var k = 1; k < alltags.length;k++)
		{
			if( k == 1){
				tempString += " (";
			}				
			tempString += "<a class = \"button\"  onclick=\"bytag(\'" + alltags[0] + "\',\'" + alltags[k] + "\')\">" + alltags[k] + "</a>";
			if( k == alltags.length - 1){
				tempString += ")&nbsp;&nbsp;&nbsp;</td>";
			}
			else{
				tempString += ",";
			}
		}
	}
	tempElement.innerHTML = tempString;	
	outerDiv.appendChild(tempElement);
	
	//Appends the final div to the document itself
	document.getElementById("mainpage").appendChild(outerDiv);		
}
	
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
	for (var i in currentSet) {
		byElementNum(i);
	}
	
	//Scrolls to the top of the page
	document.documentElement.scrollTop = 0;
}
	
function calculateTags()
{
	var tagArray = [];
	var flag1 = true;
	var flag2 = true;
	
	for (var i in arrayVariable) {
		for(var j in arrayVariable[i][3]){
			flag1 = true;
			for(var k in tagArray){
				if(tagArray[k][0] == arrayVariable[i][3][j][0]){
					var flag2 = true;
					for(var l = 1; l < arrayVariable[i][3][j].length ;l++){
						for(var m = 1 ; m < tagArray[k].length; m++){
							if(tagArray[k][m] == arrayVariable[i][3][j][l]){
								flag2 = false;
								break;
							}
								
						}
						if(flag2){
							tagArray[k].push(arrayVariable[i][3][j][l]);
						}
					}
					flag1 = false;
					break;
				}				
			}
			if(flag1){
				tagArray.push(arrayVariable[i][3][j]);
			}						
		}			
	}
	for(var i in tagArray){
		document.getElementById("mainpage").append(tagArray[i]+"<br>");
	}
}	

var player = document.getElementById('player');
document.getElementById('videooverlay').style.visibility='hidden';

function displayVideo(videoIndex){
	document.getElementById('background').style.display = "block";
	document.getElementById('videooverlay').style.visibility='visible';
	var source = document.createElement('source');
	source.setAttribute('src',"Video/" + currentSet[videoIndex][0] + ".mp4");
	document.getElementById('title').innerHTML = currentSet[videoIndex][0];
	document.getElementById('description').innerHTML = currentSet[videoIndex][2];
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