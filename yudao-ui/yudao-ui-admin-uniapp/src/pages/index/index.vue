<template>
  <view class="yd-page-container">
    <!-- 顶部导航栏 -->
    <wd-navbar
      title="工作台"
      placeholder safe-area-inset-top fixed
    />

    <wd-row class="p-30rpx">
      <wd-col :span="12" class="pr-15rpx">
        <view class="item-card bg-white flex justify-between items-center">
          <view class="flex items-center">
            <view class="i-my-icons-wenjian-is mr-16rpx text-38rpx"></view>
            <view class="text-28rpx">文件</view>
          </view>
          <wd-icon name="chevron-right" class="opacity-70" size="22px"></wd-icon>
        </view>
      </wd-col>
      <wd-col :span="12" class="pl-15rpx">
        <view class="item-card bg-white flex justify-between items-center">
          <view class="flex items-center">
            <view class="i-my-icons-renwu-is mr-16rpx text-38rpx"></view>
            <view class="text-28rpx">任务</view>
          </view>
          <wd-icon name="chevron-right" class="opacity-70" size="22px"></wd-icon>
        </view>
      </wd-col>
    </wd-row>

    <view class="px-30rpx mt-20rpx">
      <view class="title-box mb-20rpx">
        <view class="text-34rpx font-semibold">打印机</view>
      </view>
      <view v-for="data in 3" :key="data" class="item-card bg-white flex justify-between items-center mb-30rpx" @click="handleGoDetails(data)">
        <view>
          <view class="text-36rpx font-semibold">小黑妞</view>
          <view class="mt-10rpx">
            <wd-tag class="tag-state-box" color="#4fd562" bg-color="#eefbf1"><text class="cp-dian mr-3rpx"></text>空闲</wd-tag>
          </view>
          <view class="mt-50rpx">
            <view class="text-24rpx opacity-80">总打印时长：1044小时5分</view>
            <view class="text-24rpx mt-15rpx opacity-80 ">总消耗耗材：45339.04ml</view>
            <view class="text-24rpx mt-15rpx opacity-80">机型：Qubea 线光机X3</view>
          </view>
        </view>
        <wd-img :src="cpImgUrl" width="280rpx" height="280rpx" mode="aspectFit"/>
      </view>


      <view class="my-48rpx">
        <wd-button block type="primary" custom-style="height:40px; border-radius: 5px">
          添加打印机
        </wd-button>
      </view>
    </view>


  </view>
</template>

<script lang="ts" setup>
import cpImgUrl from '@/static/images/pic-xgj.png'

defineOptions({
  name: 'Home',
})

definePage({
  type: 'home',
  style: {
    navigationStyle: 'custom',
  },
})

// 跳转详情页
/** 跳转到个人资料 */
function handleGoDetails(id) {
  uni.navigateTo({ url: '/pages/index/details/index' })
}

</script>
