Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F85270575;
	Fri, 24 Jul 2026 21:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784929557; cv=pass; b=JmCpLWUhb7PLi7vsyjR7gaRNKJ9dfAHpLeW8GT3AMKPPfwkwZMRKdw+0qAzGhD/UsW5OgSEYpAEbLqT7aBw0VHXA9VHWU+AbXN6DcnlLoZVM+W7uoFM9yHuOtV3v9KiXFxyJvf55TJ77lGCQgtrHZhTFaAes5qm+BraQ+ppUlV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784929557; c=relaxed/simple;
	bh=iyXCwA56Mwj2jwLI5oc3LMpG6s+w7Yt0p7G6ULP6UtM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:From:To:Subject:
	 References:In-Reply-To; b=gwJPVvxkOYjiWXbo052Hp5E/0v7DvHvh64hEuJ2C1cKxxz00dXKZZXAQ9yQ8vcIBHKr2NwYF2DTY1Op8LniSC9uLHqktW2BmIFqLpl8M/9oQAEsxaQuLCPNM5TvsLfsPcwOaKkf3KVs1FaW6K9igzZTJ8PCpddB54wp6XILi0EI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=bWHX52hF; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="bWHX52hF"
ARC-Seal: i=1; a=rsa-sha256; t=1784929545; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jg9sVkaA4FsA2n8mr5kxV9PtBeffzlALlFH1x1R840nsknVgJl0D69pY+wbhTboX0JDEUPjPPGeKHgZJ5YJJ9mB0EmJC7B/Z8pKVB1qrQTPirkSHMWbpvDS98fYrqhj0oWzsBaajIMqubt3arSQURrisFqcmACHhUuWpb6kiQ2E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784929545; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZwO9vl5SdmsC4x/0A+z1J7eajtzRul5vOWL0tTZy/LM=; 
	b=eVXaPPK3qV1wF2RT+iS3PzY8PfjD+SYz4yMjtHlDumIQqS4oBH3LafNEMHaSGpebAK+ykaUvIl40meJ7eqzQbZtmPf3PwTlpbQboVQaa6Oe4hCFgJvSG/oFGWc+oG76TH80jK8kWrNIJ9NTj3aZ3yLQqrbh5mfvYj4vAnbhZVcs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784929545;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:From:From:To:To:Subject:Subject:In-Reply-To:Reply-To;
	bh=ZwO9vl5SdmsC4x/0A+z1J7eajtzRul5vOWL0tTZy/LM=;
	b=bWHX52hFqnA9H8MN0hf6TmPN1dYOi6r/AdIdfh43HFr5xS5yMKSvGQEJm+xz9PHJ
	rF4j3eycCBdRbc/PJpiOq8E++rKxnvn2cswXKabKcUrKVyYEY1gMvCQWFWvTLyZAkZ6
	eKtrdc4IcvAUe5bYF/QrjGFxYUGLar/vQZhG0iQo=
Received: by mx.zohomail.com with SMTPS id 1784929543234927.7492546551205;
	Fri, 24 Jul 2026 14:45:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Jul 2026 17:45:39 -0400
Message-Id: <DK74PQIFX6QJ.20WW5651U7KCX@ritovision.com>
Cc: "Jonathan Corbet" <corbet@lwn.net>, "Daniel Lundberg Pedersen"
 <dlp@qtec.com>, <linux-doc@vger.kernel.org>, <linux-media@vger.kernel.org>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Rito Rhymes" <rito@ritovision.com>, "Mauro Carvalho Chehab"
 <mchehab+huawei@kernel.org>, "Hans Verkuil" <hverkuil+cisco@kernel.org>
Subject: Re: Bad wrapping in some tables
X-Mailer: aerc 0.21.0
References: <c542aaf7-6a40-4730-8bd6-208c9fe932d5@qtec.com>
 <87pl0yr9ah.fsf@trenco.lwn.net> <DJUP0UXLLHJ0.3P121A982R9TP@ritovision.com>
 <7fcac682-60e3-4e1d-b26b-5b23f8035a91@kernel.org>
 <20260710104220.2b165f2d@foz.lan>
 <DJWJW4K4MAFK.2RJI3ENU1NQYE@ritovision.com>
In-Reply-To: <DJWJW4K4MAFK.2RJI3ENU1NQYE@ritovision.com>
X-ZohoMailClient: External

