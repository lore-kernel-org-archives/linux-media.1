Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296354;
	b=SMXhvg5xjkTgn3NtaFGg7PXIw9kUGeQKQ78DE1winlA4pSklo0biNh+od3ntTpAv62bk
	 CR6RSj1bcZDVp8OkfulmIvZLG0isCEG+GHWAjLou3wgk805IdkYrI/Ic3ZmS8tjWYnXQQ
	 ulEOPKq4avckcbpwvziWVHX8HFooiPpFVIOfmYrrPaxHJXUY7ifnxaJozR6e2X+/vQeLe
	 B+Jykmj2eqZhxlXNcIbAmUgYZShdRXtRc3ZxX+RuljoIuebUxi9niE+nxt2NROp+lE4rp
	 nc/DU3DKve20G5wRN9Fp52EolbhISeQ+KL6HIoVpM85yUINd3BigTKH8C36GbDnQ1RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296354;
	h=DMARC-Filter:Received:DKIM-Signature:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:In-Reply-To:References:Subject:From:Cc:To:
	 Date:Message-ID:User-Agent;
	bh=+2Lw3ZTJ9F/sn45sgVbdxRsY/kNrp63i/FJLzgaRKAk=;
	b=5AYg1Nm+eWOK1srV5oNXsh3sz7j+nlkug0vu38VH7SZBUi84yU8aapAUbLLAGWKfRd1E
	 XFwhHQ2irzP4TjxDVEUSXwtH79Vgqzjh+u9HPaeLsjxPM8q/sjSnuGao4x5atFOVmpEFq
	 /JbCPkyKCJ6v8dtU3eGdwA3kpWOvIdHhHZf5PCR9aA+LcpbM2iZkkCIhxz+qhys/vC9Ll
	 KX4+7nxthOLi5pLAG1c1sQz9uTUlHlhAQvQX/92G7ZbJeBYXZHgj+PdunWOA4c8Vq3Ixx
	 Ys0aHgaDbKwk/O4DgQHXNU7bx7F5vi/iG6kYTMKnQNcX+GRU9XHIXIfrgwHhMqLb6aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=FRvhtVKo;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id B0224606A321
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 07:39:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0224606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=FRvhtVKo
Received: from neptunite.rasen.tech (unknown [IPv6:2400:2411:160:2f00:fbd7:eda3:b535:944d])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 544FD268;
	Tue, 10 Nov 2026 08:36:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794296208;
	bh=0uNKVUBMX1A0dwbaKnwm5NCQFSm+OHUZfcBc0pSqZqI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=FRvhtVKo/vYhDwVQ8266csQclZTGG2cRwaO+eUCHkmFdh9KlRDUTwTnZR0g4rjkLC
	 oMvqTGu0npbbudDGEy4D9EglXfY/Gsrti7xIO9fWGIfaVoqYO0P9mV3pN6wJ5PWmTR
	 D/gCAIMsjwei3UafHx9APz50+YD1KSN8ooBS85EM=
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261030093552.3030999-1-laurent.pinchart@ideasonboard.com>
References: <20261030093552.3030999-1-laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] media: i2c: thp7312: Fix maximum value of FOCUS_ABSOLUTE control
From: Paul Elder <paul.elder@ideasonboard.com>
Cc:
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org
Date: Tue, 10 Nov 2026 16:39:05 +0900
Message-ID: <179429634508.272237.15074796776272526527@neptunite.rasen.tech>
User-Agent: alot/0.0.0

Quoting Laurent Pinchart (2026-10-30 18:35:52)
> The thp7312 driver uses the value of the V4L2_CID_FOCUS_ABSOLUTE integer
> control to index the thp7312_focus_values array. The control is created
> with an incorrect maximum value that can cause an off-by-one read after
> the last array element. Fix it.
>=20
> Fixes: 7a52ab415b43 ("media: i2c: Add driver for THine THP7312")
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  drivers/media/i2c/thp7312.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/i2c/thp7312.c b/drivers/media/i2c/thp7312.c
> index f1c7f149c06c..e6bb790dd988 100644
> --- a/drivers/media/i2c/thp7312.c
> +++ b/drivers/media/i2c/thp7312.c
> @@ -1266,8 +1266,8 @@ static int thp7312_init_controls(struct thp7312_dev=
ice *thp7312)
>                                           0, 1, 1, 1);
>                 thp7312->focus_absolute =3D
>                         v4l2_ctrl_new_std(hdl, &thp7312_ctrl_ops,
> -                                         V4L2_CID_FOCUS_ABSOLUTE,
> -                                         0, ARRAY_SIZE(thp7312_focus_val=
ues),
> +                                         V4L2_CID_FOCUS_ABSOLUTE, 0,
> +                                         ARRAY_SIZE(thp7312_focus_values=
) - 1,
>                                           1, 0);
>                 thp7312->focus_method =3D
>                         v4l2_ctrl_new_custom(hdl, af_method, NULL);
>=20
> base-commit: 27285b099fbc5cb2ae3aef20f3bbd7b3c88b3005
> --=20
> Regards,
>=20
> Laurent Pinchart
>
