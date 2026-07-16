Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB69A34CFD0
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 21:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784236738; cv=none; b=NGEi3TBYmEXU1UJY/Sm+DpqcdZswJlwOamhh4kJTY9xwsF0Gjd7bT5NFsmWGnUpPdVNgWRDVZ/kK6DU97fDUV8Q+hrVnAvrwSFAxx6oXbW/7QzCt6tOzRAO4lfELP3HMuuee5/GrNs23cNtMGD2b/4Xp/ERSknOLD8+mFRYxKO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784236738; c=relaxed/simple;
	bh=zID+e/VnFYmXJ7oFah+jcYE0b+DUEnO3XA5uyAS2PN8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S1N8at8GvYjj6TULIYwJHX5d9zhDn6V7U5sCkvK9K8irXINUDLxZfZnGCn72zV85JRPBvdEXR6AVepAsgz6Y0mqRl5dSaYQEgZAHj6Hf0DiHcFLWywVgrjdpk2hdahcwCBrjPc1uDYcqCUn17yTwhKxiCE10XvhPR8ZcXccrCvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=YuUBXbPy; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="YuUBXbPy"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-51c0c45c580so60420611cf.0
        for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 14:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1784236736; x=1784841536; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3mfs6TPohHB4ptVhWPd7wCfPWGeW/kT+9UO9C9aZwuc=;
        b=YuUBXbPyB2AQlxpDsEb3sK25pooHVlBC8Ua2sn3ucgnyvXb5gY/bJt7mk8E1Xn4h1x
         8z0mLBqng0XUhf21oU/l2itA4Q1ZxcOC2eTjR4i5Ol0XvXyDPo2mNHGq5nQdnJtD7D02
         kWxrXB6g6gfZ4Qb1z7ra43+JjqC88U7UYYzbDp5NKCZdcHMXWnzJWEERbdXjYs768tsd
         Jqtft6+oXnaqQa1V0ITImNvq+V9gN4xZ3fL0XqXFm1mX8xyhsuBPOqrH1tH0iP61XXe/
         8LLBgbglSiSwUaP+kgLXQdsXsMzKAHckKuzhCLzmRE0piqnpt38E3XncoBeETPTZQCZ8
         Y4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784236736; x=1784841536;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3mfs6TPohHB4ptVhWPd7wCfPWGeW/kT+9UO9C9aZwuc=;
        b=ote5jo6HCEQQhhuvpuSOPj+cPQnEZku9FFoScJxK+Qagn8z3cWUzWmtPbawAisD1lI
         XDqB0zE2ocqg5b+3ycLRFSJ+K7h7zdH00Knr4DUhtdxolGYUzv3I/FwAfTYI2BaSUPjq
         vK9IWzq/GypOqQZ5d341zN4oRlufhfFGdXenxaIZ5EpLkuG4YBCRuca5uiUcG0MZpcxb
         0XsodU8afkoQ9oZURr1laoKAYuvHDpAyXQWRyH37pTjVnMR6qCbQVVwRocgiDBRqn8/D
         VNOZdCMX1LiBn0pI5p42QiCOO2bCP3aJrcrJOMBmmmfxuZO+4/gpq9eIXSJ3qT46F0K4
         R/9w==
X-Forwarded-Encrypted: i=1; AHgh+RoIz6LOnP9aOuza/EqPFJ0JOxN5n8uKCuu1tDYSqhFL6hciFyFT1GVoT0e1o/EXrlmtw62fqL104bOXww==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl9q+/R8xQtJ/HGTFUeNxW8wtqCa4MOav5lcake9rWc5CJwdHg
	So8ClBnav9x8CwV5OhpJWNYwWKM6V8YKydlSM2iaymy2W3vieGk7q+afBqGwfXqAeOM=
X-Gm-Gg: AfdE7clmTW18+szDSJ+W1DTVc9BMtiCOOPzte/jzktN7tjjxzK5S6OLM88ZzN0VDlZz
	bu3SkYV8NmyGsmA8pKkHFGBRWPZ5usxRXOgmjr13Onvshx9PbxxbSirZ7JXIpfE0tluBH3fPyON
	XX1gLC1hCdPl3dQLreJFxF0PvUX7zp3wzoVIHzH1g9+MgqROKbYyU0YRVWEJ5hLCxJyzZ0viEn+
	DNFqTyb0FqpInKJAITC/tf9DHRSEzsnJUl2xaXc+FShjq7DuZwJbjG2UB8JMORq5EZBtjId5lVa
	x4fAiVNvFz5Gf0FDuTMJwBHZFzHJ+dp6eHQ6bOfY9Wye8UaNywNaCFWlUOykKZbBSSOLQSoRzU/
	9/67ffEaSFM/u144+yuoMg5iq5slcuYKp4kBs2SkdvbYDSOdlU1lgU29h9XSUp1g9H95b3QmTnd
	GBHLQEOjk=
X-Received: by 2002:ac8:5915:0:b0:51a:8c9c:7f52 with SMTP id d75a77b69052e-51e3c340859mr149029421cf.69.1784236735471;
        Thu, 16 Jul 2026 14:18:55 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caaf671e2sm162519051cf.25.2026.07.16.14.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 14:18:54 -0700 (PDT)
Message-ID: <723eb4c02c01e2af19394b715413c198baef687e.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mtk-mdp: unregister VPU watchdog handler
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Guangshuo Li <lgs201920130244@gmail.com>, Minghsiu Tsai	
 <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Matthias Brugger	 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>,
 Tiffany Lin	 <tiffany.lin@mediatek.com>, Yunfei Dong
 <yunfei.dong@mediatek.com>, Hans Verkuil <hverkuil@kernel.org>, Eizan
 Miyamoto <eizan@chromium.org>, Enric Balletbo i Serra	
 <eballetbo@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Date: Thu, 16 Jul 2026 17:18:53 -0400
