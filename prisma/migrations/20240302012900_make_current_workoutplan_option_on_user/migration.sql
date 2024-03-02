/*
  Warnings:

  - You are about to drop the column `workoutPlanId` on the `User` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_workoutPlanId_fkey";

-- AlterTable
ALTER TABLE "User" DROP COLUMN "workoutPlanId",
ADD COLUMN     "currentWorkoutPlanId" INTEGER;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_currentWorkoutPlanId_fkey" FOREIGN KEY ("currentWorkoutPlanId") REFERENCES "WorkoutPlan"("id") ON DELETE SET NULL ON UPDATE CASCADE;
