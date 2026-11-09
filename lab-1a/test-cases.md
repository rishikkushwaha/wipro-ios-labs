# Lab 1A - Test Cases

| No. | Test Case | Marks | Attendance | Expected Output |

|---|---|---|---|---|

| 1 | Normal Pass | 80,75,90,85,70 | 85% | PASS |

| 2 | Zero Marks | 0,0,0,0,0 | 90% | FAIL |

| 3 | Full Marks | 100,100,100,100,100 | 100% | PASS |

| 4 | Failing Marks | 80,75,34,85,70 | 90% | FAIL |

| 5 | Low Attendance | 80,75,90,85,70 | 74% | FAIL |

| 6 | Invalid Attendance | 80,75,90,85,70 | 101% | Invalid Attendance |

| 7 | Negative Marks | 80,-1,90,85,70 | 90% | Invalid Marks |

| 8 | Marks Above 100 | 80,75,101,85,70 | 90% | Invalid Marks |

| 9 | Less Than Five Subjects | 80,75,90,85 | 90% | Invalid Subject Count |
