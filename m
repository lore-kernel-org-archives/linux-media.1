Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D656509F11
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 13:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789650355; cv=pass; b=W4yWxuIdh/z9KprxnRAegB7a/sS+envQHnMRet3uSgGrXHz8agT8dUmCtkYy+JJU4DAGEcj2+/5VipLqOtDhuy1PBEc4H4nahcYWE1gyv/25IwquuZMSlQex8wnyDL2I8g3ucb/8akWmAiAkB2RHjnkAJyocrWMaEk4hVkQKo0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789650355; c=relaxed/simple;
	bh=8IL+9d/MUTxeEtCVy0R3kJv8unHhhXQBzwpVyCii6HA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pjMM21Bato9atsT5syKbHKobxsHY2m9iWwn+H+0VQ2+Pj+enBG+jQvUInhmVCWTO36rI1QM9wdEer3eLr/oHkWL1t+QpfVEyNPuuh/hNd4ucvQaFyhdY7pShK8a1oyPu6D76BYCLYMZguwPAoezWn/FwjvTCt7aVzDf4i5nCTkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ItBkVj2B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LhqC9v8E; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ItBkVj2B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LhqC9v8E"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HBovOM2013552
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 13:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dcpLG6DMML8Weg9JX/ObKCjgeBkwW9cRNv7d9wKBVx8=; b=ItBkVj2Bg01+5DVV
	A9ABdg3vzKHIuZtLrjMF/Es16yvvPGMZsEHLHt+Z9ymwOyQ+6OLWB1P8yVJH4BYl
	Fk7nT1p7Nhm74LxmZnbUu5yqAK0PTn0reKoeYiLJInqOgBhj27UCOZpWAhb31ecY
	qqZ7aU0Xy23DuklGx1/ocnQTY85eORgZw2cIKDgdR1M7WFEO0qN7tQlN8mZZQFMG
	mS6tmwN+pRFGRgm/pIcjqmU49r9LQn/tJAP5UB/ZOLVALnw4Jb3a4zV23/e47BDr
	Z6mIxYSKKA/0yPQbOczWLi8Swb2FiV5ED5FiWCSe8L11ihed2L7B1ebIu6Uq4NPC
	b7WpWQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfppg8ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 13:05:46 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c5a1a0b54eso1697945b6e.0
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 06:05:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789650345; cv=none;
        d=google.com; s=arc-20260327;
        b=qiPSBzMbjMBFEOxCu3MCFjRbx1G0A73Zzr6gsCY5uhAwqVQkdMCnx3NUYFLUxx31kQ
         v8qracZrif0FGUUF60n1q7nmkWSWrfSqCPgQjIDoem+CRc1O7cR3u1jWgr9uUsD5VXW1
         TcxjGIxhmg4wo8XrShb1WOT622grt0tRV7WOinecX4NgrdLDQubrgvXhSSOFW3puPYiZ
         rYQhElpnx5zzNebZ0fogfMmUGEaQV8H08vDguD61MNz/vr1uciteZ+USqtIGmOEoUKaw
         7R5tHjsxYfc9BgphDdQiiNebyzoN6mw7yQZPiudIFpj9E8Cgk2/G7qR1Sd4AdrK+W89/
         TVOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dcpLG6DMML8Weg9JX/ObKCjgeBkwW9cRNv7d9wKBVx8=;
        fh=ohBM7bX244Fw3BeesJKYo1VdYx1QptLZF3LZfRK4z+s=;
        b=MVEXA/JDNK8OwdsPAC64JSeyszNGZO59BXuO6HonAajOBzPMyES+Tdvx3xA1sYJ3YN
         +pJbYWP+VELc4CN/j59Cbhhps40FKNpw6jlRDpY8SJxgnoAVX9iOtIlRvG9l5N+vpYeP
         bai9G9pYnjTSaDZc1AHXAnY49DkiVcPqPxLeWuYHNlBGPY/EX2nLbtS9gAN4PURIHq08
         vmnYMbv6g4VKgaa5Sie2JFX0q/jdA+Lo/Y7j5WlrnUz+aM2RKuV9dGw12RO9VXPy7vQE
         FhuWjBstYqB5VHMxBwt982aBQLs5JfM98jkP2EiikckyR0/x0Rv1AQdWEPnKtnZX7CX4
         7TLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789650345; x=1790255145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dcpLG6DMML8Weg9JX/ObKCjgeBkwW9cRNv7d9wKBVx8=;
        b=LhqC9v8Etozb6CdBUdxiq2wuFrg/A1nP6C5fWiXxiQuHngsOZmO+wjdmikCKCL7CpR
         EozXy7ON8M1D73P8YvoRWjB4bEl9IU4zHi3AKSFtGUYTdITTXvE3C0F5Rph3rl6jr9Ii
         GwoR1TKA4az18KlKJTk9hK2sZp7lj73ilrGeZjvTVURRGidhyD43jENE/brvx3i+s1zP
         fP+xrjiqBpjavPfTDYA6Fmtfbt6nmIRh4S2NLQJxEB5P7T8NNJv6RLdUpB9P4wA2sYia
         /pFrtXM7O2R/VSK/RiOOGPrmR2HkukPlgnmKPxbRB338ZFc1zYfD9Wpo5uiyMBmq3Ozk
         65tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789650345; x=1790255145;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcpLG6DMML8Weg9JX/ObKCjgeBkwW9cRNv7d9wKBVx8=;
        b=YdLftDzYbcxLUCOryZbfizDpDhW+KVCb4GJGEf88D/jAfzRdM/0+JWLIUrMC0LP0Iw
         eu/X9d6ld8P5Ok7Orp4R/2gusmC7lDdOr2EeVD9sYmR9ZTdZPEs4TfDeAupAmGfKLVRb
         lm+Ryu3Aat2htdEJD/+NV2eFfqULmCHhUYFOtXcG8XAeugWCtTNSqDDTWTAAUNdKVTCd
         1rUmm6zQRzJx5bbsRwRZdeGxYyd/QNsaQiW9PmC7T+BZfy13NVo5lat/AVsfbORmxMqf
         IvKOcHF8D2GO/VC9LVs9qRG4rXGdVhhkuOj8g5hRvBGN+ZcoNWcWiPYiUmB27m4kDaj1
         AeAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLlALGhQjixiRvt2bhHxzxODjyceWl2vMrqY5tu5KFboxZkhns32nPCh2Rr/6tzNvktDu9TMWuT9bemA==@vger.kernel.org
