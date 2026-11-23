Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423101;
	b=cnCeIf76RQG+yEY7OPyvS09GmUhBObMUINHyy8q877S5gv8Xq73uxGkMU8M3JeYGmtoo
	 zVg/xRs7nHOVmdkK+Yf6P4RcpgNURKIYQ1UYVTunFzwAciKyENveCiUeZVyKn3kIcgFP3
	 hXe6Ho20TDqa5yyYWqEclT3sjpmpM4tQzDulkointCXPJ6uHnC5iJf/v3WdJR0uu0cmeh
	 mWHyV5E8RiluO+BO/c//RuhbrBIpEMp03A8VvWD7D/0h3n9pHG2oLl2YBxUT0IWFfzZb0
	 EA5PFcjAPJy0l+iYs4ezk8GFuc3wRcQdxYC5KOTyDs0/QfEksmkj0isiLLMhuOQNqQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423101;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=8lqR0QaTQMOryf8SafC93cow/nv3e+cOSoNeXjUpDUg=;
	b=IScZK2KD8/jM9EJzD2YkMYd/ByBT5ZhLTkHTTNOSEFpzO/1Z+/7JZEo8QgvmOHEEh/ut
	 lECTb+frnWzOugaM5bcFxmEc5CvIwHjXw8VommxUU0m/Iwjt7ckPzpfS/hbK0Vd4xwA1U
	 cZFtHvVeKk4ePGl1G+OsF4Q9PJdHshJuxcI7wlYZFZOvjUt/AzbuxSQxPW6WlS7sHBXjq
	 aaYBDT4bv2jokOI7BsrkVMrU6h47nzjU5uYRIcafAj5Q7/GRMKl78vXB/gRtT3b1tu/hM
	 wkW2shWvgpJIY3rqlhb/b3jXBPsrCwtaB4tMcKzc1RQIxj0DnO3rhy7Gb36QCjPgfXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h3cJShEl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6AF606A31F
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 08:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h3cJShEl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B391F000CF
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 08:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795423100;
	bh=8lqR0QaTQMOryf8SafC93cow/nv3e+cOSoNeXjUpDUg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=h3cJShEl98mk4aSbwU1o15EBqdCa4rcP5LeNd4HMvM06/F6Lj3rFE3DSv2y91a5ls
	 vAfpU99AbvBl55rwxRC3EdzPc7o0EZAEKlQAKrii2OmIjbjzOrvz/9Fbut5EdHC20s
	 5Br9+0jN/PFLuX/AXY8bY6NfeEFhX9jhBQzkTtoUGHp7ol73AFUAbl8JdN29KOgFv1
	 7wl44JIRjzBRJJiDvw6vJmOC8MC80BGJWX7N1pYvWGl8N406hP9k3KcpTuKxFFm0v2
	 Iw7NGgCEUvfC1m4ddLmo3PLonYB66aUqdA6xszS0DMCQSfgi9HrXClzSCelEO3HZFD
	 DiltgrXMK3aYw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c14f7768acso2384725e87.3
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 00:38:20 -0800 (PST)
X-Gm-Message-State: APuU4Z8Ahk8VbiuLAuEHdb7Wfi4+Mj//psYx8zKEJyz/ulSnUn61gv05
	aAAaRDFxhZfPA41zdvg0Yrtkn2B4UWZrRHDkDR9O6NeSyMC/vNkHOGPWFdyfqIrzIb2DvHpzB30
	SCnS87vprwLTHKSUMqeQBLhOItzHKWnw=
X-Received: by 2002:a05:6512:2302:b0:5c1:5703:46f4 with SMTP id
 2adb3069b0e04-5c1bc6826d9mr3039269e87.7.1795423099260; Mon, 23 Nov 2026
 00:38:19 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-mali-c55-irq-supend-resume-v3-1-8a933864e7aa@kernel.org> <6b0390f0.3e00a709.2371f8.2526@mx.google.com>
In-Reply-To: <6b0390f0.3e00a709.2371f8.2526@mx.google.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Nov 2026 09:38:06 +0100
X-Gmail-Original-Message-ID: <CAD++jLnh2sbT+zoeeer5OrEgYUv2SKGWayOZ_axBFQAa=DM_ag@mail.gmail.com>
X-Gm-Features: Aa3M54p6CrN5BIqE0w5twk5w6niXgKHj_oIcslcCXvrGm-RIwaqcLNWUfAUGB4w
Message-ID: <CAD++jLnh2sbT+zoeeer5OrEgYUv2SKGWayOZ_axBFQAa=DM_ag@mail.gmail.com>
Subject: Re: [v3] media: mali-c55: Keep IRQ requested during suspend
To: linux-media@vger.kernel.org
Cc: Linux Media CI <media-ci@linuxtv.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 2:03=E2=80=AFAM Patchwork Integration
<patchwork@media-ci.org> wrote:

> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
>
> # Test build-basic:x86_64
> drivers/platform/x86/intel/int3472/discrete.c: In function =E2=80=98skl_i=
nt3472_handle_gpio_resources=E2=80=99:
> drivers/platform/x86/intel/int3472/discrete.c:440:24: warning: =E2=80=98e=
rr_msg=E2=80=99 may be used uninitialized [-Wmaybe-uninitialized]
>   440 |                 return dev_err_probe(int3472->dev, ret, err_msg);
>       |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Eh, what? This has nothing to do with the patch, not even vaguely
related.


> # Test media-patchstyle:test-valid-ancestor
> ERROR: This code is not based on any of the branches: next fixes
>        from https://gitlab.freedesktop.org/linux-media/media-committers.g=
it.
>        The output of media-ci will not be reliable, and the code will not
>        land upstream as-is. Please rebase your code.

I'm pretty confident it applies but who knows, I can rebase it on that
branch if it actually helps, but rather should base it on Jacopo's tree
I think?

Yours,
Linus Walleij
