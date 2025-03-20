//
//  HomeView.swift
//  CineHive
//
//  Created by 이종민 on 2/18/25.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel = MovieViewModel()
    @State private var selectedPlatform: StreamingPlatform = .all
    @State private var scrollOffset: CGFloat = 0
    @State private var showPlatformIntro = false
    @State private var currentIntroIndex = 0
    @State private var isRefreshing = false
    @State private var selectedGenre: String? = nil
    
    // 스타일 색상
    private let backgroundColor = Color.black
    private let textColor = Color.white
    private let accentColor = Color.red
    private let secondaryTextColor = Color.gray
    
    // 스트리밍 플랫폼 목록
    private let platforms: [StreamingPlatform] = [.all, .netflix, .disney, .appleTV, .wavve, .tving]
    
    // 장르 목록
    private let genres = [
        GenreItem(name: "액션", icon: "flame.fill", color: .orange, count: 320),
        GenreItem(name: "로맨스", icon: "heart.fill", color: .pink, count: 254),
        GenreItem(name: "SF", icon: "star.fill", color: .blue, count: 189),
        GenreItem(name: "코미디", icon: "face.smiling.fill", color: .yellow, count: 276),
        GenreItem(name: "드라마", icon: "person.2.fill", color: .purple, count: 402),
        GenreItem(name: "스릴러", icon: "exclamationmark.triangle.fill", color: .red, count: 210),
        GenreItem(name: "호러", icon: "bolt.fill", color: .gray, count: 165),
        GenreItem(name: "애니메이션", icon: "sparkles", color: .green, count: 230)
    ]
    
    // 스트리밍 플랫폼 소개 텍스트
    private let platformIntros = [
        "Netflix는 전 세계적으로 가장 인기 있는 스트리밍 서비스로, 다양한 오리지널 콘텐츠를 제공합니다.",
        "Disney+는 디즈니, 픽사, 마블, 스타워즈, 내셔널 지오그래픽의 콘텐츠를 제공하는 스트리밍 서비스입니다.",
        "Apple TV+는 Apple이 제공하는 스트리밍 서비스로, 양질의 오리지널 콘텐츠에 중점을 둡니다.",
        "웨이브는 한국의 주요 방송사들이 제공하는 스트리밍 서비스로, 다양한 한국 콘텐츠를 제공합니다.",
        "티빙은 CJ ENM이 제공하는 스트리밍 서비스로, 다양한 한국 TV 프로그램과 오리지널 콘텐츠를 제공합니다."
    ]
    
    // 샘플 배너 (테스트용!!)
    private let bannerItems: [BannerItem] = [
        BannerItem(
            imageURL: URL(string: "https://image.tmdb.org/t/p/w500/9nhjGaFLKtddDPtPaX5EmKqsWdH.jpg"),
            title: "오늘의 추천 영화",
            subtitle: "인셉션: 꿈 속의 꿈"
        ),
        BannerItem(
            imageURL: URL(string: "https://image.tmdb.org/t/p/w500/8s4h9friP6Ci3adRGahHARVd76E.jpg"),
            title: "오늘의 추천 영화",
            subtitle: "인터스텔라: 우주 속의 꿈"
        ),
        BannerItem(
            imageURL: URL(string: "https://image.tmdb.org/t/p/w500/ywe9S1cOyIhR5yWzK7511NuQ2YX.jpg"),
            title: "새로운 마블 영화",
            subtitle: "캡틴 아메리카: 브레이브 뉴 월드"
        )
    ]
    
    // 플랫폼별 인기 영화 더미 데이터
    private let netflixTopMovies: [PlatformMovie] = [
        PlatformMovie(id: 1, title: "기생충", posterPath: "/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg", rank: 1, platform: .netflix, rating: 8.6, releaseYear: "2019"),
        PlatformMovie(id: 2, title: "옥자", posterPath: "/pHlRr2MfjK77VIIAO7p0R4jhsJI.jpg", rank: 2, platform: .netflix, rating: 7.3, releaseYear: "2017"),
        PlatformMovie(id: 3, title: "로마", posterPath: "/wjrQzXz3DSNJIqFw3VehFgJUkKg.jpg", rank: 3, platform: .netflix, rating: 7.7, releaseYear: "2018"),
        PlatformMovie(id: 4, title: "아이리시맨", posterPath: "/mbm8k3GFhXS0ROd9AD1gqYbIFbM.jpg", rank: 4, platform: .netflix, rating: 7.8, releaseYear: "2019"),
        PlatformMovie(id: 5, title: "결혼 이야기", posterPath: "/pZekG6xabTmZxjmYw10wN84Hp8d.jpg", rank: 5, platform: .netflix, rating: 8.0, releaseYear: "2019")
    ]
    
    private let disneyTopMovies: [PlatformMovie] = [
        PlatformMovie(id: 6, title: "라이온 킹", posterPath: "/dzBtMocZuJbjLOXvrl4zGYigDzh.jpg", rank: 1, platform: .disney, rating: 7.1, releaseYear: "2019"),
        PlatformMovie(id: 7, title: "어벤져스: 엔드게임", posterPath: "/or06FN3Dka5tukK1e9sl16pB3iy.jpg", rank: 2, platform: .disney, rating: 8.4, releaseYear: "2019"),
        PlatformMovie(id: 8, title: "토이 스토리 4", posterPath: "/w9kR8qbmQ01HwnvK4alvnQ2ca0L.jpg", rank: 3, platform: .disney, rating: 7.8, releaseYear: "2019"),
        PlatformMovie(id: 9, title: "소울", posterPath: "/oz9pzIr6W31QoLJgUNhN2RYaYG.jpg", rank: 4, platform: .disney, rating: 8.3, releaseYear: "2020"),
        PlatformMovie(id: 10, title: "만달로리안", posterPath: "/sWgBv7LV2PRoQgkxwlibdGXKz1S.jpg", rank: 5, platform: .disney, rating: 8.5, releaseYear: "2019")
    ]
    
    private let appleTVTopMovies: [PlatformMovie] = [
        PlatformMovie(id: 11, title: "테드 라소", posterPath: "/bzZuGxuJnV8nUM3ADd5PJ3GlqAF.jpg", rank: 1, platform: .appleTV, rating: 8.5, releaseYear: "2020"),
        PlatformMovie(id: 12, title: "파친코", posterPath: "/sztVnE4wCsRJ0cUTrS5HBIxOvmY.jpg", rank: 2, platform: .appleTV, rating: 8.4, releaseYear: "2022"),
        PlatformMovie(id: 13, title: "모닝쇼", posterPath: "/A3ek8SvLOqKG2Rj9Rk5wDRhTn.jpg", rank: 3, platform: .appleTV, rating: 8.2, releaseYear: "2019"),
        PlatformMovie(id: 14, title: "파운데이션", posterPath: "/A9BMpkzmL9OfS7Lh1u4lQ0xrjia.jpg", rank: 4, platform: .appleTV, rating: 7.4, releaseYear: "2021"),
        PlatformMovie(id: 15, title: "세브란스", posterPath: "/2OujgrNvpVwSiGrwTt2W5YeCqmU.jpg", rank: 5, platform: .appleTV, rating: 8.7, releaseYear: "2022")
    ]
    
    // 현재 선택된 플랫폼의 영화 목록 반환
    private var currentPlatformMovies: [PlatformMovie] {
        switch selectedPlatform {
        case .all:
            let merged = (netflixTopMovies + disneyTopMovies + appleTVTopMovies).sorted { $0.rating > $1.rating }
            return Array(merged.prefix(10))
        case .netflix:
            return netflixTopMovies
        case .disney:
            return disneyTopMovies
        case .appleTV:
            return appleTVTopMovies
        default:
            return [] // 나머지 플랫폼은 아직 데이터 없음
        }
    }
    
    var body: some View {
        ZStack {
            // 배경색 설정
            backgroundColor.edgesIgnoringSafeArea(.all)
            
            // 메인 콘텐츠
            ScrollView {
                GeometryReader { geometry in
                    Color.clear.preference(key: ScrollOffsetPreferenceKey.self, value: geometry.frame(in: .global).minY)
                }
                .frame(width: 0, height: 0)
                
                VStack(spacing: 0) {
                    // 배너 섹션 (3D 효과 추가)
                    enhancedBannerView()
                        .padding(.bottom, 20)
                    
                    // 플랫폼 선택기 (향상된 디자인)
                    enhancedPlatformSelector()
                        .padding(.vertical, 10)
                    
                    // 플랫폼 소개 (선택된 플랫폼이 'all'이 아닐 때)
                    if selectedPlatform != .all && showPlatformIntro {
                        enhancedPlatformIntroSection()
                    }
                    
                    // 선택된 플랫폼의 인기 영화 순위
                    if !currentPlatformMovies.isEmpty {
                        enhancedPlatformRankingSection()
                    }
                    
                    // 장르별 탐색 섹션 (향상된 UI)
                    enhancedGenreExplorationSection()
                    
                    // 선택된 장르가 있을 때 장르별 영화 표시
                    if let selectedGenre = selectedGenre {
                        genreMoviesSection(genre: selectedGenre)
                    }
                    
                    // 일반 카테고리별 영화 섹션
                    ForEach(MovieCategory.categories) { category in
                        enhancedCategorySection(category: category)
                    }
                    
                    // 향상된 푸터
                    enhancedFooterSection()
                        .padding(.top, 40)
                        .padding(.bottom, 20)
                }
            }
            .foregroundColor(textColor)
            .coordinateSpace(name: "scroll")
            .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                scrollOffset = value
            }
            .refreshable {
                // 당겨서 새로고침 기능
                await refreshData()
            }
            .overlay(
                // 새로고침 인디케이터
                isRefreshing ? refreshingOverlay() : nil
            )
            
            // 스크롤 시 상단 흐림 효과
            if scrollOffset < 0 {
                VStack {
                    LinearGradient(gradient:
                                    Gradient(colors: [
                                        backgroundColor.opacity(0.9),
                                        backgroundColor.opacity(0.7),
                                        backgroundColor.opacity(0.0)
                                    ]),
                                   startPoint: .top,
                                   endPoint: .bottom)
                    .frame(height: 80)
                    Spacer()
                }
                .edgesIgnoringSafeArea(.top)
                .allowsHitTesting(false)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            // 로고
            ToolbarItem(placement: .principal) {
                HStack(spacing: 4) {
                    // 선택된 플랫폼에 따라 색상 변경
                    Text("Cine")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(textColor)
                    Text("Hive")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(selectedPlatform == .all ? accentColor : selectedPlatform.color)
                }
                .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: 1)
            }
            
            // 검색 버튼
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    // 검색 기능 연결
                }) {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 18))
                        .foregroundColor(textColor)
                }
                .buttonStyle(ScaleButtonStyle())
            }
            
            // 알림 버튼 추가
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    // 알림 기능 연결
                }) {
                    ZStack(alignment: .topTrailing) {
                        Image(systemName: "bell.fill")
                            .font(.system(size: 18))
                            .foregroundColor(textColor)
                        
                        // 알림 배지
                        Circle()
                            .fill(accentColor)
                            .frame(width: 8, height: 8)
                            .offset(x: 2, y: -2)
                    }
                }
                .buttonStyle(ScaleButtonStyle())
                .padding(.leading, 10)
            }
        }
        .onAppear {
            if viewModel.movies.isEmpty {
                viewModel.fetchMovies()
            }
            
            // 애니메이션 효과로 플랫폼 소개 표시
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.easeIn(duration: 0.3)) {
                    showPlatformIntro = true
                }
            }
        }
        .onChange(of: selectedPlatform) { newValue in
            if newValue != .all {
                currentIntroIndex = platforms.firstIndex(of: newValue) ?? 0
                if currentIntroIndex > 0 {
                    currentIntroIndex -= 1 // all 플랫폼을 제외하기 위한 인덱스 조정
                }
                
                // 플랫폼 변경 시 소개 텍스트 애니메이션
                withAnimation(.easeIn(duration: 0.3)) {
                    showPlatformIntro = false
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation(.easeIn(duration: 0.3)) {
                        showPlatformIntro = true
                    }
                }
            } else {
                // '모든 플랫폼' 선택 시 소개 텍스트 숨김
                withAnimation(.easeOut(duration: 0.3)) {
                    showPlatformIntro = false
                }
            }
        }
    }
    
    // MARK: - 향상된 Component Views
    
    // 향상된 배너 뷰 (3D 효과 추가)
    private func enhancedBannerView() -> some View {
        ZStack {
            TabView {
                ForEach(bannerItems) { item in
                    ZStack(alignment: .bottomLeading) {
                        // 배너 이미지
                        AsyncImage(url: item.imageURL) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .overlay(
                                        LinearGradient(
                                            colors: [.clear, .black.opacity(0.4)],
                                            startPoint: .center,
                                            endPoint: .bottom
                                        )
                                    )
                                    .transition(.opacity.animation(.easeInOut(duration: 0.3)))
                            case .empty:
                                Rectangle()
                                    .fill(Color.gray.opacity(0.2))
                                    .overlay(
                                        ProgressView()
                                            .tint(.white)
                                            .scaleEffect(1.5)
                                    )
                            case .failure:
                                Rectangle()
                                    .fill(Color.gray.opacity(0.2))
                                    .overlay(
                                        Image(systemName: "photo.artframe")
                                            .font(.system(size: 30))
                                            .foregroundColor(.gray)
                                    )
                            @unknown default:
                                EmptyView()
                            }
                        }
                        .frame(height: 500)
                        .clipped()
                        
                        // 그라데이션 오버레이
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.clear,
                                backgroundColor.opacity(0.4),
                                backgroundColor.opacity(0.7),
                                backgroundColor
                            ]),
                            startPoint: .center,
                            endPoint: .bottom
                        )
                        .frame(height: 500)
                        
                        // 텍스트 및 버튼
                        VStack(alignment: .leading, spacing: 16) {
                            // 제목 정보
                            VStack(alignment: .leading, spacing: 8) {
                                Text(item.title)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 4)
                                    .background(Color.black.opacity(0.6))
                                    .cornerRadius(4)
                                
                                Text(item.subtitle)
                                    .font(.system(size: 38, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding(.top, 2)
                                    .shadow(color: .black.opacity(0.7), radius: 2, x: 0, y: 1)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            
                            // 액션 버튼들
                            HStack(spacing: 16) {
                                // 상세 정보 버튼
                                Button(action: {
                                    // 상세 정보 액션
                                }) {
                                    HStack(spacing: 8) {
                                        Image(systemName: "info.circle.fill")
                                        Text("상세정보")
                                            .fontWeight(.semibold)
                                    }
                                    .padding(.horizontal, 24)
                                    .padding(.vertical, 12)
                                    .background(Color.white)
                                    .foregroundColor(.black)
                                    .cornerRadius(8)
                                }
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
                                .buttonStyle(SpringButtonStyle())
                                
                                // 트레일러 보기 버튼
                                Button(action: {
                                    // 트레일러 액션
                                }) {
                                    HStack(spacing: 8) {
                                        Image(systemName: "play.fill")
                                        Text("트레일러")
                                            .fontWeight(.medium)
                                    }
                                    .padding(.horizontal, 24)
                                    .padding(.vertical, 12)
                                    .background(Color.black.opacity(0.6))
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.white.opacity(0.6), lineWidth: 1)
                                    )
                                }
                                .buttonStyle(SpringButtonStyle())
                                
                                // 찜하기 버튼 추가
                                Button(action: {
                                    // 찜하기 액션
                                }) {
                                    Image(systemName: "plus")
                                        .font(.system(size: 20))
                                        .padding(12)
                                        .background(Color.black.opacity(0.6))
                                        .foregroundColor(.white)
                                        .clipShape(Circle())
                                        .overlay(
                                            Circle()
                                                .stroke(Color.white.opacity(0.6), lineWidth: 1)
                                        )
                                }
                                .buttonStyle(SpringButtonStyle())
                            }
                            .padding(.top, 8)
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 50)
                    }
                    .modifier(ParallaxBannerEffect())
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .frame(height: 500)
        }
        .cornerRadius(16)
        .padding(.horizontal, 0)
        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
    }
    
    // 향상된 플랫폼 선택기
    private func enhancedPlatformSelector() -> some View {
        VStack {
            Text("스트리밍 플랫폼 선택")
                .font(.headline)
                .foregroundColor(secondaryTextColor)
                .padding(.bottom, 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(platforms, id: \.self) { platform in
                        Button(action: {
                            withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                                selectedPlatform = platform
                            }
                        }) {
                            VStack(spacing: 10) {
                                // 향상된 플랫폼 로고 영역
                                ZStack {
                                    Circle()
                                        .fill(selectedPlatform == platform ?
                                              platform.color.opacity(0.2) : Color.gray.opacity(0.1))
                                        .frame(width: 70, height: 70)
                                    
                                    Image(systemName: platform.iconName)
                                        .font(.system(size: 30))
                                        .foregroundColor(selectedPlatform == platform ?
                                                         platform.color : secondaryTextColor)
                                }
                                .shadow(color: selectedPlatform == platform ?
                                        platform.color.opacity(0.3) : .clear,
                                        radius: 8, x: 0, y: 4)
                                .overlay(
                                    Circle()
                                        .stroke(selectedPlatform == platform ?
                                                platform.color : Color.clear, lineWidth: 2)
                                )
                                .scaleEffect(selectedPlatform == platform ? 1.05 : 1.0)
                                
                                Text(platform.displayName)
                                    .font(.system(size: 13, weight: selectedPlatform == platform ? .bold : .medium))
                                    .foregroundColor(selectedPlatform == platform ? textColor : secondaryTextColor)
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 8)
                        }
                        .buttonStyle(SpringButtonStyle())
                    }
                }
                .padding(.horizontal, 15)
            }
        }
    }
    
    // 향상된 플랫폼 소개 섹션
    private func enhancedPlatformIntroSection() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: selectedPlatform.iconName)
                    .foregroundColor(selectedPlatform.color)
                    .font(.system(size: 16))
                
                Text(selectedPlatform.displayName + " 소개")
                    .font(.headline)
                    .foregroundColor(textColor)
            }
            
            Text(currentIntroIndex < platformIntros.count ? platformIntros[currentIntroIndex] : "")
                .font(.subheadline)
                .foregroundColor(secondaryTextColor)
                .lineSpacing(4)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.top, 4)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(selectedPlatform.color.opacity(0.3), lineWidth: 1)
                )
        )
        .shadow(color: selectedPlatform.color.opacity(0.1), radius: 5, x: 0, y: 2)
        .padding(.horizontal, 15)
        .padding(.bottom, 20)
        .transition(.move(edge: .top).combined(with: .opacity))
    }
    
    // 향상된 플랫폼 랭킹 섹션
    private func enhancedPlatformRankingSection() -> some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "trophy.fill")
                    .foregroundColor(selectedPlatform.color)
                
                Text("\(selectedPlatform == .all ? "인기" : selectedPlatform.displayName) TOP \(selectedPlatform == .all ? "10" : "5")")
                    .font(.title3)
                    .bold()
                    .foregroundColor(textColor)
                
                Spacer()
                
                Button(action: {
                    // 더보기 액션
                }) {
                    Label("더보기", systemImage: "chevron.right")
                        .font(.system(size: 14))
                        .foregroundColor(secondaryTextColor)
                }
                .buttonStyle(ScaleButtonStyle())
            }
            .padding(.horizontal, 15)
            .padding(.top, 20)
            
            // 진화된 순위 표시 방식
            if selectedPlatform == .all {
                // 전체 플랫폼 랭킹은 그리드로 표시
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                    ForEach(currentPlatformMovies.prefix(10)) { movie in
                        NavigationLink(destination: DetailView(movieId: movie.id)) {
                            HStack(spacing: 10) {
                                // 순위
                                Text("\(movie.rank)")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(movie.platform.color)
                                    .frame(width: 26)
                                
                                // 포스터 (향상된 로딩 상태)
                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)")) { phase in
                                    switch phase {
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .transition(.opacity.animation(.easeInOut(duration: 0.3)))
                                    case .empty:
                                        Rectangle()
                                            .fill(Color.gray.opacity(0.2))
                                            .shimmering()
                                    case .failure:
                                        Rectangle()
                                            .fill(Color.gray.opacity(0.15))
                                            .overlay(
                                                Image(systemName: "photo")
                                                    .foregroundColor(.gray)
                                            )
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                                .frame(width: 45, height: 70)
                                .cornerRadius(6)
                                
                                // 영화 정보
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(movie.title)
                                        .font(.footnote)
                                        .fontWeight(.medium)
                                        .foregroundColor(textColor)
                                        .lineLimit(1)
                                    
                                    HStack(spacing: 4) {
                                        Image(systemName: "star.fill")
                                            .font(.system(size: 8))
                                            .foregroundColor(.yellow)
                                        Text(String(format: "%.1f", movie.rating))
                                            .font(.system(size: 10))
                                            .foregroundColor(secondaryTextColor)
                                    }
                                    
                                    Text(movie.platform.displayName)
                                        .font(.system(size: 9))
                                        .foregroundColor(movie.platform.color)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding(8)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray.opacity(0.2), lineWidth: 0.5)
                            )
                            .contentShape(Rectangle())
                        }
                        .buttonStyle(ScaleButtonStyle())
                    }
                }
                .padding(.horizontal, 15)
                .padding(.top, 10)
            } else {
                // 개별 플랫폼 랭킹은 리스트로 표시 (향상된 UI)
                VStack(spacing: 16) {
                    ForEach(currentPlatformMovies) { movie in
                        NavigationLink(destination: DetailView(movieId: movie.id)) {
                            HStack(spacing: 16) {
                                // 순위 뱃지 (향상된 디자인)
                                ZStack {
                                    Circle()
                                        .fill(movie.rank <= 3 ? selectedPlatform.color : Color.gray.opacity(0.2))
                                        .frame(width: 40, height: 40)
                                    
                                    Text("\(movie.rank)")
                                        .font(.system(size: 18, weight: .bold))
                                        .foregroundColor(movie.rank <= 3 ? .white : secondaryTextColor)
                                }
                                .shadow(color: movie.rank <= 3 ? selectedPlatform.color.opacity(0.3) : .clear, radius: 2, x: 0, y: 1)
                                
                                // 포스터 (향상된 로딩 상태)
                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)")) { phase in
                                    switch phase {
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .transition(.opacity.animation(.easeInOut(duration: 0.3)))
                                    case .empty:
                                        Rectangle()
                                            .fill(Color.gray.opacity(0.2))
                                            .shimmering()
                                    case .failure:
                                        Rectangle()
                                            .fill(Color.gray.opacity(0.15))
                                            .overlay(
                                                Image(systemName: "photo")
                                                    .foregroundColor(.gray)
                                            )
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                                .frame(width: 70, height: 100)
                                .cornerRadius(8)
                                .shadow(radius: 2)
                                
                                // 영화 정보
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(movie.title)
                                        .font(.headline)
                                        .foregroundColor(textColor)
                                    
                                    HStack {
                                        // 평점
                                        HStack(spacing: 4) {
                                            Image(systemName: "star.fill")
                                                .font(.system(size: 12))
                                                .foregroundColor(.yellow)
                                            Text(String(format: "%.1f", movie.rating))
                                                .font(.subheadline)
                                                .foregroundColor(secondaryTextColor)
                                        }
                                        
                                        Text("•")
                                            .foregroundColor(secondaryTextColor)
                                        
                                        // 개봉년도
                                        Text(movie.releaseYear)
                                            .font(.subheadline)
                                            .foregroundColor(secondaryTextColor)
                                    }
                                    
                                    // 랭킹 변동 (랜덤 예시)
                                    let rankChange = Int.random(in: -2...2)
                                    HStack(spacing: 4) {
                                        Text("지난주 대비")
                                            .font(.caption)
                                            .foregroundColor(secondaryTextColor)
                                        
                                        Image(systemName: rankChange > 0 ? "arrow.up.circle.fill" :
                                                (rankChange < 0 ? "arrow.down.circle.fill" : "minus.circle.fill"))
                                            .font(.caption)
                                            .foregroundColor(rankChange > 0 ? .green :
                                                              (rankChange < 0 ? .red : .gray))
                                        
                                        Text(rankChange != 0 ? "\(abs(rankChange))위" : "변동없음")
                                            .font(.caption)
                                            .foregroundColor(rankChange > 0 ? .green :
                                                              (rankChange < 0 ? .red : .gray))
                                    }
                                }
                                .padding(.leading, 4)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .font(.caption)
                                    .foregroundColor(secondaryTextColor)
                                    .padding(.trailing, 8)
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.gray.opacity(0.1))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(selectedPlatform.color.opacity(0.2), lineWidth: 1)
                            )
                            .contentShape(Rectangle())
                        }
                        .buttonStyle(ScaleButtonStyle())
                    }
                }
                .padding(.horizontal, 15)
                .padding(.top, 12)
            }
        }
    }
    
    // 장르별 콘텐츠를 보여주는 섹션
    private func genreMoviesSection(genre: String) -> some View {
        VStack(alignment: .leading) {
            HStack {
                // 선택된 장르에 맞는 아이콘 찾기
                if let selectedGenreItem = genres.first(where: { $0.name == genre }) {
                    Image(systemName: selectedGenreItem.icon)
                        .foregroundColor(selectedGenreItem.color)
                }
                
                Text("\(genre) 콘텐츠")
                    .font(.title3)
                    .bold()
                    .foregroundColor(textColor)
                
                Spacer()
                
                Button(action: {
                    // 선택된 장르 초기화
                    withAnimation {
                        selectedGenre = nil
                    }
                }) {
                    Label("닫기", systemImage: "xmark.circle.fill")
                        .font(.system(size: 14))
                        .foregroundColor(secondaryTextColor)
                }
            }
            .padding(.horizontal, 15)
            .padding(.top, 20)
            
            // 장르에 맞는 영화 표시 (여기서는 viewModel.movies 사용)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(viewModel.movies.prefix(8)) { movie in
                        NavigationLink(destination: DetailView(movieId: movie.id)) {
                            VStack(alignment: .leading, spacing: 6) {
                                // 포스터
                                AsyncImage(url: movie.posterURL) { phase in
                                    switch phase {
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                    case .empty, .failure:
                                        Rectangle()
                                            .fill(Color.gray.opacity(0.2))
                                            .overlay(
                                                Image(systemName: "photo")
                                                    .foregroundColor(.gray)
                                            )
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                                .frame(width: 120, height: 180)
                                .cornerRadius(10)
                                .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
                                
                                // 영화 제목 (임시)
                                Text("영화 제목")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(textColor)
                                    .lineLimit(1)
                                
                                // 평점 (임시 데이터)
                                HStack {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                        .font(.system(size: 12))
                                    Text(String(format: "%.1f", Double.random(in: 7.0...9.0)))
                                        .font(.system(size: 12))
                                        .foregroundColor(secondaryTextColor)
                                }
                            }
                            .frame(width: 120)
                        }
                    }
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
            }
        }
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.gray.opacity(0.08))
                .padding(.horizontal, 10)
        )
        .transition(.move(edge: .bottom).combined(with: .opacity))
    }
    
    // 향상된 장르 탐색 섹션
    private func enhancedGenreExplorationSection() -> some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "square.grid.2x2.fill")
                    .foregroundColor(accentColor)
                
                Text("장르별 영화")
                    .font(.title3)
                    .bold()
                    .foregroundColor(textColor)
                
                Spacer()
                
                Button(action: {
                    // 모든 장르 보기 액션
                }) {
                    Text("모두 보기")
                        .font(.system(size: 14))
                        .foregroundColor(secondaryTextColor)
                }
                .buttonStyle(ScaleButtonStyle())
            }
            .padding(.horizontal, 15)
            .padding(.top, 30)
            
            // 장르 카드 슬라이더 (그리드 형태로 개선)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160))], spacing: 12) {
                ForEach(genres) { genre in
                    Button(action: {
                        withAnimation {
                            selectedGenre = genre.name
                        }
                    }) {
                        enhancedGenreCard(genre: genre)
                    }
                    .buttonStyle(SpringButtonStyle())
                }
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
        }
    }
    
    // 향상된 장르 카드 컴포넌트
    private func enhancedGenreCard(genre: GenreItem) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            // 아이콘 및 장르명
            HStack(spacing: 12) {
                ZStack {
                    Circle()
                        .fill(genre.color.opacity(0.2))
                        .frame(width: 40, height: 40)
                    
                    Image(systemName: genre.icon)
                        .font(.system(size: 20))
                        .foregroundColor(genre.color)
                }
                
                Text(genre.name)
                    .font(.headline)
                    .foregroundColor(textColor)
            }
            
            // 영화 수량 표시 (향상된 디자인)
            HStack {
                Text("\(genre.count)작품")
                    .font(.caption)
                    .foregroundColor(secondaryTextColor)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(genre.color)
            }
        }
        .padding(16)
        .frame(height: 100)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.gray.opacity(0.1))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(genre.color.opacity(0.3), lineWidth: 1)
        )
        .shadow(color: genre.color.opacity(0.1), radius: 5, x: 0, y: 2)
    }
    
    // 향상된 카테고리 섹션
    private func enhancedCategorySection(category: MovieCategory) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text(category.title)
                    .font(.title3)
                    .bold()
                    .foregroundColor(textColor)
                
                Spacer()
                
                Button(action: {
                    // 더보기 액션
                }) {
                    Label("더보기", systemImage: "chevron.right")
                        .font(.caption)
                        .foregroundColor(secondaryTextColor)
                }
                .buttonStyle(ScaleButtonStyle())
            }
            .padding(.horizontal, 15)
            .padding(.top, 30)
            
            // 영화 목록
            if viewModel.isLoading && viewModel.movies.isEmpty {
                // 로딩 상태
                enhancedMovieListLoadingView()
            } else if let error = viewModel.error {
                // 에러 상태
                Text(error)
                    .font(.footnote)
                    .foregroundColor(.red)
                    .padding()
            } else {
                // 향상된 영화 목록 뷰
                enhancedMovieListView(movies: viewModel.movies, movieType: category.type)
            }
        }
    }
    
    // 향상된 영화 목록 뷰
    private func enhancedMovieListView(movies: [Movie], movieType: MovieListType) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 15) {
                ForEach(movies) { movie in
                    NavigationLink(destination: DetailView(movieId: movie.id)) {
                        VStack(alignment: .leading, spacing: 8) {
                            // 포스터
                            ZStack(alignment: .bottomTrailing) {
                                AsyncImage(url: movie.posterURL) { phase in
                                    switch phase {
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .transition(.opacity.animation(.easeInOut(duration: 0.2)))
                                    case .empty:
                                        Rectangle()
                                            .fill(Color.gray.opacity(0.2))
                                            .shimmering()
                                    case .failure:
                                        Rectangle()
                                            .fill(Color.gray.opacity(0.15))
                                            .overlay(
                                                Image(systemName: "photo")
                                                    .foregroundColor(.gray)
                                            )
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                                .frame(width: 130, height: 195)
                                .cornerRadius(10)
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 3)
                                
                                // 평점 뱃지
                                ZStack {
                                    Circle()
                                        .fill(Color.black.opacity(0.7))
                                        .frame(width: 36, height: 36)
                                    
                                    HStack(spacing: 2) {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.yellow)
                                            .font(.system(size: 10))
                                        
                                        Text(String(format: "%.1f", Double.random(in: 7.0...9.5)))
                                            .font(.system(size: 12, weight: .bold))
                                            .foregroundColor(.white)
                                    }
                                }
                                .offset(x: -5, y: -5)
                            }
                            
                            // 영화 제목 (임시)
                            Text("영화 제목")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(textColor)
                                .lineLimit(1)
                                .frame(width: 130, alignment: .leading)
                            
                            // 영화 정보 (임시)
                            HStack(spacing: 4) {
                                Text(String(Int.random(in: 2019...2025)))
                                    .font(.system(size: 12))
                                    .foregroundColor(secondaryTextColor)
                                
                                Text("•")
                                    .foregroundColor(secondaryTextColor)
                                
                                Text("\(Int.random(in: 100...180))분")
                                    .font(.system(size: 12))
                                    .foregroundColor(secondaryTextColor)
                            }
                            
                            // 간단한 액션 버튼
                            HStack(spacing: 20) {
                                Button(action: {
                                    // 재생 액션
                                }) {
                                    Image(systemName: "play.fill")
                                        .font(.system(size: 12))
                                        .padding(8)
                                        .background(Color.gray.opacity(0.3))
                                        .clipShape(Circle())
                                }
                                
                                Button(action: {
                                    // 찜하기 액션
                                }) {
                                    Image(systemName: "plus")
                                        .font(.system(size: 12))
                                        .padding(8)
                                        .background(Color.gray.opacity(0.3))
                                        .clipShape(Circle())
                                }
                                
                                Button(action: {
                                    // 정보 액션
                                }) {
                                    Image(systemName: "info.circle")
                                        .font(.system(size: 12))
                                        .padding(8)
                                        .background(Color.gray.opacity(0.3))
                                        .clipShape(Circle())
                                }
                            }
                            .foregroundColor(textColor)
                        }
                    }
                }
            }
            .padding(.horizontal, 15)
            .padding(.bottom, 10)
        }
    }
    
    // 영화 목록 로딩 뷰
    private func enhancedMovieListLoadingView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(0..<5, id: \.self) { _ in
                    VStack(alignment: .leading, spacing: 8) {
                        // 포스터 플레이스홀더
                        Rectangle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 130, height: 195)
                            .cornerRadius(10)
                        
                        // 제목 플레이스홀더
                        Rectangle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 100, height: 16)
                            .cornerRadius(4)
                        
                        // 정보 플레이스홀더
                        Rectangle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 80, height: 12)
                            .cornerRadius(4)
                    }
                }
            }
            .padding(.horizontal, 15)
            .shimmering()
        }
    }
    
    // 향상된 푸터 섹션
    private func enhancedFooterSection() -> some View {
        VStack(spacing: 24) {
            // 소셜 미디어 링크
            HStack(spacing: 24) {
                enhancedSocialButton(icon: "envelope.fill", color: .blue)
                enhancedSocialButton(icon: "globe", color: .green)
                enhancedSocialButton(icon: "bubble.left.fill", color: .yellow)
                enhancedSocialButton(icon: "person.crop.circle.fill.badge.questionmark", color: .purple)
            }
            
            Divider()
                .background(Color.gray.opacity(0.3))
                .padding(.horizontal, 40)
            
            // 링크 영역 (향상됨)
            HStack(spacing: 30) {
                enhancedFooterLink(title: "서비스 이용약관", icon: "doc.text")
                enhancedFooterLink(title: "개인정보 처리방침", icon: "lock.shield")
                enhancedFooterLink(title: "고객 센터", icon: "questionmark.circle")
            }
            
            // 회사 정보
            VStack(spacing: 6) {
                Text("© 2025 CineHive. All Rights Reserved.")
                    .font(.caption)
                    .foregroundColor(secondaryTextColor)
                
                Text("영화 정보 제공: TMDB")
                    .font(.caption2)
                    .foregroundColor(secondaryTextColor.opacity(0.7))
            }
            .padding(.top, 8)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
    }
    
    // 향상된 소셜 버튼
    private func enhancedSocialButton(icon: String, color: Color) -> some View {
        Button(action: {
            // 소셜 링크 액션
        }) {
            Image(systemName: icon)
                .font(.system(size: 18))
                .foregroundColor(.white)
                .frame(width: 44, height: 44)
                .background(color.opacity(0.8))
                .clipShape(Circle())
                .shadow(color: color.opacity(0.3), radius: 5, x: 0, y: 3)
        }
        .buttonStyle(SpringButtonStyle())
    }
    
    // 향상된 푸터 링크
    private func enhancedFooterLink(title: String, icon: String) -> some View {
        Button(action: {
            // 푸터 링크 액션
        }) {
            HStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 10))
                
                Text(title)
                    .font(.caption)
            }
            .foregroundColor(secondaryTextColor)
        }
        .buttonStyle(ScaleButtonStyle())
    }
    
    // 새로고침 오버레이
    private func refreshingOverlay() -> some View {
        VStack {
            ProgressView()
                .scaleEffect(1.5)
                .tint(.white)
                .padding(20)
                .background(Color.black.opacity(0.7))
                .cornerRadius(10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.2))
        .edgesIgnoringSafeArea(.all)
    }
    
    // MARK: - Helper Methods
    
    // 새로고침 함수
    private func refreshData() async {
        isRefreshing = true
        viewModel.fetchMovies()
        
        // 시각적 피드백을 위한 최소 지연
        try? await Task.sleep(nanoseconds: 800_000_000) // 0.8초
        
        isRefreshing = false
    }
}

