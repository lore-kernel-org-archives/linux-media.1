Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC7E3B71AE
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 13:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478194; cv=pass; b=dzjmwZ5cKmjxTJAD1hX9xjx/pxeplcU/HAj8OvzwfysiWffqcZYt2s+6qQutku1cp/DOBb7qsYcEtR7lSTgwiTiNJdcNVKPLMz2XwY49sU99dTpTN4OH1bG86TQo1iusOELgGl0jf+srjh99OvzvwOWiOUdIT6fYaXetYWALVW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478194; c=relaxed/simple;
	bh=Umy4UixY++SgteGltOtHsHInguxQebTVHTZPxtYm5cY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S61p6HP7Dr/ggqfGiSM7QGzgtGpKyhSAUT1tpHnP+Lotq7qne56ThTTPZL6i8icdB9UThZpFJRfMBJtHcpkozEzDZ1Is7ePEBd4ABrkOreRnDYLnxODBcAIKzS3EQwoQ5LTGH5Tln0VhoViYOBt16om4PGF+09mAv2q7V8QYzto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZ/pr0uM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=crdpIzD9; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZ/pr0uM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="crdpIzD9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD0YCP3756861
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 13:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6+5FlZ/vYyUsOugMS9Yt63iT/83jOSrwno/FFbA8XRA=; b=MZ/pr0uMHehyTcXi
	2BbA9GXmR3uBVOv6JWct4C+BPZSgpJ4UpJiHWh51LCwjnKXwTuImW00uIh8mP5aj
	riC4UV05gT51MFHac00JWu5Hwnbkfi+O5tjIX2/q/BxxD2asEJsguA5BhdFtNbzl
	CJqHcXcU9osutP63xBsfMlCgkNXwHf5P81lVvGiRo9eMgpl50arsf6CSST4R90bt
	b/TAjZL8LlS2BnbByKwPAGC5On2ZdpTvDbr4JkOOGE9pGMzoWw9oteCdeNeqiL2J
	X7XWxaJl4EFJtaWN9XyK/eRSkIuktUQW/PdlpVY9/sF4C3oyC8eBLWv/ehUsxdFQ
	H3FRPA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq38e0yvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 13:16:30 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9104ba8bf51so129998806d6.3
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 06:16:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789478190; cv=none;
        d=google.com; s=arc-20260327;
        b=MCXYMRrsBvRCbgpwvySkx1biSTrip9q4SE+C2LzheVGDPZRqxaVIxKCHsHLdiqR2V1
         a5Wzv8dHZu319n98OWFP9SLU96gF7vq00vgLPyTFnnJLiLEtu+ABvPKxbmrPSaVnpAfp
         /5EJIpFG2rFnwzuyhdgB0kxgzMedHk1F5JiugJrOimRSXMoOaL09CwRkSiXqT9stfRoX
         kxtfFkrHNmTCGPZ+BPWsqlAGXE2sU0/7YiJjlCkRyzbWDMfdcsSV5YxQv0f91ulQ3WqA
         0+tUUWQFELyc5OLU8bpRBqg2HusSeMZuW8xHRpRFshSx56a4vLK+5gSarA4/lINAQ1yQ
         /0eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6+5FlZ/vYyUsOugMS9Yt63iT/83jOSrwno/FFbA8XRA=;
        fh=+aKz0cwMJMNmvZjsn4oYPplK/zyiddUfYFqxfsf9Cdg=;
        b=dHWAYEFN518xAZY0hJj8K6pyr7VJ2KK4pIAYjNKDI+06E0wkEFIW/8j0M9CoDIcIfs
         r8jHL5PosnkGndGryhJJ8Yy3dGfsOAiOKK0J/nVFJpXK6b0YQoXgP84Xubg1Huuf6ofx
         Atta9DHWJ/lHtzp+QcR4H21c3HgvmS0ayXLqQ0tapTMaLbfyZLM1+hbWFjQlXOZ1kCgT
         0lqcLgx0srOjQVllE4feYSKZndSQ5GGHqDbz8AAswP4FPsxUgRHHD7b6gNlRpMjPjZsA
         zDPR6HvF70WfZwjqJbivHXyMjy0zZRY3dgl9S8KKMl8otivbC3zd9sa+HD20nM3uy4Dh
         7hpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789478190; x=1790082990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6+5FlZ/vYyUsOugMS9Yt63iT/83jOSrwno/FFbA8XRA=;
        b=crdpIzD9Zddvf16MQ+fvqbXu3ssY8y6ED2grBdkzRp+JxeZKazZHdO96aaEbcfbzG5
         wkasf3mDl62LZEoy/Hm5JJ+9ba3RFupB4HptF8qZfp3QoNyUaGa6zBoWL1FXuryr8TFF
         A5XF10z6XaQOWpgZgDdIi5T5bbwIy1gteHmifbxjLPSn4Sml0Aud4Oee7279zOxkcdO6
         8dd2CVGalsMBqXoqUIsULDYBQmr7F2umi1nRUH9h634ssCjXjuQs3MQYBpDfX2DCDBF0
         E75icJ6VMc8Gjw/i6vF1W1cS2YoqlZbJoCz6Kw32TapvHw6ka6zgSrZCKPP2UQ3dq9Cl
         o0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478190; x=1790082990;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6+5FlZ/vYyUsOugMS9Yt63iT/83jOSrwno/FFbA8XRA=;
        b=sGBjP03lzDDu2lkgQMLVTfyX/ILfDtZnUDxZc2j51DIGRNFwQqFoKYNfb64FQ4oLWz
         7CmtuuuW4I1ZE3yEAPLGHrJRjyOnYBn9MZ1spwvlcjaiQOCjV86A+x3EEcPwoTa57eOr
         brwQCQMsgJyP4iW+dqSbbF/bt1rx+t7KOAquW8MctbYt3QQQA8SBsHENh17WsBHFtlOo
         GC1v5ukvrfrh9UiJfEwCkfb9n/oDPUPvyYVcPc7HYyKCaLzy7mMZkWsOKlQjF5gaHhiG
         4bS1zRq8nCaEakTFQEqX76MbuxsmpP79ZHM4Mm1VWp5zP/cw4aKd0fCPu8TpspRzyj5i
         Xs/A==
