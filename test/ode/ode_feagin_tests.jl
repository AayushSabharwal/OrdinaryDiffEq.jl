using OrdinaryDiffEq
srand(100)
u = [0.5,0.2]

a0100,a0200,a0201,a0300,a0302,a0400,a0402,a0403,a0500,a0503,a0504,a0600,a0603,a0604,a0605,a0700,a0704,a0705,a0706,a0800,a0805,a0806,a0807,a0900,a0905,a0906,a0907,a0908,a1000,a1005,a1006,a1007,a1008,a1009,a1100,a1105,a1106,a1107,a1108,a1109,a1110,a1200,a1203,a1204,a1205,a1206,a1207,a1208,a1209,a1210,a1211,a1300,a1302,a1303,a1305,a1306,a1307,a1308,a1309,a1310,a1311,a1312,a1400,a1401,a1404,a1406,a1412,a1413,a1500,a1502,a1514,a1600,a1601,a1602,a1604,a1605,a1606,a1607,a1608,a1609,a1610,a1611,a1612,a1613,a1614,a1615,b,c = constructFeagin10(eltype(u))

bool1 = typeof(a0100) == Float64 && eltype(b) == Float64 && eltype(c) == Float64
u2 = [BigFloat(0.5),BigFloat(0.2)]

a0100,a0200,a0201,a0300,a0302,a0400,a0402,a0403,a0500,a0503,a0504,a0600,a0603,a0604,a0605,a0700,a0704,a0705,a0706,a0800,a0805,a0806,a0807,a0900,a0905,a0906,a0907,a0908,a1000,a1005,a1006,a1007,a1008,a1009,a1100,a1105,a1106,a1107,a1108,a1109,a1110,a1200,a1203,a1204,a1205,a1206,a1207,a1208,a1209,a1210,a1211,a1300,a1302,a1303,a1305,a1306,a1307,a1308,a1309,a1310,a1311,a1312,a1400,a1401,a1404,a1406,a1412,a1413,a1500,a1502,a1514,a1600,a1601,a1602,a1604,a1605,a1606,a1607,a1608,a1609,a1610,a1611,a1612,a1613,a1614,a1615,b,c = constructFeagin10(eltype(u2))
bool2 = typeof(a0100) == BigFloat && eltype(b) == BigFloat && eltype(c) == BigFloat

a0100,a0200,a0201,a0300,a0302,a0400,a0402,a0403,a0500,a0503,a0504,a0600,a0603,a0604,a0605,a0700,a0704,a0705,a0706,a0800,a0805,a0806,a0807,a0900,a0905,a0906,a0907,a0908,a1000,a1005,a1006,a1007,a1008,a1009,a1100,a1105,a1106,a1107,a1108,a1109,a1110,a1200,a1208,a1209,a1210,a1211,a1300,a1308,a1309,a1310,a1311,a1312,a1400,a1408,a1409,a1410,a1411,a1412,a1413,a1500,a1508,a1509,a1510,a1511,a1512,a1513,a1514,a1600,a1608,a1609,a1610,a1611,a1612,a1613,a1614,a1615,a1700,a1712,a1713,a1714,a1715,a1716,a1800,a1812,a1813,a1814,a1815,a1816,a1817,a1900,a1912,a1913,a1914,a1915,a1916,a1917,a1918,a2000,a2012,a2013,a2014,a2015,a2016,a2017,a2018,a2019,a2100,a2112,a2113,a2114,a2115,a2116,a2117,a2118,a2119,a2120,a2200,a2212,a2213,a2214,a2215,a2216,a2217,a2218,a2219,a2220,a2221,a2300,a2308,a2309,a2310,a2311,a2312,a2313,a2314,a2315,a2316,a2317,a2318,a2319,a2320,a2321,a2322,a2400,a2408,a2409,a2410,a2411,a2412,a2413,a2414,a2415,a2416,a2417,a2418,a2419,a2420,a2421,a2422,a2423,a2500,a2508,a2509,a2510,a2511,a2512,a2513,a2514,a2515,a2516,a2517,a2518,a2519,a2520,a2521,a2522,a2523,a2524,a2600,a2605,a2606,a2607,a2608,a2609,a2610,a2612,a2613,a2614,a2615,a2616,a2617,a2618,a2619,a2620,a2621,a2622,a2623,a2624,a2625,a2700,a2705,a2706,a2707,a2708,a2709,a2711,a2712,a2713,a2714,a2715,a2716,a2717,a2718,a2719,a2720,a2721,a2722,a2723,a2724,a2725,a2726,a2800,a2805,a2806,a2807,a2808,a2810,a2811,a2813,a2814,a2815,a2823,a2824,a2825,a2826,a2827,a2900,a2904,a2905,a2906,a2909,a2910,a2911,a2913,a2914,a2915,a2923,a2924,a2925,a2926,a2927,a2928,a3000,a3003,a3004,a3005,a3007,a3009,a3010,a3013,a3014,a3015,a3023,a3024,a3025,a3027,a3028,a3029,a3100,a3102,a3103,a3106,a3107,a3109,a3110,a3113,a3114,a3115,a3123,a3124,a3125,a3127,a3128,a3129,a3130,a3200,a3201,a3204,a3206,a3230,a3231,a3300,a3302,a3332,a3400,a3401,a3402,a3404,a3406,a3407,a3409,a3410,a3411,a3412,a3413,a3414,a3415,a3416,a3417,a3418,a3419,a3420,a3421,a3422,a3423,a3424,a3425,a3426,a3427,a3428,a3429,a3430,a3431,a3432,a3433,b,c = constructFeagin14(eltype(u2))
bool3 = typeof(a0100) == BigFloat && eltype(b) == BigFloat && eltype(c) == BigFloat