// MARK: - Supporting Types & Modifiers

// 배너 패럴랙스 효과 모디파이어
struct ParallaxBannerEffect: ViewModifier {
    @State private var offset: CGSize = .zero
    
    func body(content: Content) -> some View {
        content
            .offset(y: offset.height * 0.3)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        offset = value.translation
                    }
                    .onEnded { _ in
                        withAnimation(.spring()) {
                            offset = .zero
                        }
                    }
            )
    }
}

// 스프링 버튼 애니메이션 스타일
struct SpringButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.94 : 1)
            .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: configuration.isPressed)
    }
}

// 일반 스케일 버튼 스타일
struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.97 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

// 쉬머링(Shimmering) 효과 모디파이어
struct ShimmerModifier: ViewModifier {
    @State private var phase: CGFloat = 0
    
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { geometry in
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color.clear, location: phase - 0.3),
                            .init(color: Color.white.opacity(0.3), location: phase),
                            .init(color: Color.clear, location: phase + 0.3)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .mask(content)
                    .blendMode(.screen)
                }
            )
            .onAppear {
                withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                    phase = 1.0
                }
            }
    }
}

extension View {
    func shimmering() -> some View {
        self.modifier(ShimmerModifier())
    }
}

// 스크롤 옵셋 추적을 위한 PreferenceKey
struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

