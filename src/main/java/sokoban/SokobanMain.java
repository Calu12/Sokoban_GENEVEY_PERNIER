package sokoban;

import com.codingame.gameengine.runner.SoloGameRunner;

public class SokobanMain {
    public static void main(String[] args) {
        String niveau = "test15.json";

        jsonCharArray.main(new String[]{niveau});

        MyPlanner.main(new String[]{"src\\main\\java\\sokoban\\domain.pddl", "src\\main\\java\\sokoban\\sokoban_problem.pddl"});

        SoloGameRunner gameRunner = new SoloGameRunner();
        gameRunner.setAgent(Agent.class);
        gameRunner.setTestCase(niveau);

        gameRunner.start();
    }
}