prob = prob_ode_2Dlinear

## Convergence Testing
println("Convergence Test on Linear")
Δts = 1.//2.^(4:-1:2)
testTol = 1

println("Feagin RKs")
sol =solve(prob::ODEProblem,Δt=Δts[1],alg=:Feagin10)

const linear_bigα = parse(BigFloat,"1.01")
f = (t,u,du) -> begin
  for i in 1:length(u)
    du[i] = linear_bigα*u[i]
  end
end
analytic = (t,u₀) -> u₀*exp(linear_bigα*t)
prob_ode_bigfloat2Dlinear = ODEProblem(f,map(BigFloat,rand(4,2)).*ones(4,2)/2,analytic=analytic)

prob = prob_ode_bigfloat2Dlinear

sim = test_convergence(Δts,prob,alg=:Feagin10)
#plot(sim); Plots.gui()
#sim = test_convergence(Δts,prob,alg=:RK4)
bool4 = abs(sim.𝒪est[:final]-8) < testTol #Lowered due to low test Δt

sim = test_convergence(Δts,prob,alg=:Feagin12)
#plot(sim); Plots.gui()
#sim = test_convergence(Δts,prob,alg=:RK4)
bool5 = abs(sim.𝒪est[:final]-12) < testTol

sim = test_convergence(Δts,prob,alg=:Feagin14)
#TEST_PLOT && plot(sim)
#sim = test_convergence(Δts,prob,alg=:RK4)
bool6 = abs(sim.𝒪est[:final]-15) < testTol #Upped to 15 for test

f = (t,u) -> (linear_bigα*u)
prob_ode_bigfloatlinear = ODEProblem(f,parse(BigFloat,"0.5"),analytic=analytic)
prob = prob_ode_bigfloatlinear

Δts = 1.//2.^(6:-1:3)
sim = test_convergence(Δts,prob,alg=:Feagin10)
bool7 = abs(sim.𝒪est[:final]-10) < testTol

Δts = 1.//2.^(4:-1:2)
sim = test_convergence(Δts,prob,alg=:Feagin12)
bool8 = abs(sim.𝒪est[:final]-12) < testTol

sim = test_convergence(Δts,prob,alg=:Feagin14)
bool9 = abs(sim.𝒪est[:final]-15) < testTol #Upped to 15 for test

prob = prob_ode_bigfloat2Dlinear

#compile
sol =solve(prob::ODEProblem,Δt=Δts[1],alg=:Feagin10)
sol =solve(prob::ODEProblem,Δt=Δts[1],alg=:Feagin12)
sol =solve(prob::ODEProblem,Δt=Δts[1],alg=:Feagin14)

#test
@time sol =solve(prob::ODEProblem,Δt=Δts[1],alg=:Feagin10,adaptive=true)
@time sol =solve(prob::ODEProblem,Δt=Δts[1],alg=:Feagin12,adaptive=true)
@time sol =solve(prob::ODEProblem,Δt=Δts[1],alg=:Feagin14,adaptive=true)

bool1 && bool2 && bool3 && bool4 && bool5 && bool6 && bool7 && bool8 && bool9
