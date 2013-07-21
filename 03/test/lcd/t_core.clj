(ns lcd.t-core
  (:use midje.sweet)
  (:use [lcd.core]))

(def grabbed nil)
(defn grab [f]
  (let [result lcd.t-core/grabbed]
    (def grabbed nil)
    result))

(defn push-grabbed [& args]
  (def grabbed (if (nil? grabbed) args (concat grabbed args))))

(facts "about lcd display"
  (with-redefs [lcd.core/get-number #(do (def grabbed [%1 %2]) nil)]
    (fact "it should accept two arguments"
      (grab (main ["a" "b"])) => ["a" "b"])
    (fact "it should default second argument to 2"
      (grab (main ["a"])) => ["a" 2]))

  (facts "about making lcd numbers"
    (fact "it should accept a number and size"
      (get-number 1 1) => truthy)
    (with-redefs [lcd.core/get-segment #(do (push-grabbed [%1 %2]) "")]
      (fact "it should get top segments"
        (grab (get-number 1 1)) => (contains [[1 :top]]))
      (fact "it should get top-side segments"
        (grab (get-number 1 1)) => (contains [[1 :top-side]]))
      (fact "it should get middle segments"
        (grab (get-number 1 1)) => (contains [[1 :middle]]))
      (fact "it should get bottom segments"
        (grab (get-number 1 1)) => (contains [[1 :middle]]))
      (fact "it should get bottom-side segments"
        (grab (get-number 1 1)) => (contains [[1 :bottom-side]])))
    (def segment nil)
    (with-redefs [lcd.core/get-segment #(if (= %2 segment) (name segment))]
      (fact "it should return the top segment"
        (def segment :top)
        (get-number 1 1) => #" top ")
      (fact "it should return the top-side segment"
        (def segment :top-side)
        (get-number 1 1) => #"t op-side")
      (fact "it should return the middle segment"
        (def segment :middle)
        (get-number 1 1) => #" middle ")
      (fact "it should return the bottom-side segment"
        (def segment :bottom-side)
        (get-number 1 1) => #"b ottom-side")
      (fact "it should return the bottom segment"
        (def segment :bottom)
        (get-number 1 1) => #" bottom ")

      (fact "it should have the right size of segments"
        (def segment :top)
        (get-number 2 3) => #" (top){3} "
        (def segment :middle)
        (get-number 2 4) => #" (middle){4} "
        (def segment :bottom)
        (get-number 2 2) => #" (bottom){2} ")

      (fact "it should have the right line-count for segments"
        (def segment :top-side)
        (get-number 2 3) => #"(t   op-side\n){3}"
        (def segment :bottom-side)
        (get-number 2 3) => #"(b   ottom-side\n){3}"))))
