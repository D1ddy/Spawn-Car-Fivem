<script lang="ts">
	import { useNuiEvent } from "$lib/utils/useNuiEvent";
	import CarMain from "./roots/carMain.svelte";
	import {visible} from './store/store';
	let isVisible:boolean = $state(false);
	visible.subscribe((value:boolean) =>{
		isVisible = value;
	})
	useNuiEvent('openUI',(data :boolean) => { 
		isVisible = data;
		visible.set(true);
	})
</script>
<style>
	main{
		z-index: 1;
	  	display: flex;
  	    justify-content: center; 
  		align-items: center; 
  		min-height: 90vh; 
	}
</style>
<main>
	{#if isVisible}
	<CarMain />
	{/if}
</main>
