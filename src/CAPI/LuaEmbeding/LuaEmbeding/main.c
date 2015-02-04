#include <stdio.h>
#include <string.h>
#include <assert.h>

#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"

int main(void){
    int x = 10, y = 22, result = 0;
    
    lua_State *L = luaL_newstate();
    luaL_openlibs(L);							// 加载Lua库
    
    if(luaL_loadfile(L, "func.lua") != 0)    	// load lua file
        return 0;
    
    lua_pcall(L, 0, LUA_MULTRET, 0);			//执行匿名函数，以编译源代码成二进制码
    //并将全局变量压栈（函数名也是变量）
    lua_getglobal(L, "Func");
    lua_getfield(L, -1, "add");					//定位到函数
    lua_pushnumber(L, x);
    lua_pushnumber(L, y);
    
    if(lua_pcall(L, 2, 1, 0) != 0) {           // execute funciton
        printf("\nError running function 'add' : %s",
               lua_tostring(L, -1));
        return 0;
    }
    
    result = lua_tonumber(L, -1);
    lua_pop(L, 1);
    
    printf("Result: %d\n", result);
}

/*
 static void stackDump(lua_State *L){
	int i;
	int top = lua_gettop(L);
	for(i = 1; i <= top; i++){
 int t = lua_type(L, i);
 switch(t){
 case LUA_TSTRING: {
 printf("'%s'", lua_tostring(L, i));
 break;
 }
 case LUA_TBOOLEAN: {
 printf(lua_toboolean(L, i) ? "true" : "false");
 break;
 }
 case LUA_TNUMBER: {
 printf("%g", lua_tonumber(L, i));
 break;
 }
 default: {
 printf("%s", lua_typename(L, t));
 break;
 }
 }
 printf(" ");
	}
	printf("\n");
 }
 int main(void){
	char buff[256];
	int error;
	lua_State *L = luaL_newstate();
	luaL_openlibs(L);
	
	//ensure that there are at least 20 free stack
	lua_checkstack(L, 20);
	lua_pushstring(L, "hello");
	stackDump(L);
	lua_remove(L, 0);
	stackDump(L);
	while(fgets(buff, sizeof(buff), stdin) != NULL){
 error = luaL_loadbuffer(L, buff, strlen(buff), "line") ||
 lua_pcall(L, 0, 0, 0);
 if(error){
 fprintf(stderr, "%s", lua_tostring(L, -1));
 lua_pop(L, 1);
 }
	}
	lua_close(L);
	return 0;
 }
 */
