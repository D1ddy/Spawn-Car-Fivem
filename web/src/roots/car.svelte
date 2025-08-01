<script>
	import { fetchNui } from "$lib/utils/fetchNui";
    import {visible} from '../store/store'
    
    visible.subscribe((value) => {})
    let {carName} = $props();
    
</script>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Gelasio:ital,wght@0,400..700;1,400..700&family=Iceland&family=Orbitron:wght@700&family=VT323&display=swap');
    div{
        color: #cecece;
        font-size: 4vh;
        justify-self: center;
        align-self: center;
        font-family: "Iceland", sans-serif;
        font-weight: 400;
        font-style: normal;
    }
    div:hover{
        cursor: default;
        font: 3.5;
        color: #fafafa;
    }
</style>
<!-- svelte-ignore a11y_click_events_have_key_events -->
<!-- svelte-ignore a11y_no_static_element_interactions -->
<div onclick="{() => {
    visible.set(false);
    fetchNui('getSelectedCar', carName);
}}">
    {carName}
</div>