Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCA354B1A6
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 20:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790714668; cv=none; b=mw5id6UDC1Ga0SJUy03BLD6T9xT+TpG1uFdbiEa7QyKtXt5GSrbZtDQ8ZhXrxsRfb9PX0o6kH3CfaB3htWq32Iy5XGPY9oE9hhsqfwGZFU8/zje+H7I3wglbGEcCrZGSS3MFc2KJ8HsmIVC9D2tOpezFXyg/N1pG/tIJAFotPBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790714668; c=relaxed/simple;
	bh=PeMI4feZR80NGYaeOustHzcRf+r5lTpl9KboZo5vxGU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BKQYqnnyNTmmbAkQFEZaNH82nTccQn3SdzgkjMqzluR0IcUSQcct35dnhsmRmU1qM4C0DMEVFuvHyxmgTMuCIobg0WCPQ1Gq32GpCmh6hEaHcDvLSkw6J0DOVlnEye+xSERAbaA0Vdd2ux64JIdOlB9cTsmbxkSUiBjiHQ+jrOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=qLpsls0v; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="qLpsls0v"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530fa0716f6so52536611cf.3
        for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 13:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790714665; x=1791319465; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FiwtqZphJSml0R4L9uG6YdUip66h9uGgkQ6b6jASY4c=;
        b=qLpsls0v5K8SsbhjxTxqw5PN3tY5A4nNOea37BcJWHtNIOdMnkx/rnVKpgJr+EQHLS
         zC5gNcaSf8d61CfYbaRAdFXl3JJQOitqEbfSLxG0TE0mVnsFr0pH8CZcGdi3nzKrvvvZ
         t3Bg0SgeGdQPHE4eHInc7VajPm56DnpPT/HPIqruzGXtaAUzQ8odY28GpCRhgVkMjXjd
         383Ip7Sk4e6igiofZHVQAyHkjFVVZafzWHrEQK8UuOTSEcZF4MMDGHVijFtngRNDMjNU
         TWNyeEQZoTYv155JfO9es/s+RXODps5WFPQs/V82VHx8r6b5LT9GulXbVBjy3SlsWPDW
         HBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790714665; x=1791319465;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FiwtqZphJSml0R4L9uG6YdUip66h9uGgkQ6b6jASY4c=;
        b=GkF/phfkrOS36NNHVzzs/uB27n2W+8lDiDAs+jL4yBtYEHtBj391mX9B8DUfnzUzU3
         oi0dg+GbLSKhLPCy4PccuwNa/166oHCElheZ3RrgipkZUiVUqqb9CAyWJTRtqd7CBoJv
         KFo22GacMFz/I9gXCFOPyUR0NGnQuwlMCCKtYHGGIowvoCuphDmCRY/DXyXvzQeRoxW/
         U3HSmP6nP7C9ZvGxrVaHW0e7Q3mLJuhP2nVQ3fivptWFOZLEhhmSFzam3u9hT5ZjjXa/
         bGmKWxE0VTmg4WaGgt4nfoBx/igEAlRx+95m/OkhdbQjQwilBeVgBhktODgWeIpYe68y
         Rj/A==
X-Forwarded-Encrypted: i=1; AKwUvBzGU+CbvnYgXwGDfpXWSNVS44F1ihnEyYlw5fmjj1ScDgXBrjXy2gJsmwPFXgP03eHcuoUzuCT2ww30GA==@vger.kernel.org
X-Gm-Message-State: AFuF++lkje8GleS5uFCFR2j6+enTGeugglbgdsuZDBVjS2ytTcBc/28t
	hSAK7EBpdPbZ+EyKTSe0zgnpBkCn8Z5XrRG+cUs4eZJnXI+sSEsns37as2nQFWJkbnY=
X-Gm-Gg: AYBFou0/7J+2BWnsCinL/hdGs3n308eu9j0xPcgS0VG7odPXE5XAelT9TE+N7ykhT9v
	mOgM8cHBcD/M1KBFe3ZLowVzkYYPkaX9Kka4IACnWZXbAhRqWC997ZT5g8va3x9U7uaCotm0/uQ
	LZD2N3SJPB4H3Z2gko6xPQQrN1GCmsHCKAyRtmIT970irHJ8JPZH8byGmHz3g3XomdgNcwYnxYv
	ORKbpaYDWM9ZhfdjHbl5ALEG/2j/+vQUjhlig+g35RMNYpHZS79ktKT8wMsTkabJubUWMwBQA28
	TD8RTGgGa1O5CybD0xa7Z3ZsEf+SnxS65gmAldlFUbSVcwAuL8gVa+jbPINIJ2ftzO7WmoreWtY
	cGyI9Lc96Kye9ZXw2ymO5QFsH5cBhVI7tlP/uYb+WC2tPHx8p5Pp4UWfaRnv7ZU1/g1Z8GHC/9+
	RT8/JwsJPsRX4gKIYWTYtsA6PtfqhcLmkLrQHsho3YFjP7IAjFYUQZ0QtYW0nI77QCOQc4vKyKB
	b4v8AS7vHvkSR1x3TRYkA5t
