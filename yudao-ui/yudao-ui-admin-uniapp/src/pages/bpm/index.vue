<template>
  <view class="yd-page-container">
    <view class="sq-head bg-white flex justify-between items-center px-15px">
      <view class="w-140px">
        <wd-segmented :options="['探索', '社区']" v-model:value="current"></wd-segmented>
      </view>
      <view class="cp-sousuo text-20px font-700"></view>
    </view>


    <view class="mt-50px p-20rpx pb-10rpx bg-white">
      <HomeBanner></HomeBanner>
    </view>



    <!-- Tabs 区域 -->
    <view class="sq-tab">
      <wd-sticky custom-class="sdsd">
        <wd-tabs v-model="tabIndex" sticky @change="handleTabChange">
          <block v-for="item in tabType" :key="item.value">
            <wd-tab :title="`${item.label}`">
            </wd-tab>
          </block>
        </wd-tabs>
      </wd-sticky>
    </view>

    <!-- 数据列表 -->
    <view class="px-15rpx pb-20rpx">
      <view
        v-for="item in list"
        :key="item.id"
        class="mt-24rpx overflow-hidden rounded-12rpx bg-white shadow-sm w-47% float-left mx-1.5%"
        @click="handleDetail(item.id)"
      >
        <wd-img src="https://picsum.photos/seed/picsum/300/200" width="100%" height="280rpx" mode="aspectFill"/>
        <view class="p-20rpx">
          <!-- 消息头部 -->
          <view class="text-32rpx opacity-90 font-semibold mb-12rpx">{{ item.templateNickname }}</view>
          <view class="mb-25rpx flex items-center">
            <wd-img src="https://picsum.photos/id/100/300/300" width="36rpx" height="36rpx" radius="9" mode="aspectFill"/>
            <view class="text-24rpx opacity-80 ml-10rpx">{{ item.templateNickname }}</view>
          </view>
          <view class=" flex items-center justify-between">
            <view class="flex items-center justify-between opacity-60">
              <wd-icon name="download1" size="26rpx"></wd-icon>
              <view class="ml-5rpx text-24rpx">8</view>
            </view>
            <view class="flex items-center justify-between opacity-60">
              <wd-icon name="thumb-up" size="30rpx"></wd-icon>
              <view class="ml-5rpx text-24rpx">8</view>
            </view>
          </view>
        </view>
      </view>
      <view class="clear-both"></view>
      <!-- 加载更多 -->
      <view v-if="loadMoreState !== 'loading' && list.length === 0" class="py-100rpx text-center">
        <wd-status-tip image="content" tip="暂无消息" />
      </view>
      <wd-loadmore
        v-if="list.length > 0"
        :state="loadMoreState"
        @reload="loadMore"
      />
    </view>
  </view>
</template>

<script lang="ts" setup>
import { computed, ref } from 'vue'
import { getAndClearTabParams } from '@/utils/url'
import HomeBanner from './components/banner.vue'
import {useToast} from "wot-design-uni";
import {getMyNotifyMessagePage, NotifyMessage} from "@/api/system/notify/message";
import {LoadMoreState} from "@/http/types";
import DetailPopup from "@/pages/message/components/detail-popup.vue";

definePage({
  style: {
    navigationStyle: 'custom',
  },
})

const current = ref(0);

interface TabItem {
  label: string;
  value: string;
}

const tabIndex = ref<string>('1')
const tabType = reactive<TabItem[]>([
  { label: '为你推荐', value: '1' },
  { label: '30天热门', value: '2' },
  { label: '独家模型', value: '3' },
  { label: '机器人', value: '4' },
  { label: '机器人', value: '5' },
  { label: '首饰', value: '6' },
  { label: '醒狮', value: '7' }
])

/** Tab 切换 */
function handleTabChange({ index }: { index: number }) {
  const selectedTab = tabType[index]
  if (selectedTab) {
    console.log('切换到:', selectedTab.label, selectedTab.value)
  }
}

/** 初始化：根据 tab 参数设置默认 tab */
onShow(() => {
  // 从 globalData 获取参数（switchTab 跳转时使用）
  const tabParams = getAndClearTabParams()
  if (tabParams?.tab) {
    // 如果参数中的 tab 值存在于列表中，则设置
    const exists = tabType.some(item => item.value === tabParams.tab)
    if (exists) {
      tabIndex.value = tabParams.tab
    }
  }
})


// 龙涛加载内容
const toast = useToast()
const total = ref(0)
const list = ref<NotifyMessage[]>([])
const loadMoreState = ref<LoadMoreState>('loading')
const queryParams = ref({
  pageNo: 1,
  pageSize: 10,
})
const detailPopupRef = ref<InstanceType<typeof DetailPopup>>() // 详情弹窗

/** 查询消息列表 */
async function getList() {
  loadMoreState.value = 'loading'
  try {
    const data = await getMyNotifyMessagePage(queryParams.value)
    list.value = [...list.value, ...data.list]
    total.value = data.total
    loadMoreState.value = list.value.length >= total.value ? 'finished' : 'loading'
  } catch {
    queryParams.value.pageNo = queryParams.value.pageNo > 1 ? queryParams.value.pageNo - 1 : 1
    loadMoreState.value = 'error'
  }
}

/** 查看详情 */
function handleDetail(id: number) {
  console.log(id)
}

/** 加载更多 */
function loadMore() {
  if (loadMoreState.value === 'finished') {
    return
  }
  queryParams.value.pageNo++
  getList()
}

/** 触底加载更多 */
onReachBottom(() => {
  loadMore()
})

/** 初始化 */
onMounted(() => {
  getList()
})


</script>
<style lang="scss" scoped>
.sq-head{
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 44px;
  z-index: 500;
  box-sizing: border-box;
  border-bottom: 1px solid #f9f9f9;
}
.sq-head :deep(.wd-segmented) {
  background: none;
  .wd-segmented__item{
    border-radius: 20px;
    padding: 0 5px;
    font-weight: 500;
  }
  .wd-segmented__item.is-active{
    background: #333;
    color: #fff;
  }
}
.sq-tab > *{
  background: none;
  width: 100% !important;
}
</style>
