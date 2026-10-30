Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793367593;
	b=YzWsbLs8DZ+tvpnrHv0t3cKtm7YwDrqRQ6OQujAiFn6u35USiBfho+OHqsmMchKZcG0q
	 d7WVFfBkRkC8ttgX0M8aK0nXbN277Om511B4kdvtZAngDlnu5m+7wBVmC2Clm2Ng5Kznw
	 O4mgMbwwL8Z68TaIp3jeUN26IETHWz/SmzwPkev8sIauap5/IeSPJtai7gMnNgjgyMKkL
	 aU07FXH/QdljFdx+Dq5ZhNYxJA/BX3w+9oPdFmlArJldsOQ+yY2nlQwKyYTCp4FbW2vpV
	 wcWxFjisQni8iRWxTRpkyU9+lOMzJEFHbg74tARdqChNqxi5jeasvhysnSjmjn1CbGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367593;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VtfpJiozR34O//y13/JVtb6BcsPT/oxxaS9TsgU+HW8=;
	b=tCMcg6mH2ssyMmnJiUSCfShyPFI5Rq3J++U3mxNPjLrHWdZRfEolWI4arFWu9DpSkadh
	 shAzWNErwqBB66zjolUrx0qoG21a0YaLgadCVfqhW2EoyO4KEe420Vcpgck19nrXeBY+N
	 WQ0meVD464+ZSNKICzqyO1IJPwNgHce814W7IV8ZqGYD+f+OYgxm3LsJjZVyGkkSVtf6U
	 qdeMw9PFe0HgImEX3CS2yvfVF0uNKqr+xdQHfGfDKU+7nCl9A7ifphUCGE4zAggIyum0N
	 uqaLuNwa2GzAMk4YCMwj2WngzST60gcqnRp+T6qOiIJnc7zIWNmy59iYVzV1tjfPvIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WK2Wc76V;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=emZJS60N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88370606A31F
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 13:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88370606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WK2Wc76V;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=emZJS60N
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG8Gw2541690
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 13:39:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VtfpJiozR34O//y13/JVtb6BcsPT/oxxaS9TsgU+HW8=; b=WK2Wc76VP7GIhWGZ
	iS0jQVIqE9YDvFjfC5i3RWRbFLLzsbef9CAitv7HyptCgvSv4+Cj/FkJUTg6BYa9
	96fLl3U5crvmYEkYDzn8hhK0MXutXJyhIBv6qlSEuh2swAC0RkPkRcN0ASqIs/Rv
	gh2jEVimi0OobdVxuOIeDem426k3mXw8HVayLF2td4uxxxN1JjeXviy8JyNqd/PX
	RMlVlnkVvbxfWf97+t6OcXb5VkHzs2aepp05gHby/uruB97rp6j1kP7f0B+vBgdY
	MRX8+P0787Wp/sCGz3CgiNxBDN5q3sAEOXur/MN51EFXMX6xRhF7yBaRMbVrJyvd
	P1kQdQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qk901-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 13:39:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844cb60so143577885a.0
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 06:39:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793367591; cv=none;
        d=google.com; s=arc-20260327;
        b=dDOEe1TtfBhmSI14+oAGyTIHpr/PsH+5AdlZFHUrgo5b9VSRhDEhd8SxZXU9111dOo
         YlN/j7D5BQ+3KpcNNrf0Lvso8Xwx1RYJx8nCP5ZznSZP0bF9TTdxs654N10V8GYkjGCD
         CHr4NOadF8g7U8YveOyR8Pv22cydpA3fjgOucx/F40YSeXHqixSxdA+yIc2jpZezfKnC
         3iQ63jlWxs/2JagXQ21QPDSE3WDJygjfOMs97MEyMSWpEvpuEzRssvsFm9rxHM7X4T/r
         zl1Q13Gh5Z3uRW+dk1GdI84SRmdxcHVLeOOnY7BP130YVdX7IIalp2RnqKjmmxlebS10
         fNSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VtfpJiozR34O//y13/JVtb6BcsPT/oxxaS9TsgU+HW8=;
        fh=U0vdNKiwykzHCg5y46TDCXTMRdZ/KKG6i/ATk9wnbUw=;
        b=RiG2XtJzFKtN7OY24B7IAGa8FPDH4ZcYrxi9N1Ch0Llr74gTEi+nkj3BdyUHkRUhJ6
         fbiKQic8C0dXtbA6+LIZc2EDId4lns49+jJAH8lzBGIHhMCer4Lq7ZCcLkeaqsfKbJpa
         fXjlkdKSp/d7gnIKNXB8bixiPj1FBoG7yKHSWb3mz9ZTADEJfclY7DiRDgzIEaJtuD9C
         fqCW+rHIcys52ex8u6hasJKpLdRr/SAydUmLFJiJQkWpr/zYngeZI5JZ6f3MZ/ZYabvY
         bMnQgKL4LJaD4cBUIGIStr8QNWzfxz5J/fUJDGCCEHQZslzkzzqSPmZQxDjNDiGgonyp
         4nKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793367591; x=1793972391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VtfpJiozR34O//y13/JVtb6BcsPT/oxxaS9TsgU+HW8=;
        b=emZJS60N+ELqpZhCh4svuJBjUcF/bGA6SqyocVE79W7LgB/4VSS27JIqS0NoZNbT3+
         bRalHCzK7li+2TPfA5zOIynK80/8i62Giu+A2R7SOa4PmSCXcsef8b/VUKjmctwS+sZ3
         kZ+ZXjq0uwLj+YHlrkWFMjhkVj/jR3u5RcnaEaSbepjl6vzotBfkBSClYDq/VBAgCKwY
         cmiU9lrkdoYAz/l9VEE6Nk0fqhkXruM5hQzbepOOc3KMpr44GVbyPLAjTOAAOth0DEXH
         QPD+9XtEUMVeLgT3/lXLkdyDsDfQLQomteg/T4jAkwuHDTZICvvacRpYInd27dGa5yc0
         rq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793367591; x=1793972391;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtfpJiozR34O//y13/JVtb6BcsPT/oxxaS9TsgU+HW8=;
        b=0znDBU1kFomoXk7zB6BvfCkObASkYjSWEK5cmcUvFp8ERSvwSf/GWc7stgs42Otb4A
         y/z6wMRjy6zC6N0dLksfP5+FrjIFbZdahR0aJJfzloMb28geKrR5Skr4P2zQGKWhSwh7
         0SZxsg0u0L3ojo41sNTEYQCglDyQ9TbUjr/Zc2vN1PtBw6NXSdQBnE43WdOWCVTSQEzj
         pkgY/dsnPx2pQpC2lxzdGulKgd0bpcDG6s1Cord7bkjpVanp0mX0IdvIffz+Q3HNbdNM
         dcEXBUiQIDpXuvi0jRgy0mRAqc09oL9C/VVf/JnMWJxSNaMT6PjzxUSXJwrhIPxKHjWp
         KGhw==
