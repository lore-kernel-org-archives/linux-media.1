Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565DF3064B5;
	Wed,  3 Jun 2026 06:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469488; cv=none; b=q1RuFU4HOUBrDE63o+0HveoxjCzndwHZLWSKZyxCeTqrUtoPFrD+Ta/8Nf0xi0NrrtejjDSMJnMxRdyNAVCH1qW8L/rrK+0FHb25upF/KSbdEKDVwGyUr1qM/JcvoWDA0f/ryHo9QjRpuw9jc+13LaG0tmZ+D9anRek1UZKBDUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469488; c=relaxed/simple;
	bh=37wavJyg6SyRdh6uzGTnJBIV1BDGJHxKUDF92QE7Q6Y=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=McpeXMeBVUko2sarwNeinZwsymBTwvQSkqsntRP5jvBBomshZg9rIQP7U5D8IW1xasALUiQCAykPb3/1USFI5wKVsdz7HnfvElVl10gMm2uajFfUp2b22d/eUknrIdLMC02zqeZiynVpYtwPJW6o6+SJztdywQ6Lh1dq1GFO/kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=d0/RtgBZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="d0/RtgBZ"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:476d:c684:fe78:389f:7375])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 755CA12D6;
	Wed,  3 Jun 2026 08:51:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780469460;
	bh=37wavJyg6SyRdh6uzGTnJBIV1BDGJHxKUDF92QE7Q6Y=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=d0/RtgBZUkCQ7kmP+mo1Ttv+Pq6rT82bsC0HVjAR/JlJDtZWxmcE4UW3taxOPW+ye
	 zOxQBpmcYLR7rNQKegn+4vKuKUNjC3XLkmjeBfFLIoS8d83QkkAKqFuTobzCuTuIX6
	 sJkiSqS5vN1NRoqEnunNO95OX3C2MuRM/DAH+1rY=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260522065548.2438545-1-nichen@iscas.ac.cn>
References: <20260522065548.2438545-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] media: rockchip: rkcif: Fix error handling for media_entity_remote_source_pad_unique()
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: mchehab@kernel.org, heiko@sntech.de, hverkuil+cisco@kernel.org, gerald.loacker@wolfvision.net, bryan.odonoghue@linaro.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Chen Ni <nichen@iscas.ac.cn>
To: Chen Ni <nichen@iscas.ac.cn>, mehdi.djait@linux.intel.com, michael.riesch@collabora.com
Date: Wed, 03 Jun 2026 12:21:18 +0530
Message-ID: <178046947892.1525445.1023288239828130272@freya>
User-Agent: alot/0.13.dev20+g31692a239

Quoting Chen Ni (2026-05-22 12:25:48)
> The media_entity_remote_source_pad_unique() function returns an error
> pointer on failure, not NULL. Fix the check to use IS_ERR() and return
> PTR_ERR() to correctly handle allocation failures.
>=20
> Fixes: 501802e2ad51 ("media: rockchip: rkcif: add abstraction for dma blo=
cks")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

Thanks,
    Jai

> ---
>  drivers/media/platform/rockchip/rkcif/rkcif-stream.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drive=
rs/media/platform/rockchip/rkcif/rkcif-stream.c
> index 3130d420ad55..542aa877919d 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> @@ -466,7 +466,7 @@ static int rkcif_stream_link_validate(struct media_li=
nk *link)
>         struct rkcif_stream *stream =3D to_rkcif_stream(vdev);
>         int ret =3D -EINVAL;
> =20
> -       if (!media_entity_remote_source_pad_unique(link->sink->entity))
> +       if (IS_ERR(media_entity_remote_source_pad_unique(link->sink->enti=
ty)))
>                 return -ENOTCONN;
> =20
>         sd =3D media_entity_to_v4l2_subdev(link->source->entity);
> --=20
> 2.25.1
>=20
>
