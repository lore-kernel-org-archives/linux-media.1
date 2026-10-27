Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793074183;
	b=w+8uxGj9AjqU/IDgpA+OGx8T+iRf8W678CZKsgv4xdekGD1uM4WW4POinxDSGPy59hI9
	 GyNkzkBlOg/bp33keS9T6SotHW0aOVYKDpj3XojMQ2lzFsgyCfpjhxBw94tsGClnp2rIg
	 sd/mFsdJqtUMIlavzJQ/9var8/Qh+xDknMr+Ip509aMc+fJXHmS1cwfY3xv2M0Bi6p0BH
	 zrHkdiB5KEmE0VDCvx/DaOiNubTgG/eui4T/mR5sudoJintZRvzu/QbK6dOFEKY1t/TTU
	 CJoiw48hjLs5nHnvS5Kz4lOski22JGHbY2gDEwNe8rHTiTE/Tdr7gHJpG2ZRuC1wLug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793074183;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vY8JNXJBEmY2//YzxHAKXEJvbfSWEbX5W88WIsAUIF4=;
	b=0ougBAN8ywhXJLG6o9jRRTOQyvJWbQaHeN1U8iYzE1PgFwMysgugZ9ccvfpWX1vMVt7S
	 APmW6Hk8r3nbrpn4aGmxZsYTtbaLRzhtFnJIChYIbpoM+YW9omr/BbUcsrgFuvnMzHxHE
	 lCQf6oRHhyqBbnh/iUgEYB8+7NdrBB0U26eRQ2a0C8pAe6Ex0EwbFFrMaiNJ4vuhZl1NC
	 o1Z/pRWI6KgYK9oJt/5GoQn6YBkfwXWQpmZsMJXoyFVxW9D/F4NTYVlSOk/H8rTPwiw6I
	 I6wZ/UpaqAWYHBfQqjqciwc73Pm2Qno42OhNENG/T3L1vZ9KbH+GXhsB2VLVaPrCW9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jrp9PEbO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BK91d+m8;
	arc=fail smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684C4606A31B
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 04:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 684C4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jrp9PEbO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BK91d+m8
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R2F7481421322
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 04:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vY8JNXJBEmY2//YzxHAKXEJvbfSWEbX5W88WIsAUIF4=; b=Jrp9PEbO8E+rTtwv
	XSkewXOHXjc+TWaVhnoZ6nf4ZFtVGFBK04sY3ZiyxEbIQRfaKny46gNp0YUwTvuu
	NYUuzhAOIAxEngvKL/cB1c0SuThts2znYxF/8dAqY6NSmSTJV6RBC03UQzSi0oo+
	xMVUhiq3Cedqt2kcG1gP3BlcqSwgeFlTTnr4zKbVuipNHQRqCCGI0fOptXrg1huv
	syhhbPeratSZ+7dDB85YuLBtIRcQHMkmx/J3VNm/MFln9x4u5dr5Wo+/CRqiZCZq
	dH6LHfqmNInKqB1LpQlk1BFlCd9rsMC7SD7fFeKyrJeEGLCdl5ch4ya/i0qt4C7X
	Bh1ZPg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf3nx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 04:09:42 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c96bf59c31so581558e0c.3
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 21:09:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793074181; cv=none;
        d=google.com; s=arc-20260327;
        b=sA83GK7rwTB3YVIvp9DVEqOK1nd1AtkgMV3JYxJUVuoQddeKGdpJxrcyXrsx5kV9SI
         Evgqx8prdUfaJXr4utREj5DwwhEKslN2xQoceXVx8JK4RnvtRtkGY4xcNohEKds/US5S
         7EiJJbsyFmLhiMZWk5LGCljNerckAlGFQFNMVUkWys+jhrjyzo7IqxoG4lHpCeAPKLaw
         GsUpo8mT55hTeAOJLp2mZkTZjtOLaWpedj3zncwKT21HFKh/6wrH8lu7LyFW/tqIOGXx
         dsVVrVscq5QQsleSH61uwmm4CVF7BhRHMzz/+qkAuoVA0QXUhC9PoNbqP6+hrdhTRzpT
         DVmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vY8JNXJBEmY2//YzxHAKXEJvbfSWEbX5W88WIsAUIF4=;
        fh=zBEOpFx6NrmR++gg4X882Vm6ODJNElyV5uuM9kGCBI8=;
        b=NGfz/4ZEa8XZFwDp2ObIqRZt6mFpuplbO2UcoSXwtpOQdx98Nq7mo5vXuVWiPtuX1r
         60/yi73QnP6ptJZMWRdof8s8CnBcZtDwBc3Nqw2K4/hPmmaRde64eHwPlZVRJ/YcC0BO
         wr4eW6W0qufkuWheloQB9rPclppY/NnSvKTlagLuZrjmmaPbmz7mG1EbTUH9zGmLUaN6
         NIvBzJU6kkLdCcmMJzux6yHd5vehRWDsyWwZDez59+zXSMlyMlvho7lZ7RddiOVgo4s0
         eyRPfbc8XmChs9uSsmZ7THbYbV5ht/sXxVthGpdWxsw42AXvM8Q0hSLO8pF6feW4llXh
         JaRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793074181; x=1793678981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vY8JNXJBEmY2//YzxHAKXEJvbfSWEbX5W88WIsAUIF4=;
        b=BK91d+m8NXLqqg+pOgYsuJItqvm3kDNdrzxu6PHf++u0fHT2SskPgfrmnuy9YUdBTs
         dF4A65z+oOfrRNwpXITmCD44cB+OqOOem2HknERWVaq8YSRPJlvP+758LvjmFZnXH4d2
         t8Q+uA8S3cG8KrX8wYo1HcgPNIh0M1hSE56tqloYb6b+o9gSCMM7my/15p5jRaNacTTR
         fgRWuROGb0teG5G51eA6TvTeDOaR3VzSu57TMKJ7OtLeZ+oZYJXxn3NaI5GpPdwBcZD6
         eeAr/X79I4Btpa4fUumdsUqg/rRJPz09X94imnQoBN1E/j9fuQGOSdqK+IXDjU700WzR
         amdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793074181; x=1793678981;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vY8JNXJBEmY2//YzxHAKXEJvbfSWEbX5W88WIsAUIF4=;
        b=0jiYTe1uemjpImTJVu3tecbiUU/w0ZZzEufsaxZwvVSQzop7SsxmilHBledRw+UVbu
         sUJnI0WQj3jsGWxTmBbjNZCyeEezRiyggcQyZpwjt3YBgU8DKW7Vfm49Hye8g2TbPXVT
         3+WdMyazA8pqJY9FaVi0nrNq+3skMqSdTOqI2BoMJchB3SgNIOOwIlwjuPmskVfW+vCt
         LcuG8OuJTNsCj4/o3SCRoQK1wlNdYXR6fF5gDjMMEyWJpT/zspZzEDHAnKlpDnvqhs/F
         2QXuyJmNIFvGVAFaMAFk/ajcwTrtthKOGLx0a1J8JHtoL6mMoUcu0iPJi6NtCgzVQTCm
         uDiA==
