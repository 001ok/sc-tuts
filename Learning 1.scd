// Some short examples and experiments in supercollider

(
	{
		var ampOsc;
		ampOsc = SinOsc.kr(0.5, pi, 0.5, 0.5);
		SinOsc.ar(440, 0, ampOsc);
	}.play;
)


{ [SinOsc.ar(440, 0, 0.2), SinOsc.ar(442, 0, 0.2)] }.play;

(
	{ var freq;
	    freq = [[660, 880], [440, 660], 1320, 880].choose;
	    SinOsc.ar(freq, 0, 0.2);
	}.play;
)

{ Pan2.ar(PinkNoise.ar(1), SinOsc.kr(6)) }.play;

// one channel
{ Mix.new([SinOsc.ar(440, 0, 0.2), Saw.ar(660, 0.2)]).postln }.play;

// combine two stereo arrays
(
	{
		var ampOsc;
		var a, b, c;
		ampOsc = SinOsc.kr(0.2, 1.5pi, 0.5, 0.5);
	
	    a = [SinOsc.ar(255, 0, ampOsc), Saw.ar(662, ampOsc)];
	    b = [SinOsc.ar(899, 0, ampOsc), Saw.ar(660, ampOsc)];
		c = [SinOsc.ar(360, 0, ampOsc), Saw.ar(380, ampOsc)];
		
	    Mix([a, b, c]).postln;
	}.play;
)

(
	SynthDef("thing", {
		Out.ar(
			0,
			SinOsc.ar(440, 0, 0.2, 0)
			*
			BrownNoise.ar(0.4, 0)
	
		)
	
	}).add;
)

Synth("thing");

(
	SynthDef("freqMod", {
		var ampOsc = SinOsc.kr(0.2, 1.5pi, 1, 0.4);
		var freqMod = SinOsc.kr(0.6, 1, 600, 30);
		var freqMod2 = SinOsc.kr(20, 1, 1000, 500);
	    Out.ar(
	        0,
	        SinOsc.ar([freqMod, freqMod2], 0, ampOsc)
	        *
			SinOsc.ar([500, freqMod], 0, 0.2)
	
	    )
	}).add;
)

Synth("freqMod");
