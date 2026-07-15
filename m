Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEC4384CCA
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 23:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784158375; cv=none; b=nXzit4FvmakhsVRRJiTkzV2Yxly7bms/0cwHZDF4NFf8J+9uC6X3hl1L6jXFPEs4mvEShEqjJAbkA9YuuT1kz8jDzyfJzizF4YH1bUHMs/Td6cgR/ZFyZy05ojHnMWOCiRGpur4w9dBAO3x5THBCDPxXFEoGrM9VjvI2oSAw6kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784158375; c=relaxed/simple;
	bh=XCOUvIzXhtHKRfHdxm2fRbQbGj3pHGfJIrsl56lUm34=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jrVTVAEpmAqFnf72CPkeWhGx5P1HtzqLWXZU8DgQzCinTalo1z5Fpq8jg2nq4cxj+/vnJ9ZbGKmkCGpnMc3SwFtrEq3AmlwjqhvAeCOakQqV5FTBkUHL48kecu6l1X/wYFlwZqARwrpEvhhx4KMsPo6ezNjiWh+w4Ctx6eOzHE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf18.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id A97F480172;
	Wed, 15 Jul 2026 23:32:51 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf18.hostedemail.com (Postfix) with ESMTPA id 3423E2E;
	Wed, 15 Jul 2026 23:32:39 +0000 (UTC)
Date: Wed, 15 Jul 2026 19:32:28 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jan Kara <jack@suse.cz>, Theodore Tso <tytso@mit.edu>, Roman Gushchin
 <roman.gushchin@linux.dev>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Derek Barbosa <debarbos@redhat.com>, Matthieu
 Baerts <matttbe@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 users@kernel.org, Linux Media Mailing List <linux-media@vger.kernel.org>,
 Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260715193228.758ab2be@robin>
In-Reply-To: <20260715202808.GN1778116@killaraus.ideasonboard.com>
References: <20260710083845.23c753ca@foz.lan>
	<87wlv2jq4t.fsf@linux.dev>
	<20260713095538.3d5e86f1@foz.lan>
	<20260713094120.GD1127719@killaraus.ideasonboard.com>
	<20260713220427.582b28bf@foz.lan>
	<7ia4mrvtrxjl.fsf@castle.c.googlers.com>
	<20260715005909.GF1656185@killaraus.ideasonboard.com>
	<alcBvuIMEGSjAD1R@mit.edu>
	<20260715161111.GC1778116@killaraus.ideasonboard.com>
	<j4jhhj6rw6kgem73slctakegtoirqmngbejbabfnfwtyshdlgp@itpaup6ghuod>
	<20260715202808.GN1778116@killaraus.ideasonboard.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: z9geae9d9fykme9j8ghttigqbddb9i96
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: 3423E2E
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19AVtnCvV/5fP2akHDaFab32uuFwkXJPw4=
X-HE-Tag: 1784158359-649090
X-HE-Meta: U2FsdGVkX18mtIvdrR3HdVoDJ2m7OkTNVt1yW5oVwVgfPLbpz9qMRrzDa8Adxwpxnq7Ri5j3H2DSIHgaQ0XT/EuLoRoleuuCNon4iSSizDq2xIY9kImTac/yow0naHLdWr/4y5kyvgCcz8qIWbmGwqxTmiBAy1wEt6yZBjilLODtHFd6eCsxbhD68Pl6Qtqil5EeP+0czJipoEvLQEgoprImu9bYtJTD+eUUT7OWjCBdXHEwlxYJA77PNPyO9z8hir8cM2jglaWyRW8h4sQOX9EQLa7/A6V9ccouZs43u94Ga5W1K0YDD2Y5Do6PQYkgyF9Eykvsz9T/kG0SmQLnmpPUNQSyDAoMUE3sbXDGLYwQKV+e1G6SoALp86c+cksp

On Wed, 15 Jul 2026 23:28:08 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> I feel that justifying myself against generative AI hallucinations that
> are blindly trusted by maintainers makes me feel diminished as a human.

I like to read the Sashiko reviews and look for issues with it. This is
why I *want* the email to the mailing list. It's so much easier to
reply to the Sashiko review in an email and point out where it's just
wrong and point out what I want the author of the patch to fix.

I've been using the "copy" icon to paste the reviews in emails back to
the author[*].

> 
> No later than yesterday a friend of mine pointed me to a mail thread
> where sashiko referenced code that has never existed in the kernel, and
> the maintainer blindly trusted the comment and asked the patch author to
> fix that issue, seemingly doubling down when told the code didn't exist.

This looks to me as a issue with a maintainer needing to be educated
about AI tooling. Just like I get AI slop and need to tell people the
AI is wrong, we need to look at maintainers to keep them from getting
lazy and just accepting what the AI review says.

-- Steve

[*] Roman, the paste from the copy icon appears to remove blank lines.
    This makes the output difficult to read as everything is bunched
    together. I typically go through and manually add back those blank
    lines. Is this a known issue? Can it be fixed?

    Of course, if I now have Sashiko replying to the tracing mailing
    list, I may not need to use that feature anymore.
