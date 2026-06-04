Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B713A7F72
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 19:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780602001; cv=none; b=KH06oKluSIsxgd7quHkrN2GgI7Edt5xoP3CBsg+gs7oz7dl5y2uDoyEhkIuJqGgkBacBPCD45NNk6YA1T3Rlh9MDAiFZfaTtzT6DDHtRwvA91DEhEv/lR1adXX/pFVQiwUeo4nV1NFf2ZU9IHsvbmBFmOvKtT+d+1U9EbhEb1Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780602001; c=relaxed/simple;
	bh=XAAru9+CjZE4Gdlvlt4EdVshQ3FTxYs+HQYWcWMEul4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EiyZHNMsbv1lv6FJkrIhmDU3P5WwKYZ3vrvU0v7gDHr86/p6mmrjvg9HazDo9ScU6lnkp8v1lbvAn/e0/bvveBenUSpDVFNvo9iXOqDHhwxFIZgdf5/idAx0vVEuUceFOv6oMZT8TyXr25Y6VlvK8M5TACOl/N7S6s6ZjMrsIIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iw8f/6Gl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iw8f/6Gl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F1061F00898;
	Thu,  4 Jun 2026 19:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780602000;
	bh=JUZGVwwj4HQZStIJDtddQfc5ylHGqjVREYOjtLPaXRg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iw8f/6GlvMuFSLrZJ89zyVjBcqd9EsmTKjn+ytycT7Ij5oWhuvkaR/itO7ELGTYyD
	 vzYdVKbTQpzBl+T7H/52KMq68K3GEKqktO2PkhjLPQFLaCkr5J0b1oG4VjuvLsGEaB
	 EN6VsXXtI//a2UtPEFTKdJL/CLex4VED0Gq/6GGXsz22hCQ+mQgnAvT37Dvb2FuLht
	 UjjTxMpUgDLfovIMIvjM85lZBX0bPTpMVO1M7cfFkZ0OQliuechBC7bvHLqCbsBkVz
	 pVWTED0GLdDZ6K2QpKXVu2Rar+ZYsve4YNPp0Kckbx4LdMuC1AYiqfoIy68+XNFoX0
	 VWsITjHIAyNyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 3/4] rust: faux: Allow retrieving a bound Device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lyude Paul" <lyude@redhat.com>
Cc: linux-media@vger.kernel.org, ojeda@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260604192740.659240-4-lyude@redhat.com>
References: <20260604192740.659240-4-lyude@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 19:39:59 +0000
Message-Id: <20260604194000.3F1061F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The `Registration` struct's `# Invariants` documentation was update=
d with a new invariant, but the `// INVARIANT:` comment in the `Registratio=
n::new` constructor was not updated to explain why this new invariant is sa=
tisfied.
- [Low] Typo in the new type invariant comment: it incorrectly states the o=
bject is 'bound to a device' instead of 'bound to a driver'.
--

commit d541fc9c1199eb4e3a390c6348b6b03f9492aacc
Author: Lyude Paul <lyude@redhat.com>

rust: faux: Allow retrieving a bound Device

This commit updates faux::Registration to implement AsRef for a bound
device instead of a generic device. It also adds a new invariant to the
Registration struct to document that the object is proof of a driver being
bound to the device.

> diff --git a/rust/kernel/faux.rs b/rust/kernel/faux.rs
> index 43b4974f48cd2..20ab638885354 100644
> --- a/rust/kernel/faux.rs
> +++ b/rust/kernel/faux.rs
> @@ -25,7 +25,8 @@
>  ///
>  /// # Invariants
>  ///
> -/// `self.0` always holds a valid pointer to an initialized and register=
ed [`struct faux_device`].
> +/// - `self.0` always holds a valid pointer to an initialized and regist=
ered [`struct faux_device`].
> +/// - This object is proof that the object described by this `Registrati=
on` is bound to a device.

[Severity: Low]
This isn't a bug, but there appears to be a typo here. The commit message
states that the Registration object is proof that "a driver is bound to the
device". Should this invariant say it is bound to a "driver" instead of
a "device"?

[Severity: Low]
Since a new invariant was added to the documentation here, does the
// INVARIANT: comment in Registration::new() also need to be updated to
explain why this new invariant is satisfied?

Currently, the comment in Registration::new() only explains the first
invariant:

    // INVARIANT: The device will remain registered until faux_device_destr=
oy()
    // is called, which happens in our Drop implementation.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604192740.6592=
40-1-lyude@redhat.com?part=3D3
