import { onMounted, onBeforeUnmount } from 'vue'

export function useScrollReveal(selector = '.reveal, .reveal-left, .reveal-scale') {
  let observer = null

  onMounted(() => {
    observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            entry.target.classList.add('revealed')
            observer.unobserve(entry.target)
          }
        })
      },
      { threshold: 0.08, rootMargin: '0px 0px -50px 0px' }
    )

    document.querySelectorAll(selector).forEach((el) => observer.observe(el))
  })

  onBeforeUnmount(() => observer?.disconnect())
}
