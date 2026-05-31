Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8050F2D12ED
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 13:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780234879; cv=none; b=IjzmV0Uk89LTwX5Z54UFG9YhElr5/OOcAzCzvvawLFuka6rY2JMk+MNXiOZUyZQI4GkTpUF8MkZW/0/cK32hnxRbYuEhT45SKCU7g7tO5hOcbu+aIlJMNzS48vcBb9aT2e5DLklAM4rdApko7QPGeLu7042op6wdAOCn+pF/lQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780234879; c=relaxed/simple;
	bh=MfXhrbVIzL0T5Dh1GgwaMp31yQ+I66bMOr/72NoSRJg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gvqoGeKjDhlBeapk9Ah3yPKmulaFxrZMPuzhLvm8jyH/Utded564mWx7E8tRPCw0V/+Dp8ny9ycLcTvQy+lZASt8OVK2irluMDWngZg0s62aTmEqX9aPSDguL6v4Rqc9NyjN+QaVfEZe42g2zdeq4rDk6hSvEZuPf5KM/JrMxCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dhABRYVJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dhABRYVJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE2BC1F00893;
	Sun, 31 May 2026 13:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780234878;
	bh=k5oTkjWoNwKSsK+SUShSxLw+kJz2NIyB7isuzlaw+ns=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dhABRYVJf1pACsh50/vjWt04S4CNUGdfyIc7NiHLtZ3maLXS7KNbkBtY8jyC0A8FT
	 XsiyKkANGZfimuGpIJ/xT/SJ5uKlyt31ug+r2hROSIB2p8Ye+PTsJS+JYtoa6Tb6F6
	 RQZJ+JebVlAENcQcuZlGR3+eWYnjfKXE5IQjD9u/cPOy6x7tnBW6zVrvk5kjDkCTYq
	 XCXCkELd/uFMMLivfUzbRyMvNvLYPgftToAmhko98gdGWAiOUowHYbuwgObt3jPBHG
	 TV+s0fkvcemAUqcozyemxdUu1dfo2yT1Y85mr9gmJjYaSJyp8mRguz5R88IDCZRwbg
	 TuClqsPkFBFdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH WIP v5 3/9] media: qcom: camss: Prepare CSID for C-PHY
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg via B4 Relay" <devnull+david.ixit.cz@kernel.org>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260531-qcom-cphy-v5-3-6be0f62b4d65@ixit.cz>
References: <20260531-qcom-cphy-v5-3-6be0f62b4d65@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 31 May 2026 13:41:17 +0000
Message-Id: <20260531134117.EE2BC1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incomplete Feature Implementation: C-PHY hardware bit is not confi=
gured for CSID-340 and CSID-680 variants.
- [Medium] Uninitialized state / stale configuration of `csid->phy.cphy` wh=
en linking to the Test Pattern Generator (TPG).
--

commit b157b71066f303abbc0818a0b783c946436aebc5
Author: David Heidelberg <david@ixit.cz>

media: qcom: camss: Prepare CSID for C-PHY support

Inherit C-PHY information from CSIPHY, so we can configure CSID
properly.

CSI2_RX_CFG0_PHY_TYPE_SEL must be set to 1, when C-PHY mode is used.

> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/driver=
s/media/platform/qcom/camss/camss-csid-gen2.c
> index eadcb2f7e3aaa..52ef730b10553 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> @@ -183,6 +183,7 @@ static void __csid_configure_rx(struct csid_device *c=
sid,
>  	val =3D (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
>  	val |=3D phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
>  	val |=3D phy->csiphy_id << CSI2_RX_CFG0_PHY_NUM_SEL;
> +	val |=3D csid->phy.cphy << CSI2_RX_CFG0_PHY_TYPE_SEL;

[Severity: High]
Does this patch miss applying the C-PHY configuration to other CSID variant=
s?

The global csid_link_setup() function parses the C-PHY mode and sets
csid->phy.cphy. However, only __csid_configure_rx() in camss-csid-gen2.c
is updated to write this state to the hardware register.

Other variants like CSID-340 and CSID-680 also support C-PHY, and their
respective files define the CSI2_RX_CFG0_PHY_TYPE_SEL bit. Because their
__csid_configure_rx() functions do not apply csid->phy.cphy, do those
platforms remain hardcoded to D-PHY mode, causing silent failures when
C-PHY is enabled?

>  	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG0);
> =20
>  	val =3D 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;

[ ... ]

> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/med=
ia/platform/qcom/camss/camss-csid.c
> index 48459b46a981b..8d5c872f84ed5 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -1291,6 +1291,7 @@ static int csid_link_setup(struct media_entity *ent=
ity,
> =20
>  			lane_cfg =3D &csiphy->cfg.csi2->lane_cfg;
>  			csid->phy.lane_cnt =3D lane_cfg->num_data;
> +			csid->phy.cphy =3D (lane_cfg->phy_cfg =3D=3D V4L2_MBUS_CSI2_CPHY);

[Severity: Medium]
Should csid->phy.cphy also be reset when linking the Test Pattern Generator?

In csid_link_setup(), if the CSID was previously linked to a C-PHY sensor,
csid->phy.cphy would be true. When linking the TPG:

drivers/media/platform/qcom/camss/camss-csid.c:csid_link_setup() {
        ...
        if (sd->grp_id =3D=3D TPG_GRP_ID) {
                tpg =3D v4l2_get_subdevdata(sd);

                csid->phy.lane_cnt =3D tpg->res->lane_cnt;
                csid->phy.csiphy_id =3D tpg->id;
                csid->phy.lane_assign =3D csid_get_lane_assign(NULL, csid->=
phy.lane_cnt);
                csid->tpg_linked =3D true;
                /* csid->phy.cphy is not updated here */
        ...
}

Will __csid_configure_rx() then unconditionally write the stale
csid->phy.cphy state into the CSI2_RX_CFG0_PHY_TYPE_SEL register, causing
the hardware to misinterpret the D-PHY equivalent TPG output and corrupt
the stream?

>  			csid->phy.lane_assign =3D csid_get_lane_assign(lane_cfg, lane_cfg->nu=
m_data);
>  			csid->tpg_linked =3D false;
>  		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260531-qcom-cphy-=
v5-0-6be0f62b4d65@ixit.cz?part=3D3
