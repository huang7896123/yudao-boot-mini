<template>
  <view class="yd-page-container">
    <!-- 顶部导航栏 -->
    <wd-navbar
      :title="$t('pageName.workbench')"
      placeholder safe-area-inset-top fixed
    />

    <wd-row class="p-30rpx">
      <wd-col :span="12" class="pr-15rpx">
        <view class="item-card flex items-center justify-between bg-white">
          <view class="flex items-center">
            <view class="i-my-icons-wenjian-is mr-16rpx text-38rpx" />
            <view class="text-28rpx">{{ $t('word.file') }}</view>
          </view>
          <wd-icon name="chevron-right" class="opacity-70" size="22px" />
        </view>
      </wd-col>
      <wd-col :span="12" class="pl-15rpx">
        <view class="item-card flex items-center justify-between bg-white">
          <view class="flex items-center">
            <view class="i-my-icons-renwu-is mr-16rpx text-38rpx" />
            <view class="text-28rpx">{{ $t('word.task') }}</view>
          </view>
          <wd-icon name="chevron-right" class="opacity-70" size="22px" />
        </view>
      </wd-col>
    </wd-row>

    <view class="mt-20rpx px-30rpx">
      <view class="title-box mb-20rpx">
        <view class="text-34rpx font-semibold">{{ $t('word.printer') }}</view>
      </view>
      <view v-for="data in 3" :key="data" class="item-card mb-30rpx flex items-center justify-between bg-white" @click="handleGoDetails(data)">
        <view>
          <view class="text-36rpx font-semibold">小黑妞</view>
          <view class="mt-10rpx">
            <wd-tag class="tag-state-box" color="#4fd562" bg-color="#eefbf1">
              <text class="cp-dian mr-3rpx" />空闲
            </wd-tag>
          </view>
          <view class="mt-50rpx">
            <view class="text-24rpx opacity-80">{{ $t('word.printDuration') }}：1044小时5分</view>
            <view class="mt-15rpx text-24rpx opacity-80">{{ $t('word.totalConsumption') }}：45339.04ml</view>
            <view class="mt-15rpx text-24rpx opacity-80">{{ $t('word.model') }}：Qubea 线光机X3</view>
          </view>
        </view>
        <wd-img :src="cpImgUrl" width="280rpx" height="280rpx" mode="aspectFit" />
      </view>

      <view class="my-48rpx">
        <wd-button block type="primary" custom-style="height:40px; border-radius: 5px" @click="handleScan">
          {{ $t('word.addPrinter') }}
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

const scanResult = ref('')
/** 扫描二维码 */
async function handleScan() {
  try {
    const res = await uni.scanCode({
      onlyFromCamera: true, // 是否只允许相机扫码
      scanType: ['qrCode', 'barCode'], // 扫码类型
    })

    console.log('扫码结果:', res)
    scanResult.value = res.result
  } catch (err) {
    console.error('扫码失败:', err)
    uni.showToast({
      title: '扫码取消或失败',
      icon: 'none',
    })
  }
}

// 跳转详情页
/** 跳转到个人资料 */
function handleGoDetails(id) {
  uni.navigateTo({ url: '/pages/index/details/index' })
}
</script>
