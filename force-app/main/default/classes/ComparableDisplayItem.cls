global class ComparableDisplayItem implements Comparable {
    public DisplayItem item {set;get;}

    public ComparableDisplayItem(final DisplayItem item) {
        this.item = item;
    }

    global Integer compareTo(Object compareTo) {
        ComparableDisplayItem to = (ComparableDisplayItem)compareTo;
        if (this.item.order == to.item.order) return 0;
        if (this.item.order > to.item.order) return 1;
        return -1;
    }
}