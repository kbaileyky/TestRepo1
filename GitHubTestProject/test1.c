/*
 * test1.c
 *
 *  Created on: Dec 12, 2012
 *      Author: kbailey
 */


int main (void){
	Test1(1);
	Test1(4);

	Test2("qwer");
}

void Test1(int num){
	for(int i = 0; i < num; i++){
		printf("%d ", i);

	}
	printf("\n");
}

void Test2(char *str){
	printf("%s", str);
}


void Test 3(char *str){
	return *str;
}

void Test 4 (int x){
	return x+1;
}