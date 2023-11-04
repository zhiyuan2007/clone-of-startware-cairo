fn fibona(a: felt252, b: felt252, n: felt252) -> felt252 {
    match n {
        0 => a,
        _ => fibona(b, a + b, n - 1),
    }
}
