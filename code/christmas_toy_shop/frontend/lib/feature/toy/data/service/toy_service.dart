abstract class ToyService {
  Future<Map<String, dynamic>?> getToysRaw();
  Future<Map<String, dynamic>?> getToyDetailRaw(String toyId);
}
