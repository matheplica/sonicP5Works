use_osc '127.0.0.1', 6000
use_debug false
use_bpm 60
offset = 0
myTime = 1
addMyTime = 0.95
live_loop :kick do
  sample   :perc_snap, pan: (knit 1, 7, -1, 5, 1, 3, -1, 3, 1, 5, -1, 7).tick
  sleep myTime*0.25
end
2.times do
  5.times do
    use_transpose offset
    2.times do
      2.times do
        my = 65
        play my, pan: -1
        osc "/piano/note", my
        sleep myTime
        play my+=2, pan: 1
        osc "/piano/note", my
        sleep myTime*0.5
        play my+=1, pan: -1
        osc "/piano/note", my
        sleep myTime*0.25
        play my-=1, pan: 1
        osc "/piano/note", my
        sleep myTime*0.75
        play my+=3, pan: -1
        osc "/piano/note", my
        sleep myTime
        play my+=2, pan: 1
        osc "/piano/note", my
        sleep myTime*0.5
        myTime *= addMyTime
      end
      2.times do
        my = 60
        play my, pan: -1
        osc "/piano/note", my
        sleep myTime
        play my+=2, pan: 1
        osc "/piano/note", my
        sleep myTime*0.5
        play my+=1, pan: -1
        osc "/piano/note", my
        sleep myTime*0.25
        play my-=1, pan: 1
        osc "/piano/note", my
        sleep myTime*0.75
        play my+=5, pan: -1
        osc "/piano/note", my
        sleep myTime*0.5
        play my-=2, pan: 1
        osc "/piano/note", my
        sleep myTime*0.5
        myTime *= addMyTime
      end
    end
  end
  addMyTime = 1.1
end
addMyTime = 1
