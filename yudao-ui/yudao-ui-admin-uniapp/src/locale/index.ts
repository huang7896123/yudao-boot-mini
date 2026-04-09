import { createI18n } from 'vue-i18n'
import en from './en.json'
import zhHans from './zh-Hans.json'

const messages = {
  'zh-Hans': zhHans,
  en,
}

const i18n = createI18n({
  legacy: true,
  // locale: 'en',
  locale: 'zh-Hans',
  // locale: (uni.getLocale ? uni.getLocale() : 'zh-Hans'),
  fallbackLocale: 'en',
  messages,
})

export default i18n

export function translate(key: string) {
  if (!key)
    return ''
  return i18n.global.t(key)
}

// 获取当前语言环境
function getCurrentLocale() {
  const locale = (i18n.global as any).locale
  if (typeof locale === 'string')
    return locale
  return locale?.value || 'zh-Hans'
}

// 获取消息
export function getMessage<T = any>(key: string): T | undefined {
  const locale = getCurrentLocale()
  const message = (i18n.global as any).getLocaleMessage(locale) as any
  if (!key)
    return message as T

  const parts = key.split('.')
  let current: any = message
  for (const part of parts) {
    if (current == null)
      return undefined
    current = current[part]
  }
  return current as T
}

// 获取枚举标签
export interface I18nEnumLabelOptions {
  matchKey?: string
  labelKey?: string
  ignoreCase?: boolean
}

// 获取枚举标签
export function getEnumLabel(listName: string, value?: string, options: I18nEnumLabelOptions = {}) {
  const { matchKey = 'value', labelKey = 'label', ignoreCase = true } = options

  const list = getMessage<Array<Record<string, any>>>(listName)
  if (!value || !Array.isArray(list))
    return value || ''

  const input = value.toString()
  const normalizedInput = ignoreCase ? input.toLowerCase() : input

  const matched = list.find((item) => {
    const raw = item?.[matchKey]
    const candidate = raw == null ? '' : raw.toString()
    const normalizedCandidate = ignoreCase ? candidate.toLowerCase() : candidate
    return normalizedCandidate === normalizedInput
  })

  const label = matched?.[labelKey]
  return label == null ? value : label.toString()
}