X-Forwarded-Encrypted: i=1; AKwUvBxvKx4t6kXxuQ3edemj1xPoV5LiAutus3Gxla2TidfI+2rmueUldoI37TnmKHshicnZ9/PpOK/R6ZsMiA==@vger.kernel.org
X-Gm-Message-State: AFuF++lcYwX1ivw8Vt7cnNkGSK+CkeSFwX/JOwh92qTL7H0ENW48ImnA
	J3MGCMUKFEbjFY3w9nxITpnIhQstwQuVfsSSUYL+m6rINaj0ZsKLyvejnSsH1eHaoTCyHZjZ6/E
	7mVCFwA5VxJlQNsRIYCGP9AM2BYdj5MSmFS8K8jqcuVfbuETGwYX5OAhUAEUioAM/SP1CxN72+r
	LslBqVZ8QZ6L1qbADlGuGXRfg6OQTcxxAWrjoMXmLx
X-Gm-Gg: AYBFou0WRaEwB8WT2u2vPi0xOqHjOZk9I2CXiO+GcaYyDZoEPlW82fACMpjSmZRs3PP
	EappsPwhXYYwCdKpABc1uUfyBP4j2v+IuGl26Wev0dIsONOfuS2txPEA9TyTKz20E4/XiJa2FN5
	YM3N8kvqZTfnwoqBuloIl+32g/8O7APUNEfaKLn6fgPHVwEi0VKf3re5k2om3HG+Czw8CfO3V3j
	bEbdDkmD/bDc2DCXdUXcbOr1ZBjZWonEazVOOTOGa6berJ/i4Pty8scUYF30joiUzdM/nPICNLP
	vvgiWafQRAnepsz29jwyH/fKVS4u
X-Received: by 2002:a05:6214:2502:b0:907:aec2:6cdf with SMTP id 6a1803df08f44-9122e4d4d70mr125570456d6.8.1789478190162;
        Tue, 15 Sep 2026 06:16:30 -0700 (PDT)
X-Received: by 2002:a05:6214:2502:b0:907:aec2:6cdf with SMTP id
 6a1803df08f44-9122e4d4d70mr125569076d6.8.1789478189559; Tue, 15 Sep 2026
 06:16:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com> <20260915-kaanapali-camss-v16-10-c9f3f6f4180c@oss.qualcomm.com>
