// ignore_for_file: public_member_api_docs, sort_constructors_first
class ItemModel {
  String? assignedQuandity;
  String? physicalStock;
  String? balanceStock;
  ItemModel({
    this.assignedQuandity,
    this.physicalStock,
    this.balanceStock,
  });
  @override
  String toString() {
    return '{ $assignedQuandity, $physicalStock,$balanceStock }';
  }
}
