module Morphir.Sample.Reg.EBA.RiskIndicators.AssetQuality exposing (..)

import Morphir.SDK.LocalDate exposing (LocalDate, addDays)
import Morphir.Sample.Reg.EBA.Basics exposing (..)
import Morphir.Sample.Reg.EBA.Product exposing (..)



{-
   AQT_1

   Name:
   Non-performing debt instruments (loans and advances & debt securities) net of impairments to prudential own funds

   Formula:
   Non-performing debt instruments (loans and advances & debt securities) net of impairments  (A + B) / total own funds for solvency purposes (C)
   Please note: Data point B is reported as a negative figure. Therefore, to calculate the exposures net of impairments, it has to be added to Data Point A.

   Frequency:
   Quarterly

   Description:
   Capacity of own funds to absorb potential losses on NP assets

   Range of Values:
   [0,1]

   Data Point A:
       Template:
       F 18.00

       Sheet:

       Row:
       0330

       Column:
       0060

   Data Point B:
       Template:
       F 18.00

       Sheet:

       Row:
       0330

       Column:
       0150

   Data Point C:
       Template:
       C 01.00

       Sheet:

       Row:
       0010


       Column:
       0010

-}


aqt1risk :
    (ProductId -> Product)
    -> (ProductId -> Product)
    -> (ProductId -> Product)
    -> NormalisedRatio
aqt1risk productA productB productC =
    let
        -- Non-performing debt instruments (loans and advances) net of impairments (A)
        nonPerformingLoansAndAdvancesNetOfImpairments =
            900.0

        -- Non-performing debt instruments (debt securities) net of impairments (B)
        nonPerformingDebtSecuritiesNetOfImpairments =
            100.0

        numerator =
            nonPerformingLoansAndAdvancesNetOfImpairments
                ++ nonPerformingDebtSecuritiesNetOfImpairments

        -- total own funds for solvency purposes (C)
        totalOwnFundsForSolvencyPurposes =
            1234.0

        denominator =
            totalOwnFundsForSolvencyPurposes
    in
    numerator / denominator


-- lcr : (Flow -> Counterparty) -> (ProductId -> Product) -> LocalDate -> (LocalDate -> List Flow) -> Balance -> Ratio
-- lcr toCounterparty product t flowsForDate reserveBalanceRequirement =
--     let
--         hqla : Balance
--         hqla =
--             hqlaAmount product (flowsForDate t) reserveBalanceRequirement

--         totalNetCashOutflow : Balance
--         totalNetCashOutflow =
--             totalNetCashOutflowAmount toCounterparty t flowsForDate
--     in
--     hqla / totalNetCashOutflow



-- FDP_2
-- Loans and Advances to Deposit ratio - households, non-financial corporations and general governments - 1 Year
-- [Loans and Advances to households (A)  + Loans and Advances to non-financial corporations (B) + Loans and Advances to general governments (C)]
--      /{Deposits from Households (D) + deposits from non-financial corporations (E) + deposits from general governments (F)
--          + [[(total balance sheet - 1 year (G) / total balance sheet - current (H)]
--              * [- held for trading deposits from non-financial corporations (I) + held for trading repurchase agreement from non-financial corporations (J) - held for trading deposits from households (K) + held for trading repurchase agreement from households (L) - designated at fair value deposits from non-financial corporations (M) + designated at fair value repurchase agreement from non-financial corporations (N) - designated at fair value deposits from households (O) + designated at fair value repurchase agreement from household (P) - held for trading deposits from general governments (Q) + held for trading repurchase agreement from general governments (R) - designated at fair value deposits from general governments (S) + designated at fair value repurchase agreement from general governments (T)
--            ]]}
-- further unpacked:
--     [
--          Loans and Advances to households (A)
--          + Loans and Advances to non-financial corporations (B)
--          + Loans and Advances to general governments (C)
--     ]
--     /
--     {
--         Deposits from Households (D)
--         + deposits from non-financial corporations (E)
--         + deposits from general governments (F)
--         +
--             [
--                 [
--                     (
--                         total balance sheet - 1 year (G)
--                         / total balance sheet - current (H)
--                     ]
--                     *
--                     [
--                         - held for trading deposits from non-financial corporations (I)
--                         + held for trading repurchase agreement from non-financial corporations (J)
--                         - held for trading deposits from households (K)
--                         + held for trading repurchase agreement from households (L)
--                         - designated at fair value deposits from non-financial corporations (M)
--                         + designated at fair value repurchase agreement from non-financial corporations (N)
--                         - designated at fair value deposits from households (O)
--                         + designated at fair value repurchase agreement from household (P)
--                         - held for trading deposits from general governments (Q)
--                         + held for trading repurchase agreement from general governments (R)
--                         - designated at fair value deposits from general governments (S)
--                         + designated at fair value repurchase agreement from general governments (T)
--                     ]
--                 ]
--     }
-- Annual
-- It gives the 1 year planned proportion of loan and avances to non financial entities funded by deposits from non financial entities (after elimination of strctured deposits).
-- [0,1]
-- P 01.01		030	030	P 01.01		100	030	P 01.01		197	030	P 01.02		020	030	P 01.02		060	030	P 01.02		147	030	P 01.01		220	030	P 01.01		220	010	F 08.01		0260	0010	F 08.01		0300	0010	F 08.01		0310	0010	F 08.01		0350	0010	F 08.01		0260	0020	F 08.01		0300	0020	F 08.01		0310	0020	F 08.01		0350	0020	F 08.01		0110	0010	F 08.01		0150	0010	F 08.01		0110	0020	F 08.01		0150	0020
