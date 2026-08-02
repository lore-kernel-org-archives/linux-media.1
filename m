Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF22A3A3821;
	Sun,  2 Aug 2026 10:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785668260; cv=none; b=i4KXeERNW3+jJEOvol1YABwnmx2+iovSdqrqW3r/VHfc/v7O82rD4SoaIEsp0oRcY2Spa6qsDahA/zUqwPfexrTJrjIdy/8PUf2n7FMgiz1ux09d5uQSXQ8rjYXv60X3i9fuoGlOCxrmn/SXSUH5f25YC3JWhPXrNRORo8V1dMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785668260; c=relaxed/simple;
	bh=Riu2YM+38j0JVcsLGsBc24g3adzMt5TOKa4a3kxKxz8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hh25eJgA1FyFhK6iMvbjSobKHEQKmRsogTOrxM/UfJqaymp1fdgvSooibWhBkXqyucmTwCatRAGC9NgTCgIBSPRuoV70z7Wu4BZp3bgOSE3hGCKQy+oqWq+4SjXT9Go0WqecMdyBjMfsD9V6arMumfJrEn63/xX4EzW+RgWu8Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJEqdKhZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJEqdKhZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30EE91F000E9;
	Sun,  2 Aug 2026 10:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785668259;
	bh=2HxQqweEUGiLjU6vmU15W/Uk0JXjxASTCm2Wy7zrzIc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=eJEqdKhZoVkdn59CQiFY9qVMnrJJ1zqOqlCLsZnIcKyUlVGDmNP/X8aRxOTTATMKH
	 IaM8KzKVBYTW6r15PrI9DMi/4fQuZG7M5pWMq9I1B2p4VNlFgmSdF0hn7+Hzc+XI2o
	 qIzBKVSluWjq8XiFVIMbq/JQiEzmE+vbF5J8p1fdkkN/M1Ni8AngnZfakGmmn09vDy
	 RNU7hJfqKAsTr6XSMGS3EScSpPX6S5BAOV/fMv0NlYRY5iwsgzvCDk2rEsLzGU3XzU
	 xo1NhlSSm27J37oox/4MJWzpuqbkQJP1vUatoFfTQ28lhR6ABFCRNii9GYZtZEkJPB
	 7EEkZIBMi+ujw==
Date: Sun, 2 Aug 2026 12:57:34 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Ali Nasrolahi <a.nasrolahi01@gmail.com>, Hans Verkuil
 <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 mchehab@kernel.org
Subject: Re: [RFC] Discussion: VIDEO_NUM_DEVICES limit in v4l2-dev.c
Message-ID: <20260802125734.198631b5@foz.lan>
In-Reply-To: <am7LpodognguIZN5@zephyr>
References: <am7LpodognguIZN5@zephyr>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 2 Aug 2026 08:24:29 +0330
Ali Nasrolahi <a.nasrolahi01@gmail.com> wrote:

> Hi everyone,
> 
> I'm working on a project involving high density video processing on a
> single server using a large number of v4l2 loopback devices to route
> virtual video streams to tenants.
> 
> While doing so, I ran into the hard limit imposed by `VIDEO_NUM_DEVICES`
> (currently 256) in `drivers/media/v4l2-core/v4l2-dev.c`. Looking through
> the code and git history, this limit has been there for quite a long time.
> However, after searching the mailing list archives, I couldn't find any
> previous discussion regarding this limitation.
> 
> May I ask:
> 
> 1. Is there any internal design constraint that requires limiting the
>    number of V4L2 devices to 256 on modern kernels?

There was a constraint at the very beginning due to the way minors
were generated. If I'm not mistaken, this was long gone.

Still, having a maximum limit is desirable as there is a hard limit
in terms of the memory.

> 2. Has this limit been discussed previously, or is there any relevant
>    discussion that I may have missed?

Probably, but likely very years ago. I can't recall last time we
discussed this particular limit.

> If the current limit is no longer intentional and there's no historical
> context that I might've missed, I'd be happy to work on a patch series to
> address it, and I would appreciate any guidance on the preferred direction.

What is the maximum limit your hardware has? Can you provide some
documentation related to it?

Thanks,
Mauro
