Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793032343;
	b=1i/GVN0QcEwHyLGJh+zoBH4gC4nmC9zdWCzFQ63T2LfrSm8IiVChr7Iy2yK5+wXGo0/W
	 QxD20CcCt6aqNHXxa5hZHcTBBddwavYR6ksOb8dIwUcyYX0j++Eklr0NG/HF4IsbG5zuT
	 4b4+AjwS3d5fgOOFoVxVtY+dUDQ+pEEIlWTbAxx5yyK2eoLM1cUiD+87C+TD7SC5msAmn
	 h11vbCCYiIQcwSrH6n7fgV9RpWF+fyuQMXXOPwtU92lcCPDlB/NZu+YYd8RQ1dWtzqpjI
	 yXWbL05LV6XVONJcbpRLwmULgYsHJ0co/CynqR7DjK1GeFMuQFL5RJo/bNN48XMgMGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032343;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rJmfwjSTTZR3zI7We/kOAI9FmHPoNWD0NHpxESGTI5I=;
	b=uVGSsxRJ3rGMQ1tpy4wu5og8fEGXhLDLQrQ3/7ZRfmP/Jik4npGxHQ+iLBLAuXJtgXkg
	 O9y/wYjwsCHelrgZJnf4Ke1IQvvH2jizV8FC4c19eI1MTdR9CxbYi3ReaCtSXcsGO7xEF
	 /Skni6VsfgWaZu6OJIYUllTn2SC9Ooe4k1uVMTscMe+MfEXi8D6MxFvtFLt+5GAMz7ZC0
	 K+Ydl0Fj2WEcuWbEO6FNx1TKIxW+cEaTL4fwywCKuL+qkw/NZDS/hYM8pErInC6/k2Zag
	 8WDS+/vkjtB6QIx8wtGD8PzAirPLiJwa920f3ZY2YQTgciUC6P2DCqb8xPQCusY9YGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EDlwi5CC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LR6dvMuX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1390606A337
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 16:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1390606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EDlwi5CC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LR6dvMuX
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEw6gr3584355
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 16:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rJmfwjSTTZR3zI7We/kOAI9FmHPoNWD0NHpxESGTI5I=; b=EDlwi5CCRfmmD890
	Jzc6xuZwTvfTTZw+Q3BAAZEMC/frZOcoLCMYm818yxWnZGWRrfHBeSuSoI3QJUzL
	lDW/eWFHp0cTxKGS7CBOK3Mck+5QmGgpFqwYlUa9lZQBISDllwBgXi/BlXIhjYGv
	3NM29jpznUyGFBngVp1k2I2OlDEGTRGyvDcaipbr+2z57zcYWp0PhzYGZqiEh4PO
	afIilsh19cPeV/G8ny3ZoGDGbUMnSVQ4EFXkiop4+OH4GNcc2UpkQRWqErvbqjch
	n6xEF01I8eT4BKuWGfChQ6OQgwMsitlgRVPVLZxn8M0vMvsBhh1T+wr7hMZrAiHT
	hNc6Qw==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvddb3ft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 16:32:21 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-49dd26d6f07so3401164fac.0
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 09:32:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793032341; cv=none;
        d=google.com; s=arc-20260327;
        b=AIfiF394enMhN5qlHiszdp410raL/UFfwgf87nZHm/mbdZpPOWS/8vREGWPsCmL/nV
         G9LQBTGHEShsvg739i0O85w0savn4H9pNb+NbIFkJFd0jcWIl3lSgP8nZY6oZKycUVCX
         YMZI8XR5rweJezXWZGQw+sou+3EPncE9xaZONuH8XPuRx223x14E3Fb2hqNmp7KQLr/G
         FSgVa0Fx6veCBSkQsDzrQvGHhyhP+6eR76m42NIlevqqoeLz2KkJBmVn51zFh95P5TmE
         5wqtT9RJzwgYcAIaFQLIKPxx/ix1/66fdPUvr8pcV0leQXKrMveG6IY1kHj7OtX1uoaK
         EvCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rJmfwjSTTZR3zI7We/kOAI9FmHPoNWD0NHpxESGTI5I=;
        fh=YpaWNVv0+M1N/wy9uhOwZEWMXUsQbx/OvnvVt25EZX8=;
        b=YNgERUmnCevkk1608q/BfvkAKsBtc3RxqBe03PBtRrizMS2m0e3vm08dBBxlJyqLmF
         gSnZUjX+H/Peu69+h3MJF9baPlbhgBUJYCxAWEpNAc53H3yJOLVDq/RPjL9kWfWRFkUu
         TVlTS8r7eQ3yqKsveQ6Eedx6EMY41M9mBstOPaITVUh4H+JY8GVeksUX6SLoafIyHzv3
         0o0pcXggP/J2jnjHnt28/i3pw5ZCPIJiuocdT1n+rFJc2wxteFJ2aK+ciDXMPBMNV/ea
         on59xf4L8QCK555A3f/9wCbjZnDPQ3mJuEefyntPNsDSIoXwu/b0r0oDi1gxdqlCRCYF
         aOZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793032341; x=1793637141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rJmfwjSTTZR3zI7We/kOAI9FmHPoNWD0NHpxESGTI5I=;
        b=LR6dvMuXGLAKtb3OBXxN1PhlMkAqQm46N0lbw8PBrl3sAIvK313ivsRZdkMLXIw91/
         ON2K6LlHwA2qx0eo00txgHfalKcTEj2hUMTDuexEpsBBJt+jYBmXkC4h7C5ywXC0oUZU
         l8nMatvGTeHVu3R8VoG7Tk4Yz30gZZtFC+t0MUK+2HrimoVYHA+AftVRoukkVnK4a6kS
         mFxfNkU/brCvFnB5HJ6wjDlwghX8I4nP29VNpxILeZ4Ja59xA94GNzP0WBK7CJQJ4Lrb
         QHwpUgOtSpJwPpZaSWRyiLeT3vcw7w/EW5k8ldZb/VYKVJNCD+dY+h+SfewCnDtU3BiL
         pOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032341; x=1793637141;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rJmfwjSTTZR3zI7We/kOAI9FmHPoNWD0NHpxESGTI5I=;
        b=Az4dczsr7MZQGH34kFx3vveGHMx0hO2pHMFsiouUKlZsYRMYvHp9QqgOnIBkGb1pPU
         UAHSMW4PJLzi+mjb7Kcvav90nBaPi53YYFQeMMJd+p/G0faXSSK/d+qDhIc2nu0yJ7wq
         kGb3NT0H4I9AU2UnmmZeMp/lRPfIOLqparXPOrh4+tQ5SlT6vHPM2z317dWsaSvdjZjs
         GvmtoGdGND+RjMsQqgYsKbnAoM3lNTvqPdv6e0Vre4MwU6AzXl5F329xeIjEBB/T6QYz
         nhxExGcn4tOf8nTQ5ggvBIKNDc6YYSNKJATeMEmMpDuA2LHKWgpy9hy2HrAs6rDU0d5x
         gjhA==
