<template>
  <view class="yd-page-container">
    <!-- 顶部导航栏 -->
    <wd-navbar
      :title="$t('pageName.printerDetails')"
      left-arrow placeholder safe-area-inset-top fixed
      @click-left="handleBack"
    />

    <view class="camera-box">
      <view class="play-btn">
        <wd-icon name="play-circle-filled" size="70rpx" color="#fff" />
      </view>
    </view>

    <!--  打印状态  -->
    <view class="mt-30rpx px-30rpx">
      <view class="item-box bg-white pt-30rpx">
        <view class="flex items-center px-30rpx">
          <view class="overflow-hidden rounded-12rpx bg-[#f1f1f1]">
            <wd-img :src="mxPic" width="200rpx" height="220rpx" mode="aspectFill" />
          </view>
          <view class="pl-30rpx pt-10rpx">
            <view class="h-130rpx">
              <view class="mb-8rpx text-32rpx font-semibold opacity-90">下料盒屏1000ML-11-7.STL</view>
              <view class="text-24rpx opacity-60">下料盒屏1000ML-11-7.STL</view>
            </view>
            <view class="flex items-end justify-between">
              <view class="text-24rpx text-primary">
                <text class="mr-4rpx text-40rpx font-semibold">45</text>%
              </view>
              <view class="pb-8rpx text-24rpx opacity-80">388/567 | -4h20m</view>
            </view>
            <view class="-mt-15rpx">
              <wd-progress :percentage="60" hide-text />
            </view>
          </view>
        </view>
        <wd-row class="py-30rpx">
          <wd-col :span="8" class="pr-15rpx">
            <view class="center opacity-50">
              <wd-icon name="rotate" size="28rpx" />
              <view class="pl-10rpx text-28rpx">{{ $t('word.skip') }}</view>
            </view>
          </wd-col>
          <wd-col :span="8" class="border-left pr-15rpx">
            <view class="center">
              <wd-icon name="pause-circle-filled" size="30rpx" color="#2E7BFF" />
              <view class="pl-6rpx text-28rpx opacity-90">{{ $t('word.pausePrint') }}</view>
            </view>
          </wd-col>
          <wd-col :span="8" class="border-left pr-15rpx">
            <view class="center">
              <wd-icon name="stop-circle-filled" size="30rpx" color="#db4d43" />
              <view class="pl-6rpx text-28rpx opacity-90">{{ $t('word.cancelPrint') }}</view>
            </view>
          </wd-col>
        </wd-row>
      </view>
    </view>

    <!--  打印机信息  -->
    <view class="mt-30rpx px-30rpx">
      <view class="item-box">
        <view class="border-bottom flex items-center justify-between px-25rpx pb-22rpx pt-32rpx">
          <view class="text-28rpx opacity-80">{{ $t('word.printerName') }}</view>
          <view class="center opacity-50">
            <view class="text-24rpx">{{ $t('word.setting') }}</view>
            <wd-icon name="chevron-right" size="30rpx" />
          </view>
        </view>
        <wd-cell-group custom-class="printer-group" border>
          <wd-cell :title="getEnumLabel('printerStatus', printerInfo.status)" :label="$t('word.printerStatus')">
            <template #icon>
              <view class="cp-a-3Ddayin112 mr-20rpx mt-18rpx text-50rpx opacity-80" />
            </template>
          </wd-cell>
          <wd-cell :title="getEnumLabel('printerMode', printerInfo.mode)" :label="$t('word.printMode')" is-link>
            <template #icon>
              <view class="cp cp-d-printer mr-20rpx mt-18rpx text-50rpx opacity-80" />
            </template>
          </wd-cell>
          <wd-cell :title="`${printerInfo.ink}%`" :label="$t('word.ink')" is-link>
            <template #icon>
              <view class="cp cp-shengyuliuliang mr-20rpx mt-18rpx text-50rpx opacity-80" />
            </template>
          </wd-cell>
        </wd-cell-group>
      </view>
    </view>

    <!--  打印参数   -->
    <view class="mt-30rpx px-30rpx">
      <view class="item-box">
        <view class="border-bottom flex items-center justify-between px-25rpx pb-22rpx pt-32rpx">
          <view class="text-28rpx opacity-80">{{ $t('word.printParameters') }}</view>
          <view class="center opacity-50">
            <view class="text-24rpx">{{ $t('word.more') }}</view>
            <wd-icon name="chevron-right" size="30rpx" />
          </view>
        </view>
        <wd-cell-group custom-class="printer-group" border>
          <wd-cell title="3" :label="$t('word.bottomLayer')">
            <template #icon>
              <view class="cp-shezhi1 mr-20rpx mt-18rpx text-50rpx opacity-80" />
            </template>
          </wd-cell>
          <wd-cell title="9" :label="$t('word.bottomScanCount')">
            <template #icon>
              <view class="cp-shezhi1 mr-20rpx mt-18rpx text-50rpx opacity-80" />
            </template>
          </wd-cell>
          <wd-cell title="3" :label="$t('word.realLayer')">
            <template #icon>
              <view class="cp-shezhi1 mr-20rpx mt-18rpx text-50rpx opacity-80" />
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
import { getEnumLabel } from '@/locale/index'
import mxPic from '@/static/images/pic-moxing.png'
import { navigateBackPlus } from '@/utils/index'

defineOptions({
  name: 'PrinterDetails',
})

definePage({
  style: {
    navigationStyle: 'custom',
  },
})

// 打印机信息
const printerInfo = ref({
  name: '小黑妞',
  status: 'Printing',
  mode: 'speed',
  ink: 70,
})

/** 返回上一页 */
function handleBack() {
  navigateBackPlus()
}
</script>

<style lang="scss" scoped>
.camera-box {
  height: 440rpx;
  background: #000 url('~/static/images/logo.png') no-repeat center center;
  background-size: 220rpx auto;
  position: relative;
}
.play-btn {
  position: absolute;
  bottom: 25rpx;
  left: 20rpx;
}

.printer-group :deep(.wd-cell) {
  .wd-cell__label {
    line-height: 1;
  }
  .wd-icon-arrow-right {
    margin-top: 14rpx;
  }
}
</style>
