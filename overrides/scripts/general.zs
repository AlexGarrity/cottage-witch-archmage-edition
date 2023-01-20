import crafttweaker.api.tag.MCTag;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.item.ItemDefinition;
import crafttweaker.api.predicate.ItemPredicate;
import stdlib.List;
import mods.jei.JEI;
import crafttweaker.api.recipe.BlastFurnaceRecipeManager;
import crafttweaker.api.recipe.FurnaceRecipeManager;
import crafttweaker.api.recipe.SmithingRecipeManager;
import crafttweaker.api.item.enchantment.Enchantment;
import crafttweaker.api.ingredient.transform.type.TransformDamage;
import crafttweaker.api.food.FoodProperties;
import crafttweaker.api.block.Block;



// Adds a recipe for the Mimicarnation
craftingTable.addShapeless("mimicarnacream", <item:alexsmobs:mimicream>, [<item:nethersdelight:mimicarnation>, <item:nethersdelight:mimicarnation>, <item:nethersdelight:mimicarnation>, <item:nethersdelight:mimicarnation>]);

// Adds tags to Brooms
<tag:items:crafttweaker:brooms>.add(<item:hexerei:mahogany_broom>);
<tag:items:crafttweaker:brooms>.add(<item:hexerei:willow_broom>);

// Adds compostable tag to make things able to be made into Compost

<tag:items:crafttweaker:compostable>.add(
<item:hexerei:mugwort_flowers>,
<item:hexerei:mugwort_leaves>,
<item:hexerei:yellow_dock_flowers>,
<item:hexerei:yellow_dock_leaves>,
<item:hexerei:belladonna_flowers>,
<item:hexerei:belladonna_berries>,
<item:hexerei:mandrake_root>,
<item:hexerei:mandrake_flowers>,
<item:hexerei:dried_sage>,
<item:hexerei:dried_belladonna_flowers>,
<item:hexerei:dried_mandrake_flowers>,
<item:hexerei:dried_mugwort_flowers>,
<item:hexerei:dried_mugwort_leaves>,
<item:hexerei:dried_yellow_dock_flowers>,
<item:hexerei:dried_yellow_dock_leaves>,
<item:farmersdelight:tree_bark>,
<item:minecraft:rotten_flesh>
);

// Adds dirt tag to a bunch of dirt
<tag:items:crafttweaker:dirts>.add(
<item:minecraft:dirt>,
<item:minecraft:coarse_dirt>,
<item:minecraft:rooted_dirt>,
<item:verdure:smooth_dirt>,
<item:byg:lush_dirt>,
<item:twilightforest:uberous_soil>,
<item:verdure:humus>,
<item:minecraft:podzol>
);

// Change Compost recipe
craftingTable.remove(<item:farmersdelight:organic_compost>);
craftingTable.addShapeless("witchycompost", <item:farmersdelight:organic_compost> * 2, [<tag:items:crafttweaker:dirts>, <tag:items:supplementaries:straw>, <tag:items:supplementaries:straw>, <item:minecraft:bone_meal>, <item:minecraft:bone_meal>, <tag:items:crafttweaker:compostable>, <tag:items:crafttweaker:compostable>, <tag:items:crafttweaker:compostable>, <tag:items:crafttweaker:compostable>]);

// Add rope tags
<tag:items:supplementaries:ropes>.add(<item:farmersdelight:rope>);

// Add milk tags just in case
<tag:items:forge:cheese_or_milk>.add(<item:hexerei:milk_bottle>);
<tag:items:forge:milk>.add(<item:hexerei:milk_bottle>);
<tag:items:forge:milk/milk_bottle>.add(<item:hexerei:milk_bottle>);



// Hides powerless building gadgets

var removeGadgets = [
<item:buildinggadgets:gadget_building>,
<item:buildinggadgets:gadget_exchanging>,
<item:buildinggadgets:gadget_copy_paste>,
<item:buildinggadgets:gadget_destruction>
] as IItemStack[];

for rgadget in removeGadgets {
craftingTable.remove(rgadget);
JEI.hideIngredient(rgadget);
}

// Makes Building Gadgets Accessible without power

var bgMain = <item:buildinggadgets:gadget_building>.withTag({state: {serializer: "buildinggadgets:dummy_serializer" as string, state: {Name: "minecraft:air" as string}, data: {}}, energy: 500000.0 as double});

var exgMain = <item:buildinggadgets:gadget_exchanging>.withTag({state: {serializer: "buildinggadgets:dummy_serializer" as string, state: {Name: "minecraft:air" as string}, data: {}}, energy: 500000.0 as double});

var copasMain = <item:buildinggadgets:gadget_copy_paste>.withTag({mode: 0 as byte, template_id: [700466076, -453686443, -2126732122, 1992073322], energy: 500000.0 as double});

var desMain = <item:buildinggadgets:gadget_destruction>.withTag({overlay: 1 as byte, fuzzy: 1 as byte, energy: 1000000.0 as double});

craftingTable.addShaped("fullbuildinggadget", bgMain, [[<item:minecraft:iron_ingot>, <item:minecraft:redstone>, <item:minecraft:iron_ingot>], [<item:minecraft:diamond>, <item:minecraft:redstone>, <item:minecraft:diamond>], [<item:minecraft:iron_ingot>, <item:minecraft:lapis_lazuli>, <item:minecraft:iron_ingot>]]);

craftingTable.addShaped("fullexchanging", exgMain, [[<item:minecraft:iron_ingot>, <item:minecraft:redstone>, <item:minecraft:iron_ingot>], [<item:minecraft:diamond>, <item:minecraft:lapis_lazuli>, <item:minecraft:diamond>], [<item:minecraft:iron_ingot>, <item:minecraft:lapis_lazuli>, <item:minecraft:iron_ingot>]]);

craftingTable.addShaped("fullcopypaste", copasMain, [[<item:minecraft:iron_ingot>, <item:minecraft:redstone>, <item:minecraft:iron_ingot>], [<item:minecraft:emerald>, <item:minecraft:redstone>, <item:minecraft:emerald>], [<item:minecraft:iron_ingot>, <item:minecraft:lapis_lazuli>, <item:minecraft:iron_ingot>]]);

