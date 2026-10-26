Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793030123;
	b=wtOjm5f7/ZGmt0oga5WQvBJyORQPpePNKd6JxSkgW091xSRs+iPeIc+daeaJISheZYCs
	 mZdHOK5SO9+KJj1kO3mVkAaR0Sa/V9pUNsdguSXaYlE4KEX4KHeEsoWndv3tcexXhXuW0
	 uXfasaOkXICHstTh/6F0bBVg3Bi4x2eMtP9Ne+srEhvRtExIB22wXInAtiIutYWLGFNPz
	 400PD3SSQfSBBzZhuQsJC5kDVv2e7TVSt1wbUv5jKw3T/TsZYbXXVU72zVjFXSSYQYGGH
	 annX8fFKM36XJWYlhDW8AH4B5YZqL7Of+3iY+aGunDtYtdbLcGJnJSjA5RlhOTBnwhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030123;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=08tb8cGUQgTzlrNjhvrJlu5bOc9BnVgBL+7qiR0zeco=;
	b=EuA5uwlgtZaDV2PQg3p21MjpvisxtYoo7LxB/lhDAw1AeYKr8eu/z9G+Ag8cMYZ5mzjo
	 N3qurLDHy2rW5e9eEPrVpfY4sa76AtZ00tPANot2jyLwB6KnlVQv9wu7zSRc4Wl33w8Pg
	 j+z4OhTAD3JB5cTyOhNaM06kudt9cqT0etlIb+67f6+2WdslnDL41Q+Jz/JZKv1loUXgA
	 gCZPRfoVGweHDa9/NmJvXBobA38pxT4DbpzNrN2LIvFItcbOLxjwyrOs2OKrzvkywBrXM
	 1aBI//u0mxN9JEtUUcw+xvv8bQL9+PafRmhWVL+4aBUxlQJJq04s/aoqLKwUeueJGJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lWPPxewv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="fPJ9y/io";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67948606A31B
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 15:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67948606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lWPPxewv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fPJ9y/io
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvpnE466134
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 15:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	08tb8cGUQgTzlrNjhvrJlu5bOc9BnVgBL+7qiR0zeco=; b=lWPPxewvOGSt1NOm
	Ok7CRiQeGvMVBomvdj+svWxYv2ppApqDxoT3WBi0xpMQ8Tf9gHOYDDFRQCBYwpop
	aniQ5KnIaoDG79D2iWs9RMqQLqJfe3qzAsMVrFVnCaJMvBFX/Yp5dk3OrOcHv2Gg
	ZKPNVFfbG88l+3GxzEHzS7NgAPAm595Mp8PKIuy/nyfeJrv5XEZ8wh/rTlfTqd9H
	MmwhS2A5KiwrpbPxM6tyokNsNNsgovb3tiZSODe/nTocJKYLlHn95xNgMoT5T4Jb
	Lr6LSxF50LhrLtMpk9inZSkQSTAwaoxuDj6uQJ8QQgLyQHfvcMQ1M/QDTlRSzNSq
	YK0q9w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshpu6kp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 15:55:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936aa34873bso616137585a.3
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 08:55:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793030121; cv=none;
        d=google.com; s=arc-20260327;
        b=ZctnrqxV29BVeRAThIoy/RkiAHwi2VAYv1vK46ESWQznOTHQRdCPD8XTZBpwFvltei
         pXkGcF3a/gxmaQ6yjR2IlpIRSWnfTZzhh9+DJgd3TXZ5miI7OEmPFnApFCT5q2IdFldT
         bbSLo98LSI1b1lYa1WAQYUTDaenByQLcXU7O11zr5zaVHKNjO36kVie5vEB7c1zLPTWn
         vdlqbsd6IskOqqUUApeYBdB1qYX81LBYUSXAhkVNGwH8Bg4d5XuZudK85b7aGY7a6Blm
         cMWxya0g+9U75nWm3hbpKBuhTQRg/Xmd32MCxkpVPZiMKuWaG43Hk6fWfQyy/f87iGFX
         ZfOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=08tb8cGUQgTzlrNjhvrJlu5bOc9BnVgBL+7qiR0zeco=;
        fh=+3UPhlqdVWfDVQi0IhIstGFJmV6tPOUgr+qkZBnllLA=;
        b=OMuomhit3zrkvVTYrj9yqBBeQb6ko1awd2tEGSK+KmnOl67h6//9HSqp9vmBRSecBS
         So3kN6hbABCk2bhgEwUlpc4SXVNvLiSYBcv0TLsmYzxDB0lLQXZAlY9YUS/k6I8RgJVr
         YonQP7i+8hOf/89o/BH9opUXQMU1TkRD3XqEdMeoL804WXL+FhKD4sL04789z1jGLaRa
         3buxI3A4VlseAC2h3dz6Q95kVtah8selJutfu2GhVx6VabtaMvebQKp3EWk++b3J8bzV
         WsayMkyvf6ZUo+0IKC6J7gZk0zn3be1JSis0MVf+v+73vgthzVljpfVPT938jGay/qeY
         CkKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793030121; x=1793634921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=08tb8cGUQgTzlrNjhvrJlu5bOc9BnVgBL+7qiR0zeco=;
        b=fPJ9y/iojzimRkzobifb4PXrCoO5h53pEhte+j6mhhhIgkqMWtrROWa6+O8bsIaVzv
         w9wnhGyibi7u1EWPBr/2O+0msgKQiwyDfS0hNTWi6SCBE+Tm44HX1xhCZtN+c60bfosm
         iCS/f7JokW7lkb8h9hbJCYt4/lb9rCF5WfDXYMUOczmz4ZQBHJYVMWeXcmopourC82WN
         CVcAg16wFN+kb5YhFb3y7SJNvNyecbL+KU6i+n4cEv4mn37P+E+AahQwPBe81iVQpRPO
         dI8sVtwqXzU9kjfN68t2LSISGSBfipAo9yubUTLy/ITFKu2+tDEZcrIxXLJpYKonvVod
         p9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030121; x=1793634921;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=08tb8cGUQgTzlrNjhvrJlu5bOc9BnVgBL+7qiR0zeco=;
        b=pEuY6WSdIkEEVr5uyuOAVxbgefpe7coYRYhGPpl4gqwT2AOKw2wYq1uAWxnuwVuGMF
         phbDTRXIcsJ76qAV7w4yRfM6zFAhr7AV1V83PfFTPBEngZj7Dy6cGe0CuUYmI8pIR1qB
         LsuAU/QUJsw9hcIoYaZwd1Xu3Tsi3tNTaqwTfCNpBB8AJLqQOJom3GN/2R4znsf1GKB2
         WP8jcZ/hA0QLhXKO2vSLknn1iT9suXIZXmKikggth+hUyFfmDgxiHoXAYSWn6AkKb6MQ
         fzPQ39T3ScO888LjgxQnjAdz+JXKXQtdBmXdmhRzuGPMpniJYPxtiCeJvAh+I6BosF8v
         RhGw==
