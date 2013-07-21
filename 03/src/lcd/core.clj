(ns lcd.core)

(def get-number)

(defn main [[expression size]]
  (get-number expression (if (nil? size) 2 size))
  nil)

(defn stutter [chars size]
  (apply str (repeat size chars)))
(defn stagger [chars size]
	(apply str (repeat size (str chars "\n"))))

(defn size-segment [chars size type]
	(if (= type :horizontal)
		(str " " (stutter chars size) " \n")
		(if (and (not (nil? chars)) (= type :vertical) (> (.length chars) 1))
			(stagger (str (subs chars 0 1) (stutter " " size) (subs chars 1)) size))))

(defn get-number [number size]
	(str
		(size-segment (get-segment number :top) size :horizontal)
		(size-segment (get-segment number :top-side) size :vertical)
		(size-segment (get-segment number :middle) size :horizontal)
		(size-segment (get-segment number :bottom-side) size :vertical)
		(size-segment (get-segment number :bottom) size :horizontal)))

(defn get-segment [number segment]
  )