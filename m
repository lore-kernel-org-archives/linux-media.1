Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98ED0392C2E;
	Wed, 25 Feb 2026 10:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772015738; cv=none; b=Yv+FKmEqvEwCIfN7ULCb600p5IkZ1B57fVOVmUJ5rcIYIRzK5DOMxjhlUnoqG+V9OC9+5EBXJjwWC3NKFy4IzXAGQqPg35ENPgMUByCTzIkgyUWJe59IrKzoDYUiTNtdkpsfbHKEdnDzKDxYlGkXQxso7wbWlW/8kQ1jITwZwRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772015738; c=relaxed/simple;
	bh=hb+mpvmmToFRkdvmVoWvD1xELlIkq++a/igkCkZJ9Ro=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=WlGL1Lz5/iiLOKUu7DhYeqpZJFK6psV6w+uPglDoJSgqwjMmRcY/Rvuoh4Xkkb7gMg2IYiUhWceK0475h27tse0/pgkHyrpFJX1r9+M4mEQRoA4j8xBL74G332jtJKXvrrZ3EE0c0DJXxSgF0/klk9+ynAov+P4JFFiTm7WhX3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aX/17CgY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aX/17CgY"
Received: from thinkpad.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A2C62E47;
	Wed, 25 Feb 2026 11:34:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772015677;
	bh=hb+mpvmmToFRkdvmVoWvD1xELlIkq++a/igkCkZJ9Ro=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=aX/17CgY4joVLDvgjjJ5YXF+cQlxeL3kTLkK/yJX17BwyxYvJTr454m+HOspTjnYX
	 AXeHJ+kSKWufBQI5IZxl17A0HsHjl+w8h29UXtRSt1LeCndIPhpO1qA2GLVahsB7II
	 bJ4KQ7W3eY7Pw6L27zs5YLXh+cXT8JWYKaT/8aU4=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260216-rkcif-fixes-v2-2-ee40931fe0ff@collabora.com>
References: <20260216-rkcif-fixes-v2-0-ee40931fe0ff@collabora.com> <20260216-rkcif-fixes-v2-2-ee40931fe0ff@collabora.com>
Subject: Re: [PATCH v2 2/2] media: rockchip: rkcif: comply with minimum number of buffers requirement
From: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: Collabora Kernel Team <kernel@collabora.com>, stable@kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>, Chen-Yu Tsai <wens@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>, Paul Elder <paul.elder@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, michael.riesch@collabora.com
Date: Wed, 25 Feb 2026 10:35:32 +0000
Message-ID: <177201573211.1569069.5955260325057590452@t16>
User-Agent: alot/0.10

Hi Michael,

Thank you for the patch!

Quoting Michael Riesch via B4 Relay (2026-02-20 08:15:08)
> From: Michael Riesch <michael.riesch@collabora.com>
>=20
> Each stream requires CIF_REQ_BUFS_MIN=3D1 buffers to enable streaming.
> However, it failed with only one buffer provided.
>=20
> Comply with the minimum number of buffers requirement and accept
> exactly one buffer.
>=20
> Fixes: 501802e2ad51 ("media: rockchip: rkcif: add abstraction for dma blo=
cks")
> Cc: stable@kernel.org
> Tested-by: Paul Elder <paul.elder@ideasonboard.com>
> Tested-by: Chen-Yu Tsai <wens@kernel.org>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../media/platform/rockchip/rkcif/rkcif-stream.c   | 44 +++++++++++-----=
------
>  1 file changed, 22 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drive=
rs/media/platform/rockchip/rkcif/rkcif-stream.c
> index e00010a91e8b..f15bee4f7cd7 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> @@ -106,42 +106,42 @@ static int rkcif_stream_init_buffers(struct rkcif_s=
tream *stream)
>  {
>         struct v4l2_pix_format_mplane *pix =3D &stream->pix;
> =20
> -       stream->buffers[0] =3D rkcif_stream_pop_buffer(stream);
> -       if (!stream->buffers[0])
> -               goto err_buff_0;
> -
> -       stream->buffers[1] =3D rkcif_stream_pop_buffer(stream);
> -       if (!stream->buffers[1])
> -               goto err_buff_1;
> -
> -       if (stream->queue_buffer) {
> -               stream->queue_buffer(stream, 0);
> -               stream->queue_buffer(stream, 1);
> -       }
> -
>         stream->dummy.size =3D pix->num_planes * pix->plane_fmt[0].sizeim=
age;
>         stream->dummy.vaddr =3D
>                 dma_alloc_attrs(stream->rkcif->dev, stream->dummy.size,
>                                 &stream->dummy.buffer.buff_addr[0], GFP_K=
ERNEL,
>                                 DMA_ATTR_NO_KERNEL_MAPPING);
>         if (!stream->dummy.vaddr)
> -               goto err_dummy;
> +               return -ENOMEM;
> =20
>         for (unsigned int i =3D 1; i < pix->num_planes; i++)
>                 stream->dummy.buffer.buff_addr[i] =3D
>                         stream->dummy.buffer.buff_addr[i - 1] +
>                         pix->plane_fmt[i - 1].bytesperline * pix->height;
> =20
> -       return 0;
> +       stream->buffers[0] =3D rkcif_stream_pop_buffer(stream);
> +       if (!stream->buffers[0])
> +               goto err_dummy_free;
> +
> +       stream->buffers[1] =3D rkcif_stream_pop_buffer(stream);
> +       if (!stream->buffers[1]) {
> +               stream->buffers[1] =3D &stream->dummy.buffer;
> +               stream->buffers[1]->is_dummy =3D true;
> +       }

Looks good to me!

Reviewed-by: Isaac Scott <isaac.scott@ideasonboard.com>

> =20
> -err_dummy:
> -       rkcif_stream_return_buffer(stream->buffers[1], VB2_BUF_STATE_QUEU=
ED);
> -       stream->buffers[1] =3D NULL;
> +       if (stream->queue_buffer) {
> +               stream->queue_buffer(stream, 0);
> +               stream->queue_buffer(stream, 1);
> +       }
> +
> +       return 0;
> =20
> -err_buff_1:
> -       rkcif_stream_return_buffer(stream->buffers[0], VB2_BUF_STATE_QUEU=
ED);
> -       stream->buffers[0] =3D NULL;
> -err_buff_0:
> +err_dummy_free:
> +       dma_free_attrs(stream->rkcif->dev, stream->dummy.size,
> +                      stream->dummy.vaddr,
> +                      stream->dummy.buffer.buff_addr[0],
> +                      DMA_ATTR_NO_KERNEL_MAPPING);
> +       stream->dummy.vaddr =3D NULL;
>         return -EINVAL;
>  }
> =20
>=20
> --=20
> 2.39.5
>=20
>=20
>
