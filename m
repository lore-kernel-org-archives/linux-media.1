Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E401A3D9DCF
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 14:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774880674; cv=none; b=IhPy/a/GyHRv+hhIp2C0eGKOAgf469U6ZBdN8T3falNhXVDwpf3nNKHuAbjupCs3l5YGVrTqRrI6yvzLONu9yIsUQytpC53W3wyzchjcf4c4N2HWugHWCuW+FAy/2LJoztAslvv2tCNioRa/lKXj8yOqTseLaINmX9xXZMn1DZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774880674; c=relaxed/simple;
	bh=1RBto/xc+4wsKEClCf4lOrQo2z+frxkXMlvrdP6BH3Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G+V8xOZkq070OAocsBM8pX2LCA3m9oSMppyGrQzT4JCLnc02acDNE4nJTSxURZvZHKSDZ8UqDlylZAt3hlLHBJe0bCwGHgL42kOseUGp7Su159R1oagieqRul66UtBH0l6U0ZIUum/vvPjv0A5pN/YtBfs76+Rmamx9UGopwkqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=fUZesUOK; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="fUZesUOK"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fktmX2Tb7z9vX4;
	Mon, 30 Mar 2026 16:24:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774880668; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yRZrkJZfwCu3+U3xhoIwwpL0ahkoftQ4XU/qKrUSNFA=;
	b=fUZesUOKY9ern9a97mGszkiQ1ENAhkAH8U5WBSghIKRP5uhjngxGx9Zn3QPzd8D0d5YBYz
	aVbiYfZWFDvTLO1o95999RMOc1NMv+UtdaGhAh74JBq6/MJA+B4hTXy1LBPfjxQo9bgg/S
	zZveYF5JuYc/OYbrh/NdAbBpvTEAMp/qsQebfRvwawDngLTa+FjkPF2vnNYAMXviQbidt8
	SSVSmZ6J5KoxBABam2EhI5EA1M7flctjIxqSscTxEEzg3vRjuSYvu+cr6Nz1T7/izUlVbJ
	MA7F3Uu89jfqLdA0yyAhDHgrOfbjeY4C6vYXKCXeYp2GxyApncMLHjbNo3S/xg==
Message-ID: <ec5f5cacb36a05780485b3ee1cc1e6be36de549e.camel@mailbox.org>
Subject: Re: [PATCH] dma-fence: Move signalling tracepoint to before ops
 detach
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
	 <christian.koenig@amd.com>, Philipp Stanner <phasta@kernel.org>, Boris
 Brezillon <boris.brezillon@collabora.com>, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Date: Mon, 30 Mar 2026 16:24:23 +0200
In-Reply-To: <20260330133623.17704-1-tvrtko.ursulin@igalia.com>
References: <20260330133623.17704-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 498873b17976b2fdcdb
X-MBO-RS-META: ncjtjt6wa9q5o941ouswkd3y3dkh5x6o

IMO the title should state that this fixes a NULL ptr deref, since that's v=
ery significant.

On Mon, 2026-03-30 at 14:36 +0100, Tvrtko Ursulin wrote:
> Move the signalling tracepoint to before fence->ops are reset otherwise
> tracepoint will dereference a null pointer.

Can't fully follow; you're talking about the fence ops detachment for
signaled fences?

>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Fixes: 541c8f2468b9 ("dma-buf: detach fence ops on signal v3")
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
> =C2=A0drivers/dma-buf/dma-fence.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 1826ba73094c..1c1eaecaf1b0 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -363,6 +363,8 @@ void dma_fence_signal_timestamp_locked(struct dma_fen=
ce *fence,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &fence->flags)))
> =C2=A0		return;
> =C2=A0
> +	trace_dma_fence_signaled(fence);
> +

If it's about touching the ops, the decisive action would be the
IS_SIGNALED flag, wouldn't it? So trace_dma_fence_signaleld() should be
above the flag test?


P.

> =C2=A0	/*
> =C2=A0	 * When neither a release nor a wait operation is specified set th=
e ops
> =C2=A0	 * pointer to NULL to allow the fence structure to become independ=
ent
> @@ -377,7 +379,6 @@ void dma_fence_signal_timestamp_locked(struct dma_fen=
ce *fence,
> =C2=A0
> =C2=A0	fence->timestamp =3D timestamp;
> =C2=A0	set_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags);
> -	trace_dma_fence_signaled(fence);
> =C2=A0
> =C2=A0	list_for_each_entry_safe(cur, tmp, &cb_list, node) {
> =C2=A0		INIT_LIST_HEAD(&cur->node);

