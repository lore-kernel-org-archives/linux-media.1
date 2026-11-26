Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795713696;
	b=nxPwkKCR/kxUunNJkv6UOXh2XXiwqmhfFDDIDk8Ug/auZxxtJpzVFNXRIRv7gW3jMm3k
	 G+uj1yw+e65Pb86BbGuPzaJkewKMYW3YqMy83pWPLre2KZDuYNovznfIO4ftJr0NBwKyK
	 5fiG5QKbP7D5Q9tovNymMIJUKCUz/gWJKBcW3s9mxXCgV1YqWz7aqPclYCqeRdNAqAp5d
	 UQI5YCU9ZUotyYPJhmgh4VsUixGsHzWb8xuA8PfqVWrumUOnBI2F+kSKkGPkXHLiEdUmO
	 1mPlc+NKLmpdKmOZGCEpVM5oEAyhBpLHxnHW5zFl236BFa98XkqG1xeVtH9Uyv/gq5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=sPlvcQPGEEm8iV8OkCIRBzVDRIB9FJj4cVWpQcsCjok=;
	b=vef/Yq1vicig6EZGL8V3zJhXl1+DQm+/mynvwa/RjrSWLYINx7rkizZyT7yJPIBDZ3Er
	 Xnzg5pEZi4V7kTRVH0W8ogyNNUaCb/8SqkkaKaaxzWIXvD9F/DN+sc77yDz258weVm/ce
	 8GQZsmThJ+LQz1wcwSYNHsSs/6cM0NfgFwpoeH2OIPOZAEKkynQX3NgRBDIM+nHRyyA0F
	 i0HJJPIglL2Ht+hUGmA6yqhYvSAqfyiNlhLpV5Oh6QNsa88HCQxCnltamrO4CVepMjqE4
	 SrtZVT9eU20qypexL00ppQkZOb2J3Yk/KyVhsIyOQkpDPO656w4fz3zriIcLejaAE/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d716s3kv;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5C3606A329
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 17:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E5C3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d716s3kv
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so59123725e9.3
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 09:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795713694; x=1796318494; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sPlvcQPGEEm8iV8OkCIRBzVDRIB9FJj4cVWpQcsCjok=;
        b=d716s3kv5+aHT6iAIa8FLXxqKpN/DGQ7HvCP3psWGK7z27rKg1aBxSxcOavNj9JK+y
         je97Q9flPGjeUHtWdqK0HyJWoHbbNHI4wkqxVghBuvveCGQKZ2zkpfUBTJabQZb+uDJf
         +6ggmEGi6Y63bl73WWuJB3nS+H8cz+LV+vcnWoaD/lp7mdE87FF0vegMhKcnMDFXgsfA
         D+dk9/vSQfl2HZva7zbqTBVjBImcHhih7gYOtvMDM9UxrjS0jDX8L2/mQNIM7Ewsmd7F
         A+yPGBsfcEvgA51v+S1i50hoEKYWkMi2OPkPLO7kZYNvUmojm/kbRvaA9TcMZnVHGcep
         o/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795713694; x=1796318494;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sPlvcQPGEEm8iV8OkCIRBzVDRIB9FJj4cVWpQcsCjok=;
        b=WDt8q1iCNZ/3pD+nVHjqOfeJZVQpNRTktSzv7zZXj6HBTUBfdF0keoc1KTZ0C/TWO7
         QgcOPxofuPCoKdz4VOGUkC5wJZ6/ITdk5QDD9yHhNcYGps3eSxIuEV6KLe9tCfPapmvi
         yRbUtTTa1dAtWTtCQDMkkFDS8WLqFqGVrOPGiZzbjfoTiRRQhImuBAWPhsl09f+nNCOF
         7QDgLQs4pmPljQANDI/SbU2soeH6BkOvfrGznPZnhNzy3igtkbVFNW9Q4ojikbvdrrV7
         MCwGAIEX4gi2rygHlguS655jelNqyJ5xOoRYyBy0iKV5g1rmuGQ8Qd990xFU4pz2G1jv
         buNQ==
X-Gm-Message-State: APuU4Z+OUMTUAhwTegoJ/GRCPOSOm7FPPn5AYHJ7sQDVJT3C4/J+p8zc
	yX9o/3HRMOkqVlLuFZFI2BS3OkG1k0C5S2IdMEsoJSsndsX728/wSTAk
