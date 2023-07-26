anims = {'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'}

function opponentNoteHit(id, nd, nt)
    if nt == 'GAO' then
        setProperty('gf.holdTimer', 0)
        characterPlayAnim('gf', anims[nd + 1], true)
    end
end