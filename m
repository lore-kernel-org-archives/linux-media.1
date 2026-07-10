Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E90935C1BC
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 05:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783662335; cv=none; b=b05iO54qDwcBg9VZTCe8H5j7IjXTc5ApKiGduoKEnMvNZ4IEGUjzHvgHD2XcvDXSxb5cmGZvRjRU8ZK5Vuezf1ckyjerikwK/4ER1rcbfjpdrXNml1SGYYzSAW78zb0FFshiNSUu9AFac9KYZ4LjkSYKOzdykmCpu17S30MR8q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783662335; c=relaxed/simple;
	bh=9PJx/GQ+EYK6dMYmA412A/ZgydczbeJbMo5qt+C/8V4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nTY23S3Ouo7A4TGI1MWWp6wdMTMI+uHzD0pjMYze0oa2ChSZDkijE0MCch3vKVTlvQcOg8sKOHeAsGYK5PmX8dyz14xwTdJ29x8KavHl7kA1U+G+hOvgTRsCA4YoimMTaeJe0/zd/P4R6TsSxpremUKvIpta7SIarFZa8q2GP70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9Snq7S8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9Snq7S8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9FC51F000E9;
	Fri, 10 Jul 2026 05:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783662333;
	bh=ZFZovzUwWmSr15ggKm4s6z3keCopFjJ5ooEq7ISUyKo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=M9Snq7S83F6TClO6yqQyGRXSnfBjtzzSqMhTeHfa/KPbHsSfGBVlhc+a2td198zOC
	 KeCjJA7mci1OuySh/y84DKEy3C3zYw74MH0qbFNZwaTsSXVK9YhLFsvNbjT7KT6/2Z
	 YnBA5tG1hnRtwz0sHmucGknSFF8iirPAuq8DfX1/+tOhmyPFtuva8NQ0g56rNvptFJ
	 VtaQuJWdmZ30sru2Xn4S6jqONuP3kXetwAoi07vsLLqY1HB5/JBgM9DYXGGIevo5V5
	 6HKvSGqdsD+CNKFnQznr21yYSl2hsIbDYUpCr+VuPwwOFPdBt57Pc97ar6POiJiCoT
	 hh/z6xsUmJoTQ==
Date: Fri, 10 Jul 2026 07:45:28 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Derek Barbosa <debarbos@redhat.com>
Cc: Matthieu Baerts <matttbe@kernel.org>, Roman Gushchin
 <roman.gushchin@linux.dev>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, Steven
 Rostedt <rostedt@goodmis.org>, users@kernel.org, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260710074528.5a6e4457@foz.lan>
In-Reply-To: <akQlPSNfGEllNVhe@debarbos-thinkpadt14gen5.rmtusma.csb>
References: <7E971C76-0568-43EF-9EE7-C8DB78C45CA1@linux.dev>
	<20260530200017.0fe7f685@foz.lan>
	<20260530204945.22ac92c6@foz.lan>
	<20260530205351.19847fc8@foz.lan>
	<ah7dpsLKd0Jf1Ir0@debarbos-thinkpadt14gen5.rmtusma.csb>
	<7ia4tsrkn1k4.fsf@castle.c.googlers.com>
	<20260602223936.27def657@foz.lan>
	<b9f7ca3a-fa72-4a8e-94bd-9991a0882f10@kernel.org>
	<20260604085201.177ad537@foz.lan>
	<20260607195656.02788791@foz.lan>
	<akQlPSNfGEllNVhe@debarbos-thinkpadt14gen5.rmtusma.csb>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Derek,

On Tue, 30 Jun 2026 16:32:30 -0400
Derek Barbosa <debarbos@redhat.com> wrote:

> On Sun, Jun 07, 2026 at 07:56:56PM +0200, Mauro Carvalho Chehab wrote:
> > Added both global and per-project permissions to add CI checks:
> > 
> > 	https://github.com/getpatchwork/patchwork/pull/653
> > 
> > Tested on a docker container created on the top of current
> > upstream, with the database imported from linuxtv.org and
> > migrated to the new permissions model.  
> 
> Hi Mauro,
> 
> Patchwork integration has been cleaned up and the original issues filed against
> the Sashiko project have been resolved.
> 
> Any progress on your work for the permissions modifications (or enabling it for
> media)?

I'd like to have the permission modification changes applied at
Patchwork upstream before applying it to linux-media instance, as
this will require a DB change, which can make it harder in the future
to update linux-media patchwork instance, especially if upstream ends
with some changes over my proposed patch.

So, while patchwork doesn't have a separated permission for checks
addition, we'll keep using my tool to update bots feedback from
e-mails. To prevent too much noise at linux-media, we have now a

	media-ci@linuxtv.org

mailing list that is meant to receive all bots feedback. The
e-mail parser is listening to it as well.

Thanks,
Mauro
