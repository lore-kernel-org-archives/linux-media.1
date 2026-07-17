Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71863DCDA3
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 12:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784290875; cv=none; b=b+v5soTimGS8pQNSAlrUktvLheeN7xtX2GjvvX8I08J3d/OflPbCWLPPNMXV+IP6TVayLgp9sEgd0q5itOIKI63nhkpRsv2SD02nWH+JcPl+qOI8vW8VTaGaMr3Wzy3sgqr6TZX9ulCbG5E3IzhZiefAHYiLEisLiF4Lt7cf15g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784290875; c=relaxed/simple;
	bh=aBRYhELff08ys9h4cuD5q2Kft8muOBSKwvu40KFURZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EsGwiHRC9M80vAU4OQAX5vupKGrkBGb5WG5/P2tgB3TfIjJXU3f5lq01I7l/uQVGT3R6/wusObHrTQ/AdBnX7c16iF+H/H56J4MZBk7ktJbidqhnZqfWf1M8Yfw2lxWT4epaljwEclIMM721QLabuhJGuvF7TOTgIwhwKfXdBfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=gblbfg9x; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="gblbfg9x"
Received: from macsyma.thunk.org ([151.240.45.25])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 66HCKmid022457
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 08:20:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1784290853; bh=0vYmu9fT3YPaVNsvyA1jpwIKI/N7Ej0isCAHikoD9qo=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=gblbfg9xESiWYF3USUZprOdQwnTYgr47GMuoyazdgU33I26i0IgeASOSPoLZY1Q7D
	 6f9viosQg1Y0fdxjqy5dPzeFL+63sE3ZUd/QzZNRFlpqTcdjxUAz4U3D8qG8fYAbZw
	 TMlKFLfRC/eIhFc5iogLQffItNu2zlplN2CNWiVWBpzhUbz6yyJPlVL8hVhpbY4W94
	 epEBmZteYy8ZV8RXNnmH3Xn94mTRi1xeBbxUnYov3SZRFDHBmWlzyQzbFf9MBZ8fxy
	 KAmImIo6717SPh2dlc8gbqZMFkk045Pm4VKqt+xtZAu42DGx6/ESC0SHHfmep5XpuU
	 2uvnGeWeqWuMQ==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 2B82DA6536B; Fri, 17 Jul 2026 08:20:48 -0400 (EDT)
Date: Fri, 17 Jul 2026 08:20:48 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Derek Barbosa <debarbos@redhat.com>,
        Matthieu Baerts <matttbe@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Jason Gunthorpe <jgg@ziepe.ca>, Steven Rostedt <rostedt@goodmis.org>,
        users@kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <aloZ9hqSgzN3beqH@mit.edu>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
 <alc3gAJfAkG5DULJ@zed>
 <alfBvhZkAelq5RVf@mit.edu>
 <aliMsSH373RJ31Mq@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aliMsSH373RJ31Mq@zed>

On Thu, Jul 16, 2026 at 10:07:03AM -0500, Jacopo Mondi wrote:
> I got fooled by a Sashiko reported issue on patch for a driver I
> maintain. I asked the developer to address it, he did so in a separate
> patch, people got involved, lost quite some time on it, it ended up
> being a false positive.

Thanks, I think I see why the Media subsystem has such a huge
difference in their experience of Sashiko.  With the media subsystem,
you have to support drivers and the driver maintainers don't
necessarily have as much deep experience with the core media
infrastructure / framework.  Hence, you didn't immediately realize
that something which was a false positive.  I'm going to guess that
you have three levels of expertise; (a) the patch authors, some of
whom might have very little experience with the kernel, since their
last project might have been developing the firmware for the card, (b)
the driver maintainers, who know that driver very well, but might not
have deep expertise the core media subsystems, and (c) the core media
infrastructure developers / maintainers, who *do* know what is and
isn't fair.

I think the other difference is that in the media subsystem, you can
rely on the userspace code being "nice" (so you don't need to worry
about certain races or cleanup bugs, because a well-behaved upper
layers of the stack would *never* abuse the kernel system call in that
way).  With file systems, we can *count* on syzbot abusing the system
call interface and filing bugs which they will report to management as
security bugs even though no sane userspace would ever do something
like that.  So we get things which we could call false positives all
the *time* from syzbot, and arguably, if this can be used to crash the
kernel, perhaps it's fair to call it a security issue.  After all, can
you guarantee that only well-behaved media frameworks will be calling
the media subsystem's kernel interfaces?

The combination of these two means that we've already hardened against
many of the cases where userspace does something "unusual", and we are
inured to ignoring many of the syzbot's "false positives" (After all,
if it requires root to trigger an oops, is it really a security issue?
It might be a quality of implementation issue, but if it's a
pre-existing issue, we've been getting complaints from syzbot for
years.)

And then because we don't have to deal with drivers, if we get someone
who is relatively inexperienced trying to fix a syzbot bug, the result
is almost always a complete disaster (especially since good luck
trying to get new contributors to run the regression tests) having the
Sashiko review point out the obvious bugs is a huge time server.
Furthermore, since we don't have the layer of driver maintainers, if
we get a false positive from Sashiko, we don't have trouble
recognizing them, and the main cost to us is telling the patch author
not to fix unrelated problems in a single commit --- and so to either
fix the Sashiko complaint in a separate commit, or to save it for a
later patch series.

This has also helped us because it sometimes gives a newer contributor
another opportunity to work on the subsystem, and we just have to make
sure to warn off a contributor that a particular issue proposed by
Sashiko mgiht be beyond that new contributor's experience.  But I've
seen a few cases where the new contributor has found Sashiko reviews
to be quite engaging.

Cheers,

						- Ted