X-Forwarded-Encrypted: i=1; AKwUvBy0yEUUg/YwUKw9w/T4rFxxDuznRL8p3t9bgdk2Ow14Y4yjjPWpvD3u/3uw4J3QmrbX5Mv8KKTDWBeQ2g==@vger.kernel.org
X-Gm-Message-State: AFq9FYKZ/cs7pjkOKCApuyn+lsNgCVyRums/GLz3FNGXHKZdF2vBM8J5
	MS2Sjk3VF7rE6xfZ3HO8TmoPpEVYRuUmxq62bmHjBNvNpzVyP4m251wy9+F4P26U3iD3XGCcKTF
	b6SaKpNm8JeFLl+tn4ivxp51at/KctYBp/EJRaKBaJ2IBUPqmQXe2tlHc36CJvZtDtpT2S4GWUp
	AUAnTNbn2XVhQt7tjUh/MzTR7v9Dlcs7ajMosZIJc1
X-Gm-Gg: AYBFou1Qk/G6iVnGVkpQy71RwUtk3JaReVqzHnXdhJgK/1hH7IcEPVnjcd/KZrFGy1x
	JOB8pfTCvZML+wk+YCpBbgRwcUIfngX/uNWKaWt2XfpP2rN2RhcslQ1AgH1I8WNirDchJl95li8
	1Vfsd//z5f891Iz/BUVOSzYRAUsGi2VL+nTYlOSgX8mdW4rk8YWKajxuy2pBRJHYkg1b4r/Iop8
	n5TSfK5aYVBLRQybI0qyMIgIDyrZPYg8ECF3PYSKhviLJJeVFaWBgdfnyU9ozmxNzUUB4w/WxUZ
	ENLPifLc66nQSyuXGzTnfkLiQGLN
X-Received: by 2002:a05:620a:4686:b0:93f:717e:412f with SMTP id af79cd13be357-944216bc9bbmr338134985a.23.1793367590521;
        Fri, 30 Oct 2026 06:39:50 -0700 (PDT)
