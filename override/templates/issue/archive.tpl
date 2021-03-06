{**
 * templates/issue/archive.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Issue Archive.
 *
 *}
{strip}
{assign var="pageTitle" value="archive.archives"}
{include file="common/header.tpl"}
{/strip}

<div id="issues">
{iterate from=issues item=issue}
	{if $issue->getYear() != $lastYear}
		{if !$notFirstYear}
			{assign var=notFirstYear value=1}
		{else}
			</div>
			<br />
			<div class="year-separator" style="clear:left;"></div>
		{/if}
		<div style="float: left; width: 100%;">
		<div class="issues-archive">
		<h3>{$issue->getYear()|escape}</h3>
		</div>
		{assign var=lastYear value=$issue->getYear()}
	{/if}

	<div id="issue-{$issue->getId()}" class="issue" style="clear:left;">
	{if $issue->getLocalizedFileName() && $issue->getShowCoverPage($locale) && !$issue->getHideCoverPageArchives($locale)}
		<div class="issue-cover-image"><a href="{url op="view" path=$issue->getBestIssueId($currentJournal)}"><img src="{$coverPagePath|escape}{$issue->getFileName($locale)|escape}"{if $issue->getCoverPageAltText($locale) != ''} alt="{$issue->getCoverPageAltText($locale)|escape}"{else} alt="{translate key="issue.coverPage.altText"}"{/if}/></a>
		</div>
		<div class="issue-archives-title"><h4><a href="{url op="view" path=$issue->getBestIssueId($currentJournal)}">{$issue->getLocalizedTitle()|escape}</a></h4></div>
		<div class="issue-cover-description">&bull; {$issue->getLocalizedCoverPageDescription()|strip_unsafe_html|nl2br}</div>
        <div class="issue-cover-description">&bull; {$issue->getLocalizedDescription()|strip_unsafe_html|nl2br}</div>
	{else}
		<h4><a href="{url op="view" path=$issue->getBestIssueId($currentJournal)}">{$issue->getIssueIdentification()|escape}</a></h4>
		<div class="issue-description">{$issue->getLocalizedDescription()|strip_unsafe_html|nl2br}</div>
	{/if}
	</div>

{/iterate}
{if $notFirstYear}<br /></div>{/if}

{if !$issues->wasEmpty()}
	<div class="issues-pagination" style="clear:left;">
		<p class="issues-pagination-text">{page_info iterator=$issues}&nbsp;&nbsp;&nbsp;&nbsp;
		{page_links anchor="issues" name="issues" iterator=$issues}
		</p>
	</div>
{else}
	{translate key="current.noCurrentIssueDesc"}
{/if}
</div>
{include file="common/footer.tpl"}

{* MODIFICADO OJS V.2.4.6 / 06-2015*}
