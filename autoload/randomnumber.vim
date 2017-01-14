function! randomnumber#splitmix64(x) abort
  let a:x[0] += 0x9E3779B97F4A7C15
  let l:z = a:x[0]
  let l:z = xor(l:z, and(l:z, 0x7FFFFFFFFFFFFFFF) / 0x40000000 + (l:z < 0 ? 0x0400000000 : 0)) * 0xBF58476D1CE4E5B9
  let l:z = xor(l:z, and(l:z, 0x7FFFFFFFFFFFFFFF) / 0x08000000 + (l:z < 0 ? 0x2000000000 : 0)) * 0x94D049BB133111EB
  return    xor(l:z, and(l:z, 0x7FFFFFFFFFFFFFFF) / 0x80000000 + (l:z < 0 ? 0x0200000000 : 0))
endfunction

function! randomnumber#xorshift128plus(s) abort
  let l:s1 = a:s[0]
  let l:s0 = a:s[1]
  let l:result = l:s0 + l:s1
  let a:s[0] = l:s0
  let l:s1 = xor(l:s1, l:s1 * 0x800000)
  let a:s[1] = xor(
  \ xor(l:s1, and(l:s1, 0x7FFFFFFFFFFFFFFF) / 0x40000 + (l:s1 < 0 ? 0x00400000000000 : 0)),
  \ xor(l:s0, and(l:s0, 0x7FFFFFFFFFFFFFFF) / 0x00020 + (l:s0 < 0 ? 0x800000000000000 : 0)))
  return l:result
endfunction