X-Received: by 2002:a05:620a:4686:b0:93f:717e:412f with SMTP id
 af79cd13be357-944216bc9bbmr338129985a.23.1793367589937; Fri, 30 Oct 2026
 06:39:49 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com> <20261030-hawi-maili-camss-v3-4-9742bca8cef2@oss.qualcomm.com>
In-Reply-To: <20261030-hawi-maili-camss-v3-4-9742bca8cef2@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:39:38 +0100
X-Gm-Features: AclHuK_HjvBA3A91XQzKnsDL6zJUl48jHFR9jQAfnh-yPZtylMtDolRCG8Qrtg0
Message-ID: <CAFEp6-2htz4rbyeZHBgCVAfS3qvP8r5J-m1oQq6UMdxoHKssgA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] phy: qcom-mipi-csi2: Add Hawi support
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX47gKESiD2XTl
 USrBgG+9rxH8ga2A5x7d5B01tSGCBWthrH/EaCvgkHyOZEMS00Qp82/5CNh3P6MRMjpNMm6EjH4
 r9+iTvHEWGCzpC3eGGldo/EDtUQU9jkglbv9wh/caMrjK7mxmNWQlpCjZzv/QqUsfKgHBlry7Wf
 AkEBeo7x2fWAmQeSEnK4zhmuGPql1Af6v4OxFVj6MhwN0l5OuhBVaVIgy0A/9sePVbw8M+bJqkc
 oR1QZekl03HDXAtU6sk6TOFFZknX7VRgDoFmcchsAd+dTha7TOCQJx7wE54agQNOBqwMOZA7ZP/
 /oBdv3hOECbc/KmBzbp68saq8T3xDjbbXcqGDnL/WSmtMCk490BBl2cFS8knhHO77VhIzh0coZq
 Wy/PmV4d4c37P7pUW3UanPMwODGwdMHHlpjuq65lkPLqjbVSBaC2NB8cSpcUQY9YcYJWLBYEJFo
 GzcYFW9OkQ3+ZnY5ptw==
X-Proofpoint-GUID: bt_WkUjQ9cTrrCPfAz7C4hJmNVX-b0-f
X-Proofpoint-ORIG-GUID: bt_WkUjQ9cTrrCPfAz7C4hJmNVX-b0-f
X-Authority-Analysis: v=2.4 cv=IumL47/g c=1 sm=1 tr=0 ts=6ae49e27 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=2WJT8NG7GnMvxSP6HGIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX0/Kt06XUNcI0
 26vJkNxjUrAHUClKP61MOn8vGdoti6elgxekTImGO93VFHsHBb8Ofxc9+VNtLQL08Ghxv4F9iCb
 x1TcgeRWn4/FhLe6aVuzW2iO0KTRhVM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300054

