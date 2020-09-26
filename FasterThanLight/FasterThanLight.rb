#FasterThanLight
use_osc '127.0.0.1', 9000
use_debug false
sp = 0
volClick = 0
volMel = 0
volPlane = 1
volBeat = 0
step = 0
live_loop :steps do
  if step==1 then volBeat = 1
  elsif step==2 then volClick = 1
  elsif step==3 then volMel = 1
  elsif step==4 then volBeat = 0
  elsif step==5 then volMel =1
  end
  
  sleep 1
end
live_loop :readOscStep do
  oscStep=sync "/osc*/step"
  #puts oscStep[0]
  step = oscStep[0]
  changeStep = 1
end
live_loop :mel do
  use_transpose -8
  with_fx :echo, mix: 0.7, phase: 1.2, decay: 1.3 do
    k = (knit :a3, 2, :c3, 1, :d3, 3, :b3, 1, :r, 1, :b3, 2, :d3, 1, :e3, 2, :f3, 1, :g3, 1, :a3, 1).tick
    p = [-1, 1].choose
    synth :tri, amp: volMel*1.6, note: k, pan: p, attack_level: 0.1, env_curve: 2,release: 0.2, decay: 0.2, cutoff: rrand(50, 127)
    sleep 0.5
    if volMel==1 then osc "/melody/note", note(k-47), p end
  end
end
live_loop :drum do
  at [0.0, 0.5, 0.75, 1.5, 2.0, 2.5, 2.75, 3.25, 4.0, 4.5, 4.75] do
    sample :bd_zum, amp: volBeat
  end
  at [0.5, 0.75, 1.25, 1.75, 2.75, 3.75, 4.5, 4.75, 5.25] do
    sample :perc_snap2, amp: [0.3, 0.5].choose*volClick*1.7, beat_stretch: 0.18, rpitch: rrand(2, 9)
  end
  sleep 6
end
live_loop :plane do
  n = (ring :a5, :b5, :a5, :d5)
  with_fx :hpf, cutoff: 100, mix: 0.9 do
    synth :fm, amp: volPlane, divisor: 0.16, note: n.tick, release: 7.5, attack: 1.9, decay: 1
    sleep 4
  end
end
live_loop :beat do
  at [0.0, 1.0, 1.5, 1.75, 2.0, 3.0, 3.25, 3.75, 4.0, 5.0, 5.5, 5.75, 6.0, 7.0, 7.25, 7.5, 7.75] do
    sample :bd_sone, amp: volBeat
  end
  sleep 8
end