X-Gm-Message-State: AFuF++lThTF5gKbCJhRDnGcf74ryoN1HWW8/nsbk3YuhiL1LUuQkhwDq
	x1oznIgD7pe85/58InoGt0UaZejzkGQ+mZP1XcWidM+JWpDXBofq43sNxy7PHoUjnU/wcUz2AeT
	sb+SBTlMGMxvngO3uiVzj7rypgCXaHZvkdM6ar8tcGECxeQaExvcnRePs/5VKpWEhaMI56RSYKk
	3F+qAcmIgVm0GgcbZM2a7X9hulW3+dsvRs/FS9NFQ6
X-Gm-Gg: AYBFou1uKO6xzu1V+gRwFCLfd/7WAxdZtTnvts2zIW8DO6OWwfC0aHP6L3cG29KW4s2
	vRdR0PutDhiTBVxUbonlfrishPv5sQnKZcniy7xrLtrAqkKGXT8/zducB/it5JFpg93s+yXbFT3
	ULRiJXz4Z1heYL7QkWRT8utf6k6yu9cbx10YIzCI/UEE5z/n4/8Ey+epyPCyQtIYat7G9joygwI
	TmREPqfLiL6RT3NhWxgTZDkFO5DvkqvC+79Qu2amOxVL4iuUFm8WOQcS3ueakErnY4iDkfSkQ==
X-Received: by 2002:a05:6808:2221:b0:4b9:e65b:8c34 with SMTP id 5614622812f47-4ca4cce354dmr6980282b6e.34.1789650345237;
        Thu, 17 Sep 2026 06:05:45 -0700 (PDT)
X-Received: by 2002:a05:6808:2221:b0:4b9:e65b:8c34 with SMTP id
 5614622812f47-4ca4cce354dmr6980206b6e.34.1789650344582; Thu, 17 Sep 2026
 06:05:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-0-f85c9103177e@linaro.org>
 <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-5-f85c9103177e@linaro.org>