craftingTable.addShaped("fulldestruction", desMain, [[<item:minecraft:iron_ingot>, <item:minecraft:redstone>, <item:minecraft:iron_ingot>], [<item:minecraft:ender_pearl>, <item:minecraft:redstone>, <item:minecraft:ender_pearl>], [<item:minecraft:iron_ingot>, <item:minecraft:lapis_lazuli>, <item:minecraft:iron_ingot>]]);


var addGadgets = [
    bgMain,
    exgMain,
    copasMain,
    desMain
] as IItemStack[];

for agadget in addGadgets {
JEI.addIngredient(agadget);
}

//Removing Collector's Album items except for the craftable ones

val cakeep = [
"collectorsalbum:album",
"collectorsalbum:common_repacked_card_package",
"collectorsalbum:uncommon_repacked_card_package",
"collectorsalbum:rare_repacked_card_package",
"collectorsalbum:epic_repacked_card_package",
"collectorsalbum:legendary_repacked_card_package",
"collectorsalbum:mythical_repacked_card_package"
];

//bygkeep.registryName

JEI.hideMod("collectorsalbum", (name as string) => {
        return name in cakeep;
});

// Akashic Tome Stuff

var aTomeFull = <item:akashictome:tome>.withTag({"akashictome:data": {ars_nouveau: {id: "ars_nouveau:worn_notebook" as string, Count: 1 as byte}, mysticalworld: {id: "mysticalworld:encyclopedia" as string, Count: 1 as byte}, solapplepie: {id: "solapplepie:food_book" as string, Count: 1 as byte}, collectorsalbum: {id: "collectorsalbum:album" as string, Count: 1 as byte, tag: {}}, babyfat: {id: "patchouli:guide_book" as string, Count: 1 as byte, tag: {"patchouli:book": "babyfat:the_book_of_baby_fat" as string}}, cookingforblockheads: {id: "cookingforblockheads:recipe_book" as string, Count: 1 as byte}, byg: {id: "byg:biomepedia" as string, Count: 1 as byte}, alexsmobs: {id: "alexsmobs:animal_dictionary" as string, Count: 1 as byte}}});

craftingTable.addShapeless("akashicfull", aTomeFull, [<item:minecraft:book>, <item:minecraft:stick>]);

// Remove Smelting Recipes

var removeSmelting = [
    <item:mysticalworld:copper_dust>,
    <item:mysticalworld:tin_dust>,
    <item:mysticalworld:iron_dust>,
    <item:mysticalworld:lead_dust>,
    <item:mysticalworld:silver_dust>,
    <item:mysticalworld:gold_dust>,
    <item:mysticalworld:orichalcum_dust>,
    <item:delightful:animal_fat>,
    <item:delightful:animal_oil_bottle>
] as IItemStack[];
for item in removeSmelting {
blastFurnace.remove(item);
furnace.remove(item);
}

// Remove Smithing Recipes

var removeSmith = [
    <item:gildedarmor:gilded_enderite_helmet>,
    <item:gildedarmor:gilded_enderite_chestplate>,
    <item:gildedarmor:gilded_enderite_leggings>,
    <item:gildedarmor:gilded_enderite_boots>
] as IItemStack[];

for item in removeSmith {
smithing.remove(item);
}

// Remove Crafting Table Recipes & Hide from JEI

var removeNope = [
    <item:enigmaticgraves:grave_finder>,
    <item:ftbquests:missing_item>,
    <item:ftbquests:custom_icon>,
    <item:ftbquests:barrier>,
    <item:ftbquests:stage_barrier>,
    <item:prefab:block_compressed_quartz_crete>,
    <item:prefab:block_double_compressed_quartz_crete>,
    <item:prefab:block_quartz_crete>,
    <item:prefab:block_quartz_crete_wall>,
    <item:prefab:item_string_of_lanterns>,
    <item:prefab:block_quartz_crete_chiseled>,
    <item:prefab:block_quartz_crete_pillar>,
    <item:prefab:block_quartz_crete_stairs>,
    <item:prefab:block_quartz_crete_slab>,
    <item:prefab:block_quartz_crete_smooth>,
    <item:prefab:block_quartz_crete_smooth_wall>,
    <item:prefab:block_quartz_crete_smooth_stairs>,
    <item:prefab:block_quartz_crete_smooth_slab>,
    <item:prefab:item_swift_blade_wood>,
    <item:prefab:item_swift_blade_gold>,
    <item:prefab:item_sickle_wood>,
    <item:prefab:item_sickle_stone>,
    <item:prefab:item_sickle_gold>,
    <item:prefab:item_sickle_iron>,
    <item:prefab:item_sickle_diamond>,
    <item:prefab:item_sickle_netherite>,
    <item:prefab:item_clutch_of_eggs>,
    <item:prefab:block_glass_slab>,
    <item:prefab:block_glass_stairs>,
    <item:prefab:block_paper_lantern>,
    <item:prefab:block_boundary>,
    <item:prefab:item_crate_of_beets>,
    <item:prefab:item_bunch_of_beets>,
    <item:prefab:item_bunch_of_carrots>,
    <item:prefab:item_bunch_of_potatoes>,
    <item:prefab:item_wooden_crate>,
    <item:prefab:block_quartz_crete_bricks>,
    <item:prefab:item_coil_of_lanterns>,
    <item:prefab:item_crate_of_potatoes>,
    <item:prefab:item_crate_of_carrots>,
    <item:prefab:item_swift_blade_netherite>,
    <item:prefab:item_swift_blade_diamond>,
    <item:prefab:item_swift_blade_steel>,
    <item:prefab:item_swift_blade_obsidian>,
    <item:prefab:item_swift_blade_osmium>,
    <item:prefab:item_swift_blade_iron>,
    <item:prefab:item_swift_blade_bronze>,
    <item:prefab:item_swift_blade_stone>,
    <item:prefab:item_swift_blade_copper>,
    <item:titanium:block_test>,
    <item:titanium:block_twenty_four_test>,
    <item:titanium:block_asset_test>,
    <item:titanium:machine_test>,
    <item:titanium:creative_generator>,
    <item:structure_gel:red_gel>,
    <item:structure_gel:blue_gel>,
    <item:structure_gel:green_gel>,
    <item:structure_gel:orange_gel>,
    <item:structure_gel:cyan_gel>,
    <item:structure_gel:yellow_gel>,
    <item:structure_gel:data_handler>,
    <item:structure_gel:dynamic_spawner>,
    <item:structure_gel:building_tool>,
    <item:alexsmobs:blood_sac>,
    <item:alexsmobs:mosquito_proboscis>,
    <item:alexsmobs:blood_sprayer>,
    <item:mysticalworld:cactus_axe>,
    <item:mysticalworld:cactus_hoe>,
    <item:mysticalworld:cactus_knife>,
    <item:mysticalworld:cactus_pickaxe>,
    <item:mysticalworld:cactus_shovel>,
    <item:mysticalworld:cactus_sword>,
    <item:quark:beetroot_crate>,
    <item:quark:potato_crate>,
    <item:quark:carrot_crate>,
    <item:supplementaries:rope>,
    <item:hexerei:milk_bottle>,
    <item:mysticalworld:copper_dust>,
    <item:mysticalworld:tin_dust>,
    <item:mysticalworld:iron_dust>,
    <item:mysticalworld:lead_dust>,
    <item:mysticalworld:silver_dust>,
    <item:mysticalworld:gold_dust>,
    <item:mysticalworld:orichalcum_dust>,
    <item:delightful:animal_fat>,
    <item:delightful:animal_oil_bottle>,
    <item:alexsmobs:komodo_spit>,
    <item:alexsmobs:komodo_spit_bottle>,
    <item:alexsmobs:cockroach_wing>,
    <item:alexsmobs:cockroach_ootheca>,
    <item:alexsmobs:centipede_leg>,
    <item:alexsmobs:centipede_leggings>,
//    <item:alexsmobs:mosquito_larva>,
    <item:alexsmobs:cockroach_wing_fragment>,
    <item:alexsmobs:sombrero>,
    <item:alexsmobs:maraca>,
    <item:alexsmobs:warped_muscle>,
    <item:alexsmobs:hemolymph_sac>,
    <item:alexsmobs:hemolymph_blaster>,
    <item:alexsmobs:tarantula_hawk_wing_fragment>,
    <item:alexsmobs:tarantula_hawk_wing>,
    <item:alexsmobs:tarantula_hawk_elytra>,
    <item:mysticalworld:tin_knife>,
    <item:mysticalworld:copper_knife>,
    <item:mysticalworld:lead_knife>,
    <item:mysticalworld:silver_knife>,
    <item:mysticalworld:stone_knife>,
    <item:mysticalworld:wood_knife>,
    <item:mysticalworld:iron_knife>,
    <item:mysticalworld:gold_knife>,
    <item:mysticalworld:diamond_knife>,
    <item:mysticalworld:netherite_knife>,
    <item:gildedarmor:gilded_enderite_helmet>,
    <item:gildedarmor:gilded_enderite_chestplate>,
    <item:gildedarmor:gilded_enderite_leggings>,
    <item:gildedarmor:gilded_enderite_boots>,
    <item:aquaculture:neptunium_helmet>,
    <item:aquaculture:neptunium_chestplate>, 
    <item:aquaculture:neptunium_leggings>,
    <item:aquaculture:neptunium_boots>,
    <item:mysticalworld:copper_button>,
    <item:pipez:fluid_pipe>,
    <item:pipez:energy_pipe>,
    <item:pipez:gas_pipe>,
    <item:pipez:universal_pipe>
] as IItemStack[];

