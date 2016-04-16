//
//  Tween.swift
//  udata
//
//  Created by wen on 16/4/13.
//  Copyright © 2016年 netease. All rights reserved.
//

import Foundation

/*
 * t: current time（当前时间）
 * b: beginning value（初始值）
 * c: change in value（变化量）
 * d: duration（持续时间）
 */

class Tween {
    static func linear (t: Double, b: Double, c: Double, d: Double) -> Double {
        return c * t / d + b
    }
    
    class Quad {
        static func easeIn(t: Double, b: Double, c: Double, d: Double) -> Double {
            let _t = t / d
            return c * _t * _t + b
        }
        
        static func easeOut(t: Double, b: Double, c: Double, d: Double) -> Double {
            let _t = t / d
            return -c * _t * (_t - 2) + b
        }
        
        static func easeInOut(t: Double, b: Double, c: Double, d: Double) -> Double {
            var _t = t / d
            if _t / 2 < 1 { return c / 2 * _t * _t + b }
            
            _t -= 1
            return -c / 2 * (_t * (_t - 2) - 1) + b
        }
    }
    
    class Cubic {
        static func easeIn(t: Double, b: Double, c: Double, d: Double) -> Double {
            let _t = t / d
            return c * pow(_t, 3) + b
        }
        
        static func easeOut(t: Double, b: Double, c: Double, d: Double) -> Double {
            let _t = t/d - 1
            return -c * (pow(_t, 3) + 1) + b
        }
        
        static func easeInOut(t: Double, b: Double, c: Double, d: Double) -> Double {
            var _t = t / (d/2)
            if _t < 1 { return c / 2 * pow(_t, 3) + b }
            
            _t -= 2
            return -c / 2 * (pow(_t, 3) + 2) + b
        }
    }
    
    class Quart {
        static func easeIn(t: Double, b: Double, c: Double, d: Double) -> Double {
            let _t = t / d
            return c * pow(_t, 4) + b
        }
        
        static func easeOut(t: Double, b: Double, c: Double, d: Double) -> Double {
            let _t = t / d - 1
            return -c * (pow(_t, 4) - 1) + b
        }
        
        static func easeInOut(t: Double, b: Double, c: Double, d: Double) -> Double {
            var _t = t / (d/2)
            if _t < 1 { return c / 2 * pow(_t, 4) + b }
            
            _t -= 2
            return -c / 2 * (pow(_t, 4) - 2) + b
        }
    }
    
    class Sine {
        static func easeIn(t: Double, b: Double, c: Double, d: Double) -> Double {
            return t==0 ? b : c * pow(2, 10 * (t/d - 1)) + b
        }
        
        static func easeOut(t: Double, b: Double, c: Double, d: Double) -> Double {
            return c * sin(t/d * M_PI_2) + b
        }
        
        static func easeInOut(t: Double, b: Double, c: Double, d: Double) -> Double {
            return -c / 2 * (cos(M_PI * t/d) - 1) + b
        }
    }
    
    class Expo {
        static func easeIn(t: Double, b: Double, c: Double, d: Double) -> Double {
            return t==0 ? b : c * pow(2, 10 * (t/d - 1)) + b
        }
        
        static func easeOut(t: Double, b: Double, c: Double, d: Double) -> Double {
            return t==d ? b + c : c * (-pow(2, -10 * t/d) + 1) + b
        }
        
        static func easeInOut(t: Double, b: Double, c: Double, d: Double) -> Double {
            if t==0 { return 0 }
            if t==d { return b + c }
            
            let _t = t / d
            if _t / 2 < 1 {
                return c / 2 * pow(2, 10 * (_t - 1)) + b
            }
            
            return c / 2 * (-pow(2, -10 * (_t - 1) + 2)) + b
        }
    }
    
    class Circ {
        static func easeIn(t: Double, b: Double, c: Double, d: Double) -> Double {
            let _t = t / d
            return -c * (sqrt(1 - _t * _t) - 1) + b
        }
        
        static func easeOut(t: Double, b: Double, c: Double, d: Double) -> Double {
            return c * sin(t/d * M_PI_2) + b
        }
        
        static func easeInOut(t: Double, b: Double, c: Double, d: Double) -> Double {
            return -c / 2 * (cos(M_PI * t/d) - 1) + b
        }
    }
    
