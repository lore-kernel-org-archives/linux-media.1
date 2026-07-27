Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78C92931D8
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 07:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785135700; cv=pass; b=e576fGo+HLPybc4sDeD0jHmdpmTACFhKKNq591BYC4wMsPk1aVQiwY9i5tR579plqOm+Dh56ByQhjE0XFxQfT6vz70FbNZhnlp9hcvVawYz3c7irWQw1+Auh3Divug4xXToRCimcMJLlYSjmvXIYcfOc/YMyzKycwVhzpJT177Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785135700; c=relaxed/simple;
	bh=6+DWmTymLXIa5DGF2IVZWoQEaqpz8HM1Oy5oeAQ+sPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R9WjPVVFViui6QHlJCREcVCMhto443gdwbxpbmQtJoDhUa6KVTK7M5muHWQD0/61aJxq5Is/mnR/Xqq+4TI1tnA9Vo6+gV20LeHUPbyY4BypLB5Csh7g7dXyVfUNyzkfECnS307yvTR171ROcvQJaw9GUMasvPS4V3L4oe+0ydQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PLP00WLQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=eLZEMUfO; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PLP00WLQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="eLZEMUfO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785135697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AOwy6qPnNagkYyAnqxhg53lCvTaV+ye9L2nTX35UlJ8=;
	b=PLP00WLQnzPYtX7mhJIvruU6DxVm4ZZ3WKxliJ5oiT9BOfOLCr4J+5/sUPfJgkUsYLOPpq
	SACWLOfcK2zEacOmIzNE2pRtHJYGH/xGMuKC/N6dNMTFbRdRe8lSVMTj90q6aHgiknZZqG
	sdZy78Jzigrs+Ye77h7IVGHt2TJ5SNA=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-po1Sn1H0MuCgy_ET5hIumg-1; Mon, 27 Jul 2026 03:01:31 -0400
X-MC-Unique: po1Sn1H0MuCgy_ET5hIumg-1
X-Mimecast-MFC-AGG-ID: po1Sn1H0MuCgy_ET5hIumg_1785135690
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-451fd211101so969287fac.1
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 00:01:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785135690; cv=none;
        d=google.com; s=arc-20260327;
        b=a3eBuWpMqZOht7yObIgF+2i7iJ4XK6weNyjHe5ZMaRqKkKLtT1fuxrudT5tdWL8Oog
         35rE1kQSubjC+/Ivmy4pQqHpRf0H4vIPd/bcoLvJ4v7va/tfdBQ9bH5N0NIQYqYOi9jw
         iT0t6+ii2Jvfo9N//y94rKBuI/C0+gm5i9CWQ0zZYcMbnxl5RWVUvDFnIMQ17T9J19oy
         45GadYI+xvoViebNOEyjR13X7dVtE3eAjy5aM1bOhbthjY/4zp3j0bB1/rpZuI71OJ0r
         Wagu+j9I2/7v9GykMdkP6nLY6wKOgshQiEarCc4GG5k58m2Dh72igHTndIb+LxIjSEhH
         FILw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AOwy6qPnNagkYyAnqxhg53lCvTaV+ye9L2nTX35UlJ8=;
        fh=n/VkBEX32gjxLZM/leoRy2BpthW7xb+D20Z7+ugvWkw=;
        b=hVU+aITfxeioRpjJfm8WAp4NDujV8/aGId8cWaUeHr/SBxptrgcid2VO9emYOcaerV
         91KTg+vipmv68tJktz8oagE2FvCZyRvlzne/cKnjCoaVQKr0cYEetYFTFi+UFm8DD3ZW
         +JPyfiLIoqgGseiEK0evxSd5qqu5C6lXpsMqFfd1Yqq2nOyk8xbgUVOnDbDfKMUcHOjS
         7asJRrOZsafuEtYAGv3s2RKSVUYnwKcN+IsY/VvP6GTpJLyQHbHitkHQMT5RPa1k05f7
         Uzv99f0EK9bhlN5gXI1lxHaktzL3VYv8dLk40Qx3kthVrFLnhYcrSe9swiBCJgootaSI
         lITA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785135690; x=1785740490; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AOwy6qPnNagkYyAnqxhg53lCvTaV+ye9L2nTX35UlJ8=;
        b=eLZEMUfO/FY/H6OiMC2Skf9uSV0flew/ATtXOBDa5MxK3nlACO6b27d+bpRba7eeyq
         7/Jc8jExdTOUHfKKh216RXjiJQojjNub/FS00wMhdXTZjvjLI0pIR7/JUTUnxkKzyKhe
         nOIAoHhs9T3X/d2D/0HDBSt0KZlAHqfntQL0Xw7IvUVhWNxNkdxEpqaoLQ1gzN0k5gcV
         UFYpCpKnSbwev1zliWudcNo2wRwv52d/z5FwrZXQSACYJGECFYcsYCuzTdjWXwzuMj9g
         Qy/BTPnwfAo7oSCQ6HAfrtj8aZqJFFF0yfYPmYRxASqtvW5NnH4ugn+AMzNANCT/c6BP
         m43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785135690; x=1785740490;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOwy6qPnNagkYyAnqxhg53lCvTaV+ye9L2nTX35UlJ8=;
        b=YLVcWrCqhsWMS+b4UGesBTG0IQJx2PAIUc2oS0Gck1X98ie9MWv2HEp9DzURX/LyrA
         in/JaIXIG50zQFMZVGHojOfGjCijWdSXheXE/XbJmMgv6ZHtrFsM7LWBssvuH9LCJEwD
         Ckz4nptH72gjmxhomNoxUvTW2LPGVZmcwexFnRmPvHhmN6rASiac90aGR7bMsdLuAEJ3
         htJDc9z99LGOQWC5eowwvy9CexDFH1122NQTGSgrXpJ2ZFmdXFo4qi+XDyaXczGmOZ6s
         AlH1VzDv28wjtHYj2z4/TQjGuxpbEM19zXPJsRIy3CCftOq3D89dw/oK9OsebZ2fFZqB
         0Kiw==
