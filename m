Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E852231842
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 05:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780118912; cv=none; b=ulu2sKlMeLQwiiIL/DYXYLZA7sYEq2ILXGFPgHxoondgyK5veUH8a7g0BGCPAXDyZ9S7wSypDk+CgYQvISQtaV598KdFYeAUjlsFwaxfAEFF9SLEjM2mUbYUa3nWz4iY8CNnVG8XGEIjaBGe9Be1im52KDkVtM8zr9O03jfXW5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780118912; c=relaxed/simple;
	bh=SuCRJs41C+LdCiej0QcdlnDSc7NhR7cdLEKOEu7LacM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AM2PhqzfPKqr04EPTSO4Hwcc9SiYg1eQxbWC7ThU7UM/v7Uyky/fXBOrXB7ExP1dKkDLwHdRPKa5hOFdt2aL6VlEE1/xKiccJzKuKET7rmoRt3GfRASeSD/BxBU62dHGQ4WjIxxOwB4gBEAMDOWVjPAMMohVgfUHuAjlWAPVIcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RAXz3jHA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RAXz3jHA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77CFC1F00899;
	Sat, 30 May 2026 05:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780118910;
	bh=C/VorpfD89TzFMsXVc2TFcwpSe/nSSbiS2fOW9uywTI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RAXz3jHAx8a50n+FsAJIS/oDlEvZqxqinnwHCkZr8zBwmLR2pLiOuD/+BDoZZgLRN
	 X6I429St9PKQJ2boh/uziZC9gvj2H68eCAxfrlqsYjbzUt4VJEePlaidgBC3ir5Zzu
	 Ce1+vh/JBBNI4ugIUbRU3sj7S1tuSFFFmdkKQOFyw3KVHzhm2xC9qchSeP0fiTJBQM
	 W7L1AHEgK0R2I5uhj4tKztx72kO8EB9rva9c9K2tPrjOY4eynYYpG7s1FnC4wb1YcS
	 Gl5X56l1IEiRqOaT5/MxM5Eybf5wmTioc2BEZa6qh+UYFg6Oj9tBtThTC0sPp8qcvs
	 ksBXADiV0KoLw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 5/6] drm/gem/shmem: Introduce
 __drm_gem_shmem_free_sgt_locked()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lyude Paul" <lyude@redhat.com>
Cc: ojeda@kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20260529183702.677677-6-lyude@redhat.com>
References: <20260529183702.677677-6-lyude@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 05:28:30 +0000
Message-Id: <20260530052830.77CFC1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] `__drm_gem_shmem_free_sgt_locked` does not check if the GEM ob=
ject is imported, corrupting memory by unmapping and freeing an alien scatt=
erlist owned by the dma-buf exporter.
--

commit e016ae9bac4aed16d70a96e80b500f0d496fdf7d
Author: Lyude Paul <lyude@redhat.com>

drm/gem/shmem: Introduce __drm_gem_shmem_free_sgt_locked()

This commit extracts the scatterlist unmapping and freeing logic into a new
exported helper, __drm_gem_shmem_free_sgt_locked(). This is intended to all=
ow
callers, such as the Rust shmem bindings, to manually unmap the sgt for a
GEM object as needed.

> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm=
_gem_shmem_helper.c
> index 545933c7f7121..c989459eb2159 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c

[ ... ]

> @@ -158,6 +158,30 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(st=
ruct drm_device *dev, size_t
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
> =20
> +/**
> + * __drm_gem_shmem_release_sgt_locked - Unpin and DMA unmap pages, and r=
elease the
> + * cached scatter/gather table for an shmem GEM object.
> + * @shmem: shmem GEM object
> + *
> + * If the passed shmem object has an active scatter/gather table for dri=
ver
> + * usage, this function will unmap it and release the memory associated =
with it.
> + * It is the responsibility of the caller to ensure it holds the dma_res=
v_lock
> + * for this object.
> + *
> + * Drivers should not need to call this function themselves, it is mainly
> + * intended for usage in the Rust shmem bindings.
> + */
> +void __drm_gem_shmem_free_sgt_locked(struct drm_gem_shmem_object *shmem)
> +{
> +	dma_resv_assert_held(shmem->base.resv);
> +
> +	dma_unmap_sgtable(shmem->base.dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, =
0);
> +	sg_free_table(shmem->sgt);
> +	kfree(shmem->sgt);
> +	shmem->sgt =3D NULL;
> +}
> +EXPORT_SYMBOL_GPL(__drm_gem_shmem_free_sgt_locked);

[Severity: Critical]
Does this helper need to check if the GEM object is imported?

If __drm_gem_shmem_free_sgt_locked() is called unconditionally on an import=
ed
GEM object (such as from the Rust bindings dropping an SGTableMap), it seems
like it will unmap and free the scatterlist that is actually owned by the
dma-buf exporter.=20

In the original code within drm_gem_shmem_release(), this memory was protec=
ted
by an explicit check:

	if (drm_gem_is_imported(obj)) {
		drm_prime_gem_destroy(obj, shmem->sgt);
	} else {
		...
		if (shmem->sgt)
			__drm_gem_shmem_free_sgt_locked(shmem);

Can bypassing the drm_gem_is_imported() check here lead to memory corruption
or double-free issues when the exporter also tries to clean up the table?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529183702.6776=
77-1-lyude@redhat.com?part=3D5
