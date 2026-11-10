Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794293777;
	b=OfZ0oe2yX5WYlhcQ1CFCLrV1uF6vx1/SV2YOh6f6IeT36XqtGoHuAI3uVbxuU7ji5yNP
	 3o+GK+2catfTPhJff6/P6ODPankjGVrK/hnMUGs2ms3VyWlocqjKgdeLrOySPL9UKMLTL
	 hVUBk7n1f+zuJIfdtcLGi7n85/S3A6ltYOa3f7t4RS7kiWo4YXEYDUzcBCG6RpK7tx26+
	 jl4CM3TXEvBUyIENTNNRTTU6OHQy/9hVDaLhHvTALGVaRcyFM7Nql61lDswUbPPUeBZtu
	 dxorhoxDlP44VMOjH/llKmxVplLrwUKIl+z6Youn1cBubRN63jrAe9bJlKyQbQKBE3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gv29PVlI4VqmDiKhon5UhDcIb7a0X1gnIhvI6TovMh8=;
	b=cJr3XZe9BCxNcudVAE2LVdBaUytEp2PoKw6ikD5yzLh75zOoG6YyXIMFLozV89DtjT2A
	 BSnluXGR9FGndCk2KeYq3V+8Q9sYXorOJmhG2A+L6q/6NwbSiy0Tkg6+nBBbgoWZGrZMe
	 V3/CIb0jx88sG0VvCfMP2PbW1xqR/zHl4pvhwlS61TBeXb5oDTiUf0jqpTbKuts9cnk6w
	 gmxW7e4uCCQn8mfi7jivvexUSnqJqjMHDqk+6p30ex0XRNZq00v1zlPJa8VCZrSc/oaIk
	 Uhzn5uGGWcEcJpeKs2WHta06j4hogGYNVPNVWOgV4YpwrHRhHIlnO48xP/ury4oLY1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=INdN09EU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1823D606A325
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 06:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1823D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=INdN09EU
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36ff9c9da34so2891749eec.1
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 22:56:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794293776; cv=none;
        d=google.com; s=arc-20260327;
        b=DhVZ2VTElSwgM3GJnAR4cWudzJAXXkNxq7dZJr+iwSmvtYUC1cwa4qnp/ND7fJwrC6
         epbIp85zjbMPrUWhHNoIFu65CQmcn7j3qo0zXyoVd07uBQvjUgsKo7ddgYlwVSp9sFuA
         JqP7LfuJjqIV5XsJ+lpR+qNpShHxKxDej2DcmOpwlEiRmr0uYts5l0OjHwvcLSfOr8uH
         1gPGAKDKsgPO1X0RpBL/D4IEUejPFLMjG8ccztEh/xyV//BWxVokE3jWNU5otcfD6dOG
         wIvm/4DEx6z/ax8qr28Qj/kKvNBHT9fNtbTT7D0nj28IR25gkESmVS/o8ixgrkJGvFx3
         l9Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gv29PVlI4VqmDiKhon5UhDcIb7a0X1gnIhvI6TovMh8=;
        fh=AVBptOg8gZajo+oV7qqd8gLnLMLzpMC+g3dA1O8jHTc=;
        b=DeLeQ0vPXayel/9nB0CezO050zOgen56rT5xuZ11tPkNRwWYaVtQndxBofWTE486XD
         Vc50z3Bojr9lpfkIqVxYuxnWGQDL1tEOiEftB4PAeIlkcHOtPbtvF06spSsU5A9Cli3X
         MFuT9OOoJjbKMlPM+aKcjRVpR9fqTTMU2J58mysIPz3eiglyUwYOGiFXE7nWA/RrnNY5
         WYeD8bLhFhAUcO56DUO+d90KQ4KJZxR0FKfvo93/xjGXxfhEKCHqMBhu3QmBr35cmM6l
         BPMBUIWW0DMwkKjewx1G883SVx51iGuj9fx2LzJjBgUDHicDzQtpgsgX+l9BKKCpGhpG
         g3Og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794293776; x=1794898576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gv29PVlI4VqmDiKhon5UhDcIb7a0X1gnIhvI6TovMh8=;
        b=INdN09EUKAvnXut6IrHtz1ZA3BVBr9e6B+gc+BjVw2cdz0pXF2Db7DalKQlpoAatMo
         TrIc7sDgF+cmqIsTWU6zycIytSh7Tg+7F0mLcts/6UjZDwdeysRU/UJkYrgCTGNAQKsp
         vTCSDGFsS+dIpLgli2l9b+sk7Io2i2hXi473fGg0jOCCJ8IvlkiNKSjtHWP19eQ32u+1
         z073VEPcI5i0u/KLM56dnc1j692W2S+GSwEiLlG7M5oniuV+Q621Yr0j71BIYRh2p8Qe
         FtMXzJxpGWxI9m6LhaxBVUbfXmdAinIc1jjWTG2fpEZ1PljUHdNipQl39fSq99zBVvj5
         4ahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794293776; x=1794898576;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gv29PVlI4VqmDiKhon5UhDcIb7a0X1gnIhvI6TovMh8=;
        b=QM0Dqzd6H4rRRYDz0VdmkFdlTbnkr3xe/XQxlpWyXFW8dRb9X5xMJpFwgWVPdsaX4b
         r6CZJpsUgkaB8CrJfCG2pYFVjBR7JloV6Xtc5ByzmgiaVtCeaNiRWADT0Jdw0QLnGVvW
         5px7Ji2pNAAWm8pefKWAC7BKmfQqHBA6dROScU3g2BY3BIfz13+r/839txhszEdTf6tC
         rzWsaObLmK6iKTyjFO5DOV6Amrdo32UHb/WUoi6guAM7E3+dHM1BK3phUIulOZSXsjwK
         oBB9jnWq/ZMPMqo3Txud5U7CYe4XBlWzHDpdsQppV3YBQfaXYj6E7QljbRjq1eqpiiy3
         FCGA==
