<template>
  <view class="yd-page-container">
    <!-- 顶部导航栏 -->
    <wd-navbar
      title="模型详情"
      left-arrow placeholder safe-area-inset-top fixed
      @click-left="handleBack"
    />

    <view class="mb-20rpx bg-white">
      <Banner :banner-list="bannerList" :height="500" />

      <view class="p-30rpx">
        <view class="text-32rpx font-700">【月饼指尖陀螺】【asdmkjzx fiddse fdsasd】</view>
        <view class="mt-20rpx flex justify-between opacity-60">
          <view class="flex">
            <view class="flex items-center justify-between">
              <wd-icon name="download1" size="26rpx" />
              <view class="ml-5rpx text-24rpx">8</view>
            </view>
            <view class="ml-30rpx flex items-center justify-between">
              <wd-icon name="browse" size="30rpx" />
              <view class="ml-5rpx text-24rpx">8</view>
            </view>
          </view>
          <view class="text-24rpx">2024-09-19 21:21:29</view>
        </view>
        <view class="mt-20rpx flex items-center rounded-8rpx bg-[#f1f1f1] px-15rpx py-12rpx opacity-60">
          <wd-icon name="discount-filled" size="30rpx" />
          <view class="ml-5rpx text-24rpx">玩具与游戏/其他玩具与游戏</view>
        </view>
        <view class="mt-30rpx flex items-center justify-between">
          <view class="flex items-center">
            <wd-img src="https://picsum.photos/id/100/300/300" width="70rpx" height="70rpx" radius="22" mode="aspectFill" />
            <view>
              <view class="ml-10rpx text-26rpx opacity-80">小野猫</view>
              <view class="ml-10rpx text-22rpx opacity-60">@xsdwa_1223132</view>
            </view>
          </view>
          <view class="text-24rpx text-primary">
            <wd-tag color="#4d80f0" bg-color="#f3f3f3" round>
              <wd-icon name="add" size="text-24rpx" /><text class="ml-5rpx">关注</text>
            </wd-tag>
          </view>
        </view>
      </view>
    </view>

    <!-- 详情 -->
    <detail-content-card class="detail-content-selector mb-20rpx" :content="state.goodsInfo.description" />

    <!-- 评价 -->
    <detail-comment-card class="detail-comment-selector" :goods-id="state.goodsId" />

    <view class="foot-box border-top border-bottom bg-white">
      <view class="flex items-center justify-between px-30rpx py-21rpx">
        <view class="flex items-center opacity-70">
          <wd-icon name="thumb-up" size="30rpx" />
          <text class="ml-10rpx text-28rpx">23</text>
        </view>
        <view class="flex items-center opacity-70">
          <wd-icon name="books" size="30rpx" />
          <text class="ml-10rpx text-28rpx">123</text>
        </view>
        <wd-button style="width: 58%;">准备打印</wd-button>
      </view>
    </view>
    <!-- 底部安全区域 -->
    <view class="h-150rpx" />
  </view>
</template>

<script lang="ts" setup>
import { ref } from 'vue'
import { navigateBackPlus } from '@/utils/index'
import Banner from '../components/banner.vue'
import detailCommentCard from './components/detail-comment-card.vue'
import detailContentCard from './components/detail-content-card.vue'

defineOptions({
  name: 'ModelDetails',
})

definePage({
  style: {
    navigationStyle: 'custom',
  },
})

const state = reactive({
  goodsId: 0,
  skeletonLoading: true, // SPU 加载中
  goodsInfo: {
    description: `
      <h1 style="color: #333;">你好，Wot-UI</h1>
      <p>这是一段<span style="color: red;">红色</span>的富文本内容。</p>
      <p>这是一段<span style="color: red;">红色</span>的富文本内容。</p>
      <p>这是一段<span style="color: red;">红色</span>的富文本内容。</p>
      <p>这是一段<span style="color: red;">红色</span>的富文本内容。</p>
      <img src="https://picsum.photos/id/100/300/100" style="width:100%;" />
    `,
  }, // SPU 信息
  showSelectSku: false, // 是否展示 SKU 选择弹窗
  selectedSku: {}, // 选中的 SKU
  settlementSku: {}, // 结算的 SKU：由于 selectedSku 不进行默认选中，所以初始使用结算价格最低的 SKU 作为基础展示
  showModel: false, // 是否展示 Coupon 优惠劵的弹窗
  couponInfo: [], // 可领取的 Coupon 优惠劵的列表
  showActivityModel: false, // 【满减送/限时折扣】是否展示 Activity 营销活动的弹窗
  rewardActivity: {}, // 【满减送】活动
  activityList: [], // 【秒杀/拼团/砍价】可参与的 Activity 营销活动的列表
})

const bannerList = ref([
  { id: 1, link: null, url: 'https://picsum.photos/id/100/300/200' },
  { id: 2, link: null, url: 'https://picsum.photos/id/101/300/200' },
  { id: 3, link: null, url: 'https://picsum.photos/id/102/300/200' },
])

/** 返回上一页 */
function handleBack() {
  navigateBackPlus()
}
</script>

<style lang="scss" scoped>
.foot-box {
  position: fixed;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 120rpx;
}
</style>
