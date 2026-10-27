Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793097097;
	b=TOZw+hi3fUooVtneloeQmH7Px31kqoKGKbWXJ2mJxnF40xQWiUDsi93d0y2gljHnogal
	 Uez60ARRlh0S2paE0JPjLATqnCsGsOIKRnZTLNye/8tYwvzPizwWx5KaHvA1azpRVpDY/
	 6JAiH0WdEF8kejAMZNVtDbpX+HhRromm3lmm4sriF23YklWBYv2mb8QETv5um5/LVO0cW
	 2Kp+oMLjt+F+6hfkmaQzlxEe30VzIDj3xREZBDtpjpoGSyA6Dih1CxuMpiFXDgQ5na3Wx
	 4olmeuIN8WfwGShnP1qUbzqESyFnCfyH+U3MO7+V4wX3ziR8k6K+/Pxev2O5ktIwVfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793097097;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Vn4pKcdJpH4mb0SDRmgSSuNabQ9IF5FHcbnz/6As7I8=;
	b=iWb9h7wVDRsFk47NcU6s9gK2dmzoKlZ6pSHXP1alp7nWDYgnUpwLSu0jtSHOhfUXQd5L
	 zDxKVV3XOmEtBaLLwGV4wR1gbh78qKKK9cPQKGXts9IBx7/hHIvwhbHSxYKEVXuB6rGcH
	 Lff4SCrwr56UIh9dVnU3yyBWN6Jg2X8cJPFyWxHYH6vUbCLhDeRgozYI/dWlM4BmIGCuf
	 BVrNNq9DBW/ryjABB9xOgndvzCZ21GvHlEbJXUIX3pW9FhBiTuABCfi///bveOQmTA+FM
	 NKEv8dXi+gxni5KFe5vbziaibcaD9BlbTp5rFo1kogQEkMlyk5UQfOVKmjw1bGvVpTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WnGtiMhh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OeCtqmRY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5847F606A31D
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 10:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5847F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WnGtiMhh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OeCtqmRY
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8g4Cn1672062
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 10:31:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vn4pKcdJpH4mb0SDRmgSSuNabQ9IF5FHcbnz/6As7I8=; b=WnGtiMhhfsYTl8cu
	sESZNGF9KAb5/H9TX4GjXn2H9xmokH3MmRiFGZVOGWI5dVlPYbKeq7wowygry0E2
	bbvpLEu2Wl7TT0CuDDiCh0sBG5oERy0/TLgAzq6Oi6jhrVgXGtXUUXBbA0QSFp7A
	fQngbtRt8WZb9k3FG2j+KqXN2JnH2ZpSj+cBOM9foKYwx4Fui6+El9/btIoAhxiI
	u1y+cY7zRIcKLgcUFPZ6qpyTaA40S+nJjDEoTkKpMOHNWq7J6drOPD0A/YoYbwhc
	jDozwtJpXKpB1YQF++61E7wXNIuD/0TVmEKsz4LGs/zIWxnvwpk8FeCfvLmNLnJ6
	Ofw7QQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjfavtcda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 10:31:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f33438950so962629885a.1
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 03:31:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793097094; cv=none;
        d=google.com; s=arc-20260327;
        b=AILHdRTfXrhlr51ntyLeCDwRCdKamKhvaa2qLQmjQahZMLMu8zYuV3a709YuVagaRK
         aSh9uzCTn6EK/EnkGTPQkAvMlab/hTMqMNTdkVFcSYbioiUwGzXf6iHQlrAasoNEEG3O
         xYNpr5+NllyfawTeFCaTAShQHBvMzf3BhbC5BlLX3fbsTcNZRKExiU+4rU12YIHsuBAt
         GQ8fBYgsLiqJ3XZOgqG2v8ydC/xBeKM5sIs3O504wGS2jwPdUvw6ef/F+AV7DTPXDcBr
         JMJJIX0LmXMd2R4BmsMuPL5LC1IwKPsYib9kBkPw3Z41slxwP2N8hMsBo8wZw+SehnbG
         Lkew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vn4pKcdJpH4mb0SDRmgSSuNabQ9IF5FHcbnz/6As7I8=;
        fh=uPOUXuRZfVEqLJX32bF65Vwb3hP9iCl5/LbM754kuOc=;
        b=DYRRXlKtYGBowryYLF0YTpruONcp2GBNIfHnfBM8rFrKuV/5kfRZUsaeVZBJfaHTtF
         PnworKsIOfgGib/n0LiWqi7O5i7h3cbiWOCnAESvPeZ5FJP3oNYccJIWS7SNKluPTNIi
         PxI7RuFanMLtEw6tVc8zkSrTm9fLgRD/Kh06taTlGAsthWE6+gShhJkB+cYrZW4jRKcQ
         2UOqd4qa/dkM36I6ID1mxBKpt8lOTO7MuENb2wIFo7Hgyq0kmDG/+s3CFJvcAUOjVEFP
         oimayRPYiJNt5mbM2mf+oM6skCWp/aIDfGl6earEyNUud4E+e8gS1koLUDMc1XfUgy9i
         CzQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793097094; x=1793701894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vn4pKcdJpH4mb0SDRmgSSuNabQ9IF5FHcbnz/6As7I8=;
        b=OeCtqmRYWGueC6vZg9K0AeSpo2DBtglbgdWvU4HV9dl3wTl39ErWSO/oIPoBmBtueC
         8oaSn5zg/IalQEaHSFzGVSqSSyEiqxxdWri3iNUeMbiLSkKzPAs2hnwXI+Xx6T7zE18t
         fn8C9iOLnzh+MkmdB0Nvr+4nDpvoX9TkQkNARCkZqNfwsN3UaVG21WCerTp9CukeRlKI
         VpMT9yPZuZyvyD8qFHfVGSB5NRXWDwnGtRJKaHV4P5c2cSW5MM4EivBymkVP3mMlVPno
         DTZgwlD0I5faiXvBAWLDXwpRxE02J5jo+Z2Pd4yudizOjGcXwlrih67QH4DOgbYLs4kk
         tB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793097094; x=1793701894;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vn4pKcdJpH4mb0SDRmgSSuNabQ9IF5FHcbnz/6As7I8=;
        b=wGSa0y6QuztrOrPceeUCEWxIPf8P6xzjCB7yX9I5RfdjIiQPpnVxD6o9DSSY3NN9ea
         Y1rG1BIOOV8OVxxyHnUFyo0DFdkeiVDX6Qk/iUaFLakVRIBOFCNj2xQp/eI2wBs5uRCz
         WtIAfy4vspBxg0yxAjs2wc8OrOQsiaajj+2dYRIKITxRzlw/aFAN5RRaTO5U0YsS+H6C
         QTrc3aOp/yMg5ZCCi55tFt0+ACouoIGr6EXHAcDOGG2ScdFp1SWPwogPamfaemgxv/DU
         yfV/Eb4oHAYd49UfrojaQsOs9xULWMQrcwgHZfX1YEtArZK5GcragrosMSwEE3ECiqp1
         64WA==