X-Forwarded-Encrypted: i=1; AKwUvBw4+mWgMDaO4TNFlUY5Pc8fw+Z4D19vVpiA0nyUTMoO6R7edfH7Kcytp+fs8eJnLrcXeuAC/kHmERqVnQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJdbqj/srPc/Eswtc0070U3xjjKk3EUOjUF5l+dLTPSg9cf90M2
	+JqEb04T+Njmd3sVCwTILasNeP1oMo8LH+58fsxtVs7jQOIHNOcJ5qVSMyH6G+2zBoHyb9j2uW0
	n265fexeaAM/XN3ByjtzhRP11ehS44WfMtyfu6ZWlBAgcQGdG/YBypOEhUgidPbsK7faWe0ghdf
	ku2INLVq6JxnTkTcQ2FFH64/Ev5YQSgVSKcLIM5Omt
X-Gm-Gg: AYBFou2AZFQMyaYMvqUwtLP53f0BBQUSkOjoQzg6WzATTlc32BvEZxxK6yu9RVbYV7o
	H/KGVKXBN5I8ZedrxVtUbT7w0Je6KYFHRKOvfRen1s7dzeB83l6/b3JOPSKUGrVT2C+KXMuQZyu
	AUmcg5vmmu3/6sxoFAewGPZjacYx82vAqzYksBPYPk2rhWBtm0cMdMsq25rbwkPAuxvE93P5R1G
	pXbNfmNOnqVgyBIRHNVJfwWCqcRTElVczgSFM3HQ/7RJPIAVA+TbSPeMCHw/XjRYJHpdf+pludj
	fJmpa0zXj3t8MgGiUq7MtDdXTuwz
