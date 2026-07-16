Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06493FFD
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 00:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784160239; cv=none; b=kibxFK0JD1iF0aI4WO6jL4X1RtEANXZQuzv7O+hOhDESkJkI/eXLmM6oUyNpRO3MkfXWqbc1n1LAuqdGVNZa5oDDxNlrwyS4wbtm8u4NY2i0+L4EBzDAhiDA4a2jUpglnn2X3SsDm7PdpvtZcQx71GH1g2gjW1ciK5wYcRrFq3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784160239; c=relaxed/simple;
	bh=nr9gFNyf0XSB0zuAGXQEiNouNiydZSu22N6SCJb+QkA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=efZ0LQu+OtVqQbrlIvLGMUygjl259u4iJJlIWU1JOWj97+IU2RbFnodV8k38EYtmXVaiFpVjo3InMCsxQVg9s96WKMfWgZWNR8uaq7KpXBTYcFeo593Yvy0ndF2Tru8R+CQgGCzzAF7GLU9udaBV3TUxELyMvWaOJAQlMoROTWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qc/GlVNE; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qc/GlVNE"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784160234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=242aWuhBdqR62+U6q1Fei2dS9Q3Al703Kzb1CQUQWqo=;
	b=qc/GlVNEuXJYMUF3OPpcRScu4BF6wXtN141mm8TzSufCXLxp5tVyIeOPEmOBUjsr/ogvn/
	NdpWIUZInufOxTmcB2CxvlkZZjgMKyVhXzRWDOmaox2G1BEPBncvAN2Z/A7rZgfo/lUpOk
	3opXwPyO8SR5zJCEAMT0jSRYTXT+RnA=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,  Jan Kara
 <jack@suse.cz>,  Theodore Tso <tytso@mit.edu>,  Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>,  Derek Barbosa <debarbos@redhat.com>,
  Matthieu Baerts <matttbe@kernel.org>,  Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>,  Jason Gunthorpe <jgg@ziepe.ca>,
  users@kernel.org,  Linux Media Mailing List
 <linux-media@vger.kernel.org>,  Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
In-Reply-To: <20260715193228.758ab2be@robin> (Steven Rostedt's message of
	"Wed, 15 Jul 2026 19:32:28 -0400")
References: <20260710083845.23c753ca@foz.lan> <87wlv2jq4t.fsf@linux.dev>
	<20260713095538.3d5e86f1@foz.lan>
	<20260713094120.GD1127719@killaraus.ideasonboard.com>
	<20260713220427.582b28bf@foz.lan>
	<7ia4mrvtrxjl.fsf@castle.c.googlers.com>
	<20260715005909.GF1656185@killaraus.ideasonboard.com>
	<alcBvuIMEGSjAD1R@mit.edu>
	<20260715161111.GC1778116@killaraus.ideasonboard.com>
	<j4jhhj6rw6kgem73slctakegtoirqmngbejbabfnfwtyshdlgp@itpaup6ghuod>
	<20260715202808.GN1778116@killaraus.ideasonboard.com>
	<20260715193228.758ab2be@robin>
Date: Thu, 16 Jul 2026 00:03:34 +0000
Message-ID: <7ia4bjc7x0kp.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT

Steven Rostedt <rostedt@goodmis.org> writes:

> On Wed, 15 Jul 2026 23:28:08 +0300
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
>
>> I feel that justifying myself against generative AI hallucinations that
>> are blindly trusted by maintainers makes me feel diminished as a human.
>
> I like to read the Sashiko reviews and look for issues with it. This is
> why I *want* the email to the mailing list. It's so much easier to
> reply to the Sashiko review in an email and point out where it's just
> wrong and point out what I want the author of the patch to fix.
>
> I've been using the "copy" icon to paste the reviews in emails back to
> the author[*].
>
>> 
>> No later than yesterday a friend of mine pointed me to a mail thread
>> where sashiko referenced code that has never existed in the kernel, and
>> the maintainer blindly trusted the comment and asked the patch author to
>> fix that issue, seemingly doubling down when told the code didn't exist.
>
> This looks to me as a issue with a maintainer needing to be educated
> about AI tooling. Just like I get AI slop and need to tell people the
> AI is wrong, we need to look at maintainers to keep them from getting
> lazy and just accepting what the AI review says.
>
> -- Steve
>
> [*] Roman, the paste from the copy icon appears to remove blank lines.
>     This makes the output difficult to read as everything is bunched
>     together. I typically go through and manually add back those blank
>     lines. Is this a known issue? Can it be fixed?
>
>     Of course, if I now have Sashiko replying to the tracing mailing
>     list, I may not need to use that feature anymore.

I've created https://github.com/sashiko-dev/sashiko/issues/327 to track
this issue. I'm not sure if it's Sashiko or browser/OS's handling of the
paste buffer, but I'll take a look.

Thanks!
