Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5534B2139C9
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 05:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784696902; cv=none; b=t5p7gmb7v2yw/aJ03GhQNg95iUROkNL/w6HWbEUedaItiibEX9OBoZo8qHUD2/0ApTXk6Srmp/Onn+wSMEf8gGxyvoZXb4iOx9zE/T1eIjf4CvPRx7gkBnNoJquBPQy2z84V01wtz9sWEj9lAAV2W1fdyC/NisomZ2jaJUAe1zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784696902; c=relaxed/simple;
	bh=H0epFU6j8qeKXiHDlxDEEk3BFdsDo5te7I4FrjRGv3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oaBtCscYeicauVk+mvBFuPhXcCiREL2QHL7pnCHaCiErU33dhOsWDkOSaQ4VASKp12nfqphYWR/HxrUvOuZdFuFTlp3o8P3vT7FYTMkFEHqAdj+2NOXZK59Mja7ZFDYX/F8EtzIPpXghaoMAC2SRMlIbZa+9OpNs3AbVBaz1S3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=Gwa/w3fG; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="Gwa/w3fG"
Received: from macsyma.thunk.org (pool-108-49-65-18.bstnma.fios.verizon.net [108.49.65.18])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 66M57mpe005275
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 01:07:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1784696872; bh=FOPYY2DqCaisT4DVX8Tlcf9mdl8LeryErN6fEgAZDbI=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=Gwa/w3fGJZIJ77MuUo82nUVkxxQA5pLjGh4p0ozdZHd0HGv1UlRJY6t00/HFq0S4+
	 5Q88HnDTl1ABnjsH18oJSrJY+o6U8Z64KZ9piXS/mAwUh37pm68vanz306XoVRgUsn
	 I0UPC4pEOV3RdZeQ3XRbLCKrs+BL4+yVQnbJbPQzJaIF99ZliIyhwHhzW/q+hH5m9Q
	 +OPpTIDL2YrQnbpd09TfHB12NFYjXZfBg5ywYOi6LNXfjejqSDCO8atMeNINZt76ju
	 sTTKzviAJ32kg8Larir4XV6C8GYlU7Fg8hO1Me/HEI3HNXgK1Th1yyoHyWgpQjfKKm
	 S5cUprlYK/vOQ==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 0F68DB9BBBF; Wed, 22 Jul 2026 01:06:48 -0400 (EDT)
Date: Wed, 22 Jul 2026 01:06:47 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Derek Barbosa <debarbos@redhat.com>,
        Matthieu Baerts <matttbe@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Jason Gunthorpe <jgg@ziepe.ca>, users@kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <amBH3uJCxtHJ1cQ-@mit.edu>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
 <20260715162816.GF1778116@killaraus.ideasonboard.com>
 <7ia47bmw0xls.fsf@castle.c.googlers.com>
 <20260721182509.GG536385@killaraus.ideasonboard.com>
 <20260721152501.0ff97e8c@gandalf.local.home>
 <20260721224642.GI536385@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721224642.GI536385@killaraus.ideasonboard.com>

On Wed, Jul 22, 2026 at 01:46:42AM -0500, Laurent Pinchart wrote:
> > It really sounds like you want companies to move effort from AI into the
> > Linux kernel hardening. If Google did that, all it would do is move Roman
> > from working on Sashiko to working on hardening the kernel. I think Roman
> > is doing a hell of a lot more for the Linux kernel by staying with Sashiko!
> 
> As you said, it's not mutually exclusive. I'm sure Google has other
> kernel developers than Roman.

Google has contributed to various kernel hardening efforts; consider
the work of Kees Cook and Jann Horn.  And while I have my differences
with syzbot and oss-fuzz team, those are also security-related
projects that have helped improve the open source ecosystem.

And earlier this year, the number of companies including Anthropic,
Amazon Web Services (AWS), GitHub, Google, Google DeepMind, Microsoft,
and OpenAI contributed a total of $12.5 million dollars to the Open
Source Security Foundation[1].

[1] https://openssf.org/blog/2026/03/17/leading-tech-coalition-invests-12-5-million-through-openssf-and-alpha-omega-to-strengthen-open-source-security/

Could all of these companies contributed more?  Perhaps, especially
given how much the entire Tech Industry has invested in building new
Data Center.  But it's always been part of the Open Source model that
companies are free to choose how much an in what areas they will
contribute dollars or engineer time.  In practice, the "Stone Soup"
has worked pretty well over the past few decades, even if we wished
that Facebook had invested more of their profits from their Social
Media empire to Linux development; or Amazon or Microsoft investing
more of their profits for their varius lines of business towards Free
and Open Source projects; or if Netflix had contributed more of
Brendan Gregg's time towards improving tooling around BPF.

Personally, I'm much happier being grateful for the amount of time and
effort we've gotten from Brendan Gregg, or Omar Sandoval on drgn, as
opposed to stamping my feet and asking, "why didn't they and their
company contribute *more*"?

Cheers,

					- Ted



