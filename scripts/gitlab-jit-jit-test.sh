#!/bin/bash
mv test/jit/wasms/* .
mv test/jit/golden_results/* .
TEST_NAME=alloca_dropkeep.txt
echo $TEST_NAME
./bin/wasm-interp --run-all-exports alloca_dropkeep.wasm > alloca_dropkeep_interp_golden.out

TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME succeded
else
	echo $TEST_NAME failed
exit $TEST_RESULT
fi
TEST_NAME=br.txt
echo $TEST_NAME
./bin/wasm-interp --run-all-exports br.wasm > br_interp_golden.out

TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME succeded
else
	echo $TEST_NAME failed
exit $TEST_RESULT
fi
TEST_NAME=brif_brunless.txt
echo $TEST_NAME
./bin/wasm-interp --run-all-exports brif_brunless.wasm > brif_brunless_interp_golden.out

TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME succeded
else
	echo $TEST_NAME failed
exit $TEST_RESULT
fi
TEST_NAME=call.txt
echo $TEST_NAME
./bin/wasm-interp --run-all-exports call.wasm > call_interp_golden.out

TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME succeded
else
	echo $TEST_NAME failed
exit $TEST_RESULT
fi
TEST_NAME=call_complex.txt
echo $TEST_NAME
./bin/wasm-interp --run-all-exports call_complex.wasm > call_complex_interp_golden.out

TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME succeded
else
	echo $TEST_NAME failed
exit $TEST_RESULT
fi
TEST_NAME=callindirect.txt
echo $TEST_NAME
./bin/wasm-interp --run-all-exports callindirect.wasm > callindirect_interp_golden.out

TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME succeded
else
	echo $TEST_NAME failed
exit $TEST_RESULT
fi
TEST_NAME=ext_load.txt
echo $TEST_NAME
./bin/wasm-interp --run-all-exports ext_load.wasm > ext_load_interp_golden.out

TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME succeded
else
	echo $TEST_NAME failed
exit $TEST_RESULT
fi
TEST_NAME=f32_arithmetic.txt
echo $TEST_NAME
./bin/wasm-interp --run-all-exports f32_arithmetic.wasm > f32_arithmetic_interp_golden.out

TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME succeded
else
	echo $TEST_NAME failed
exit $TEST_RESULT
fi
TEST_NAME=f32_comparison.txt
echo $TEST_NAME
./bin/wasm-interp --run-all-exports f32_comparison.wasm > f32_comparison_interp_golden.out

TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME succeded
else
	echo $TEST_NAME failed
exit $TEST_RESULT
fi
TEST_NAME=f32_min_max.txt
echo $TEST_NAME
./bin/wasm-interp --run-all-exports f32_min_max.wasm > f32_min_max_interp_golden.out

TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME succeded
else
	echo $TEST_NAME failed
exit $TEST_RESULT
fi
TEST_NAME=f64_arithmetic.txt
echo $TEST_NAME
./bin/wasm-interp --run-all-exports f64_arithmetic.wasm > f64_arithmetic_interp_golden.out

TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME succeded
else
	echo $TEST_NAME failed
exit $TEST_RESULT
fi
TEST_NAME=f64_comparison.txt
echo $TEST_NAME
./bin/wasm-interp --run-all-exports f64_comparison.wasm > f64_comparison_interp_golden.out

TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME succeded
else
	echo $TEST_NAME failed
exit $TEST_RESULT
fi
TEST_NAME=f64_min_max.txt
echo $TEST_NAME
./bin/wasm-interp --run-all-exports f64_min_max.wasm > f64_min_max_interp_golden.out

TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME succeded
else
	echo $TEST_NAME failed
exit $TEST_RESULT
fi
TEST_NAME=float_convert.txt
echo $TEST_NAME
./bin/wasm-interp --run-all-exports float_convert.wasm > float_convert_interp_golden.out

TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME succeded
else
	echo $TEST_NAME failed
exit $TEST_RESULT
fi
TEST_NAME=get_set_global.txt
echo $TEST_NAME
./bin/wasm-interp --run-all-exports get_set_global.wasm > get_set_global_interp_golden.out

TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME succeded
else
	echo $TEST_NAME failed
exit $TEST_RESULT
fi
TEST_NAME=get_set_tee_local.txt
echo $TEST_NAME
# Get_set_global and get_set_local share functions name
# needs to be resolved either on relocations OR on other level
#cp ./test/jit/get_set_tee_local.txt ./test/jit/git_set_tee_local.txt
./bin/wasm-interp --run-all-exports git_set_tee_local.wasm > git_set_tee_local_interp_golden.out

TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME succeded
else
	echo $TEST_NAME failed
exit $TEST_RESULT
fi
TEST_NAME=i32_arithmetic.txt
echo $TEST_NAME
./bin/wasm-interp --run-all-exports i32_arithmetic.wasm > i32_arithmetic_interp_golden.out

TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME succeded
else
	echo $TEST_NAME failed
exit $TEST_RESULT
fi
TEST_NAME=i32_bitwise.txt
echo $TEST_NAME
./bin/wasm-interp --run-all-exports i32_bitwise.wasm > i32_bitwise_interp_golden.out

TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME succeded
else
	echo $TEST_NAME failed
exit $TEST_RESULT
fi
TEST_NAME=i32_comparison.txt
echo $TEST_NAME
./bin/wasm-interp --run-all-exports i32_comparison.wasm > i32_comparison_interp_golden.out
TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME succeded
else
	echo $TEST_NAME failed
exit $TEST_RESULT
fi
TEST_NAME=i64_arithmetic.txt
echo $TEST_NAME
./bin/wasm-interp --run-all-exports i64_arithmetic.wasm > i64_arithmetic_interp_golden.out

TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME succeded
else
	echo $TEST_NAME failed
exit $TEST_RESULT
fi
TEST_NAME=i64_bitwise.txt
echo $TEST_NAME
./bin/wasm-interp --run-all-exports i64_bitwise.wasm > i64_bitwise_interp_golden.out

TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME succeded
else
	echo $TEST_NAME failed
exit $TEST_RESULT
fi
TEST_NAME=i64_comparison.txt
echo $TEST_NAME
./bin/wasm-interp --run-all-exports i64_comparison.wasm > i64_comparison_interp_golden.out
TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME succeded
else
	echo $TEST_NAME failed
exit $TEST_RESULT
fi
TEST_NAME=int_convert.txt
echo $TEST_NAME
./bin/wasm-interp --run-all-exports int_convert.wasm > int_convert_interp_golden.out

TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME succeded
else
	echo $TEST_NAME failed
exit $TEST_RESULT
fi
TEST_NAME=load.txt
echo $TEST_NAME
./bin/wasm-interp --run-all-exports load.wasm > load_interp_golden.out
TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME succeded
else
	echo $TEST_NAME failed
exit $TEST_RESULT
fi
# TEST_NAME=multi_value.txt
# echo $TEST_NAME
# ./bin/wasm-interp --run-all-exports multi_value.wasm > multi_value_interp_golden.out
# TEST_RESULT=$?
# if test $TEST_RESULT -eq 0
# then
# 	echo $TEST_NAME succeded
# else
# 	echo $TEST_NAME failed
# exit $TEST_RESULT
# fi
TEST_NAME=reinterpret.txt
echo $TEST_NAME
./bin/wasm-interp --run-all-exports reinterpret.wasm > reinterpret_interp_golden.out

TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME succeded
else
	echo $TEST_NAME failed
exit $TEST_RESULT
fi
TEST_NAME=return_three.txt
echo $TEST_NAME
./bin/wasm-interp --run-all-exports return_three.wasm > return_three_interp_golden.out

TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME succeded
else
	echo $TEST_NAME failed
exit $TEST_RESULT
fi
TEST_NAME=select.txt
echo $TEST_NAME
./bin/wasm-interp --run-all-exports select.wasm > select_interp_golden.out

TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME succeded
else
	echo $TEST_NAME failed
exit $TEST_RESULT
fi
# TEST_NAME=sign_ext.txt
# echo $TEST_NAME
# ./bin/wasm-interp --run-all-exports sign_ext.wasm > sign_ext_interp_golden.out
# TEST_RESULT=$?
# if test $TEST_RESULT -eq 0
# then
# 	echo $TEST_NAME succeded
# else
# 	echo $TEST_NAME failed
# exit $TEST_RESULT
# fi
TEST_NAME=stack_trace.txt
echo $TEST_NAME
./bin/wasm-interp --run-all-exports stack_trace.wasm > stack_trace_interp_golden.out

TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME succeded
else
	echo $TEST_NAME failed
exit $TEST_RESULT
fi
TEST_NAME=stack_trace_comp_fail.txt
echo $TEST_NAME
./bin/wasm-interp --run-all-exports stack_trace_comp_fail.wasm > stack_trace_comp_fail_interp_golden.out

TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME succeded
else
	echo $TEST_NAME failed
exit $TEST_RESULT
fi
TEST_NAME=store.txt
echo $TEST_NAME
./bin/wasm-interp --run-all-exports store.wasm > store_interp_golden.out

TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME succeded
else
	echo $TEST_NAME failed
exit $TEST_RESULT
fi
TEST_NAME=truncation.txt
echo $TEST_NAME
./bin/wasm-interp --run-all-exports truncation.wasm > truncation_interp_golden.out

TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME succeded
else
	echo $TEST_NAME failed
exit $TEST_RESULT
fi
# TEST_NAME=truncation_saturating.txt
# echo $TEST_NAME
# ./bin/wasm-interp --run-all-exports truncation_saturating.wasm > truncation_saturating_interp_golden.out
# TEST_RESULT=$?
# if test $TEST_RESULT -eq 0
# then
# 	echo $TEST_NAME succeded
# else
# 	echo $TEST_NAME failed
# exit $TEST_RESULT
# fi
TEST_NAME=wrap_store.txt
echo $TEST_NAME
./bin/wasm-interp --run-all-exports wrap_store.wasm > wrap_store_interp_golden.out

TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME succeded
else
	echo $TEST_NAME failed
exit $TEST_RESULT
fi


echo "Three tests are disabled: truncation_saturating, multi_value and sign_ext, due to opcodes not being supported"