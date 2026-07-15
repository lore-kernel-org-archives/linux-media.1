Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF793B0ACD
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 17:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784136687; cv=none; b=itE4/igzvERwBhel6up0bqE7mD8U7BfV+DaqIxFvbqrKv43Jehj++OwjhfaGXGsbhPhWty857WilTZnMxTGanauqx+bGsRB/zc5+2xVLqwQwIf4ilzPBg27v5cxMtD5XF1IjSpSWlDIgHtI7NdMg+YItzKZUI7zb4Yr14BcdhCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784136687; c=relaxed/simple;
	bh=6meeYdmCgdTHX7X3S358U2yiiJC/++sbxSx8h8Vqqfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AjxH/Sbd06wAPbTLSKoXzPKhCUcJTEaYCkYSQCp99shuCDj/nPqXN0Mf9/jnL9W3RuOtUadlTSF60eynOJKIHTUzwDNCHW2lLbketEC0KQa/Qr/LbOQkpa3apGtrq7CY3NnPO+amHSJum6a45eh+G4TL/MXdXmaMVyt1mL659II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=AjByWrbC; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="AjByWrbC"
Received: from macsyma.thunk.org ([151.240.45.27])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 66FHV1Iq032122
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 13:31:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1784136670; bh=W5xg98Db6keVKh5RY1acYpY4A9glKmN9ONSgd5mdPDc=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=AjByWrbCw3SyUNcaatcncbvnq1+UI7AZHUknDOp+GCukABdEwoKVEJWB95twdqxuh
	 crp96gTF/RHfRKXuFx85TMmT0ZyVJOTV3Dt+pxS0Ix8dREPyhmUcQNLgxEuemQe7uA
	 +1QmNUhMvhiLfNZ3AM6iNqV9dWQ8kjUi2ZFFyrZc0UKTwoVKbhkJRFRrUwQvGwetDG
	 ppSYdgKUF25R+Y+6pmMQDWWp3ErSW+Fz+lrWnqmqcVKgZ9o+OKYN5tdXIohLoeHjyx
	 e4XIqAaxXm1tbZjjf+v1+bKb0lqE+jFyzYioHyiY7oZFEKxXDVzrN4dxStP5UV1IJg
	 1ma9/N85ZRdng==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 0EB1EA2F5F6; Wed, 15 Jul 2026 13:31:01 -0400 (EDT)
Date: Wed, 15 Jul 2026 13:31:00 -0400
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
Message-ID: <alfBvhZkAelq5RVf@mit.edu>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
 <alc3gAJfAkG5DULJ@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alc3gAJfAkG5DULJ@zed>

On Wed, Jul 15, 2026 at 09:59:57AM -0500, Jacopo Mondi wrote:
> Far-fetched review comments, very convincing word salads mixed with
> valuable findings have often been escalated by authors to maintainers
> to have them distil the good from the bad.

That hasn't been my experience with ext4.  As far as signal to noise,
the main issue is one where pre-existing issues are flagged in
multiple patches in the patch series.  However, (a) Romain knows about
this, and a fix is in the works, and (b) it's flagged as a
pre-existing issue --- and we tell newcomers that they are free to
disgard pre-existing issues, but if they do want to fix it, in most
cases do it as a separate patch (or in a separate patch series) and to
avoid folding it into the current patch --- especially if the fix is
non-trivial.

> All discussions around AI inevitably ends being about principles and
> good vs bad. I'm surprised Linus and Ted had to weight in to re-state
> the "we're not against AI!" principle while I would like to discuss
> signal-to-noise metrics instead.

If it makes sense for a subsystem to move reviews to a separate list,
by all means, that should be up to the subsystem maintainers.  There
has been quite a lot of discussion about how we should accomodate
people who object to AI by dumping more work on maintainers, and
that's the part that I object to.

One of the things that really excites me about Shashiko is that it
reduces my workload.  Whereas the false positives from Syxbot and
oss-fuzz have caused me more work, not less, and has had significantly
more noise than Shahiko.  (I've started outright ignoring oss-fuzz
reports as a result, and the "respond within NN days or we will make
our report public" has caused me to respond, "and this will say more
bad things about oss-fuzz than my software"....)

Cheers,

							- Ted
