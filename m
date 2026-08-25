Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B541A37757D
	for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 06:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787639978; cv=pass; b=OwMlu8R3OOOwF+2rI47xC1uPt8lOnF/Sr6xvn1IinUVN6tocc/5QdMEgZyWo3SpZBXOJzX8MSXS2WglCbL3pLm+5NErBYmAfRMJKvwtOVBQ/V98HomP4X5TUMND3JMDcINRimbxjuU9SKkapkC+XV4WvYKbgENNEVIlmAyoYYr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787639978; c=relaxed/simple;
	bh=HsAAVImpR+A8XryOqWDpIn3rqOMazOReadiUEl2oCs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k2iwULiXiWPdxa5L0a87+oGsGaqffNKKlLMjBj5V8eBIk9+V+WqowozNp/X9AZxAakRvwFo4115BolozDpg/OVZ1xc0pEh7FWYLCvp05WjgsYJIfqoOXzIBHoDxZjw5ubWLX4ymFgq/FVDGG48F2c6BKrK2ZR38NOn9DDyF8vVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YaR2fHoB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HX/Aamue; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YaR2fHoB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HX/Aamue"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787639975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0JLErMPeaxKPaRxh0uTFxprz+OyAV1kx/qgZWOgA6QM=;
	b=YaR2fHoBUwyn0t5Wt/ncOyhsgKN8geo8pLlsfThqBfUq3+/sKg+L2h8JrVMSG3gTRY2P+D
	EwvYQCuqhfYX1odMg3NBB6mnyotjfixut12QoVBa3iZnVV50yumfvsjGJvO+a2a7gmoRC7
	9WeNEg83VrNnBCvM3CyRRR2GEacLjSA=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-2FfZgpxIOquxjIlUQFw8VQ-1; Tue, 25 Aug 2026 02:39:33 -0400
X-MC-Unique: 2FfZgpxIOquxjIlUQFw8VQ-1
X-Mimecast-MFC-AGG-ID: 2FfZgpxIOquxjIlUQFw8VQ_1787639973
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-456ab1a7f2cso8041750fac.3
        for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 23:39:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787639973; cv=none;
        d=google.com; s=arc-20260327;
        b=Z+o4XVU+3wsyPWYf8MWB+aVQXZpx/jFWNKiD0xknUv8cSPD28BBhmWngxOhK+H6qO9
         8/UKzpRrXoJcnuTYv2Kxn93LSt3jBSAI1bCOnV+RWnOXJxlpr/zc+JQ/eakAedFWbucB
         1i5ScS3lBcdjKiY0aa7SlBlVilgEZZ6kp5m29sLm9objm9gDYMp+X22+r/EMJZaFG5xp
         jjzzPYnn7p+C3bM05RJGCf64aE8+FadViSBgiUZNYN3DQZMmBUeTDCQJZiFespXGLetF
         qy8QoArVKbkFdr+wXXTsEizVoYTt8hVZFTzqI20zjgDJWGcC8X58SGKeMl2UkiArl24G
         0qRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0JLErMPeaxKPaRxh0uTFxprz+OyAV1kx/qgZWOgA6QM=;
        fh=mv46L7sagTuVhWiVq6sjuhPMsdCGZg7nDrtDQvjLwQM=;
        b=FRS5EpxyZEEUmz8Mo0/I59TAAmIeMYkYZfnPj9ROtmkOYNLD6ablEsDKys16AKjSeZ
         vCQep/8nzjGKAYMmlH1xRxCTYKz/x70FoD7TZ8judnidrdQgumdQqrrQzuF6x343T7rx
         fSHOglFyvcgxiW442T3Y2L5H0tpA0z2N5CB5Z/ZXaRjL/rAqZ36ufG4Nwg2WxkwPjSCp
         7EzwxwAqYwBlsy0V3KGzjrWcwUv0vdNlxaXewq7/2UJpE1Xlj2iIw+caVXW44RPf1pNU
         4zDul+3uxuVwJCh4YL/hxzQTF9Dg5Q38u6dh2DHDSWj1i4C+9dFBf51FEn1fWCaZ1k78
         bxqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787639973; x=1788244773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0JLErMPeaxKPaRxh0uTFxprz+OyAV1kx/qgZWOgA6QM=;
        b=HX/AamuevLAAzUq4+Kr7Uup7QH4qazNStnysbXL+qng4D5uJfrvQSN5MRwL8pser9N
         Jo/kM/FtP9ma4Jz1NZcCbJ0AP/NM/W4GhX6y6XLOOJtCPoF+OBiQ5R/21bpA7qSUsj7Y
         c96oLqXDTUgNQN+1NXfjGsYBiyA1v3blfiSwxRSTU7hoGHhjFHKGUpyo2hv3M2Njvuqg
         6+vUTFfcF/cJ9kfz8oXXgFnd9LzJI3uG9Vsc4uv1W5DgZQOyTCqegG3WTu3aof+v/xx0
         2trFtQW1xVwcHCwRjoWOspwtAUIHErxnak5KR9yY4Mc2TNaxF0pFeXgyqEwLA5H46Lqo
         CM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787639973; x=1788244773;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0JLErMPeaxKPaRxh0uTFxprz+OyAV1kx/qgZWOgA6QM=;
        b=UncckkTtUdZpNfjQ6/ieO0o49i0cF+we35KFkhxSMqAOuTtby3YakRtvLYDYawZvDo
         I1iPZZH74TpRAxFiglt9EwvvblM6c+bdmtoYdcCFRoqzMyjEgaQabbpaFN7ogmGW6AZa
         /Uel55zRFvW2kars7SdXXnUxY38qZgEYNptPUVnRcR6liNthKgtgpb0M8nMP+1TPp5L4
         RI8V359M2NVBf+W2fvO92xbuJvVjbgK51ZEbOMKx/jZdAhaYXxori5JFZwURsAuWR+CA
         CZFzbRFXVJ6kY8nl223RSP2Saev64x8EbpAnYP99X/SONLZtoKymWjcUOOiHxHjo0xsc
         KsmQ==
