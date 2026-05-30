Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710883976BA
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 08:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780129810; cv=none; b=FfsUycuwjUL0313CtrV8E1r48B01/jkI09wsrXdXb47WxIecHruf48ET5abAxZXIHkhjFndmnbsFDT4CfribGNoUSxuw26d7lIKGOTv4R895w3JXx+a4TrDn/UQlRBB9Vw/V2t25k+llCYpRMlKcM4aTUlRQkHWsv6LDWqe0G1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780129810; c=relaxed/simple;
	bh=/3pLUo1hW6YedR8nRoTaCJlkplvJs3IjADIubhcEbp4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=STsFqNTJ5Vg6m1TPIRcuFxm83WirFPlhrHYqWTGpL4pvAtnmmxZVyRR3ooC5eq582Ja1X9eLzGhSxAHmEjdDNB3KfsfnjNf5gsRY4lFXecMzRciP4EFVPRuD/JgiiozMNcUx3I8hiKuibgFbIxJUUGEz1iiG21tNDOGeEXEkV7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nzbFGrL0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nzbFGrL0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 587E61F00893;
	Sat, 30 May 2026 08:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780129809;
	bh=BESCNZoSjaZLTpboEdx7c/NZJ+2TODsTplTMlnnkCV8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=nzbFGrL002328mwxia9+De7S7OQAKJSg2Ao6UMmTBCtZZr8IX9ztsdXKZvjbDI6Q7
	 sz3neL1csQSoNPHYNpKgiYOlG8XQM4IIkPx1Tj2qJVfGl/IZag7O8XZ+b1CBD7mNn2
	 nfnBMsvZyJQUKXRcfEbzZgT4WRug5qSBh1uhFSDDrw29VBoBUWdcYKesRZmYhdFZrF
	 WT1F81ToirNwmAKAyrdrDHLAs1XYeCz16ra1bYQt+gcABQ4GYdoPmfj+xaeFsxuu3B
	 frMUWiW19gExkopJxBqLeAUCSwHWRtPevDIKkbiM+K+gj0s4F9z+ogaf67nBS84yPt
	 X1yL6DHAV6Heg==
Date: Sat, 30 May 2026 10:30:04 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Derek Barbosa <debarbos@redhat.com>, Roman Gushchin
 <roman.gushchin@linux.dev>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Steven Rostedt <rostedt@goodmis.org>,
 users@kernel.org, Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260530103004.6fe2ffa7@foz.lan>
In-Reply-To: <ahmwUk0uXTkdwohf@debarbos-thinkpadt14gen5.rmtusma.csb>
References: <20260528144627.1ae09ff2@foz.lan>
	<1372F826-5513-4EB2-AE27-1DC0D2DE0AEB@linux.dev>
	<20260529083100.6710b6cd@foz.lan>
	<20260529083801.2c7e8990@foz.lan>
	<ahmwUk0uXTkdwohf@debarbos-thinkpadt14gen5.rmtusma.csb>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Derek/Konstantin/Roman,

On Fri, 29 May 2026 11:28:29 -0400
Derek Barbosa <debarbos@redhat.com> wrote:

> Hi!
> 
> > 
> > Forgot to mention, but at least on media patchwork, the best is for
> > Sashiko to send an e-mail that would allow a local script to run it. 
> > 
> > The rationale is that patchwork permissions aren't fine-grained: only
> > an user with a project maintainer token can update checks. Granting
> > such permission would allow other changes at the repository, like
> > delegating a patch, archiving it or changing its status.
> > 
> 
> Thanks for the note. It will take me a minute-or-two to get up to speed here.
> I'll reach out for any clarifying questions if that's OK :^)

I added a bot parsing tool at:
	https://github.com/mchehab/pw_tools

And ran it at the maildir with linux-media e-mails I have locally.
It is currently set to parse e-mails from:

	- LKP;
	- Sysbot;
	- Sashiko.

You can see the results at:
	https://patchwork.linuxtv.org/project/linux-media/list/

(most of the warnings there are from my parser)

And this is how it looks when a patch with bot results is opened:
	https://patchwork.linuxtv.org/project/linux-media/patch/20260529-milos-iris-v2-2-7a763d7195ae@pm.me/

I didn't set yet any daemon to keep this updated. As I used my own
token, all contexts were marked with my own ID.

There is one issue with the current process: if there aren't any
warnings on a patch, like on this example:

	https://patchwork.linuxtv.org/project/linux-media/patch/20260529154357.18066-1-mohan86108@gmail.com/

There's no way to tell if Sashiko tested such patch or not. As I
commented with Roman in a private discussion, ideally the best
would be if Sashiko could produce a single per-patch-series email
that would have something similar to this:

	Subject: Re: [PATCH v3 00/13] Improve process/maintainers output
 	Reply-to: <some_id>
 
 	Hi,
 
 	Sashiko robot found the following potencial issues:

	Patch 1/13 (<message_id): Success
	Patch 2/13 (<message_id): Success
	Patch 3/13 (<message_id): Success
	Patch 4/13 (<message_id): Success
	Patch 5/13 (<message_id): Success

 	Patch 6/13 (<message_id): Warning: https://sashiko.dev/#/patchset/...
	- [Low] The `self.field_prev` variable is assigned but never used
	...

	Patch 13/13: Success

 	Please check if those issues are pertinent.
  
 	Sashiko AI review 

E.g. it would contain success and warning status for each message
ID inside a patch series. This is also ideal for me as a maintainer,
as I can clearly see the low/mid/high issues detected by sashiko
on a single e-mail.

Thanks,
Mauro
