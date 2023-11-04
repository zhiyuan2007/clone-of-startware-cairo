%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin

// 定义结构体
struct Person {
    name: felt,
    age: felt,
}

// 定义状态变量 new_person，类型：Person.
@storage_var
func new_person() -> (person: Person){
}

// 设置 person 信息
@external
func set_person{
    syscall_ptr: felt*,
    pedersen_ptr: HashBuiltin*,
    range_check_ptr,
}(person: Person) {
    new_person.write(person);
    return ();
}

// 读取 person 信息
@view
func read_person{
    syscall_ptr: felt*,
    pedersen_ptr: HashBuiltin*,
    range_check_ptr,
}() -> (person: Person) {
    let (res) = new_person.read();
    return (person=res);
}
