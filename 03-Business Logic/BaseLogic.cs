using System;

namespace Seldat {
    public class BaseLogic : IDisposable {
        protected ClothingContext DB = new ClothingContext();
        public void Dispose() {
            DB.Dispose();
        }
    }
}
