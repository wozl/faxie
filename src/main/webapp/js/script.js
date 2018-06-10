(function($){
	// Settings
	var repeat = localStorage.repeat || 0,
		shuffle = localStorage.shuffle || 'false',
		continous = true,
		autoplay = true,
		playlist = [
		{
title: $("#name1").html(),
artist: $("#singer1").html(),
album: $("#name1").html(),
cover:'http://imgcache.qq.com/music/photo/album_300/'+(parseInt($("#img1").html())%100)+'/300_albumpic_'+parseInt($("#img1").html())+'_0.jpg',
mp3: 'http://ws.stream.qqmusic.qq.com/'+parseInt($("#url1").html())+'.m4a?fromtag=46',
ogg: ''
},
{
title: $("#name2").html(),
artist: $("#singer2").html(),
album: $("#name2").html(),
cover:'http://imgcache.qq.com/music/photo/album_300/'+(parseInt($("#img2").html())%100)+'/300_albumpic_'+parseInt($("#img2").html())+'_0.jpg',
mp3: 'http://ws.stream.qqmusic.qq.com/'+parseInt($("#url2").html())+'.m4a?fromtag=46',
ogg: ''
},
{
title: $("#name3").html(),
artist: $("#singer3").html(),
album: $("#name3").html(),
cover:'http://imgcache.qq.com/music/photo/album_300/'+(parseInt($("#img3").html())%100)+'/300_albumpic_'+parseInt($("#img3").html())+'_0.jpg',
mp3: 'http://ws.stream.qqmusic.qq.com/'+parseInt($("#url3").html())+'.m4a?fromtag=46',
ogg: ''
},
{
title: $("#name4").html(),
artist: $("#singer4").html(),
album: $("#name4").html(),
cover:'http://imgcache.qq.com/music/photo/album_300/'+(parseInt($("#img4").html())%100)+'/300_albumpic_'+parseInt($("#img4").html())+'_0.jpg',
mp3: 'http://ws.stream.qqmusic.qq.com/'+parseInt($("#url4").html())+'.m4a?fromtag=46',
ogg: ''
},
{
title: $("#name5").html(),
artist: $("#singer5").html(),
album: $("#name5").html(),
cover:'http://imgcache.qq.com/music/photo/album_300/'+(parseInt($("#img5").html())%100)+'/300_albumpic_'+parseInt($("#img5").html())+'_0.jpg',
mp3: 'http://ws.stream.qqmusic.qq.com/'+parseInt($("#url5").html())+'.m4a?fromtag=46',
ogg: ''
},		
{
title: $("#name6").html(),
artist: $("#singer6").html(),
album: $("#name6").html(),
cover:'http://imgcache.qq.com/music/photo/album_300/'+(parseInt($("#img6").html())%100)+'/300_albumpic_'+parseInt($("#img6").html())+'_0.jpg',
mp3: 'http://ws.stream.qqmusic.qq.com/'+parseInt($("#url6").html())+'.m4a?fromtag=46',
ogg: ''
},
{
title: $("#name7").html(),
artist: $("#singer7").html(),
album: $("#name7").html(),
cover:'http://imgcache.qq.com/music/photo/album_300/'+(parseInt($("#img7").html())%100)+'/300_albumpic_'+parseInt($("#img7").html())+'_0.jpg',
mp3: 'http://ws.stream.qqmusic.qq.com/'+parseInt($("#url7").html())+'.m4a?fromtag=46',
ogg: ''
},
{
title: $("#name8").html(),
artist: $("#singer8").html(),
album: $("#name8").html(),
cover:'http://imgcache.qq.com/music/photo/album_300/'+(parseInt($("#img8").html())%100)+'/300_albumpic_'+parseInt($("#img8").html())+'_0.jpg',
mp3: 'http://ws.stream.qqmusic.qq.com/'+parseInt($("#url8").html())+'.m4a?fromtag=46',
ogg: ''
},
{
title: $("#name9").html(),
artist: $("#singer9").html(),
album: $("#name9").html(),
cover:'http://imgcache.qq.com/music/photo/album_300/'+(parseInt($("#img9").html())%100)+'/300_albumpic_'+parseInt($("#img9").html())+'_0.jpg',
mp3: 'http://ws.stream.qqmusic.qq.com/'+parseInt($("#url9").html())+'.m4a?fromtag=46',
ogg: ''
},
{
title: $("#name10").html(),
artist: $("#singer10").html(),
album: $("#name10").html(),
cover:'http://imgcache.qq.com/music/photo/album_300/'+(parseInt($("#img10").html())%100)+'/300_albumpic_'+parseInt($("#img10").html())+'_0.jpg',
mp3: 'http://ws.stream.qqmusic.qq.com/'+parseInt($("#url10").html())+'.m4a?fromtag=46',
ogg: ''
},	
{
title: $("#name11").html(),
artist: $("#singer11").html(),
album: $("#name11").html(),
cover:'http://imgcache.qq.com/music/photo/album_300/'+(parseInt($("#img11").html())%100)+'/300_albumpic_'+parseInt($("#img11").html())+'_0.jpg',
mp3: 'http://ws.stream.qqmusic.qq.com/'+parseInt($("#url11").html())+'.m4a?fromtag=46',
ogg: ''
},
{
title: $("#name12").html(),
artist: $("#singer12").html(),
album: $("#name12").html(),
cover:'http://imgcache.qq.com/music/photo/album_300/'+(parseInt($("#img12").html())%100)+'/300_albumpic_'+parseInt($("#img12").html())+'_0.jpg',
mp3: 'http://ws.stream.qqmusic.qq.com/'+parseInt($("#url12").html())+'.m4a?fromtag=46',
ogg: ''
},
{
title: $("#name13").html(),
artist: $("#singer13").html(),
album: $("#name13").html(),
cover:'http://imgcache.qq.com/music/photo/album_300/'+(parseInt($("#img13").html())%100)+'/300_albumpic_'+parseInt($("#img13").html())+'_0.jpg',
mp3: 'http://ws.stream.qqmusic.qq.com/'+parseInt($("#url13").html())+'.m4a?fromtag=46',
ogg: ''
},
{
title: $("#name14").html(),
artist: $("#singer14").html(),
album: $("#name14").html(),
cover:'http://imgcache.qq.com/music/photo/album_300/'+(parseInt($("#img14").html())%100)+'/300_albumpic_'+parseInt($("#img14").html())+'_0.jpg',
mp3: 'http://ws.stream.qqmusic.qq.com/'+parseInt($("#url14").html())+'.m4a?fromtag=46',
ogg: ''
},
{
title: $("#name15").html(),
artist: $("#singer15").html(),
album: $("#name15").html(),
cover:'http://imgcache.qq.com/music/photo/album_300/'+(parseInt($("#img15").html())%100)+'/300_albumpic_'+parseInt($("#img15").html())+'_0.jpg',
mp3: 'http://ws.stream.qqmusic.qq.com/'+parseInt($("#url15").html())+'.m4a?fromtag=46',
ogg: ''
}

		];

	// Load playlist
	for (var i=0; i<playlist.length; i++){
		var item = playlist[i];
		$('#playlist').append('<li>'+item.artist+' - '+item.title+'</li>');
	}

	var time = new Date(),
		currentTrack = shuffle === 'true' ? time.getTime() % playlist.length : 0,
		trigger = false,
		audio, timeout, isPlaying, playCounts;

	var play = function(){
		audio.play();
		$('.playback').addClass('playing');
		timeout = setInterval(updateProgress, 500);
		isPlaying = true;
	}

	var pause = function(){
		audio.pause();
		$('.playback').removeClass('playing');
		clearInterval(updateProgress);
		isPlaying = false;
	}

	// Update progress
	var setProgress = function(value){
		var currentSec = parseInt(value%60) < 10 ? '0' + parseInt(value%60) : parseInt(value%60),
			ratio = value / audio.duration * 100;

		$('.timer').html(parseInt(value/60)+':'+currentSec);
		$('.progress .pace').css('width', ratio + '%');
		$('.progress .slider a').css('left', ratio + '%');
	}

	var updateProgress = function(){
		setProgress(audio.currentTime);
	}

	// Progress slider
	$('.progress .slider').slider({step: 0.1, slide:function(event, ui){
		$(this).addClass('enable');
		setProgress(audio.duration * ui.value / 100);
		clearInterval(timeout);
	}, stop: function(event, ui){
		audio.currentTime = audio.duration * ui.value / 100;
		$(this).removeClass('enable');
		timeout = setInterval(updateProgress, 500);
	}});

	// Volume slider
	var setVolume = function(value){
		audio.volume = localStorage.volume = value;
		$('.volume .pace').css('width', value * 100 + '%');
		$('.volume .slider a').css('left', value * 100 + '%');
	}

	var volume = localStorage.volume || 0.5;
	$('.volume .slider').slider({max: 1, min: 0, step: 0.01, value: volume, slide: function(event, ui){
		setVolume(ui.value);
		$(this).addClass('enable');
		$('.mute').removeClass('enable');
	}, stop: function(){
		$(this).removeClass('enable');
	}}).children('.pace').css('width', volume * 100 + '%');

	$('.mute').click(function(){
		if ($(this).hasClass('enable')){
			setVolume($(this).data('volume'));
			$(this).removeClass('enable');
		} else {
			$(this).data('volume', audio.volume).addClass('enable');
			setVolume(0);
		}
	});

	// Switch track
	var switchTrack = function(i){
		if (i < 0){
			track = currentTrack = playlist.length - 1;
		} else if (i >= playlist.length){
			track = currentTrack = 0;
		} else {
			track = i;
		}

		$('audio').remove();
		loadMusic(track);
		if (isPlaying == true) play();
	}

	// Shuffle
	var shufflePlay = function(){
		var time = new Date(),
			lastTrack = currentTrack;
		currentTrack = time.getTime() % playlist.length;
		if (lastTrack == currentTrack) ++currentTrack;
		switchTrack(currentTrack);
	}

	// Fire when track ended
	var ended = function(){
		pause();
		audio.currentTime = 0;
		playCounts++;
		if (continous == true) isPlaying = true;
		if (repeat == 1){
			play();
		} else {
			if (shuffle === 'true'){
				shufflePlay();
			} else {
				if (repeat == 2){
					switchTrack(++currentTrack);
				} else {
					if (currentTrack < playlist.length) switchTrack(++currentTrack);
				}
			}
		}
	}

	var beforeLoad = function(){
		var endVal = this.seekable && this.seekable.length ? this.seekable.end(0) : 0;
		$('.progress .loaded').css('width', (100 / (this.duration || 1) * endVal) +'%');
	}

	// Fire when track loaded completely
	var afterLoad = function(){
		if (autoplay == true) play();
	}

	// Load track
	var loadMusic = function(i){
		var item = playlist[i],
			newaudio = $('<audio id="audio">').html('<source src="'+item.mp3+'"><source src="'+item.ogg+'">').appendTo('#player');
		
		$('.cover').html('<img src="'+item.cover+'" alt="'+item.album+'">');
		$('.tag').html('<strong>'+item.title+'</strong><span class="artist">'+item.artist+'</span><span class="album">'+item.album+'</span>');
		$('#playlist li').removeClass('playing').eq(i).addClass('playing');
		audio = newaudio[0];
		audio.volume =0.8 /*$('.mute').hasClass('enable') ?50: volume;*/
		audio.addEventListener('progress', beforeLoad, false);
		audio.addEventListener('durationchange', beforeLoad, false);
		audio.addEventListener('canplay', afterLoad, false);
		audio.addEventListener('ended', ended, false);
	}

	loadMusic(currentTrack);
	$('.playback').on('click', function(){
		if ($(this).hasClass('playing')){
			pause();
		} else {
			play();
		}
	});
	$('.rewind').on('click', function(){
		if (shuffle === 'true'){
			shufflePlay();
		} else {
			switchTrack(--currentTrack);
		}
	});
	$('.fastforward').on('click', function(){
		if (shuffle === 'true'){
			shufflePlay();
		} else {
			switchTrack(++currentTrack);
		}
	});
	$('#playlist li').each(function(i){
		var _i = i;
		$(this).on('click', function(){
			switchTrack(_i);
		});
	});

	if (shuffle === 'true') $('.shuffle').addClass('enable');
	if (repeat == 1){
		$('.repeat').addClass('once');
	} else if (repeat == 2){
		$('.repeat').addClass('all');
	}

	$('.repeat').on('click', function(){
		if ($(this).hasClass('once')){
			repeat = localStorage.repeat = 2;
			$(this).removeClass('once').addClass('all');
		} else if ($(this).hasClass('all')){
			repeat = localStorage.repeat = 0;
			$(this).removeClass('all');
		} else {
			repeat = localStorage.repeat = 1;
			$(this).addClass('once');
		}
	});

	$('.shuffle').on('click', function(){
		if ($(this).hasClass('enable')){
			shuffle = localStorage.shuffle = 'false';
			$(this).removeClass('enable');
		} else {
			shuffle = localStorage.shuffle = 'true';
			$(this).addClass('enable');
		}
	});
})(jQuery);