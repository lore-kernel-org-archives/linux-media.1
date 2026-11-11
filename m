Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794368154;
	b=JcIPx2uCnyhmX9mxd4+Ni3UKf+pK1zlZmxU4cqmyiO7sQzj1oEGUhpROX7FRX8pWupcE
	 fEKYjXbt5sjnmpJVC+D3WP8MOsbny9862GONWa6sgnZoKCXszgWPl+2a//ZExMFD/SeJt
	 n1gsUpVv8hu8w5lmzbk6nD6Z1glmgYWPaW5DELRZdxGsXwMY5tuLqYdDbOZEJZ3tCnD6h
	 92UAGK3ptGToUch+RjJtRS5DVS3Q7Q8BsSbut+Er/VkzKnEZyC43q+ZK3T6mT5Bv0hqhh
	 OBtDP0E42fgUhrW/nns/E1+IUpWdAMlKyVAn037wp+50eKZJMJNED5Br8Tx0TLX81pw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794368154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=8TywaaCqz892UCXpGk4xLWoIxHDkRWoTvx/KQxG7KWU=;
	b=KHxzWzFwVoidae9zO5urVTlUz4LJBXBVFWld7BzKtwKVxuNx4Ee+Kl3R/FuUbOfRIk8z
	 qpJ3UZdsB/S341ISLjKaf7c1cPKL+kCTToumZRJW+UyyBIjr923edC7RmY0v2Al8VXqf5
	 8VXVj2bQN/r8evLZGhAx6llWscKnH4R9klIl8ebNPcZwv/VVg/lt/0Ux92Td2GId/AXrp
	 3DgRIQXoJ29OH4qSEz8GV0PzD9FPQG/0lrGqizaoyGV/bCnkntj2x913UqYyBLuvYNHhX
	 9kAvtDDt/COs5zCXrkH3n+m3R9HY45rwYqmELe0hQgznsyewkSubiQJ+WFxJJy13gHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LzNPPv3q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6893606A324
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 03:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6893606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LzNPPv3q
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1438d9363fbso1620980c88.0
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 19:35:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794368153; cv=none;
        d=google.com; s=arc-20260327;
        b=N/2R/pGiHkQM5hLLBngKwU8+1eqdNq7vkUBFU6WwCMTBLPBBysHg7pZ/N/3/hu8umx
         iamSqKIKwwMHRnNIzvV3fGG3ulIF+ELA1hrUDCwKfGh/VJsf6eahw5BbhW+vf/2KtXRN
         Hfw1STAOzKdq39KMBxvrKLGicY60iPvuKduAQmQwGXCGLkTJN85xNYk1b22ihZr/JXIt
         W2gxZ8rBJF+aczV4yXAV0XDug4CUYV99IfBbaPxCUe18dczfBqt15srXh9AQdiACR4+I
         I5xytgTPt9v1Ie9l0Bva9eODWAzdo93VRrzppql3FFJUuSQ5WGsHD2tAdFOYW58CmC0l
         4+ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8TywaaCqz892UCXpGk4xLWoIxHDkRWoTvx/KQxG7KWU=;
        fh=xat5d+87QisBxYODCpnQgeLPFPAPegt+VEifHab+r5I=;
        b=EI87lSW7uyxHyahlxIemxrDlPeWywQxVH6AoXGn7lSIliTxCCagGJ1oRKXHgsC5DOf
         F9DcmgilotNHVhpxtc52AzSobqKGEi8hIbYkZNXRrpZnRmqv721Olk82QTI1+gN/LGRq
         7KxHtsFET5LTkPTtp/wKKgmCv5KvmvPR5/LBQbTKlrXIhrtH5KaUSSNbHwxyouJtk1jU
         010U8VK/00DQuvJTWh007eSlGgG9EmFRfZb2e/ehE7kbQ3Ig2DEtJi/PS/HKuA37GUA1
         Fx1UHMd1W62b6urnbJaBtdVUtXGGts5ozQqjKPAYYNx+o64nVdvEG5PAIIbeoRiWuJ3j
         9JgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794368153; x=1794972953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8TywaaCqz892UCXpGk4xLWoIxHDkRWoTvx/KQxG7KWU=;
        b=LzNPPv3qwB9uJvUwCjDJy3dMFlRp++p2d7NddYrRWpnHJOJjwMLRUYfCYLeNyND5E3
         lC4arcKL6DgF9eKlMQOOBFA1Tv3eHoD7eHwOlwL+GlPzZiIP1mMLDOJI3f1ufQnngohU
         IRoOJeI8/mdooh4l/ZoE9PwYme3SSk+Aw0NudO8l6Z+nlerWwEPXYrTzfTycqY1n0tt2
         UOa96pe9SQDI7G2K25PnN6aGRBKcMW/bEvFfXiXPzvDubtgazJodKGEXSxZrpOwCJkcO
         a/Mu2fkvjE9OG7e1nTcGskRabuqAzRW57sv1sg93AKqKldfQz58VDfjfztMJ4nlnvQt4
         qI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794368153; x=1794972953;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TywaaCqz892UCXpGk4xLWoIxHDkRWoTvx/KQxG7KWU=;
        b=ddA/RSG7sj6PwLk+jn72xX/Tg7bNqtkm7NuUbQUOD/KGGyMQBjKuVZm5etvQPBWm8g
         KIruqKRSddJNpFL7oWT5G+ldA80qnUHzV9R/3dhNkdxXAy77jxm2zIuF7kqUFZl8F8Wz
         QImG9hIktySLCMRhgsYkIg1tLAfDKascEAZK8OWCAzOI7S5gZaGeyRXvKWFcinAXj/o7
         A2SrkwizLun4NrEHAkbRTanmPqYtBWnOLlaisbWeXQ5j6G85y6fB8pgFQ3EdP42aqF6J
         7QGo0bFPNnqUZh0PMJ3xF8mzAwHkp4boGkt1fSLnxp8Yz0v111cUrjEczbm0LHEZN+M3
         zjnw==
