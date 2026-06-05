Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7602EEE64
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 13:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780666548; cv=none; b=JHTeakOK1yJwlTx2M/EpStWhIIg3z3TW8CIlDQEedm14OsnkcgEQBhIFS3xc3YpOldXz6JlhGONuk0FrVbgf1vgaAB+mCrTfuR4g9RLyAjKZfZQ3pungWn9lMvJ4qltaMkKG2gMgwR72fLpxBLbt8O+NilQuC3SbdK8ipI0slIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780666548; c=relaxed/simple;
	bh=gGMX7twh4/6y1pty/fF/d2gPFX4C1Acg6wC4JWKS8lE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oV4sG68kGLTXH5Ums5xALQaE06FkGXc846iU4mVOmMNzHLeNQOQrt6sKsgWuuQjMXl29CloGArPX97Pi3gCLoSeYtL7PPzUWxK9ykRUND/lhIEzuYMZp9nDa6wQ9iXunc8XF1P0C66yLFDu1/58fxOFlMVtqTjFE5eUWUyoeWM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QDdY87OR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QDdY87OR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D70B11F00893;
	Fri,  5 Jun 2026 13:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780666546;
	bh=7fKlyGdPJZbLDfVKmj1z9h/1ks7B14PHOKPU/+NewVA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QDdY87ORyv6+BNZXu6pRCTvurLG6abJSttDu7c5/il0mBogFaQzLtgw2dXjJMgqvj
	 0cQVWNKzvL2Wd+iVS/oC+9NLC0g//J6vwkslBCLKtYzBhI+mz/ULxbQGy+1TgLjeWE
	 myiMPpN2NnjoRmY2y2ngDCCZTVrEElaBobXbWyN7mysS6dk4Q89d+jK4M/r7iSiA7h
	 KH1QrcrNgVlfaRf2v+5LAYeGjaozawk/wye591AwP5AMCLHeXf1mOi19vDwlZHvMS3
	 NI5rEz0G0N6cHxS9vFZ6zuc6Uj5s3yY5ulimORap2rgal1y0rpVGPU+hODa3VKy1eD
	 VJU+B3YrbXMGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/8] media: qcom: camss: Prepare CSID for C-PHY
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg via B4 Relay" <devnull+david.ixit.cz@kernel.org>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260605-qcom-cphy-v7-3-426c37e9008f@ixit.cz>
References: <20260605-qcom-cphy-v7-3-426c37e9008f@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 13:35:45 +0000
Message-Id: <20260605133545.D70B11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] CSID PHY selection state (`phy_sel`) is not reset when switching=
 the link to the Test Pattern Generator (TPG), potentially leaving the hard=
ware in C-PHY mode for TPG data.
--

commit 79ab3be6b44125cac8b0fb89e7dbad51a804a8bf
Author: David Heidelberg <david@ixit.cz>

media: qcom: camss: Prepare CSID for C-PHY support

This commit updates the CSID configuration to inherit C-PHY information
from CSIPHY, ensuring the CSI2_RX_CFG0_PHY_TYPE_SEL register is properly
set when C-PHY mode is used.

> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/med=
ia/platform/qcom/camss/camss-csid.c
> index 48459b46a981b..bcc34ac9dd212 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
[ ... ]
> @@ -1291,6 +1291,11 @@ static int csid_link_setup(struct media_entity *en=
tity,
> =20
>  			lane_cfg =3D &csiphy->cfg.csi2->lane_cfg;
>  			csid->phy.lane_cnt =3D lane_cfg->num_data;
> +			if (lane_cfg->phy_cfg =3D=3D V4L2_MBUS_CSI2_CPHY)
> +				csid->phy.phy_sel =3D CSID_PHY_SEL_CPHY;
> +			else
> +				csid->phy.phy_sel =3D CSID_PHY_SEL_DPHY;
> +

[Severity: Medium]
Does this leave the phy_sel state uninitialized when the link is switched
to the Test Pattern Generator (TPG)?

In csid_link_setup(), when switching the link to the internal TPG, the newly
added phy_sel field is not updated:

csid_link_setup() {
    ...
    if (sd->grp_id =3D=3D TPG_GRP_ID) {
        tpg =3D v4l2_get_subdevdata(sd);

        csid->phy.lane_cnt =3D tpg->res->lane_cnt;
        csid->phy.csiphy_id =3D tpg->id;
        csid->phy.lane_assign =3D csid_get_lane_assign(NULL, csid->phy.lane=
_cnt);
        csid->tpg_linked =3D true;
        /* csid->phy.phy_sel is not reset here */
    } else {
    ...

If a C-PHY sensor was previously linked, phy_sel will retain the stale value
CSID_PHY_SEL_CPHY.

When streaming starts, __csid_configure_rx() writes this stale phy_sel value
into the CSI2_RX_CFG0_PHY_TYPE_SEL register, even for TPG streams.

Because the TPG bypasses the C-PHY 3-phase encoding, applying C-PHY decoding
rules to TPG data might cause the hardware to misinterpret the stream and
break the test pattern generator.

>  			csid->phy.lane_assign =3D csid_get_lane_assign(lane_cfg, lane_cfg->nu=
m_data);
>  			csid->tpg_linked =3D false;
>  		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605-qcom-cphy-=
v7-0-426c37e9008f@ixit.cz?part=3D3
