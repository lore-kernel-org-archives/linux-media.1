Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795422672;
	b=qDiPNbeVdo9GXmH+Qu/pDApvQA+JE0M8+XPlqu7BeO8B0CIB//3csAR9Wl+pcWJvRNLx
	 73Ijy4/uLUissQUPfUZ4KjlQLqRZ++M/nFE0E6/+JZQuzJ1VJx6/GoSYLGmZh37sdQkVO
	 xXHbeuQvP9KYrqbHeb7jhptrATJYeVzOQPcr8gPAvNnkV1R57EmKe3LdoyYjnFyeTAMLi
	 vJkHbczXsA9ju/T+cyun28MGrFpb252/plQoijFAOctotxx95T0F6qJPtwKnzl7bZqL6z
	 s39mime+Brt2+rCNoPGzegznHC7l3NTwYgFZiatLO9kaQJ8Pz+kZ6hzWhTIKlVQsrDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795422672;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=7K9+aOsDuHxahvGj47BL/Y7ZLxT71kzKujqYeEjgepA=;
	b=t1mQm6ojktcRJUWk43NKf85WffP6NMr2pVL6sfeLmhUQ0t1fIR5m6tW51t5sRCzUw9Cx
	 VSmCohB/fhvi7JFeeK15Nh6ERdmHZndI8P6mbrF5j1fqoliTAXUjX6qqgpIuj/KM1KGMl
	 fwCNLVJBJHDhQtEVqp8KBZxmrd4moZtBb6U5bRfNCE+R1FKpqSvwPU1b/nQNBFSxa3t7B
	 3oKnyhOkg2X7ABSdCxeyQQwOq39O6hjX1/vHr9ibKBZFaNLocfJjcJxu38/VHH56llJvd
	 dXdim4AOB+2szft4ycOA/GEWMY64huyl/5PTM2elw9raQTtLxQG6f7OVEOvcb6YC9Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EkHxlZQs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60AC606A31A
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 08:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EkHxlZQs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB61D1F000D1
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 08:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795422672;
	bh=7K9+aOsDuHxahvGj47BL/Y7ZLxT71kzKujqYeEjgepA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EkHxlZQsjP+zYDdUv6teNRkpo6zbXtb4zHB+WJR7FalLmoZVk/T5XIWX/a+FNHEix
	 lOsgn0W6P3vRWkg06GY+GW5JBSHwseUK4d7BviBJmbybL3O0f/dtXEtEuezZB9lD5d
	 v/RvnSflgzApa3+tQ8wE3H1v1O24P8JqEWLYAYHz12fcEkKsfULb2lLj7lREIDfEWM
	 Xdbe2douYikOVL1GitVTxyq/rSkUrtdTA7Epj8i33vSe9WEXX/U8faYmCcuAHMQUsY
	 SF4sxIH3FM4Z+P9qzPQWje1xI/sXdLGfI6JW2fvkofkScflwEoIEq3MJyF4YUdxURi
	 TTBabU918kQjw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c1c0c8d61aso1815645e87.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 00:31:11 -0800 (PST)
X-Gm-Message-State: APuU4Z8Dkl3Fm64zVt7JGEMJbtGouelJSDp6fs7X4E8Bf/eMd+8NfG6n
	8LekpdY/LbnvcMxqyAtHOmIcLeGOopsm4kTuvsmSFoWALE8rnwRBYR50R+vYLUoBuGqOIs/A7hs
	lxJP3bPxm+BOF01wZDBupUhw/hbZO5IY=
X-Received: by 2002:a05:6512:ba5:b0:5bf:9f5e:fe0d with SMTP id
 2adb3069b0e04-5c1bc7b4639mr2944106e87.23.1795422670655; Mon, 23 Nov 2026
 00:31:10 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114164933.2657337-1-devnexen@gmail.com>
In-Reply-To: <20261114164933.2657337-1-devnexen@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Nov 2026 09:30:57 +0100
X-Gmail-Original-Message-ID: <CAD++jLk9n_GGtY1J+SpcOODwwocsbVXx5E5yzVHJfUNg_sMJ4A@mail.gmail.com>
X-Gm-Features: Aa3M54q5gLlwxxDHXv-dvL4zSEvM8EU1XrbSQjCzjg7QHjDJYHfM3pc1SEbMgYo
Message-ID: <CAD++jLk9n_GGtY1J+SpcOODwwocsbVXx5E5yzVHJfUNg_sMJ4A@mail.gmail.com>
Subject: Re: [PATCH] media: mali-c55: Serialise the ISP enable in the params
 and stats paths
To: David Carlier <devnexen@gmail.com>
Cc: linux-media@vger.kernel.org, Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nayden Kanchev <nayden.kanchev@arm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 5:49=E2=80=AFPM David Carlier <devnexen@gmail.com> =
wrote:

> Only the capture devices hold isp->capture_lock around the
> mali_c55_pipeline_ready() check and the ISP enable or disable. When the
> last two queues to start are on different video devices, both can see
> a ready pipeline and both enable the ISP. The second call fails with
> -EALREADY and its queue's start_streaming_called flag is cleared, so
> the ISP is never disabled again and every later start fails.
>
> Take capture_lock in the params and stats paths too.
>
> Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Carlier <devnexen@gmail.com>

This looks reasonable, have you tested the patch on hardware?
FWIW:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