for item in removeNope {
craftingTable.remove(item);
JEI.hideIngredient(item);
}

// Brewing.addRecipe(output as IItemStack, reagent as IIngredient, input as IIngredient)

brewing.addRecipe(<item:horse_colors:gender_change_item>, <item:alexsmobs:mimicream>, <item:minecraft:potion>.withTag({Potion: "minecraft:awkward" as string}));




// Cloud Crafting

<item:quark:bottled_cloud>.transformReplace(<item:minecraft:glass_bottle>);

craftingTable.addShapeless("bottletocloud", <item:twilightforest:wispy_cloud>, [<item:quark:bottled_cloud>.transformReplace(<item:minecraft:glass_bottle>), <item:quark:bottled_cloud>.transformReplace(<item:minecraft:glass_bottle>), <item:quark:bottled_cloud>.transformReplace(<item:minecraft:glass_bottle>)]);
craftingTable.addShapeless("cloudtocloud", <item:twilightforest:fluffy_cloud>, [<item:twilightforest:wispy_cloud>, <item:twilightforest:wispy_cloud>, <item:twilightforest:wispy_cloud>, <item:twilightforest:wispy_cloud>]);
craftingTable.addShapeless("cloudtobottle", <item:quark:bottled_cloud> * 3, [<item:minecraft:glass_bottle>, <item:minecraft:glass_bottle>, <item:minecraft:glass_bottle>, <item:twilightforest:wispy_cloud>]);

// Time in a Bottle

craftingTable.remove(<item:tiab:time_in_a_bottle>);
craftingTable.addShaped("timeinabottle", <item:tiab:time_in_a_bottle>, [[<item:minecraft:gold_ingot>, <item:minecraft:gold_ingot>, <item:minecraft:gold_ingot>], [<item:minecraft:diamond>, <item:minecraft:clock>, <item:minecraft:diamond>], [<item:minecraft:lapis_lazuli>, <item:quark:bottled_cloud>, <item:minecraft:lapis_lazuli>]]);

// Ars Nouveau Novice Spellbook

craftingTable.addShaped("novicebook", <item:ars_nouveau:novice_spell_book>, 
[[<item:minecraft:air>, <item:minecraft:gold_ingot>, <item:minecraft:air>],
[<item:minecraft:gold_ingot>, <item:ars_nouveau:worn_notebook>, <item:minecraft:gold_ingot>],
[<item:minecraft:air>, <item:minecraft:gold_ingot>, <item:minecraft:air>]]);


// Eggs Carton

craftingTable.remove(<item:prefab:item_carton_of_eggs>);

craftingTable.addShapeless("eggcarton", <item:prefab:item_carton_of_eggs>, [<item:minecraft:egg>, <item:minecraft:egg>, <item:minecraft:egg>, <item:minecraft:egg>, <item:minecraft:egg>, <item:minecraft:egg>, <item:minecraft:egg>, <item:minecraft:egg>, <item:minecraft:egg>]);

// Rumpelstiltzken

craftingTable.addShapeless("strawtogold", <item:mysticalworld:gold_dust>, [<item:mysticalworld:spindle>.transformDamage(10), <item:farmersdelight:straw_bale>]);

// Pearl Necklace Balancing

var pearlnecklaces = [
    <item:crittersandcompanions:pearl_necklace_2>,
    <item:crittersandcompanions:pearl_necklace_3>
] as IItemStack[];

