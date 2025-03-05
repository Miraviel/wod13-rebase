/// Unit test that forces various slips on a mob and checks return values and mob state to see if the slip has likely been successful.
/datum/unit_test/slips

/datum/unit_test/slips/Run()
	// Test just forced slipping, which calls turf slip code as well.
	var/mob/living/carbon/human/mso = allocate(/mob/living/carbon/human/consistent)

	TEST_ASSERT(mso.slip(100) == TRUE, "/mob/living/carbon/human/slip() returned FALSE when TRUE was expected")
	TEST_ASSERT(!!(mso.IsKnockdown()), "/mob/living/carbon/human/slip() failed to knockdown target when knockdown was expected")
