# SwiftUI 학습 정리

SwiftUI를 학습하며 정리한 내용을 기록합니다.

## SwiftUI 개념
SwiftUI는 선언형 UI 프레임워크로, UIKit과 다르게 코드 기반으로 UI를 구성할 수 있다.

### NavigationView
SwiftUI에서 는 화면 간 이동을 가능하게 하는 컨테이너이다.

### VStack & HStack
SwiftUI에서 은 세로 정렬, 은 가로 정렬을 위한 컨테이너이다.

### List
는 SwiftUI에서 반복적인 데이터를 표시할 때 사용된다.

### State & Binding
SwiftUI에서는 와 을 사용하여 UI와 데이터를 연결한다.

### Text & Image
SwiftUI에서 `Text`는 문자열을 표시하는 가장 기본적인 뷰입니다. `Image`는 애셋이나 URL 이미지를 표시할 수 있는 컴포넌트로, `.resizable()`, `.aspectRatio()` 같은 수식어를 통해 다양한 방식으로 레이아웃할 수 있습니다.

### ZStack
`ZStack`은 겹쳐진 레이아웃을 구성할 때 사용하며, 앞뒤로 쌓이는 UI를 구성할 수 있습니다. 예를 들어 텍스트 위에 반투명 배경을 넣을 때 유용합니다.

### Spacer & Divider
`Spacer()`는 가능한 공간을 차지하며 뷰 사이 간격을 조절할 수 있고, `Divider()`는 수평 또는 수직의 구분선을 추가하여 UI를 구분짓는 데 사용됩니다.

### Button
SwiftUI의 `Button`은 사용자의 입력을 받아 특정 액션을 수행하게 합니다. 내부에는 텍스트, 이미지 등 다양한 뷰를 넣을 수 있으며, `.buttonStyle()`로 스타일을 커스터마이징할 수 있습니다.

### @State
`@State`는 뷰 내부에서 상태를 저장하고 관리하는 속성 래퍼입니다. 값이 변경되면 자동으로 뷰가 다시 렌더링됩니다. 주로 사용자 입력이나 토글, 애니메이션 상태 등에 사용됩니다.

### @Binding
`@Binding`은 부모 뷰의 상태를 자식 뷰에서 공유하고 수정할 수 있게 해주는 속성 래퍼입니다. 양방향 데이터 흐름이 필요한 경우 사용합니다.

### @ObservedObject & @Published
`@ObservedObject`는 외부의 상태 객체를 주시하고 값이 바뀔 때마다 뷰를 업데이트합니다. 상태 객체는 `ObservableObject` 프로토콜을 채택하고, 변경되는 속성은 `@Published`로 선언해야 합니다.

### ForEach
`ForEach`는 배열이나 범위를 순회하면서 여러 개의 뷰를 생성할 때 사용됩니다. `id:`를 통해 고유성을 명시해야 하며, `List` 안에서도 자주 활용됩니다.

### NavigationLink
`NavigationLink`는 사용자가 탭했을 때 다음 화면으로 전환되도록 하는 내비게이션 요소입니다. `NavigationStack` 또는 `NavigationView` 안에서 사용되며, 뷰 전환의 흐름을 구성할 수 있습니다.

### Sheet & fullScreenCover
`sheet`는 모달 방식으로 뷰를 띄우는 데 사용되고, `fullScreenCover`는 전체 화면을 덮는 형태로 표시됩니다. 둘 다 `.isPresented` 또는 `item`을 통해 뷰 전환을 제어합니다.

### TabView
SwiftUI의 `TabView`는 탭 형식의 UI를 구성할 수 있는 컴포넌트입니다. 하단 탭바와 함께 여러 화면을 손쉽게 전환할 수 있고, `.tabItem`을 통해 각 탭의 라벨과 아이콘을 설정할 수 있습니다.

### ViewModifier
반복적으로 사용되는 스타일을 `ViewModifier`로 추출하면 코드 재사용성과 유지보수성이 높아집니다. 커스텀 Modifier를 정의하고 `.modifier()`를 사용해서 적용할 수 있습니다.

### GeometryReader
`GeometryReader`는 자식 뷰에 해당 뷰의 크기나 위치 정보를 전달해주는 뷰입니다. 뷰의 동적인 위치 계산이나 반응형 레이아웃을 만들 때 유용하게 활용됩니다.

### ScrollView & LazyVStack
`ScrollView`는 뷰를 스크롤 가능하게 만들고, `LazyVStack`은 성능을 고려하여 필요한 시점에 뷰를 렌더링해줍니다. 리스트 형태를 커스터마이징할 때 자주 사용됩니다.

### Animation
SwiftUI에서 `withAnimation` 블록이나 `.animation()` modifier를 사용하면 부드러운 뷰 전환이 가능합니다. 다양한 커스텀 애니메이션 효과도 적용할 수 있습니다.

### matchedGeometryEffect
`matchedGeometryEffect`는 두 뷰 간의 위치, 크기 등을 애니메이션으로 자연스럽게 연결해주는 효과입니다. Hero 애니메이션이나 상세 페이지 전환에 사용됩니다.

### @EnvironmentObject
`@EnvironmentObject`는 여러 뷰 계층에서 공유되는 전역 상태를 관리할 때 사용됩니다. 예: 로그인 상태, 다크모드 설정 등 앱 전역 데이터 전달

### AppStorage
`AppStorage`는 `UserDefaults`에 바인딩되어 간단한 데이터(설정값 등)를 저장하고 유지할 수 있는 속성 래퍼입니다. 선언형으로 간편하게 상태 유지가 가능함

### Accessibility 대응
`accessibilityLabel`, `accessibilityValue` 등의 수식어를 사용하여 VoiceOver와 같은 보조 기능을 위한 접근성을 개선할 수 있습니다. 사용자 경험 향상에 필수적입니다.
