Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792785681;
	b=pL8oyHE9XFMWaS4hdrLMO36T1i5Hk9DbYCg1OFhTpbGTgRoITnBD+ZE4jw2dWHzcrFfa
	 RvHlzEXJq0FzJi54vjDAGgEg29NXY2c6UoA6EiGMk0pFnq8NmccwNY85ff8OzWPXF9vuV
	 A784cTj8++XRIyGmjab9oXFXH/ruluNmV+Gf6asOEPTL/SX2lg/POyi0avAouRpIM5l3g
	 34mpznfEUSfOgHb8AwQUZ+HY8FcUEwniCrTsWroKo6nqE8HGfKq9uB++POAyP6vmDbgLr
	 hnwXGkWPmv0YoxAQtNESO6RDOcj+UBuPrl4+78LpFbrTpaZmZvhrGvCL852R4u3Kerg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=R6P232PvLRYTH0fZdfO+3AJcU5WVHpT1tzKpJhoLyzQ=;
	b=IskbDUG/AqK7/zAZBf0UOi7WzTSI9S8+A4A1+OLFx/Df6dIzcscDXDLt2w8fuzJqAgwT
	 Z/PMkwkS79aWUo+NQhNgXoGJ8B8odAbJHwGy6CmNWZQGpFZboVVVUAd4uA/2UYg3bXuIp
	 SYZoDH30RbpnfmuLgttJSgh87K8IMYmw51U3xZmGF6pjpEHQN/8MpYDkZYwOJ4nyiDD9f
	 3xteshwZZXX2HY08ZFHGn4q31HlDoYomb/0FZbt5IaiIkXJnxdd27pY9mX36/4q3PF1xx
	 VhcJjz1JAmXuloRw37MwQSNUvqvPiuaf3GX+ctrQ4hfZ1gZBtoiawVpQhY6gDw3aQMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=NhRUecM0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B3F60A2605
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 20:01:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05B3F60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=NhRUecM0
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-194d0c31715so2283c88.0
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 13:01:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792785680; cv=none;
        d=google.com; s=arc-20260327;
        b=d1gDrxMjbATTJ3Bgx9JmjkqK6lbtvMi5yUX5zX2KeZIYt+4ryilAsxsPi4/XjgSpSb
         AT8Aq86T16LDpX92lw4Vd/nDgZWYxE8SI/qRNDAoMlX67tzJV3Bh3SOyy18nMaG2d8sU
         ILc0QJXaZhEE76QeKdCbQsBQpNoAbVzvEr8Rxk9zF79t8t/ze7adJIWtZKeacFN+VMO6
         VN+E3Cjerjae1G0dqbzO/A4QK6JXLIaLJjPDPZ32nPdVn/nOH3DHaDFnix7Y4UAkML+9
         70WO+W5aEoPhlbdb3uBFrBXzGP2v2R6nks0I46oAHTH/rglzE81v1apg28vWpil85i+5
         3vaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R6P232PvLRYTH0fZdfO+3AJcU5WVHpT1tzKpJhoLyzQ=;
        fh=7YErQcAcYA61zze8kkIerxOYXd2mdjEP+0dUotqSQT8=;
        b=lIJk4A+0cBUMj8rODRJF43dITxWDdCNWdgzx/JOQD1yNeEXogyFx9CLulpf6BNviR9
         7cBxwud1Cohf0UWdsrnwJa4/o49paCbgcS7rA0xsrAbStplu4pJI90NL7lHB5wPERCqW
         7nKIpUITPsMHgIGEmaSpP4Hv3IZKdpwQVzXtYAueiB2zLuYpnVsbHqzg+kMPvg9Cff3Q
         2TSChZWRJGB/vaa6FPqhHUuVl5z07gYBMpS+jUdk6/pzHCromcyR0zlSS9e0d14bMZ2q
         lHUS3pWRNEgdblWcIDlyQCRkwZSQLZH3Nr0MKl3FUN6jNbymtgoqMHbwrv3doOLt3PZH
         hr2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792785680; x=1793390480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R6P232PvLRYTH0fZdfO+3AJcU5WVHpT1tzKpJhoLyzQ=;
        b=NhRUecM0MaSyL188/UhVkiKrlBbJzWi/BNVMU7d5YPBuZ4iNj3orcUODsTyxrukgQ0
         sshE9V3b3hpWy4yz5rTLrpU/3T/i7yiZemoOjtjAulVcVzmeu/+uUKXmFKRrbGV8DWhI
         ikhmpS8Z9Mn7sdgQlSNsC0RxuXXxhwIwObzqNeKh07tyr+63U8OQgBmFE4mockOozkgA
         PAdYIBVKieKprNJuM1Pvbqcymrtd+kJp6cXgA8iSY9nDhe9RlfG2ie2TZtH0ORW8F6sT
         xplVtIhXO2sZNExMdYq02R2Ax6WZmI4WYtHnZTJHSjY1I86x9aF4mAg70ShzvwGFSOk3
         yU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792785680; x=1793390480;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R6P232PvLRYTH0fZdfO+3AJcU5WVHpT1tzKpJhoLyzQ=;
        b=1NZxoY3XHN04+kPmAFDPy2kN+obb7OSFyJ/X6iVr9JNGiD5dmc1ZWo5EJo+71aJhuP
         NTsjdZfrT/TEUZc2i8+97gxUo4MkzfGPu/cNYouJECa30nzlT4MGMGL3DfpTUHUXGUTn
         cGD24szbFsIlnCE8HP4vNixymeJlUdSYAHliWp8+JGVcDtBzN1pauj2fD+p2Hf4pzwkb
         Yq58kH0CSoQfLtsBjS0ztdzX0UwDVqol9pTtrgfkMk+THtaffIWBgTzrMfabK/Ti8oEB
         HkFUshHrlXn8YJHUFcQ1c2p1vPkZmnjlEDLSAL91l8/JrsayTulSCArqRIfadQeG56gd
         dBag==