On Fri, Oct 30, 2026 at 1:43=E2=80=AFPM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>
> Add support for the Hawi 2nm CSI-2 D-PHY.
>
> Reuse the Kaanapali lane table and adjust the data-lane CTRL0 value
> from 0x8e to 0x8c for Hawi-specific tuning. This prevents potential
> stream stalls and SMMU faults.
>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 136 +++++++++++++++=
++++++
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |   1 +
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |   1 +
>  3 files changed, 138 insertions(+)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers=
/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> index 658a39463104bedfa31d0ccb81fd9d34017e91a6..1e9bb8b9e50bb15e7fad3c6e3=
d6048bf049e3e64 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> @@ -162,6 +162,126 @@ mipi_csi2phy_lane_regs lane_regs_x1e80100[] =3D {
>         {.reg_addr =3D 0x0c64, .reg_data =3D 0x7f, .param_type =3D CSIPHY=
_SKEW_CAL},
>  };
>
> +/* 2nm 2PH 2p5Gbps 4 lane DPHY mode, Kaanapali table with data-lane CTRL=
0 0x8c */
> +static const struct mipi_csi2phy_lane_regs lane_regs_hawi[] =3D {
> +       /* Power up lanes in 2ph mode. */
> +       { .reg_addr =3D 0x101c, .reg_data =3D 0x7a, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x1018, .reg_data =3D 0x01, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +
> +       { .reg_addr =3D 0x0094, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x00a0, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0090, .reg_data =3D 0x0f, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0098, .reg_data =3D 0x08, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0094, .reg_data =3D 0x07, .delay_us =3D 1,
> +         .param_type =3D CSIPHY_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0030, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0000, .reg_data =3D 0x8c, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0038, .reg_data =3D 0xfe, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x002c, .reg_data =3D 0x01, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0034, .reg_data =3D 0x0f, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x001c, .reg_data =3D 0x0a, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0014, .reg_data =3D 0x60, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x003c, .reg_data =3D 0xb8, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0004, .reg_data =3D 0x0c, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0020, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0008, .reg_data =3D 0x10, .param_type =3D CSIPH=
Y_SETTLE_CNT_LOWER_BYTE },
> +       { .reg_addr =3D 0x0010, .reg_data =3D 0x52, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0094, .reg_data =3D 0xd7, .param_type =3D CSIPH=
Y_SKEW_CAL },
> +       { .reg_addr =3D 0x005c, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_SKEW_CAL },
> +       { .reg_addr =3D 0x0060, .reg_data =3D 0xbd, .param_type =3D CSIPH=
Y_SKEW_CAL },
> +       { .reg_addr =3D 0x0064, .reg_data =3D 0x7f, .param_type =3D CSIPH=
Y_SKEW_CAL },
> +
> +       { .reg_addr =3D 0x0e94, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0ea0, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0e90, .reg_data =3D 0x0f, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0e98, .reg_data =3D 0x08, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0e94, .reg_data =3D 0x07, .delay_us =3D 1,
> +         .param_type =3D CSIPHY_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0e30, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0e28, .reg_data =3D 0x04, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0e00, .reg_data =3D 0x80, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0e0c, .reg_data =3D 0xff, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0e38, .reg_data =3D 0x1f, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0e2c, .reg_data =3D 0x01, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0e34, .reg_data =3D 0x0f, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0e1c, .reg_data =3D 0x0a, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0e14, .reg_data =3D 0x60, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0e3c, .reg_data =3D 0xb8, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0e04, .reg_data =3D 0x0c, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0e20, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0e08, .reg_data =3D 0x10, .param_type =3D CSIPH=
Y_SETTLE_CNT_LOWER_BYTE },
> +       { .reg_addr =3D 0x0e10, .reg_data =3D 0x52, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +
> +       { .reg_addr =3D 0x0494, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x04a0, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0490, .reg_data =3D 0x0f, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0498, .reg_data =3D 0x08, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0494, .reg_data =3D 0x07, .delay_us =3D 1,
> +         .param_type =3D CSIPHY_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0430, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0400, .reg_data =3D 0x8c, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0438, .reg_data =3D 0xfe, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x042c, .reg_data =3D 0x01, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0434, .reg_data =3D 0x0f, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x041c, .reg_data =3D 0x0a, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0414, .reg_data =3D 0x60, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x043c, .reg_data =3D 0xb8, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0404, .reg_data =3D 0x0c, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0420, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0408, .reg_data =3D 0x10, .param_type =3D CSIPH=
Y_SETTLE_CNT_LOWER_BYTE },
> +       { .reg_addr =3D 0x0410, .reg_data =3D 0x52, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0494, .reg_data =3D 0xd7, .param_type =3D CSIPH=
Y_SKEW_CAL },
> +       { .reg_addr =3D 0x045c, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_SKEW_CAL },
> +       { .reg_addr =3D 0x0460, .reg_data =3D 0xbd, .param_type =3D CSIPH=
Y_SKEW_CAL },
> +       { .reg_addr =3D 0x0464, .reg_data =3D 0x7f, .param_type =3D CSIPH=
Y_SKEW_CAL },
> +
> +       { .reg_addr =3D 0x0894, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x08a0, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0890, .reg_data =3D 0x0f, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0898, .reg_data =3D 0x08, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0894, .reg_data =3D 0x07, .delay_us =3D 1,
> +         .param_type =3D CSIPHY_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0830, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0800, .reg_data =3D 0x8c, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0838, .reg_data =3D 0xfe, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x082c, .reg_data =3D 0x01, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0834, .reg_data =3D 0x0f, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x081c, .reg_data =3D 0x0a, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0814, .reg_data =3D 0x60, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x083c, .reg_data =3D 0xb8, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0804, .reg_data =3D 0x0c, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0820, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0808, .reg_data =3D 0x10, .param_type =3D CSIPH=
Y_SETTLE_CNT_LOWER_BYTE },
> +       { .reg_addr =3D 0x0810, .reg_data =3D 0x52, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0894, .reg_data =3D 0xd7, .param_type =3D CSIPH=
Y_SKEW_CAL },
> +       { .reg_addr =3D 0x085c, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_SKEW_CAL },
> +       { .reg_addr =3D 0x0860, .reg_data =3D 0xbd, .param_type =3D CSIPH=
Y_SKEW_CAL },
> +       { .reg_addr =3D 0x0864, .reg_data =3D 0x7f, .param_type =3D CSIPH=
Y_SKEW_CAL },
> +
> +       { .reg_addr =3D 0x0c94, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0ca0, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0c90, .reg_data =3D 0x0f, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0c98, .reg_data =3D 0x08, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0c94, .reg_data =3D 0x07, .delay_us =3D 1,
> +         .param_type =3D CSIPHY_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0c30, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0c00, .reg_data =3D 0x8c, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0c38, .reg_data =3D 0xfe, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0c2c, .reg_data =3D 0x01, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0c34, .reg_data =3D 0x0f, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0c1c, .reg_data =3D 0x0a, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0c14, .reg_data =3D 0x60, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0c3c, .reg_data =3D 0xb8, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0c04, .reg_data =3D 0x0c, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0c20, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0c08, .reg_data =3D 0x10, .param_type =3D CSIPH=
Y_SETTLE_CNT_LOWER_BYTE },
> +       { .reg_addr =3D 0x0c10, .reg_data =3D 0x52, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0c94, .reg_data =3D 0xd7, .param_type =3D CSIPH=
Y_SKEW_CAL },
> +       { .reg_addr =3D 0x0c5c, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_SKEW_CAL },
> +       { .reg_addr =3D 0x0c60, .reg_data =3D 0xbd, .param_type =3D CSIPH=
Y_SKEW_CAL },
> +       { .reg_addr =3D 0x0c64, .reg_data =3D 0x7f, .param_type =3D CSIPH=
Y_SKEW_CAL },
> +};
> +
>  static inline const struct mipi_csi2phy_device_regs *
>  csi2phy_dev_to_regs(struct mipi_csi2phy_device *csi2phy)
>  {
> @@ -405,3 +525,19 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm=
_kaanapali =3D {
>         .genpds =3D x1e_genpds,
>         .num_genpds =3D ARRAY_SIZE(x1e_genpds),
>  };
> +
> +const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_2nm_hawi =3D {
> +       .ops =3D &phy_qcom_mipi_csi2_ops_3ph_1_0,
> +       .reg_info =3D {
> +               .init_seq =3D lane_regs_hawi,
> +               .lane_array_size =3D ARRAY_SIZE(lane_regs_hawi),
> +               .common_regs_offset =3D 0x1000,
> +               .common_status_offset =3D 0x138,
> +       },
> +       .supply_names =3D (const char **)x1e_supplies,
> +       .num_supplies =3D ARRAY_SIZE(x1e_supplies),
> +       .clk_names =3D (const char **)x1e_clks,
> +       .num_clk =3D ARRAY_SIZE(x1e_clks),
> +       .genpds =3D x1e_genpds,
> +       .num_genpds =3D ARRAY_SIZE(x1e_genpds),
> +};
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy=
/qualcomm/phy-qcom-mipi-csi2-core.c
> index aff9e66f0352e1d4d7a07d10d350ea2cba6df233..76c55f8e30b8c629818762d0b=
42a7dc4ddc6716b 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> @@ -445,6 +445,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_d=
evice *pdev)
>  static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] =3D=
 {
>         { .compatible   =3D "qcom,x1e80100-csi2-phy", .data =3D &mipi_csi=
2_dphy_4nm_x1e },
>         { .compatible   =3D "qcom,kaanapali-csi2-phy", .data =3D &mipi_cs=
i2_dphy_3nm_kaanapali },
> +       { .compatible   =3D "qcom,hawi-csi2-phy", .data =3D &mipi_csi2_dp=
hy_2nm_hawi },
>         { }
>  };
>  MODULE_DEVICE_TABLE(of, phy_qcom_mipi_csi2_of_match_table);
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qual=
comm/phy-qcom-mipi-csi2.h
> index 2355a1db9b941469325646ef81d0f70c6a2badc4..4ad058b916ebba8b319cb297c=
231cba10d3ec602 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> @@ -95,5 +95,6 @@ struct mipi_csi2phy_device {
>
>  extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
>  extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali;
> +extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_2nm_hawi;
>
>  #endif /* __PHY_QCOM_MIPI_CSI2_H__ */
>
> --
> 2.34.1
>