X-Forwarded-Encrypted: i=1; AKwUvBzpS0gXjz3l/oy955NpBxmW10dr7DDmmYIOR52TOcantfArQrIZn2e4kRwHBHhvOBBYeMHWMbwe++vWxw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLDxWDqLZ9rx0SPOUWID7T44ZYO7M01n8raANipJua8sTdFqdyJ
	0nzSzaaTP3WjhRc4nHh8j6xjUIpIFZXhMNOKBR1abSzi2VNMcrJQQKcttCxVI7Re/pBIQBdqXGc
	f8W4irZGi//EMhs5FqKYSDEMWgEMgbJC8H048haNffMTi0lQGbroRAKNUBUcmXmEcXBoCA2lUCa
	iv6+FYgnEBuLr1axZ5cseiaOLwhtJJLHl4mn+ppWZZ
X-Gm-Gg: AYBFou1YCZVrd+DcZwkoY6Z+JEI8vRSTVO5XbNsgF1imCX+lZYp7yF1fYx4kvHrsPMh
	EfYTmsLB0EuLAigsImR+Hr3YzgERGgLnfxNHW2enAGmTKdJqu+m4ga2JMMwX1Y7H/Uvn+5ED6rK
	JfETM6AvZkDyKOzTYWDENqp4K5qk3ZsSz0j67EZt26aXtT8XJ3UO9Id5M6+giQ4G9x2rgo1BoFt
	U0BV2ZxgwfWlPnHuejfdl96aMhLhcVo/TPnB++chmNFGgwBzsex83kNFei19gDWHh+VzhmGdxKo
	q1pEaOFsHHFPN793CJaeClovAuVU
