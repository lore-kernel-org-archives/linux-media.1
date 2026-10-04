Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5350B3B14D9
	for <linux-media@vger.kernel.org>; Sun,  4 Oct 2026 11:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791112669; cv=none; b=oPJxVmndtXz7QYZGiDIa1isO4x5sT+/6GpyidcVNE7Domq3M3cKdGDOzfiIXMEBtRCSTyKiNbSARAKn43v/7lmU2bnQRhd8ZyObw6S8beSb9RLQBuhyOooIZqQQFbE1w3yYDofzbT39rJaXP4xVaJWensvyOJXU5pOBTDb4GO0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791112669; c=relaxed/simple;
	bh=Mt2h8LV/WNkvF9rhDfChy/WnatB7KEgOdqPVkHELyr0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RA0lbXMo/mHNtpGdvMM5jU7F+NpYYp+SCWqbVKez6oA8ZTwy2ycygQM0jLVyRk4QzQ8B2CP8Opnn94HQ2h7nsML2XZPi8p1Cl+/jg/flvi9E3sQi87TajaGYbCUgWXlE8/hBDoCL5YVuRKP9RTp/95uC4lHq/jOR6BrGMI0oaQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=kfOPaDaq; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="kfOPaDaq"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b02b1b4cfso328523f8f.0
        for <linux-media@vger.kernel.org>; Sun, 04 Oct 2026 04:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1791112666; x=1791717466; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eL39BrBDAGEfSIelgQ0pH7LJpTqjoDddDfMIFB1yeIQ=;
        b=kfOPaDaqEIMNhO7dQPsTs9YlZQQ7pqhAkhM0hxqjvEHGUsuECSOV6quCq9qhc5XIF1
         3w29LL5QpKrUlcKRzzj+oY96u4NtNe8Ul9yBHhGyymqtjuvW1WeiFbevNW0KQMjN8K93
         AuHqCIiN39iFfuVyNnK8IXi6FPKdOkR+LNllGCcGcQExdyhDwoFr0MDy/obbe2ASwBLZ
         ydkXRibxcI3hPNvsM6e4MW7rVGiiJHjUSbaMUlpX1JE73zInPRLQ5JfA+dRgl0j3+C0F
         b/PZ3Fl5yo9XtRWIyyR/S+mK5JJhTUpiQKb2Pv4JJdz0vX6sREyyieBgiXLbQRq4+CKE
         fgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791112666; x=1791717466;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eL39BrBDAGEfSIelgQ0pH7LJpTqjoDddDfMIFB1yeIQ=;
        b=Iq40fg5uCG1X1/N7KetBjIBTIu2bin8k5WVFscIfSBA8x2pbABVmFbZcNbp7WoAjMc
         oBho+09UFBzMlvWN8gt1vJXq3fT5RRArxogiS6GwrlI9KeBSIbPSPtVlEju59Wyfe0Ag
         +vD14xZIIH677GaXXivu2lQKW4LZtJ7Fi0jE1mTA59O22W/X5kZQjs8bIs8PUIBDyOKA
         evs2euUoLK5ELaq1Hz7IyBh/wk2VAVXvpy3DXpcFDDhQbg47vkUOYsKSKP+5QACLAatj
         3q0JkjiNmzeI+oMSRsINHdhfwhwYsne8JuMAz4uLuP0kgvbmLk4G+f5Q+5ZIizwU9+JA
         bdKA==
X-Forwarded-Encrypted: i=1; AKwUvBzR/tvCA2nUb9tqZS+7+C14EpLMfItMzK+uP+jv9TyYxQxtryjpS5B2plpTnAt1QSzNNZ9ap3VNYp3Tjg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKJFDjODqQ6DEiA2cO2cT1dOzBMij6xUcR1dy/7MsRkYOKxm4ph
	/WYTcIBJNqz5OtZ/IfxgQN8Aot8ADqm3X6QslwqVfShX5PQHEadJiYedGXDlGs8Stno=