X-Forwarded-Encrypted: i=1; AKwUvBwNuoJiWO1LyZKZxxZGGwfYVTCCQXOdZ4s7d0dTF97mqEu5CRpbfGTcLeaGeeSoLSvyaWnTekDs7bYxoA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLx7e/uRAc9jZLIZu2DrW+1iQ7m2rGg7TwqxgIoT4VaY0qXa60p
	S7/xtLlSZ8TrVH0RIFhBZUDdSenxt4kAFHfVg6RZG/k2xV3nUWakRhiLC5N1y5kDK1lqRAUQO1A
	qMb8Q4L437dv8Bur60VZ3B8JSaXMuEU7POI78LnkF
X-Gm-Gg: AYBFou2So6CKbV1rqQGkooJNtKxTku8gaQG58cs9UAuTKOWe8YEu0FtCV2pvKftZlzr
	dh+5cUGOT+sEReF0owhEdNhVRZilsM9pMP6Y20l8UuXS+vJg6JPtfCYgUEQ18yYB8eu/wwFVv7d
	93Xc0pMDhQclzaD66afvZBK2mryskt/xcrxrFEQ/1BZXwe3cfyJ0ats4xaM53QxGyAfOd/0NM78
	DO6W1G9rl8lSGtZRWDL+egRD2CwPpTBx8f2IOTC6mA89bJoDr1Qv1dFXvPc9Nb0J3Xuh/wF/8De
	/ArXdTHnPHXUCVk2CTCvbsw2HihNgvhB60Dvb+KpFxar5iDjW9xivOpMmmDEqZ5dFQw6erhQrMi
	CaaPb2T23TCoEygNrQUMxHL1DUjNOUrr/g27s
X-Received: by 2002:a05:7022:4587:b0:184:6afb:b26c with SMTP id
 a92af1059eb24-1993fe82542mr15165c88.18.1792785679160; Fri, 23 Oct 2026
 13:01:19 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015163915.1166043-1-almasrymina@google.com>
 <20261015163915.1166043-4-almasrymina@google.com> <20261020121858.3b9107c5@kernel.org>
 <CAHS8izPwWT+vbgAe49m5vXsRxT3unbfjLTkVZBScgAPdQTo2dQ@mail.gmail.com>
 <20261021132304.23e0a4e7@kernel.org> <CAHS8izN_N25mm9vALax+P+W45gyxVoMbZoTXW3r6nPC2Z0A7JQ@mail.gmail.com>
 <20261022181911.5d19ff13@kernel.org>
In-Reply-To: <20261022181911.5d19ff13@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 23 Oct 2026 13:01:04 -0700
X-Gm-Features: AclHuK-uP7Gir6yY-QN4sOQ103425f3gALMoJmdo_Tw66r7N7gb2W22rdmAKl0w
Message-ID: <CAHS8izOTLYU=5sfJvpwB57Bp3tJ=xt7Gwws5xCVqABFw4T3WUA@mail.gmail.com>
Subject: Re: [PATCH net v4 3/4] netdevsim: support devmem RX and TX bindings
To: Jakub Kicinski <kuba@kernel.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf@fomichev.me>, Taehee Yoo <ap420073@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Tariq Toukan <tariqt@nvidia.com>, 
	Kaifeng Wang <kaifengw@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 6:19=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Thu, 22 Oct 2026 08:41:43 -0700 Mina Almasry wrote:
> > On Wed, Oct 21, 2026 at 1:23=E2=80=AFPM Jakub Kicinski <kuba@kernel.org=
> wrote:
> > > On Tue, 20 Oct 2026 23:17:34 -0700 Mina Almasry wrote:
> > > > But on the other hand the test coverage is nice, and maybe one day =
if
> > > > we add enough devmem support in netdevsim we'll be able to fuzz the
> > > > data path or something. Is there a way to get the best of both worl=
ds?
> > > > Like put a comment on top of netdevsim that this is test simulator
> > > > device and any missing functionality and/or bugs in it should be
> > > > medium criticality max or something? Or is it too much trouble and =
I
> > > > should drop the netdevsim support and tests?
> > >
> > > I already strip Fixes tags and apply the patches to net-next.
> > > But it's still a burden. If you're signing up to fix the issues /
> > > review the slop we can try.
> >
> > I'm more than happy to help but I'm not sure what you have
> > specifically in mind. What I was going to do is put a comment/readme
> > in drivers/net/netdevsim with a note to sashiko and LLMs, "this is a
> > netdev simulator, used for testing; do not call out missing or
> > incomplete functionality as bugs." And then hope that the LLMs and
> > sashiko pick the directive. If not, I can tell patch submitters to
> > ignore sashiko code review bug findings in netdevsim. Is that
> > sufficient, or do you need something else from me?
>
> No, the fact that it's a test harness only impacts whether fixes
> got to net & stable, not whether bugs need to be fixed.

Ack, I meant like if the bots start to consider missing/incomplete
functionality as 'bugs' when it's actually missing from netdevsim on
purpose because we don't need it for testing.

> I was expecting you to keep an eye on the list and review any fixes
> that come, basically.
>

OK, I'll add netdevsim to my email filters for patches to review and
see how it goes.

--=20
Thanks,
Mina
