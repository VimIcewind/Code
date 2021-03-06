import java.text.DecimalFormat;


public class House {

    public static void main(String[] args) {
        /**
         * 一、 按揭贷款等额本息还款计算公式
         * 1、 计算公式
         * 每月还本付息金额=[本金×月利率×（1+月利率）还款月数]/（1+月利率）还款月数-1]
         * 其中：每月利息=剩余本金×贷款月利率
         * 每月本金=每月月供额-每月利息
         * 计算原则：银行从每月月供款中，先收剩余本金利息，后收本金；利息在月供款中的比例中虽剩余本金的减少而降低，
         * 本金在月供款中的比例因而升高，但月供总额保持不变。
         * 2、 商业性房贷案例
         * 贷款本金为300000元人民币
         * 还款期为10年（即120个月）
         * 根据5.51%的年利率计算，月利率为4.592‰
         * 代入等额本金还款计算公式计算：
         * 每月还本付息金额=[300000×4.592‰×（1+月利率）120]/[（1+月利率）120-1]
         * 由此，可计算每月的还款额为3257.28元人民币
         * 二、 按揭贷款等额本金还款计算公式
         * 1、 计算公式
         * 每月还本付息金额=（本金/还款月数）+（本金－累计已还本金）×月利率
         * 每月本金=总本金/还款月数
         * 每月利息=（本金-累计已还本金）×月利率
         * 计算原则：每月归还的本金额始终不变，利息随剩余本金的减少而减少
         * 2、 商业性房贷案例
         * 贷款本金为300000元人民币
         * 还款期为10年（即120个月）
         * 根据5.51%的年利率计算，月利率为4.592‰
         * 代入按月递减还款计算公式计算：
         * （第一个月）还本付息金额=（300000/120） + （300000-0）×4.592‰
         * 由此，可计算第一个月的还款额为3877.5元人民币
         * (第二个月) 还本付息金额=（300000/120） + （300000-2500）×4.592‰
         * 由此，可计算第一个月的还款额为3866.02元人民币
         * (第二个月) 还本付息金额=（300000/120） + （300000-5000）×4.592‰
         * 由此，可计算第一个月的还款额为3854.54元人民币
         * 再依次类推，我们就可以计算出任何一个月的还本付息金额了。
         */

        DecimalFormat df = new DecimalFormat("#.00");

        int totalmomey = 380000; // 贷款总金额
        double tax = 5.94 * 0.01; // 当前利率
        double percent = 0.70; // 70% 当前为7折优惠利率
        int years = 20; // 贷款年数
        int passedMonth = 8; // 已经还款月数
        int currentYear = 2009; // 当前年份
        double oneMonthMoney = (double) totalmomey / (years * 12);

        for (int i = 0; i < years - 1; i++) {
            System.out.println("/n-------------------" + currentYear + "年还款计划-------------------");
            for (int j = 0; j < 12; j++) {
                double taxMoney = (totalmomey - oneMonthMoney * passedMonth) * (tax / 12) * percent;
                double money = oneMonthMoney + taxMoney;

                passedMonth++;
                String currentMonth = "" + (j + 1);
                if (j < 9) {
                    currentMonth = "0" + currentMonth;
                }
                System.out.println("" + currentYear + "年第" + currentMonth + "月应还款金额 : " + df.format(oneMonthMoney) + " + "
                                   + df.format(taxMoney) + " = " + df.format(money));
            }
            currentYear++;
        }
    }

