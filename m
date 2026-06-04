Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7EE3A59BA
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 19:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780602001; cv=none; b=Qjz2WhTgmGYi6j4D/aZOlBUo7167fUgjLNrFAZ2Kwc90oAen6uJdoHP6MclDMfq5okGvHqzM+1wpYJNDAaNcu+bhP+RDKJ8+sKqcf/ZaYOuqqtn2PEy4KL+fmgWGKNxloXZk/Hxn27Fm1D8dR1+6MdbkPcMsguwxfcoypCNwMz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780602001; c=relaxed/simple;
	bh=WK2ZLoQiFo5XsBl++Gm4OWIapvYrdarzs9oVFXLCaY0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gPpuVNtxiS9Rzll9ZNQj2nGYg3uk/Ka1m/ycF2MsKyQ6PXcOiLrIQcDVanX7oz/AWRNR8qSizFigkKjK238nvXgH48tmUr4RyGc3WkVuHuJZMBJpqQLMJ2yOMeiNyQCCvebRr0ryNMbVUtqtT6v6TbA4QthibhqA3bU8SFFx8co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hKRHLSrq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hKRHLSrq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81F7B1F00893;
	Thu,  4 Jun 2026 19:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780601999;
	bh=kUmUvLRmmybBcdcgkI46pkZhN02wxdGQ4Uh1Q5KFJ/U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hKRHLSrqIK8c5dJfXnY4DNZ2PbWW1jORM2qwJb39jDyeV6dWcwmRTX0EhbTreoz1m
	 Ap704Y30NqNQVCq0Pvf1J5cqWnxvcqcJoeGOW6xLigFdF9tMr3rJmvS+b8Dm1PzDSz
	 FdK5KrCCn4LZNMio0bieipaP1dJpCmqj+8l/bPHbObf6wWt0P+Mp2PEbgr10cD31WA
	 J0EZOhnj3soYubE4ifQjLuTplt9aKLTpRzsFW62G4gjWXwDpD+pnUgj7EiXleWUAIY
	 BYNKbmmr+XPLySqpMJ8imFO3B8YrIw0nKMdO6Gvw3KNVjO+eI88YEuKjeflTISwF23
	 QADoi9xybAs4Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 1/4] rust: drm: gem: shmem: Add DmaResvGuard helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lyude Paul" <lyude@redhat.com>
Cc: ojeda@kernel.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260604192740.659240-2-lyude@redhat.com>
References: <20260604192740.659240-2-lyude@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 19:39:59 +0000
Message-Id: <20260604193959.81F7B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] `DmaResvGuard` implicitly implements `Send`, allowing the `ww_mute=
x` to be unlocked on a different thread than the one that acquired it, viol=
ating strict kernel mutex semantics.
- [Medium] Missing `#[must_use]` attribute on the `DmaResvGuard` lock guard.
- [Low] Incorrect use of `#[inline(always)]` for small abstraction function=
s that do not use `build_assert!()`.
--

commit 83465c025b759f686444735d2b770912987eb833
Author: Lyude Paul <lyude@redhat.com>

rust: drm: gem: shmem: Add DmaResvGuard helper

Just a temporary holdover to make locking/unlocking the dma_resv lock much
easier.

> diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
> index 34af402899a0e..4cf038f7afb71 100644
> --- a/rust/kernel/drm/gem/shmem.rs
> +++ b/rust/kernel/drm/gem/shmem.rs
[ ... ]
> @@ -235,3 +238,29 @@ impl<T: DriverObject, C: DeviceContext> driver::Allo=
cImpl for Object<T, C> {
>          dumb_map_offset: None,
>      };
>  }
> +
> +/// Private helper-type for holding the `dma_resv` object for a GEM shme=
m object.
> +///
> +/// When this is dropped, the `dma_resv` lock is dropped as well.
> +///
> +// TODO: This should be replace with a WwMutex equivalent once we have s=
uch bindings in the kernel.
> +struct DmaResvGuard<'a, T: DriverObject, C: DeviceContext =3D Registered=
>(&'a Object<T, C>);

[Severity: High]
Does this struct implicitly implement Send?

Since the wrapped type Object<T, C> is Sync, a shared reference=20
&'a Object<T, C> is both Send and Sync. This makes DmaResvGuard implicitly=
=20
Send. However, bindings::dma_resv_lock acquires a ww_mutex, and its Drop=20
implementation releases it. Linux kernel mutexes are strictly bound to the=
=20
task (current) that acquired them.

If safe Rust code sends the DmaResvGuard to another thread and drops it=20
there, mutex_unlock will be called by a non-owner thread. Could this cause=
=20
kernel panics or break mutual exclusion, and should DmaResvGuard be=20
explicitly marked as !Send?

[Severity: Medium]
Should this struct be marked with #[must_use]?

Without #[must_use], users might inadvertently call DmaResvGuard::new(obj)=
=20
as a standalone statement without binding it to a variable, causing the gua=
rd=20
to drop immediately. This would leave the subsequent critical section=20
unprotected.

> +
> +impl<'a, T: DriverObject, C: DeviceContext> DmaResvGuard<'a, T, C> {
> +    #[inline(always)]

[Severity: Low]
This isn't a bug, but does this violate the Rust subsystem coding guideline=
s?

According to Documentation/rust/coding-guidelines.rst, for abstractions=20
only: functions that are small or forwarding to a binding call should be=20
annotated with #[inline]. The #[inline(always)] annotation is strictly=20
reserved for functions using build_assert!() that depend on function=20
parameters.

> +    #[expect(unused)]
> +    fn new(obj: &'a Object<T, C>) -> Self {
> +        // SAFETY: This lock is initialized throughout the lifetime of `=
object`.
> +        unsafe { bindings::dma_resv_lock(obj.raw_dma_resv(), ptr::null_m=
ut()) };
> +
> +        Self(obj)
> +    }
> +}
> +
> +impl<'a, T: DriverObject, C: DeviceContext> Drop for DmaResvGuard<'a, T,=
 C> {
> +    #[inline(always)]

[Severity: Low]
This isn't a bug, but should this be #[inline] instead of #[inline(always)]?

As mentioned above, the guidelines reserve #[inline(always)] for functions=
=20
using build_assert!() that depend on function parameters.

> +    fn drop(&mut self) {
> +        // SAFETY: We are releasing the lock grabbed during the creation=
 of this object.
> +        unsafe { bindings::dma_resv_unlock(self.0.raw_dma_resv()) };
> +    }
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604192740.6592=
40-1-lyude@redhat.com?part=3D1