I now have a working solution that addresses both the general table
responsiveness issues throughout the docs site and the specific table
problems with unreadable vertical text / inline literals / narrow
content wrapping as first discussed in this thread.

> The only workable solution would be to move away from tables
> and format it differently.

The tables remain the same formatted tables as before, unremarkable,
they just work properly now at different viewport sizes and remain
readable throughout regardless of their contents.

No JavaScript. No new dependencies. No formatting overhaul.

The solution is a set of targeted changes plus a small build-time layer
that injects per-column CSS to assign balanced widths in a way that
generalized selectors can't normally target based on table contents.

It's ready for others to test out. The patch series is:

[PATCH 0/2] docs: make tables responsive with content-aware column
widths

I also have a demo site of Linux Kernel docs at:

linux-tables.ritovision.com

Please test the previously affected pages and anywhere else and let me
know whether any issues remain.

** One visible change is the wider layout. Mauro's queued change raises
the body's max-width from 800px to 120em, allowing content to use
substantially more of the available desktop width. This series builds
on that change, which Jon approved:

  [PATCH] docs: custom.css: don't limit randering to old 800px monitors

The wider layout is useful for tables, but a more selective max-width
can still be applied to prose or other content if desired.


About the solution:

1. Foundational contained horizontal overflow
2. Content-aware targeted CSS

For integration, this series is intended to replace the two pending
docs-next changes: it retains inline-literal overflow-wrap: anywhere
instead of carrying Jon's revert, and uses max-width: none instead of
Mauro's 120em limit.

1. Foundational contained horizontal overflow

For tables to behave responsively across viewport sizes, they need to
overflow locally when they are too wide rather than expanding the entire
page or compressing multiple columns until their contents become
unreadable.

This series adds contained horizontal overflow for generated tables.
Applying overflow directly to the table causes doubled borders and other
rendering defects, so the overflow is placed on an outer wrapper instead.
The table remains visually unchanged and scrolls within that wrapper when
necessary. The wrapper is added at build time through table_layout.py.

Once tables can scroll within their own container, the document body
must be wide enough to avoid forcing local scrolling while usable
viewport space remains. Mauro's change raises the body max-width from
800px to 120em, which Jon approved, giving tables substantially more
room across ordinary desktop layouts. This series builds on that change.

A table remains contained and becomes locally scrollable when its
readable width exceeds the available viewport space or, on wider
layouts, the 120em body maximum. A narrower max-width can still be
applied selectively to prose or other content without further
constraining tables.

2. Content-aware targeted CSS

The first issue identified in this thread was inline literals wrapping
into unreadable vertical text inside tables. The global
overflow-wrap: anywhere rule remains necessary because it allows long
inline literals to wrap rather than overflow their containers and break
the surrounding layout.

Tables introduce a different constraint. The same wrapping behavior can
become too aggressive inside narrow columns, causing inline literals to
collapse into vertical text. However, restoring non-wrapping behavior
for inline literals inside tables creates the opposite failure: the
literal column consumes more width and compresses neighboring text
columns until they become unreadable instead.

These opposite failures can be seen on the same table at viewport widths
of 500px or narrower.

In v7.1, the inline-literal column collapses:

https://www.kernel.org/doc/html/v7.1/process/debugging/kgdb.html#run-time-p=
arameter-kgdbreboot

In v7.0, the neighboring text column collapses:

https://www.kernel.org/doc/html/v7.0/process/debugging/kgdb.html#run-time-p=
arameter-kgdbreboot

With the series applied, both columns remain readable:

https://linux-tables.ritovision.com/process/debugging/kgdb.html#run-time-pa=
rameter-kgdbreboot

This creates an impasse for generalized CSS selectors. A rule that fixes
one column can create an imbalance in another because CSS selectors
cannot derive an appropriate minimum width from each column's actual
contents.

Rather than adding widths manually or using client-side JavaScript, the
existing build-time layer measures each logical column and assigns a
content-derived CSS class. Those classes establish a readable minimum
width for each column while still allowing the table layout to
distribute additional space naturally.

Wrapping remains available as a safeguard for unusually long literals,
identifiers, and URLs, preventing them from forcing unbounded column
widths. The content-derived minimums prevent that wrapping from occurring
so aggressively that either the literal column or its neighboring text
columns collapse into vertical text.

Rito
