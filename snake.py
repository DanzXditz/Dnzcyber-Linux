#!/usr/bin/env python3
import curses
import random

def main(stdscr):
    curses.curs_set(0)
    stdscr.nodelay(True)
    stdscr.timeout(120)

    if curses.has_colors():
        curses.start_color()
        curses.use_default_colors()
        curses.init_pair(1, curses.COLOR_GREEN, -1)
        curses.init_pair(2, curses.COLOR_RED, -1)
        curses.init_pair(3, curses.COLOR_CYAN, -1)
        curses.init_pair(4, curses.COLOR_YELLOW, -1)

    best = 0
    while True:
        h, w = stdscr.getmaxyx()
        if h < 15 or w < 30:
            stdscr.erase()
            try:
                stdscr.addstr(0, 0, "Terminal kekecilan! Min 30x15. Q keluar.")
            except: pass
            stdscr.refresh()
            stdscr.nodelay(False); stdscr.timeout(-1)
            k = stdscr.getkey()
            if k in ('q','Q'): return
            stdscr.nodelay(True); stdscr.timeout(120)
            continue

        snake = [(h//2, w//2), (h//2, w//2 - 1), (h//2, w//2 - 2)]
        direction = (0, 1)
        pending = direction

        def spawn():
            while True:
                fy = random.randint(2, h - 4)
                fx = random.randint(2, w - 3)
                if (fy, fx) not in snake:
                    return (fy, fx)
        food = spawn()
        score = 0
        dead = False

        while not dead:
            h, w = stdscr.getmaxyx()
            stdscr.erase()

            try:
                header = f"  SNAKE   Score: {score}   Best: {best}  "
                stdscr.addstr(0, max(0,(w-len(header))//2), header,
                              curses.color_pair(4) | curses.A_BOLD)
            except: pass

            try:
                stdscr.addstr(1, 0, "+" + "-" * (w - 2) + "+", curses.color_pair(3))
                stdscr.addstr(h - 3, 0, "+" + "-" * (w - 2) + "+", curses.color_pair(3))
                for i in range(2, h - 3):
                    stdscr.addstr(i, 0, "|", curses.color_pair(3))
                    stdscr.addstr(i, w - 1, "|", curses.color_pair(3))
            except: pass

            try:
                stdscr.addstr(food[0], food[1], "@", curses.color_pair(2) | curses.A_BOLD)
            except: pass

            for i, (sy, sx) in enumerate(snake):
                try:
                    ch = "O" if i == 0 else "o"
                    attr = curses.color_pair(1)
                    if i == 0: attr |= curses.A_BOLD
                    stdscr.addstr(sy, sx, ch, attr)
                except: pass

            try:
                stdscr.addstr(h-1, 0, " [WASD/Arrows] Gerak   [Q] Keluar ", curses.A_DIM)
            except: pass
            stdscr.refresh()

            try:
                key = stdscr.getkey()
                if key in ('q','Q'): return
                if key in ('w','W') and direction != (1,0): pending = (-1,0)
                elif key in ('s','S') and direction != (-1,0): pending = (1,0)
                elif key in ('a','A') and direction != (0,1): pending = (0,-1)
                elif key in ('d','D') and direction != (0,-1): pending = (0,1)
                elif key == 'KEY_UP' and direction != (1,0): pending = (-1,0)
                elif key == 'KEY_DOWN' and direction != (-1,0): pending = (1,0)
                elif key == 'KEY_LEFT' and direction != (0,1): pending = (0,-1)
                elif key == 'KEY_RIGHT' and direction != (0,-1): pending = (0,1)
            except: pass

            direction = pending
            head_y, head_x = snake[0]
            new_head = (head_y + direction[0], head_x + direction[1])

            if new_head[0] <= 1 or new_head[0] >= h - 3 or new_head[1] <= 0 or new_head[1] >= w - 1:
                dead = True; break
            if new_head in snake:
                dead = True; break

            snake.insert(0, new_head)
            if new_head == food:
                score += 1
                if score > best: best = score
                food = spawn()
            else:
                snake.pop()

        stdscr.erase()
        m1 = "  GAME OVER  "
        m2 = f"  Score: {score}   Best: {best}  "
        m3 = "  [SPACE] Main lagi   [Q] Keluar  "
        y = h // 2 - 2
        try:
            stdscr.addstr(y, max(0,(w-len(m1))//2), m1, curses.color_pair(2) | curses.A_BOLD)
            stdscr.addstr(y+1, max(0,(w-len(m2))//2), m2, curses.color_pair(4) | curses.A_BOLD)
            stdscr.addstr(y+3, max(0,(w-len(m3))//2), m3, curses.A_DIM)
        except: pass
        stdscr.refresh()

        stdscr.nodelay(False); stdscr.timeout(-1)
        while True:
            k = stdscr.getkey()
            if k in ('q','Q'): return
            if k == ' ': break
        stdscr.nodelay(True); stdscr.timeout(120)

if __name__ == "__main__":
    try:
        curses.wrapper(main)
    except KeyboardInterrupt:
        pass
