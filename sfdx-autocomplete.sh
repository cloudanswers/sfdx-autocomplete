# --- custom sfdx autocomplete

_sfdx_complete_()
{
    local cur
    # local cur_clean
    local words
    # local words_clean
    local matched_words

    cur="${COMP_WORDS[COMP_CWORD]}"

    # storing static list because sfdx command takes several seconds to return the command list on an i7
    # words=`sfdx force:doc:commands:list | sed 's/#.*//' | sed 's/[ ]*//g'`
    words='force:alias:list force:alias:set force:apex:class:create force:apex:execute force:apex:log:get force:apex:log:list force:apex:test:report force:apex:test:run force:auth:jwt:grant force:auth:sfdxurl:store force:auth:web:login force:config:get force:config:list force:config:set force:data:bulk:delete force:data:bulk:status force:data:bulk:upsert force:data:record:create force:data:record:delete force:data:record:get force:data:record:update force:data:soql:query force:data:tree:export force:data:tree:import force:doc:commands:display force:doc:commands:list force:lightning:app:create force:lightning:component:create force:lightning:event:create force:lightning:interface:create force:lightning:test:create force:lightning:test:run force:limits:api:display force:mdapi:convert force:mdapi:deploy force:mdapi:retrieve force:org:create force:org:delete force:org:display force:org:list force:org:open force:package1:version:create force:package1:version:create:get force:package1:version:display force:package1:version:list force:package2:create force:package2:installed:list force:package2:list force:package2:manifest:create force:package2:members:list force:package2:version:create force:package2:version:create:get force:package2:version:create:list force:package2:version:get force:package2:version:install force:package2:version:list force:package2:version:uninstall force:package2:version:update force:package:install force:package:install:get force:project:create force:project:upgrade force:schema:sobject:describe force:schema:sobject:list force:source:convert force:source:open force:source:pull force:source:push force:source:status force:user:password:generate force:user:permset:assign force:visualforce:component:create force:visualforce:page:create'

    # bash uses : as a separator, so we swap it out while detecting then put the colons back after
    # words_clean=${words//\:/__COLON__}
    # cur_clean=${cur//\:/__COLON__}

    # includes work-around for colons being separators in bash
    colonprefixes=${cur%"${cur##*:}"}
    COMPREPLY=( $(compgen -W '$words'  -- $cur))
    local i=${#COMPREPLY[*]}
    while [ $((--i)) -ge 0 ]; do
        COMPREPLY[$i]=${COMPREPLY[$i]#"$colonprefixes"}
    done

    return 0
} &&
complete -F _sfdx_complete_ sfdx
