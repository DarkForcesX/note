<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1587442230512" ID="ID_1896394492" MODIFIED="1587534557734" STYLE="bubble" TEXT="package: sort">
<node CREATED="1587444828716" ID="ID_1385814832" MODIFIED="1587447203865" POSITION="right" TEXT="&#x4f7f;&#x7528;">
<node CREATED="1587447203865" HGAP="30" ID="ID_1026568871" MODIFIED="1587447282403" TEXT="&#x51fd;&#x6570;" VSHIFT="-43">
<node CREATED="1587446335115" HGAP="14" ID="ID_853131821" MODIFIED="1587447316500" TEXT="&#x53c2;&#x6570;&#x4e3a;&#x57fa;&#x7840;&#x7c7b;&#x578b;&#x8c03;&#x7528;" VSHIFT="-47">
<node CREATED="1587446929505" ID="ID_852299327" MODIFIED="1587446931992" TEXT="func Ints(a []int)"/>
<node CREATED="1587446963245" ID="ID_736370838" MODIFIED="1587446965718" TEXT="func Float64sAreSorted(a []float64) bool"/>
<node CREATED="1587447000439" ID="ID_1222293666" MODIFIED="1587447006728" TEXT="....."/>
<node CREATED="1587446973283" ID="ID_551593265" MODIFIED="1587446974501" TEXT="func Search(n int, f func(int) bool) int"/>
<node CREATED="1587446990276" ID="ID_1675009554" MODIFIED="1587446991620" TEXT="func Slice(slice interface{}, less func(i, j int) bool)"/>
</node>
<node CREATED="1587442824502" HGAP="17" ID="ID_163690743" MODIFIED="1587447279430" TEXT="&#x53c2;&#x6570;&#x4e3a;&#x5305;&#x7c7b;&#x578b;&#x8c03;&#x7528;" VSHIFT="-27">
<node CREATED="1587446707796" HGAP="31" ID="ID_740694013" MODIFIED="1587447589151" TEXT="step1: &#x8f6c;&#x6362;&#x4e3a;&#x5305;&#x7c7b;&#x578b;" VSHIFT="-39">
<node CREATED="1587442435885" ID="ID_1351884343" MODIFIED="1587447098857" TEXT="&#x5305;&#x63a5;&#x53e3;&#x7c7b;&#x578b;&#x8f6c;&#x6362;">
<node CREATED="1587442510052" ID="ID_1120663626" MODIFIED="1587447117505" TEXT="sort&#x5305;&#x51fd;&#x6570;&#x7684;&#x8fd4;&#x56de;&#x503c;">
<node CREATED="1587442628649" HGAP="69" ID="ID_1316698421" MODIFIED="1587446071876" TEXT="func Reverse(data Interface) Interface"/>
</node>
<node CREATED="1587442555987" ID="ID_1740353051" MODIFIED="1587447117508" TEXT="&#x624b;&#x52a8;&#x5b9e;&#x73b0;&#x63a5;&#x53e3;&#x65b9;&#x6cd5;">
<node CREATED="1587442455133" HGAP="81" ID="ID_1499884039" MODIFIED="1587446068733" TEXT="//&#x81ea;&#x5b9a;&#x4e49;&#x7c7b;&#x578b;&#x5b9e;&#x73b0;&#xa;type SortBy []Type  &#xa;func (a SortBy) Len() int           {return len(a) }&#xa;func (a SortBy) Swap(i, j int)      { a[i], a[j] = a[j], a[i] } &#xa;func (a SortBy) Less(i, j int) bool { return a[i] &lt; a[j] }"/>
</node>
</node>
<node CREATED="1587442852851" ID="ID_974155768" MODIFIED="1587447098861" TEXT="&#x5305;&#x81ea;&#x5b9a;&#x4e49;&#x7c7b;&#x578b;&#x8f6c;&#x6362;">
<node CREATED="1587442858439" ID="ID_1555930451" MODIFIED="1587447117511" TEXT="type IntSlice []int">
<node CREATED="1587444501259" HGAP="82" ID="ID_348694169" MODIFIED="1587446067098" TEXT="//&#x7c7b;&#x578b;&#x8f6c;&#x6362;&#xa;s :=[]int{}&#xa;sort.IntSlice(s)" VSHIFT="-3"/>
</node>
<node CREATED="1587442885784" ID="ID_565301046" MODIFIED="1587447117515" TEXT="type Float64Slice []float64">
<node CREATED="1587444501259" ID="ID_218603093" MODIFIED="1587445949488" TEXT="//&#x7c7b;&#x578b;&#x8f6c;&#x6362;&#xa;s :=[]float64{}&#xa;sort.Float64Slice(s)"/>
</node>
<node CREATED="1587442900982" ID="ID_574774221" MODIFIED="1587447117518" TEXT="type StringSlice []string">
<node CREATED="1587444501259" HGAP="42" ID="ID_54571482" MODIFIED="1587446075824" TEXT="//&#x7c7b;&#x578b;&#x8f6c;&#x6362;&#xa;s :=[]string{}&#xa;sort.StringSlice(s)" VSHIFT="-1"/>
</node>
</node>
</node>
<node CREATED="1587442953168" HGAP="40" ID="ID_1696322959" MODIFIED="1587447596281" TEXT="step2: &#x8c03;&#x7528;&#x5305;&#x51fd;&#x6570;" VSHIFT="-68">
<node CREATED="1587443421448" HGAP="34" ID="ID_1485987189" MODIFIED="1587446908598" TEXT="&#x8fd9;&#x4e0d;&#x662f;&#x771f;&#x7684;&#x6392;&#x5e8f;: func Reverse(data Interface) Interface" VSHIFT="-4"/>
<node CREATED="1587443468339" HGAP="37" ID="ID_1543404918" MODIFIED="1587446914730" TEXT="&#x5f00;&#x59cb;&#x6267;&#x884c;&#x6392;&#x5e8f;&#xff1a;func Sort(data Interface)" VSHIFT="1"/>
</node>
</node>
</node>
<node CREATED="1587447217584" HGAP="41" ID="ID_789384035" MODIFIED="1587447681741" TEXT="&#x5e38;&#x91cf;" VSHIFT="53"/>
<node CREATED="1587447223356" HGAP="33" ID="ID_675174975" MODIFIED="1587447677948" TEXT="&#x7ed3;&#x6784;&#x4f53;" VSHIFT="77">
<node CREATED="1587447622262" HGAP="22" ID="ID_992881876" MODIFIED="1587447727883" TEXT="&#x5b9a;&#x4e49;&#x7ed3;&#x6784;&#x4f53;" VSHIFT="2">
<node CREATED="1587447257794" ID="ID_485139790" MODIFIED="1587447328901" TEXT="&#x7ed3;&#x6784;&#x4f53;&#x65b9;&#x6cd5;" VSHIFT="4"/>
</node>
</node>
</node>
<node CREATED="1587444823896" HGAP="14" ID="ID_697041913" MODIFIED="1587447482843" POSITION="left" TEXT="&#x5b9a;&#x4e49;" VSHIFT="-3">
<node CREATED="1587444909050" HGAP="45" ID="ID_1461515996" MODIFIED="1587446003893" TEXT="&#x51fd;&#x6570;" VSHIFT="-5">
<node CREATED="1587445427720" ID="ID_1149531631" MODIFIED="1587447112917" TEXT="&#x51fd;&#x6570;&#x5b9a;&#x4e49;">
<icon BUILTIN="down"/>
<node CREATED="1587445435070" HGAP="203" ID="ID_709232290" MODIFIED="1587446861344" TEXT="&#x51fd;&#x6570;&#x5b9e;&#x73b0;" VSHIFT="2">
<icon BUILTIN="down"/>
</node>
</node>
<node CREATED="1587445474096" ID="ID_108418760" MODIFIED="1587447112918" TEXT="func Float64s(a []float64)&#xa;&#xff08;...&#xff09;&#xa;func StringsAreSorted(a []string) bool">
<node CREATED="1587445689237" HGAP="22" ID="ID_1206533352" MODIFIED="1587446858781" TEXT="golang&#x5e95;&#x5c42;&#x5b9e;&#x73b0;&#x6e90;&#x7801;" VSHIFT="2"/>
</node>
</node>
<node CREATED="1587444939387" HGAP="46" ID="ID_1793380" MODIFIED="1587446791505" TEXT="&#x5305;&#x7c7b;&#x578b;">
<node CREATED="1587444915537" HGAP="22" ID="ID_455542743" MODIFIED="1587447112920" TEXT="&#x7c7b;&#x578b;&#x5b9a;&#x4e49;" VSHIFT="14">
<icon BUILTIN="down"/>
<node CREATED="1587444923514" HGAP="123" ID="ID_1080804866" MODIFIED="1587446845467" TEXT="&#x7c7b;&#x578b;&#x65b9;&#x6cd5;" VSHIFT="3">
<icon BUILTIN="down"/>
</node>
</node>
<node CREATED="1587442858439" ID="ID_1169242901" MODIFIED="1587447112927" TEXT="type IntSlice []int">
<node CREATED="1587444024884" HGAP="85" ID="ID_396369420" MODIFIED="1587446112327" TEXT="//IntSlice &#x7c7b;&#x578b;&#x5b9e;&#x73b0; Interface&#x63a5;&#x53e3;&#xa;func (p IntSlice) Len() int &#xa;func (p IntSlice) Less(i, j int) bool &#xa;func (p IntSlice) Swap(i, j int)"/>
<node CREATED="1587444501259" HGAP="82" ID="ID_1853236686" MODIFIED="1587446115301" TEXT="//&#x5355;&#x72ec;&#x7684;&#x65b9;&#x6cd5;&#xa;func (p IntSlice) Search(x int) int&#xa;func (p IntSlice) Sort() " VSHIFT="-1"/>
</node>
<node CREATED="1587442885784" ID="ID_1578395410" MODIFIED="1587447112930" TEXT="type Float64Slice []float64">
<node CREATED="1587444286183" ID="ID_1491487761" MODIFIED="1587444349368" TEXT="//&#x5b9e;&#x73b0;Interface&#x63a5;&#x53e3;&#xa;func (p Float64Slice) Len() int &#xa;func (p Float64Slice) Less(i, j int) bool &#xa;func (p Float64Slice) Swap(i, j int)&#xa;"/>
<node CREATED="1587444351369" ID="ID_592360622" MODIFIED="1587444488364" TEXT="//&#x5355;&#x72ec;&#x7684;&#x65b9;&#x6cd5;&#xa;func (p Float64Slice) Search(x float64) int&#xa;func (p Float64Slice) Sort()"/>
</node>
<node CREATED="1587442900982" ID="ID_777311516" MODIFIED="1587447112934" TEXT="type StringSlice []string">
<node CREATED="1587444611114" HGAP="41" ID="ID_60870517" MODIFIED="1587446083849" TEXT="//&#x5b9e;&#x73b0;Interface&#x63a5;&#x53e3;&#xa;func (p StringSlice) Len() int&#xa;func (p StringSlice) Less(i, j int) bool &#xa;func (p StringSlice) Swap(i, j int)" VSHIFT="-1"/>
<node CREATED="1587444705520" HGAP="44" ID="ID_798431285" MODIFIED="1587446091198" TEXT="//&#x5355;&#x72ec;&#x7684;&#x65b9;&#x6cd5;&#xa;func (p String    Slice) Search(x string) int                                  &#xa;func (p StringSlice) Sort() "/>
</node>
</node>
<node CREATED="1587445090686" HGAP="51" ID="ID_532024631" MODIFIED="1587446014658" TEXT="&#x63a5;&#x53e3;" VSHIFT="-2">
<node CREATED="1587444874526" HGAP="22" ID="ID_930565008" MODIFIED="1587447112934" TEXT="&#x63a5;&#x53e3;&#x5b9a;&#x4e49;" VSHIFT="12">
<icon BUILTIN="down"/>
<node CREATED="1587445067893" HGAP="156" ID="ID_1767136125" MODIFIED="1587446850512" TEXT="&#x63a5;&#x53e3;&#x5b9e;&#x73b0;" VSHIFT="4">
<icon BUILTIN="down"/>
</node>
</node>
<node CREATED="1587442242550" ID="ID_85756111" MODIFIED="1587447112936" TEXT="//&#x63a5;&#x53e3;&#x5b9a;&#x4e49;&#xa;type Interface interface { &#x9;&#xa;    Len() int &#x9;&#xa;    Less(i, j int) bool &#x9;&#xa;    Swap(i, j int) &#xa;}&#xa;">
<node CREATED="1587442340331" ID="ID_1058327223" MODIFIED="1587445362182" TEXT="//&#x81ea;&#x5b9a;&#x4e49;&#x7c7b;&#x578b;&#x5b9e;&#x73b0; &#xa;type SortBy []Type   &#xa;func (a SortBy) Len() int           {return len(a) } &#xa;func (a SortBy) Swap(i, j int)      { a[i], a[j] = a[j], a[i] }  &#xa;func (a SortBy) Less(i, j int) bool { return a[i] &lt; a[j] } "/>
</node>
</node>
<node CREATED="1587445655059" HGAP="50" ID="ID_42142114" MODIFIED="1587446256014" TEXT="&#x5e38;&#x91cf;"/>
<node CREATED="1587447482843" HGAP="50" ID="ID_1782323306" MODIFIED="1587447505948" TEXT="&#x53d8;&#x91cf;" VSHIFT="-6"/>
<node CREATED="1587445659871" HGAP="42" ID="ID_1170656029" MODIFIED="1587446272859" TEXT="&#x7ed3;&#x6784;&#x4f53;" VSHIFT="-103">
<node CREATED="1587447231591" HGAP="21" ID="ID_1045604279" MODIFIED="1587447333695" TEXT="&#x7ed3;&#x6784;&#x4f53;&#x65b9;&#x6cd5;" VSHIFT="2"/>
</node>
</node>
</node>
</map>
