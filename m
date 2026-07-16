Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5122800
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 00:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784160896; cv=none; b=Ib3sxmi05NMoPdas5gMhh3TAMjOYVn34tNh7ZRdXQkVoTlLPtLrcB8B4mSuZXxYLomEtytgzfo4BEU9/4OTOkUzBred56f0vB3LAWWda7p8Pc7UNPnsQT4r5Df/DZlywNSpFwIwd12huLqj57lKgwVmZWKiT5l+W5u+T6gtdCxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784160896; c=relaxed/simple;
	bh=LKWoL8G1qBRLXbPYq2tXucvNseyigWBplZ0jHan94q8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MekqFRueiOEIk/3TewEYRu43xQ+P6Z49hssokGE3I415itdWMbVtcyHLExdx7rB7aI4Rtcbnbz9zHKoaw6etK/y7ClUtN8GUrKdchBNgf2LoIbf68pkNV8EjZAueUg3VpJvZJLG5RlsowIq277X1WzICSNskPpbJm5TTrOJ3Gpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GFOnKhC5; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GFOnKhC5"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784160892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qs6xIbSrMIDDADseyfFLisFrJ0x3PUEZvFX9L6cYdYs=;
	b=GFOnKhC550ursiL1a5IpVB34mzEqoSGLG3VUKV0cZe1Zg2eNRcxYrS9HI+DfhKLQliXH+Y
	ez4xlnYSQWXKJpxE1CDPzoYMWnlggoxdLkDkHFfgL4gVEGBiwM/krm6XI1yX+iBimsmFMG
	4grufLLn0SmGMX7RNMEPKH0GCGYpMps=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,  Jan Kara
 <jack@suse.cz>,  Theodore Tso <tytso@mit.edu>,  Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>,  Derek Barbosa <debarbos@redhat.com>,
  Matthieu Baerts <matttbe@kernel.org>,  Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>,  Jason Gunthorpe <jgg@ziepe.ca>,  Steven
 Rostedt <rostedt@goodmis.org>,  users@kernel.org,  Linux Media Mailing
 List <linux-media@vger.kernel.org>,  Stephen Finucane
 <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
In-Reply-To: <20260715204238.GP1778116@killaraus.ideasonboard.com> (Laurent
	Pinchart's message of "Wed, 15 Jul 2026 23:42:38 +0300")
References: <20260713095538.3d5e86f1@foz.lan>
	<20260713094120.GD1127719@killaraus.ideasonboard.com>
	<20260713220427.582b28bf@foz.lan>
	<7ia4mrvtrxjl.fsf@castle.c.googlers.com>
	<20260715005909.GF1656185@killaraus.ideasonboard.com>
	<alcBvuIMEGSjAD1R@mit.edu>
	<20260715161111.GC1778116@killaraus.ideasonboard.com>
	<j4jhhj6rw6kgem73slctakegtoirqmngbejbabfnfwtyshdlgp@itpaup6ghuod>
	<20260715202808.GN1778116@killaraus.ideasonboard.com>
	<7b8e735092ecd25c61e79d8291b2edf5e54dfb15.camel@HansenPartnership.com>
	<20260715204238.GP1778116@killaraus.ideasonboard.com>
Date: Thu, 16 Jul 2026 00:14:22 +0000
Message-ID: <7ia4o6g7vli9.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT

Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

> On Wed, Jul 15, 2026 at 04:36:42PM -0400, James Bottomley wrote:
>> On Wed, 2026-07-15 at 23:28 +0300, Laurent Pinchart wrote:
>> [...]
>> > No later than yesterday a friend of mine pointed me to a mail thread
>> > where sashiko referenced code that has never existed in the kernel,
>> > and the maintainer blindly trusted the comment and asked the patch
>> > author to fix that issue, seemingly doubling down when told the code
>> > didn't exist.
>> 
>> We can definitely do maintainer education if you point me (or the TAB)
>> at the thread.  Sashiko as a tool can absolutely get things wrong so,
>> as maintainers, we do need to accept a reasoned answer that shows the
>> review is wrong.
>
> I've shared this with the person who reported the issue to me, as I
> don't know if they're comfortable discussing it publicly.

I'd suggest to report these issues as github issue in the sashiko
repository or as an email to the sashiko@ mailing list (or email me
privately). Or the best, send me a pull request with a fix.
It's not _always_ addressable, but in many cases it is.
But obviously it's not gonna be fixed if it's a hidden knowledge.

Thank you!