X-Received: by 2002:a05:622a:229d:b0:530:e429:ea81 with SMTP id d75a77b69052e-5336a4fedd4mr9984921cf.11.1790714665420;
        Tue, 29 Sep 2026 13:44:25 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917987e1439sm3860516d6.21.2026.09.29.13.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 13:44:24 -0700 (PDT)
Message-ID: <b2430afd1f224f12d5b74349399892ad774874c3.camel@ndufresne.ca>
Subject: Re: [PATCH] media: platform: mtk-mdp3: Fix device reference leak in
 mdp_comp_init()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Wentao Liang <vulab@iscas.ac.cn>, angelogioacchino.delregno@collabora.com
Cc: hverkuil@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 mchehab@kernel.org, 	moudy.ho@mediatek.com, stable@vger.kernel.org
Date: Tue, 29 Sep 2026 16:44:22 -0400
In-Reply-To: <20260917100721.2146044-1-vulab@iscas.ac.cn>
References: <20260917100721.2146044-1-vulab@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-fdXlNmHJpaX9m6SU1Zhk"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-fdXlNmHJpaX9m6SU1Zhk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 17 septembre 2026 =C3=A0 10:07 +0000, Wentao Liang a =C3=A9crit=C2=
=A0:
> mdp_comp_init() takes a reference to the component platform device
> with of_find_device_by_node(), but the error path taken when the
> clock array cannot be allocated and the one taken for a component
> without a GCE EOF event return without dropping it.  The caller
> frees the mdp_comp in those cases, so the reference is leaked.
>=20
> Release the reference on both error paths.
>=20
> Fixes: c4320f9721fd ("media: platform: mtk-mdp3: dynamically allocate com=
ponent clocks")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  .../media/platform/mediatek/mdp3/mtk-mdp3-comp.c   | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drive=
rs/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> index 7fcb2fbdd64e..acb2758a7b42 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> @@ -1730,6 +1730,7 @@ static int mdp_comp_init(struct mdp_dev *mdp, struc=
t device_node *node,
>  	struct device *dev =3D &mdp->pdev->dev;
>  	struct platform_device *pdev_c;
>  	int clk_ofst;
> +	int ret;
>  	int i;
>  	s32 event;
> =20
> @@ -1756,8 +1757,10 @@ static int mdp_comp_init(struct mdp_dev *mdp, stru=
ct device_node *node,
>  	comp->clk_num =3D mdp->mdp_data->comp_data[id].info.clk_num;
>  	comp->clks =3D devm_kzalloc(dev, sizeof(struct clk *) * comp->clk_num,
>  				  GFP_KERNEL);
> -	if (!comp->clks)
> -		return -ENOMEM;
> +	if (!comp->clks) {
> +		ret =3D -ENOMEM;
> +		goto err_put_device;
> +	}
> =20
>  	clk_ofst =3D mdp->mdp_data->comp_data[id].info.clk_ofst;
> =20
> @@ -1782,7 +1785,8 @@ static int mdp_comp_init(struct mdp_dev *mdp, struc=
t device_node *node,
>  		if (of_property_read_u32_index(node, "mediatek,gce-events",
>  					       MDP_GCE_EVENT_EOF, &event)) {
>  			dev_err(dev, "Component id %d has no EOF\n", id);
> -			return -EINVAL;
> +			ret =3D -EINVAL;
> +			goto err_put_device;
>  		}
>  	} else {
>  		event =3D MDP_GCE_NO_EVENT;
> @@ -1791,6 +1795,10 @@ static int mdp_comp_init(struct mdp_dev *mdp, stru=
ct device_node *node,
>  	comp->gce_event[MDP_GCE_EVENT_EOF] =3D event;
> =20
>  	return 0;
> +
> +err_put_device:
> +	put_device(&pdev_c->dev);
> +	return ret;
>  }
> =20
>  static void mdp_comp_deinit(struct mdp_comp *comp)

--=-fdXlNmHJpaX9m6SU1Zhk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarwjJgAKCRDZQZRRKWBy
9AzTAP9evVQ/rK1EdzWFKFNoZe85mZQymiN/AnmFnzuCNe0UMAEA2miyExzscQrC
QApgG4LckhviwoffkCjd3tbgtsQ2eAU=
=kfwh
-----END PGP SIGNATURE-----

--=-fdXlNmHJpaX9m6SU1Zhk--
