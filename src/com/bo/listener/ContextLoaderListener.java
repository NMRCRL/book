package com.bo.listener;

import com.bo.entity.Character;
import com.bo.entity.User;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


/**
 * @author liu tianyuan
 * @ClassName
 * @Description
 * @Date 2019/10/4
 * @Version 1.0
 **/
@WebListener
public class ContextLoaderListener implements ServletContextListener {
    /**
     * 初始化
     *
     * @param sce
     */
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("容器启动");
        List<User> userList = new ArrayList<>(3);
        User[] users = {
                new User(1, "aaa@qq.com", "47bce5c74f589f4867dbd57e9ca9f808", "TeTu", "avatar1.jpg", "南京", LocalDate.of(2019, 10, 1)),
                new User(2, "bbb@qq.com", "08f8e0260c64418510cefb2b06eee5cd", "TeDa", "avatar2.jpg", "武汉", LocalDate.of(2019, 10, 2)),
                new User(3, "ccc@qq.com", "9df62e693988eb4e1e1444ece0578579", "TeXin", "avatar3.jpg", "天津", LocalDate.of(2019, 10, 3))
        };
        userList = Arrays.asList(users);

        //创建并生成人物数据列表
        List<Character> characterList = new ArrayList<>(10);
        Character[] characters = {
                new Character(1, "character1.jpg", "简自豪", "中国", "简自豪，游戏名称Uzi，2012年uzi加入皇族后随队出征TGA冬季大奖赛获得亚军，在2012年TGA冬季总决赛，五杀维鲁斯让中国英雄联盟玩家知道了他的存在。"),
                new Character(2, "character2.jpg", "李元浩", "中国", "李元浩，游戏名称xiaohu，在RNG VS WE的比赛中，他凭借着飞机这个英雄，在一场比赛中打出了9万的输出，因此被玩家们称为虎九万或者虎大将军"),
                new Character(3, "character3.jpg", "严君泽", "中国", "严君泽。游戏名称Letme,因为他独具特点的对线风格被玩家们称为让帝，成名英雄为奥恩，现已退役"),
                new Character(4, "character4.png", "刘志豪", "中国", "刘志豪，游戏名称Zz1tai，对线强度极高的上单选手，为RNG的夺冠做出了极大贡献，2018年12月28日，RNG上单选手Zz1tai在RNG六周年的典礼上，宣布正式退役。"),
                new Character(5, "character5.png", "刘世宇", "中国", "刘世宇，游戏名称MLXG，他的打野方式被人们称为绝食性打野，因为捉摸不定的打野路线让很多国内外选手头疼，2019年7月16日，英雄联盟RNG俱乐部官方宣布，职业选手刘世宇因身体原因退役。"),
                new Character(6, "character6.jpg", "史森明", "中国", "史森明，游戏名称Ming，极其优秀的放GANK能力，以及开团能力，被誉为国产第一辅助，同时因为是Uzi选手的辅助性格又可爱，所以被称为狗妃"),
                new Character(7, "character7.jpg", "谢镇营", "中国", "谢镇营，游戏名称LangX,LPL赛区的狼行是一个非常有实力的选手，单带能力强，团战打的好"),
                new Character(8, "character8.png", "洪浩轩", "中国", "洪浩轩，游戏名称Karsa，因为他对打野位置的精确理解，可以快速的通过细节分析出敌方的位置，因此被称为窥屏打野"),
                new Character(9, "character9.jpg", "石伟豪", "中国", "石伟豪，游戏名称AmazingJ，石伟豪，1997年11月8日出生于中国香港，原EP战队上单选手，原IM战队上单选手，2018年12月加入RNG战队"),

        };
        characterList = Arrays.asList(characters);

        //获取全局变量
        ServletContext servletContext = sce.getServletContext();
        //设置全局变量属性，将用户和人物列表数据计入，整个应用可以共享
        servletContext.setAttribute("userList", userList);
        servletContext.setAttribute("characterList", characterList);
    }

    /**
     * 销毁方法
     *
     * @param sce
     */
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("容器销毁");
    }
}