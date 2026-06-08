Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2FB322B6D;
	Mon,  8 Jun 2026 15:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780932653; cv=none; b=KjnnfTDhbQdOelhAmvgkWV3fllxzG5XndrqpzFQKfxtoKRMJjbrqVgYoz5jvOpDBHCDwjh6zvttrXuhwD4zwjrsngXbwKocR5WcNNEzy/62Uj87nlsG2CpwWFICcfuskXX5TgVZ2LpJXnvnTAXg1kXwm5dRZKneGVray7rnRP0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780932653; c=relaxed/simple;
	bh=tMpgAvxMGxIQmpSssq6c7l771FlFeNKZ7wj1qvYxYkc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gUxoek9o8jzu7qPmkt5Q9dUcsBc5RqIrPVhZMO8wVg1la3lUR97rJVDIpbtHQaNKNNpQYCp1JZXs4o/O718q3P8heYNtHFYuf6+bk3VUhgMMcQGxhSQzlAnJdbAJ48tInZkxO2y03akdVMXn7my0/MXZt4avOlAIAYvPK2OwRY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VZPWXCOg; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VZPWXCOg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780932650;
	bh=tMpgAvxMGxIQmpSssq6c7l771FlFeNKZ7wj1qvYxYkc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VZPWXCOgwkC3VZzov1sGksk+CvMBsdtLCiZ+xRkCQwHzxxZpS17Wvqye9Ze+LgxRw
	 48Jv3SLLmItV8OpNrqDRLFn6sFfyjbd3jedurPs1NMK3XY6FnqtW8ofWpxZytBeYFD
	 y8wP633LR58+zzxfQpm9jFWGvl0wKWmh0lpAoI0T4TrfKuBOr7bL+liYiKJnTkfjeE
	 /S0Rj4hnDrTogjGcxZIAsMzfzLHhPV/MukhkkT6ktzRpJyHda9TnsbEHyguoZV5MoS
	 LQLOO1EUyAXvAqTwBpUsiJBzxqik697EBsSBv3VYsuVBe3O28u9XmzsaW2y0MmsFiJ
	 b/DVOfaoZ2vEg==
Received: from fedora-2.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B5BC917E011B;
	Mon,  8 Jun 2026 17:30:49 +0200 (CEST)
Date: Mon, 8 Jun 2026 17:30:45 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Philipp Stanner" <phasta@mailbox.org>, <phasta@kernel.org>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel
 Almeida" <dwlsalmeida@gmail.com>, "Gary Guo" <gary@garyguo.net>, "Tvrtko
 Ursulin" <tvrtko.ursulin@igalia.com>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] dma-fence: Fix races of fence callbacks versus
 destructors by locking
Message-ID: <20260608173045.70bee7ad@fedora-2.home>
In-Reply-To: <DJ3RRRX6JY4M.LCRKJ074W9DQ@kernel.org>
References: <20260608142436.265820-2-phasta@kernel.org>
	<20260608170112.24fd92df@fedora-2.home>
	<6bdbdb6541392c6ea58e0035f0b20ac3c8f3e54e.camel@mailbox.org>
	<DJ3RRRX6JY4M.LCRKJ074W9DQ@kernel.org>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 08 Jun 2026 17:23:06 +0200
"Danilo Krummrich" <dakr@kernel.org> wrote:

> On Mon Jun 8, 2026 at 5:17 PM CEST, Philipp Stanner wrote:
> > On Mon, 2026-06-08 at 17:01 +0200, Boris Brezillon wrote: =20
> >> On Mon,=C2=A0 8 Jun 2026 16:24:37 +0200
> >> Philipp Stanner <phasta@kernel.org> wrote:
> >>  =20
> >> > @@ -1020,11 +1024,20 @@ EXPORT_SYMBOL(dma_fence_wait_any_timeout);
> >> > =C2=A0void dma_fence_set_deadline(struct dma_fence *fence, ktime_t d=
eadline)
> >> > =C2=A0{
> >> > =C2=A0	const struct dma_fence_ops *ops;
> >> > +	unsigned long flags;
> >> > =C2=A0
> >> > =C2=A0	rcu_read_lock();
> >> > =C2=A0	ops =3D rcu_dereference(fence->ops);
> >> > -	if (ops && ops->set_deadline && !dma_fence_is_signaled(fence))
> >> > +	if (!ops || !ops->set_deadline) {
> >> > +		rcu_read_unlock();
> >> > +		return;
> >> > +	}
> >> > +
> >> > +	dma_fence_lock_irqsave(fence, flags);
> >> > +	if (!dma_fence_is_signaled_locked(fence))
> >> > =C2=A0		ops->set_deadline(fence, deadline); =20
> >>=20
> >> You can't take the fence lock around ->set_deadline(), otherwise you'll
> >> deadlock here [1] or here [2].
> >>  =20
> >> > +
> >> > +	dma_fence_unlock_irqrestore(fence, flags);
> >> > =C2=A0	rcu_read_unlock();
> >> > =C2=A0} =20
> >>=20
> >>=20
> >> [1]https://elixir.bootlin.com/linux/v7.0.11/source/drivers/dma-buf/sw_=
sync.c#L182
> >> [2]https://elixir.bootlin.com/linux/v7.0.11/source/drivers/gpu/drm/msm=
/msm_fence.c#L139 =20
> >
> >
> > If we'd port these (and maybe some we have overlooked) simultaneously,
> > they could completely drop their separate locking.
> >
> > The fact that other parties were forced to take the fence lock in their
> > callbacks (and even 100% of the functions' code) actually proves that
> > this RFC is probably a good idea and callback-calls should be guarded
> > by the fence lock :] =20
>=20
> I think I looked into this recently and IIRC it indeed seems like all
> implementors of set_deadline() take the lock within their callback.

dma-fence-{chain-array}.c don't, but that's probably okay if they are
called with the container fence lock held, because we already have a
separate lockdep-class assigned to deal with the nested-locking of
dma_fence::inline_lock in the signal path.