X-Forwarded-Encrypted: i=1; AKwUvBx90Nm0aIUvFAx3vhSlELhBHzSgdxnY5Cyj+u6bDGw2+a7YHZPhcWLAIZdx9tzrs8l8/nyTb7Iznf0eYQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIjzVS6UaEHYEkCBet7N9XDFH2B9pgY7srthvz2Kbmx1EAIKmpW
	NdycdcAxw2Sn4BaOfbnz2ttNNID0Wcg6k/wG38bHjGbi318su6928hSYZWbCUKSPN0B30Sd5kS6
	prC5S71Kae5QobvJbFciNw4HMK5QpPWBvTjBHFgD9DTqHn+rXh1N2zWPBNREGJv+1uivqipxgvs
	asacg60TRCiWelu1IvdDl29DyVLWYBjesmvFb4RdXi
X-Gm-Gg: AYBFou0A+Y18VO9XxyJZJ/g4DnkQXPcN6+XfR2Bm3+U5yt4kce5kv/NJ0selJj3f1Jj
	6vu/PDbuG8RtLA06dPh0TRPPwu9mGzi+UnUO6x9Ar/Brm01KbcW1LM+FCsxGZl9c2Y33cCZpdqv
	/j1Zq4JJl9oX114eNMk18xxJGz0IH44EuzmpMOD/7ryTeekrShacsz4Iu5SHvTQ2R8YYLj5MFjs
	RB8BYtlrtIj9tX3MA==
X-Received: by 2002:a05:6122:d2a:b0:5ea:dbae:3cb1 with SMTP id 71dfb90a1353d-5ec232fd7e4mr3193901e0c.19.1793074181370;
        Mon, 26 Oct 2026 21:09:41 -0700 (PDT)
X-Received: by 2002:a05:6122:d2a:b0:5ea:dbae:3cb1 with SMTP id
 71dfb90a1353d-5ec232fd7e4mr3193894e0c.19.1793074180884; Mon, 26 Oct 2026
 21:09:40 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
 <20261024-kaanapali-camss-v22-12-7da3ea49c8a1@oss.qualcomm.com> <CAFEp6-22zEVoTQ8ewQN4CGW9GARZB84Mp_-SO7KrteYERSew2w@mail.gmail.com>
