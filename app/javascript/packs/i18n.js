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
      hello: 'こんにちは、世界'
    }
  }
}

Vue.use(VueI18n);

export const i18n = new VueI18n({
  locale: 'ja',
  messages,
});

export default new VueI18n({ i18n });