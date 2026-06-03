Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9A93FF8BB
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 20:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780516939; cv=none; b=RzaVCq1T6yN429HkogRKFjrHW2FcyITmGQLFLjC2JfMm1D/mNZrJ2y1PrqEu5j33kf0jUdujoUh2+rMBGfL0oPeRBwjeIyEz4kL+2gytxcV84ppL3vHBY/5+W1vkZf8Et4KeZdB/tXGix65dtexdtq9bpWW4mByPJxC9uwPPwvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780516939; c=relaxed/simple;
	bh=Ap/bI37EhIJo52KTykcIrAoPFQ2DVrB+Eswv1p73M1M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VNj4FHZorsaorD4UJDRlvBihW3X5SHUkH6nyOwiIBymnBNQh6Nir77tCiqsrGPgLaew/5VJsAvSMBVjfD0AwAHskSFRRcdelZj8d0NhEPytX1AG5YOaG8rZVUng+SRNvqoAPBJ5s3RvofjP/6NU5i1cb5bABet87Vi4gfbMqP+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y8LCfBY+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y8LCfBY+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2F001F00893;
	Wed,  3 Jun 2026 20:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780516936;
	bh=Cr1qN0NznhK5TWtHKOI856cyb3Gh1BxRvgCZlULCyag=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y8LCfBY+wtYC6Qb8i2ylGxuLbpqMNDWWL2JjJMIIl02KtNgUy0B8gHRxxA5tfj52Q
	 rH2Td3yOM4fHt2oIO98CaoNuAwF22CMajw1iZwfgUY+ikhqXSlqZjrNm9tAmxg8NJQ
	 /wOcy1OiiWgRbCkdmk9URbk+qS2A5Xi/hEUIwxp3/E+hUdtScfgjNwTphvgQ0XLDWv
	 FycjHbuEtekApWUPMjlKwil0hWip78CRs2dDEpoXcT8IhhYBDhB09boYunUTmA2KVA
	 htEQMbGoy896LVB53e56XtDBh52eyDTNQNKTHtSm/v0jhi1+exu+tG/ZEQUStYaZxC
	 rmSWyLGXU+6yg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 1/6] rust: drm: gem: shmem: Fix Default
 implementation for ObjectConfig
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lyude Paul" <lyude@redhat.com>
Cc: ojeda@kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20260603195210.693856-2-lyude@redhat.com>
References: <20260603195210.693856-2-lyude@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 20:02:16 +0000
Message-Id: <20260603200216.A2F001F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incorrect use of `#[inline(always)]` annotation for `ObjectConfig::=
default()`.
--

commit 974110b1b618554fdff7106e2b5a8152da0f6df4
Author: Lyude Paul <lyude@redhat.com>

rust: drm: gem: shmem: Fix Default implementation for ObjectConfig

This commit replaces the derived Default implementation for ObjectConfig
with a manual one. This avoids the requirement for the generic type T
to also implement Default, since T is only used as a reference type here.

> diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
> index 34af402899a0e..084b798ce795b 100644
> --- a/rust/kernel/drm/gem/shmem.rs
> +++ b/rust/kernel/drm/gem/shmem.rs
[ ... ]
> @@ -53,6 +52,16 @@ pub struct ObjectConfig<'a, T: DriverObject, C: Device=
Context =3D Registered> {
>      pub parent_resv_obj: Option<&'a Object<T, C>>,
>  }
> =20
> +impl<'a, T: DriverObject, C: DeviceContext> Default for ObjectConfig<'a,=
 T, C> {
> +    #[inline(always)]
> +    fn default() -> Self {

[Severity: Low]
This isn't a bug, but should this be annotated with #[inline] instead of
#[inline(always)]?

According to the Rust subsystem guidelines, #[inline(always)] is reserved f=
or
functions using build_assert!() that depend on function parameters, while
#[inline] is meant for small abstraction functions like ObjectConfig::defau=
lt().

> +        Self {
> +            map_wc: false,
> +            parent_resv_obj: None,
> +        }
> +    }
> +}
> +
>  /// A shmem-backed GEM object.
>  ///
>  /// # Invariants

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603195210.6938=
56-1-lyude@redhat.com?part=3D1
