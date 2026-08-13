Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BD5334C05;
	Thu, 13 Aug 2026 10:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786616001; cv=none; b=Vye247pHSXDNlBDvMSmLx4eBmpx/ptdNK0EDyIY/KPdG+AsdRTA1yJYLSgVSUdal+0LWcpVbLAe7ZZ5YuMb9RPmVhAfemaYFBRHsCCiMxy3HbewiQ4xuA4DcZdsMhRsuFdO+/2Kwa5pcRelooq+Dll3cKlOxel/QPMGJMZ2mYmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786616001; c=relaxed/simple;
	bh=0qDx8+dwcPppO915k5epXPi+XGtCM8B1sEtg2mSfqY4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n7koZuhlNswz6S7GiVXa9Dh1Yb78MaAXqMgxzeaFCC71FJgh6quHhXXf9cgvVknCiV/9U7TImSZPLH5bnp0JIQAhzd+EgIFNOgE2TvcyL51tESENWE/utRelOaQSajM3AjDGq0/6D7yitcYuv9mRDiwbSIYiZannTzl7jtm35E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=A8oqBCr5; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="A8oqBCr5"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hLLlw341bzKwL3;
	Thu, 13 Aug 2026 12:13:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1786615996; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WZRbCEJ1DrmBkK+k4bC9JHRBYf7jSP7KWeUNUIKAJ8M=;
	b=A8oqBCr5PhGRKE7FWHo0Q7s+Rtqg3l+n9xG8inoflVzpnyFvx2sjiIFLs0bGcvtLOLc5Dc
	Q1WXjCQ98Q68gIv4fHCYi9axeJdersnSCjhkDb4LZU5NGouqLEuZYeSueE89gZDMZi9UHG
	t3pul0XGmlfcRIw0RjaUIqnfJCIbiWa37Ch88zYbgPKU3bydU5f/O6ryzNmc3VTA1wOzGe
	2ii94lubAvxy83RrQQNf7AgnV4w9APGM2BQBR55bgMpq+502baztLJiXRSdSoESo4+pvsf
	T2o2ywezfj1cOwRCkKHGbF3HGQpaRCSMDaxGlIk0RNc7ctH928RzCTxWJz5nAg==
Message-ID: <ee5e9d04d45080b6d4189e9b6f5357d07cd77782.camel@mailbox.org>
Subject: Re: [PATCH v2 2/2] drm/sched: Protect entity->last_scheduled with
 spinlock
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Philipp Stanner <phasta@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>,  Danilo Krummrich	 <dakr@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Date: Thu, 13 Aug 2026 12:13:10 +0200
In-Reply-To: <20260813092510.2385962-6-phasta@kernel.org>
References: <20260813092510.2385962-4-phasta@kernel.org>
	 <20260813092510.2385962-6-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: zsbg87i5thrucb9gkyfzgo394uzbe3jy
X-MBO-RS-ID: 635c47fe6de67341a7e

On Thu, 2026-08-13 at 11:25 +0200, Philipp Stanner wrote:
>=20
> +	drm_sched_rq_pop_entity(entity);
> +	spin_unlock(&entity->lock);
> =C2=A0
> =C2=A0	spsc_queue_pop(&entity->job_queue);
> =C2=A0
> -	spin_lock(&entity->lock);
> -	drm_sched_rq_pop_entity(entity);
> -	spin_unlock(&entity->lock);
> +	dma_fence_put(prev_last_scheduled);


The relative order between these must not be changed. My bad.

So unfortunately it looks as if at least locking spsc_queue here is
necessary. I really wished someone could pick up our spsc_queue locking
TODO.


P.
