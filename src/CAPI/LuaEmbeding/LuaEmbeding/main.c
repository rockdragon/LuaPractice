#include <stdio.h>
#include <string.h>
#include <assert.h>

#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"

#define MAX_COLOR   255

void error(lua_State *L, const char *msg){
    printf("Error running in stack: %s\n",
           lua_tostring(L, -1));
}

int get_field(lua_State *L, const char *key){
    int result;
    lua_pushstring(L, key);
    lua_gettable(L, -2);       // retrieve table[key]
    if(!lua_isnumber(L, -1))
        error(L, "invalid component in background color.");
    result = (int)lua_tonumber(L, -1) * MAX_COLOR;
    lua_pop(L, 1);
    return result;
}

void set_field(lua_State *L, const char *index, int value){
    lua_pushnumber(L, (double)value/MAX_COLOR);
    lua_setfield(L, -2, index);    // set value into table[key]
}

struct ColorTable{
    char *name;
    unsigned char red, green, blue;
} colortable[] = {
    { "WHITE", MAX_COLOR, MAX_COLOR, MAX_COLOR },
    { "BLACK", 0, 0, 0 },
    { "RED", MAX_COLOR, 0, 0 },
    { "GREEN", 0, MAX_COLOR, 0 },
    { "BLUE", 0, 0, MAX_COLOR },
    {NULL, 0, 0, 0}
};

void set_color(lua_State *L, struct ColorTable *ct){
    lua_newtable(L);
    set_field(L, "r", ct->red);
    set_field(L, "g", ct->green);
    set_field(L, "b", ct->blue);
    lua_setglobal(L, ct->name);
}

int main(int argc, const char* argv[]){
    printf("loading lua.\n");
    
    int x = 10, y = 22, result = 0;
    
    lua_State *L = luaL_newstate();
    luaL_openlibs(L);							// 加载Lua库
    
    if(luaL_loadfile(L, "../../../../LuaEmbeding/func.lua") != 0)    	// load lua file
        return 0;
    
    lua_pcall(L, 0, LUA_MULTRET, 0);			//执行匿名函数，以编译源代码成二进制码
    
    // 第一种方式
//    lua_getglobal(L, "Func");
//    lua_pushstring(L, "add");
//    lua_gettable(L, -2);                          //定位到函数
    
    //第二种方式
    lua_getglobal(L, "Func");
    lua_getfield(L, -1, "add");                     //定位到函数
    lua_pushnumber(L, x);
    lua_pushnumber(L, y);
    
    if(lua_pcall(L, 2, 1, 0) != 0) {           // execute funciton
        error(L, lua_tostring(L, -1));
        return 0;
    }
    result = lua_tonumber(L, -1);
    lua_pop(L, 1);
    printf("Result: %d\n", result);
    
    
    lua_getfield(L, -1, "x");
    result = (int)lua_tonumber(L, -1);
    printf("x is: %d\n", result);
    lua_pop(L, 1);
    
    
    lua_getfield(L, -1, "position");
    if(lua_pcall(L, 0, 2, 0) != 0){
        error(L, lua_tostring(L, -1));
        return 0;
    }
    printf("position results: %d %d\n",
           (int)lua_tonumber(L, -1), (int)lua_tonumber(L, -2));
    lua_pop(L, 2);
    
    set_color(L, &colortable[3]);           // GREEN --> lua global
    
    lua_getfield(L, -1, "printcolor");
    if(lua_pcall(L, 0, 0, 0) != 0){
        error(L, lua_tostring(L, -1));
        return 0;
    }

    printf("now stack top is: %d\n", lua_gettop(L));
}

