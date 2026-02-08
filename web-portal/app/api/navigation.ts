import { useApi } from '~/composables/useApi'

export function getNavigation() {
  const api = useApi()
  return api.get('/cms/navigation/all')
}
