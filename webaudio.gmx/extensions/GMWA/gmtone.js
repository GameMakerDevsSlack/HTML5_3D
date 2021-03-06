!function(t){"use strict";function e(t,e){this.options={},t=t||this.options;var i={frequency:350,peak:1};this.inputNode=this.filterNode=o.context.createBiquadFilter(),this.filterNode.type=e,this.outputNode=n.context.createGain(),this.filterNode.connect(this.outputNode);for(var s in i)this[s]=t[s],this[s]=void 0===this[s]||null===this[s]?i[s]:this[s]}function i(){var t,e,i=o.context.sampleRate*this.time,s=n.context.createBuffer(2,i,o.context.sampleRate),a=s.getChannelData(0),r=s.getChannelData(1);for(e=0;i>e;e++)t=this.reverse?i-e:e,a[e]=(2*Math.random()-1)*Math.pow(1-t/i,this.decay),r[e]=(2*Math.random()-1)*Math.pow(1-t/i,this.decay);this.reverbNode.buffer=s}var n={},o=n,s="object"==typeof module&&module.exports,a="function"==typeof define&&define.amd;s?module.exports=n:a?define([],n):t.Pizzicato=t.Pz=n;var r=t.AudioContext||t.webkitAudioContext;if(!r)return void console.error("No AudioContext found in this environment. Please ensure your window or global object contains a working AudioContext constructor function.");n.context=new r;var c=n.context.createGain();c.connect(n.context.destination),n.Util={isString:function(t){return"[object String]"===toString.call(t)},isObject:function(t){return"[object Object]"===toString.call(t)},isFunction:function(t){return"[object Function]"===toString.call(t)},isNumber:function(t){return"[object Number]"===toString.call(t)&&t===+t},isArray:function(t){return"[object Array]"===toString.call(t)},isInRange:function(t,e,i){return o.Util.isNumber(t)&&o.Util.isNumber(e)&&o.Util.isNumber(i)?t>=e&&i>=t:!1},isBool:function(t){return"boolean"==typeof t},isOscillator:function(t){return t&&"[object OscillatorNode]"===t.toString()},isEffect:function(t){for(var e in n.Effects)if(t instanceof n.Effects[e])return!0;return!1},normalize:function(t,e,i){return o.Util.isNumber(t)&&o.Util.isNumber(e)&&o.Util.isNumber(i)?(i-e)*t/1+e:void 0},getDryLevel:function(t){return!o.Util.isNumber(t)||t>1||0>t?0:.5>=t?1:1-2*(t-.5)},getWetLevel:function(t){return!o.Util.isNumber(t)||t>1||0>t?0:t>=.5?1:1-2*(.5-t)}},Object.defineProperty(n,"volume",{enumerable:!0,get:function(){return c.gain.value},set:function(t){o.Util.isInRange(t,0,1)&&c&&(c.gain.value=t)}}),Object.defineProperty(n,"masterGainNode",{enumerable:!1,get:function(){return c},set:function(t){console.error("Can't set the master gain node")}}),n.Events={on:function(t,e,i){if(t&&e){this._events=this._events||{};var n=this._events[t]||(this._events[t]=[]);n.push({callback:e,context:i||this,handler:this})}},trigger:function(t){if(t){var e,i,n,o;if(this._events=this._events||{},e=this._events[t]||(this._events[t]=[])){for(i=Math.max(0,arguments.length-1),n=[],o=0;i>o;o++)n[o]=arguments[o+1];for(o=0;o<e.length;o++)e[o].callback.apply(e[o].context,n)}}},off:function(t){t?this._events[t]=void 0:this._events={}}},n.Sound=function(t,e){function i(t){var e=["wave","file","input","script","sound"];if(t&&!d.isFunction(t)&&!d.isString(t)&&!d.isObject(t))return"Description type not supported. Initialize a sound using an object, a function or a string.";if(d.isObject(t)){if(!d.isString(t.source)||-1===e.indexOf(t.source))return"Specified source not supported. Sources can be wave, file, input or script";if(!("file"!==t.source||t.options&&t.options.path))return"A path is needed for sounds with a file source";if(!("script"!==t.source||t.options&&t.options.audioFunction))return"An audio function is needed for sounds with a script source"}}function s(t,e){t=t||{},this.getRawSourceNode=function(){var e=this.sourceNode?this.sourceNode.frequency.value:t.frequency,i=n.context.createOscillator();return i.type=t.type||"sine",i.frequency.value=e||440,i},this.sourceNode=this.getRawSourceNode(),d.isFunction(e)&&e()}function a(t,e){t=d.isArray(t)?t:[t];var i=new XMLHttpRequest;i.open("GET",t[0],!0),i.responseType="arraybuffer",i.onload=function(i){n.context.decodeAudioData(i.target.response,function(t){h.getRawSourceNode=function(){var e=n.context.createBufferSource();return e.loop=this.loop,e.buffer=t,e},d.isFunction(e)&&e()}.bind(h),function(i){return console.error("Error decoding audio file "+t[0]),t.length>1?(t.shift(),void a(t,e)):(i=i||new Error("Error decoding audio file "+t[0]),void(d.isFunction(e)&&e(i)))}.bind(h))},i.onreadystatechange=function(e){4===i.readyState&&200!==i.status&&console.error("Error while fetching "+t[0]+". "+i.statusText)},i.send()}function r(t,e){navigator.getUserMedia=navigator.getUserMedia||navigator.webkitGetUserMedia||navigator.mozGetUserMedia||navigator.msGetUserMedia,navigator.getUserMedia&&navigator.getUserMedia({audio:!0},function(t){h.getRawSourceNode=function(){return n.context.createMediaStreamSource(t)},d.isFunction(e)&&e()}.bind(h),function(t){d.isFunction(e)&&e(t)})}function c(t,e){var i=d.isFunction(t)?t:t.audioFunction,o=d.isObject(t)&&t.bufferSize?t.bufferSize:null;if(!o)try{n.context.createScriptProcessor()}catch(s){o=2048}this.getRawSourceNode=function(){var t=n.context.createScriptProcessor(o,1,1);return t.onaudioprocess=i,t}}function u(t,e){this.getRawSourceNode=t.sound.getRawSourceNode,t.sound.sourceNode&&o.Util.isOscillator(t.sound.sourceNode)&&(this.sourceNode=this.getRawSourceNode(),this.frequency=t.sound.frequency)}var h=this,d=n.Util,l=i(t),f=d.isObject(t)&&d.isObject(t.options),p=.04,v=.04;if(l)throw console.error(l),new Error("Error initializing Pizzicato Sound: "+l);this.masterVolume=n.context.createGain(),this.masterVolume.connect(n.masterGainNode),this.fadeNode=n.context.createGain(),this.lastTimePlayed=0,this.effects=[],this.playing=this.paused=!1,this.loop=f&&t.options.loop,this.attack=f&&d.isNumber(t.options.attack)?t.options.attack:p,this.sustain=f&&d.isNumber(t.options.sustain)?t.options.sustain:v,this.volume=f&&d.isNumber(t.options.volume)?t.options.volume:1,t?d.isString(t)?a.bind(this)(t,e):d.isFunction(t)?c.bind(this)(t,e):"file"===t.source?a.bind(this)(t.options.path,e):"wave"===t.source?s.bind(this)(t.options,e):"input"===t.source?r.bind(this)(t,e):"script"===t.source?c.bind(this)(t.options,e):"sound"===t.source&&u.bind(this)(t.options,e):s.bind(this)({},e)},n.Sound.prototype=Object.create(n.Events,{play:{enumerable:!0,value:function(t,e){this.playing||(o.Util.isNumber(e)||(e=this.offsetTime||0),o.Util.isNumber(t)||(t=0),this.playing=!0,this.paused=!1,this.sourceNode=this.getSourceNode(),this.applyAttack(),o.Util.isFunction(this.sourceNode.start)&&(this.lastTimePlayed=n.context.currentTime-e,this.sourceNode.start(o.context.currentTime+t,e)),this.trigger("play"))}},stop:{enumerable:!0,value:function(){(this.paused||this.playing)&&(this.paused=this.playing=!1,this.stopWithSustain(),this.offsetTime=0,this.trigger("stop"))}},pause:{enumerable:!0,value:function(){if(!this.paused&&this.playing){this.paused=!0,this.playing=!1,this.stopWithSustain();var t=o.context.currentTime-this.lastTimePlayed;this.sourceNode.buffer?this.offsetTime=t%(this.sourceNode.buffer.length/o.context.sampleRate):this.offsetTime=t,this.trigger("pause")}}},clone:{enumerable:!0,value:function(){for(var t=new n.Sound({source:"sound",options:{loop:this.loop,attack:this.attack,sustain:this.sustain,volume:this.volume,sound:this}}),e=0;e<this.effects.length;e++)t.addEffect(this.effects[e]);return t}},onEnded:{enumerable:!0,value:function(){this.playing&&this.stop(),this.paused||this.trigger("end")}},addEffect:{enumerable:!0,value:function(t){return t&&o.Util.isEffect(t)?(this.effects.push(t),this.connectEffects(),void(this.sourceNode&&(this.fadeNode.disconnect(),this.fadeNode.connect(this.getInputNode())))):void console.warn("Invalid effect.")}},removeEffect:{enumerable:!0,value:function(t){var e=this.effects.indexOf(t);if(-1===e)return void console.warn("Cannot remove effect that is not applied to this sound.");var i=this.playing;i&&this.pause(),this.fadeNode.disconnect();for(var n=0;n<this.effects.length;n++)this.effects[n].outputNode.disconnect();this.effects.splice(e,1),this.connectEffects(),i&&this.play()}},connectEffects:{enumerable:!0,value:function(){for(var t=0;t<this.effects.length;t++){var e=t===this.effects.length-1,i=e?this.masterVolume:this.effects[t+1].inputNode;this.effects[t].outputNode.disconnect(),this.effects[t].outputNode.connect(i)}}},volume:{enumerable:!0,get:function(){return this.masterVolume?this.masterVolume.gain.value:void 0},set:function(t){o.Util.isInRange(t,0,1)&&this.masterVolume&&(this.masterVolume.gain.value=t)}},frequency:{enumerable:!0,get:function(){return this.sourceNode&&o.Util.isOscillator(this.sourceNode)?this.sourceNode.frequency.value:null},set:function(t){this.sourceNode&&o.Util.isOscillator(this.sourceNode)&&(this.sourceNode.frequency.value=t)}},getSourceNode:{enumerable:!0,value:function(){this.sourceNode&&this.sourceNode.disconnect();var t=this.getRawSourceNode();return t.connect(this.fadeNode),t.onended=this.onEnded.bind(this),this.fadeNode.connect(this.getInputNode()),t}},getInputNode:{enumerable:!0,value:function(){return this.effects.length>0?this.effects[0].inputNode:this.masterVolume}},getAnalyser:{enumerable:!0,value:function(){return this.analyser?this.analyser:(this.analyser=n.context.createAnalyser(),this.masterVolume.disconnect(),this.masterVolume.connect(this.analyser),this.analyser.connect(n.masterGainNode),this.analyser)}},applyAttack:{enumerable:!1,value:function(){this.attack&&(this.fadeNode.gain.setValueAtTime(1e-5,n.context.currentTime),this.fadeNode.gain.linearRampToValueAtTime(1,n.context.currentTime+this.attack))}},stopWithSustain:{enumerable:!1,value:function(t){var e=this.sourceNode,i=function(){return o.Util.isFunction(e.stop)?e.stop(0):e.disconnect()};this.sustain||i(),this.fadeNode.gain.setValueAtTime(this.fadeNode.gain.value,n.context.currentTime),this.fadeNode.gain.linearRampToValueAtTime(1e-5,n.context.currentTime+this.sustain),window.setTimeout(function(){i()},1e3*this.sustain)}}}),n.Effects={},n.Effects.Delay=function(t){this.options={},t=t||this.options;var e={feedback:.5,time:.3,mix:.5};this.inputNode=n.context.createGain(),this.outputNode=n.context.createGain(),this.dryGainNode=n.context.createGain(),this.wetGainNode=n.context.createGain(),this.feedbackGainNode=n.context.createGain(),this.delayNode=n.context.createDelay(),this.inputNode.connect(this.dryGainNode),this.dryGainNode.connect(this.outputNode),this.delayNode.connect(this.feedbackGainNode),this.feedbackGainNode.connect(this.delayNode),this.inputNode.connect(this.delayNode),this.delayNode.connect(this.wetGainNode),this.wetGainNode.connect(this.outputNode);for(var i in e)this[i]=t[i],this[i]=void 0===this[i]||null===this[i]?e[i]:this[i]},n.Effects.Delay.prototype=Object.create(null,{mix:{enumerable:!0,get:function(){return this.options.mix},set:function(t){o.Util.isInRange(t,0,1)&&(this.options.mix=t,this.dryGainNode.gain.value=n.Util.getDryLevel(this.mix),this.wetGainNode.gain.value=n.Util.getWetLevel(this.mix))}},time:{enumerable:!0,get:function(){return this.options.time},set:function(t){o.Util.isInRange(t,0,180)&&(this.options.time=t,this.delayNode.delayTime.value=t)}},feedback:{enumerable:!0,get:function(){return this.options.feedback},set:function(t){o.Util.isInRange(t,0,1)&&(this.options.feedback=parseFloat(t,10),this.feedbackGainNode.gain.value=this.feedback)}}}),n.Effects.Compressor=function(t){this.options={},t=t||this.options;var e={threshold:-24,knee:30,attack:.003,release:.25,ratio:12};this.inputNode=this.compressorNode=n.context.createDynamicsCompressor(),this.outputNode=n.context.createGain(),this.compressorNode.connect(this.outputNode);for(var i in e)this[i]=t[i],this[i]=void 0===this[i]||null===this[i]?e[i]:this[i]},n.Effects.Compressor.prototype=Object.create(null,{threshold:{enumerable:!0,get:function(){return this.compressorNode.threshold.value},set:function(t){n.Util.isInRange(t,-100,0)&&(this.compressorNode.threshold.value=t)}},knee:{enumerable:!0,get:function(){return this.compressorNode.knee.value},set:function(t){n.Util.isInRange(t,0,40)&&(this.compressorNode.knee.value=t)}},attack:{enumerable:!0,get:function(){return this.compressorNode.attack.value},set:function(t){n.Util.isInRange(t,0,1)&&(this.compressorNode.attack.value=t)}},release:{enumerable:!0,get:function(){return this.compressorNode.release.value},set:function(t){n.Util.isInRange(t,0,1)&&(this.compressorNode.release.value=t)}},ratio:{enumerable:!0,get:function(){return this.compressorNode.ratio.value},set:function(t){n.Util.isInRange(t,1,20)&&(this.compressorNode.ratio.value=t)}},getCurrentGainReduction:function(){return this.compressorNode.reduction}}),n.Effects.LowPassFilter=function(t){e.call(this,t,"lowpass")},n.Effects.HighPassFilter=function(t){e.call(this,t,"highpass")};var u=Object.create(null,{frequency:{enumerable:!0,get:function(){return this.filterNode.frequency.value},set:function(t){n.Util.isInRange(t,10,22050)&&(this.filterNode.frequency.value=t)}},peak:{enumerable:!0,get:function(){return this.filterNode.Q.value},set:function(t){n.Util.isInRange(t,1e-4,1e3)&&(this.filterNode.Q.value=t)}}});n.Effects.LowPassFilter.prototype=u,n.Effects.HighPassFilter.prototype=u,n.Effects.Distortion=function(t){this.options={},t=t||this.options;var e={gain:.5};this.waveShaperNode=n.context.createWaveShaper(),this.inputNode=this.outputNode=this.waveShaperNode;for(var i in e)this[i]=t[i],this[i]=void 0===this[i]||null===this[i]?e[i]:this[i]},n.Effects.Distortion.prototype=Object.create(null,{gain:{enumerable:!0,get:function(){return this.options.gain},set:function(t){o.Util.isInRange(t,0,1)&&(this.options.gain=t,this.adjustGain())}},adjustGain:{writable:!1,configurable:!1,enumerable:!1,value:function(){for(var t,e=o.Util.isNumber(this.options.gain)?parseInt(100*this.options.gain,10):50,i=44100,n=new Float32Array(i),s=Math.PI/180,a=0;i>a;++a)t=2*a/i-1,n[a]=(3+e)*t*20*s/(Math.PI+e*Math.abs(t));this.waveShaperNode.curve=n}}}),n.Effects.Flanger=function(t){this.options={},t=t||this.options;var e={time:.45,speed:.2,depth:.1,feedback:.1,mix:.5};this.inputNode=n.context.createGain(),this.outputNode=n.context.createGain(),this.inputFeedbackNode=n.context.createGain(),this.wetGainNode=n.context.createGain(),this.dryGainNode=n.context.createGain(),this.delayNode=n.context.createDelay(),this.oscillatorNode=n.context.createOscillator(),this.gainNode=n.context.createGain(),this.feedbackNode=n.context.createGain(),this.oscillatorNode.type="sine",this.inputNode.connect(this.inputFeedbackNode),this.inputNode.connect(this.dryGainNode),this.inputFeedbackNode.connect(this.delayNode),this.inputFeedbackNode.connect(this.wetGainNode),this.delayNode.connect(this.wetGainNode),this.delayNode.connect(this.feedbackNode),this.feedbackNode.connect(this.inputFeedbackNode),this.oscillatorNode.connect(this.gainNode),this.gainNode.connect(this.delayNode.delayTime),this.dryGainNode.connect(this.outputNode),this.wetGainNode.connect(this.outputNode),this.oscillatorNode.start(0);for(var i in e)this[i]=t[i],this[i]=void 0===this[i]||null===this[i]?e[i]:this[i]},n.Effects.Flanger.prototype=Object.create(null,{time:{enumberable:!0,get:function(){return this.options.time},set:function(t){o.Util.isInRange(t,0,1)&&(this.options.time=t,this.delayNode.delayTime.value=o.Util.normalize(t,.001,.02))}},speed:{enumberable:!0,get:function(){return this.options.speed},set:function(t){o.Util.isInRange(t,0,1)&&(this.options.speed=t,this.oscillatorNode.frequency.value=o.Util.normalize(t,.5,5))}},depth:{enumberable:!0,get:function(){return this.options.depth},set:function(t){o.Util.isInRange(t,0,1)&&(this.options.depth=t,this.gainNode.gain.value=o.Util.normalize(t,5e-4,.005))}},feedback:{enumberable:!0,get:function(){return this.options.feedback},set:function(t){o.Util.isInRange(t,0,1)&&(this.options.feedback=t,this.feedbackNode.gain.value=o.Util.normalize(t,0,.8))}},mix:{enumberable:!0,get:function(){return this.options.mix},set:function(t){o.Util.isInRange(t,0,1)&&(this.options.mix=t,this.dryGainNode.gain.value=n.Util.getDryLevel(this.mix),this.wetGainNode.gain.value=n.Util.getWetLevel(this.mix))}}}),n.Effects.StereoPanner=function(t){this.options={},t=t||this.options;var e={pan:0};this.inputNode=n.context.createGain(),this.outputNode=n.context.createGain(),n.context.createStereoPanner?(this.pannerNode=n.context.createStereoPanner(),this.inputNode.connect(this.pannerNode),this.pannerNode.connect(this.outputNode)):this.inputNode.connect(this.outputNode);for(var i in e)this[i]=t[i],this[i]=void 0===this[i]||null===this[i]?e[i]:this[i]},n.Effects.StereoPanner.prototype=Object.create(null,{pan:{enumerable:!0,get:function(){return this.options.pan},set:function(t){o.Util.isInRange(t,-1,1)&&(this.options.pan=t,this.pannerNode&&(this.pannerNode.pan.value=t))}}}),n.Effects.Convolver=function(t,e){this.options={},t=t||this.options;var i=this,s=new XMLHttpRequest,a={mix:.5};this.callback=e,this.inputNode=n.context.createGain(),this.convolverNode=n.context.createConvolver(),this.outputNode=n.context.createGain(),this.wetGainNode=n.context.createGain(),this.dryGainNode=n.context.createGain(),this.inputNode.connect(this.convolverNode),this.convolverNode.connect(this.wetGainNode),this.inputNode.connect(this.dryGainNode),this.dryGainNode.connect(this.outputNode),this.wetGainNode.connect(this.outputNode);for(var r in a)this[r]=t[r],this[r]=void 0===this[r]||null===this[r]?a[r]:this[r];return t.impulse?(s.open("GET",t.impulse,!0),s.responseType="arraybuffer",s.onload=function(t){var e=t.target.response;n.context.decodeAudioData(e,function(t){i.convolverNode.buffer=t,i.callback&&o.Util.isFunction(i.callback)&&i.callback()},function(t){t=t||new Error("Error decoding impulse file"),i.callback&&o.Util.isFunction(i.callback)&&i.callback(t)})},s.onreadystatechange=function(e){4===s.readyState&&200!==s.status&&console.error("Error while fetching "+t.impulse+". "+s.statusText)},void s.send()):void console.error("No impulse file specified.")},n.Effects.Convolver.prototype=Object.create(null,{mix:{enumerable:!0,get:function(){return this.options.mix},set:function(t){o.Util.isInRange(t,0,1)&&(this.options.mix=t,this.dryGainNode.gain.value=n.Util.getDryLevel(this.mix),this.wetGainNode.gain.value=n.Util.getWetLevel(this.mix))}}}),n.Effects.PingPongDelay=function(t){this.options={},t=t||this.options;var e={feedback:.5,time:.3,mix:.5};this.inputNode=n.context.createGain(),this.outputNode=n.context.createGain(),this.delayNodeLeft=n.context.createDelay(),this.delayNodeRight=n.context.createDelay(),this.dryGainNode=n.context.createGain(),this.wetGainNode=n.context.createGain(),this.feedbackGainNode=n.context.createGain(),this.channelMerger=n.context.createChannelMerger(2),this.inputNode.connect(this.dryGainNode),this.dryGainNode.connect(this.outputNode),this.delayNodeLeft.connect(this.channelMerger,0,0),this.delayNodeRight.connect(this.channelMerger,0,1),this.delayNodeLeft.connect(this.delayNodeRight),this.feedbackGainNode.connect(this.delayNodeLeft),this.delayNodeRight.connect(this.feedbackGainNode),this.inputNode.connect(this.feedbackGainNode),this.channelMerger.connect(this.wetGainNode),this.wetGainNode.connect(this.outputNode);for(var i in e)this[i]=t[i],this[i]=void 0===this[i]||null===this[i]?e[i]:this[i]},n.Effects.PingPongDelay.prototype=Object.create(null,{mix:{enumerable:!0,get:function(){return this.options.mix},set:function(t){o.Util.isInRange(t,0,1)&&(this.options.mix=t,this.dryGainNode.gain.value=n.Util.getDryLevel(this.mix),this.wetGainNode.gain.value=n.Util.getWetLevel(this.mix))}},time:{enumerable:!0,get:function(){return this.options.time},set:function(t){o.Util.isInRange(t,0,180)&&(this.options.time=t,this.delayNodeLeft.delayTime.value=t,this.delayNodeRight.delayTime.value=t)}},feedback:{enumerable:!0,get:function(){return this.options.feedback},set:function(t){o.Util.isInRange(t,0,1)&&(this.options.feedback=parseFloat(t,10),this.feedbackGainNode.gain.value=this.feedback)}}}),n.Effects.Reverb=function(t){this.options={},t=t||this.options;var e={mix:.5,time:.01,decay:.01,reverse:!1};this.inputNode=n.context.createGain(),this.reverbNode=n.context.createConvolver(),this.outputNode=n.context.createGain(),this.wetGainNode=n.context.createGain(),this.dryGainNode=n.context.createGain(),this.inputNode.connect(this.reverbNode),this.reverbNode.connect(this.wetGainNode),this.inputNode.connect(this.dryGainNode),this.dryGainNode.connect(this.outputNode),this.wetGainNode.connect(this.outputNode);for(var o in e)this[o]=t[o],this[o]=void 0===this[o]||null===this[o]?e[o]:this[o];i.bind(this)()},n.Effects.Reverb.prototype=Object.create(null,{mix:{enumerable:!0,get:function(){return this.options.mix},set:function(t){o.Util.isInRange(t,0,1)&&(this.options.mix=t,this.dryGainNode.gain.value=n.Util.getDryLevel(this.mix),this.wetGainNode.gain.value=n.Util.getWetLevel(this.mix))}},time:{enumerable:!0,get:function(){return this.options.time},set:function(t){o.Util.isInRange(t,1e-4,10)&&(this.options.time=t,i.bind(this)())}},decay:{enumerable:!0,get:function(){return this.options.decay},set:function(t){o.Util.isInRange(t,1e-4,10)&&(this.options.decay=t,i.bind(this)())}},reverse:{enumerable:!0,get:function(){return this.options.reverse},set:function(t){o.Util.isBool(t)&&(this.options.reverse=t,i.bind(this)())}}}),n.Effects.DubDelay=function(t){this.options={},t=t||this.options;var e={feedback:.6,time:.7,mix:.5,cutoff:700};this.inputNode=n.context.createGain(),this.outputNode=n.context.createGain(),this.dryGainNode=n.context.createGain(),this.wetGainNode=n.context.createGain(),this.feedbackGainNode=n.context.createGain(),this.delayNode=n.context.createDelay(),this.bqFilterNode=n.context.createBiquadFilter(),this.inputNode.connect(this.dryGainNode),this.dryGainNode.connect(this.outputNode),this.inputNode.connect(this.wetGainNode),this.inputNode.connect(this.feedbackGainNode),this.feedbackGainNode.connect(this.bqFilterNode),this.bqFilterNode.connect(this.delayNode),this.delayNode.connect(this.feedbackGainNode),this.delayNode.connect(this.wetGainNode),this.wetGainNode.connect(this.outputNode);for(var i in e)this[i]=t[i],this[i]=void 0===this[i]||null===this[i]?e[i]:this[i]},n.Effects.DubDelay.prototype=Object.create(null,{mix:{enumerable:!0,get:function(){return this.options.mix},set:function(t){o.Util.isInRange(t,0,1)&&(this.options.mix=t,this.dryGainNode.gain.value=n.Util.getDryLevel(this.mix),this.wetGainNode.gain.value=n.Util.getWetLevel(this.mix))}},time:{enumerable:!0,get:function(){return this.options.time},set:function(t){o.Util.isInRange(t,0,180)&&(this.options.time=t,this.delayNode.delayTime.value=t)}},feedback:{enumerable:!0,get:function(){return this.options.feedback},set:function(t){o.Util.isInRange(t,0,1)&&(this.options.feedback=parseFloat(t,10),this.feedbackGainNode.gain.value=this.feedback)}},cutoff:{enumerable:!0,get:function(){return this.options.cutoff},set:function(t){o.Util.isInRange(t,0,4e3)&&(this.options.cutoff=t,this.bqFilterNode.frequency.value=this.cutoff)}}}),n.Effects.RingModulator=function(t){this.options={},t=t||this.options;var e={speed:30,distortion:1,mix:.5};this.inputNode=n.context.createGain(),this.outputNode=n.context.createGain(),this.dryGainNode=n.context.createGain(),this.wetGainNode=n.context.createGain(),this.vIn=n.context.createOscillator(),this.vIn.start(0),this.vInGain=n.context.createGain(),this.vInGain.gain.value=.5,this.vInInverter1=n.context.createGain(),this.vInInverter1.gain.value=-1,this.vInInverter2=n.context.createGain(),this.vInInverter2.gain.value=-1,this.vInDiode1=new h(n.context),this.vInDiode2=new h(n.context),this.vInInverter3=n.context.createGain(),this.vInInverter3.gain.value=-1,this.vcInverter1=n.context.createGain(),this.vcInverter1.gain.value=-1,this.vcDiode3=new h(n.context),this.vcDiode4=new h(n.context),this.outGain=n.context.createGain(),this.outGain.gain.value=3,this.compressor=n.context.createDynamicsCompressor(),this.compressor.threshold.value=-24,this.compressor.ratio.value=16,this.inputNode.connect(this.dryGainNode),this.dryGainNode.connect(this.outputNode),this.inputNode.connect(this.vcInverter1),this.inputNode.connect(this.vcDiode4.node),this.vcInverter1.connect(this.vcDiode3.node),this.vIn.connect(this.vInGain),this.vInGain.connect(this.vInInverter1),this.vInGain.connect(this.vcInverter1),this.vInGain.connect(this.vcDiode4.node),this.vInInverter1.connect(this.vInInverter2),this.vInInverter1.connect(this.vInDiode2.node),this.vInInverter2.connect(this.vInDiode1.node),this.vInDiode1.connect(this.vInInverter3),this.vInDiode2.connect(this.vInInverter3),this.vInInverter3.connect(this.compressor),this.vcDiode3.connect(this.compressor),this.vcDiode4.connect(this.compressor),this.compressor.connect(this.outGain),this.outGain.connect(this.wetGainNode),this.wetGainNode.connect(this.outputNode);for(var i in e)this[i]=t[i],this[i]=void 0===this[i]||null===this[i]?e[i]:this[i]};var h=function(t){this.context=t,this.node=this.context.createWaveShaper(),this.vb=.2,this.vl=.4,this.h=1,this.setCurve()};return h.prototype.setDistortion=function(t){return this.h=t,this.setCurve()},h.prototype.setCurve=function(){var t,e,i,n,o,s,a,r;for(e=1024,o=new Float32Array(e),t=s=0,a=o.length;a>=0?a>s:s>a;t=a>=0?++s:--s)i=(t-e/2)/(e/2),i=Math.abs(i),n=i<=this.vb?0:this.vb<i&&i<=this.vl?this.h*(Math.pow(i-this.vb,2)/(2*this.vl-2*this.vb)):this.h*i-this.h*this.vl+this.h*(Math.pow(this.vl-this.vb,2)/(2*this.vl-2*this.vb)),o[t]=n;return r=this.node.curve=o},h.prototype.connect=function(t){return this.node.connect(t)},n.Effects.RingModulator.prototype=Object.create(null,{mix:{enumerable:!0,get:function(){return this.options.mix},set:function(t){o.Util.isInRange(t,0,1)&&(this.options.mix=t,this.dryGainNode.gain.value=n.Util.getDryLevel(this.mix),this.wetGainNode.gain.value=n.Util.getWetLevel(this.mix))}},speed:{enumerable:!0,get:function(){return this.options.speed},set:function(t){o.Util.isInRange(t,0,2e3)&&(this.options.speed=t,this.vIn.frequency.value=t)}},distortion:{enumerable:!0,get:function(){return this.options.distortion},set:function(t){if(o.Util.isInRange(t,.2,50)){this.options.distortion=parseFloat(t,10);for(var e=[this.vInDiode1,this.vInDiode2,this.vcDiode3,this.vcDiode4],i=0,n=e.length;n>i;i++)e[i].setDistortion(t)}}}}),n}("undefined"!=typeof window?window:global);

