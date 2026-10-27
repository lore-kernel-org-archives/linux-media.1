Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793098347;
	b=HxZFxfKAU5fIfEDV31o7xTsyY0v+EyqwkgU2Ldwn6b0j0H/w0gprhBw/yeJOUV5Z+CrB
	 uCZkcmVkCTpJK8EsI3tAqh30MHC/BWgfUeMldi9Pwu73rXaTUCTCZmIVW60osXE8MA/G8
	 HsgnL2tdThAJxPWJIqqrh7FbsgPnpID/iZPMbOnmy9ShsZhgKhy+MMi5kqaxKwWO8Y+KE
	 TKoO2zJsxzaTqQAubpgarrHDSYP683DJqBPZUD2luaR/rAmXIkA5MViVTWhDTfT0D+ciS
	 Ep215aRqmISaX2blYIVayfZ5DPrXzGoIH290vuH5ThDG1C7vtq8ix5B2xNCSljX3zGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098347;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DUhODUYkbj7YwSAO7e9lxcIEVTvWrcgFG4thBV6K17A=;
	b=UpfSodSscBqXbPdfOPVHexlU5KnUNfE/R3ePA9q5p0q3kUI6RZjoLseb+Xa3AxeCg4w8
	 4oRNfaSQ1HZgFPpUZW1R7O0XR5+BL0FakTdLllY1ZHWLw9tjspHxlQeXDO8StUCvTXIoH
	 OcA79OAek1SjgK1egpw+HvRlHId8Zsld8lYz/ADB7ylauebfrs0/v+LZ28ok6vbyC1WGB
	 WFjIJcNriL5cY/HkjnOYZPpRfVCjTBmAJmzLnwS1lbJgl3W50dF648P1pPzdwOcYZTaP9
	 3BBzXV6mntGByf7OZHpw0/RvJVUeYb64sRUF1cuE4S4Fo7rEBrM6bSBKQIcSDViW4Hw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UJNJebC+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hyMSQV3Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643C9606ADDA
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 10:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 643C9606ADDA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UJNJebC+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hyMSQV3Z
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe3S22524795
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 10:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DUhODUYkbj7YwSAO7e9lxcIEVTvWrcgFG4thBV6K17A=; b=UJNJebC+srj8kNh1
	No1muHd6VgXNBoavmCmYSGJigq5SqZbxbO487zcMDIle3IUBr8V+h/q3jIB9I80n
	J9lEkQmeWpt2L6SXdLxohQ97LwLQvO5StpUyHru4Q+VPueJYhVQjHlg8rVbbH9jO
	GsCjDQ9DsX0lpQtdpVwsxJp1YL13gZwNqo8hRWCRSKvLgnOEw6lETvdwG9J+rUev
	kePlRNXX34Ekn9j2NgHeYxdpWklZBId0r6lzQf8PF8W9CuXDy0BfPdRSVFIBDTWa
	Wy72flRiJrCQ0g6QJLD8C/iQMquK/0DbOiQvmNGmsgW2yZ8LDse/4JW95CF8tyd5
	2OBVqg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw20prt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 10:52:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f322ef7d3so870142685a.0
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 03:52:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793098345; cv=none;
        d=google.com; s=arc-20260327;
        b=q60NdF3xlfCh3gZf5A2szeyiBdYz8pJlZpaiYUUM/u0b4Rv+16STNWlQtHCTaHA8cC
         6EdPRC+C9UQbF5d3Br/ZLqDnAPn+Tlpm7dYG8maTGrdaZhKjrPf7StYpDafCzWZwkHTG
         mWI+MvBoiqrXC0lseQNt7IPLQ4Re/7e1GsPgSm7BvTG5cpx/cRUBgthd6JgJnK+8FbSl
         gXuEZo5nqazQ5cbXsUgfHG8+NRY35/shDyDmBEuVQcdacATJPG9Lqkf5sdIcQWBaMeMG
         rSdzqklsZ+f4HnqhlGF10JJHZGLCFG+/3nUCKLUSPmBnY8QBhWKED9YLHEcXnVuBrRWz
         r7Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DUhODUYkbj7YwSAO7e9lxcIEVTvWrcgFG4thBV6K17A=;
        fh=CCFqX8fHtoFTilg/n+VpkuArBkVV3MfdSamZQXmPRc0=;
        b=enedXoHwGEIDnkJ+y9/8+bVhYg85kFmMNmsh0qKVv7bhCb9RIyMvXiOG6savs8O/qx
         luyNlHFlaXYyFTKrpRQaFdUcrcUCs3C2/RkeLZ+HWwUCqU6i2PdvpyB95WqBflmJWjou
         gdYflreJNqJBcgEAGhn6UmVnkz/+toSzzAkdsa6sBk20JHDOn5N19mOHxQfCua1YcsuT
         umvUx6lJGf297PztPpDdgiX7c3Q1k/eoXmPuO2LWJWmoo4i6AKKDS2u/dRKW++31UNiR
         xp9Jf77oCb1z9wM7vbh9halwr/HdCCyTRR1oNwWTdIqusMsorLTuTY4YCJ63oLb7utkL
         tAMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098345; x=1793703145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DUhODUYkbj7YwSAO7e9lxcIEVTvWrcgFG4thBV6K17A=;
        b=hyMSQV3ZARguLjsMcA+bVsBggl2efRQlFZlil9vytOnGM9A+RvN4t6sKPjMKKcz6/3
         pHlA0EEUpLE9mAwq3hRRTtehJDY7J3pefs7kJUoSDmIxz3VhXkT488fMsyGOa65lqWqy
         i9Ctm/T6YQGE+BPs9tS2jvi/gr2ExjhmB8dQWXaArqocJRucIFIsvsUODqOe+jdOmD6B
         UI3Wao4RhReodfIanZjvN6/cjrO/PSG1dCbcYVD/Nn1asmoRfuIN4nKG3yT/C1jri0Nb
         iuwIB27Oro3gGhCSUjI42ygAjWLUke0/Py5cy6QfILLhG1iVswnJxdNgz09dtWLDAwhG
         HDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098345; x=1793703145;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DUhODUYkbj7YwSAO7e9lxcIEVTvWrcgFG4thBV6K17A=;
        b=zXLWRO4B9LNn0aymE4Pu0nPAiwXb3/VhzczOfUPdvVwL5K9fI4eyNcqGLDNJyl1mNd
         9mBSS/k5/z+SmtcPyxlRKuyyF0nGKjAXdX15WJMr1+7XdaEfFvJfERMY36AGGMJ09BDH
         sPqAirDkFKmoRBwUQAlh989Bpk81Ke2XmixA/qBFqZxnN+XIn8pi2/l9mJ/DK7dUAMH+
         Fh+QqXBkdnfgi8V5o0Sgo5Ycg8aMlGRMmHFzn/bqZCx+/G94vIu8T5USCPEIgB2FsN7V
         VNy7LAn73QEumSHTuJiV6DGW2vhKgwmXriAnSKfJ9kQesymqPqwxrZiXHr6On3mk7Wd5
         Hkrg==