    /**
     * 三、 两种还贷方式的比较
     * 1、 计算方法不同
     * 等额本息还款法——即借款人每月以相等的金额偿还贷款本息。
     * 等额本金还款法——即借款人每月等额偿还本金，贷款利息随本金逐月递减。
     * 2、 两种方法支付的利息总额不一样
     * 在相同的贷款金额、利率和贷款年限的条件下，等额本金还款法的利息总额少于等额本息还款法。
     * 3、 还款前几年的利息、本金比例不一样
     * 等额本息还款法前几年还款总额中利息占的比例较大（有时高达90%左右），等额本金还款法的本金平摊到每一次，
     * 利息借一天算一天，所以二者的比例最高时也就各占50%左右。
     * 4、 还款前后期的压力不一样
     * 因为等额本息还款法每月的还款金额是一样的，所以在收支和物价基本不变的情况下，每次的还款压力是一样的；
     * 等额本金还款法每次还款的本金一样，但利息是由多到少、依次递减，同等情况下，后期的压力要比前期轻得多。
     * 5、 要考虑资金的时间价值
     * 货币资金在不同的时间点上具有不同的价值。一般来说，年初的一元钱价值要小于年底的一元钱，
     * 这是由于资金在周转使用后会产生增值。时间越长，资金实现的增值越大。不同时期的资金不能简单的比较大小，
     * 更不能相加。在比较不同时期的资金大小时，应根据资金的时间价值折算到同一时期才能进行比较。
     * 在比较两种还款法的偿还本息多少时，如果直接将各期应偿还的绝对值相加进行比较是不客观的。通过考虑时间价值，
     * 导致不同支付之间产生不同利息的因素，两种还款法的数量上是一致的。
     * 6、 两种还款适合不同人群
     * 两种还款方式从本质上是一致的。人民银行之所以规定两种住房贷款的还款法主要是为了指导商业银行为按揭购房者
     * 提供不同程度的信贷支持。比较来年骨折的还款金额，可以看出等额本金还款法的年还款额是逐年递减的，
     * 但前期的年支付金额要大于等额本息还款法，负担较重，适用于有一定积蓄或前期收入较丰厚，但后期收入逐渐减少的借款人，
     * 如中老年人等。等额本息还款法每年的还款额相等，适用于预期收入稳定或递增的借款人，如青年人。
     * 计划贷款买房的人可以根据自身的经济状况和特点，包括各项收入、保险证券等其他借钱渠道等综合情况，
     * 与银行协商确定采用还款法，并订立合同。
     * 四、 提前还贷的计算方式
     * 1、 提前还贷的类型
     * 供房者提前还贷，并非是减少利息支出。在我国，不同的银行有不同的提前还贷方式，综合来说有全部提前还贷和部分提前还贷两大类。
     * 其中，提前全部还贷从理论上说，利息支出是做少的，但是它当然也是最考验还款人的经济实力——及还款人要有合理的计划，
     * 要有安全的资金流。在个人量入为出的前提下，这种方式是最优的。
     * 2、 提前还贷的方式选择
     * 部分提前还贷方式相对比较复杂，不同的银行分门别类也有不同的还款方式可供参考选择。大致有三种部分提前还款方式：
     * a. 部分提前还款，剩余的贷款保持每月还款额不变，将还款期限缩短。
     * b. 部分提前还款，剩余的贷款将每月还款额减少，保持还款期限不变。
     * c. 部分提前还款，剩余的贷款将每月还款额减少，同时将还款期限缩短。
     * 如何选择提前还贷方式，消费者要仔细算一下，按照不同的方式，综合考虑自己的经济实力来制定。
     * 3、 提前还贷方式的比较
     * 王先生2003年向银行借贷10年期商业性贷款35万元。第一次还款时间为2003年11月份，提前还款时间为2005年11月份，
     * 如果部分提前还贷，则提前还贷15万元（不含当月还款额）。
     * 选择方式一：一次性提前还贷
     * 经计算，王先生原月供3719元，在这种提前还贷方式下，2005年11月，当月一次还款294563元，则可以节省利息支出62474元。
     * 选择方式二：部分提前还贷，缩短还款期限
     * 经计算，王先生原月供3719元，在这种提前还贷方式下，2005年11月，当月一次还款153719元，下月起月供3714元，
     * 则新的最后还款期为2009年3月，可节省利息支出51048元。
     * 选择方式三：部分提前还贷，减少月供
     * 经计算，王先生原月供3719元，在这种提前还贷方式下，2005年11月，当月一次还款153719元，下月起月供1770元，
     * 至最后还款期为2013年10月，可节省利息支出33385元。
     * 通过上述个案分析，选择不同的方式节省的利息支出是不同等的，一次性提前还贷节省的利息支出是最大的。在部分还贷中，
     * 此外还有将每月还款额减少，同时将还款期限缩短，改变还贷方式——例如有等额本息换成等额本金还款方式。在选择之前，
     * 计算出不同方式下的还贷结果后，要结合经济实力，综合考虑时间、机会成本来确定自己的最佳方式。
     * 4、 两类人不适宜提前还贷
     * a. 第一种类型
     * 月供一样且贷款快要到期的客户。对于选择了等额本息还款法的消费者来说，如果现在贷款已经偿还了一大部分，
     * 那么提前还贷就不一定划算了。目前购房者贷款买房选择的主要是来年两种还款方式，即等额本金还款法和等额本息还款法。
     * 而绝大多数消费者选择的都是等额本息法。等额本息法每月还款额是固定的，但一开始还的大多是利息，到后面主要还本金。
     * 比如贷款10年已经还到八九年了，那环的基本上是本金，提前还贷没有意义。而递减法是利随本清，客户什么时候还都可以为自己节省出相应的利息。
     * b. 第二种类型
     * 近期有投资计划的客户。不少消费者已经习惯了一旦手上有钱就拿来提前还贷，而碰上好的投资项目有贷款去投资经营，
     * 但经营性贷款利率要比房贷高得多。因此，在提前还贷前，消费者最好考虑清楚近期有没有投资计划，如果手上有好的投资项目，
     * 收益能够超过房贷利率的，就应该考虑投资而不是提前还贷。
     */
    int i = 0;
}
