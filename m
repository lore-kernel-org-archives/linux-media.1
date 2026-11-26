Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795732424;
	b=hjjqfohovULkI6kGcJgFV1E2WJYizHSEfnlU0Q/wKq9sXB9t4wdhL9czvfx/7I4Sb3mw
	 kcKqbfVqRRmmdNpsmtaebZMrXSaF2ra5OhSmUC2WfpONWlIyliDqV2CSIvStoak6sEEk2
	 MVzMnrZCLKC/cKXtWNxMP8bL7mjfNrhK4nZ39A2J3OM9lT9Qj1dXN3kcuiRoHvzFutu+t
	 EQtoxY7gTxX+KMtBFnbexzlSm/5Yl2sItNpYsa0vnl5ny/nIkVNwZHD46H0g6TlnGF/42
	 Ln6FDpo8e40ozXSAHpaZOeDYDQX1ghX7LxQ6wEwKvNbPDTG93+LlyB3jYKjipMgHCvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795732424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 User-Agent:MIME-Version;
	bh=VAuiL2sK9KgcCNS1LCu1ZR6hGD2zR58kg8DLcx9J16M=;
	b=iwtY8+d12Hjt3U+uBkQ2Ja3IvOslZjkDsmPHOAB7lI72TPlvHlZGnS1s8cQ4dBQ+AjCe
	 XZlvf8fmNCoNvCXClxULBXjUSsRByMXmIU1mOXrTeHPNrLZtWTzI7I8Wk+uuHu7FrEU4J
	 moHlIO5ZwXTrBYw/qUvwiA3vPfzKom5xv5qu49nrJCe4dUPYHvtcpPDH7Mnxt7ObXyq2U
	 rl0ZtT0kPc4kKZ4CNSM6uL0pbm3cQxDubgwt+/cjNUoMHJ+HRNIXSMQ3v5akiSbQV0RCK
	 cgwUfGDM+NDldh4vyq6g9zor+StEJ7tqVI4qQEknwBWIKvfcbwRoew58yRqUy2HCT9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cH937ij2;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B439A606A31C
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 22:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B439A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cH937ij2
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-94965745d92so736877685a.2
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 14:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795732423; x=1796337223; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VAuiL2sK9KgcCNS1LCu1ZR6hGD2zR58kg8DLcx9J16M=;
        b=cH937ij2nMOWPoz0H5x4MFp2v9WgHpeKWcVvHdiWudTu1+mHzfN+xsH0r5sysQq0e+
         hVehXwboI8oGm7ES8S2H4MwQDdzT5l+mvdFj7FBrAUlK7UmwWGal5RipzB5JXFweg5OV
         BCWq0X0vj/9/SwWidxEBznO4XKR/YgPKWV/MTC4xdygHfoEetio1WTOSWOlcRWKLc1az
         hvEQLRYLHac0Akgb51dtM3v3qe2d4GHdQ0012O4zn8ArLtd/Va6wP/FN9SUqxNB4loxx
         0R7HDjh3/9Z3bNpp1UvrX/b5i1HgbtRH/KiNgzy7Ewc+gPRJ+L+DcMcx76Ksid8KI89t
         e9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795732423; x=1796337223;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VAuiL2sK9KgcCNS1LCu1ZR6hGD2zR58kg8DLcx9J16M=;
        b=nToqnOW1OVLIzUV7SVZ+b5axzz/KcAxu2EUVf4GfR8uKGkxjQbMrIzRHX+dUeDRJOe
         0lvD4bSVlbyxxaJRegFvRtutA+cojLaiyQ81aV1ktkZ1pInFyt1Oy9b7aZzi266WE3z+
         uGCfyCbJSjEToHAfd31N0PwS48TfrkCreGDL6mLsv+HP0dgt4XaE1S/ECmos+yEMDJ9y
         BlpHaeve+GyyHa1hqpy78gNwdkiobyJaT8yuItq314esiODIBZ75dBTjKDI/QnzU+gry
         Mb06wt7QsiWfKOhWVOOU0kep9ArQG1No+c4ANkYLO8E4Kl4dgLOQvI16s6tX7PButZHb
         UKhg==
