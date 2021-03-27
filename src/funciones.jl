function mean(x::Array)
    sum(x) / length(x)
end


function distance(arr::Array, x::Float64)
    mean([(y-x)^2 for y in arr])
end


function argsort(arr::Array)
    sortperm(arr, rev=false)
end


function ordinal_patterns(x::Array, m=3::Int, t=1::Int)
    partition = [x[i:i+(m-1)*t] for i in 1:t:length(x)-(m-1)*t]

    permutation = map(argsort, partition)

    counts = Dict{Array, Float64}()
    sum_w = 0.0
    for perm in permutation
        counts[perm] = get(counts, perm, 0) + 1.0
        sum_w += 1.0
    end

    p = [w / sum_w for w in values(counts)]
end


function weight_patterns(x::Array, m=3::Int, t=1::Int)
    partition = [x[i:i+(m-1)*t] for i in 1:t:length(x)-(m-1)*t]

    X = map(mean, partition)
    weight = map(distance, partition, X)

    permutation = map(argsort, partition)

    counts = Dict{Array, Float64}()
    sum_w = 0.0
    for (perm, w) in zip(permutation, weight)
        counts[perm] = get(counts, perm, 0) + w
        sum_w += w
    end

    p = [w / sum_w for w in values(counts)]
end


function weight_entropy(x::Array, m=3::Int, t=1::Int)
    y = weight_patterns(x, m, t)
    - sum(x * log(x) for x in y) 
end


function bandt_and_pompe(x::Array, m=3::Int, t=1::Int)
    y = ordinal_patterns(x, m, t)
    - sum(x * log2(x) for x in y)
end


function bandt_and_pompe_normal(x::Array, m=3::Int, t=1::Int)
    bandt_and_pompe(x, m, t) / log2(factorial(m))
end


function  renyi_entropy(x::Array, q=1.::Float, m=3::Int, t=1::Int)
    if q == 1
        return bandt_and_pompe(x, m, t)
    end
    y = ordinal_patterns(x, m, t)
    log2(sum(x^q for x in y)) / (1-q) 
end
