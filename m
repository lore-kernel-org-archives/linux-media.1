Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C34D3B4E84
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 20:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784148163; cv=none; b=bI+NRMsNy5QWS3Vj5Qf9sPXbn2k8B86yBTWXveQg0a9rABTb6Q0MixwDJOljVNxuPDVOxO1zrj2BLF4vrUi50JcGGoBLFR6maoQ+8VAJu0QbcIMzkP1cMByLYn23zQRGaEAH8jnUz74ZkIuU4kIBRGAF8SdjERHknuWXm7xuiIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784148163; c=relaxed/simple;
	bh=MhRUA8Dhc5eCKsio0wtep5orAJD3ikr5a6Zz8I1GTt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MBnRNbOzXLAOA1he4LhP45AP2mPM7n7SAsmXW+dy8+qiRxanLuNFD/mI+aATNLG6Fxib96l1GlWR/2byit/Rwm9pnvlAecg/ju5xavvAjDUBhaZ/FQEnraj+5Bv5o+3kX9bUY4mEGbtLl1G0LCvO/IoQxACSOcEp0gzPswXac/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bkACpKwj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bkACpKwj"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E78A7267;
	Wed, 15 Jul 2026 22:41:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784148105;
	bh=MhRUA8Dhc5eCKsio0wtep5orAJD3ikr5a6Zz8I1GTt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bkACpKwjx+bUO8k00g/S6siIsg1PLUhNAZvOmbRyK5CYWeJTFN8HeeFmDG53YjL9g
	 IbKXAE0tEpLqO0MkZAJrcjf4g1xelk4X2e4IzvDqvqVAa6P5lQAS5UFPREgxgEtb1I
	 xIEWPJ4K4yWxbV9swZPWLNtkjBL20v9mmW3v/5rY=
Date: Wed, 15 Jul 2026 23:42:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Jan Kara <jack@suse.cz>, Theodore Tso <tytso@mit.edu>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Derek Barbosa <debarbos@redhat.com>,
	Matthieu Baerts <matttbe@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Steven Rostedt <rostedt@goodmis.org>, users@kernel.org,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260715204238.GP1778116@killaraus.ideasonboard.com>
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
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7b8e735092ecd25c61e79d8291b2edf5e54dfb15.camel@HansenPartnership.com>

On Wed, Jul 15, 2026 at 04:36:42PM -0400, James Bottomley wrote:
> On Wed, 2026-07-15 at 23:28 +0300, Laurent Pinchart wrote:
> [...]
> > No later than yesterday a friend of mine pointed me to a mail thread
> > where sashiko referenced code that has never existed in the kernel,
> > and the maintainer blindly trusted the comment and asked the patch
> > author to fix that issue, seemingly doubling down when told the code
> > didn't exist.
> 
> We can definitely do maintainer education if you point me (or the TAB)
> at the thread.  Sashiko as a tool can absolutely get things wrong so,
> as maintainers, we do need to accept a reasoned answer that shows the
> review is wrong.

I've shared this with the person who reported the issue to me, as I
don't know if they're comfortable discussing it publicly.

-- 
Regards,

Laurent Pinchart
