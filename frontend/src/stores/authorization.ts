import { reactive } from 'vue'
import { defineStore } from 'pinia'

export interface IAuthorization {
  authorized: boolean
  auth_level: 0 | 1 | 2 // 0: not logged in, 1: logged in, 2: admin
  authorized_actions: number // bitfield of authorized actions
  token: string
}

export interface IAuthorizationEditor {
  authorized?: boolean
  auth_level?: 0 | 1 | 2 // 0: not logged in, 1: logged in, 2: admin
  authorized_actions?: number // bitfield of authorized actions
  token?: string
}

export const useAuthorizationStore = defineStore('authorization', () => { 
  
  const authorization = reactive<IAuthorization>({
    authorized: false,
    auth_level: 0, 
    authorized_actions: 0, 
    token: '',
  })
  
  function set_authorization(_authorization: IAuthorization) {
    authorization.authorized = _authorization.authorized
    authorization.auth_level = _authorization.auth_level
    authorization.authorized_actions = _authorization.authorized_actions
    authorization.token = _authorization.token
  }

  function clear_authorization() {
    authorization.authorized = false
    authorization.auth_level = 0
    authorization.authorized_actions = 0
    authorization.token = ''
  }

  function update_authorization(_authorization: IAuthorizationEditor) {
    authorization.authorized = _authorization.authorized ?? authorization.authorized
    authorization.auth_level = _authorization.auth_level ?? authorization.auth_level
    authorization.authorized_actions = _authorization.authorized_actions ?? authorization.authorized_actions
    authorization.token = _authorization.token ?? authorization.token
  }

  return {
    authorization,
    set_authorization,
    clear_authorization,
    update_authorization,
  }
}, {
  persist: true,
})