for item in pearlnecklaces {
craftingTable.remove(item);
}

craftingTable.addShapeless("pearl2", <item:crittersandcompanions:pearl_necklace_2>, [<item:crittersandcompanions:pearl_necklace_2>, <item:mysticalworld:lustrous_pearl>]);

craftingTable.addShapeless("pearl3", <item:crittersandcompanions:pearl_necklace_3>, [<item:crittersandcompanions:pearl_necklace_2>, <item:minecraft:heart_of_the_sea>]);

// Making Mysterious Worm craftable

<tag:items:crafttweaker:worms>.add(
<item:twilightforest:moonworm>,
<item:ambientadditions:worm>
);

craftingTable.addShaped("mysteryworm", <item:alexsmobs:mysterious_worm>, [[<tag:items:crafttweaker:worms>, <tag:items:crafttweaker:worms>, <tag:items:crafttweaker:worms>], [<tag:items:crafttweaker:worms>, <item:ars_nouveau:void_jar>, <tag:items:crafttweaker:worms>], [<tag:items:crafttweaker:worms>, <tag:items:crafttweaker:worms>, <tag:items:crafttweaker:worms>]]);

// Alex's Potions Re-Recipes

var lpoi = <item:minecraft:potion>.withTag({Potion: "alexsmobs:long_poison_resistance" as string});
var poi = <item:minecraft:potion>.withTag({Potion: "alexsmobs:poison_resistance" as string});

var lbugp = <item:minecraft:potion>.withTag({Potion: "alexsmobs:long_bug_pheromones" as string});
var bugp = <item:minecraft:potion>.withTag({Potion: "alexsmobs:bug_pheromones" as string});

var awk = <item:minecraft:potion>.withTag({Potion: "minecraft:awkward" as string});

// Brewing.addRecipe(output as IItemStack, reagent as IIngredient, input as IIngredient)

brewing.removeRecipeByReagent(<item:alexsmobs:centipede_leg>);
brewing.removeRecipeByReagent(<item:alexsmobs:cockroach_wing>);
brewing.removeRecipeByReagent(<item:alexsmobs:komodo_spit>);

brewing.addRecipe(bugp, <item:alexsmobs:leafcutter_ant_pupa>, awk);
brewing.addRecipe(poi, <item:minecraft:poisonous_potato>, awk);

brewing.addRecipe(lpoi, <item:minecraft:redstone>, poi);

// Burger recipes

var burgers = [
<item:farmersdelight:hamburger>,
<item:delightful:cheeseburger>,
<item:delightful:deluxe_cheeseburger>
] as IItemStack[];

for item in burgers {
    craftingTable.remove(item);
}


craftingTable.addShapeless("burger", <item:farmersdelight:hamburger>, [
    <item:minecraft:bread>,
    <tag:items:forge:salad_ingredients>,
    <item:farmersdelight:onion>,
    <item:farmersdelight:tomato>,
    <tag:items:forge:cooked_beef>
]);

craftingTable.addShapeless("cheeseburgercon", <item:delightful:cheeseburger>, [
    <item:farmersdelight:hamburger>,
    <tag:items:forge:cheese>
]);

craftingTable.addShapeless("cheeseburger", <item:delightful:cheeseburger>, [
    <item:minecraft:bread>,
    <tag:items:forge:salad_ingredients>,
    <item:farmersdelight:onion>,
    <item:farmersdelight:tomato>,
    <tag:items:forge:cooked_beef>,
    <tag:items:forge:cheese>
]);

craftingTable.addShapeless("ultraburger", <item:delightful:deluxe_cheeseburger>, [
    <item:minecraft:bread>,
    <tag:items:forge:salad_ingredients>,
    <item:farmersdelight:onion>,
    <item:farmersdelight:tomato>,
    <tag:items:forge:cooked_beef>,
    <tag:items:forge:cooked_beef>,
    <tag:items:forge:cheese>,
    <tag:items:forge:cheese>,
    <item:farmersdelight:cooked_bacon>
]);

craftingTable.addShapeless("ultraburgercon", <item:delightful:deluxe_cheeseburger>, [
    <item:delightful:deluxe_cheeseburger>,
    <tag:items:forge:cooked_beef>,
    <tag:items:forge:cheese>,
    <item:farmersdelight:cooked_bacon>
]);

// Tom's Tags

<tag:items:crafttweaker:invcable>.add(
    <item:toms_storage:ts.inventory_cable>,
    <item:toms_storage:ts.inventory_cable_framed>
);

<tag:items:crafttweaker:connector>.add(
    <item:toms_storage:ts.inventory_cable_connector_filtered>,
    <item:toms_storage:ts.inventory_cable_connector>,
    <item:toms_storage:ts.inventory_cable_connector_framed>
);


// Nature's Compass recipe

craftingTable.remove(<item:naturescompass:naturescompass>);

craftingTable.addShaped("naturescompass", <item:naturescompass:naturescompass>, [[<tag:items:minecraft:saplings>, <tag:items:minecraft:logs>, <tag:items:minecraft:saplings>], [<tag:items:minecraft:logs>, <item:hexerei:dowsing_rod>, <tag:items:minecraft:logs>], [<tag:items:minecraft:saplings>, <tag:items:minecraft:logs>, <tag:items:minecraft:saplings>]]);

// Chest recipe?!

craftingTable.addShaped("chestwtf", <item:minecraft:chest>, [[<tag:items:minecraft:planks>, <tag:items:minecraft:planks>, <tag:items:minecraft:planks>], [<tag:items:minecraft:planks>, <item:minecraft:air>, <tag:items:minecraft:planks>], [<tag:items:minecraft:planks>, <tag:items:minecraft:planks>, <tag:items:minecraft:planks>]]);

// ladder recipe?!

craftingTable.addShaped("ladderwtf", <item:minecraft:ladder> * 4, [
    [<item:minecraft:stick>, <item:minecraft:air>, <item:minecraft:stick>], 
    [<item:minecraft:stick>, <tag:items:minecraft:planks>, <item:minecraft:stick>], 
    [<item:minecraft:stick>, <item:minecraft:air>, <item:minecraft:stick>]]);

//making more heat sources work with farmer's delight

// Inventory Remotes

//<tag:items:crafttweaker:remotes>.add(
//    <item:storagenetwork:crafting_remote>,
//    <item:storagenetwork:inventory_remote>
//);

