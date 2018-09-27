import numpy as np


class Robot(object):
    def __init__(self, grid, x, y):
        self.dir = 0
        self.grid = grid
        self.x = x
        self.y = y

    def calculateCell(self, r_x, r_y):
        x = self.x + r_x
        y = self.y + r_y
        return x, y

    def turnLeft(self):
        self.dir = (self.dir - 1) % 4

    def turnRight(self):
        self.dir = (self.dir + 1) % 4

    def move(self, r_x, r_y):
        row, col = self.calculateCell(r_x, r_y)
        if row < 0 or col < 0 or row >= len(grid) or col >= len(grid[0]):
            return False
        return grid[row][col] == 1 or grid[row][col] == 'C'


    def clean(self, r_x, r_y):
        row, col = self.calculateCell(r_x, r_y)
        if row < 0 or col < 0 or row >= len(grid) or col >= len(grid[0]):
            return False
        grid[row][col] = 'C'


class Solution(object):
    def next_cell(self, x, y, dir):
        if dir == 0:
            return x - 1, y
        elif dir == 1:
            return x, y + 1
        elif dir == 2:
            return x + 1, y
        elif dir == 3:
            return x, y - 1

    def next_cells(self, x, y, dir, visited, cleaned):
        cells = []
        for next_dir in [3,2,1,0]:
            next_dir = (dir + next_dir) % 4
            next_x, next_y = self.next_cell(x, y, next_dir)
            cell_key = '{0},{1}'.format(next_x, next_y)
            clean = 0
            if cell_key in cleaned:
                clean = 1
            dir_key = '{0},{1},{2},{3}'.format(next_x, next_y, next_dir, clean)
            if dir_key in visited:
                continue
            if x == 0 and y == 0:
                print [next_x, next_y]
                print cell_key in cleaned
            if cell_key in cleaned:
                cells.append([next_x, next_y, next_dir])
            else:
                cells.insert(0, [next_x, next_y, next_dir])
        if x == 0 and y == 0:
            print cells
        return cells

    def cleanRoom(self, robot):
        visited = {}
        cleaned = {}
        queue = [[0,0,0]]
        while queue:
            x, y, dir = queue.pop(0)
            key = '{0},{1}'.format(x,y)
            #print '                            '
            #print(np.matrix(grid))
            if key not in cleaned:
                robot.clean(x, y)
                cleaned[key] = True
            for next_x, next_y, next_dir in self.next_cells(x, y, dir, visited, cleaned):
                cell_key = '{0},{1}'.format(next_x, next_y)
                clean = 0
                if cell_key in cleaned:
                    clean = 1
                dir_key = '{0},{1},{2},{3}'.format(next_x, next_y, next_dir, clean)
                if next_dir == (dir + 1) % 4:
                    robot.turnRight()
                elif next_dir == (dir - 1) % 4:
                    robot.turnLeft()
                elif next_dir != dir:
                    robot.turnLeft()
                    robot.turnLeft()
                dir = next_dir
                visited[dir_key] = True
                if robot.move(next_x, next_y):
                    queue.append([next_x, next_y, dir])
                    break

# grid = [[1,1,1,1,1,0,1,1],[1,1,1,1,1,0,1,1],[1,0,1,1,1,1,1,1],[0,0,0,1,0,0,0,0],[1,1,1,1,1,1,1,1]]
# robot = Robot(grid, 1, 3)
# print(np.matrix(grid))
# Solution().cleanRoom(robot)
# print(np.matrix(grid))
#

grid = [[1,1,1,0,0,1,1,1,0,0,0],[0,1,1,1,1,1,1,1,0,1,0],[0,1,1,1,1,1,1,1,0,1,0],[1,1,1,1,1,1,1,1,1,1,1],[1,1,0,1,1,1,1,1,1,1,0],[1,1,0,1,1,1,0,1,1,1,0],[0,1,1,1,1,1,1,0,1,1,0],[0,1,1,1,1,1,1,0,0,0,0],[0,0,1,1,1,0,1,1,0,0,0],[0,1,1,1,1,0,0,1,1,0,0],[0,1,1,1,1,0,0,1,1,1,0],[0,0,0,0,1,1,1,1,1,0,0],[0,0,0,0,0,1,1,0,1,1,0],[0,0,0,0,0,1,1,1,0,0,0]]
#grid = [[0,1,1,1,1,1,1,0,1],[1,1,0,0,0,0,1,1,1],[1,1,1,1,0,0,1,1,0],[0,1,1,1,0,1,1,1,0],[0,0,1,1,1,1,0,0,0],[0,0,1,1,0,0,0,0,0]]
robot = Robot(grid, 11, 7)
print(np.matrix(grid))
Solution().cleanRoom(robot)
print(np.matrix(grid))
