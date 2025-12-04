#include <iostream>

// PROJETO
// Dado o algoritmo do máximo divisor comum (MDC) descrito a seguir:#include <iostream>

int main() {

bool i_go, o_rdy; 			// entradas e saídas de 1 bit
int i_x, i_y, o_d;			// entradas e saídas de 8 bit
int x, y;					// variáveis internas

while (1) {
    o_rdy = 1;				// o_rdy: saída de 1 bit
    while (!i_go);			// i_go: entrada de 1 bit
    x = i_x;				// i_x : entrada de 8 bits
    y = i_y;				// i_y : entrada de 8 bits
    o_rdy = 0;

    while (x != y) {
        if (x < y)
        	y = y - x;
        else
            x = x - y;
    }
    o_d = x;				// o_d: saída de 8 bits
}
	return 0;
}