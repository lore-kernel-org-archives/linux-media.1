Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046022E7389
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 08:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780302092; cv=none; b=abI/VdPzXNjtQqIMmei0rwCg8d8/d4tV/yi+EfkGKaUV/0Qpn03xFg2gUEbVKo0ok25wAtm1umMMicLk63Y0cnET30rcFWKnYwaG5r9krcKgS5jVJC1DN1cZOPK2cmMYeXnbfB4PL5w5rOhuzl0zFPjDCnTVMt99TaQMhgzlWVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780302092; c=relaxed/simple;
	bh=X4HXKkza6qm34wyGRX/t3pZxO/seqMGdJIRtthfI+UQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eGoulpJeyX8ZYW3IWcU/DUiXIzNDOSqxUM2jOlbdptWJXv6x7yC+/HUp3xv3xyhpyyT/eCel5GGLM6UJXKxST5qdP1iQ7pUI2rTuxlrhIzrhiuN6OckbpO8rT1Ci2WDKPvF5GHtbTVcnmTpCXjtsBRez6dvflzuVrsSiyaKE8IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZR+eNK9b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZR+eNK9b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 797911F00898;
	Mon,  1 Jun 2026 08:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780302091;
	bh=CwEAGxXWqzXTH+DkpRzEwVpZWn6aikmRbVLgEKQAukM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ZR+eNK9b9Jmc11qj0zbF5NnJS3FkDEQ/D8YkChjKBwLST7yPYO2s6UQf1ir4qZ3lt
	 58LvNsUEcbKFmGLNd4sL0Qz8kJxm022xztt61oFo59WI19fe2yp+0rrh1yJ26Eo9U9
	 sSvlu+ctBgi4l6VUeGIDfIXqQqreyDYTiX4KmeEtekM3n+1Ve6AnM7R7++OsF7wuaB
	 9t4kZHy8iLR/oPbHLsA/mILz8Sj7477K2FF0mGfq0ZMXbEVueBGwq5jkxaJPVdWVms
	 p6zP7ATbu3HO11Whlm9ZjDyHTr8ZN//hesIKVyDHXuje1IYF29zspgOW6+MlKu+F04
	 AVjakFxCq+rPA==
Date: Mon, 1 Jun 2026 10:21:27 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-media@vger.kernel.org, media-committers@linuxtv.org, Bryan O'Donoghue
 <bod@kernel.org>
Subject: Re: media-comitters next vs fixes trees
Message-ID: <20260601102127.625ed568@foz.lan>
In-Reply-To: <2d1e7167-2cf4-4998-9005-5d18a45c0144@kernel.org>
References: <CAO9ioeW5mv9bQjKbd3KOx6V4GB2xKgmDcLrbLowc=j0agwWMag@mail.gmail.com>
	<2d1e7167-2cf4-4998-9005-5d18a45c0144@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 31 May 2026 15:24:48 +0200
Hans Verkuil <hverkuil+cisco@kernel.org> wrote:

> Hi Dmitry,
> 
> On 31/05/2026 11:13, Dmitry Baryshkov wrote:
> > Hi,
> > 
> > Is there any current rule or plan about submerging the fixes branch of
> > media-comitters to the enxt branch? For example, I have several
> > patchsets which apply perfectly to the linux-next, but fail to apply
> > (and function correctly) on top of media-comitters/next because it
> > depends on the commits which are only a part of -fixes.
> >   
> 
> By default we (and with 'we' I mean Mauro and myself as media maintainers) do
> not merge the patches in the fixes branch into the next branch, unless we are
> asked to.
> 
> Most of the time the fixes are independent of work in the -next branch, so we
> do this only if there is a good reason for it.

Please also notice that we only merge upstream tags into "next" branch (e.g.,
currently we only merge from a 7.x-rc? tag).

> 
> It's a bit late in the cycle to do something like that, though. In the meantime,
> just mention in your cover letter that the series depends on patches in the
> -fixes branch.

A "good reason" means that you need to submit a patch that will be merged
in time for the next merge window which depends on a fix already merged
upstream.

Just to give you a concrete example: we're now at 7.1-rc6, which is a
late -rc, as this is the last week where media subsystem is opened for 
non-critical merges. We usually don't expect big/complex patches anymore
on a late -rc kernel cycle. Most of patches on this time are supposed to
be fixing issues.

So, on this specific case, a "good reason" means that you have a fix that 
must go to 7.2-rc, but depends on merging fixes from 7.1-rc6.

If this is not the case, better to just wait for 7.2-rc1.


Thanks,
Mauro
