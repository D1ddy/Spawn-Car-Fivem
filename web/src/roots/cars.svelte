<script lang="ts">
    import Car from "./car.svelte";
    let {arrayOfVehicles} = $props();
</script>
<style>
    div{
        display: grid;
        grid-template-columns: 1fr 1fr 1fr;
        grid-template-rows: 1fr 1fr;
        grid-row: 2;
        grid-column: 2/5;
        width: 100%;
        height: 100%;
        background-color: rgba(48, 48, 48, 0.884);
    }
</style>
<div>
    {#each arrayOfVehicles as carName}
        <Car {carName}/>
    {/each}
</div>