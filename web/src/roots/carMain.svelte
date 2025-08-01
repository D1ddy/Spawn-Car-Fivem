<script>
    import Header from "./header.svelte";
    import Cars from "./cars.svelte";
    import Buttons from "./buttons.svelte";
    let {arrayOfVehicles} = $props(); 
</script>
<style>
    div{
        background-color: rgba(0, 0, 0, 0.671);
        width: 90vh;
        height: 60vh;
        display: grid;
        grid-template-columns: 5vh 1fr 1fr 1fr 5vh;
        grid-template-rows: 10vh 1fr 10vh 5vh;
        border-radius: 3px;
        box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px;
    }
</style>
<div>
    <Header />
    <Cars {arrayOfVehicles}/>
    <Buttons />
</div>