    class Elastic {
        static func easeInt(t: Double, b: Double, c: Double, d: Double, a: Double, p: Double? = nil) -> Double {
            var s: Double
            var a = a
            var t = t
            
            if t==0 { return b }
            
            t = t / d
            if t == 1 { return b + c }
            
            let p = p == nil ? d * 0.3 : p!
            if a == 0 || a < abs(c) {
                s = p / 4
                a = c
            } else {
                s = p / M_2_PI * asin(c / a)
            }
            
            t -= 1
            return -(a * pow(2, 10 * t) * sin((t * d - s) * M_2_PI / p)) + b
        }
        
        static func easeOut(t: Double, b: Double, c: Double, d: Double, a: Double, p: Double? = nil) -> Double {
            var s: Double
            var a = a
            var t = t
            
            if t==0 { return b }
            
            t = t / d
            if t == 1 { return b + c }
            
            let p = p == nil ? d * 0.3 : p!
            if a == 0 || a < abs(c) {
                s = p / 4
                a = c
            } else {
                s = p / M_2_PI * asin(c / a)
            }
            
            t -= 1
            return a * pow(2, -10 * t) * sin((t * d - s) * M_2_PI / p) + c + b
        }
        
        static func easeIntOut(t: Double, b: Double, c: Double, d: Double, a: Double, p: Double? = nil) -> Double {
            var s: Double
            var a = a
            var t = t
            
            if t==0 { return b }
            
            t = t / (d/2)
            if t == 2 { return b + c }
            
            let p = p == nil ? d * 0.3 * 1.5 : p!
            if a == 0 || a < abs(c) {
                s = p / 4
                a = c
            } else {
                s = p / M_2_PI * asin(c / a)
            }
            
            if t < 1 {
                t -= 1
                return -0.5 * (a * pow(2, 10 * t) * sin((t * d - s) * M_2_PI / p)) + b
            }
            
            t -= 1
            return a * pow(2, -10 * t) * sin((t * d - s) * M_2_PI / p) * 0.5 + c + b
        }
    }
    
    class Back {
        static func easeIn(t: Double, b: Double, c: Double, d: Double, s: Double? = nil) -> Double {
            let s = s == nil ? 1.70158 : s!
            let t = t / d
            return c * t * t * ((s + 1) * t - s) + b
        }
        
        static func easeOut(t: Double, b: Double, c: Double, d: Double, s: Double? = nil) -> Double {
            let s = s == nil ? 1.70158 : s!
            let t = t/d - 1
            return c * t * t * ((s + 1) * t + s) + b
        }
        
        static func easeInOut(t: Double, b: Double, c: Double, d: Double, s: Double? = nil) -> Double {
            var s = s == nil ? 1.70158 : s!
            var t = t / (d/2)
            if t < 1 {
                s = s * 1.525
                return c / 2 * (t * t * ((s + 1) + t - s)) + b
            }
            
            t -= 2
            s = s * 1.525
            return c / 2 * (t * t * ((s + 1) + t + s) + 2) + b
        }
    }
    
    class Bounce {
        static func easeIn(t: Double, b: Double, c: Double, d: Double) -> Double {
            return c - self.easeOut(d - t, b: 0, c: c, d: d) + b
        }
        
        static func easeOut(t: Double, b: Double, c: Double, d: Double) -> Double {
            var t = t / d
            if t < 1 / 2.75 {
                return c * 7.5625 * t * t + b
            } else if t < 2 / 2.75 {
                t -= 1.5 / 2.75
                return c * (7.5625 * t * t + 0.75) + b
            } else if t < 2.5 / 2.75 {
                t -= 2.25 / 2.75
                return c * (7.5625 * t * t + 0.9375) + b
            } else {
                t -= 2.625 / 2.75
                return c * (7.5625 * t * t + 0.984375) + b
            }
        }
        
        static func easeInOut(t: Double, b: Double, c: Double, d: Double) -> Double {
            if t < d / 2 {
                return self.easeIn(t * 2, b: 0, c: c, d: d) * 0.5 + b
            } else {
                return self.easeOut(t * 2 - d, b: 0, c: c, d: d) * 0.5 + c * 0.5 + b
            }
        }
    }
}