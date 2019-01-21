using System.Collections.Generic;

namespace WebsiteAdmission.Common
{
    public class StatisticHelper
    {
        public static double T1(List<double> arr)
        {
            int size = arr.Count - 1;
            return (arr[size] - arr[0]) / size;
        }

        public static List<HoltItem> Holt(List<double> predictItems)
        {
            var items = new List<HoltItem>();
            if (predictItems.Count <= 0) return items;

            // Tang o day
            for (int i = 0; i <= predictItems.Count; i++)
            {
                if (i == 0)
                {
                    items.Add(new HoltItem
                    {
                        S = predictItems[0] + 0.2 * (predictItems[0] - predictItems[0]),
                        T = T1(predictItems),
                        FT = predictItems[0]
                    });
                }
                else
                {
                    if (i == 1)
                    {
                        var prevItem = items[i - 1];
                        var item = new HoltItem
                        {
                            S = prevItem.FT + 0.2 * (predictItems[i - 1] - prevItem.FT),
                            T = prevItem.T
                        };
                        item.FT = item.S + item.T;
                        items.Add(item);
                    }
                    else
                    {
                        var prevItem = items[i - 1];
                        var prevprevItem = items[i - 2];
                        var item = new HoltItem
                        {
                            S = prevItem.FT + 0.2 * (predictItems[i - 1] - prevItem.FT),
                            T = prevItem.T + 0.3 * (prevItem.FT - prevprevItem.FT - prevprevItem.T),
                        };
                        item.FT = item.S + item.T;
                        items.Add(item);
                    }
                }
            }
            return items;
        }
    }
}