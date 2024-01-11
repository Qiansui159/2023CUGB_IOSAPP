//
//  Main.swift
//  PVZ Game
//
//  Created by Qiansui on 2024/1/10.
//

import UIKit

class TabBarController: UITabBarController {
    
    static let shared = TabBarController()// 共享一个对象实例
    private let TabBarData = UserDefaults.standard// 全局管理用户数据
    
    // 创建一个包含元组的数组
    var plants: [(name: String, suncost: Int, image: UIImage, sentence: String)] = []
    var zombies: [(name: String, image: UIImage, sentence: String)] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // plants
        plants.append(("Peashooter", 100, UIImage(named: "Peashooter")!, "一棵植物，怎么能如此快地生长，并发射如此多的豌豆呢？他说：“努力工作，奉献自己，再加上一份阳光，高纤维和氧化碳均衡搭配，这种健康早餐让一切成为可能。”"))
        plants.append(("Sunflower", 50, UIImage(named: "Sunflower")!, "它亲不自禁地和着节拍起舞。是什么节拍呢? 嗨，是大地自己用来提神的爵士节拍，只有它才能听到。"))
        plants.append(("Wall Nut", 50, UIImage(named: "Wall Nut")!, "“人们想知道我对被僵尸不断咀嚼的感觉如何，”沃尔坚说。“他们没有意识到的是，凭借我有限的感觉，我能感受到的只是一种刺痛，就像放松的背部摩擦。“"))
        plants.append(("Cherry Bomb", 150, UIImage(named: "Cherry Bomb")!, "我想要爆炸！！！"))
        plants.append(("Chomper", 150, UIImage(named: "Chomper")!, "它几乎可以到“恐怖小店”表演它的绝技了，不过它的经济人榨取了它太多的钱，所以他没去成。尽管如此，它没有怨言，只说了句这只是交易的一部分。"))
        plants.append(("Potato Mine", 25, UIImage(named: "Potato Mine")!, "有些人说它是懒惰的，他把所有东西都留到了最后一分钟。它没有说什么。他太忙于思考他的投资策略。"))
        plants.append(("Repeater", 200, UIImage(named: "Repeater")!, "它很好斗。他来自街头，任何人都不放在眼里——无论是植物，还是僵尸。他通过射击豌豆来保持与人们之间的距离。然而私底下，他仍然渴望爱情。"))
        plants.append(("Snow Pea", 175, UIImage(named: "Snow Pea")!, "人们经常说他是多么“酷”，或者劝他“冷静下来”。他们告诉他“保持冷淡。” 它只是翻白眼，其实它都听见了。"))

        
        // zombies
        zombies.append(("Zombie", UIImage(named: "Zombie")!, "这个僵尸喜欢大脑。 无法得到足够的。 大脑，大脑，大脑，白天和黑夜。 老而臭的大脑？ 烂脑子？ 大脑明显超过他们的巅峰？ 无所谓。 常规的僵尸想要他们。"))
        zombies.append(("Conehead Zombie", UIImage(named: "Conehead Zombie")!, "它像其他僵尸一样无意识地向前推进。 但有些东西使他停下来，让他拿起一个交通锥并将它贴在头上。 哦耶。 他喜欢聚会。"))
        zombies.append(("Bucket Zombie", UIImage(named: "Bucket Zombie")!, "它总是穿着一个水桶。 部分原因是在一个漠不关心的世界中坚持自己的独特性。 大多数时候他只是忘了它首先在那里。"))
        zombies.append(("Flag Zombie", UIImage(named: "Flag Zombie")!, "毫无疑问，它喜欢大脑，但在某个地方，他也对旗帜着迷。 也许是因为旗帜上总是有大脑。 很难说。"))
    }
}
