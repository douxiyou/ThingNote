import { Header } from '../components/common/Header';
import { BottomNav } from '../components/common/BottomNav';
import { VoiceFloatBtn } from '../components/common/VoiceFloatBtn';
import { SpaceSwitcher } from '../components/home/SpaceSwitcher';
import { CameraButton } from '../components/home/CameraButton';
import { QuickFunc } from '../components/home/QuickFunc';
import { SmartOverview } from '../components/home/SmartOverview';
import { ZoneNav } from '../components/home/ZoneNav';
import { CategoryGrid } from '../components/home/CategoryGrid';

@Entry
@Component
struct Index {
  scroller: Scroller = new Scroller()
  build() {
    Column() {
      // 顶部导航栏（匹配HTML的header）
      Header()
      // 主内容区（滚动，匹配HTML的main）
      Scroll(this.scroller) {
        Column({ space: 0 }) {
          // 空间切换器
          SpaceSwitcher()

          // 超级拍照按钮
          CameraButton()

          // 快捷功能区（相册/位置/有效期/共享）
          QuickFunc()

          // 智能概览（物品统计/最近添加/有效期提醒）
          SmartOverview()

          // 家庭分区导航（卧室/厨房/书房/客厅）
          ZoneNav()

          // 物品分类网格（衣物/电子/食品等）
          CategoryGrid()

          // 底部留白（避免被底部导航遮挡）
          Blank().height(80)
        }
        .padding({ left: 16, right: 16 })
      }

      // 底部导航栏（匹配HTML的footer）
      BottomNav()

      // 悬浮语音按钮（小屏适配，匹配HTML的fixed按钮）
      VoiceFloatBtn()
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r("app.color.primary"))
    // 折叠屏适配：监听屏幕尺寸变化（匹配HTML的响应式）
    .onSizeChange((width, height) => {
      console.log(`屏幕尺寸：宽${width}vp，高${height}vp`);
    })
  }
}