X-Gm-Message-State: AFuF++m3k4CySX0Yz/GSVxYYpoeiYI1/rh0pB/jyvCCMa9sIOrhU0Ut+
	zn8pKeN62cjhFiuBJQiCgWwVbljDXXuS/Um8m68pqb3bUS0NsDWByrssZrDNONN21KFw73rXv8k
	3fKg3M+3sEnxnezebeFsHm2D7bPDyxFHXCCQzH7bq5z6ybQglAQA16LFhnsmXVMiAgmXegrpgiH
	X6/xCtNwU2zlPIWQLpNVP7uQAIAd/CaPZbOVWIyLHUjVqua8z5RA==
X-Gm-Gg: AR+sD12PX8MTeubmRol/SlQyDtYC8/A84PKgs9hwCLDSb5ZCu9oHGzkeZf0RPgKHdYV
	TF/joxb2mcv/JmFlqdWMNCkgDFsQKeBdpulWAgyV008d5JwOr03kNRpNaNR4V4xMDUju/dxkYQ+
	1szUgknN2iitkq2Vg4+sz/ksSAsVsTE+dormBas5PujM9aTN+a1xpgrDjt
X-Received: by 2002:a05:6870:2054:b0:448:3eb2:8c8c with SMTP id 586e51a60fabf-46448ec750fmr3942181fac.6.1787639973058;
        Mon, 24 Aug 2026 23:39:33 -0700 (PDT)
X-Received: by 2002:a05:6870:2054:b0:448:3eb2:8c8c with SMTP id
 586e51a60fabf-46448ec750fmr3942169fac.6.1787639972593; Mon, 24 Aug 2026
 23:39:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816194259.151947-1-john.cronin@opcenter.com> <20260824123348.3761049-1-john.cronin@opcenter.com>
In-Reply-To: <20260824123348.3761049-1-john.cronin@opcenter.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Tue, 25 Aug 2026 14:39:20 +0800
X-Gm-Features: AcwNN1XiAg5RSIlTvhW0URXvUCAmOMJv6FyPtOAQBx8t5i2s834CSmkeGY28zWc
Message-ID: <CAEth8oGry5QGabefhq8fWCRxQPtO2Fc-f7N-5t7XQBHgUJaKjg@mail.gmail.com>
Subject: Re: [PATCH v5] media: i2c: imx471: return 0 from get_selection after
 filling crop
To: John Cronin <john@stromback.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, 
	hansg@kernel.org, john.cronin@opcenter.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi John,

