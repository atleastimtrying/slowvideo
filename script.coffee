loaded = ->
  video = document.createElement 'video'
  video.autoplay = true
  canvas = document.getElementsByTagName('canvas')[0]
  p = document.getElementsByTagName('p')[0]
  canvas.width = window.innerWidth
  canvas.height = window.innerWidth * 0.75
  canvas.style.width = canvas.width + 'px'
  canvas.style.height = canvas.height + 'px'
  ctx = canvas.getContext '2d'
  ctx.fillStyle = 'white'
  ctx.fillRect 0, 0, canvas.width, canvas.height
  x = 0
  y = 0
  failure = (error)->
    console.log error

  show = ->
    ctx.drawImage video, 0, 0, canvas.width, canvas.height

    requestAnimationFrame show

  success = (stream)->
    p.style.display = 'none'
    ctx.globalAlpha = 0.02
    video.src = window.webkitURL.createObjectURL stream
    show()
  navigator.webkitGetUserMedia { video: true }, success, failure

window.addEventListener 'load', loaded, false