X-Received: by 2002:a05:6808:222a:b0:4fb:6402:a8ca with SMTP id 5614622812f47-55c0023fe1cmr5167319b6e.21.1793032340742;
        Mon, 26 Oct 2026 09:32:20 -0700 (PDT)
X-Received: by 2002:a05:6808:222a:b0:4fb:6402:a8ca with SMTP id
 5614622812f47-55c0023fe1cmr5167284b6e.21.1793032340312; Mon, 26 Oct 2026
 09:32:20 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023163057.775917-1-vz@kernel.org> <20261023163057.775917-5-vz@kernel.org>
In-Reply-To: <20261023163057.775917-5-vz@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 17:32:08 +0100
X-Gm-Features: AclHuK_ykqt40TAC0t4LGiR7o2bvrg7BchMh-JBBqWoQP5J7nIQo_M5_9U28qOU
Message-ID: <CAFEp6-03Kqxya74Cd+hgueZ0D4xAcYNOx_R1sNqdMu2JrMBynw@mail.gmail.com>
Subject: Re: [PATCH 4/7] arm64: dts: qcom: sm8450: Add CAMSS device tree node
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
X-Proofpoint-ORIG-GUID: N5Xp7daYzm_PEpnpQ5fdlrQFtx6J_Sj4
X-Proofpoint-GUID: N5Xp7daYzm_PEpnpQ5fdlrQFtx6J_Sj4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2NSBTYWx0ZWRfXwVMk2WeoToNY
 aIIvVO2gUAhjxeOFjOCVGneAEJho6bnusktbbAYHDcbV941xHEZcS6tRi4LbYm9jG9c5zDlvjLC
 Zd+jZrNcIFK7RF+kymuXvoVYyQp1zqb3wgCf3yDUiPq1aqRhNnnB1lxRVFm5Y0thNfEw1v6M2S0
 +6Uce4LcJrR7108zgaKTFpm1/e8Rh4iNPBZrCGIssJ5kFgo5zv/2Teq9opk9y7md+HrBy6PkVnX
 VoBOfFZyx9oCaXrNHGN2QBjy4zUoHh1z83stUJBVUC8SFG4fuQWY2lvWW60RDmQ/Lzngnb7Z0e1
 PBsSvEsektjDTMHJTpQBcy5lYB1s0RssPnmnm6ooSyjKpfvmO+li3C3sdE1KdEI01MK26wsbcmj
 vtlpCGrW4olJ6IPPhKtlnKZyah0pLD6wA9Jd9QNd1FqBMP6L6UVhB5EofgixYONeD099jaYIOc2
 s2F5pCUS4ow4K5+JyYA==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf8095 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=CP7Bxe8K6-T5ouT_cGcA:9
 a=zuU9ftv1oXrSxlMI:21 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2NSBTYWx0ZWRfXx7XmXj7qL0cU
 jODggsbIZhHYbL7Tj7QRRBovhoiyb3nhfk4HUplaPeaJCS9xzAC4VUVnLnMN5KQjZOn9FFXM6KJ
 usUFQ0iAY50f5lzuNJB8E9im2ChAIy4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260065