X-Forwarded-Encrypted: i=1; AKwUvBxKmXLZ4hR9sSJhXqZMAJ545duVw2ODveg/eoab0viclbxKooz4krbBB07i4alEt8Ksxr4QF2P+6jLDLw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJp14vXy9i12jlkfd0QD4g7T9hzS75g4XT1dIk28I67jCpZm5aV
	FvLrKKawMTORKAI0oI73yKLfSkQWO6RNcZKOWsEeL+NRFr4t5hdu3ANulsyfGdJdyncPtPCrQzA
	c2Ah6WrxLPv7vmuQMBcPfPZTLt756KEsEnzj0EZHQ7gCi/yAGRTCHLVEAHMT/6jkarOLRbzvaaB
	7s2IImjlZ7gz96E97dKU9k7ValQXGo6Nq8q6/RMGtf
X-Gm-Gg: AYBFou0FbfN6oIKG6UQlra3MQcfAqR+BeqMNfdSxxqYgJo55AncFG3tOTMDNFkQOzzM
	FQzjisRYot7xMgbZdpRPHoWQdxA2kZ+6CH3zEkihLqFHO/oINPpur/Uw9O3a4g4SpMQzwjHWRVn
	h5o9S0GjGq83k/APl3MDjUU8LKUxUM3VeijcJ+oErbeTdt4OuCoj0OeX34pRBWx6FTloZ9H7FdC
	5xeMsRxCBTb71JM9aFTBfAxqp8xjVoHzaGlSQmsvp/rondJ1IlH78kGuWDFI/A60sKNq4FKYM3U
	hRlGrbp5TkltSCxrljldd3qYvmw/
