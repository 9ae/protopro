scroll = new ScrollComponent
    size: Screen.height
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
		bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu pulvinar lacus, sed elementum turpis. Etiam id eros vitae leo vehicula finibus. Donec at lorem non neque suscipit bibendum in eu eros. Morbi viverra tempus nisi quis dignissim. <br /> Curabitur velit est, pretium ut mi quis, pharetra pharetra augue. Nulla volutpat et quam non semper. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. <br />Proin luctus metus at mauris sodales euismod. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras auctor vestibulum justo, nec porttitor libero dictum sed. Vestibulum non nulla quis urna feugiat ornare. <br />Vivamus sagittis elit lorem, sed egestas sem eleifend et. Integer egestas tortor lacinia molestie iaculis. '
	pro2:
		name: "Hale"
		age: 30
		vouched: 3
		kinks: 2
		genders: 'non-binary'
		city: 'New York, NY'
		bio: 'Curabitur dignissim cursus est, non fermentum nulla mattis nec. Sed mi urna, commodo non ornare in, hendrerit at leo. <br/>Aenean id aliquet justo, aliquet aliquam nunc. Maecenas et felis magna. Nulla eu augue interdum, congue nisi sit amet, sodales urna.<br/> Maecenas quis lectus placerat, fermentum neque at, volutpat eros. Maecenas mauris velit, eleifend quis libero a, facilisis sodales tortor.<br/> Quisque nisi mauris, cursus eu vestibulum ut, facilisis ac est. In efficitur, erat eu commodo finibus, turpis sem mollis sem, imperdiet commodo nibh nisi quis augue.<br/><br/>Fusce commodo odio dictum elementum facilisis. Proin fringilla ex sed dignissim pulvinar. In blandit velit in cursus consectetur.<br /> Sed porttitor rhoncus metus. Nunc convallis sed diam vitae ultricies. Phasellus vitae nulla quis nunc ultricies hendrerit in nec mauris.<br /> Nam fringilla ex a nisi imperdiet, id hendrerit leo faucibus.<br/> Vestibulum ac neque augue. Aliquam nec lorem eget neque vestibulum lacinia id non risus.<br/> Curabitur eu tempus lacus. Vestibulum hendrerit id erat eleifend aliquet. '
	pro3:
		name: "Evony"
		age: 37
		vouched: 0
		kinks: 4
		genders: 'agender'
		city: 'New York, NY'
		bio: 'Nam ultrices velit nec sapien sagittis, nec laoreet massa porta.<br/> Suspendisse quis sapien vehicula, vulputate metus vitae, feugiat elit. Mauris cursus augue vulputate erat congue cursus.<br/> Morbi vel lacus blandit nibh dignissim faucibus. Nulla eget erat et purus commodo cursus.<br/><br/> Vivamus vulputate, diam eu viverra sollicitudin, turpis tellus vestibulum dui, vitae volutpat magna tellus sit amet dolor.<br/> Curabitur facilisis pretium lorem viverra aliquam. Nam nunc lacus, rutrum eget vestibulum sed, sollicitudin sed elit.<br/> Etiam facilisis lorem orci, in volutpat eros viverra ornare. Praesent at gravida purus. Donec sodales et ipsum aliquam bibendum.<br/><br/> Integer facilisis velit vitae elit pharetra, vitae facilisis leo rhoncus. Ut sit amet vulputate felis, nec vulputate augue. Nulla tincidunt dapibus quam et commodo. '
	pro4:
		name: "Dyson"
		age: 28
		kinks: 2
		vouched: 6
		genders: 'man'
		city: 'New York, NY'
		bio: 'Phasellus molestie ultricies magna, eget tincidunt diam pulvinar at. Nullam mollis commodo mattis.<br/><br/> Aliquam sit amet sem mollis, ultrices odio eu, rutrum massa. Duis sit amet ligula lectus. Etiam id nulla lectus.<br/> Vestibulum quis quam lorem. Integer tortor leo, convallis convallis turpis eget, sagittis eleifend lacus. Sed imperdiet pretium ex, condimentum maximus lectus viverra a.<br/> Donec commodo sed dui ultricies ornare. Cras pellentesque orci vitae eros molestie, id porttitor sapien lacinia.<br/> Aliquam in lacus porta, maximus odio nec, feugiat ipsum. In ullamcorper tempor nisl, ut ultrices arcu posuere ac.<br/> Fusce pellentesque sem urna, at consequat ex varius quis. Pellentesque venenatis, lorem vitae sodales elementum, nisi felis sodales sem, a maximus magna ex nec enim. Nulla sit amet sodales felis, molestie iaculis dolor. '
# profile blocks

selectedProfile = null
blockHeight = Screen.width/1.5625
py = 0

for key,data of profiles
	pro = new Layer
		height: blockHeight
		width: Screen.width
		image: "images/"+key+".jpg"
		parent: scroll.content
		name: key
		y: py
	py += blockHeight
	pro.onTap ->
		if selectedProfile
			return
		selectedProfile = this
		viewProfile(this.name)

refreshProfiles = () ->
	py = 0
	for index, layer of scroll.content.children
		if layer.visible
			layer.y = py
			py += blockHeight
	

# view profile
profile = new Layer
	x: -1 * Screen.width
	y: 0
	z: 1
	width: Screen.width
	height: Screen.height
	backgroundColor: '#000'

backToList = (event) ->
	if selectedProfile
		selectedProfile.visible = false
		selectedProfile = null
	profile.animate
		x: -1 * Screen.width
	filter.visible = true
	refreshProfiles()

profile.on(Events.SwipeLeft, backToList)

picture = new Layer
	x: 0
	y: 0
	z: 1
	width: profile.width
	height: profile.height
	parent: profile

backAdvice = new Layer
	x: 10
	y: 10
	z: 2
	width: 500
	html: 'To go back, <b>SWIPE LEFT</b>'
	backgroundColor: 'transparent'
	parent: profile

like = new Layer
	x: Align.right(-10)
	y: Align.top(10)
	z: 2
	image: 'images/like.png'
	width: 100
	height: 100
	parent: profile
like.onTap ->
	like.animate
		opacity: 0.2
	backToList()

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
	borderRadius: 11
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
	like.opacity = 1.0
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



