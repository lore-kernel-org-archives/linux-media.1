Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793198617;
	b=E3kTrQapdOEVTV1yVwzxb199WAdPuQAfpUbUHWfDh8iZtXWuaNwf6l2/vH23CDewVvol
	 EEBYzor12Lnr1vncW2E8QNJGmeNc4CvAmRMOZtvHdj42syXByW69aG9OoSL62QYGQ1K05
	 WDqdfBG5mwWJa4AUiq2U9n4dHJigs2cVxxbefUDyoSQYZ3WcIHIMNhc1zkX/YLWTv9ML3
	 zkV51IEZfPK7xvIQzN8cAni1fN+0Fi8ZqMab27utnRS/SMjdsCM26QOeTYaCtHqalyHhj
	 8gYYHtnUZrJTb+u5GzheeoHR+HQgvwWSSeQaYPegIXXysLcETQk6OHRTH4L4Kis9gDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198617;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G1sQ0KTYK5z76bmjBHXp6Cb4x84OHC71FX/y2W7OjeQ=;
	b=B1cc+loPa5dwn7GYmSIyEJyH+RASj5C86o5mJ/5Zo9N53jgnFbwJ1jr94FJpJbnfzLDB
	 3COhb7POPacb44xLwqEiZBhgr0n0Pvg3q0vl5Kvvk0DGFXJ/xWazIY8ronV7lv4iwtg+w
	 qoPU1zZI05Okd5FN4/rwv/RABIwsYBq9IiGsGCmoqyhyIJwvcPCGsaoPehlsMF1DQLAVR
	 mToCdz1kZOi9eMn9FFZYqAc2bCUxf0qeMDuENSk6AiVZMUX9WFwim7vFcFt2Dx/kYlOND
	 HLvrgX5M2vy5Igy7I6TGw4bMIytjvDK/hsqqqHQSP7jkzqNvkVhtScSw7Kpd8KpnKUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FpczSe1P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CCIit2tl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F233606A320
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 14:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F233606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FpczSe1P;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CCIit2tl
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdt1s137566
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 14:43:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G1sQ0KTYK5z76bmjBHXp6Cb4x84OHC71FX/y2W7OjeQ=; b=FpczSe1PtrDQZeMF
	xAcDEWutCYtpKyczMPByF5MOKSZUV3PuS5n+siKPN+V5sXJCpt0P98t5cpnrk+zR
	mOxHXZPp5eHLMelOwCWzai4r9W+jwX7vbl6kHe5//sq996xcgxyZo1Agqdi1gmkX
	hXRuGFqV7KWCAdVazORIDlv0onlm8L49506IDfJHhzulBpRd1ETmFY9942Log2b2
	3fdkj6gCDL74FBpwtj9+yIOgUy4vriUtjZhdZXywkeJffAVEgrcbIRSg8tc2tJ76
	VkzOwDdghTlU3+28wjC8hgyNAu5IEsNv4yROZ3dnHYtLPtXSuOUPljakbOXc/hyZ
	gCuFnA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f92y85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 14:43:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936aa34873bso186493885a.3
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 07:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793198615; cv=none;
        d=google.com; s=arc-20260327;
        b=chWAmxo5uM6KDXsuUtS5+TQotW0tw8wRg40vsJJoOVGPSxBSJT+Xrwgy2xK5cZNmjY
         z+m3qUNhfjteQyo3t4GDkOL8CSe/TbfEgTZ0V4KqRsMRE4wb4USJfueBAoTFQxT24zr6
         5RUOwJ1q5t+i0EIX+xr7DGdFzrRav4ZkMirkJ8bQ+FZoiJ510KaGvoziveFzDL47A091
         db9uOLcjf4GGJQSe1YO4mCUMB4Jx1j0MwbdZoT8FCNJ7dfqWaLeZl5bzhn8bkaBLVCrt
         LI2aHf3M9DvbL05m3Hs9TW9dVwqL1w9EPGAIpiysugLilgNTSu0FTjolaO+mCmu5tS+9
         IN6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G1sQ0KTYK5z76bmjBHXp6Cb4x84OHC71FX/y2W7OjeQ=;
        fh=AmCC6v2Dt+sLqSb4DYYz2ABnUQe5NrTRG1cLsbPr2qg=;
        b=WP7wAjBxttzvoCfoV6gj0jNESlgd/d80j0zg/owAt6Dwg5vOXcrOcBVFMvmDz6q0V1
         xNqlnp8Lg01+Bxq5ta/Rw/c9ZNFxq6z+KpnQ0lF0Dxaz7kIbETORK2/htqc1/c/Eq0M3
         aBU5Un4Ms4j3x2m7MNBvXX6oRe8fWIoMwYWFGU6TwRHb2wJf6XxIxv2+cTAvPteCRiqc
         RVmNYWfjNvEVVHsN4+zYgU4gcCJjxdS0CCGHJk/bv+hz7lpjLYZUfLakPjPIm26WjX/l
         zSkIgshf67U/OVVeiIV6bFnBlvpdqqCD6iSuNCaBLgqrraPaJBIEbFWxqYuIpxZrsYQ8
         AnZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198615; x=1793803415; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G1sQ0KTYK5z76bmjBHXp6Cb4x84OHC71FX/y2W7OjeQ=;
        b=CCIit2tlHHsKedLvbjwfgWe1PgWJBseAnpREr+Li5MYk95ff3nkaaCugJjgiGZd4Ie
         V7FV9qsh36QeglwVVCGQaRYi+jH7/kYEIxIwuZ1w7uy25uIWaQ2/fItwap529vsZcgCq
         IVBiNBQtew7LThYYqD8hjQOWunlVyCWiZ6CfYMFxo5Ge28dAStW7TjxS4yQNvd405yEu
         llbT1I8I/o5yh0QLZ1EQT5uDiKED9koEEfVasG8M2HMF/GkDTZkcRZneef/ht1+C4UZz
         JACqLeRKGGmbMyq0Or8Zhy27baYNJwYduvXgERtST/AFr4djiEv7LUjt/VRBeCSh32lX
         scZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198615; x=1793803415;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1sQ0KTYK5z76bmjBHXp6Cb4x84OHC71FX/y2W7OjeQ=;
        b=Qr/N0P9nEQkrme5LcNVQ0ym1YS9aOKSk9yEh8l8/MLdana3/kGAJ0Fq49KE9FaQc3J
         5Drnp7bt+h15xWx2EYbGlGqcj1nfizZATr+7GqZ8G1A6qVh3hhWR8/eu6gDANUfn8KbC
         5PhtuMST1hfGSv8ifKGhnpmu6Cwb0SOUKSaO5ztnz+xWNBORV3uSUtV6aiY86NCBrEou
         OdKcjt4y9sMJ9gQ2sUjD5QHbGA+70dZbT3aRmElExAejeNrg1+pHk//Ugxn46D4pHbte
         Im/ZIicLlF2Mr4KmpXkFZrc3ZvLRz+OexjAEUbUi3ZKCMO3R0RV4D5WQ/2NwEKKajgyC
         3Ypg==
