<html>
<!-- Zhanelya Subebayeva -->
    <head>
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
    <table>
    <tr>
        <th><i>Target</i></th>
        <th><i>Successor</i></th>
        <th><i>Frequency</i></th>
    </tr>
{   (:form a tuple of 'has' and its successor (choose from file all 'has'-succ pairs):)
    let $has_succ_tuple := for $s in collection('xml-files?select=*.xml')//s
        return   
            for $w in $s/w
            return
                if(lower-case(normalize-space($w/text())) eq 'has') 
                    then
                        let $succ := (data($s/w[.>> $w][1]))
                        return
                             (:use ',' as separator of 'has'-succ tuple:)
                             <tuple> {lower-case(normalize-space($w/text()))} {','}{lower-case(normalize-space($succ))}</tuple>
                    else  ()
    (:select distinct values:)                
    for $distinct in distinct-values($has_succ_tuple/text())
        (:count occurrences:)
        let $count := count($has_succ_tuple[text() = $distinct])
        let $d := (($has_succ_tuple[text() = $distinct])[1])
        (:tokenize the tuple into $arr[1] - 'has' and $arr[2] - 'successor':)
        let $arr := tokenize($d, ',')
        (:put in descending order:)
        order by $count descending
        return
            <tr>
                <td>{$arr[1]}</td>
                <td>{$arr[2]}</td>
                <td>{$count}</td>
            </tr>
}
    </table>
    </body>
</html>
