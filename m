Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298BB2BE02C
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 20:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783973073; cv=none; b=FphFWIkbha5sV1pxWKsX32m8+2jIYQG8ee2+58N9LVUTgUYQUMTKmQU7K7ueZIGcxurh2KnMG1IB4UXxQ72x/WYtaLzqOR2Z392OPavfPcqpoIfG5Yo3kmmJ79FjRQB3VsyufVX4HqRSzR/EazN1uWwHdFc9jzFrcCiken5hfwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783973073; c=relaxed/simple;
	bh=hbmOaxcT/NGJNYytXBXkQ6HYwXSmOBAnXgazr5ua0kE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MVEPOhOXEZ5kF5M/NPgMAHG6SJaKva+x1zP/W5KoGx2H/LLfBlHVCABUWhwpm3JwcrydcNRAbbWtC2FwmPCrkvabzVZNX49aRfBrkoBKgjrK+BHVChvgKIaQU8urT+R+UtL176fXzZG+X9laNj8vRSQK1CnWMPNcfMImfCdYAdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QLJUjkfg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QLJUjkfg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B79F31F000E9;
	Mon, 13 Jul 2026 20:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783973071;
	bh=6YOGf/5UTtZ5Wz1VL2PKWCMo5vPIxp5h+sJXQerPBIo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=QLJUjkfg7dOb+Mh21L90cLYK7iOFm/G33nKfzeUDJ7N+UjhdQejHHC+qiryEI7sjv
	 n4Dc52noSFNng9+AX0+B9xwqB7pa6LAOtcW38HrvZ+6eFGr9KBUF+uZjGt3atmmy04
	 u2RcuLlFXctWlHMP1sUJzQbZuq1T+UywtGqsPzvFIxx2bqFNLhiQASPR1vQ/xZoeqY
	 cqNkyMto+k4Tq9DrMJs8e0pZbnuLkYYLZNitgCaQoXAnmAEkSQeE2kRBhVmImxByBp
	 Po96D+7QDK0Rjuq+1R6dhU1vLWxKOQ2CYYLsE6TuubqRn93gOJaCKySaMN84drfcjN
	 ez7AkUJGrg4NA==
Date: Mon, 13 Jul 2026 22:04:27 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Derek Barbosa
 <debarbos@redhat.com>, Matthieu Baerts <matttbe@kernel.org>, Konstantin
 Ryabitsev <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Steven Rostedt <rostedt@goodmis.org>, users@kernel.org, Linux Media Mailing
 List <linux-media@vger.kernel.org>, Stephen Finucane
 <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260713220427.582b28bf@foz.lan>
In-Reply-To: <20260713094120.GD1127719@killaraus.ideasonboard.com>
References: <7ia4tsrkn1k4.fsf@castle.c.googlers.com>
	<20260602223936.27def657@foz.lan>
	<b9f7ca3a-fa72-4a8e-94bd-9991a0882f10@kernel.org>
	<20260604085201.177ad537@foz.lan>
	<20260607195656.02788791@foz.lan>
	<akQlPSNfGEllNVhe@debarbos-thinkpadt14gen5.rmtusma.csb>
	<20260710074528.5a6e4457@foz.lan>
	<20260710083845.23c753ca@foz.lan>
	<87wlv2jq4t.fsf@linux.dev>
	<20260713095538.3d5e86f1@foz.lan>
	<20260713094120.GD1127719@killaraus.ideasonboard.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 13 Jul 2026 12:41:20 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> > > Individuals can set their
> > > spam filters up if they don't want to get these emails, I can't control
> > > it. Providing individual authors an option "I don't want my patches
> > > to be reviewed" sound strange to me. It's like "I don't want my patches
> > > to be tested by unit tests".  
> > 
> > I agree with you, and, on my head, not sending e-mails to the author
> > is a clear violation to one of the most basic net etiquette rule on
> > mailing lists: any replies to posts there should reach the author.  
> 
> I don't know where that one comes from.
> 
> What happened to this other "most basic rule" that subscription to
> services that deliver e-mails should be opt-in ?

Replying to an e-mail is not subscribing to a service. It is the
author's right to know if one replies publicly to his e-mails.
Explicitly removing him from the C/C of such replies is a violation
of his rights. 

On other words, it is implicit that, if you post an e-mail, you'll be
expecting actions or answers to it.

Now, if one really doesn't really want to receive e-mails from a
particular sender, a block list solves it. Alternatively, a way to
opt-out is welcomed.

See, this is different than adding someone to a mailing list without
his consent: On such case, people receive e-mails unrelated to their 
preferences. For those, opt-in is the right net etiquette.

Thanks,
Mauro
