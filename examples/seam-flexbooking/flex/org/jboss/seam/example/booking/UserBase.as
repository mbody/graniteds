/**
 * Generated by Gas3 v2.2.0 (Granite Data Services).
 *
 * WARNING: DO NOT CHANGE THIS FILE. IT MAY BE OVERWRITTEN EACH TIME YOU USE
 * THE GENERATOR. INSTEAD, EDIT THE INHERITED CLASS (User.as).
 */

package org.jboss.seam.example.booking {

    import flash.events.EventDispatcher;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import flash.utils.IExternalizable;
    import flash.utils.getQualifiedClassName;
    import mx.core.IUID;
    import mx.data.utils.Managed;
    import mx.utils.UIDUtil;
    import org.granite.collections.IPersistentCollection;
    import org.granite.meta;
    import org.granite.tide.IEntity;
    import org.granite.tide.IEntityManager;
    import org.granite.tide.IPropertyHolder;

    use namespace meta;

    [Managed]
    public class UserBase implements IExternalizable, IUID {

        [Transient]
        meta var entityManager:IEntityManager = null;

        private var __initialized:Boolean = true;
        private var __detachedState:String = null;

        private var _name:String;
        private var _password:String;
        private var _username:String;

        meta function isInitialized(name:String = null):Boolean {
            if (!name)
                return __initialized;

            var property:* = this[name];
            return (
                (!(property is User) || (property as User).meta::isInitialized()) &&
                (!(property is IPersistentCollection) || (property as IPersistentCollection).isInitialized())
            );
        }
        
        [Bindable(event="dirtyChange")]
		public function get meta_dirty():Boolean {
			return Managed.getProperty(this, "meta_dirty", false);
		}

        public function set name(value:String):void {
            _name = value;
        }
        public function get name():String {
            return _name;
        }

        public function set password(value:String):void {
            _password = value;
        }
        public function get password():String {
            return _password;
        }

        public function set username(value:String):void {
            _username = value;
        }
        [Id]
        public function get username():String {
            return _username;
        }

        public function set uid(value:String):void {
            // noop...
        }
        public function get uid():String {
            if (!_username)
                return UIDUtil.createUID();
            return getQualifiedClassName(this) + "#[" + String(_username) + "]";
        }

        meta function merge(em:IEntityManager, obj:*):void {
            var src:UserBase = UserBase(obj);
            __initialized = src.__initialized;
            __detachedState = src.__detachedState;
            if (meta::isInitialized()) {
               em.meta_mergeExternal(src._name, _name, null, this, 'name', function setter(o:*):void{_name = o as String}, false);
               em.meta_mergeExternal(src._password, _password, null, this, 'password', function setter(o:*):void{_password = o as String}, false);
               em.meta_mergeExternal(src._username, _username, null, this, 'username', function setter(o:*):void{_username = o as String}, false);
            }
            else {
               em.meta_mergeExternal(src._username, _username, null, this, 'username', function setter(o:*):void{_username = o as String});
            }
        }

        public function readExternal(input:IDataInput):void {
            __initialized = input.readObject() as Boolean;
            __detachedState = input.readObject() as String;
            if (meta::isInitialized()) {
                _name = input.readObject() as String;
                _password = input.readObject() as String;
                _username = input.readObject() as String;
            }
            else {
                _username = input.readObject() as String;
            }
        }

        public function writeExternal(output:IDataOutput):void {
            output.writeObject(__initialized);
            output.writeObject(__detachedState);
            if (meta::isInitialized()) {
                output.writeObject((_name is IPropertyHolder) ? IPropertyHolder(_name).object : _name);
                output.writeObject((_password is IPropertyHolder) ? IPropertyHolder(_password).object : _password);
                output.writeObject((_username is IPropertyHolder) ? IPropertyHolder(_username).object : _username);
            }
            else {
                output.writeObject(_username);
            }
        }
    }
}