X-Received: by 2002:a05:620a:3704:b0:93f:3193:ac02 with SMTP id af79cd13be357-940ef980186mr1055272485a.51.1793030121370;
        Mon, 26 Oct 2026 08:55:21 -0700 (PDT)
X-Received: by 2002:a05:620a:3704:b0:93f:3193:ac02 with SMTP id
 af79cd13be357-940ef980186mr1055263785a.51.1793030120640; Mon, 26 Oct 2026
 08:55:20 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com> <20261024-kaanapali-camss-v22-12-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-12-7da3ea49c8a1@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:55:09 +0100
X-Gm-Features: AclHuK8WDpOBSzsVbZEzkBObqQEK9KTIZDHcYBzFPmgp6ilQX4B5wQt7XAh5H-Q
Message-ID: <CAFEp6-22zEVoTQ8ewQN4CGW9GARZB84Mp_-SO7KrteYERSew2w@mail.gmail.com>
Subject: Re: [PATCH v22 12/14] arm64: dts: qcom: kaanapali: Add CCI controller nodes
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
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MyBTYWx0ZWRfXy69JioNN3KhR
 Gu6bPBSVm3IAOM2f6rKIyoJfdYX18v2z4lDUbS5M02RcaDJUge0pLc+kwvlnJE016jj0bsgIZqo
 1jdjvyUBSWZYeNDfUFP0Pi4+Kc6+axw=
X-Proofpoint-GUID: QNtGeHdJSvHNnSjku1krCTieLllwr4iM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MyBTYWx0ZWRfXzave1pSO3yud
 +DLu0Dq0MDSjTU8p9j2568uX83sTPsXh6aZN03U5x+/WGKk34iFclMMDZyxJ0KLGiWVj6mNJoYH
 YNnQ0ZTV8e/Ooe6rZfqTkMikmqoxml5w0XB9h07O9lSoK5GhpUiwS8laFrzeKEqwyT9vGrTeAE+
 TukalINRUEHZMDtG457Fm5jxT+Xmg1qGt0zfDtyZOl2tiHTnODXDQr2HXsnhmu1vJFh0oVdvY42
 kDKBYmD9d656p/G96G02R7yd6bpyhpltspp/9upH8Mz2SyrBiVRCpDdxk9MPWOLVp0YCUfMmJcu
 DkLeECqA3jUqq+MvzevXn/NgRF20JttuyMucGIvjLKQ2sN1FgVUeIQxU671zpZ9F/2KGRNiJsDP
 HnELv/I/jrHj/jZPCj0aJxu/wnT+dDpNMixDHcNFiYjvunVXIgkr12boGKAfD1k+vQb+8ySLZWx
 0bpJlc9Fl3N0o7Y4ecw==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adf77ea cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=tIaaiuYHFHHTaTkjKuwA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: QNtGeHdJSvHNnSjku1krCTieLllwr4iM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260063

On Sun, Oct 25, 2026 at 4:17=E2=80=AFAM Hangxiang Ma
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
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 303 ++++++++++++++++++++++++++=
++++++
>  1 file changed, 303 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dt=
s/qcom/kaanapali.dtsi
> index 11df1c7c6e31..86dc1400a25e 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -3746,6 +3746,117 @@ camss_csiphy5_in_port: port@5 {
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
> @@ -4534,6 +4645,198 @@ tlmm: pinctrl@f100000 {
>                         #interrupt-cells =3D <2>;
>                         wakeup-parent =3D <&pdc>;
>
> +                       cci0_i2c0_default: cci0-i2c0-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio110";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio109";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci0_i2c0_sleep: cci0-i2c0-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio110";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio109";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };

Why do we have a sleep state if it's identical to the default/active state?
Do you want gpio with pull instead?


> +                       };
> +
> +                       cci0_i2c1_default: cci0-i2c1-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio112";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio111";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci0_i2c1_sleep: cci0-i2c1-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio112";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio111";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci1_i2c0_default: cci1-i2c0-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio114";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio113";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci1_i2c0_sleep: cci1-i2c0-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio114";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio113";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci1_i2c1_default: cci1-i2c1-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio160";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio107";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci1_i2c1_sleep: cci1-i2c1-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio160";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio107";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci2_i2c0_default: cci2-i2c0-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio149";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio108";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci2_i2c0_sleep: cci2-i2c0-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio149";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio108";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci2_i2c1_default: cci2-i2c1-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio116";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio115";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci2_i2c1_sleep: cci2-i2c1-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio116";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio115";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
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
