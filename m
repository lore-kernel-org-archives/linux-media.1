Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78ED240B385
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 12:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784549079; cv=none; b=r+EZ7u4Uiqxtl642DG+H6H5d0m5kp1YRskedHAPQOKQmqI3kUJig7vGk585kpy9dhrg5JRzs8D740jbKk0aZDdDIvlqnmpIAExMtXwCUDY1KLUgoV42+iJfw0KyzFf0wHWzE9toaDU4fAR1W063oZCvRMmIpfubyUzL/5TcgYJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784549079; c=relaxed/simple;
	bh=4ATboiu3c5KqTH0slwsg9MiwpKOYlAoPTTY7ipBfLRY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s1/Y21c7cjB5yRFA3PhMUlwyvjGTVMud3zCmYsR3XCoEVQ9X+oexk7jVACQFSIAjfkFoLRVtqwaj0b14T09/WqwPbzrsOBml4GjsZ96Q5Vn18fFx6u1C2qxl9W3WNRRXuKUKvMbYbA6NhjB8Q/6WeK6NmWu04hRIubyQD4DBdvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rNeG4C2B; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rNeG4C2B"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c15dd4b9132so1613222466b.1
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 05:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784549077; x=1785153877; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4ATboiu3c5KqTH0slwsg9MiwpKOYlAoPTTY7ipBfLRY=;
        b=rNeG4C2BYr+5q9GXOf3vT1JDslXkyc2rfG0zyrFfYrrOdtzBhPCudlXhvlFYFGp5mh
         XrLI4rmnhEJ/60GLCmRPwHt6NFfOPHpFb1ZTtoahW7al/Q2xaWORl6EC2sN42wiiIwe+
         9AruIN3I6P5VI/llYoVkIWmQUUifKZbbEd2vy+hDcH0VYNSF5mK4LJhe+rrAGK6YC55e
         stdKbb44rQfTk4LIENvUiZFRJOxhlNZoySb9vQ+ALS3F47phQDefLSf2xGz+zCVqF3Bf
         9QKJSTY+b5PImMsqcTGv7Sf2cuh6v/nLbqxhwYXrtWsEs1TOkgWNsiIQjSKF2p5w6rL8
         P3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784549077; x=1785153877;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ATboiu3c5KqTH0slwsg9MiwpKOYlAoPTTY7ipBfLRY=;
        b=eKIe48DtFqhzvxWkoOQwfOTA4Ot8GjGi9tHET9RgXB81yVxQMJZ5baZnst7Yhl4/OW
         WeH2XZI4Qp6Bz0PmTgcVkKynzI4BrPn4cXYA/65sN54WQ8OrO6Eou5oZTqvOf5gh32BJ
         I3U4VtLFpodUgipSpTF4lhwCeKHdpRuQUAtybixyNuWcOg4fqUrgSBqCdVgHGlbDmc9X
         N4r2zi1cuiJCtXuPspp4bKW5rbtae8LYjokRhNliZMDN6rouUiDDhhDFgorvn0N+20JA
         aOIo7YLSUlfHjihbO8IVDx9Ce7f/0ISktzZ0uEQgRTgIxxFHYs0tLcOYMSj9Q2h4isMz
         cGTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqlarg+4f6XOBGf3HjPzXvJOB4kjkMfgtWjXGM0TjUA5A0Aux+bIej48XT6rT7Bha/qMJpcsO9KXAtJzw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5c8geqjpVSPYusOQFWTJXySUOYFYAwlWGzLuYSiK5q/r/XARM
	u8ZSUdbyM9tHhBLqRHVwqjiPXWhtU8wmuU23qzRS4FGaiX/l9m3xNVp+c8r0qCSH6RI=
X-Gm-Gg: AfdE7ckTmf/vN1hDvQleadBxJQGh6HRQujAADLZNujo5XHcs7XXuAQte0x56XqS8by9
	95ueUz89TmK6qNkgjgNDD8yK1wXXtcwp2f6H/SeoPAHNW6TMg0wYN8vz2nuvX3Yl595z0YdVMn+
	hCBwlvXfNKiopo8+O5e2EbO44d3C+PJ0WJHSn+cwS5TMpHYgxSV8Et6oTldAzpWEvAcFVZS92qM
	hJgSU8hCkJjvV+4iLqBcalPfiIMckD4N7obyOVYPFQxB6yb0DCNO8L9shx8KebLbJnbJXXu8++2
	eM0tyI0Q+stK1s6Xk+vn0LVtRGgJh2ApfoD6iSl2LKgDHH7R5XRiXVTkbdhEcJdVZrIRLacsPFL
	ZDQQXi/XnrGYu32lcMjXaGopXkpUI5pL+fRfVADrnZhg0QBjAHWWld8amY7qOBpyBSyyJ4adPbN
	R6jXVAUg==
X-Received: by 2002:a17:907:d508:b0:c15:f4e0:72a7 with SMTP id a640c23a62f3a-c16b4732c58mr541282766b.39.1784549076676;
        Mon, 20 Jul 2026 05:04:36 -0700 (PDT)
Received: from draszik.lan ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17009ae10fsm458630066b.10.2026.07.20.05.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 05:04:36 -0700 (PDT)
Message-ID: <e03eb40c07d8603592ca38e7538d6709891bf811.camel@linaro.org>
Subject: Re: [PATCH v2 1/2] drm/drm_crtc: ensure dma_fence_ops remain valid
 during device unbind
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: phasta@kernel.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, Tvrtko
 Ursulin <tvrtko.ursulin@igalia.com>,  Boris Brezillon
 <boris.brezillon@collabora.com>, Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Peter Griffin
	 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Juan
 Yescas <jyescas@google.com>, kernel-team@android.com
Date: Mon, 20 Jul 2026 13:04:43 +0100
In-Reply-To: <b39f29efd4db9a2e10c6d1943a22b826cc5232f8.camel@mailbox.org>
References: <20260708-linux-drm_crtc_fix2-v2-0-cf72be75d75a@linaro.org>
				 <20260708-linux-drm_crtc_fix2-v2-1-cf72be75d75a@linaro.org>
			 <1ccfc0b5d1696a8dec4756b675294e7fb41ab5ff.camel@mailbox.org>
		 <899942cc84af7a82a35b4ca34b486c40327fd543.camel@linaro.org>
	 <b39f29efd4db9a2e10c6d1943a22b826cc5232f8.camel@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Philipp,

(sorry for the slow reply).

On Thu, 2026-07-09 at 16:40 +0200, Philipp Stanner wrote:
> On Thu, 2026-07-09 at 15:19 +0100, Andr=C3=A9 Draszik wrote:
> > Hi Philipp,
> >=20
> > On Thu, 2026-07-09 at 14:32 +0200, Philipp Stanner wrote:
> > >=20
> > > On Wed, 2026-07-08 at 16:22 +0100, Andr=C3=A9 Draszik wrote:
> > >=20
> >=20

[...]

> > >=20
> The issue here seems to be that=20
> a) the crtc is made invalid in drm_crtc_cleanup() (memset(0))
> b) the drm_dev can disappear after drm_crtc_cleanup()
>=20
> Both issues stem from the fact that the fence callbacks can keep
> running into the driver.
>=20
> It is true that the fence, being refcounted, can stay alive, but none
> of the callbacks be invoked anymore, and your grace period wait
> fullfill.
>=20
> It is a strict dma_fence requirement that a fence issuer / producer
> signals all its fences before unload.

OK, I missed that. In that case, the patch should indeed be fine as-is.
I'll just do the (minor) updates as you had requested.

Thanks Philipp
