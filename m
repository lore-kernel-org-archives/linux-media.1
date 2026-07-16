Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6073A3ACEF7
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 07:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784186488; cv=none; b=KQ3yzepEFtLeHsXWgbrCeKOt2rkEEUubY8iaVASNXC5DHCau6aYZbOPm8IqMqh4BJ7EHlV3bMCuPh7VjtjKRwth6/kwm5obJbl48kM8Ag2dGkdP8FKc3SehjqICcoi6eM0nfhQHiOOu5MLcFH9ARAF34Hv4yguZCWXefjIp0ABQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784186488; c=relaxed/simple;
	bh=5FBMWSGzEScMOTk87ZTvNOzxx8qNGOBVLCevz6UHjaU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DIRhSuoArsZDOHOWbyWaLkjPzxVCLdTmPNiXJ4HqQj7kO4DyhdIHs78k/A6Ob5wCWsTNLZPmZeIDBfwr8lokUSjIrFBpYFc/UNhs2XSCEMWwazm8dcb0QKuLkktObWSL10OU3Ww8VpvmUxWqN0jA9MGP+/Hw4ASM8kf8BKoEr10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=flE5AO9q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="flE5AO9q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF5CD1F000E9;
	Thu, 16 Jul 2026 07:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784186485;
	bh=2Zp/KwL3Bnw2mvz8HpIEhSyh4cPzh9navkFQ0MVAt4g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=flE5AO9qcJtUUUFAHTLmg39iuPJLRaykR4JzYW8T114usKM/y2f6jg1Dc2QK6ytVU
	 E8GUHLDZ9CrdoTSt5Ef33dasSeYa0Y2rygHCbzNU2QS86Igd3RbwwjsElsBLdTK4k5
	 2y95xGYJLsuch4U5inxUVTQ2TMyucjL2vYhcSla0mPdgiTO1LKiib0PUKAtLCtgwHQ
	 GkgM/GmEPi/7zKUjuzfSdS52u1Kb4Q/ZMXxZt0Ox4hUZOaIDpr8WxB4xfy94MgI/I+
	 xa0NFXf5MMzL5GUqF66dnhI63Ulw6q6Ex5Ntrmp4SOau9TA1SMbV8hgZeCH//LTGIE
	 LJsmSSo3sm6Zw==
Date: Thu, 16 Jul 2026 09:21:20 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jan Kara <jack@suse.cz>, Theodore Tso <tytso@mit.edu>, Roman Gushchin
 <roman.gushchin@linux.dev>, Derek Barbosa <debarbos@redhat.com>, Matthieu
 Baerts <matttbe@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, Steven
 Rostedt <rostedt@goodmis.org>, users@kernel.org, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260716092120.75c7fca7@foz.lan>
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

On Wed, 15 Jul 2026 23:28:08 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> > > Flipping the argument, should contributors be obliged to do extra work
> > > that make them feel diminished as a human ? I'm talking here about
> > > justifying themselves against LLM arguments that have not been analyzed
> > > by a maintainer first.  
> > 
> > You write here about "feeling diminished" or "justifying themselves" and
> > I'm not sure I get it. If you get a complaint from some CI running
> > checkpatch or say coverity which is bogus (or perhaps correct?), do you
> > also feel diminished or needing to justify? I just don't see how LLMs are
> > different here...  
> 
> No, I don't get the same feeling. This is due to multiple factors. One
> of them is due to the more deterministic nature of those tools. I know a
> build failure from the 0day bot is a build failure. I know what warnings
> from checkpatch can be ignored in a given subsystem. 

Not quite true: smatch is not deterministic: it depends on a database
it builds from previous runs.

	https://github.com/error27/smatch/blob/master/Documentation/smatch.rst#using-smatch

> I know that I can
> reply to some reported issues saying they're false positives and won't
> be asked for a full justification.

Just like any bot review, there's no need to justify obvious things,
but the way to make reviewers/maintainers aware of false positives is
to reply. That's how our process have been working all those years.

Thanks,
Mauro