craftingTable.addShapeless("windsweptsandstone", <item:byg:windswept_sandstone>, [<item:byg:windswept_sand>, <item:byg:windswept_sand>, <item:byg:windswept_sand>, <item:byg:windswept_sand>]);

// Eyes
<tag:items:crafttweaker:eyes>.add(
    <item:endrem:evil_eye>,
    <item:endrem:cursed_eye>,
    <item:endrem:rogue_eye>,
    <item:endrem:old_eye>,
    <item:endrem:nether_eye>,
    <item:endrem:lost_eye>,
    <item:endrem:corrupted_eye>,
    <item:endrem:cold_eye>,
    <item:endrem:black_eye>,
    <item:endrem:guardian_eye>,
    <item:endrem:magical_eye>,
    <item:endrem:wither_eye>,
    <item:endrem:witch_eye>,
    <item:endrem:undead_eye>,
    <item:endrem:exotic_eye>
);

craftingTable.addShapeless("endeyestopearl", <item:minecraft:ender_pearl> * 4, [<tag:items:crafttweaker:eyes>]);

// Make frogs tameable
craftingTable.addShapeless("mosquitolarva", <item:alexsmobs:mosquito_larva>, [<item:alexsmobs:maggot>, <item:minecraft:crimson_fungus>]);

// Add uses for Hexerei herbs

var mindful = <item:minecraft:potion>.withTag({Potion: "minecraft:long_regeneration" as string, CustomPotionEffects: [{CurativeItems: [{id: "minecraft:milk_bucket" as string, Count: 1 as byte}], Duration: 2400 as int, ShowIcon: 1 as byte, Ambient: 0 as byte, ShowParticles: 1 as byte, Id: 36 as byte, "forge:id": "mysticalworld:serendipity" as string, Amplifier: 2 as byte}]});

brewing.addRecipe(mindful, <item:hexerei:mindful_trance_blend>, awk);

// Add uses for Selenite

brewing.addRecipe(<item:farmersdelight:milk_bottle>, <item:hexerei:selenite_shard>, <item:minecraft:glass_bottle>);

craftingTable.addShaped("seleniteglass", <item:minecraft:glass> * 8, [[<tag:items:forge:stained_glass>, <tag:items:forge:stained_glass>, <tag:items:forge:stained_glass>], [<tag:items:forge:stained_glass>, <item:hexerei:selenite_shard>, <tag:items:forge:stained_glass>], [<tag:items:forge:stained_glass>, <tag:items:forge:stained_glass>, <tag:items:forge:stained_glass>]]);

// Mandrake as Poppet

craftingTable.addShaped("mandraketotem", <item:minecraft:totem_of_undying>, [
[<item:mysticalworld:silk_thread>, 
<item:endrem:evil_eye>, 
<item:mysticalworld:silk_thread>], 
[<item:mysticalworld:gold_dust>, 
<item:hexerei:mandrake_root>, 
<item:create:powdered_obsidian>], 
[<item:mysticalworld:silk_thread>, 
<item:twilightforest:charm_of_life_1>, 
<item:mysticalworld:silk_thread>]
]);

// Change Ring of Enderchest Recipe

craftingTable.remove(<item:ring_of_enderchest:ring_of_enderchest>);

craftingTable.addShaped("ringofenderchest", <item:ring_of_enderchest:ring_of_enderchest>, [
[<item:minecraft:iron_ingot>, <item:minecraft:ender_pearl>, <item:minecraft:iron_ingot>],
[<item:minecraft:iron_ingot>, <item:minecraft:ender_chest>, <item:minecraft:iron_ingot>],
[<item:minecraft:iron_ingot>, <item:minecraft:ender_pearl>, <item:minecraft:iron_ingot>]
]);

// Add tag to fish mounts

<tag:items:crafttweaker:plaques>.add(
    <item:aquaculture:oak_fish_mount>,
    <item:aquaculture:spruce_fish_mount>,
    <item:aquaculture:birch_fish_mount>,
    <item:aquaculture:jungle_fish_mount>,
    <item:aquaculture:dark_oak_fish_mount>,
    <item:aquaculture:acacia_fish_mount>
);

// Add tag to fishing rods
<tag:items:crafttweaker:goodrods>.add(
    <item:aquaculture:iron_fishing_rod>,
    <item:aquaculture:gold_fishing_rod>,
    <item:aquaculture:diamond_fishing_rod>
);

<tag:items:crafttweaker:goodhooks>.add(
    <item:aquaculture:nether_star_hook>,
    <item:aquaculture:double_hook>,
    <item:aquaculture:diamond_hook>,
    <item:aquaculture:gold_hook>
);

<tag:items:crafttweaker:nichehooks>.add(
    <item:aquaculture:note_hook>,
    <item:aquaculture:redstone_hook>,
    <item:aquaculture:heavy_hook>,
    <item:aquaculture:light_hook>
);

// Making Knives compatible across mods

<tag:items:forge:fillet_knife>.add(
    <item:delightful:copper_knife>,
    <item:delightful:tin_knife>,
    <item:delightful:silver_knife>,
    <item:delightful:lead_knife>,
    <item:delightful:fiery_knife>,
    <item:delightful:ironwood_knife>,
    <item:delightful:knightmetal_knife>,
    <item:delightful:steeleaf_knife>,
    <item:farmersdelight:flint_knife>,
    <item:farmersdelight:iron_knife>,
    <item:farmersdelight:diamond_knife>,
    <item:farmersdelight:netherite_knife>,
    <item:farmersdelight:golden_knife>,
    <item:mysticalworld:sapphire_knife>,
    <item:mysticalworld:orichalcum_knife>
);

<tag:items:forge:tools/knives>.add(
    <item:aquaculture:neptunium_fillet_knife>,
    <item:aquaculture:diamond_fillet_knife>,
    <item:aquaculture:gold_fillet_knife>,
    <item:aquaculture:iron_fillet_knife>,
    <item:aquaculture:stone_fillet_knife>,
    <item:aquaculture:wooden_fillet_knife>,
    <item:mysticalworld:sapphire_knife>,
    <item:mysticalworld:orichalcum_knife>
);

craftingTable.remove(<item:mysticalworld:sliced_carrot>);
craftingTable.remove(<item:mysticalworld:nautilus_horn>);