X-Gm-Message-State: APuU4Z+Yvf0zTB4Vfb0O3gb7SNdhPreP6LPekAB0MOILXKZ+y+C3s3UX
	SOqPKovDNJXFv1tzcYy9OKit2lx91Ob7lHMHxCncGdhdjoYzJTWQdQXKuvrHbXtQsmKFmUz4h0r
	NFvlz9JWphHZCf5WrcZe53Yia2q6ewZU+99b65ajpn92z
X-Gm-Gg: AYBFou2CZ9pXIBf1ccdBIAwQI0XgUqxEU9mKmSyBEdXJWAI99azBbPc7I75xel96psu
	AUwVdPJSl39ouiQBIHLfLXJr8twF7IFuzxrERyxr/eQ0RLvvdWE6FRELI3mmFCSBD5xIj5IVOr2
	afC5NF0Lc2eDhO+Mi74nwzy1P+7wB6gfguo1uckAslvrBHkvsqJCtzrYE7GerjLldIgEXJGaUxu
	KUPYYYtl92H9hsODwzVjV9xG5EPqCjKaQJbDAxxiU+liCqa1jvKH4yMGbL/2eVgVhKmWsBUpwxi
	nDslJO57exSQW3lrjvsQcbr1ITGXI3UXJGvm4QpErtEXGUBox6Td74N57kn4FFGCPYZqVaUtXQ5
	MSEtYXNXLMLiMjhqxvFH6LMw/ZR7cB8wa97GaPFwPprQrYWZ9OAOWUiRS3e0=
X-Received: by 2002:a05:7022:2594:b0:1b2:581d:5dc7 with SMTP id
 a92af1059eb24-1b3bef4c4efmr2201891c88.25.1794368152653; Tue, 10 Nov 2026
 19:35:52 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110090343.1245744-1-islituo@gmail.com> <a0b9693e-2a6d-474d-b178-3bbd098a69d2@web.de>
In-Reply-To: <a0b9693e-2a6d-474d-b178-3bbd098a69d2@web.de>
From: Tuo Li <islituo@gmail.com>
Date: Wed, 11 Nov 2026 11:35:41 +0800
X-Gm-Features: AclHuK-kqsOOs5H_16jkpDsqZVeQRaLEmyypq7XD1DrM4zT8OmsZXESULclmxGk
Message-ID: <CADm8TenZPgqksu2VJsLhM0dDrgyq1YYMWZXwytj=Vd5A82eFvw@mail.gmail.com>
Subject: Re: [PATCH] media: dvb-bt8xx: Fix potential double-free in frontend_init
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus,

On Tue, Nov 10, 2026 at 8:22=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> =E2=80=A6
> > Remove the redundant kfree() calls from dst_attach() to avoid
> > double-freeing the state on failure paths. This keeps ownership with th=
e
> > caller until a successful attachment transfers it to the frontend.
>
> How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?h=3Dv7.4-rc2#n145
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/stable-kernel-rules.rst?h=3Dv7.4-rc2#n34
>
>
> Would the specification =E2=80=9Cdst_attach()=E2=80=9D be more appropriat=
e in the summary phrase
> instead of =E2=80=9Cfrontend_init=E2=80=9D?
> https://elixir.bootlin.com/linux/v7.3.1/source/drivers/media/pci/bt8xx/ds=
t.c#L1693-L1723
>

Thanks for your suggestions. I will update the patch accordingly and send a
v2 shortly.

Best regards,
Tuo