X-Gm-Gg: AZFdTZf3YMLsFHKzsrwyIhFdwBBcyjNC3XcJzDV5c+TuPHCYE52Ko/jGjG4X/39XF6I
	DLuInNC1lEgFTRqHQaHmQ9xy6Il3NCxnV1s0NbQUfV39x8VwAT4I8+f/PV5AN+KWh0J0sjW3ySp
	VLq0PHjT4esjEwZ5zB2BHGB3V8TNQVSjHJ3/oaLW2I4KtFSYJyL5B7iE+pjdG59fDl1xJfoZYgW
	3eZ1xcUYBmrw7b3fA1Hhtm2tD7oFbXzfjyyjP6/gv12qiOpW2gF8Ma012vbtKhQX6cNYf8VuvoB
	qjIYsnoHPWJdOSIkYUMgXdBjbZOYivmlsB3Njnmyom5CohSRWRSeE2nP5t/89P/OYjt6u+V9oca
	NN5mM+Vq925HUraEnMljIYj61VfvNJjtamFhVb0bl8MS9i2tbM5BwuMlhctGeacxVkY5gKfJMue
	8hp0yeaFJCcD8Bhl7i8VfmDbSkNByfszuDizGoMJmip+9nBY/CFx81/a12/mLWxq+3huNIFrvSb
	lOBJ88Zru9j3MePY3f34rSPAJz6xpViAZFPbFquLrcDhBpJXo71hdxF52gbGrf93jvfzxQyDFuU
	6DbDFjzS3CyQ3lYMzEoJrTZdC7ZYESs+qhH5sLm7tzJ0EcRuGcfIkiOKbpFIP85vIHoVFu8nXQM
	IWR8Tzxs4oOSFieFTau2fteV+S9AHzehMeBtWO8l+c3YC8M6rNC2aRQY6ol/QJHoVAC2Pdr+o+v
	3L+HlNUJzob4CiRleQgBPUUNPoHgn+iu38y8FHx93B8U+xRiNknVAlznQxPD4LVNpMEsYEmjjRa
	9tRzN8y2QaZlmQ5KRa2obmyO03t+IfRrHRy2RKQ5Gb4ai0YpCtPDnRJ2bnIpVs=
X-Received: by 2002:a05:600c:a55:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4bb889234a7mr403969765e9.16.1795713694512;
        Thu, 26 Nov 2026 09:21:34 -0800 (PST)
Received: from jernej-laptop.localnet (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906e4ce6sm373445195e9.4.2026.11.26.09.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:21:33 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Hans Verkuil <hverkuil@kernel.org>, aiyengar1990@gmail.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
Subject:
 Re: [PATCH 1/2] media: cedrus: fail buffer allocations that do not fit with
 -ENOMEM
Date: Thu, 26 Nov 2026 18:21:32 +0100
Message-ID: <euqQyxcYQfOA1pYfEtNPBw@gmail.com>
In-Reply-To: <20261119-b4-cedrus-generic-fixes-v1-1-f9f50812c85b@gmail.com>
References:
 <20261119-b4-cedrus-generic-fixes-v1-0-f9f50812c85b@gmail.com>
 <20261119-b4-cedrus-generic-fixes-v1-1-f9f50812c85b@gmail.com>
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
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 19. november 2026 ob 17:34:47 Srednjeevropski standardni =
=C4=8Das je Arun Iyengar via B4 Relay napisal(a):
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> vb2-dma-contig allocates with GFP_KERNEL, so a buffer pool that does
> not fit in memory invokes the OOM killer. Set __GFP_RETRY_MAYFAIL on
> both queues: the request returns fewer buffers or -ENOMEM instead.

This is correct only for IOMMU allocation. CMA fails directly.

Please update commit message.

Best regards,
Jernej

>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_video.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_video.c
> index ad4ec3490775..9b2d24e77fdb 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -602,6 +602,7 @@ int cedrus_queue_init(void *priv, struct vb2_queue *s=
rc_vq,
>  	src_vq->dev =3D ctx->dev->dev;
>  	src_vq->supports_requests =3D true;
>  	src_vq->requires_requests =3D true;
> +	src_vq->gfp_flags =3D __GFP_RETRY_MAYFAIL;
> =20
>  	ret =3D vb2_queue_init(src_vq);
>  	if (ret)
> @@ -616,6 +617,7 @@ int cedrus_queue_init(void *priv, struct vb2_queue *s=
rc_vq,
>  	dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
>  	dst_vq->lock =3D &ctx->dev->dev_mutex;
>  	dst_vq->dev =3D ctx->dev->dev;
> +	dst_vq->gfp_flags =3D __GFP_RETRY_MAYFAIL;
> =20
>  	return vb2_queue_init(dst_vq);
>  }
>=20
>=20