In-Reply-To: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-5-f85c9103177e@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 15:05:31 +0200
X-Gm-Features: AcwNN1X4DA6jbYE-gBOX2kSb59KYnpL-Q1fbs5emwf1TV0R6vxzWt_eKkq1SKk0
Message-ID: <CAFEp6-0QcUpJ51ud5tOQAX9Vy5U26oJKwe10gSOQV+_o-crFRQ@mail.gmail.com>
Subject: Re: [PATCH v18 5/5] media: qcom: camss: Use data-lanes starting at 1
 for new CSIPHY mode
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Felipe Balbi <balbi@ti.com>, Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: VBYMksaX-llWxv5sOEgC5XRYRRmZksPX
X-Authority-Analysis: v=2.4 cv=YcYodARf c=1 sm=1 tr=0 ts=6aabe5aa cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=WXF1KB85Zuouuk2w01YA:9 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: VBYMksaX-llWxv5sOEgC5XRYRRmZksPX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE4NCBTYWx0ZWRfX0HwPRIq4wChQ
 0G0bHFHDPh5xBw3vwSbC2xwwJ5nFbzStn+G8DaVlnrBtLMeoRxDBxGZq6ptIRRSw9nuzHVPOtpm
 rs7RleV3Tx9PWlzvo379+0wPe9Xs0XCd6rN/Cj4LYqp7Oox0J1UCctxOj2rp78HvexKrE61Y9g9
 44jMpGz3pVu3hTdlQA0qk5y8g7IIqbe/96rJC57WuY1qtdP97WEuFaArX12a7i5ausFc9XA0yW2
 DTCqIy5qdaAY85+AzRAWJmRcXe4rg13dNTG3lEdjDNjFaArD6g420iLRsd+q8qkqJX9k2vQ0x8D
 yndNkz5e+/OumlJjYXJWP3wnOQLFDGgTdoNH+lmzIAAnE5u+9baf2N+/pybrEpaV/RNuECzYq+Z
 EcaPLlJobONIhJe/2/pK37n6xqlTLiYd5gyOgHHw8QV0vI1I7lAc75OZ8c1D/yTcfB9iRU0DC0C
 ani86Jqe2QCXW/KIa3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE4NCBTYWx0ZWRfX7Gie5n8H88Ke
 6m3KpMD1/orEdAu22d7gpJVWsUvpxsQkLwfoHFRXG52eqTk3ReU3lc/uIsdOoaDZIIeVDMvuthq
 Ak8uUwBQxqW5ho8Cvq2yIyPhR/FHmzc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170184

On Thu, Sep 17, 2026 at 1:08=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Introducing a dedicated CSIPHY driver community feedback was both to move
> to data-lanes starting at index 1 on the PHY side and also to match that
> indexing scheme in the CSI decoder - CSID.
>
> CSID consumes the data-lanes property to determine which CSID lanes to
> switch on. For indexes starting at 1 we need to amend the logic somewhere=
.
> The PHY side code normalises the input data to register level meanings so=
,
> replicate that logic on the CSID side.
>
> Introduce a simple flag to differentiate between legacy indexing @ 0 and
> new indexing @ 1.
>
> Existing bindings are not affected.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-csiphy.h |  1 +
>  drivers/media/platform/qcom/camss/camss.c        | 15 ++++++++++++---
>  2 files changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.h
> index 7a357044b9fdb..8c3319f2ca1cf 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -21,6 +21,7 @@
>  #define MSM_CSIPHY_PAD_SINK 0
>  #define MSM_CSIPHY_PAD_SRC 1
>  #define MSM_CSIPHY_PADS_NUM 2
> +#define MSM_CSIPHY_MAX_DATA_LANE 4
>
>  #define CSIPHY_GRP_ID 1
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 84097d82d99c9..6f58e729eaceb 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4742,7 +4742,8 @@ static const struct parent_dev_ops vfe_parent_dev_o=
ps =3D {
>   */
>  static int camss_parse_endpoint_node(struct device *dev,
>                                      struct fwnode_handle *ep,
> -                                    struct camss_async_subdev *csd)
> +                                    struct camss_async_subdev *csd,
> +                                    u8 lane_base)
>  {
>         struct csiphy_lanes_cfg *lncfg =3D &csd->interface.csi2.lane_cfg;
>         struct v4l2_mbus_config_mipi_csi2 *mipi_csi2;
> @@ -4777,7 +4778,14 @@ static int camss_parse_endpoint_node(struct device=
 *dev,
>                 return -ENOMEM;
>
>         for (i =3D 0; i < lncfg->num_data; i++) {
> -               lncfg->data[i].pos =3D mipi_csi2->data_lanes[i];
> +               u8 lane =3D mipi_csi2->data_lanes[i];
> +
> +               if (lane < lane_base || lane - lane_base >=3D MSM_CSIPHY_=
MAX_DATA_LANE) {
> +                       dev_err(dev, "invalid data-lane %u\n", lane);
> +                       return -EINVAL;
> +               }
> +
> +               lncfg->data[i].pos =3D mipi_csi2->data_lanes[i] - lane_ba=
se;
>                 lncfg->data[i].pol =3D mipi_csi2->lane_polarities[i + 1];
>         }
>
> @@ -4794,6 +4802,7 @@ static int camss_parse_ports(struct camss *camss)
>  {
>         struct device *dev =3D camss->dev;
>         struct fwnode_handle *fwnode =3D dev_fwnode(dev), *ep;
> +       u8 lane_base =3D camss->legacy_phy ? 0 : 1;
>         int ret;
>
>         fwnode_graph_for_each_endpoint(fwnode, ep) {
> @@ -4841,7 +4850,7 @@ static int camss_parse_ports(struct camss *camss)
>                         goto err_cleanup;
>                 }
>
> -               ret =3D camss_parse_endpoint_node(dev, ep, csd);
> +               ret =3D camss_parse_endpoint_node(dev, ep, csd, lane_base=
);
>                 if (ret < 0)
>                         goto err_cleanup;
>         }
>
> --
> 2.55.0
>
