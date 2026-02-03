<template>
  <view class="yd-page-container">
    <!-- 顶部导航栏 -->
    <wd-navbar
      title="打印机详情"
      left-arrow placeholder safe-area-inset-top fixed
      @click-left="handleBack"
    >
    </wd-navbar>

    <view class="camera-box">
      <view class="play-btn">
        <wd-icon name="play-circle-filled" size="70rpx" color="#fff"></wd-icon>
      </view>
    </view>

    <!--  打印状态  -->
    <view class="px-30rpx mt-30rpx">
      <view class="bg-white  pt-30rpx item-box">
        <view class="flex items-center px-30rpx">
          <view class="bg-[#f1f1f1] rounded-12rpx overflow-hidden">
            <wd-img :src="mxPic" width="200rpx" height="220rpx" mode="aspectFill"/>
          </view>
          <view class="pl-30rpx pt-10rpx">
            <view class="h-130rpx">
              <view class="text-32rpx opacity-90 font-semibold mb-8rpx">下料盒屏1000ML-11-7.STL</view>
              <view class="text-24rpx opacity-60">下料盒屏1000ML-11-7.STL</view>
            </view>
            <view class="flex justify-between items-end">
              <view class="text-24rpx text-primary"><text class="text-40rpx mr-4rpx font-semibold">45</text>%</view>
              <view class="text-24rpx opacity-80 pb-8rpx">388/567 | -4h20m</view>
            </view>
            <view class="-mt-15rpx">
              <wd-progress :percentage="60" hide-text></wd-progress>
            </view>
          </view>
        </view>
        <wd-row class="py-30rpx">
          <wd-col :span="8" class="pr-15rpx">
            <view class="center opacity-50">
              <wd-icon name="rotate" size="28rpx"></wd-icon>
              <view class="text-28rpx pl-10rpx">跳过</view>
            </view>
          </wd-col>
          <wd-col :span="8" class="pr-15rpx border-left">
            <view class="center">
              <wd-icon name="pause-circle-filled" size="30rpx" color="#2E7BFF"></wd-icon>
              <view class="text-28rpx opacity-90 pl-6rpx">暂停打印</view>
            </view>
          </wd-col>
          <wd-col :span="8" class="pr-15rpx border-left">
            <view class="center">
              <wd-icon name="stop-circle-filled" size="30rpx" color="#db4d43"></wd-icon>
              <view class="text-28rpx opacity-90 pl-6rpx">取消打印</view>
            </view>
          </wd-col>
        </wd-row>
      </view>
    </view>

    <!--  打印机信息  -->
    <view class="px-30rpx mt-30rpx">
      <view class="item-box">
        <view class="flex items-center justify-between pt-32rpx pb-22rpx px-25rpx border-bottom">
          <view class="text-28rpx opacity-80">小黑妞</view>
          <view  class="center opacity-50">
            <view class="text-24rpx ">修改设置</view>
            <wd-icon name="chevron-right" size="30rpx"></wd-icon>
          </view>
        </view>
        <wd-cell-group custom-class="printer-group" border>
          <wd-cell title="打印中" label="状态">
            <template #icon>
              <view class="mr-20rpx cp-a-3Ddayin112 text-50rpx mt-18rpx opacity-80"></view>
            </template>
          </wd-cell>
          <wd-cell title="速度优先" label="打印模式" is-link>
            <template #icon>
              <view class="mr-20rpx cp cp-d-printer text-50rpx mt-18rpx opacity-80"></view>
            </template>
          </wd-cell>
          <wd-cell title="70%" label="料盒" is-link>
            <template #icon>
              <view class="mr-20rpx cp cp-shengyuliuliang text-50rpx mt-18rpx opacity-80"></view>
            </template>
          </wd-cell>
        </wd-cell-group>
      </view>
    </view>

    <!--  打印参数   -->
    <view class="px-30rpx mt-30rpx">
      <view class="item-box">
        <view class="flex items-center justify-between pt-32rpx pb-22rpx px-25rpx border-bottom">
          <view class="text-28rpx opacity-80">打印参数</view>
          <view  class="center opacity-50">
            <view class="text-24rpx ">修改参数</view>
            <wd-icon name="chevron-right" size="30rpx"></wd-icon>
          </view>
        </view>
        <wd-cell-group custom-class="printer-group" border>
          <wd-cell title="3" label="底层层数">
            <template #icon>
              <view class="mr-20rpx cp-shezhi1 text-50rpx mt-18rpx opacity-80"></view>
            </template>
          </wd-cell>
          <wd-cell title="9" label="底层扫描数">
            <template #icon>
              <view class="mr-20rpx cp-shezhi1 text-50rpx mt-18rpx opacity-80"></view>
            </template>
          </wd-cell>
          <wd-cell title="3" label="实体层扫描数">
            <template #icon>
              <view class="mr-20rpx cp-shezhi1 text-50rpx mt-18rpx opacity-80"></view>
            </template>
          </wd-cell>
        </wd-cell-group>
      </view>
    </view>



    <!-- 底部安全区域 -->
    <view class="h-40rpx" />
  </view>
</template>

<script lang="ts" setup>
import { navigateBackPlus } from '@/utils'
import mxPic from '@/static/images/pic-moxing.png'

defineOptions({
  name: 'PrinterDetails',
})

definePage({
  style: {
    navigationStyle: 'custom',
  },
})

/** 返回上一页 */
function handleBack() {
  navigateBackPlus()
}

</script>

<style lang="scss" scoped>
.camera-box {
  height: 440rpx;
  background: #000 url("~@/static/images/logo.png") no-repeat center center;
  background-size: 220rpx auto;
  position: relative;
}
.play-btn{
  position: absolute;
  bottom: 25rpx;
  left: 20rpx;
}

.printer-group :deep(.wd-cell) {
  .wd-cell__label{
    line-height: 1;
  }
  .wd-icon-arrow-right{
    margin-top: 14rpx;
  }
}

</style>
