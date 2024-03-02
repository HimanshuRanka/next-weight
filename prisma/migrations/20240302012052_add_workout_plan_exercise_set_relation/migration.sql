/*
  Warnings:

  - You are about to drop the `_ExcerciseSetToWorkoutPlan` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_ExcerciseSetToWorkoutPlan" DROP CONSTRAINT "_ExcerciseSetToWorkoutPlan_A_fkey";

-- DropForeignKey
ALTER TABLE "_ExcerciseSetToWorkoutPlan" DROP CONSTRAINT "_ExcerciseSetToWorkoutPlan_B_fkey";

-- DropTable
DROP TABLE "_ExcerciseSetToWorkoutPlan";

-- CreateTable
CREATE TABLE "WorkoutPlanExerciseSet" (
    "workoutPlanId" INTEGER NOT NULL,
    "exerciseSetId" INTEGER NOT NULL,
    "order" INTEGER NOT NULL,

    CONSTRAINT "WorkoutPlanExerciseSet_pkey" PRIMARY KEY ("workoutPlanId","exerciseSetId")
);

-- CreateIndex
CREATE UNIQUE INDEX "WorkoutPlanExerciseSet_workoutPlanId_exerciseSetId_order_key" ON "WorkoutPlanExerciseSet"("workoutPlanId", "exerciseSetId", "order");

-- AddForeignKey
ALTER TABLE "WorkoutPlanExerciseSet" ADD CONSTRAINT "WorkoutPlanExerciseSet_workoutPlanId_fkey" FOREIGN KEY ("workoutPlanId") REFERENCES "WorkoutPlan"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WorkoutPlanExerciseSet" ADD CONSTRAINT "WorkoutPlanExerciseSet_exerciseSetId_fkey" FOREIGN KEY ("exerciseSetId") REFERENCES "ExcerciseSet"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
