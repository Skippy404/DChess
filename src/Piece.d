import std.stdio;
import std.conv;
import std.ascii;
import Player : Color;

class Piece {
	char piece;
	private Color color;
	
	this(char piece, Color color) {
		this.piece = piece;
		this.color = color;
	}

	char getP() {
		return this.piece;
	}

	int getPC() {
		return this.color;
	}

	int check_move(int[] move) {
		int flag = 1;
		
		if (piece == 'p') {
			//piece is a pawn
			int m, md;
			if (color) {
				m = 1; //bpawn
				md = 1;
				if (move[1] == 1) {
					md = 2;
				}
			} else {
				m = -1; //wpawn;
				md = -1;
				if (move[1] == 6) {
					md = -2;
				}
			}

			if (move[0] == move[2] &&
				(move[1] + m == move[3] || move[1] + md == move[3])) {
				flag = 1;
			} else {
				//could be taking enemy piece
				/*
				int lt = -1, rt = 1;
				if ((move[0] + lt == move[2] || move[0] + rt == move[2]) &&
					 move[1] + m == move[3] &&)
				*/
				flag = 0;
			}
		}

		return flag;
	}

	int is_enemy(int color) {
		if (this.color == 2) {
			return 0;
		} else if (this.color != color) {
			return 1;
		} else {
			return 0;
		}
	}

	override string toString() {
		string c;
		if (color == 1 || color == 2) {
			return to!(string)(this.piece);
		} else {
			return to!(string)(toUpper(this.piece));
		}
	}
}