In-Reply-To: <20260915-kaanapali-camss-v16-10-c9f3f6f4180c@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 15:16:18 +0200
X-Gm-Features: AcwNN1WlCsIpxF439wrL2CsX_tzvfAP7PCtoKh22IjbmdA2tRpcX-iSmEK4TRkI
Message-ID: <CAFEp6-0rkoCLP19_veAWWBa7JPJMkZiTSy3tf_NyDHC0rFcnew@mail.gmail.com>
Subject: Re: [PATCH v16 10/11] arm64: dts: qcom: kaanapali: Add CCI controller nodes
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Yadzdo2hezfwSUrn_nlU39dY6iym8HfO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE5MiBTYWx0ZWRfX6rd4YTSZMmVu
 E+ZBeTK5oO9tu4kgjFhRXIVlRyIPvdszBSPE80IkWOntEJk3wRsbvxpeNtCXne+7wpIEI8GpsBx
 ohYVBzC8R3FJ+eTBHBBFveDwDRaaF94=
X-Proofpoint-ORIG-GUID: Yadzdo2hezfwSUrn_nlU39dY6iym8HfO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE5MiBTYWx0ZWRfXwMxmE43/Civp
 gfEzE2bLyPBDR0K5jLMwQJ5uLfUP874ReU2EOVH5NbjnHDKcjFl8xmiBeQM0bOVsK/KEF/NVcac
 dmQtWe548C2rdEVxi1IW8cm4gx8HM9KOcg+/03HZSPSOeMOzCvVLZgxbSODyMuamUD9sGWtMBzM
 3qP1HDLGVpMW1/JnkW5XF5uUjAjMLwUW5WzxkWrHj7Vq++PVGjc94HJjjEpx1X3DAYTlCqJzdeU
 o2MUZMxIvmhTHNpmAD5VIb2RrkrL/PFHbNxKPVKWKjCDEw140Zi6w/LyJot/4ZHS115ILI6LkZb
 gHDqhrfdJf5nGjz/uddUFyBi1ueNozi13OHv6VTvJ9v6mKCBTF398U4XoiCsaBB3u1lRuDkKr7x
 xI+trG0pNKpvElOYe1HK/x/E87adx72YH+q4/VG7SBof7BEuwgpCLDk8iOgvCvk+q/94YMKWLKO
 2RIczAHMA00V599If4A==
X-Authority-Analysis: v=2.4 cv=BswIUoX5 c=1 sm=1 tr=0 ts=6aa9452f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=fkeUGm9nBk2YKbx3A_4A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150192

On Tue, Sep 15, 2026 at 12:10=E2=80=AFPM Hangxiang Ma
<hangxiang.ma@oss.qualcomm.com> wrote:
>
> Add the three Camera Control Interface (CCI) controllers present on the
> Kaanapali SoC. Each controller provides two I2C hosts used for camera
> sensor control, so define the controller nodes and their pinctrl states.
>
> The first bus has two CCI bus master pinouts:
> cci_i2c_sda0 =3D gpio109
> cci_i2c_scl0 =3D gpio110
>
> cci_i2c_sda1 =3D gpio111
> cci_i2c_scl1 =3D gpio112
>
> The second bus has two CCI bus master pinouts:
> cci_i2c_sda3 =3D gpio113
> cci_i2c_scl3 =3D gpio114
>
> cci_i2c_sda4 =3D gpio107
> cci_i2c_scl4 =3D gpio160
>
> The third bus has two CCI bus master pinouts:
> cci_i2c_sda5 =3D gpio108
> cci_i2c_scl5 =3D gpio149
>
> cci_i2c_sda6 =3D gpio115
> cci_i2c_scl6 =3D gpio116
>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

We used to configure an assigned-clock-rate for the CCI core clock to
ensure it generates the desired CCI master bus frequency (for example,
a 1 MHz bus requires a 37.5 MHz core clock). Is it safe to assume that
the firmware, or the default platform configuration, already programs
the core clock to the correct rate?

Regards,
Loic




> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 303 ++++++++++++++++++++++++++=
++++++
>  1 file changed, 303 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dt=
s/qcom/kaanapali.dtsi
> index 84b93914ad53..02f8dab30b91 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -3514,6 +3514,117 @@ port@5 {
>                         };
>                 };
>
> +               cci0: cci@941b000 {
> +                       compatible =3D "qcom,kaanapali-cci", "qcom,msm899=
6-cci";
> +                       reg =3D <0x0 0x0941b000 0x0 0x1000>;
> +
> +                       interrupts =3D <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>=
;
> +
> +                       clocks =3D <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +                                <&camcc CAM_CC_CCI_0_CLK>;
> +                       clock-names =3D "ahb",
> +                                     "cci";
> +
> +                       power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +                       pinctrl-0 =3D <&cci0_i2c0_default &cci0_i2c1_defa=
ult>;
> +                       pinctrl-1 =3D <&cci0_i2c0_sleep &cci0_i2c1_sleep>=
;
> +                       pinctrl-names =3D "default", "sleep";
> +
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       status =3D "disabled";
> +
> +                       cci0_i2c0: i2c-bus@0 {
> +                               reg =3D <0>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +
> +                       cci0_i2c1: i2c-bus@1 {
> +                               reg =3D <1>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +               };
> +
> +               cci1: cci@941c000 {
> +                       compatible =3D "qcom,kaanapali-cci", "qcom,msm899=
6-cci";
> +                       reg =3D <0x0 0x0941c000 0x0 0x1000>;
> +
> +                       interrupts =3D <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>=
;
> +
> +                       clocks =3D <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +                                <&camcc CAM_CC_CCI_1_CLK>;
> +                       clock-names =3D "ahb",
> +                                     "cci";
> +
> +                       power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +                       pinctrl-0 =3D <&cci1_i2c0_default &cci1_i2c1_defa=
ult>;
> +                       pinctrl-1 =3D <&cci1_i2c0_sleep &cci1_i2c1_sleep>=
;
> +                       pinctrl-names =3D "default", "sleep";
> +
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       status =3D "disabled";
> +
> +                       cci1_i2c0: i2c-bus@0 {
> +                               reg =3D <0>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +
> +                       cci1_i2c1: i2c-bus@1 {
> +                               reg =3D <1>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +               };
> +
> +               cci2: cci@941d000 {
> +                       compatible =3D "qcom,kaanapali-cci", "qcom,msm899=
6-cci";
> +                       reg =3D <0x0 0x0941d000 0x0 0x1000>;
> +
> +                       interrupts =3D <GIC_SPI 428 IRQ_TYPE_EDGE_RISING>=
;
> +
> +                       clocks =3D <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +                                <&camcc CAM_CC_CCI_2_CLK>;
> +                       clock-names =3D "ahb",
> +                                     "cci";
> +
> +                       power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +                       pinctrl-0 =3D <&cci2_i2c0_default &cci2_i2c1_defa=
ult>;
> +                       pinctrl-1 =3D <&cci2_i2c0_sleep &cci2_i2c1_sleep>=
;
> +                       pinctrl-names =3D "default", "sleep";
> +
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       status =3D "disabled";
> +
> +                       cci2_i2c0: i2c-bus@0 {
> +                               reg =3D <0>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +
> +                       cci2_i2c1: i2c-bus@1 {
> +                               reg =3D <1>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +               };
> +
>                 csiphy0: phy@9523000 {
>                         compatible =3D "qcom,kaanapali-csi2-phy";
>                         reg =3D <0x0 0x09523000 0x0 0x2000>;
> @@ -4224,6 +4335,198 @@ tlmm: pinctrl@f100000 {
>                         #interrupt-cells =3D <2>;
>                         wakeup-parent =3D <&pdc>;
>
> +                       cci0_i2c0_default: cci0-i2c0-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio110";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio109";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +                       };
> +
> +                       cci0_i2c0_sleep: cci0-i2c0-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio110";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio109";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +                       };
> +
> +                       cci0_i2c1_default: cci0-i2c1-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio112";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio111";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +                       };
> +
> +                       cci0_i2c1_sleep: cci0-i2c1-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio112";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio111";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +                       };
> +
> +                       cci1_i2c0_default: cci1-i2c0-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio114";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio113";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +                       };
> +
> +                       cci1_i2c0_sleep: cci1-i2c0-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio114";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio113";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +                       };
> +
> +                       cci1_i2c1_default: cci1-i2c1-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio160";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio107";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +                       };
> +
> +                       cci1_i2c1_sleep: cci1-i2c1-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio160";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio107";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +                       };
> +
> +                       cci2_i2c0_default: cci2-i2c0-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio149";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio108";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +                       };
> +
> +                       cci2_i2c0_sleep: cci2-i2c0-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio149";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio108";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +                       };
> +
> +                       cci2_i2c1_default: cci2-i2c1-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio116";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio115";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +                       };
> +
> +                       cci2_i2c1_sleep: cci2-i2c1-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio116";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio115";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +                       };
> +
>                         hub_i2c0_data_clk: hub-i2c0-data-clk-state {
>                                 /* SDA, SCL */
>                                 pins =3D "gpio66", "gpio67";
>
> --
> 2.34.1
>
