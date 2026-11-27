Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779841;
	b=iiVoCWuea3cMC7/pfqGHKqWIrIZuvuQ8A03JioVKPl/5k1OVO1PmlgytjQP9k6llHc5O
	 iCmZv7wQbWP0NrFdr+9z0F1ubHqiMOs7Bk5qU7FkdDNt7nNPPyfQZqTcE/FMTVr5b/vCN
	 58uGKrqSNEOkioG1YIUajmE4ISN2zz3IFlqXL1r95VMO6qUSU7rRw/N+Qmjw9BqJXzIN9
	 vEhsM6HPs+3d+6wHnvCPlU0JQX2A9zajRYw5E8bAHZKfYsGwPV9M7oIZ1ZrrrVYTt/jnw
	 spGrEaq7OCsk3Qmdr6lrS199nATQIpGV3sh7vpZAeQq0HkO5AGH/MYutz4eVbiSDThA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779841;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:
	 Reply-To:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-MBO-RS-ID:
	 X-MBO-RS-META;
	bh=XpO7QIZp9eDf2b/vorZ5cqU73l47qHouBGMtAMaWFeQ=;
	b=1SFDcIbXReSWaBulc0e9pZgmbT74NIjgTFhR1fnVQhjHQNuyDRQuyAOgR1lARYgwNy8O
	 k7WDuLH24ei1BHLejBdoT3RhIZHuF64CMRHhWOODuLqDHTxpy7btTOsZkCCmZBJbi7Rgs
	 F8t+t+TNttjtRLPvOYUGp0+uY/7PSaN5R/YEiU/6eJjpJ/6inmgp1FdZ/D+tg+6nlHVym
	 lzGcArftR3xuh3yi0aOzhen2PsWD9BEyfDfOpqydjV20POOnL/1bCyxLbHXKrMvpMwo2p
	 8OsnzTxzVnWK+7McFQfrh01scMGsJDaAb0gCThBWLd5en+DAVPfF8Xlee8XQSccwCqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=wC0EA7Xs;
	arc=none smtp.remote-ip=80.241.56.152
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FF7606A31C;
	Fri, 27 Nov 2026 11:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17FF7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=wC0EA7Xs
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jbWlS2mFhzKmSh;
	Fri, 27 Nov 2026 12:43:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795779831; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XpO7QIZp9eDf2b/vorZ5cqU73l47qHouBGMtAMaWFeQ=;
	b=wC0EA7Xs45NGUfeZwEsTQxN90TKphYNgpa9X+iA6adC6YhWArhmjHvOjL1tHJCNHf3N1dq
	mBQ7Y9JZ/qEiRTEqGCY4tYt7E/Lq9aWXHwrdt5V6CIgo5UQo9kpqBlaQNJ/fUY7IDuiw2Z
	tVh+bXYHwqn6XjEZcuzVFylwxC7r6+jf/bq8FeIkA0h1ARzWjZC1UuTDI3LNpaESzjmdSG
	RuftL9dIsYLkXmHREOgPhwaJm436vjUkGHaHYIyV92WMQjIVB/lva90ZA/E4tVw/28wYlq
	uOa7Qi7A7rXpusCQk2fV5gmJpWleTLPFXKQRaFaVGThkYF9Q5MWeb7T2R1tXhw==
Message-ID: <b6b75395da594c4bf8deb1daaf857854565c66cd.camel@mailbox.org>
Subject: Re: [PATCH 0/3] dma-fence: Properly order timestamps
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Matthew Brost	 <matthew.brost@intel.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Tvrtko
 Ursulin	 <tvrtko.ursulin@igalia.com>, "Mario Limonciello (AMD)"
 <superm1@kernel.org>,  Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,  Gustavo
 Padovan <gustavo.padovan@collabora.com>, Chris Wilson
 <chris@chris-wilson.co.uk>, Luben Tuikov	 <ltuikov89@gmail.com>, Shashank
 Sharma <shashank.sharma@amd.com>, "Paul E . McKenney" <paulmck@kernel.org>,
 Gary Guo <gary@garyguo.net>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org
Date: Fri, 27 Nov 2026 12:43:44 +0100
In-Reply-To: <DN5YMFCMLL2E.3LMY2Z5ZQAYFG@kernel.org>
References: <20261126172046.2473303-2-phasta@kernel.org>
	 <DN5YMFCMLL2E.3LMY2Z5ZQAYFG@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MBO-RS-ID: 40531303c2cea4e117c
X-MBO-RS-META: i6e7srj96rpfrqs6kw1sdcq97sckomz4

On Fri, 2026-11-27 at 12:34 +0100, Danilo Krummrich wrote:
> On Thu Nov 26, 2026 at 6:20 PM CET, Philipp Stanner wrote:
> > I propose stuffing these hotfixes into the stable kernel / misc-fixes
> > while we move on on misc-next with a more proper solution. I'll post a
> > series for that soonish, too.
>=20
> What has changed that this now became an issue that needs a hotfix? Do we=
 have
> broken users?

We don't know. But we have no reports, no.

It's literally UB. Can explode any time, or after 5 years, or never.

>=20
> If so, it would be good link a report if there's one publicly available.
> Otherwise, I'd suggest to just go ahead with the proper solution you work=
 on.

What do you mean with that, like not backporting it?


P.
