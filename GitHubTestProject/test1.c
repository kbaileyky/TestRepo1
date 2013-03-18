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


void test3() {
	return;
}

void Test 5(int stuff){
	return stuff -1;
}