X-Gm-Message-State: APuU4Z9SKYaEGvpTSbniWPnIQWstAEv3jTqk8a0OGS+lABovocquwu2T
	TmlNkmCotGfZBmjizYCUzPVoGBIbRllrHitqdJRuXLNJ+xFAJdF88DQOGlcYLIJyNGs=
X-Gm-Gg: AZFdTZetjnRO1X800KyYSZsBRbjUf0miX1gYNGTNPhQUzuz6QsbPbcTk7ag8grHj5Jf
	B1wMXpeGY3n4/S9SjLvSDzqQQrycDw61wg9PiaEiihR5dsjGgMWm0jdmQqdfD+5vTw2P06L6iNH
	X2en3w0CdQAgv0jU4GQFmotrPNV9aaXEZq5hR8fIGo0iA+hHSucruZhJKp9EjqelDZZKoTBFWIR
	hh3QBC++47B7z4q3Hm15PbRW0o+QP7Tz0qPqm+6n7KLGkiG12S6ux0Ba6tgvj6NXXNPBOHLwI2w
	R3pAydqnUCa6o/Gr5qJPj6Kao3ChPPwIGmurP/xHA/J5Q4PHf4XBTjUJcLzU8mbsfdBcDM5pj+v
	dRhy/vuVh9McQNvMz0xgw4KQnQvNDc8uOfPP7HWef42A9QBOPGsxLTaUqBAYsPIGpsM2nFfT2jC
	dVQ/b6CQxzOmQlLdCu8NsN3+YPmlAmw8suo7wIz1vssHwikVoLDuqhnkXMZQyK8UQvLHNhIVyVV
	VItzXkg8ho0YhgTnJDjqP0n81wf2eJRrfQX4VGfyo8a4hxRCCMPkfn5fexKdNgAIXftdcVEjn98
	vgLSyFM9BdH86WRyMR7606IoUXO0+mDfqFIm71A4iGRH308Fb/Smt1Y=
X-Received: by 2002:a05:620a:459f:b0:948:48b8:6736 with SMTP id af79cd13be357-949ba965a61mr3942304285a.16.1795732422570;
        Thu, 26 Nov 2026 14:33:42 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb41a341sm1681380685a.37.2026.11.26.14.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 14:33:41 -0800 (PST)
Message-ID: <c0fc91738531352473bb7c830c4a1b6fb928bf60.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: mdp3: Fix potential use-after-free on
 SCP removal
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Moudy
 Ho <moudy.ho@mediatek.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Thu, 26 Nov 2026 17:33:40 -0500
In-Reply-To: <20261107-0d0c29e10a-media-mediatek-mdp3-1@mail.sdu.edu.cn>
References: <20261107-0d0c29e10a-media-mediatek-mdp3-1@mail.sdu.edu.cn>
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
	protocol="application/pgp-signature"; boundary="=-Wo+4Av8llfy936qRJ+9C"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-Wo+4Av8llfy936qRJ+9C
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,


Le samedi 07 novembre 2026 =C3=A0 14:54 +0800, Guangshuo Li a =C3=A9crit=C2=
=A0:
> MDP contexts can outlive the SCP driver whose data they use for VPU
> teardown. Unregistering only the V4L2 parent neither disconnects the
> video node nor finishes these sessions.
>=20
> Link MDP to SCP and disconnect the video node before draining jobs and
> closing every VPU session. Release hardware dependencies during remove,
> while retaining the software state for the last open file. Balance the
> remoteproc references on session shutdown and failed initialization.
>=20
> This issue was found by our static analysis tool under development.
>=20
> Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver=
")
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

Moudy, can you help with review please. Meanwhile there is enough sashiko
complaints for me to skip.

Nicolas