X-Forwarded-Encrypted: i=1; AKwUvBx/XBqUPwJjaBsvSr+uB4iZUZ+4+NKqyCSzeju7/rg2JYHEAVXtbmyrWTo1xuaUg2PQE6e1Rozq4ps8vQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJKtQcoPBMdceCkeirm9HLIC83Ltjwrjt+8OH2Zv2xqV0SeeybQ
	tq9d3kbvVGT1Gi/IrnwBFJqrjk+Z8t1XYgWEPZQ+/LBIGrvvumY/dxYZwSwiBh1yKBmkojtT/7W
	7EZ/gj0qiBe3h7JjliVaFNvdjalLUSaJyh+kjheXw7ezrKXXntDNSOBiyflwtae2cIaWsknAZsQ
	TA7ntnH351h9F6mmuk6lH3MAb+Z7TI0nAZSFZLx38S
X-Gm-Gg: AYBFou3KDiTSi9Qi8BsqkSKKMJpuwYXBmsR7bafRkNB8qAP1hfe8QrDS7ZLSb3v+E87
	Lkj42ubtf8e9RyHQWmZZMUw9GwqTbFgktGbCzzADPPKe1GNaM3eKl/Lph9Fe86Md96iHVT7pbm0
	5MPbkISNmImxUmnE9/dkP8wl2Yelz4tnUDAb7QkwoKA6FoX7gCtAMtoqHDqqAF2cgbE4nJ7fIMy
	dV/F0ae34f3vWPUyR9Sv0a+eKGhnN50IJVNX5/+7nGZkKLk92VwXBy/whRLCwI/73UXJn/Pi35G
	Zif+jPPlFq/yln0JX4hEXPfxOR7r
