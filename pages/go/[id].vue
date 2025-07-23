<template>
    <div>

    </div>
</template>

<script setup>
import { navigateTo } from 'nuxt/app';
import { onMounted } from 'vue';

const route = useRoute();
let data = ref('');


let chance = 4;
onMounted(async () => {
    data.value = route.params.id;
    // alert(`http://localhost:3000/go/${data.value}`);
    while (chance--) {
        if (data.value == '') {
            // alert('going back');
            navigateTo('/go');
        } else {

            try {
                const res = await $fetch(`http://localhost:3000/go/${data.value}`, {
                    method: "GET"
                })
                // alert(res);
                if (res && res?.url) {
                    navigateTo(res.url, {
                        external: true
                    })
                }
            }
            catch (err) {
                console.log("error in rediection".err);
                navigateTo('/go');
            }
        }
        await new Promise(resolve => setTimeout(() => {
            resolve();
        }, 500));
    }
})

</script>