> ---
> Validation: Changed-object compilation passed with W=3D1 in the recorded
> configuration. No hardware/kernel runtime test or full linked-kernel
> build.
> OpenAI Codex assisted with source review, patch implementation and
> commit-message drafting. The submitter has reviewed the changes.
>=20
>  .../platform/mediatek/mdp3/mtk-mdp3-core.c    | 84 ++++++++++++++-----
>  .../platform/mediatek/mdp3/mtk-mdp3-core.h    |  1 +
>  .../platform/mediatek/mdp3/mtk-mdp3-m2m.c     | 34 ++++++--
>  .../platform/mediatek/mdp3/mtk-mdp3-m2m.h     |  3 +-
>  .../platform/mediatek/mdp3/mtk-mdp3-vpu.c     |  2 +-
>  5 files changed, 96 insertions(+), 28 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drive=
rs/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> index f412aadb5996..9fe42181a08c 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> @@ -108,6 +108,7 @@ int mdp_vpu_get_locked(struct mdp_dev *mdp)
>  err_init_vpu:
>  =09mdp_vpu_unregister(mdp);
>  err_reg_vpu:
> +=09rproc_shutdown(mdp->rproc_handle);
>  err_load_vpu:
>  =09mdp->vpu_count--;
>  =09return ret;
> @@ -118,19 +119,24 @@ void mdp_vpu_put_locked(struct mdp_dev *mdp)
>  =09if (--mdp->vpu_count =3D=3D 0) {
>  =09=09mdp_vpu_dev_deinit(&mdp->vpu);
>  =09=09mdp_vpu_unregister(mdp);
> +=09=09rproc_shutdown(mdp->rproc_handle);
>  =09}
>  }
> =20
> -void mdp_video_device_release(struct video_device *vdev)
> +static void mdp_hardware_cleanup(struct mdp_dev *mdp)
>  {
> -=09struct mdp_dev *mdp =3D (struct mdp_dev *)video_get_drvdata(vdev);
>  =09int i;
> =20
> +=09flush_workqueue(mdp->job_wq);
> +=09flush_workqueue(mdp->clock_wq);
> +
>  =09for (i =3D 0; i < mdp->mdp_data->pp_used; i++)
>  =09=09if (mdp->cmdq_clt[i])
>  =09=09=09cmdq_mbox_destroy(mdp->cmdq_clt[i]);
> =20
> +=09mdp_vpu_shared_mem_free(&mdp->vpu);
>  =09scp_put(mdp->scp);
> +=09mdp->scp =3D NULL;
> =20
>  =09destroy_workqueue(mdp->job_wq);
>  =09destroy_workqueue(mdp->clock_wq);
> @@ -151,10 +157,16 @@ void mdp_video_device_release(struct video_device *=
vdev)
>  =09=09if (!IS_ERR_OR_NULL(m))
>  =09=09=09mtk_mutex_put(m);
>  =09}
> +}
> +
> +void mdp_video_device_release(struct video_device *vdev)
> +{
> +=09struct mdp_dev *mdp =3D video_get_drvdata(vdev);
> =20
> -=09mdp_vpu_shared_mem_free(&mdp->vpu);
>  =09v4l2_m2m_release(mdp->m2m_dev);
> +=09ida_destroy(&mdp->mdp_ida);
>  =09kfree(mdp);
> +=09video_device_release(vdev);
>  }
> =20
>  static void mdp_put_device(void *_dev)
> @@ -213,11 +225,45 @@ static int mdp_mm_subsys_deploy(struct mdp_dev *mdp=
, enum mdp_infra_id id)
>  =09return 0;
>  }
> =20
> +static int mdp_get_scp(struct mdp_dev *mdp)
> +{
> +=09struct device_node *node;
> +=09struct platform_device *scp_pdev;
> +=09struct device_link *link;
> +=09int ret =3D -EPROBE_DEFER;
> +
> +=09node =3D of_parse_phandle(mdp->pdev->dev.of_node, "mediatek,scp", 0);
> +=09if (node) {
> +=09=09scp_pdev =3D of_find_device_by_node(node);
> +=09=09of_node_put(node);
> +=09} else {
> +=09=09scp_pdev =3D __get_pdev_by_id(mdp->pdev, NULL, MDP_INFRA_SCP);
> +=09}
> +=09if (!scp_pdev)
> +=09=09return -EPROBE_DEFER;
> +
> +=09link =3D device_link_add(&mdp->pdev->dev, &scp_pdev->dev,
> +=09=09=09       DL_FLAG_AUTOREMOVE_CONSUMER);
> +=09if (!link) {
> +=09=09ret =3D -ENOMEM;
> +=09=09goto err_put;
> +=09}
> +=09if (!device_is_bound(&scp_pdev->dev))
> +=09=09goto err_put;
> +
> +=09mdp->scp =3D platform_get_drvdata(scp_pdev);
> +=09if (mdp->scp)
> +=09=09return 0;
> +
> +err_put:
> +=09put_device(&scp_pdev->dev);
> +=09return ret;
> +}
> +
>  static int mdp_probe(struct platform_device *pdev)
>  {
>  =09struct device *dev =3D &pdev->dev;
>  =09struct mdp_dev *mdp;
> -=09struct platform_device *mm_pdev;
>  =09struct resource *res;
>  =09int ret, i, mutex_id;
> =20
> @@ -285,27 +331,16 @@ static int mdp_probe(struct platform_device *pdev)
>  =09=09goto err_destroy_job_wq;
>  =09}
> =20
> -=09mdp->scp =3D scp_get(pdev);
> -=09if (!mdp->scp) {
> -=09=09mm_pdev =3D __get_pdev_by_id(pdev, NULL, MDP_INFRA_SCP);
> -=09=09if (WARN_ON(!mm_pdev)) {
> -=09=09=09dev_err(&pdev->dev, "Could not get scp device\n");
> -=09=09=09ret =3D -ENODEV;
> -=09=09=09goto err_destroy_clock_wq;
> -=09=09}
> -=09=09mdp->scp =3D platform_get_drvdata(mm_pdev);
> -=09}
> -
> -=09if (!mdp->scp) {
> -=09=09ret =3D -EPROBE_DEFER;
> +=09ret =3D mdp_get_scp(mdp);
> +=09if (ret)
>  =09=09goto err_destroy_clock_wq;
> -=09}
> =20
>  =09mdp->rproc_handle =3D scp_get_rproc(mdp->scp);
>  =09dev_dbg(&pdev->dev, "MDP rproc_handle: %p", mdp->rproc_handle);
> =20
>  =09mutex_init(&mdp->vpu_lock);
>  =09mutex_init(&mdp->m2m_lock);
> +=09INIT_LIST_HEAD(&mdp->contexts);
> =20
>  =09for (i =3D 0; i < mdp->mdp_data->pp_used; i++) {
>  =09=09mdp->cmdq_clt[i] =3D cmdq_mbox_create(dev, i);
> @@ -373,10 +408,19 @@ static int mdp_probe(struct platform_device *pdev)
>  static void mdp_remove(struct platform_device *pdev)
>  {
>  =09struct mdp_dev *mdp =3D platform_get_drvdata(pdev);
> +=09struct video_device *vdev =3D mdp->m2m_vdev;
> =20
> -=09v4l2_device_unregister(&mdp->v4l2_dev);
> +=09if (!vdev) {
> +=09=09kfree(mdp);
> +=09=09return;
> +=09}
> =20
> -=09dev_dbg(&pdev->dev, "%s driver unloaded\n", pdev->name);
> +=09/* Keep the software state until removal and all open files finish. *=
/
> +=09get_device(&vdev->dev);
> +=09mdp_m2m_device_unregister(mdp);
> +=09mdp_hardware_cleanup(mdp);
> +=09v4l2_device_unregister(&mdp->v4l2_dev);
> +=09put_device(&vdev->dev);
>  }
> =20
>  static int __maybe_unused mdp_suspend(struct device *dev)
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h b/drive=
rs/media/platform/mediatek/mdp3/mtk-mdp3-core.h
> index 05cade1d098e..cf9662bd2792 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
> @@ -134,6 +134,7 @@ struct mdp_dev {
>  =09struct v4l2_m2m_dev=09=09=09*m2m_dev;
>  =09/* synchronization protect for m2m device operation */
>  =09struct mutex=09=09=09=09m2m_lock;
> +=09struct list_head=09=09=09contexts;
>  =09atomic_t=09=09=09=09suspended;
>  =09refcount_t=09=09=09=09job_count;
>  };
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c b/driver=
s/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
> index ad3ae89c231c..ce0efe15866d 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
> @@ -490,7 +490,7 @@ static int mdp_m2m_queue_init(void *priv,
>  =09src_vq->buf_struct_size =3D sizeof(struct v4l2_m2m_buffer);
>  =09src_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
>  =09src_vq->dev =3D &ctx->mdp_dev->pdev->dev;
> -=09src_vq->lock =3D &ctx->ctx_lock;
> +=09src_vq->lock =3D &ctx->mdp_dev->m2m_lock;
> =20
>  =09ret =3D vb2_queue_init(src_vq);
>  =09if (ret)
> @@ -504,7 +504,7 @@ static int mdp_m2m_queue_init(void *priv,
>  =09dst_vq->buf_struct_size =3D sizeof(struct v4l2_m2m_buffer);
>  =09dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
>  =09dst_vq->dev =3D &ctx->mdp_dev->pdev->dev;
> -=09dst_vq->lock =3D &ctx->ctx_lock;
> +=09dst_vq->lock =3D &ctx->mdp_dev->m2m_lock;
> =20
>  =09return vb2_queue_init(dst_vq);
>  }
> @@ -577,6 +577,11 @@ static int mdp_m2m_open(struct file *file)
>  =09=09goto err_free_ctx;
>  =09}
> =20
> +=09if (!video_is_registered(vdev)) {
> +=09=09ret =3D -ENODEV;
> +=09=09goto err_unlock_mutex;
> +=09}
> +
>  =09ret =3D ida_alloc(&mdp->mdp_ida, GFP_KERNEL);
>  =09if (ret < 0)
>  =09=09goto err_unlock_mutex;
> @@ -593,7 +598,6 @@ static int mdp_m2m_open(struct file *file)
>  =09ctx->fh.ctrl_handler =3D &ctx->ctrl_handler;
>  =09v4l2_fh_add(&ctx->fh, file);
> =20
> -=09mutex_init(&ctx->ctx_lock);
>  =09ctx->m2m_ctx =3D v4l2_m2m_ctx_init(mdp->m2m_dev, ctx, mdp_m2m_queue_i=
nit);
>  =09if (IS_ERR(ctx->m2m_ctx)) {
>  =09=09dev_err(dev, "Failed to initialize m2m context\n");
> @@ -609,8 +613,6 @@ static int mdp_m2m_open(struct file *file)
>  =09=09goto err_release_m2m_ctx;
>  =09}
> =20
> -=09mutex_unlock(&mdp->m2m_lock);
> -
>  =09/* Default format */
>  =09default_format.type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>  =09default_format.fmt.pix_mp.width =3D limit->out_limit.wmin;
> @@ -620,6 +622,9 @@ static int mdp_m2m_open(struct file *file)
>  =09default_format.type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>  =09mdp_m2m_s_fmt_mplane(file, &ctx->fh, &default_format);
> =20
> +=09list_add_tail(&ctx->list, &mdp->contexts);
> +=09mutex_unlock(&mdp->m2m_lock);
> +
>  =09dev_dbg(dev, "%s:[%d]", __func__, ctx->id);
> =20
>  =09return 0;
> @@ -647,6 +652,7 @@ static int mdp_m2m_release(struct file *file)
>  =09struct device *dev =3D &mdp->pdev->dev;
> =20
>  =09mutex_lock(&mdp->m2m_lock);
> +=09list_del(&ctx->list);
>  =09v4l2_m2m_ctx_release(ctx->m2m_ctx);
>  =09if (mdp_m2m_ctx_is_state_set(ctx, MDP_VPU_INIT))
>  =09=09mdp_vpu_put_locked(mdp);
> @@ -727,7 +733,25 @@ int mdp_m2m_device_register(struct mdp_dev *mdp)
> =20
>  void mdp_m2m_device_unregister(struct mdp_dev *mdp)
>  {
> +=09struct mdp_m2m_ctx *ctx;
> +
> +=09mutex_lock(&mdp->m2m_lock);
>  =09video_unregister_device(mdp->m2m_vdev);
> +=09v4l2_m2m_suspend(mdp->m2m_dev);
> +
> +=09list_for_each_entry(ctx, &mdp->contexts, list) {
> +=09=09vb2_queue_error(v4l2_m2m_get_src_vq(ctx->m2m_ctx));
> +=09=09vb2_queue_error(v4l2_m2m_get_dst_vq(ctx->m2m_ctx));
> +=09=09v4l2_m2m_streamoff(NULL, ctx->m2m_ctx,
> +=09=09=09=09   V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +=09=09v4l2_m2m_streamoff(NULL, ctx->m2m_ctx,
> +=09=09=09=09   V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +=09=09if (mdp_m2m_ctx_is_state_set(ctx, MDP_VPU_INIT)) {
> +=09=09=09mdp_vpu_put_locked(mdp);
> +=09=09=09atomic_andnot(MDP_VPU_INIT, &ctx->curr_param.state);
> +=09=09}
> +=09}
> +=09mutex_unlock(&mdp->m2m_lock);
>  }
> =20
>  void mdp_m2m_job_finish(struct mdp_m2m_ctx *ctx)
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.h b/driver=
s/media/platform/mediatek/mdp3/mtk-mdp3-m2m.h
> index dfc59e5b3b87..f473f5f20aa2 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.h
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.h
> @@ -27,6 +27,7 @@ struct mdp_m2m_ctrls {
>  };
> =20
>  struct mdp_m2m_ctx {
> +=09struct list_head=09=09=09list;
>  =09u32=09=09=09=09id;
>  =09struct mdp_dev=09=09=09*mdp_dev;
>  =09struct v4l2_fh=09=09=09fh;
> @@ -36,8 +37,6 @@ struct mdp_m2m_ctx {
>  =09u32=09=09=09=09frame_count[MDP_M2M_MAX];
> =20
>  =09struct mdp_frameparam=09=09curr_param;
> -=09/* synchronization protect for mdp m2m context */
> -=09struct mutex=09=09=09ctx_lock;
>  };
> =20
>  int mdp_m2m_device_register(struct mdp_dev *mdp);
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c b/driver=
s/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
> index 67f3001153ae..c1fd639930e5 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
> @@ -62,7 +62,7 @@ void mdp_vpu_shared_mem_free(struct mdp_vpu_dev *vpu)
>  {
>  =09struct device *dev;
> =20
> -=09if (IS_ERR_OR_NULL(vpu))
> +=09if (IS_ERR_OR_NULL(vpu) || !vpu->scp)
>  =09=09return;
> =20
>  =09dev =3D scp_get_device(vpu->scp);
>=20
> base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d

--=-Wo+4Av8llfy936qRJ+9C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawizxAAKCRDZQZRRKWBy
9HTSAQCdw6kGRzy5B9+zXqQyV6Ynggd/rTVkgWVWQNpWAi2INgEAnB8jCbkkM0v6
MPp3EnFDNhhmxlGQsiF3CnGD5qAX7gA=
=PsR4
-----END PGP SIGNATURE-----

--=-Wo+4Av8llfy936qRJ+9C--