X-Received: by 2002:a05:620a:3704:b0:93f:3193:ac02 with SMTP id af79cd13be357-940ef980186mr1471688285a.51.1793098345410;
        Tue, 27 Oct 2026 03:52:25 -0700 (PDT)
X-Received: by 2002:a05:620a:3704:b0:93f:3193:ac02 with SMTP id
 af79cd13be357-940ef980186mr1471684685a.51.1793098344925; Tue, 27 Oct 2026
 03:52:24 -0700 (PDT)
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
Date: Tue, 27 Oct 2026 11:52:13 +0100
X-Gm-Features: AclHuK_W73gHmnyhBWT18CczdSRYkFSq34tLIfhksbP66i2-mLn75HpT6SxBCv4
Message-ID: <CAFEp6-16WAoyS+aY2BzPknsMtHa1cSfVYNmYvTKHm_MWqqW_ag@mail.gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX5BdB0qPhGJvF
 Fx2tIuSK3IKCHdKLqQLF1TtVtP9BlwRfuJQjPi1ZcwqUhGKHY7pLSBnnjXz7FqNWpT/f/8GYYPk
 nCuiwUdpdQ/TVHsCw4p8uxHl+BvrX42UaZWgatj0hroli+3Rsb+VulXjlwm5sgrK1bWb/Wc/c6R
 uGHdsHu0QyB91c7VHPb8cjEF+GPaZjH13fTHrtsWvzxyCOFW85pLwhQ91hUPQImXBPLm9pu6FBt
 Qb6RBrfLnetP4WjnRvSGWwzvcuBNDTnR7Eut4rPWfDQETm2ht16bM0NedkihHnW14EYdHq9rg34
 gb0gdDTQP/GB830DqnDVnSRIeIDTGVxrAg9Fua9FjqEad9/0q6BOqOfcRy5vYWPbQn3isnk4e/y
 Lonk0G91tOqR9fexrqfcSZ7d7b2GpjfeNepT3btZapfKaCn51NywZq/6eruZ8Zbq7G9G5n7ijQE
 g3UjZ5V3a6Lg8qV0Gjg==
X-Proofpoint-GUID: suJ0JU533uaswNZm67vbDGOzz31FzCNs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfXzkPfc5S2m1TC
 p2AdXgHUKj5GZPE7eTHZ4febskk8/YwwUH2ibf32dpKkOXNNhT9oX3Bqr50Stlk9K1yKQC3aIyc
 UVWzBPBdM2VV0JtqaUpQRvGNUsJy/Ho=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae0826a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=seWYDaW_jbbixs5KtssA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: suJ0JU533uaswNZm67vbDGOzz31FzCNs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270043

Hi Vlad,

On Mon, Oct 26, 2026 at 11:50=E2=80=AFPM Vladimir Zapolskiy <vz@kernel.org>=
 wrote:
>
> If CAMSS CSIPHYs are supported by the stand-alone CSI2 PHY driver only,
> there is no need to provide description of legacy CSIPHY resources in
> the CAMSS driver, therefore if CSIPHY resources are not given for some
> supported platform, use CAMSS CSIPHY port numbers as CSIPHY identifiers.
>
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
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

So, can't we simply drop the above assignment and keep only the
port/csiphy_res_phy below? That would provide the same behavior for
all non-legacy PHY initializations, regardless of whether legacy
CSIPHY resources are described or not.

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