X-Received: by 2002:a05:620a:4444:b0:93f:2b65:f47 with SMTP id af79cd13be357-940ef8fce6amr1393812485a.25.1793097094447;
        Tue, 27 Oct 2026 03:31:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4444:b0:93f:2b65:f47 with SMTP id
 af79cd13be357-940ef8fce6amr1393808285a.25.1793097093915; Tue, 27 Oct 2026
 03:31:33 -0700 (PDT)
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
 <CAFEp6-03Kqxya74Cd+hgueZ0D4xAcYNOx_R1sNqdMu2JrMBynw@mail.gmail.com>
 <378094fb-5f7f-42c6-a91f-158e2083a6cb@kernel.org> <CAFEp6-3XTotgkOKRACGLT91wUw30CgFB=44RtHnXfA6cOF7bVA@mail.gmail.com>
 <0d25a732-ccd5-4a7b-9809-93e67899b4e7@kernel.org>
In-Reply-To: <0d25a732-ccd5-4a7b-9809-93e67899b4e7@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:31:21 +0100
X-Gm-Features: AclHuK-yJKxj98HRE0igMAKWG_vr97ZSpokaUXsIJ2z8z0rJILNsgN0-4gJfnBY
Message-ID: <CAFEp6-1fAAfG+dMsS+bK4KDjX795OXhWBSrkWZKzM4P9r7+m1g@mail.gmail.com>
Subject: Re: [PATCH 4/7] arm64: dts: qcom: sm8450: Add CAMSS device tree node
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, "Bryan O'Donoghue" <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: GiAfsEBJi3A4vXw12MHFQf2H7ip2R3lF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MSBTYWx0ZWRfXyETkYNHtAT3d
 aIvdk0FvZ8aaoAudQMnEFa3gJ+9slQk7Eo6+3hvhoRN+ZnBDSDV1zy79cMG1OqVJs7b5+jo62Ef
 t/IxvLHC7aITxuxth6hSh3Imlf2lJVo=
X-Authority-Analysis: v=2.4 cv=EIeTQFZC c=1 sm=1 tr=0 ts=6ae07d87 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=b2IhrCKv5-cLQgD9YOsA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: GiAfsEBJi3A4vXw12MHFQf2H7ip2R3lF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MSBTYWx0ZWRfX6YZ3IRoDcX+j
 JzJ82IbaRLotQwZBfF44ENMSsEifY5N+vJyPyvuKrn65ygE2gndaDHJscOS/vfutwwqusL7UbCR
 ybYDKa93u2wYaBH04UZ1Si1PdeWyFZhp0+dEhrZF6Ykeq2MEjbMEomj/DfPkRRLpjG0racM9WAn
 3K1UHz1oNsUZJGbZ9Qx1gTiSoJytDzNN2jNZFGNR9uavyb/O7/U88+o3W3HSZKueqdxUIbYEC8P
 Nm9CSjWaQQOA5YJglJ8vofNrltq1lW8/u6gmBUHMR5WgLUP7tuSz0TPlvy3lt+OF8eb3HUGbrFF
 /GmC8jfE0Dle7br4VP/cNmfb0BBTXLcAaqdfUAb+nLFwYhhqByuH4zDpO9fN9WPx6JzCy2XyDnA
 xSdOpZi/g2ZtLA2CnMDA65uVvVjz4qaVRYDJ27+fHUzvah/BEP0/XG2RkLbnyTJ5IqPe79mq+r3
 ORm1EHpvzEQJ8GzOrrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270041

Hi Vlad,


On Tue, Oct 27, 2026 at 10:54=E2=80=AFAM Vladimir Zapolskiy <vz@kernel.org>=
 wrote:
