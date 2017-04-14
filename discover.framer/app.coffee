scroll = new ScrollComponent
    size: 1350
scroll.scrollHorizontal = false
scroll.scrollVertical = true

# mock profile data
profiles =
	pro1:
		name: "Bo"
		age: 32
		vouched: 0
		kinks: 3
		genders: 'woman'
		city: 'New York, NY'
		bio: 'Girl form small town'
	pro2:
		name: "Hale"
		age: 30
		vouched: 3
		kinks: 2
		genders: 'non-binary'
		city: 'New York, NY'
		bio: 'df dsfa fsafdsa'
	pro3:
		name: "Evony"
		age: 37
		vouched: 0
		kinks: 4
		genders: 'agender'
		city: 'New York, NY'
		bio: 'dd akal wdm aoao'
	pro4:
		name: "Dyson"
		age: 28
		kinks: 2
		vouched: 6
		genders: 'man'
		city: 'New York, NY'
		bio: 'sds woiow kaka wham'
# profile blocks

selectedProfile = null

py = 0
for key,data of profiles
	pro = new Layer
		height: 480
		width: 750
		image: "images/"+key+".jpg"
		parent: scroll.content
		name: key
		y: py
	py += 480
	pro.onTap ->
		selectedProfile = this
		viewProfile(this.name)
		


# view profile
profile = new Layer
	x: 750
	y: 0
	z: 1
	width: 750
	height: 1350
	backgroundColor: '#000'

backToList = () ->
	if selectedProfile
		selectedProfile.visible = false
		selectedProfile = null
	profile.animate
		x: 750
	filter.visible = true

profile.onSwipeLeft = backToList

picture = new Layer
	x: 0
	y: 0
	z: 1
	width: profile.width
	height: profile.height
	parent: profile

like = new Layer
	x: Align.right(-10)
	y: Align.top(10)
	z: 2
	image: 'images/like.png'
	width: 100
	height: 100
	parent: profile
like.onTap = backToList

back = new Layer
	x: Align.left(10)
	y: Align.top(20)
	z: 2
	image: 'images/back.png'
	width: 100
	height: 24
	parent: profile
back.onTap = backToList

bioGlass = new Layer
	parent: profile
	x: 10
	y: 800
	z: 2
	width: Screen.width - 20
	height: Screen.height - 800
	backgroundColor: 'rgba(255,255,255, 0.7)'
	shadowColor: 'rgba(0,0,0,0.7)'
	shadowBlur: 2
	shadowSpread: 2
	shadowY: -6
	shadowX: 4
bioGlass.onSwipeUp ->
	bioGlass.height = Screen.height
	bioGlass.animate
		y: 120
	picture.animate
		blur: 10
bioGlass.onSwipeDown ->
	picture.blur = 0
	bioGlass.animate
		y: 800

proName = new Layer
	x: Align.left(20)
	y: 20
	color: '#000'
	parent: bioGlass
	backgroundColor: 'transparent'
proName.style['font-size'] = '50px'

proVouch = new Layer
	x: Align.right(-10)
	y: 80
	width: 350
	color: '#000'
	parent: bioGlass
	backgroundColor: 'transparent'
proVouch.style['text-transform'] = 'uppercase'
proVouch.style['text-align'] = 'right'

proKinks = new Layer
	x: Align.left(10)
	y: 80
	width: 400
	color: '#000'
	parent: bioGlass
	backgroundColor: 'transparent'
proKinks.style['text-transform'] = 'uppercase'

proExcerpt = new Layer
	x: Align.center
	y: 120
	parent: bioGlass
	width: bioGlass.width - 40
	color: '#000'
	backgroundColor: 'transparent'

proBioLong = new Layer
	x: Align.center
	y: 200
	parent: bioGlass
	width: bioGlass.width - 40
	color: '#000'
	backgroundColor: 'transparent'

viewProfile = (key) ->
	picture.image = "images/"+key+"more.jpg"
	profile.animate
		x: 0
	filter.visible = false
	po = profiles[key]
	proName.html = po.name
	if po.vouched > 0
		proVouch.html = 'vouched by <b>'+po.vouched+'</b> users'
	proKinks.html = '<b>'+po.kinks + '</b> kinks matched'
	proExcerpt.html = '<b>'+po.age+'</b> years old,'
	proExcerpt.html += ' living in <b>'+po.city+'</b><br />'
	proExcerpt.html += 'Identifies as: <b>'+po.genders+'</b>'
	proBioLong.html = po.bio
	


filter = new Layer
	height: 28
	image: "images/filter.png"
	width: 33
	x: 700
	y: 10



