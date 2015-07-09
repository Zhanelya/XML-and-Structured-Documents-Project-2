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
    </tr>
{
    (:retrieve all xml files from xml-files/ subfolder:)
    (:for each sentence:)
    for $s in collection('xml-files?select=*.xml')//s
        return   
            for $w in $s/w
            return
                (:find words equal to 'has', normalize data to svoid loosing data, such as Has, HAS, etc.:)
                if(lower-case(normalize-space($w/text())) eq 'has') 
                    then
                        (:get the element next to the word equal to 'has':)
                        let $succ := (data($s/w[.>> $w][1]))
                        return
                        <tr>
                            <td> {data($w)}</td>
                            <td>{$succ}</td>
                        </tr>
                    else  ()
}
    </table>
    </body>
</html>