craftingTable.addShapeless("chopcarrots", <item:mysticalworld:sliced_carrot>, [<tag:items:forge:tools/knives>, <item:minecraft:carrot>]);
craftingTable.addShapeless("nautilushorn", <item:mysticalworld:nautilus_horn>, [<tag:items:forge:tools/knives>, <item:minecraft:nautilus_shell>]);

//craftingTable.remove(<item:aquaculture:neptunes_bounty>);

craftingTable.addShaped("conduit_alt", <item:minecraft:conduit>, [
    [<item:aquaculture:neptunium_ingot>, <item:minecraft:nautilus_shell>, <item:aquaculture:neptunium_ingot>],
    [<item:minecraft:nautilus_shell>, <item:minecraft:heart_of_the_sea>, <item:minecraft:nautilus_shell>],
    [<item:aquaculture:neptunium_ingot>, <item:minecraft:nautilus_shell>, <item:aquaculture:neptunium_ingot>]
]);

// Pet Beds

<tag:items:crafttweaker:petbeds>.add(
    <item:domesticationinnovation:pet_bed_white>,
    <item:domesticationinnovation:pet_bed_orange>,
    <item:domesticationinnovation:pet_bed_magenta>,
    <item:domesticationinnovation:pet_bed_light_blue>,
    <item:domesticationinnovation:pet_bed_yellow>,
    <item:domesticationinnovation:pet_bed_green>,
    <item:domesticationinnovation:pet_bed_brown>,
    <item:domesticationinnovation:pet_bed_blue>,
    <item:domesticationinnovation:pet_bed_purple>,
    <item:domesticationinnovation:pet_bed_cyan>,
    <item:domesticationinnovation:pet_bed_light_gray>,
    <item:domesticationinnovation:pet_bed_gray>,
    <item:domesticationinnovation:pet_bed_pink>,
    <item:domesticationinnovation:pet_bed_lime>,
    <item:domesticationinnovation:pet_bed_red>,
    <item:domesticationinnovation:pet_bed_black>
);

//Craft Water Lettuce

craftingTable.addShapeless("waterlettuce", <item:babyfat:water_lettuce> * 2, [<item:farmersdelight:cabbage>, <item:farmersdelight:rice_panicle>]);

// Mob Catchers

<item:portablemobs:basic_capture_cell>.addTooltip("Catch mobs! One-time use.");
<item:portablemobs:master_capture_cell>.addTooltip("Catch mobs! Multiple uses.");



craftingTable.addShapeless("cloverdye", <item:minecraft:green_dye>, [<item:verdure:clover>]);



// Upgrade your Ars Nouveau armors

//Novice to Mage

craftingTable.addShaped("novicetoappboots", <item:ars_nouveau:apprentice_boots>, [
    [<item:minecraft:air>, <item:ars_nouveau:blaze_fiber>, <item:minecraft:air>],
    [<item:ars_nouveau:blaze_fiber>, <item:ars_nouveau:novice_boots>, <item:ars_nouveau:blaze_fiber>],
    [<item:minecraft:air>, <item:ars_nouveau:blaze_fiber>, <item:minecraft:air>]
]);

craftingTable.addShaped("novicetoapplegs", <item:ars_nouveau:apprentice_leggings>, [
    [<item:minecraft:air>, <item:ars_nouveau:blaze_fiber>, <item:minecraft:air>],
    [<item:ars_nouveau:blaze_fiber>, <item:ars_nouveau:novice_leggings>, <item:ars_nouveau:blaze_fiber>],
    [<item:minecraft:air>, <item:ars_nouveau:blaze_fiber>, <item:minecraft:air>]
]);

craftingTable.addShaped("novicetoappchest", <item:ars_nouveau:apprentice_robes>, [
    [<item:minecraft:air>, <item:ars_nouveau:blaze_fiber>, <item:minecraft:air>],
    [<item:ars_nouveau:blaze_fiber>, <item:ars_nouveau:novice_robes>, <item:ars_nouveau:blaze_fiber>],
    [<item:minecraft:air>, <item:ars_nouveau:blaze_fiber>, <item:minecraft:air>]
]);

craftingTable.addShaped("novicetoapphead", <item:ars_nouveau:apprentice_hood>, [
    [<item:minecraft:air>, <item:ars_nouveau:blaze_fiber>, <item:minecraft:air>],
    [<item:ars_nouveau:blaze_fiber>, <item:ars_nouveau:novice_hood>, <item:ars_nouveau:blaze_fiber>],
    [<item:minecraft:air>, <item:ars_nouveau:blaze_fiber>, <item:minecraft:air>]
]);

// Mage to Archmage

craftingTable.addShaped("apptoarchboots", <item:ars_nouveau:archmage_boots>, [
    [<item:minecraft:air>, <item:ars_nouveau:end_fiber>, <item:minecraft:air>],
    [<item:ars_nouveau:end_fiber>, <item:ars_nouveau:apprentice_boots>, <item:ars_nouveau:end_fiber>],
    [<item:minecraft:air>, <item:ars_nouveau:end_fiber>, <item:minecraft:air>]
]);

craftingTable.addShaped("apptoarchlegs", <item:ars_nouveau:archmage_leggings>, [
    [<item:minecraft:air>, <item:ars_nouveau:end_fiber>, <item:minecraft:air>],
    [<item:ars_nouveau:end_fiber>, <item:ars_nouveau:apprentice_leggings>, <item:ars_nouveau:end_fiber>],
    [<item:minecraft:air>, <item:ars_nouveau:end_fiber>, <item:minecraft:air>]
]);

craftingTable.addShaped("apptoarchchest", <item:ars_nouveau:archmage_robes>, [
    [<item:minecraft:air>, <item:ars_nouveau:end_fiber>, <item:minecraft:air>],
    [<item:ars_nouveau:end_fiber>, <item:ars_nouveau:apprentice_robes>, <item:ars_nouveau:end_fiber>],
    [<item:minecraft:air>, <item:ars_nouveau:end_fiber>, <item:minecraft:air>]
]);

craftingTable.addShaped("apptoarchhead", <item:ars_nouveau:archmage_hood>, [
    [<item:minecraft:air>, <item:ars_nouveau:end_fiber>, <item:minecraft:air>],
    [<item:ars_nouveau:end_fiber>, <item:ars_nouveau:apprentice_hood>, <item:ars_nouveau:end_fiber>],
    [<item:minecraft:air>, <item:ars_nouveau:end_fiber>, <item:minecraft:air>]
]);