X-Forwarded-Encrypted: i=1; AHgh+RqAMvA1XOOeL2lKScblWWv9a7ukGHZDRp9x9bWSLwIDAbCp5rq24+vTLh/IEipk/K5vqx63XrdFXZgTgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCpKjeWNS9dkFGSjv7Gv40h8vhPlHTqBPRkcwJsRYZkOnU0YUF
	IegFEL+l5GOExKk2UGyhvXxyQfDS0KWFfLB5Foyop1Zs495TpCFY8lYugmeIepzOt5CbZ9CpIge
	OJNOmCHL+ciOX5gBgaOvvSQ6j4vRgoBw9IWc4LuuYN1N09PDeWWDjdbW2+vJD9Xe3jzrAseRo7r
	0cAzRnncZUf9yoPcJnvzHhGZ7PgBnqnOVp9EqFWf/C2iFiPzf9Iw==
X-Gm-Gg: AR+sD133LtQ8P2ibOiqgu2XoxcsZxgn6xj679kW/ZDyURZQVdjUmn6zsXm7mBVaMdnA
	wmzdZ/9xJ/tt5Yvf8KT8+HrDa+ggtrzKXTA/8NwTEVionx+npqwduMmNX4UC8R235HSTSHwEa+p
	HKTb2K6TYDgk4gWWqKr1JWM2HPKQr1OqrUTlLl+tN7w4IJuftXa7jj7dH5ew==
X-Received: by 2002:a05:6870:9707:b0:448:558c:d846 with SMTP id 586e51a60fabf-457f28865aemr6163041fac.43.1785135690474;
        Mon, 27 Jul 2026 00:01:30 -0700 (PDT)
X-Received: by 2002:a05:6870:9707:b0:448:558c:d846 with SMTP id
 586e51a60fabf-457f28865aemr6163023fac.43.1785135689959; Mon, 27 Jul 2026
 00:01:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724041417.9921-1-devnexen@gmail.com>
In-Reply-To: <20260724041417.9921-1-devnexen@gmail.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Mon, 27 Jul 2026 15:01:18 +0800
X-Gm-Features: AUfX_mzTXX4-x9rx_tEG2cDD7VXQHdfnAT4RI5CkuXvHHCHWke_HFbi33OQqhQk
Message-ID: <CAEth8oF9zebrEnuTWcVdaSCtYEAtkg7rTgrxJc66GQhcpiDfKg@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx471: Fix uninitialized error value in imx471_set_ctrl()
To: David Carlier <devnexen@gmail.com>
Cc: sakari.ailus@linux.intel.com, mchehab@kernel.org, 
	tarang.raval@siliconsignals.io, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

Thank you for the fix.

On Fri, Jul 24, 2026 at 12:14=E2=80=AFPM David Carlier <devnexen@gmail.com>=
 wrote:
>
> The exposure control write passes the address of the local ret variable
> to cci_write() as its error pointer while ret is still uninitialized.
> cci_write() returns early without touching the hardware when the error
> value it is handed is already non-zero, so a non-zero garbage value on
> the stack silently skips programming the exposure register and makes the
> control write return a bogus, possibly positive, status.
>
> This path runs on every stream start and on every exposure update from
> userspace. Initialize ret to zero so the exposure register is always
> written and a correct status is returned.
>
> Fixes: be1589e567ae ("media: i2c: imx471: Add Sony IMX471 image sensor dr=
iver")
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  drivers/media/i2c/imx471.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
> index 6d358b11e96d..5aca5f2355d6 100644
> --- a/drivers/media/i2c/imx471.c
> +++ b/drivers/media/i2c/imx471.c
> @@ -306,7 +306,7 @@ static int imx471_set_ctrl(struct v4l2_ctrl *ctrl)
>                         v4l2_subdev_get_locked_active_state(&sensor->sd);
>         const struct v4l2_mbus_framefmt *format =3D
>                         v4l2_subdev_state_get_format(state, 0);
> -       int ret;
> +       int ret =3D 0;

Setting ret to 0 can resolve the issue, but the root cause is at lines
337 and 342. Since we don't need the previous error state when calling
cci_write() in imx471_set_ctrl(), the fourth parameter of cci_write()
should be NULL.
So the fix for the V4L2_CID_EXPOSURE and V4L2_CID_VBLANK is

case V4L2_CID_EXPOSURE:
    ret =3D cci_write(sensor->regmap, IMX471_REG_EXPOSURE, ctrl->val, NULL)=
;
    break;
case V4L2_CID_VBLANK:
    /* Update FLL that meets expected vertical blanking */
    ret =3D cci_write(sensor->regmap, IMX471_REG_FLL, format->height +
ctrl->val, NULL);
    break;

This ensures the cci_write() writes the data to the register without
being influenced by an uninitialized ret value and the ret can be set
properly.

>
>         if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
>                 s64 exposure_max =3D format->height + ctrl->val -
> --
> 2.53.0
>


--=20
BR,
Kate

