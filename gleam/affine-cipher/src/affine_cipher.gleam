pub type Error {
  KeyNotCoprime(Int, Int)
}

pub fn encode(
  plaintext plaintext: String,
  a a: Int,
  b b: Int,
) -> Result(String, Error) {
  todo
}

pub fn decode(
  ciphertext ciphertext: String,
  a a: Int,
  b b: Int,
) -> Result(String, Error) {
  todo
}

pub fn find_mmi(a: Int) -> Int {
  do_find_mmi(a, 26, 1)
}

fn do_find_mmi(a: Int, len: Int, acc: Int) -> Int {
  case { a * acc } % len {
    1 -> acc
    _ -> do_find_mmi(a, len, acc + 1)
  }
}
