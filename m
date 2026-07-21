Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EEB3A8739
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 16:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784649687; cv=none; b=WGS7LFmzM221pKu22MQEcmVY8MAO38NxIiIS3BOKsBer2n5Q+aXSGdpPYAwrbvXpesiD7ITl1ll22NTOOHvs485pagRWkB+4auFRa0zlLuqWhi7K4+dEYkJfaS6NF/3jxVZjQkgpwFE7yUnhPLfgyXB7qASVWOvl/uYCItPmb/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784649687; c=relaxed/simple;
	bh=p2095GeETXwIPyvAEZiGOmBox0Lv9HoJS5lmrstXWR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RIXPi38wNUMrh2WhQbOiXnQv0g+7ud0wQ3agkwYm4nGyLpJ7lCeuc7PMHh4O+pmIIAtdJVAzM7lSwKzBxplRy7h8ZyvM+7k71nn7MPXMSfv6MxkVs/MDwLzV+8KfgDTAu45pnWLKZTP7+O3EfuJKd9SHSxuzO8s1DQvEFfhPHRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EfDwY/Re; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EfDwY/Re"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 71E89C1;
	Tue, 21 Jul 2026 18:00:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784649623;
	bh=p2095GeETXwIPyvAEZiGOmBox0Lv9HoJS5lmrstXWR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EfDwY/Rew0abUvwDC+I/TbCa4yy6fGUArYV8/5yWeKqzO9m8nI3oqOeX/kh/17q4X
	 TZLSQNq8Eze1/08pWIp0AtX2Y1VJIAfI/yLxJonaTqFFG3MefUKH//tSs2+mF2ZKc/
	 dQRgOKDcc+IEdePY+qEa9hMo58EdBUKHniRyEEFA=
Date: Tue, 21 Jul 2026 19:01:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Jan Kara <jack@suse.cz>, Theodore Tso <tytso@mit.edu>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Derek Barbosa <debarbos@redhat.com>,
	Matthieu Baerts <matttbe@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, users@kernel.org,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260721160121.GC536385@killaraus.ideasonboard.com>
References: <20260713095538.3d5e86f1@foz.lan>
 <20260713094120.GD1127719@killaraus.ideasonboard.com>
 <20260713220427.582b28bf@foz.lan>
 <7ia4mrvtrxjl.fsf@castle.c.googlers.com>
 <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <alcBvuIMEGSjAD1R@mit.edu>
 <20260715161111.GC1778116@killaraus.ideasonboard.com>
 <j4jhhj6rw6kgem73slctakegtoirqmngbejbabfnfwtyshdlgp@itpaup6ghuod>
 <20260715202808.GN1778116@killaraus.ideasonboard.com>
 <20260715193228.758ab2be@robin>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260715193228.758ab2be@robin>

On Wed, Jul 15, 2026 at 07:32:28PM -0400, Steven Rostedt wrote:
> On Wed, 15 Jul 2026 23:28:08 +0300 Laurent Pinchart wrote:
> 
> > I feel that justifying myself against generative AI hallucinations that
> > are blindly trusted by maintainers makes me feel diminished as a human.
> 
> I like to read the Sashiko reviews and look for issues with it. This is
> why I *want* the email to the mailing list. It's so much easier to
> reply to the Sashiko review in an email and point out where it's just
> wrong and point out what I want the author of the patch to fix.
> 
> I've been using the "copy" icon to paste the reviews in emails back to
> the author[*].
> 
> > No later than yesterday a friend of mine pointed me to a mail thread
> > where sashiko referenced code that has never existed in the kernel, and
> > the maintainer blindly trusted the comment and asked the patch author to
> > fix that issue, seemingly doubling down when told the code didn't exist.
> 
> This looks to me as a issue with a maintainer needing to be educated
> about AI tooling. Just like I get AI slop and need to tell people the
> AI is wrong, we need to look at maintainers to keep them from getting
> lazy and just accepting what the AI review says.

Putting the responsibility of proving that the issue is real on the
maintainers (or other reviewers in the subsystem who would be happy to
have that role) would solve this.

> [*] Roman, the paste from the copy icon appears to remove blank lines.
>     This makes the output difficult to read as everything is bunched
>     together. I typically go through and manually add back those blank
>     lines. Is this a known issue? Can it be fixed?
> 
>     Of course, if I now have Sashiko replying to the tracing mailing
>     list, I may not need to use that feature anymore.
> 

-- 
Regards,

Laurent Pinchart