>
> On 10/27/26 11:07, Loic Poulain wrote:
> > On Mon, Oct 26, 2026 at 11:39=E2=80=AFPM Vladimir Zapolskiy <vz@kernel.=
org> wrote:
> >>
> >> Hi Loic.
> >>
> >> On 10/26/26 18:32, Loic Poulain wrote:
> >>> On Fri, Oct 23, 2026 at 6:31=E2=80=AFPM Vladimir Zapolskiy <vz@kernel=
.org> wrote:
> >>>>
> >>>> Add Qualcomm Waipio CAMSS device tree node to the platform dtsi file=
,
> >>>> the CAMSS input ports are connected to output ports of CSIPHY device=
s.
> >>>>
> >>>> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> >>>> ---
> >>>>    arch/arm64/boot/dts/qcom/sm8450.dtsi | 167 ++++++++++++++++++++++=
+++++
> >>>>    1 file changed, 167 insertions(+)
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/=
dts/qcom/sm8450.dtsi
> >>>> index babf1a4196a1..7f5b0501a23e 100644
> >>>> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> >>>> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> >>>> @@ -3310,6 +3310,167 @@ cci1_i2c1: i2c-bus@1 {
> >>>>                           };
> >>>>                   };
> >>>>
> >>>> +               camss: isp@acb6000 {
> >>>> +                       compatible =3D "qcom,waipio-camss";
> >>>> +                       reg =3D <0 0xacb6000 0 0x1000>,
> >>>> +                             <0 0xacb7000 0 0x1000>,
> >>>> +                             <0 0xacb9000 0 0x1000>,
> >>>> +                             <0 0xacbb000 0 0x1000>,
> >>>> +                             <0 0xacc6000 0 0x1000>,
> >>>> +                             <0 0xacca000 0 0x1000>,
> >>>> +                             <0 0xacf6000 0 0x1000>,
> >>>> +                             <0 0xacf7000 0 0x1000>,
> >>>> +                             <0 0xacf8000 0 0x1000>,
> >>>> +                             <0 0xac62000 0 0x3000>,
> >>>> +                             <0 0xac71000 0 0x3000>,
> >>>> +                             <0 0xac80000 0 0x3000>,
> >>>> +                             <0 0xacc7000 0 0x2000>,
> >>>> +                             <0 0xaccb000 0 0x2000>;
> >>>> +                       reg-names =3D "csid_wrapper",
> >>>> +                                   "csid0",
> >>>> +                                   "csid1",
> >>>> +                                   "csid2",
> >>>> +                                   "csid_lite0",
> >>>> +                                   "csid_lite1",
> >>>> +                                   "tpg0",
> >>>> +                                   "tpg1",
> >>>> +                                   "tpg2",
> >>>> +                                   "vfe0",
> >>>> +                                   "vfe1",
> >>>> +                                   "vfe2",
> >>>> +                                   "vfe_lite0",
> >>>> +                                   "vfe_lite1";
> >>>
> >>> Is there a camss "top" register to describe here? e.g. to retrieve th=
e
> >>> CAMSS hardware version.
> >>
> >> I'm not aware of anything like that. What is "CAMSS hardware version"?
> >>
> >> CAMSS embraces various blocks, there are CSID and VFE, full and lite
> >> IPs, and all these components do export their versions individually.
> >
> > I mean, CAMSS usually has a top-level register block (often top or
> > cpas_top) that contains the Titan/Spectra version information, along
> > with various global configuration and mux registers.
>
> On SM8450 there is "cpas_top" register <0xac13000 0x1000> (not in the
> series), I believe you reference to it.
>
> Is CPAS a natural part of CAMSS? Can it be modelled differently, e.g.
> as a separate device/driver, like it was done with JPEG or CSIPHY?
>
> I see that there are only SM6150 and SM6350 platforms mention this
> register, to capture and process frames on SM8450 there is no need
> to program CPAS.
>
> Note, that even SM6150 and SM6350 platforms do not use this register,
> it makes it redundant.
>
> > In particular, exposing this block could be useful for reporting the
> > Spectra version to userspace, for example through libcamera.
>
> It could be so, but adding dead code is an anti-pattern in software desig=
n.
>
> > Moreover, if the goal is to describe the CAMSS hardware exhaustively
> > in DT, this block should probably be represented as well. Whether it
>
> Here I oppose such a goal as impractical, the set goal is to get working
> camera on the platform with the minimum of irreversible changes. It was
> proven multiple times in the past, that "an exhaustive description"
> equals to "the totally broken description", and brings nothing valuable
> but irrecoverable ethernal problems to overcome.
>
> > belongs in this specific binding is open for discussion, but my
> > inclination is that it does.
>
> This register is not needed to get CAMSS up to the functionally
> working stage, which is represented by the series.

CAMSS already supports reading the hardware version from such
top-level register blocks and exposing it through the media framework.
While this is not strictly required, it will likely become useful to
libcamera in the future.

> I believe someone may create a new fancy CPAS device driver or so, and
> the new device driver will utilize the "cpas_top" register and other
> CPAS resources in a better way, the register shall not be nailed to
> the CAMSS preliminarly.

Well, yes, we could certainly model it as a syscon node, especially
now that CAMSS is no longer the monolithic block it used to be.

Regards,
Loic