X-Forwarded-Encrypted: i=1; AKwUvBzf02wieZITZz+m2Y9BVftyws0SPThh1xNXSuUQuhYXefzk5lhQGgLqG5T0PfvaF4fb19z+VvnwW24gnw==@vger.kernel.org
X-Gm-Message-State: AFq9FYI1sMHyx4xQZfdrvk8KxUeG4tQqw468wdfc+llfaI6KSYeTkLjw
	ms/dUpSH8EVIKeNodC009dqpLpChgh1F/05cGvswAqAbtXgVlOa7OfUCNZuUNwOOpQ/fSHvGmiA
	AS9hy789hr8x3NctLq5LvsgMpoRNPxk2U7BpemvoanzuUSGbXJBzfX/zjfYQy+myXcD4UnZc+4O
	bTddP1XDzCrc4QKpJSGbBRWAiAijL33wGkZmrcos6O
X-Gm-Gg: AYBFou2KiCjmpZInJi1VxOfuqhWK6lAtQkLWwabGYQkc9AQceZvhXm1eD3Dxe5Xorl4
	IVU6NtWMRXY0efZYcrudWyrf5t5RSdLcgjk8pyZD7TXPwselUqqD9tuW3nqz6ta1dQqjnfFq9Pn
	NYwZvxzILim5KkLLwVu8qMP91WVlpSoGbfjK35FjcO6s9VTcbR+1KkkSAk06SMAengLAVtsVsAw
	htmo8Qd3ilcsX3/x26pi189LkOHw24jPB9wyj7HKkLj01CmQD+v2sW1k65g2S/ivPYz/7N5Ab8=
X-Received: by 2002:a05:620a:4689:b0:93e:96e0:25a5 with SMTP id af79cd13be357-94408c992a0mr358637985a.41.1793198614686;
        Wed, 28 Oct 2026 07:43:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4689:b0:93e:96e0:25a5 with SMTP id
 af79cd13be357-94408c992a0mr358630485a.41.1793198614157; Wed, 28 Oct 2026
 07:43:34 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026224957.1115370-1-vz@kernel.org> <20261026224957.1115370-4-vz@kernel.org>
In-Reply-To: <20261026224957.1115370-4-vz@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:43:22 +0100
X-Gm-Features: AclHuK_taK_aMlFswRYK0_FTG2aOOebWlCbuvM81f6qI_UtBtqUvnrbidwtdTZI
Message-ID: <CAFEp6-3kDzxU3=37b0KEwGoN-e0or2KzS2RO=h-a3S4ZOdDSgg@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] media: qcom: camss: Allow CSI2 PHY devices without
 CSIPHY resources
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, "Bryan O'Donoghue" <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae20a17 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=h-S-3Q9jTzTep4s1cPEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX9jEGcCRnw9ge
 9qB4cNhtMtlttqqMyL386HHuSxgtQZqC3VSpdYjI93qpgJ5G/2Tuy2HIFlQXPCsiyYtaVxyzE1u
 SLtb4lQJZ75fIDgeSWb2OrNgx2EC4mc=
