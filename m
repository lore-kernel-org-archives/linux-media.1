Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE4141B8FD;
	Thu, 16 Jul 2026 11:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784202346; cv=none; b=gkishwEcZWkCIvqPaG+4qiXweOCGoNld2DYNlZvVwv1PRCCgyg8IGcF/Q7DPnFcbzJrUM3dT9QbyTSNMjgXtvr3sDkhIyfeUKdz9TacC+S8gcdADuiThQkkaHhZXlvCPvNbHgjMzqZClicT7SmVHhcCOmn/sPCTsF573gi8apWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784202346; c=relaxed/simple;
	bh=7lHA1KIF3ZYfJgjJcHFiljPd/+p5UTTmoz7g08D3Lmo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FRIquDKaAGbKLRSKo+9yT6Kjxk7DXcxX8NBQmxEGKzLp5CpPJJxtRKPw3JKWKDzl9C54Ig5pEE5Jp4hxyv2SnRRlMvHgnG1BzU6av/63iwron4tC6hxvcTs+GrFabRd6PJkAzUZVdCS5rC6+PRE+cehsmU1wf69tlM7IQKWT3W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=RAK67tkS; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="RAK67tkS"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4h1B7K2xNPzMlG6;
	Thu, 16 Jul 2026 13:45:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784202333; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7lHA1KIF3ZYfJgjJcHFiljPd/+p5UTTmoz7g08D3Lmo=;
	b=RAK67tkSHlU0B04BSrusTG8IXcVCZDhL94XVL9kim4khV3z2shM4hfQBIpX9M1rnJ7taJd
	bLmTp8MCEpJB8Y7NR3Mz9ONdc9EKlxgXEM+9t7FV0quqZsEz2ytUtMNu7RkMx4X1oK6aQI
	ovDpxncnfrgc/mQTmJ8vpNKIsR+2dRgMb4l5ZX/uLkssaOzHE0TMe+Ngo+TpHYJ7g4k4Nq
	ZIgb78BXCx/U2PVqQWnW776YkRTEgKWTCHFbLtedd87pittalYpJ+Fny9PVAxMfTYuXMdK
	2iEJHZM2+JuHOjmcZAFvsVCylY6NifnbFC22YYekQuV2TRwl8SINE1I47RFuAQ==
Message-ID: <a0d969408a5a55dfb6d0b3e65906fd7bbf3eee1c.camel@mailbox.org>
Subject: Re: [PATCH 1/5] drm/sched: Protect entity->last_scheduled with
 spinlock
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, phasta@kernel.org, Tvrtko
 Ursulin <tursulin@ursulin.net>, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich	 <dakr@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Marco Pagani <marco.pagani@linux.dev>, Boris Brezillon	
 <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Date: Thu, 16 Jul 2026 13:45:26 +0200
In-Reply-To: <9e6c5123-f8b2-4a06-9fb0-be84c39ddd77@igalia.com>
References: <20260701085920.3253248-2-phasta@kernel.org>
	 <20260701085920.3253248-3-phasta@kernel.org>
	 <a4091099-1931-4ca2-a81a-9c3321b123a8@ursulin.net>
	 <51fbde808bd059510d667d130afae179626303be.camel@mailbox.org>
	 <ce33edbb-11dd-4722-bb87-d16155f35a75@igalia.com>
	 <e9e12e30-80c1-4650-9d71-4107517bc956@igalia.com>
	 <9e6c5123-f8b2-4a06-9fb0-be84c39ddd77@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: ab856407d7812df3992
X-MBO-RS-META: mxz4g73r3dcs4fncjxmyhzfaeoq5ytw6

On Tue, 2026-07-07 at 10:21 +0100, Tvrtko Ursulin wrote:
> Therefore, for what I am concerned, it is okay to go ahead with this=20
> simplification.


It is not a "simplification", it is establishing of proper computer
science standards, which trumps -2% fps, lock cycles and
microbenchmarks in any case.


P.