X-Gm-Gg: AYBFou1WnB18D+vibWXuGn7EgdQLCq9lbCKrGkIcTv8gM4LfhBLLdNZKHduFGsEEC0+
	6ypUKs5PfaaPVb58iRVqiwiYOawbvcnTmQpu0JYDaC/9rSfRlBZJzqt+hJf2UWLxKMuasxUGVOr
	VZNmMqzFHfcZLUPLYfmiMXZyQo7YRBjAPPn1t+g1QLm6cXqyuN5a214p5Aqat820Pt52qbYq7CP
	ExfROQIttBKZXy0PSZ7zE+0+Mqx0Cx4Nkw77nH2VvQXCMWUGa46IAqeMpAAxY/OStWL6qycP+Si
	CCQlnqd1HGlGObscLBoC5kEBBJInvaLu4xDMbGvCnzHOBHXaLn5gkzzV0+KB40opumOWbtm9WQO
	PSAvfy2eh7pIPg6KkIy56tqCFEpHX6burzjwSx5fD1x7SZfHfzFjPyreHAcN2Nn9y+jr5hPRi/J
	vCDPrNDsEwpucxChM/ev5JxoBuG3JNt2snzeREjYY+0quaNfNKP2zB5ubT9jFxnhkBAweK/s27h
	cqCr5NM7nUiwYRSTbBsVeKoD6ARQCP1bnoR73k2QsHgtFvKt3KmUYXCNgCiAz7IzeCDYDIc3y9W
	JxMumzFOi2WViV8rxpWUWiUPGobiHa58xRWRSu03
X-Received: by 2002:adf:edd1:0:b0:48a:fc74:2156 with SMTP id ffacd0b85a97d-48b067c4defmr16138748f8f.22.1791112666400;
        Sun, 04 Oct 2026 04:17:46 -0700 (PDT)
Received: from ?IPv6:2001:1aeb:400:6f00:73f4:bfe7:a3e6:c16f? (2001-1aeb-400-6f00-73f4-bfe7-a3e6-c16f.ip6.tmcz.cz. [2001:1aeb:400:6f00:73f4:bfe7:a3e6:c16f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b383065a4sm16730166f8f.44.2026.10.04.04.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 04:17:45 -0700 (PDT)
Message-ID: <8ea77a207f6f99d4f20610670e5f88fc56df3faa.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: Initialize context lock before
 firmware setup
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>, tiffany.lin@mediatek.com
Cc: andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com,
 mchehab@kernel.org, 	matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn, 	stable@vger.kernel.org
Date: Sun, 04 Oct 2026 07:17:43 -0400
In-Reply-To: <20260830144827.2701887-1-runyu.xiao@seu.edu.cn>
References: <20260830144827.2701887-1-runyu.xiao@seu.edu.cn>
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
	protocol="application/pgp-signature"; boundary="=-N6yzswm0lU7qZmLZZ6MH"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-N6yzswm0lU7qZmLZZ6MH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le dimanche 30 ao=C3=BBt 2026 =C3=A0 22:48 +0800, Runyu Xiao a =C3=A9crit=
=C2=A0:
> The VPU firmware setup registers a watchdog callback that accesses the
> encoder context lock. Initialize the lock before selecting the firmware
> implementation so the callback cannot observe an uninitialized lock durin=
g
> probe.
>=20
> Fixes: afaaf3a0f647 ("media: mediatek: vcodec: adding lock to protect enc=
oder context list")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:GPT-5
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
> ---
>  .../media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_en=
c_drv.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv=
.c
> index 4e4541b2f..e6cd3817a 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
> @@ -255,6 +255,7 @@ static int mtk_vcodec_probe(struct platform_device *p=
dev)
> =20
>  	INIT_LIST_HEAD(&dev->ctx_list);
>  	dev->plat_dev =3D pdev;
> +	spin_lock_init(&dev->dev_ctx_lock);

I'll have to reject this one for now since the theory of a callback taking =
the
lock while the probe is happening does not hold. The very first place the l=
ock
will be taken is in _open() and that cannot happen before
video_register_device(), which is kept last. Please demonstrate what the is=
sue
you are suggesting if you'd like to see this merged.

Nicolas

> =20
>  	if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
>  				  &rproc_phandle)) {
> @@ -308,7 +309,6 @@ static int mtk_vcodec_probe(struct platform_device *p=
dev)
> =20
>  	mutex_init(&dev->enc_mutex);
>  	mutex_init(&dev->dev_mutex);
> -	spin_lock_init(&dev->dev_ctx_lock);
>  	spin_lock_init(&dev->irqlock);
> =20
>  	snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name), "%s",

--=-N6yzswm0lU7qZmLZZ6MH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCasI12AAKCRDZQZRRKWBy
9D0fAP9lSFbuAS00fVndTGbGVuCWhD9paS0BD1BT5qJExQWHOgD+M/VqV8OTjN0r
TJV6llyZfdBtx5qmuyep65FyxrPNTgs=
=O4hg
-----END PGP SIGNATURE-----

--=-N6yzswm0lU7qZmLZZ6MH--