On Fri, Oct 23, 2026 at 6:31=E2=80=AFPM Vladimir Zapolskiy <vz@kernel.org> =
wrote:
>
> Add Qualcomm Waipio CAMSS device tree node to the platform dtsi file,
> the CAMSS input ports are connected to output ports of CSIPHY devices.
>
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 167 +++++++++++++++++++++++++++
>  1 file changed, 167 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/q=
com/sm8450.dtsi
> index babf1a4196a1..7f5b0501a23e 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -3310,6 +3310,167 @@ cci1_i2c1: i2c-bus@1 {
>                         };
>                 };
>
> +               camss: isp@acb6000 {
> +                       compatible =3D "qcom,waipio-camss";
> +                       reg =3D <0 0xacb6000 0 0x1000>,
> +                             <0 0xacb7000 0 0x1000>,
> +                             <0 0xacb9000 0 0x1000>,
> +                             <0 0xacbb000 0 0x1000>,
> +                             <0 0xacc6000 0 0x1000>,
> +                             <0 0xacca000 0 0x1000>,
> +                             <0 0xacf6000 0 0x1000>,
> +                             <0 0xacf7000 0 0x1000>,
> +                             <0 0xacf8000 0 0x1000>,
> +                             <0 0xac62000 0 0x3000>,
> +                             <0 0xac71000 0 0x3000>,
> +                             <0 0xac80000 0 0x3000>,
> +                             <0 0xacc7000 0 0x2000>,
> +                             <0 0xaccb000 0 0x2000>;
> +                       reg-names =3D "csid_wrapper",
> +                                   "csid0",
> +                                   "csid1",
> +                                   "csid2",
> +                                   "csid_lite0",
> +                                   "csid_lite1",
> +                                   "tpg0",
> +                                   "tpg1",
> +                                   "tpg2",
> +                                   "vfe0",
> +                                   "vfe1",
> +                                   "vfe2",
> +                                   "vfe_lite0",
> +                                   "vfe_lite1";

Is there a camss "top" register to describe here? e.g. to retrieve the
CAMSS hardware version.

> +                       clocks =3D <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +                                <&camcc CAM_CC_CORE_AHB_CLK>,
> +                                <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                                <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
> +                                <&camcc CAM_CC_CPAS_IFE_0_CLK>,
> +                                <&camcc CAM_CC_CPAS_IFE_1_CLK>,
> +                                <&camcc CAM_CC_CPAS_IFE_2_CLK>,
> +                                <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
> +                                <&camcc CAM_CC_CSID_CLK>,
> +                                <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> +                                <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                                <&camcc CAM_CC_IFE_0_CLK>,
> +                                <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
> +                                <&camcc CAM_CC_IFE_1_CLK>,
> +                                <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
> +                                <&camcc CAM_CC_IFE_2_CLK>,
> +                                <&camcc CAM_CC_IFE_2_FAST_AHB_CLK>,
> +                                <&camcc CAM_CC_IFE_LITE_CLK>,
> +                                <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +                                <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +                                <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +                       clock-names =3D "camnoc_axi",
> +                                     "core_ahb",
> +                                     "cpas_ahb",
> +                                     "cpas_fast_ahb",
> +                                     "cpas_vfe0",
> +                                     "cpas_vfe1",
> +                                     "cpas_vfe2",
> +                                     "cpas_vfe_lite",
> +                                     "csid",
> +                                     "csiphy_rx",
> +                                     "gcc_hf_axi",
> +                                     "vfe0",
> +                                     "vfe0_fast_ahb",
> +                                     "vfe1",
> +                                     "vfe1_fast_ahb",
> +                                     "vfe2",
> +                                     "vfe2_fast_ahb",
> +                                     "vfe_lite",
> +                                     "vfe_lite_ahb",
> +                                     "vfe_lite_cphy_rx",
> +                                     "vfe_lite_csid";
> +                       interrupts =3D <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>=
,
> +                                    <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 640 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 641 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
> +                       interrupt-names =3D "csid0",
> +                                         "csid1",
> +                                         "csid2",
> +                                         "csid_lite0",
> +                                         "csid_lite1",
> +                                         "vfe0",
> +                                         "vfe1",
> +                                         "vfe2",
> +                                         "vfe_lite0",
> +                                         "vfe_lite1";
> +                       interconnects =3D <&gem_noc MASTER_APPSS_PROC 0 &=
config_noc SLAVE_CAMERA_CFG 0>,
> +                                       <&mmss_noc MASTER_CAMNOC_HF 0 &mc=
_virt SLAVE_EBI1 0>;
> +                       interconnect-names =3D "ahb",
> +                                            "hf_mnoc";
> +                       iommus =3D <&apps_smmu 0x800 0x460>;
> +                       power-domains =3D <&camcc IFE_0_GDSC>,
> +                                       <&camcc IFE_1_GDSC>,
> +                                       <&camcc IFE_2_GDSC>,
> +                                       <&camcc TITAN_TOP_GDSC>;
> +                       power-domain-names =3D "ife0",
> +                                            "ife1",
> +                                            "ife2",
> +                                            "top";
> +                       status =3D "disabled";
> +
> +                       ports {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +
> +                               port@0 {
> +                                       reg =3D <0>;
> +
> +                                       camss_csiphy0_inep: endpoint {
> +                                               remote-endpoint =3D <&csi=
phy0_out_ep>;
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg =3D <1>;
> +
> +                                       camss_csiphy1_inep: endpoint {
> +                                               remote-endpoint =3D <&csi=
phy1_out_ep>;
> +                                       };
> +                               };
> +
> +                               port@2 {
> +                                       reg =3D <2>;
> +
> +                                       camss_csiphy2_inep: endpoint {
> +                                               remote-endpoint =3D <&csi=
phy2_out_ep>;
> +                                       };
> +                               };
> +
> +                               port@3 {
> +                                       reg =3D <3>;
> +
> +                                       camss_csiphy3_inep: endpoint {
> +                                               remote-endpoint =3D <&csi=
phy3_out_ep>;
> +                                       };
> +                               };
> +
> +                               port@4 {
> +                                       reg =3D <4>;
> +
> +                                       camss_csiphy4_inep: endpoint {
> +                                               remote-endpoint =3D <&csi=
phy4_out_ep>;
> +                                       };
> +                               };
> +
> +                               port@5 {
> +                                       reg =3D <5>;
> +
> +                                       camss_csiphy5_inep: endpoint {
> +                                               remote-endpoint =3D <&csi=
phy5_out_ep>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
>                 csiphy0: phy@ace4000 {
>                         compatible =3D "qcom,waipio-csi2-phy", "qcom,x1e8=
0100-csi2-phy";
>                         reg =3D <0 0x0ace4000 0 0x2000>;
> @@ -3349,6 +3510,7 @@ port@1 {
>                                         reg =3D <1>;
>
>                                         csiphy0_out_ep: endpoint {
> +                                               remote-endpoint =3D <&cam=
ss_csiphy0_inep>;
>                                         };
>                                 };
>                         };
> @@ -3393,6 +3555,7 @@ port@1 {
>                                         reg =3D <1>;
>
>                                         csiphy1_out_ep: endpoint {
> +                                               remote-endpoint =3D <&cam=
ss_csiphy1_inep>;
>                                         };
>                                 };
>                         };
> @@ -3437,6 +3600,7 @@ port@1 {
>                                         reg =3D <1>;
>
>                                         csiphy2_out_ep: endpoint {
> +                                               remote-endpoint =3D <&cam=
ss_csiphy2_inep>;
>                                         };
>                                 };
>                         };
> @@ -3481,6 +3645,7 @@ port@1 {
>                                         reg =3D <1>;
>
>                                         csiphy3_out_ep: endpoint {
> +                                               remote-endpoint =3D <&cam=
ss_csiphy3_inep>;
>                                         };
>                                 };
>                         };
> @@ -3525,6 +3690,7 @@ port@1 {
>                                         reg =3D <1>;
>
>                                         csiphy4_out_ep: endpoint {
> +                                               remote-endpoint =3D <&cam=
ss_csiphy4_inep>;
>                                         };
>                                 };
>                         };
> @@ -3569,6 +3735,7 @@ port@1 {
>                                         reg =3D <1>;
>
>                                         csiphy5_out_ep: endpoint {
> +                                               remote-endpoint =3D <&cam=
ss_csiphy5_inep>;
>                                         };
>                                 };
>                         };
> --
> 2.53.0
>
