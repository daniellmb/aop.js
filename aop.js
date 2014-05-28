/**
 * @file 0.27 kb Dependency Injection Micro Library
 * @author Daniel Lamb <dlamb.open.source@gmail.com>
 */
var AOP = function(obj) {
    obj.proceed = null;
    obj.result = {};
    obj.before = function(method, f) {
        var org;
        org = this[method];
        return this[method] = function() {
            f.apply(this, arguments);
            return org.apply(this, arguments);
        };
    };
    obj.after = function(method, f) {
        var org;
        org = this[method];
        return this[method] = function() {
            this.result[method] = org.apply(this, arguments);
            return f.apply(this, arguments);
        };
    };
    return obj.around = function(method, f) {
        var org;
        org = this[method];
        return this[method] = function() {
            this.proceed = org;
            return f.apply(this, arguments);
        };
    };
};