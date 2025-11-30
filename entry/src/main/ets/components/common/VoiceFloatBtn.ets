@Component
export struct VoiceFloatBtn {
  build() {
    // 仅小屏显示（匹配HTML的md:hidden）
    Button() {
      Image($r("app.media.ic_mic"))
        .width(24)
        .height(24)
        .fillColor($r("app.color.white"))
    }
    .width(48)
    .height(48)
    .borderRadius($r("app.float.radius_circle"))
    .backgroundColor($r("app.color.accent"))
    .shadow({ radius: 8, color: $r("app.color.accent") + '50', offsetX: 0, offsetY: 4 })
    .position({ bottom: 72, right: 24 })
    .scale({ x: 1, y: 1 })
    .animation({ duration: 200, curve: Curve.EaseInOut })
    // .onHover((isHover: boolean) => {
    //   // 悬停缩放动效
    //   this.scale = isHover ? 1.1 : 1;
    // })
  }
}