In-Reply-To: <CAFEp6-22zEVoTQ8ewQN4CGW9GARZB84Mp_-SO7KrteYERSew2w@mail.gmail.com>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:09:29 +0800
X-Gm-Features: AclHuK9zQUYmMt2_uRNQKGHKLEw3Bs7CkPsj4KjP69u-e7zyINlKrBFyGote1T8
Message-ID: <CACbMrhr3imVV6nNLisD+gh=wLPn8ziw8wRL0UW6e-6by2RufFg@mail.gmail.com>
Subject: Re: [PATCH v22 12/14] arm64: dts: qcom: kaanapali: Add CCI controller nodes
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAxNiBTYWx0ZWRfX+upVFlB9VST3
 DHmCtoyBV8u3AsOtaDWH/57w4X5VYoiYDEQWSfIhqyFH5jQzDpO1eaaaRQ1uUxVd2QTeDVqL2/I
 Hfd4Eg1ZMaVfqL4Q9DVpNXv8jK3FZJg=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6ae02406 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=VpRCVQi9ATEJuri8zQAA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: arqhy_pf4XPwUzIWba78qSEjHEaYXmTV
X-Proofpoint-ORIG-GUID: arqhy_pf4XPwUzIWba78qSEjHEaYXmTV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAxNiBTYWx0ZWRfX+1GK0FJSO1Ho
 1/TSC6SgNIDKvhVTPrT8RWMKuyyWpB8RnnXggJXEscmSU7WsuYMUchS3TkyFIvvPvVwmu8ice9h
 ZymeYoMyjFAbC3o0CPfPiWoapG6/Qmme5VFbrd0UgL3LVERdlO4lpvEOtDgVAUrqRBVAbcfSv6f
 RHd+9LOphe5zdxVZXgbraoUkBHIlBdM6zvQour5WeQiONN66AvFPmu96i2dsGl4T0avgMuP2frf
 m72zj+epjPJJC3W3H9IKrMlgl9RkdAWGmhCSTD2YMs5/mi2SC9vLu6KpksYIkloHDmqZ+DcBf7x
 v7thUOIBQrS4gROSjp0WZ8Y8+YMWiFXRO4MbegNcRIhfoH+rWG35Em1ZOMrW5nlz8UElC+1f1HC
 9yB+54/k3rWgBp6mOd4/1aKnH5Mw5CHItVI9sHnlEpI7OQSGWTxIO3qExobZDS0+yfhMYsQkx9d
 InPiWt/jw8kN7UeHB5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270016

On 10/26/2026 11:55 PM, Loic Poulain wrote:
> On Sun, Oct 25, 2026 at 4:17=E2=80=AFAM Hangxiang Ma
> <hangxiang.ma@oss.qualcomm.com> wrote:
>>
>> Add the three Camera Control Interface (CCI) controllers present on the
>> Kaanapali SoC. Each controller provides two I2C hosts used for camera
>> sensor control, so define the controller nodes and their pinctrl states.
[...]>> @@ -4534,6 +4645,198 @@ tlmm: pinctrl@f100000 {
>>                          #interrupt-cells =3D <2>;
>>                          wakeup-parent =3D <&pdc>;
>>
>> +                       cci0_i2c0_default: cci0-i2c0-default-state {
>> +                               scl-pins {
>> +                                       pins =3D "gpio110";
>> +                                       function =3D "cci_i2c_scl";
>> +                                       drive-strength =3D <2>;
>> +                                       bias-disable;
>> +                               };
>> +
>> +                               sda-pins {
>> +                                       pins =3D "gpio109";
>> +                                       function =3D "cci_i2c_sda";
>> +                                       drive-strength =3D <2>;
>> +                                       bias-disable;
>> +                               };
>> +                       };
>> +
>> +                       cci0_i2c0_sleep: cci0-i2c0-sleep-state {
>> +                               scl-pins {
>> +                                       pins =3D "gpio110";
>> +                                       function =3D "cci_i2c_scl";
>> +                                       drive-strength =3D <2>;
>> +                                       bias-disable;
>> +                               };
>> +
>> +                               sda-pins {
>> +                                       pins =3D "gpio109";
>> +                                       function =3D "cci_i2c_sda";
>> +                                       drive-strength =3D <2>;
>> +                                       bias-disable;
>> +                               };
>
> Why do we have a sleep state if it's identical to the default/active stat=
e?
> Do you want gpio with pull instead?
>

The sleep state is kept so that the CCI suspend path has an explicit
pinctrl state to select.

As discussed in the v19 thread, SDA and SCL have external pull-up
resistors on the board. Therefore, enabling the weak internal pulls is
unnecessary.

However, I agree that keeping an identical sleep state is redundant. I
will change the sleep state to GPIO function with bias disabled, while
the external pull-up resistors keep both lines high during suspend.

Link:
https://lore.kernel.org/all/d30d2b5b-0034-47f0-8e93-9abde4dad118@oss.qualco=
mm.com/

---
Best regards,
Hangxiang