// egg carton to eggs

craftingTable.addShapeless("cartontoegg", <item:minecraft:egg> * 9, [<item:prefab:item_carton_of_eggs>]);

//Fish oil craftable by raw fish

craftingTable.addShapeless("fishoil", <item:alexsmobs:fish_oil>, [<tag:items:forge:raw_fishes>, <tag:items:forge:raw_fishes>, <tag:items:forge:raw_fishes>, <tag:items:forge:raw_fishes>, <item:minecraft:glass_bottle>]);

// Remove all recipes in MC Story Mode Armors
craftingTable.removeByModid("mcsa");

<tag:items:crafttweaker:diaknife>.add(<item:aquaculture:diamond_fillet_knife>, <item:farmersdelight:diamond_knife>);

// Add Create support for Cheeses

// HauntingManager.addRecipe(name as string, outputs as Percentaged<IItemStack>[], input as IIngredient, duration as int) as void

<recipetype:create:haunting>.addRecipe("hauntedflaxencheese", [<item:brewinandchewin:flaxen_cheese_wheel> % 100], <item:brewinandchewin:unripe_flaxen_cheese_wheel>, 200);

<recipetype:create:haunting>.addRecipe("hauntedscarletcheese", [<item:brewinandchewin:scarlet_cheese_wheel> % 100], <item:brewinandchewin:unripe_scarlet_cheese_wheel>, 200);

//Make Cheese Compactable

// CompactingManager.addRecipe(name as string, heat as HeatCondition, outputs as Percentaged<IItemStack>[], itemInputs as IIngredientWithAmount[], fluidInputs as FluidIngredient[], duration as int) as void

<recipetype:create:compacting>.addRecipe("compactedflaxencheese", <constant:create:heat_condition:heated>, [<item:brewinandchewin:unripe_flaxen_cheese_wheel> % 100], [<item:minecraft:brown_mushroom> * 2, <item:minecraft:sugar>], [<fluid:minecraft:milk> * 1000], 4000);

<recipetype:create:compacting>.addRecipe("compactedscarletcheese", <constant:create:heat_condition:heated>, [<item:brewinandchewin:unripe_scarlet_cheese_wheel> % 100], [<item:minecraft:crimson_fungus> * 2, <item:minecraft:sugar>], [<fluid:minecraft:milk> * 1000], 4000);

//Make patties more useful

<tag:items:forge:cooked_beef>.add(<item:alexsdelight:bison_patty>, <item:vegetarian_delights:raw_veggie_patty>);

// Teeth

<tag:items:crafttweaker:teeth>.add(
    <item:alexsmobs:shark_tooth>,
    <item:alexsmobs:bone_serpent_tooth>,
    <item:alexsmobs:cachalot_whale_tooth>,
    <item:alexsmobs:serrated_shark_tooth>
);

// Make Sculk Craftable

craftingTable.addShaped("sculkcatalyst", <item:wildbackport:sculk_catalyst> * 4, [[<item:wildbackport:echo_shard>, <item:wildbackport:echo_shard>, <item:wildbackport:echo_shard>],[<item:wildbackport:echo_shard>, <item:minecraft:end_stone>, <item:wildbackport:echo_shard>], [<item:minecraft:end_stone>, <item:minecraft:end_stone>, <item:minecraft:end_stone>]]);

craftingTable.addShaped("sculkshrieker", <item:wildbackport:sculk_shrieker>, [[<tag:items:crafttweaker:teeth>, <tag:items:crafttweaker:teeth>, <tag:items:crafttweaker:teeth>], [ <item:minecraft:air>, <item:wildbackport:sculk_catalyst>, <item:minecraft:air>], [ <item:minecraft:air>, <tag:items:crafttweaker:teeth>, <item:minecraft:air>]]);

craftingTable.addShaped("sculksensor", <item:minecraft:sculk_sensor>, [[<item:minecraft:air>, <item:minecraft:twisting_vines>, <item:minecraft:air>], [<item:wildbackport:echo_shard>, <item:wildbackport:sculk_catalyst>, <item:wildbackport:echo_shard>], [<item:minecraft:air>, <item:wildbackport:echo_shard>, <item:minecraft:air>]]);

//Vermillion Sculk to regular

craftingTable.addShaped("verm2sculkcata", <item:wildbackport:sculk_catalyst> * 8, [[<item:byg:vermilion_sculk>, <item:byg:vermilion_sculk>, <item:byg:vermilion_sculk>], [<item:byg:vermilion_sculk>, <item:wildbackport:echo_shard>, <item:byg:vermilion_sculk>], [<item:byg:vermilion_sculk>, <item:byg:vermilion_sculk>, <item:byg:vermilion_sculk>]]);

craftingTable.addShaped("verm2skulkgrowth", <item:wildbackport:sculk_vein> * 8, [[<item:byg:vermilion_sculk_growth>, <item:byg:vermilion_sculk_growth>, <item:byg:vermilion_sculk_growth>], [<item:byg:vermilion_sculk_growth>, <item:wildbackport:echo_shard>, <item:byg:vermilion_sculk_growth>], [<item:byg:vermilion_sculk_growth>, <item:byg:vermilion_sculk_growth>, <item:byg:vermilion_sculk_growth>]]);

craftingTable.addShapeless("verm2sculktendrils", <item:minecraft:sculk_sensor>, [<item:byg:vermilion_sculk_tendrils>, <item:wildbackport:echo_shard>]);

// Echo Shards Haunting

<recipetype:create:haunting>.addRecipe("haunteddiamonds", [<item:wildbackport:echo_shard> % 80, <item:minecraft:amethyst_shard> % 20], <item:minecraft:diamond>, 200);

craftingTable.remove(<item:supplementaries:pancake>);

craftingTable.addShapeless("pancake", <item:supplementaries:pancake>, [<tag:items:forge:flour>, <tag:items:forge:sugar>, <tag:items:forge:eggs>, <tag:items:forge:milk>]);

// Uncompress honeycomb

craftingTable.addShapeless("honeytocomb", <item:minecraft:honeycomb> * 4, [<item:minecraft:honeycomb_block>]);

// Add tags to Mushroom Colonies for quest purposes
<tag:items:crafttweaker:mushcolony>.add(<item:farmersdelight:red_mushroom_colony>);
<tag:items:crafttweaker:mushcolony>.add(<item:farmersdelight:brown_mushroom_colony>);

