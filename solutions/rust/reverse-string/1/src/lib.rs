pub fn reverse(input: &str) -> String {
    let mut out = String::new();
    for ch in input.chars().rev(){
        out.push(ch);
    }
    out
}
