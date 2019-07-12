(function() {
	if (window.hasCookieConsent) {
		return
	}
	window.hasCookieConsent = true;
	var b = "cookieconsent_options";
	var d = "update_cookieconsent_options";
	var f = "cookieconsent";
	var h = "//s3.amazonaws.com/cc.silktide.com/";
	if (document.cookie.indexOf(f) > -1) {
		return
	}
	if (typeof String.prototype.trim !== "function") {
		String.prototype.trim = function() {
			return this.replace(/^\s+|\s+$/g, "")
		}
	}
	var g = {
		isArray : function(k) {
			var j = Object.prototype.toString.call(k);
			return j == "[object Array]"
		},
		isObject : function(j) {
			return Object.prototype.toString.call(j) == "[object Object]"
		},
		each : function(j, p, m, o) {
			if (g.isObject(j) && !o) {
				for ( var l in j) {
					if (j.hasOwnProperty(l)) {
						p.call(m, j[l], l, j)
					}
				}
			} else {
				for (var k = 0, n = j.length; k < n; k++) {
					p.call(m, j[k], k, j)
				}
			}
		},
		merge : function(k, j) {
			if (!k) {
				return
			}
			g.each(j, function(m, l) {
				if (g.isObject(m) && g.isObject(k[l])) {
					g.merge(k[l], m)
				} else {
					k[l] = m
				}
			})
		},
		bind : function(k, j) {
			return function() {
				return k.apply(j, arguments)
			}
		},
		queryObject : function(j, m) {
			var n;
			var l = 0;
			var k = j;
			m = m.split(".");
			while ((n = m[l++]) && k.hasOwnProperty(n) && (k = k[n])) {
				if (l === m.length) {
					return k
				}
			}
			return null
		},
		setCookie : function(j, n, m, l, p) {
			m = m || 365;
			var o = new Date();
			o.setDate(o.getDate() + m);
			var k = [ j + "=" + n, "expires=" + o.toUTCString(),
					"path=" + p || "/" ];
			if (l) {
				k.push("domain=" + l)
			}
			document.cookie = k.join(";")
		},
		addEventListener : function(k, l, j) {
			if (k.addEventListener) {
				k.addEventListener(l, j)
			} else {
				k.attachEvent("on" + l, j)
			}
		}
	};
	var e = (function() {
		var j = "data-cc-event";
		var o = "data-cc-if";
		var p = function(s, t, r) {
			if (g.isArray(t)) {
				return g.each(t, function(u) {
					p(s, u, r)
				})
			}
			if (s.addEventListener) {
				s.addEventListener(t, r)
			} else {
				s.attachEvent("on" + t, r)
			}
		};
		var q = function(s, r) {
			return s.replace(/\{\{(.*?)\}\}/g, function(w, t) {
				var v = t.split("||");
				var u;
				while (token = v.shift()) {
					token = token.trim();
					if (token[0] === '"') {
						return token.slice(1, token.length - 1)
					}
					u = g.queryObject(r, token);
					if (u) {
						return u
					}
				}
				return ""
			})
		};
		var m = function(s) {
			var r = document.createElement("div");
			r.innerHTML = s;
			return r.children[0]
		};
		var n = function(u, t, s) {
			var r = u.parentNode.querySelectorAll("[" + t + "]");
			g.each(r, function(w) {
				var v = w.getAttribute(t);
				s(w, v)
			}, window, true)
		};
		var l = function(s, r) {
			n(s, j, function(u, t) {
				var w = t.split(":");
				var v = g.queryObject(r, w[1]);
				p(u, w[0], g.bind(v, r))
			})
		};
		var k = function(s, r) {
			n(s, o, function(u, t) {
				var v = g.queryObject(r, t);
				if (!v) {
					u.parentNode.removeChild(u)
				}
			})
		};
		return {
			build : function(t, r) {
				if (g.isArray(t)) {
					t = t.join("")
				}
				t = q(t, r);
				var s = m(t);
				l(s, r);
				k(s, r);
				return s
			}
		}
	})();
	var a = {
		options : {
			message : "This website uses cookies to ensure you get the best experience on our website. ",
			dismiss : "I Agree!",
			learnMore : "More info",
			link : "/cookiepolicy.html",
			container : null,
			theme : "/css/cookieconsent.css",
			domain : null,
			path : "/",
			expiryDays : 365,
			markup : [
					'<div class="cc_banner-wrapper {{containerClasses}}">',
					'<div class="cc_banner cc_container">',
					'<p class="cc_message">{{options.message}} <a data-cc-if="options.link" class="cc_more_info" href="{{options.link || "#null"}}">{{options.learnMore}}</a></p>',
					'<a href="#null" data-cc-event="click:dismiss" class="cc_btn cc_btn_accept_all">{{options.dismiss}}</a>',
					"</div>", "</div>" ]
		},
		init : function() {
			var j = window[b];
			if (j) {
				this.setOptions(j)
			}
			this.setContainer();
			if (this.options.theme) {
				this.loadTheme(this.render)
			} else {
				this.render()
			}
		},
		setOptionsOnTheFly : function(j) {
			this.setOptions(j);
			this.render()
		},
		setOptions : function(j) {
			g.merge(this.options, j)
		},
		setContainer : function() {
			if (this.options.container) {
				this.container = document.querySelector(this.options.container)
			} else {
				this.container = document.body
			}
			this.containerClasses = "";
			if (navigator.appVersion.indexOf("MSIE 8") > -1) {
				this.containerClasses += " cc_ie8"
			}
		},
		loadTheme : function(m) {
			var l = this.options.theme;
			if (l.indexOf(".css") === -1) {
				l = h + l + ".css"
			}
			var k = document.createElement("link");
			k.rel = "stylesheet";
			k.type = "text/css";
			k.href = l;
			var j = false;
			k.onload = g.bind(function() {
				if (!j && m) {
					m.call(this);
					j = true
				}
			}, this);
			document.getElementsByTagName("head")[0].appendChild(k)
		},
		render : function() {
			if (this.element && this.element.parentNode) {
				this.element.parentNode.removeChild(this.element);
				delete this.element
			}
			this.element = e.build(this.options.markup, this);
			if (!this.container.firstChild) {
				this.container.appendChild(this.element)
			} else {
				this.container.insertBefore(this.element,
						this.container.firstChild)
			}
		},
		dismiss : function(j) {
			j.preventDefault && j.preventDefault();
			j.returnValue = false;
			this.setDismissedCookie();
			this.container.removeChild(this.element)
		},
		setDismissedCookie : function() {
			g.setCookie(f, "yes", this.options.expiryDays, this.options.domain,
					this.options.path)
		}
	};
	var i;
	var c = false;
	(i = function() {
		if (!c && document.readyState == "complete") {
			a.init();
			c = true;
			window[d] = g.bind(a.setOptionsOnTheFly, a)
		}
	})();
	g.addEventListener(document, "readystatechange", i)
})();

/////////////////////