<tag:items:crafttweaker:netmushcolony>.add(<item:nethersdelight:crimson_fungus_colony>);
<tag:items:crafttweaker:netmushcolony>.add(<item:nethersdelight:warped_fungus_colony>);

// Add Eye tags
<tag:items:crafttweaker:end_eyes>.add(
    <item:minecraft:ender_eye>,
    <item:endrem:black_eye>,
    <item:endrem:cold_eye>,
    <item:endrem:corrupted_eye>,
    <item:endrem:lost_eye>,
    <item:endrem:nether_eye>,
    <item:endrem:old_eye>,
    <item:endrem:rogue_eye>,
    <item:endrem:cursed_eye>,
    <item:endrem:evil_eye>,
    <item:endrem:guardian_eye>,
    <item:endrem:magical_eye>,
    <item:endrem:wither_eye>,
    <item:endrem:undead_eye>,
    <item:endrem:witch_pupil>
);

//Overweight crops tags
<tag:items:crafttweaker:overcrops>.add(
    <item:overweight_farming:overweight_cabbage_block>,
    <item:overweight_farming:overweight_onion_block>,
    <item:overweight_farming:overweight_apple_block>,
    <item:overweight_farming:overweight_poisonous_potato_block>,
    <item:overweight_farming:overweight_nether_wart_block>,
    <item:overweight_farming:overweight_potato_block>,
    <item:overweight_farming:overweight_cocoa_block>,
    <item:overweight_farming:overweight_carrot_block>,
    <item:overweight_farming:overweight_beetroot_block>
);

// Add Cheese Wheel Tags

<tag:items:crafttweaker:cheeses>.add(
    <item:brewinandchewin:unripe_flaxen_cheese_wheel>,
    <item:brewinandchewin:unripe_scarlet_cheese_wheel>
);

// Add tome tags

<tag:items:crafttweaker:tomes>.add(<item:quark:ancient_tome>);

// Tags for Ritual Tablets

<tag:items:crafttweaker:ritualtablets>.add(
    <item:ars_nouveau:ritual_flight>,
    <item:ars_nouveau:ritual_sunrise>,
    <item:ars_nouveau:ritual_overgrowth>,
    <item:ars_nouveau:ritual_moonfall>,
    <item:ars_nouveau:ritual_fertility>,
    <item:ars_nouveau:ritual_binding>,
    <item:ars_nouveau:ritual_wilden_summon>,
    <item:ars_nouveau:ritual_scrying>,
    <item:ars_nouveau:ritual_awakening>,
    <item:ars_nouveau:ritual_burrowing>,
    <item:ars_nouveau:ritual_challenge>,
    <item:ars_nouveau:ritual_cloudshaping>,
    <item:ars_nouveau:ritual_disintegration>,
    <item:ars_nouveau:ritual_warping>,
    <item:ars_nouveau:ritual_restoration>
);

// Tags for Lilies

<tag:items:crafttweaker:lilies>.add(
    <item:cnb:pink_waterlily>,
    <item:cnb:light_pink_waterlily>,
    <item:cnb:yellow_waterlily>,
    <item:cnb:pink_minipad_flower>,
    <item:cnb:light_pink_minipad_flower>,
    <item:cnb:yellow_minipad_flower>,
    <item:cnb:pink_minipad_flower_glow>,
    <item:cnb:light_pink_minipad_flower_glow>,
    <item:cnb:yellow_minipad_flower_glow>
);

var hotBlocks = [
    <block:byg:magmatic_stone>,
    <block:byg:cryptic_magma_block>,
    <block:create:blaze_burner>,
    <block:byg:boric_campfire>,
    <block:decorative_blocks:brazier>,
    <block:decorative_blocks:soul_brazier>,
    <block:infernalexp:glow_campfire>,
    <block:byg:cryptic_campfire>
] as Block[];

for item in hotBlocks {
    <tag:blocks:farmersdelight:heat_sources>.add(item);
    <tag:blocks:brewinandchewin:hot_blocks>.add(item);
    <tag:blocks:alexsmobs:froststalker_fears>.add(item);
}

<tag:items:forge:seeds>.add(<item:farmersrespite:tea_seeds>);

<tag:items:forge:raw_fishes>.add(<item:aquaculture:fish_fillet_raw>);
<tag:items:forge:cooked_fishes>.add(<item:aquaculture:fish_fillet_cooked>);
<tag:items:forge:cooked_seafood>.add(<item:aquaculture:fish_fillet_cooked>);

<tag:items:crafttweaker:smallfish>.add(
    <item:aquaculture:boulti>,
    <item:aquaculture:synodontis>,
    <item:aquaculture:bluegill>,
    <item:aquaculture:perch>,
    <item:aquaculture:piranha>,
    <item:aquaculture:atlantic_herring>
);

<tag:items:crafttweaker:medsmallfish>.add(
    <item:aquaculture:smallmouth_bass>,
    <item:aquaculture:brown_trout>,
    <item:aquaculture:carp>,
    <item:aquaculture:blackfish>,
    <item:aquaculture:pink_salmon>,
    <item:aquaculture:pollock>,
    <item:aquaculture:rainbow_trout>
);

<tag:items:crafttweaker:medfish>.add(
    <item:aquaculture:muskellunge>,
    <item:aquaculture:tambaqui>,
    <item:aquaculture:red_grouper>
);

<tag:items:crafttweaker:medlgfish>.add(
    <item:aquaculture:gar>,
    <item:aquaculture:bayad>
);

<tag:items:crafttweaker:largefish>.add(
    <item:aquaculture:atlantic_cod>,
    <item:aquaculture:catfish>
);

<tag:items:crafttweaker:largerfish>.add(
    <item:aquaculture:tuna>,
    <item:aquaculture:capitaine>,
    <item:aquaculture:arapaima>
);

craftingTable.remove(<item:pipez:item_pipe>);

craftingTable.addShaped("itempipe", <item:pipez:item_pipe> * 16, [
    [<item:minecraft:copper_ingot>, <item:minecraft:copper_ingot>, <item:minecraft:copper_ingot>],
    [<item:minecraft:redstone>, <item:minecraft:redstone>, <item:minecraft:redstone>],
    [<item:minecraft:copper_ingot>, <item:minecraft:copper_ingot>, <item:minecraft:copper_ingot>]]);

<tag:items:forge:wrenches>.add(<item:supplementaries:wrench>);