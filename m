Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359407;
	b=ZkLe3/cRZ2m2ES0D1Z8Xrg+sfBIXF41cFluZKo5bRCli7M0+Ng2EbG1KTooJwzSAEQFo
	 XG8aUhky9tmPIs2SFZQ+eWQUms88JBjkLU1jZHEwyCn+5dVPc7jVqfPEC66lEhfZh9NJT
	 MOtwrtA0YxKF7Uvlp2ezeHNndkcvshEadxfjzOcqQQUQa/innb1HejE9esVp3DcaX4cDn
	 /6tAmM7D5LtzoVlnWjiXotyCkqDOlr3dD0EMyxrgl5BwPUraM/x72IkoHKHsUccUW8TbE
	 IFxnikYgpfBASnO61Bo9ovsCQ0xJp+I8R+k/g0uh9A9iJ+CN6Rmn0O8KwLXixVOE8Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359407;
	h=DMARC-Filter:Received:DKIM-Signature:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:In-Reply-To:References:Subject:From:Cc:To:
	 Date:Message-ID:User-Agent;
	bh=wsIZPagL2IQRTwmwls/PPWyxZ/KEnFizPaME6ORoduc=;
	b=mikYkR8C6ckQ5EepJSX/pR78My6eN+6RyB8/qMX3GfOORkHpalAA3Eavyab8mys3ThvB
	 1MbUv5bJVgA7Bvhx9NvPowQk3wxDF0xPNplisVNxI6QPJny58i8b5ycfdnXzHLSYZV5iG
	 AfI0Ehchf4fQNEexYNfPj3kDDMYDboIxP97XaTsvo9F1s1ibvRId1EGSN6dmKYZvQpgIJ
	 X7dKvAfgWZHEhhKgNHODqeAPQyFJTSH/F9godxIqAKvud8+OVqIAmCcdUtwiAd/YJlh0M
	 RPu6EvZ0Y6e2SbyHvdl7gijYEglng7ZzmtWQqeK3pTSBkqMyHRNyp5IKC9QVSnjDoDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=Qe4w790L;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FFC606A31D
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 11:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09FFC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=Qe4w790L
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 066BD63C;
	Fri, 30 Oct 2026 12:21:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793359271;
	bh=arP8i43YmlWYv841bkHPI1ng1w48zW7asMrimOt1l34=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Qe4w790LsPREx/pn6PhbVHL3p+9rmcRi+uqcdJaxY1eNWDLrUBivaRphWgsUxakqF
	 vlZK1Ps2m/mFfLMLqZ9LoGoCL8lwFqsD5vb+EjdQ8O8WvRVTPQqSsR0f/Evn1COsZB
	 2AiatjTXhjV9e8/bSJUppi5d+41/1PQ++IgLVkPY=
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
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Paul Elder <paul.elder@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org
Date: Fri, 30 Oct 2026 11:23:22 +0000
Message-ID: <179335940244.4174506.14920266420860705868@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Laurent Pinchart (2026-10-30 09:35:52)
> The thp7312 driver uses the value of the V4L2_CID_FOCUS_ABSOLUTE integer
> control to index the thp7312_focus_values array. The control is created
> with an incorrect maximum value that can cause an off-by-one read after
> the last array element. Fix it.
>=20
> Fixes: 7a52ab415b43 ("media: i2c: Add driver for THine THP7312")
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

eeep. We should really just teach computers to start counting at 1.

/me ducks.


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

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
