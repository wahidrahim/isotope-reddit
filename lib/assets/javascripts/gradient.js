(function(window) {
	function define_gradient() {
		var Gradient = {};

		Gradient.at = function(start_color, end_color, percent) {
			var r = mix(rgb(start_color, 'r'), rgb(end_color, 'r'), percent);
			var g = mix(rgb(start_color, 'g'), rgb(end_color, 'g'), percent);
			var b = mix(rgb(start_color, 'b'), rgb(end_color, 'b'), percent);

			return "#" + hex(r) + hex(g) + hex(b);
		}

		return Gradient;
	}

	if (typeof(Gradient) === 'undefined') {
		window.Gradient = define_gradient();
	} else {
		console.log('Gradient already exists!');
	}

	function mix(rgb_a, rgb_b, percent) {
		return Math.round((rgb_b - rgb_a) * percent + rgb_a);
	}

	function rgb(hex_color, channel) {
		switch (channel) {
			case 'r':
				return parseInt(hex_color.substring(1, 3), 16);
			break;
			case 'g':
				return parseInt(hex_color.substring(3, 5), 16);
			break;
			case 'b':
				return parseInt(hex_color.substring(5, 7), 16);
			break;
		}
	}

	function hex(dec) {
		if (0 <= dec && dec <= 255) {
			return ("0" + dec.toString(16)).slice(-2);
		}
	}
})(window);
