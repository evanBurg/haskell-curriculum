import Debug.Trace (traceShow)

fib 0 = 0
fib 1 = 1
fib n = traceShow ("fib", ("n", n)) (go 0 1 n)
  where
    go curr next 0 = curr
    go curr next n =
      traceShow
        ("go", ("curr", curr), ("next", next), ("n", n))
        (go next (curr + next) (n - 1))
