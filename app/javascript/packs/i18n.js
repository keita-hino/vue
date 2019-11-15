import Vue from 'vue'
import VueI18n from 'vue-i18n'

const messages = {
  en: {
    message: {
      hello: 'hello world'
    }
  },
  ja: {
    message: {
      working_groups: {
        develop: '開発',
        design: 'デザイン',
        marketing: 'マーケティング',
        sales: '営業'
      }
    }
  }
}

Vue.use(VueI18n);

export const i18n = new VueI18n({
  locale: 'ja',
  messages,
});

export default new VueI18n({ i18n });