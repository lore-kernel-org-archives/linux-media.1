Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7726B3A1A3F;
	Wed,  1 Jul 2026 09:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782898736; cv=none; b=OG5FIITDkElCcmNGI9tFzRobj99q32nPMbeIFeR6BRNg8totqG4qA2xtJi/i6S8sOz36NgC1i7j7vg60oKNAXAqpXhjB9qfpbR08+KR6u5QbYX2mIkG4EMBOdWuTVS7A1rganlwDZ/H5oQQDt1FeVnjRtd7CuQ+/jKmtU8KV+yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782898736; c=relaxed/simple;
	bh=Z/MQccUU8ZV/szIL11sh+fPAh1w53RtLzYd5RdcuIjs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RXi6vKB/tUXIVUVmF5Z9UlKmIhEMzN6rXtK3NWSvMRc9uT8YEmaLOZQToCmRNoDI0afpwkMjJAqlbfSR3ClJGXXKneOoYU8GQc4XYKrHk5JL2CaAPherPyx8B4vIN5PWSk3r8qn4699L1C4bQ+tn0lTw93Wxf6mRB/JoUvzuTdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=lr1yvTGC; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="lr1yvTGC"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gqw2138s3z9tyS;
	Wed,  1 Jul 2026 11:38:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782898729; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6lLxWwm2ec6TjhN1sKZlPI0XtM2PK8Ut5JL5Jjbj3qs=;
	b=lr1yvTGCneGTgWvHzocgbEa3X9Cc+RSxPIv1QRAjU5QfhiiLMQt/FrTiOUpAAdBCy8a0ms
	88FPTilhuyKAvQepybbnQZBTcq0Mg3JU5zu8QwxJF8I8M7o6gchNXdLRmkca23arQW1IoT
	+K5ztSNyzhtTkcV8xvZ/8+lNvFa5aYJRyo1jxvgMQRBg0KzEutK1zHGcb/Q5iKQkvjJdb9
	Q7dfVzoMZb8ylqmUEEdAf8UqNIW+ropTFymGXSLTPz/b/pb7GUFN14EyEbHoyMoblFawlk
	nFQPmFkmtqoDXElUGbbsRC+lyQomb0ToqhpCwyqXbUb5JzyHc7COZjzl+dYp0A==
Message-ID: <5ea5741e6cb618f6c66adeaaae9565f8debd796e.camel@mailbox.org>
Subject: Re: [PATCH 5/5] drm/sched: Remove entity->entity_idle
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Philipp Stanner <phasta@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>,  Danilo Krummrich	 <dakr@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Marco Pagani <marco.pagani@linux.dev>, Tvrtko
 Ursulin	 <tvrtko.ursulin@igalia.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Date: Wed, 01 Jul 2026 11:38:40 +0200
In-Reply-To: <20260701085920.3253248-7-phasta@kernel.org>
References: <20260701085920.3253248-2-phasta@kernel.org>
	 <20260701085920.3253248-7-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: on3uiyyneea4wy3tajn8aazoxccnp7rp
X-MBO-RS-ID: ca2de0c17790b5f71d5

On Wed, 2026-07-01 at 10:59 +0200, Philipp Stanner wrote:
> The completion entity->entity_idle only existed because the entity was
> not properly locked through it's spinlock. The completion served to
> inform waiters about whether the entity is actually idle, which is
> something locking (previously added to drm_sched_entity_is_idle()) can
> fully achieve.
>=20
> Remove the surplus completion.
>=20

[=E2=80=A6]

> -	/* Make sure this entity is not used by the scheduler at the moment */
> -	wait_for_completion(&entity->entity_idle);


Alright, my bad, turns out I had a bit too much steam on the kettle and
we cannot remove it because of the drm_sched_entity_flush() being able
to perform an asynchronous kill while the scheduler work item is still
running.


But I think we could probably put Tvrtko's flush_work() [1] here to get
the same result.

Opinions?

P.


[1] https://lore.kernel.org/dri-devel/20260611123423.39819-1-tvrtko.ursulin=
@igalia.com/
