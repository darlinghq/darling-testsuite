#ifndef DARLING_TESTSUITE_NOSTDLIB_ASSERT_H
#define DARLING_TESTSUITE_NOSTDLIB_ASSERT_H

#ifndef __FILE_NAME__
#define __FILE_NAME__ __FILE__
#endif

void __nostdlib_assert_func(const char* function_name, const char* file_name, int file_line, const char* expression_str);

#define nostdlib_assert(e) if (!(e)) { __nostdlib_assert_func(__func__, __FILE_NAME__, __LINE__, #e); }

#endif // DARLING_TESTSUITE_NOSTDLIB_ASSERT_H
