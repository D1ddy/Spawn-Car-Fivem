<script lang="ts">
	import { fetchNui } from "$lib/utils/fetchNui";
	import { useNuiEvent } from "$lib/utils/useNuiEvent";
    import {visible} from '../store/store'
   
    visible.subscribe((value:boolean) => {})
</script>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Gelasio:ital,wght@0,400..700;1,400..700&family=Iceland&family=Orbitron:wght@700&family=VT323&display=swap');
    div{
        grid-row: 3;
        grid-column: 3;
        display: flex;
        gap: 10vh;
        justify-self: center;
        align-items: center;
        align-self: center;
    }
    .buttons{
        width: 20vh;
        height: 5vh;
        cursor: pointer;
        background-color: rgb(197, 42, 42);
        border: none;
        border-radius: 50px;
        color: whitesmoke;
        font-size: 3vh;
        font-family: "Iceland", sans-serif;
        font-weight: 600;
        font-style: normal;
    }
    .buttons:hover{
        background-color: rgb(177, 42, 42);
    }
</style>
<div>
    <button id="randomCar" class="buttons" onclick="{() => {
        fetchNui('close');
        visible.set(false);
    }}">Random</button>
    <button id="selectCar" class="buttons">Select</button>
</div>