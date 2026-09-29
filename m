Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com [74.125.227.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABC32931E1
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 21:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790715680; cv=none; b=M64AqQHZmz4F+K3oRADhIezjlAk4nsnqTCgnBshL9T2jJz8C4v+QG75TlpYlHuT9JbN165h07w+yZgYFOEmGkg93TqTuvIAatacZUhhs6g+/j0Ee6eWag34E98D7jQevgvc29M98gn76AtIWx2bGdJEqWdH9eLuYDU+CqswlF4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790715680; c=relaxed/simple;
	bh=2+ejL0YZjI8InY0H8ZJcRERvW4tbYvlDaxnKFDKpqyw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C+YZOCs3k1QnYbE9AJIStKJnaYU6DhDaCIbwecQuYw2vQeXsuM7UqnISnF4Au553U/TyzPXJEkVJTh8AlpkhLfrfndieb1+yAYmd6ItJcEQAsTYJs83FmVpZ0i9hQoKlERSrkdBjD2XDc5n+OVXqlmsK3SLoy8OquY7t9lgO1Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=01rQEZem; arc=none smtp.client-ip=74.125.227.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="01rQEZem"
Received: by mail-vs2-f40.google.com with SMTP id 71dfb90a1353d-5caec6d2983so3877478e0c.0
        for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 14:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790715678; x=1791320478; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YQOfsK+HlKeVCf8Z4OdzeQNNGZLvLEYB73B+IGrPM8Q=;
        b=01rQEZemfUJg+3qt0rigGhhQqFf/xLI4VumTIP9BDt6uzvbnuFLDEOxHSO45v22ry5
         mrU2aAhScNzE0ZaK43VBPtqMmMsmf3PDHAecdtoOLmYmbvV7ZVkWZpLTOpC7rHEvvK6B
         FUTwM7vuLSB3E/wCy0FqZeSMuocfB1i7P5wKCNU2hi/U+JQ4LChxeJqI5lpGFiMgtIeT
         DT1UgiV4ghL+2LWpGKxrSYUgxN1SeW0ikejSNrt663U+6cHQ81UQnds62RWV1NHmgHIz
         4R+OSW4n7QoAhZFvw0EnxQ0RXGOpcp96x6NwuVikJv35+fh7an7yqJM2+gO8FT6Hbi3f
         QuPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790715678; x=1791320478;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YQOfsK+HlKeVCf8Z4OdzeQNNGZLvLEYB73B+IGrPM8Q=;
        b=scGHPFU9yhmBksd6AkB3WR80Zo7fRDyfebFGenIb5YdEZJIh5PDnTIehmjHubLaFoT
         17DIc1QE+6HDILLJ34dns4WrsH7Ll1BcZ5KPpHS00O2rmobS/GL4TkJq3VDHlKs3TTVE
         DWiBuH1x7gONSnMTRrSHRuLaJ5vBkxd1DUWeC+7HgLgsfuQRG7+b6Nrd4narH75cMON1
         iI3ZKsQJ4WD7/U5yPdcR2JUy3VB51o8TslWwL3CEuVbZSNidmM9VgqilWSxLw9yDhQoD
         K0kfmN+JYUOVIQ2HWnt45+iCBsN9bJGGjwkPl5n2rHR3v4fAQMTKSlr4L+urpgsi2era
         qk4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwhomGW0RgvHqtbL0LvXYJN0Av7gdRALPp4TkYRt5bplHKhZNFGGV+fW5OTf/R6yUtjhg1Am/+s0X+eMw==@vger.kernel.org
X-Gm-Message-State: AFq9FYK5umPZ6DDcebet/DykFaYxl6GKFQmLl4TGxhhG53/q2lEvuZE3
	4FY3mlGF2VSfryTbaZ5MGbPecaHvhYlmg+uzua+UOIt/Coum8BLYthhv0MxrGgwL77E=
X-Gm-Gg: AYBFou3RC6/UZT0/XrAX8PuuQtDg0xb7i6Bd7HL4bgAlOFA8azvi0IwGewcACoiZ+7F
	xYKjQBs0XSdhisuotqsvVWcynljgNVinWXg6n7/cweTL3E2aE2R9wkT/kdQpaQ/IIG8wXZsTp6Q
	1uygt+ro67ZipFjUGnSC0CloI4yl2MJPi0j0c/tM98owr58YXK4jHkOwpO+lMxIV3A8pGnXzyei
	5u0ZmK2nY9TdABOxdz4HsCazLXCpvXXc4cn356NYCPfcRwhkXjNhdbywYtMWpoZYGDG4R/d7Fjw
	uUSf5/6z5WDPkbuYOSXtjEL5qj3udgxxXwZ0eU6hZUc8SkJZlflMawCekfmiKdLWRtjvxLQl7cI
	Mr0BEdmKzubf3Vnpru/0J3PRG5GkgGZ+C4tiXvBoDZKXuRa0JEcX5MeBz9s+j4vG+QvGcECovRz
	eewF7Ov6oQqeQwzox99PuYNogDSNT8KGFsQFR7hYxBFB/9SaFXmqs6C6YjnSroxuLDFdvsE83UL
	MVNQfnRXCA9IxA/gRowf5j4
X-Received: by 2002:a05:6122:1c05:b0:5c9:ae70:e784 with SMTP id 71dfb90a1353d-5d5131cdd4cmr304268e0c.3.1790715678096;
        Tue, 29 Sep 2026 14:01:18 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5d4e778bafasm1226873e0c.5.2026.09.29.14.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:01:17 -0700 (PDT)
Message-ID: <dd1d9010ad1a3ee11fc38923dfa1252992c2b245.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mtk-jpeg: Fix runtime PM leak in
 mtk_jpegdec_worker()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Wentao Liang <vulab@iscas.ac.cn>, angelogioacchino.delregno@collabora.com
Cc: bin.liu@mediatek.com, hverkuil@kernel.org, irui.wang@mediatek.com, 
	kyrie.wu@mediatek.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 mchehab@kernel.org, 	stable@vger.kernel.org
Date: Tue, 29 Sep 2026 17:01:16 -0400
In-Reply-To: <20260917100247.2145872-1-vulab@iscas.ac.cn>
References: <20260917100247.2145872-1-vulab@iscas.ac.cn>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-OaQi5nvPKDU3qCHl6JAX"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-OaQi5nvPKDU3qCHl6JAX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 17 septembre 2026 =C3=A0 10:02 +0000, Wentao Liang a =C3=A9crit=C2=
=A0:
> pm_runtime_get_sync() leaves the device's runtime PM usage count
> incremented even when it fails.  mtk_jpegdec_worker() jumps to
> dec_end on that failure, which does not call pm_runtime_put(), so
> the reference taken by the failed resume is leaked.
>=20
> Use pm_runtime_resume_and_get() instead, which drops the reference
> again when resuming the device fails.
>=20
> Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interfac=
e")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 8c684756d5fc..ed1d5858c942 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1732,7 +1732,7 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
>  	jpeg_dst_buf->frame_num =3D ctx->total_frame_num;
> =20
>  	mtk_jpegdec_set_hw_param(ctx, hw_id, src_buf, dst_buf);
> -	ret =3D pm_runtime_get_sync(comp_jpeg[hw_id]->dev);
> +	ret =3D pm_runtime_resume_and_get(comp_jpeg[hw_id]->dev);
>  	if (ret < 0) {
>  		dev_err(jpeg->dev, "%s : %d, pm_runtime_get_sync fail !!!\n",
>  			__func__, __LINE__);

--=-OaQi5nvPKDU3qCHl6JAX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarwnHAAKCRDZQZRRKWBy
9E83APwLk0zeKWzQOIGJYqNZSVuM65LfwP9mlNJVQ/ss2bY3FAD9EhLs8d7/vbqz
J2u9T+/yffmnP0xvF8G43YoE4lnGZQg=
=AlR/
-----END PGP SIGNATURE-----

--=-OaQi5nvPKDU3qCHl6JAX--
