Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114863AD51C
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 16:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134259; cv=none; b=H+hkrH8Ex+lqwLedIdug0NAKhg8d6Oi6IhPIO6cpU+Ka/qhUioMU/r/1SoKDlfQ5RdFA0Lhi48esPjlBZiRrZhAyr0UUg2y4B6VlSEnnaydLVDG1JllC883/bvi+rirzGvNfXGhxu5pDkBFva+oHyovSMnt+P27KPB3Puj19u3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134259; c=relaxed/simple;
	bh=MjFVrrN1hV+jMhbwwKtPWBuBBV05pDw5Z3VlvttnZoU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Crh8MkplThjJw8aNZz2Ci19jC53jwV+51Om63u5rqS9Vq5LLZHQGCgyICspmPku961Mu+TAjDDPavTExslfZPIrCVBHGyKyWM6qBJpQAUktH7IWDZLk0HeWbJKZwgtHm+5LbEzXE8VpqPZyejxyuFE0VRElUlcfkIj9JAF2wdV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf14.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id EBD5212021F;
	Wed, 15 Jul 2026 16:50:55 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf14.hostedemail.com (Postfix) with ESMTPA id 8D0E930;
	Wed, 15 Jul 2026 16:50:53 +0000 (UTC)
Date: Wed, 15 Jul 2026 12:50:58 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jori Koolstra <jkoolstra@xs4all.nl>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, Roman Gushchin
 <roman.gushchin@linux.dev>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Derek Barbosa <debarbos@redhat.com>, Matthieu
 Baerts <matttbe@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 users@kernel.org, Linux Media Mailing List <linux-media@vger.kernel.org>,
 Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260715125058.3692aa03@gandalf.local.home>
In-Reply-To: <aldx9KiAHM4CRI0m@lt-jori.localdomain>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
	<4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
	<CAHk-=wi4zC+Ze8e+p3tMv8TtG_80KzsZ1syL9anBtmEh5Z40vg@mail.gmail.com>
	<aldx9KiAHM4CRI0m@lt-jori.localdomain>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 8D0E930
X-Stat-Signature: 7m39s8fr33aw6eigor75fezrzcwohpyf
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/+krG+ox4tk2imRdoT0OXaWf0vCN83Gx0=
X-HE-Tag: 1784134253-694296
X-HE-Meta: U2FsdGVkX19cLACkGfD66pXtitMNVwRej5nXXoVEccRJnrAyMWXe1GrTPjvYeV1IQto3QX3PWAkPXmPlvLYzN+uJaaR2dO1y5ihNHihV6q/h2NlIcZaWTzNhfMAX206ijFtdxo1ykXe/gHkhXqsPS7GP8LMSdHeQak8vRx5QlEAewLqdjhRzeXHYAzD1ZHEjWLArF+DCIpylZWWds+qQA4sQBv8GoHlF1RyaxHy4U5iSAvV9vBL8CP5ZNWONyvRA5DScm1kyOshoRfG9QK1RFOpfNiZ0C1ZIQkAV+Lc2wJT6X2B2bCtwE9hoScEmPOi1gF4/+VNxWV6ugo0u894VdMludQSsXC0D

On Wed, 15 Jul 2026 14:21:48 +0200
Jori Koolstra <jkoolstra@xs4all.nl> wrote:

> While there is some truly ridiculous anti-LLM brigading in some open
> source projects, I feel like saying it is just another tool does not do
> justice to some of the harm that is done by that industry. Also,
> precisely because of the usefulness of LLMs, I worry about creating an
> uneven playing field, where new contributors can't keep up if they can't
> afford the needed tools (something that is not as much the case with
> compilers.)
> 
> These are not arguments that others should not use LLMs, and I find LLMs
> to be tremendously useful for reviewing code and understanding context.
> But maybe the community could think about these concerns at the same
> time, even if its not the main focus. Maybe it is a good side topic for
> the Maintainter summit? (or perhaps it is not process-related enough.)

But this is about receiving reviews of patches you send. Really, this is no
different than kernel test robot. At least all critical errors that Sashiko
finds should be sent as a reply, just like anyone else that reviews a patch.

In my experience, the noise has been less than the signal. And the noise is
usually special cases that even a human would likely miss.

-- Steve
