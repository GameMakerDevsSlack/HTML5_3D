var loadingImage = new Image();
loadingImage.src = 'html5game/load.png';
loadingImage.width = 300;
loadingImage.height = 300;

function js_loading( _graphics, _width, _height, _total, _current, _loadingscreen ) {
        
	_width = window.innerWidth;
	_height = window.innerHeight;
	_canvas = document.getElementById("canvas");

	if (_canvas.width !== _width || _canvas.height !== _height)	{
		_canvas.width = _width;
		_canvas.height = _height;
		_graphics.fillStyle = "#2a2a2a";
		_graphics.fillRect(0, 0, _width, _height);
	}

	_graphics = _canvas.getContext("2d");
	_graphics.fillStyle = "#2a2a2a";
	_graphics.fillRect(0, 0, _width, _height);
        
	_graphics.drawImage( loadingBarImage, (_width-loadingImage.width)/2, (_height-loadingImage.height)/2.5 );
}