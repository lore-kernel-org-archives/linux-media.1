Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED4A37E5C7
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 07:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784185448; cv=none; b=E7j1SxHfp6ZE9p1uVnSr6r0EwK6ZO1O+71ycchypsClPXXYSrjvXrsFn7zgLeGkW9HzfL/xgUQu6aVieTWB0Muqdcvhz94Xo0i7Tc8WABzaX9MTpZ8fmJxKt7ekY2KkJlrljCSrXSMPOwQ+xJmPRBVXLpJrICVpxJl3u4MGGvos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784185448; c=relaxed/simple;
	bh=ZqtGDSG2+sSkJRL7t2TMVuSvNKeGhndKzz9B/tTbPqU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=foVlPuMXXxCcnB/d40N4l78dqe4af6w46r3sh7afW62GnFxKQhnGMrERm91j+nV3ra4zSs/z92j61oZ+rdSg8+ZBJg3gy0suISRo/jdF0i1C+2jQx8sHT6PhB3az1yxnXlZUyoiYPtQRlMlRywWyio5Wai5mvCcOMKWnR9/ArJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iGuK8Pol; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iGuK8Pol"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F8951F000E9;
	Thu, 16 Jul 2026 07:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784185447;
	bh=npvfM50PMHcMkc39uTq87aDM5NyX/ukEn9mcXUjGrPY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=iGuK8Pol1ENHcX0cfLrYkPi76hXibDHEukqISohXALGXlgcBu39RYes19sYyMJATD
	 d8Od0OPEayBFccC27Zqb5pTTkKDNue4Ep6GfSwFSMCCfWede6sYWAnALRojVqL3TXo
	 6ASS6FGqlutmNeToeAvZ5c3uv30I80mLAGmQ5UR8iMckyO0I09SBVZJcl3It5sF04n
	 2lYVHfZ7d/6uXjfUna9I2vj2cArZxRDKX+U2lxrd+sIZmksT2Rk/cNcFF1fc0ZmpGt
	 b/hj9FYHHOp5prFN2tONrC68r8hh6aMPiZ+ujLxyEgBWacAIqiNO3b11wPRsFOXCZs
	 E/2Cjmk8IvFdw==
Date: Thu, 16 Jul 2026 09:04:01 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jan Kara 
 <jack@suse.cz>, Theodore Tso <tytso@mit.edu>, Roman Gushchin
 <roman.gushchin@linux.dev>, Derek Barbosa <debarbos@redhat.com>, Matthieu
 Baerts <matttbe@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, Steven
 Rostedt <rostedt@goodmis.org>, users@kernel.org, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260716090401.193720d2@foz.lan>
In-Reply-To: <7b8e735092ecd25c61e79d8291b2edf5e54dfb15.camel@HansenPartnership.com>
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
	<7b8e735092ecd25c61e79d8291b2edf5e54dfb15.camel@HansenPartnership.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 15 Jul 2026 16:36:42 -0400
James Bottomley <James.Bottomley@HansenPartnership.com> wrote:

> On Wed, 2026-07-15 at 23:28 +0300, Laurent Pinchart wrote:
> [...]
> > No later than yesterday a friend of mine pointed me to a mail thread
> > where sashiko referenced code that has never existed in the kernel,
> > and the maintainer blindly trusted the comment and asked the patch
> > author to fix that issue, seemingly doubling down when told the code
> > didn't exist.  

I saw the same more than once in the past where humans did about the same
by assuming a previous implementation of some code.

> We can definitely do maintainer education if you point me (or the TAB)
> at the thread.  Sashiko as a tool can absolutely get things wrong so,
> as maintainers, we do need to accept a reasoned answer that shows the
> review is wrong.

As already pointed on this thread, the author is the one that has more
time to dedicate to his proposed changes. A simply reply to a Sashiko's
email telling that the referenced code there was an hallucination would
be enough for maintainers to ignore such particular issue. 

Thanks,
Mauro