In-Reply-To: <20260708121910.758166-1-lgs201920130244@gmail.com>
References: <20260708121910.758166-1-lgs201920130244@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-crHtUZ7+2c5Ajf8qSv7r"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-crHtUZ7+2c5Ajf8qSv7r
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 08 juillet 2026 =C3=A0 20:19 +0800, Guangshuo Li a =C3=A9crit=
=C2=A0:
> mtk_mdp_probe() registers the MDP reset handler with the VPU watchdog
> code and passes the MDP device as the private data.
>=20
> The handler is stored in the VPU device and can outlive the MDP probe or
> remove path. If probe fails after the handler has been registered, or if
> the MDP device is removed, the VPU watchdog table can keep a pointer to
> an MDP object that is about to be released. A later VPU watchdog reset ca=
n
> then call mtk_mdp_reset_handler() with a stale pointer and dereference
> freed memory while queuing the MDP watchdog work.
>=20
> Add a VPU watchdog unregister helper and clear the MDP watchdog handler
> from both the probe error path and the remove path before dropping the VP=
U
> device reference.
>=20
> Fixes: ee18fc7b0b95 ("media: mtk-mdp: handle vpu_wdt_reg_handler() errors=
 during probe")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
> =C2=A0.../media/platform/mediatek/mdp/mtk_mdp_core.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 ++
> =C2=A0drivers/media/platform/mediatek/vpu/mtk_vpu.c=C2=A0=C2=A0=C2=A0=C2=
=A0 | 15 +++++++++++++++
> =C2=A0drivers/media/platform/mediatek/vpu/mtk_vpu.h=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 ++
> =C2=A03 files changed, 19 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c b/drivers=
/media/platform/mediatek/mdp/mtk_mdp_core.c
> index 8432833814f3..5ccb7aa925d9 100644
> --- a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
> @@ -221,6 +221,7 @@ static int mtk_mdp_probe(struct platform_device *pdev=
)
> =C2=A0	return 0;
> =C2=A0
> =C2=A0err_reg_handler:
> +	vpu_wdt_unreg_handler(mdp->vpu_dev, VPU_RST_MDP);
> =C2=A0	platform_device_put(mdp->vpu_dev);
> =C2=A0
> =C2=A0err_vpu_get_dev:
> @@ -254,6 +255,7 @@ static void mtk_mdp_remove(struct platform_device *pd=
ev)
> =C2=A0
> =C2=A0	pm_runtime_disable(&pdev->dev);
> =C2=A0	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
> +	vpu_wdt_unreg_handler(mdp->vpu_dev, VPU_RST_MDP);
> =C2=A0	platform_device_put(mdp->vpu_dev);
> =C2=A0	mtk_mdp_unregister_m2m_device(mdp);
> =C2=A0	v4l2_device_unregister(&mdp->v4l2_dev);
> diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/medi=
a/platform/mediatek/vpu/mtk_vpu.c
> index 8d8319f0cd22..5dc50a658c2b 100644
> --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> @@ -437,6 +437,21 @@ int vpu_wdt_reg_handler(struct platform_device *pdev=
,
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(vpu_wdt_reg_handler);
> =C2=A0
> +void vpu_wdt_unreg_handler(struct platform_device *pdev, enum rst_id id)
> +{
> +	struct mtk_vpu *vpu =3D platform_get_drvdata(pdev);
> +
> +	if (!vpu || id >=3D VPU_RST_MAX)
> +		return;
> +
> +	mutex_lock(&vpu->vpu_mutex);
> +	vpu->wdt.handler[id].reset_func =3D NULL;
> +	vpu->wdt.handler[id].priv =3D NULL;
> +	mutex_unlock(&vpu->vpu_mutex);
> +}
> +EXPORT_SYMBOL_GPL(vpu_wdt_unreg_handler);
> +
> +

This extra blank makes checkpatch sad :-\ Since I see nothing else to comme=
nt
about, I'll simply apply this fix on my end.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

regards,
Nicolas

> =C2=A0unsigned int vpu_get_vdec_hw_capa(struct platform_device *pdev)
> =C2=A0{
> =C2=A0	struct mtk_vpu *vpu =3D platform_get_drvdata(pdev);
> diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.h b/drivers/medi=
a/platform/mediatek/vpu/mtk_vpu.h
> index 3951547e9ec5..2ccb481a04cf 100644
> --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> @@ -141,6 +141,8 @@ int vpu_wdt_reg_handler(struct platform_device *pdev,
> =C2=A0			void vpu_wdt_reset_func(void *priv),
> =C2=A0			void *priv, enum rst_id id);
> =C2=A0
> +void vpu_wdt_unreg_handler(struct platform_device *pdev, enum rst_id id)=
;
> +
> =C2=A0/**
> =C2=A0 * vpu_get_vdec_hw_capa - get video decoder hardware capability
> =C2=A0 *

--=-crHtUZ7+2c5Ajf8qSv7r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCallKvQAKCRDZQZRRKWBy
9IGdAQCpnzqE1azFjuacoNMcIeisgg6SaEx51b5TkFJe6O4jWgEA32oGJzf58ofO
+IbTOnKXkPrL4p5Lp8+f60gxG2qdQAY=
=4s28
-----END PGP SIGNATURE-----

--=-crHtUZ7+2c5Ajf8qSv7r--