// 스트리밍 플랫폼 정의
enum StreamingPlatform: String, CaseIterable {
    case all
    case netflix
    case disney
    case appleTV
    case wavve
    case tving
    
    var displayName: String {
        switch self {
        case .all: return "모든 플랫폼"
        case .netflix: return "넷플릭스"
        case .disney: return "디즈니+"
        case .appleTV: return "Apple TV+"
        case .wavve: return "웨이브"
        case .tving: return "티빙"
        }
    }
    
    var iconName: String {
        switch self {
        case .all: return "play.rectangle.on.rectangle.fill"
        case .netflix: return "n.square.fill"
        case .disney: return "d.square.fill"
        case .appleTV: return "apple.logo"
        case .wavve: return "w.square.fill"
        case .tving: return "t.square.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .all: return .gray
        case .netflix: return .red
        case .disney: return .blue
        case .appleTV: return .gray
        case .wavve: return .blue
        case .tving: return .red
        }
    }
}

// 장르 항목 정의
struct GenreItem: Identifiable {
    var id = UUID()
    let name: String
    let icon: String
    let color: Color
    let count: Int
}

// 플랫폼별 영화 모델
struct PlatformMovie: Identifiable {
    let id: Int
    let title: String
    let posterPath: String
    let rank: Int
    let platform: StreamingPlatform
    let rating: Double
    let releaseYear: String
    
    var posterURL: URL? {
        URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
    }
}

// MARK: - Preview
#Preview {
    NavigationView {
        HomeView()
    }
}
