use_osc '127.0.0.1', 6000
use_debug false
volRec = 0
volDrum = 0
volBass = 0
volSynth = 0
volBeat = 0
volMel = 0
live_loop :readOsc do
  use_real_time
  oscStep=sync "/osc*/muting"
  if oscStep[0]==0 then volRec = (volRec-1).abs
  elsif oscStep[0]==1 then volDrum = (volDrum-1).abs
  elsif oscStep[0]==2 then volBass = (volBass-1).abs
  elsif oscStep[0]==3 then volSynth= (volSynth-1).abs
  elsif oscStep[0]==4 then volBeat = (volBeat-1).abs
  elsif oscStep[0]==5 then volMel = (volMel-1).abs
  end
end
live_loop :snap do
  with_fx :pan, pan: [-1, 1].choose  do
    sleep 1
    sample "/home/pi/samples/echo.wav", amp: 1.5
    sleep 3
  end
end

live_loop :record do
  panSample = rrand(-1, 1)
  with_fx :pan, pan: panSample do
    sleep 1
    sample "/home/pi/samples/elaGood.wav", amp: volRec
    if volRec==1 then osc "/inst/panSample", 0 end
    sleep 3
  end
end
live_loop :drum do
  4.times do
    sample :bd_zum, amp: volDrum*1.8
    if volDrum==1 then osc "/inst/drum", 0 end
    sleep 0.125
    sample :tabla_dhec, amp: volDrum*1.8
    if volDrum==1 then osc "/inst/drum", 1 end
    sleep 0.25
    sample :elec_blip2, amp: volDrum*1.8
    if volDrum==1 then osc "/inst/drum", 2 end
    sleep 0.25
    sample :tabla_ke2, amp: volDrum*1.8
    if volDrum==1 then osc "/inst/drum", 3 end
    sleep 0.375
    sample :tabla_ke3, amp: volDrum*1.8
    if volDrum==1 then osc "/inst/drum", 4 end
    sleep 0.5
    none = (ring 1, 0, 1, 1).tick
    sample :tabla_ke1, amp: none*volDrum*1.8
    if volDrum==1 then osc "/inst/drum", 4+none end
    sleep 0.5
  end
end
live_loop :bass do
  use_synth :chipbass
  use_transpose -24
  play 64, release: 2.1, amp: volBass
  if volBass==1 then osc "/inst/bass", 0 end
  sleep 2
  play 69, release: 2.1, amp: volBass
  if volBass==1 then osc "/inst/bass", 1 end
  sleep 2
  play 69, release: 2.1, amp: volBass
  if volBass==1 then osc "/inst/bass", 1 end
  sleep 2
  play 64, release: 2.1, amp: volBass
  if volBass==1 then osc "/inst/bass", 0 end
  sleep 2
  play 64, release: 2.1, amp: volBass
  if volBass==1 then osc "/inst/bass", 0 end
  sleep 2
  play 69, release: 2.1, amp: volBass
  if volBass==1 then osc "/inst/bass", 1 end
  sleep 2
  play 71, release: 3.8, amp: volBass
  if volBass==1 then osc "/inst/bass", 2 end
  sleep 4
end
live_loop :mel do
  use_synth :mod_fm
  use_transpose 24
  16.times do
    notes = (ring :d, :c, :e, :a, :d, :c, :a, :r, :d, :c, :e, :e, :r, [:a, :c].choose, [:e, :g].choose, [:r, :a].choose)
    oneNote = notes.tick
    play oneNote, amp: volMel*0.5, release: 0.5, attack: 0.02, cutoff: rrand(70, 106)
    if volMel==1 then osc "/inst/mel", note(oneNote) end
    sleep 0.25
  end
end
live_loop :synth do
  use_transpose -12
  with_fx :whammy, mix: 0.3, grainsize: 0.25 do
    use_synth :square
    play_chord chord(64, :sus2), amp: volSynth
    if volSynth==1 then osc "/inst/synth", 0 end
    sleep 1.25
    play_chord chord(67, :M), amp: volSynth
    if volSynth==1 then osc "/inst/synth", 1 end
    sleep 0.75
    play_chord chord(69, :maj), amp: volSynth
    if volSynth==1 then osc "/inst/synth", 2 end
    sleep 0.75
    play_chord chord(69, :maj), amp: volSynth
    if volSynth==1 then osc "/inst/synth", 3 end
    sleep 0.5
    play_chord chord(71, :minor), amp: volSynth
    if volSynth==1 then osc "/inst/synth", 4 end
    sleep 0.75
    play_chord chord(69, :m), amp: volSynth
    if volSynth==1 then osc "/inst/synth", 3 end
    sleep 1.25
    play_chord chord(67, :maj), amp: volSynth
    if volSynth==1 then osc "/inst/synth", 2 end
    sleep 0.75
    play_chord chord(64, :minor), amp: volSynth
    if volSynth==1 then osc "/inst/synth", 1 end
    sleep 2
    play_chord chord(64, :sus2), amp: volSynth
    if volSynth==1 then osc "/inst/synth", 0 end
    sleep 1.25
    play_chord chord(67, :M), amp: volSynth
    if volSynth==1 then osc "/inst/synth", 1 end
    sleep 0.75
    play_chord chord(69, :maj), amp: volSynth
    if volSynth==1 then osc "/inst/synth", 2 end
    sleep 0.751
    play_chord chord(69, :maj), amp: volSynth
    if volSynth==1 then osc "/inst/synth", 3 end
    sleep 0.5
    play_chord chord(71, :minor), amp: volSynth
    if volSynth==1 then osc "/inst/synth", 4 end
    sleep 0.75
    play_chord chord(71, :m), amp: volSynth
    if volSynth==1 then osc "/inst/synth", 3 end
    sleep 0.75
    play_chord chord(71, :m), amp: volSynth
    if volSynth==1 then osc "/inst/synth", 4 end
    sleep 0.5
    play_chord chord(71, :maj), amp: volSynth
    if volSynth==1 then osc "/inst/synth", 3 end
    sleep 0.75
    play_chord chord(71, :major), amp: volSynth
    if volSynth==1 then osc "/inst/synth", 2 end
    sleep 0.75
    play_chord chord(67, :min), amp: volSynth
    if volSynth==1 then osc "/inst/synth", 1 end
    sleep 1.25
  end
end
live_loop :beat do
  with_fx :bitcrusher, bits: 3.6, sample_rate: 4110 do
    t = (ring 4, 1, 1, 1, 2, 2, 3, 2, 4, 2, 1, 9,
         4, 1, 2, 2, 2, 1, 2, 2, 4, 2, 1, 2, 2, 5)
    8.times do
      sample :perc_snap2, amp: volBeat, compress: 0
      sleep t.tick*0.125
    end
  end
end
live_loop :clash do
  with_fx :level, amp: volBeat do
    with_fx :bitcrusher, bits: 3.3, sample_rate: 5000 do
      sleep 1.5
      sample :elec_triangle
      sleep 3.75
      sample :elec_triangle
      sleep 2.25
      sample :elec_triangle
      sleep 2
      sample :elec_triangle
      sleep 3.75
      sample :elec_triangle
      sleep 2.25
      sample :elec_triangle
      sleep 0.5
    end
  end
end