(function() {
  var __sounds = [];
  var __effects = [];

  window.wa_attach_effect = function(sound_id, effect_id) {
    __sounds[sound_id].addEffect(__effects[effect_id]);
  }

  window.wa_detach_effect = function(sound_id, effect_id) {
    __sounds[sound_id].removeEffect(__effects[effect_id]);
  }

  window.wa_create_effect_reverb = function(time, decay, reverse, mix) {
    var delay = new Pizzicato.Effects.Reverb({
      time: time,
      decay: decay,
      reverse: reverse,
      mix: mix
    });

    __effects.push(delay);
    return __effects.length - 1;
  }

  window.wa_create_effect_stereopanner = function(pan) {
    var delay = new Pizzicato.Effects.StereoPanner({
      pan: pan
    });

    __effects.push(delay);
    return __effects.length - 1;
  }

  window.wa_create_effect_highpass_filter = function(frequency, peak, mix) {
    var delay = new Pizzicato.Effects.HighPassFilter({
      frequency: frequency,
      peak: peak,
      mix: mix
    });

    __effects.push(delay);
    return __effects.length - 1;
  }

  window.wa_create_effect_lowpass_filter = function(frequency, peak, mix) {
    var delay = new Pizzicato.Effects.LowPassFilter({
      frequency: frequency,
      peak: peak,
      mix: mix
    });

    __effects.push(delay);
    return __effects.length - 1;
  }

  window.wa_create_effect_compressor = function(threshold, knee, attack, release, ratio) {
    var delay = new Pizzicato.Effects.Compressor({
      threshold: threshold,
      knee: knee,
      attack: attack,
      release: release,
      ratio: ratio
    });

    __effects.push(delay);
    return __effects.length - 1;
  }

  window.wa_create_effect_flanger = function(time, speed, depth, feedback, mix) {
    var delay = new Pizzicato.Effects.Flanger({
      time: time,
      speed: speed,
      depth: depth,
      feedback: feedback,
      mix: mix
    });

    __effects.push(delay);
    return __effects.length - 1;
  }

  window.wa_create_effect_quadrafuzz = function(lowGain, midLowGain, midHighGain, highGain) {
    var delay = new Pizzicato.Effects.Quadrafuzz({
      lowGain: lowGain,
      midLowGain: midLowGain,
      midHighGain: midHighGain,
      highGain: highGain
    });

    __effects.push(delay);
    return __effects.length - 1;
  }

  window.wa_create_effect_distortion = function(gain) {
    var delay = new Pizzicato.Effects.Distortion({
      gain: gain
    });

    __effects.push(delay);
    return __effects.length - 1;
  }

  window.wa_create_effect_dub_delay = function(feedback, time, mix, cutoff) {
    var delay = new Pizzicato.Effects.DubDelay({
      feedback: feedback,
      time: time,
      mix: mix,
      cutoff: cutoff
    });

    __effects.push(delay);
    return __effects.length - 1;
  }

  window.wa_create_effect_pingpong_delay = function(feedback, time, mix) {
    var delay = new Pizzicato.Effects.PingPongDelay({
      feedback: feedback,
      time: time,
      mix: mix
    });

    __effects.push(delay);
    return __effects.length - 1;
  }

  window.wa_create_effect_delay = function(feedback, time, mix) {
    var delay = new Pizzicato.Effects.Delay({
      feedback: feedback,
      time: time,
      mix: mix
    });

    __effects.push(delay);
    return __effects.length - 1;
  }

  window.wa_create_sound = function(type, frequency) {
    var sound = new Pizzicato.Sound({ 
      source: 'wave',
      options: {
        type: type,
        frequency: frequency
      }
    });

    __sounds.push(sound);
    return __sounds.length - 1;
  }

  window.wa_create_sound_ext = function(type, frequency, volume, attack, release) {
    var sound = new Pizzicato.Sound({ 
      source: 'wave',
      options: {
        type: type,
        frequency: frequency,
        attack: attack,
        release: release
      }
    });

    __sounds.push(sound);
    return __sounds.length - 1;
  }

  window.wa_set_volume = function(id, volume) {
    __sounds[id].volume = volume;
  }

  window.wa_set_attack = function(id, attack) {
    __sounds[id].attack = attack;
  }

  window.wa_set_release = function(id, release) {
    __sounds[id].release = release;
  }

  window.wa_play_sound = function(id) {
    __sounds[id].play();
  }

  window.wa_stop_sound = function(id) {
    __sounds[id].stop();
  }

}());