function js_init(){
	
	js_func = [];
	js_var_map = {};
	js_regexp = new RegExp( "#", "g" );
	
}

function js_exists(index){
	return js_func[index] ? 1 : 0;
}

function js_count(){
	var i,n=0;for(i in js_func){n++};
	return n
}

function js_fixcode( code ){
	return code["replace"]( js_regexp, "\x0A" );
}

function js_run(code){
	return ( new Function(js_fixcode(code)))();
}

function js_add(index,code){
	js_func[index] = new Function(js_fixcode(code));
}

function js_call(index){
	if(!js_func[index]){return -1};
	return js_func[index]()
}

function js_add1( index, _1, code ){
	js_func[index] = new Function( _1, js_fixcode( code ) );
}

function js_call1(index,_1){
        if( !js_func[index]){
		return -1;
	}
	return js_func[index](_1);
}

function js_add3( index, _1, _2, _3, code ){
	js_func[index] = new Function( _1, _2, _3, js_fixcode( code ) );
}
function js_call3( index, _1, _2, _3 ){
	if ( !js_func[index] ) {
		return -1;
	}
	return js_func[index]( _1, _2, _3 );
}

function js_i(){
	try {
		return window["self"] !== window["top"];
	}
	catch(_) {
		return true;
	}
}

function js_var_def( expr, name ){
	var script = window["js_var_def"]["caller"]["name"];
	if ( script === undefined) {
		script = arguments["callee"]["caller"].toString()["match"](/function ([^ \(]+)/)[1];
	};
	var gmlrx="s_var_def\\(([^,]+)\\s*,\\s*['\"]"+ name;
	var gmljs=window[script].toString()["match"]( new RegExp(gmlrx,""))[1];
	js_var_map[name] = new Function("value",gmljs+ " = value;");
}

function js_var_set( name, value ){
	try {
		js_var_map[name](value);
		return 1;
	}
	catch(_) {
		return 0;
	}
}

document.body.style.overflow = 'hidden';
var _element = document.getElementById( 'gm4html5_div_id' );
_element.style.paddingTop = '20px';
_element.style.position = 'absolute';
_element.style.height = '2048px';

window.js_resized = 1;
document.onresize = window.onresize = function() {
	window.js_resized = 1;
}