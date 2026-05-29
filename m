Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F8942E013
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 18:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780080382; cv=none; b=IVKWQwSvWQA6lD6uzoDWD7wJpJEasmjVaBOQES/csub3+7CO2zrUXaYkeRLGrrv5BkaICkuG4T6R08WeMZq+qM3eaMh6teJ3cnnQv6uiFl8xmXT2rb3BWZUakwmYV5BAYwaWON5scovN0NctrTcmhNYlATX6zQqDKACXCNJ4hno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780080382; c=relaxed/simple;
	bh=7h+QcjSgyrI2Gt9tIpxIOMIkeczAfrFZ84lRYJvq4F4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q8igQNHbflj5aP1hoOhTnxsJQr0Jy6NzjRgNeoHFKQP4tFtjgk3FEH52BxQDAcO1+yP11prmH+cv8FtW9F1n/tIwUvDWsG33R5VIqBaLcS4uGTTrNvQIolPPj5iD4monNonCqwJxWsNqpjEh5Hq9t8ow7Ct5SlPuGxixOHFmhFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R3F3U8hV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R3F3U8hV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 580651F00893;
	Fri, 29 May 2026 18:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780080377;
	bh=2x4ivcsr3PIEB4AQjp9Oc8t1wMR4aIuIIgTBmeNjhTo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R3F3U8hVbJIt24zySCmB2LDl0/t9dz9+fy0KUtmwZsmYw44yhXrTlhpL8qttqvGM2
	 4e/7FdCYMI7IX3yYAHg7KxcIh/c1obl29j/qJeNrMINcfF7EWMkZW8V/uZr6DEMurj
	 swj0y6TBXN5KuUDDLizn+kdMCq0++k0Do3aELtbaBTgq3ZwLjuovCdDvBFfEim/Wn8
	 KgVg5Yfvf26gnZ3r6ULugg7WHbE4WLg63vcheKmQkhXvZZv9BfMQEAe2HMOKdgw+Vj
	 Ee3UrCyDeamJUtrEB2ugzXvYxITOhEznCBsBqaf4+hMNn7hR9db4nKnrHtGW0B7xR3
	 e405KjVPMg/bg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 1/6] rust: gem: shmem: Fix Default implementation
 for ObjectConfig
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lyude Paul" <lyude@redhat.com>
Cc: ojeda@kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20260529183702.677677-2-lyude@redhat.com>
References: <20260529183702.677677-2-lyude@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 18:46:12 +0000
Message-Id: <20260529184617.580651F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `default()` method in the manual `Default` implementation for `=
ObjectConfig` is incorrectly annotated with `#[inline(always)]` instead of =
`#[inline]`.
--

commit 2f2d2871dcff324f4a62883f7a855840f82b51f7
Author: Lyude Paul <lyude@redhat.com>

rust: gem: shmem: Fix Default implementation for ObjectConfig

This commit replaces the derived Default implementation for ObjectConfig wi=
th
a manual implementation. This resolves an issue where the derive macro
incorrectly requires the generic type T to implement Default even though it
is only used as a reference.

> diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
> index e1b648920d2f6..8b7de136ab1f9 100644
> --- a/rust/kernel/drm/gem/shmem.rs
> +++ b/rust/kernel/drm/gem/shmem.rs
[ ... ]
> @@ -50,6 +49,16 @@ pub struct ObjectConfig<'a, T: DriverObject> {
>      pub parent_resv_obj: Option<&'a Object<T>>,
>  }
> =20
> +impl<'a, T: DriverObject> Default for ObjectConfig<'a, T> {
> +    #[inline(always)]

[Severity: Low]
This isn't a bug, but should this be #[inline] instead of #[inline(always)]?

According to the Rust subsystem coding guidelines, #[inline(always)] is
reserved for functions using build_assert!() that depend on function
parameters. Small abstraction functions and default method implementations
like this should generally use #[inline] instead.

> +    fn default() -> Self {
> +        Self {
> +            map_wc: false,
> +            parent_resv_obj: None,
> +        }
> +    }
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529183702.6776=
77-1-lyude@redhat.com?part=3D1