On Mon, Aug 24, 2026 at 8:34=E2=80=AFPM John Cronin <john@stromback.com> wr=
ote:
>
> libcamera issues VIDIOC_SUBDEV_G_SELECTION with target CROP (rectangle
> 0) during CameraSensorLegacy bring-up. imx471_get_selection filled the
> rectangle then fell out of the switch and returned -EINVAL.
>
> Compute analog crop in set_pad_format: 2x binning, centered in the
> native array, same idea as imx219. IMX471 2x2-binned 1928x1088 then
> reports CROP as 3856x2176 centered in 4672x3512.
>
> Tested on ThinkPad X9-15 Gen 1 (SONY471A / IPU7).
>
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D2454119
> Signed-off-by: John Cronin <john.cronin@opcenter.com>
> Signed-off-by: John Cronin <john@stromback.com>
> ---
> v5: drop extra braces; declare crop/bin vars at start of
>     set_pad_format (sorted by line length); wrap to 80 cols;
>     keep only the bug/feature in the commit log
> v4: add Signed-off-by for john@stromback.com
> v3: rebase on media-committers next
> v2: compute analog crop in set_pad_format; return 0 after switch
>
>  drivers/media/i2c/imx471.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
> index 4053aed84..0ea18fbb9 100644
> --- a/drivers/media/i2c/imx471.c
> +++ b/drivers/media/i2c/imx471.c
> @@ -421,6 +421,8 @@ static int imx471_set_pad_format(struct v4l2_subdev *=
sd,
>  {
>         struct imx471 *sensor =3D to_imx471(sd);
>         const struct imx471_mode *mode;
> +       u8 bin_h, bin_v, binning;
> +       struct v4l2_rect *crop;
>         int h_blank, ret;
>
>         mode =3D v4l2_find_nearest_size(imx471_modes, ARRAY_SIZE(imx471_m=
odes),
> @@ -431,6 +433,18 @@ static int imx471_set_pad_format(struct v4l2_subdev =
*sd,
>
>         *v4l2_subdev_state_get_format(sd_state, fmt->pad) =3D fmt->format=
;
>
> +       /* Analog crop: 2x bin, centered in native array (imx219). */
> +       crop =3D v4l2_subdev_state_get_crop(sd_state, fmt->pad);
> +       bin_h =3D min_t(u32,
> +                     IMX471_PIXEL_ARRAY_WIDTH / fmt->format.width, 2);
> +       bin_v =3D min_t(u32,
> +                     IMX471_PIXEL_ARRAY_HEIGHT / fmt->format.height, 2);
> +       binning =3D min(bin_h, bin_v);
> +       crop->width =3D fmt->format.width * binning;
> +       crop->height =3D fmt->format.height * binning;
> +       crop->left =3D (IMX471_NATIVE_WIDTH - crop->width) / 2;
> +       crop->top =3D (IMX471_NATIVE_HEIGHT - crop->height) / 2;
> +
>         if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
>                 return 0;
>
> @@ -468,7 +482,7 @@ static int imx471_get_selection(struct v4l2_subdev *s=
d,
>                 sel->r.left =3D 0;
>                 sel->r.width =3D IMX471_NATIVE_WIDTH;
>                 sel->r.height =3D IMX471_NATIVE_HEIGHT;
> -               return 0;
> +               break;
>
>         case V4L2_SEL_TGT_CROP_DEFAULT:
>         case V4L2_SEL_TGT_CROP_BOUNDS:
> @@ -476,10 +490,13 @@ static int imx471_get_selection(struct v4l2_subdev =
*sd,
>                 sel->r.left =3D IMX471_PIXEL_ARRAY_LEFT;
>                 sel->r.width =3D IMX471_PIXEL_ARRAY_WIDTH;
>                 sel->r.height =3D IMX471_PIXEL_ARRAY_HEIGHT;
> -               return 0;
> +               break;
> +
> +       default:
> +               return -EINVAL;
>         }
>
> -       return -EINVAL;
> +       return 0;
>  }
>
>  static int imx471_init_state(struct v4l2_subdev *sd,
> --
> 2.55.0
>

Thank you for working on this.
I tested it, and the patch works. It's good for me.

Reviewed-by: Kate Hsuan <hpa@redhat.com>

--=20
BR,
Kate