X-Forwarded-Encrypted: i=1; AL+hErG+E2q5oOqK10yCDXu6Zp+WDnz8OPMDTWO9B2DMzCIDgc6u3/rfiF8ZdHITiP1MPQtxD+Fc9u/o7Nc4eQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/hN7ZE5iu3SKo1b2Xy8+8uCjsdC2TaCU9GYNI+RZ+hYjHkpzmY
	C6hQSNPdkC7sOSclXrRDRdwfA7tiu9iH3PXm1aSn3E95aw5b4NXGpYpa8G4YVx1DS61ZvIFUEh1
	XbkWkjFaA/rOT8x+wQi5e8PmBbDbXpL2Virdf5Lo=
X-Gm-Gg: AYBFou1eMSlA94BFya8bzBqtCHKLtp9/XCOgjaiOdcmmYmGXh5Sg3mX44yxWUVV7szA
	ql8PQXmrwbmgrqs8FSY14e0tcmHGHl0+fcIXl23Aa4BYeVewVZeahk4/IqdT0i0wyC8OFyINo0T
	/AXueMTBNsn9t5xbI/zC6x9c5ekWDitA714doYix5W4iTWRwSI9bgEnULw9igGFhBPPTKPempWX
	DAHgHy4pQyyAJE+ukNPLEHM0b3KNsWDJpEdUL+iNLPAmyYs0EbSwNpsCG0G81+0Uvipoba0YjtM
	UYQcmLuscPdunZvLyPGY4ltVhx/TKH8ePlsukbSxdtNeTUNdgz3IbZk3E5lxkNu2ZRq0w+rlRen
	LXZStKMdOben2OklCm/C13zSJxNT0fFq4ph7uz9Na98zpk6M7QhixcYL0T7/jzIoWk+BS
X-Received: by 2002:a05:7301:18ad:b0:36a:1294:59e0 with SMTP id
 5a478bee46e88-3751f462675mr2049626eec.24.1794293775810; Mon, 09 Nov 2026
 22:56:15 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109045307.1167784-1-hj351016@gmail.com>
In-Reply-To: <20261109045307.1167784-1-hj351016@gmail.com>
From: khj <hj351016@gmail.com>
Date: Tue, 10 Nov 2026 15:56:04 +0900
X-Gm-Features: AclHuK-sqbPvnKyMJ84OYA3XkEoK-7U1o08imiJGCwa7o_TRyFoPrgq9Cv4NOyQ
Message-ID: <CAGr5VtOXSDR+ZAHy-e+baVjvWSeUCrShdaAF23zLRfbwiJ7W3w@mail.gmail.com>
Subject: Re: [PATCH] media: mgb4: cancel err_work on teardown to avoid use-after-free
To: Martin Tuma <martin.tuma@digiteqautomotive.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please disregard this patch -- it is an accidental duplicate of

  [PATCH] media: mgb4: cancel err_work before freeing the vin device
  https://lore.kernel.org/linux-media/20261106043541.1902730-1-hj351016@gma=
il.com/

which is the same one-line fix and already carries

  Reviewed-by: Martin T=C5=AFma <martin.tuma@digiteqautomotive.com>

Please apply that reviewed version instead; sorry for the noise.

Thanks,
Hyunjung

2026=EB=85=84 11=EC=9B=94 9=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 1:53, h=
yunjungg <hj351016@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> From: Hyunjung Ko <hj351016@gmail.com>
>
> The err IRQ handler (err_handler) schedules vindev->err_work
> (signal_change), which dereferences vindev (vindev->mgbdev, vindev->vdev,
> vindev->queue). mgb4_vin_free() disables and frees the err IRQ, so no new
> err_work is scheduled, but it never cancels an err_work that was already
> queued by the last interrupt before kfree(vindev). As err_work runs on
> the system workqueue with no timing bound, it can execute after vindev is
> freed, dereferencing freed memory -- a use-after-free.
>
> Cancel err_work after the interrupts are freed (so it cannot be
> re-queued) and before vindev is freed, mirroring the existing
> cancel_work_sync(&vindev->dma_work) in stop_streaming().
>
> Fixes: 0ab13674a9bd ("media: pci: mgb4: Added Digiteq Automotive MGB4 dri=
ver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
> ---
>  drivers/media/pci/mgb4/mgb4_vin.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/mgb4/m=
gb4_vin.c
> index b247854..64b7a9b 100644
> --- a/drivers/media/pci/mgb4/mgb4_vin.c
> +++ b/drivers/media/pci/mgb4/mgb4_vin.c
> @@ -1068,6 +1068,8 @@ void mgb4_vin_free(struct mgb4_vin_dev *vindev)
>         free_irq(vin_irq, vindev);
>         free_irq(err_irq, vindev);
>
> +       cancel_work_sync(&vindev->err_work);
> +
>         device_remove_groups(&vindev->vdev.dev, module_groups(vindev->mgb=
dev));
>
>         mgb4_i2c_free(&vindev->deser);
> --
> 2.43.0
>