X-Proofpoint-GUID: wUaPwwvz3pPOe6eOQnBTu04LPlf3nyXt
X-Proofpoint-ORIG-GUID: wUaPwwvz3pPOe6eOQnBTu04LPlf3nyXt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfXzK+EoFQJLrdt
 bOvHeSeq61dIdZHGRjLQS8DFInQJr3/NV+8StazCmd2qBWZ/UV5N5IWHDqWiEGtUjSznRSzpt+Q
 BePAJZZcoLJ+QzSW0qJpWEKB7n5hgEiYursNG1kdnDxkxsaknff8uHbetziUToLwY4+zY2tpl8o
 htI2+oDqWMqYJpWjyO06Z/IclqCw3r605dfsok55f1Nb7CiwUyGHwQYB9le5MNDNosOd+eusuva
 4jGovelDy2blb+DNMgZ+/9PtihKRCqyIdfxf2prgcQWxkfT1TnHXilOPKrrkw6L/erDhPyl8cTK
 xK5JDwKZmKS6kBXF/CbKzebSo2X2R8aJvuydoKUqVfiJ0rGrTWcvKUYeaTXQJxbzu0sgqXNJVZn
 453kRsO0a5RoQTgiXvnkrBLZdtNiENwI+6JwqngNxLWSzuGwVBGxPIRhgeZXzbI0p0e6/MvbgXl
 FgISdazeTlrqjmHBMOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280058

On Mon, Oct 26, 2026 at 11:50=E2=80=AFPM Vladimir Zapolskiy <vz@kernel.org>=
 wrote:
>
> If CAMSS CSIPHYs are supported by the stand-alone CSI2 PHY driver only,
> there is no need to provide description of legacy CSIPHY resources in
> the CAMSS driver, therefore if CSIPHY resources are not given for some
> supported platform, use CAMSS CSIPHY port numbers as CSIPHY identifiers.
>
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-csiphy.c | 16 +++++++++++++---
>  drivers/media/platform/qcom/camss/camss.c        |  8 ++++++--
>  2 files changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.c
> index f99eea2ef228..8ecd514451d2 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -799,6 +799,11 @@ int msm_csiphy_subdev_init_legacy(struct camss *cams=
s,
>         return ret;
>  }
>
> +/* Fallback to generic SDM845 compatible formats for non-legacy CSIPHYs =
*/
> +static const struct csiphy_subdev_resources csiphy_res_phy =3D {
> +       .formats =3D &csiphy_formats_sdm845,
> +};
> +
>  /*
>   * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resou=
rces
>   * @camss: CAMSS structure
> @@ -808,7 +813,7 @@ int msm_csiphy_subdev_init_legacy(struct camss *camss=
,
>   */
>  int msm_csiphy_subdev_init(struct camss *camss, u8 port)
>  {
> -       const struct camss_subdev_resources *res =3D &camss->res->csiphy_=
res[port];
> +       const struct camss_subdev_resources *res =3D camss->res->csiphy_r=
es;
>         struct csiphy_device *csiphy =3D &camss->csiphy[port];
>         struct device *dev =3D camss->dev;
>         struct device_node *ep, *remote;
> @@ -836,8 +841,13 @@ int msm_csiphy_subdev_init(struct camss *camss, u8 p=
ort)
>         }
>
>         csiphy->camss =3D camss;
> -       csiphy->id =3D res->csiphy.id;
> -       csiphy->res =3D &res->csiphy;
> +       if (res) {
> +               csiphy->id =3D res[port].csiphy.id;
> +               csiphy->res =3D &res[port].csiphy;
> +       } else {
> +               csiphy->id =3D port;
> +               csiphy->res =3D &csiphy_res_phy;
> +       }
>
>         snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csi%d", csiphy-=
>id);
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index c54185c93a8a..b0d60e70e4bb 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4796,7 +4796,10 @@ static void camss_detect_legacy_phy(struct camss *=
camss)
>         struct device_node *remote;
>         struct device_node *ep;
>
> -       camss->legacy_phy =3D true;
> +       /* Legacy CSIPHY description implies the provided CSIPHY resource=
s */
> +       camss->legacy_phy =3D !!camss->res->csiphy_res;
> +       if (!camss->legacy_phy)
> +               goto done;
>
>         /* Find first remote-endpoint and determine if its a PHY */
>         for_each_endpoint_of_node(camss->dev->of_node, ep) {
> @@ -4810,6 +4813,7 @@ static void camss_detect_legacy_phy(struct camss *c=
amss)
>                 break;
>         }
>
> +done:
>         dev_dbg(camss->dev, "legacy phy mode %s\n",
>                 camss->legacy_phy ? "true" : "false");
>  }
> @@ -4841,7 +4845,7 @@ static int camss_init_subdevices(struct camss *cams=
s)
>
>                 if (ret < 0) {
>                         dev_err(camss->dev, "csiphy %d init fail\n",
> -                               res->csiphy_res[i].csiphy.id);
> +                               res->csiphy_res ? res->csiphy_res[i].csip=
hy.id : i);
>                         return ret;
>                 }
>         }
> --
> 2.51.0
>
