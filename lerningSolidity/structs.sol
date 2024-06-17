// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Structs{

    struct Todo{
        string test;
        bool completed;
    }
    Todo [] public todos;

    function create(string _test)public{

        todos.push(Todo(_test,false));
    }

    function get(int index)public view returns(string, bool){

        return (todos[index].test, todos[index].completed);
    }

    function updetTest(uint _index, string _test)public{
        
        // todos[index].test=_test;
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    function updetStatu(uint _index)public{

        Todo storage todo = todos[_index];
        todo.completed=!todo.completed;
    }
}