Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793830320;
	b=5at0Pn2j25iOuHg5RD/xhZQuAei97IBZZe8PjzU5zUYBN+kK3lX7We4INiqWYUxFXK2j
	 yI6Oseo1ePz5Yym8LA/gL/8axTXNM5PbWb5VGLMt2fasuKJu9ykfhhuB5/hDGtNs3TOmf
	 IzcZ3nbkDH1hgxMx5viltQ/UneYxjnxZJHFj7xgyqCtXbksmgJ1981C1pfTEGt3+r7PPv
	 omp2xkE2haXYXoM9alVTx5VBro3U2gPi4t8MQ+HGhG+od08bgrrTHflRK4gPwigNwdqQh
	 JaINvKOu+0rOneQDJdpqKCpGTUqD6vXwhs6csueJBih1iJANdQRtCUpA32VE9Fzt9Fw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793830320;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=eiT1btz924HjQNzzWl70B3xvzB6Cqt62IjRgfUiOL4Y=;
	b=vvxl6i6AsqVm9p3y5v8GEckjN/vs14WVxHH4wHP3MgRTdCURkhIJlOf24HWCFr9cNNZI
	 heFxQ+hBfG6HpR+9ORfsgWlG3iYljk6N3bqz87O1fpV78CKP9XRYPi3Ci3MdtvcS9yCwM
	 osZZLdvvXT/y4/RR6gJd0cry1xMrf5ySBTdCvY844uyBxzYk9w5VSZX1y+j9Z/aiaexMB
	 Dx5rfZgT8mewAXPLa3ANUkoJ7yRgvgq7HpGgUHyfd90Nh+mvNo7inDlw/H8N4Awc5264I
	 6I4KLgQOEDARdbBwgyQBTML/qaYdBcOfoRDGzF066qX4xrRO3Zj48wLZZ7iv/FTDKow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h70xA2I1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QnfmsgFU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDBA606A33B
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 22:11:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EDBA606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h70xA2I1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QnfmsgFU
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4IccJX2286041
	for <linux-media@vger.kernel.org>; Wed, 4 Nov 2026 22:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=eiT1btz924HjQNzzWl70B3xvzB6Cqt62IjRgfUiOL4Y=; b=h7
	0xA2I1xOUhDBkTTwFd3Y2vgiA3FBpt8z0GVTxo5Z80TEHVxaIdPqt50JXBrFoFw4
	+YhsMcPobW7taryWOxNEkhkusXUyIv4SOjBq9JwJDKMCvlJn3eDTdFUDIJp+seHH
	jzBPDEV+a+yyLz//eNdZ4wO2XNMroQjPZv3WVbXlqyUC+osDrBP9moQwgu2eVOw/
	ji1SVFa4f1GADGy9FBZ9eSxZnZqopFznMAfgIC7XF4Ms/Pl05P1aiZO1Byqr6UVW
	4X7RSomoUm0190v1+hFRbfa7JT9g1w43gABb6WtelVG7zjGzyyqaD/+I6+kg4oL9
	5BAC0jq6OgjIJ4SGlCpQ==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hra5tgt9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 22:11:58 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-702a3e438dbso1346523eaf.0
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 14:11:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793830316; cv=none;
        d=google.com; s=arc-20260327;
        b=E3Wa+gSDOy9+qVEGvkmv3Uc/m+O1VVQGrvtCho3ylm0cFyjRH2JVaqXd/dBe9qDmp4
         9mVgxKxeuD2vUOqzR0rWzR8WxmxrvtnIbPSj6V8chOW3Ea/hiM8sg17YAF0ZCz10m2Ys
         pgmJrORl/zTImt736M/HI/7VPZ2BEHNoMMEvcL36IrUIUKWPYJBydhabJ1xrJX0kl9sf
         p5Cf2Nzqrs2tSbE0mRpLDQ3Tq/uokAUmobAw8r0jjrHOc2UfXbMmZtzwLdvwv0+rXs+Q
         qEf+FVzhr89RMP9g7ZFosCcSTlkHI5OUn7T8QA4cBHprMAHK1glVCSr6GLW+Fx4LhuJp
         aqBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=eiT1btz924HjQNzzWl70B3xvzB6Cqt62IjRgfUiOL4Y=;
        fh=yBrWJW4OA84n6h9WRubqZ9Sbxfq794ei/CSmBYQaQKM=;
        b=gQUh6V+sMvBaycsu1M0PV12ec4LnAK5aLnTm5MmIVF9yZ/zMB4+a+nkgwjAbNqS2Qr
         vkPNVG0dlBxtCJeyM2AhfHYXMvLPogmZ1u9n27LvCRkIdpEQmqypw/QNBpWTHt/pcpGt
         yZSgsN+EgKCPI9tVKh3tz8VujsdLIRQdvIVRhO+47/qXWkumhAatj5aEAPBpxd5V9w+e
         Q4Ty1VHkXmtikR9jpaze9thiyh0TejDeMP7TfGDNnNUIVB3ieNq3V7Gm3tAbFwLP6R6K
         Eu6AQ1JJoY44Lyt5D9t6PsccK057aVoqOPDejcHF1VVpK7unSH/YXbmP/8lGWns32Nob
         ubUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793830316; x=1794435116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eiT1btz924HjQNzzWl70B3xvzB6Cqt62IjRgfUiOL4Y=;
        b=QnfmsgFUjMlff8nr6ZBqL6J3ZKh1gtmaQQ/Is1qws8uLXJ8fGrbnlyPy4U1EbYGCAj
         OZaxUKJsfq4UA3rObUonLn2IT8zEZm5h8QxSSydV3VGOU+NGhkmM86/rbiP8z4F4JoLf
         UoomRDMUhmr3c2cySC1AkVfa0oSBXevqQs1aqdoMWuPMnVINlVjI23IiNetm9YUw3Qx+
         eSrKeb0q2W41OkyZbg/lLhqYJUYV40UDJi01R8nyhNoXp9PRqflppKXIRTtG2QQcKaGw
         3iKKSmosibd1vrc27DQvu1onA11STrMBl9TaFyiWKJxq2yxbhjpZc0GWZF8I94YhEDDd
         WBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793830316; x=1794435116;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eiT1btz924HjQNzzWl70B3xvzB6Cqt62IjRgfUiOL4Y=;
        b=Fk+6mC3z+dHuVFtYmtnDIV8v4KHnCE9oICj1YaC4upiQv3xkgQbn/T8o/wpWZVUtux
         95hufmJUbR1yVkDQCaK6rVA0Pc0GW61brQl10ZR/MTYXVnyJM7PHFAYI3wUhH6KB5Gi2
         vZi6lWETrp6AjXR7w+aWdKrpzTj30VtrMsthN8xoFA7U13K5HMK2yjS1l5//rhh8fyMG
         jPF4x9k4sb4Y529HlM9whbLLVqWubg5UCEDEi3xoWbFOJBGbNWYV6/LiJZCwGIBmqoKI
         HDLWIDBDM9TM/mn91dtavMrV6Ad7+/F5+cKzldYcEdsIUWCLUD2oZN48kGC7aWC0LGw7
         TOfw==
X-Forwarded-Encrypted: i=1; AKwUvBw7qFelSp7gBXEtDCeesOT/Hcd5tGa033soQWGzF3K2ctBVrTGFXyuyaOdz/6I07es/BhX/6lj78vOt+Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z+e8D1LZ6UreK9gSS9DuWf1yW7va0VkIGSYbSnL2oMfdpt6q6bB
	n6yw2iIsEdXtKfi2hg/Ifl7j/CJTSJkk7YroTai6oaF09K845XQDkuk4JA/GV481fvnPTJJ91f6
	4/UqBUG6av8eRgtkp8RT6MijzP6keyVTyfAEbZyHsWIDl3fJdjnmNRHIZ2/k9uF205xvjnqL15w
	5Qg/pwAF9Cg/mhRX+OiZCThtBrQDocAGURd8sQg0yy
X-Gm-Gg: AYBFou3g+J6JxvhMoRR/osWZGYEKktRySOJEl5R6WoqsPZDFA2qHNCbEtpBMec8EYD7
	qNnJA8rGXssMDqyQxtcau2nl2CIid+igNQI80xm0Izkt83QrG4v4jH+Ps1NeeAXht1vZGUSNLxh
	uRbCA6rTyXooAq6e2J0Z7dj0PLndiWL+SPWzApb5XMQgwpPFoe3JqioNgeFWujNPzxAcWPvwtDt
	oRLR8PwUSIjWKpRT0ebZg==
X-Received: by 2002:a05:6820:168c:b0:702:efc4:807d with SMTP id 006d021491bc7-714f29eed8dmr10906942eaf.49.1793830315874;
        Wed, 04 Nov 2026 14:11:55 -0800 (PST)
X-Received: by 2002:a05:6820:168c:b0:702:efc4:807d with SMTP id
 006d021491bc7-714f29eed8dmr10906914eaf.49.1793830315450; Wed, 04 Nov 2026
 14:11:55 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
 <20261104-ubwc-format-docs-v1-7-389044012b4e@oss.qualcomm.com> <86b801ce-a56c-4ff8-8915-9be369fc0ce8@collabora.com>
In-Reply-To: <86b801ce-a56c-4ff8-8915-9be369fc0ce8@collabora.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 14:11:42 -0800
X-Gm-Features: AclHuK-PejnPAeVcWn1rFgQSugIaafHtbuWuLOPuri8tnD2WASiqu_5BlPlNCuI
Message-ID: <CACSVV02t9=tm2qyG531f8Ne90ADAb1_ZDDGEg7PwDmoEvGxPrQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] media: qcom: iris: describe QC10C as TP10
To: Robert Mader <robert.mader@collabora.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA4OCBTYWx0ZWRfXyFFdpD3bVru8
 t+wRksodomQXb9OB+v5WC2JkHLfXOwMpmaG3giw+sp7+EubgqWO/9h5rCV2lmIeH7zJbTj/7koT
 oXGtIw9fLI+kPSGe7KEgQj2uPAin4P0=
X-Proofpoint-ORIG-GUID: xo3F3u1_D_KSrW7VO1oUNHJKls6AIxZx
X-Authority-Analysis: v=2.4 cv=P/6vFSAu c=1 sm=1 tr=0 ts=6aebadae cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=e5mUnYsNAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=guYwWtrNydk0MfZTwrkA:9 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: xo3F3u1_D_KSrW7VO1oUNHJKls6AIxZx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA4OCBTYWx0ZWRfX6q/yQTKr5LMs
 hulDzpo8+MKzDNag9h8oSO939wgYd5k/JD3rJ0gIZrGBetEwmpVulOaahCwFGsy8c+vtIHU8fWd
 fPl7Wlpm/8vCxmXA6CTdxfDSDbSuZAftvGpAjHLWwRLyVYIPk2mwTtmUxFvxfqjTnuXZ5XkHKI0
 UBldZNSODlAmYoJGhnp4CKxeA1MyUnp46JW6Rdi4ifB5fdy41cTW3Qtxd+JGGnEKoVm6HycbEB3
 rcj/GA1hX5OQrxj1HL4C+MWOuST5Wih4jBNaYwZ0pbsHKUlOfJynS27PzpPSs/tgd/bHl9K1mIi
 5HDy0/w8V/w9UAJdgUcDyLWjUTC6FSM/Pujzl2HzuFXMVRcmFrKjHFyyYbKes6my9HzcPfbcOLc
 tkhoz9x5MCOMwUT2uinEac98oJgNOgdlIQ07gSyuQ+3n3nPxmybg4PhW+oIFU2SDNBewxbKqhNk
 G8KzlPSXRldRG+2C90g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040088

On Wed, Nov 4, 2026 at 11:00=E2=80=AFAM Robert Mader <robert.mader@collabor=
a.com> wrote:
>
> Nice, very happy to see the series!
>
> On 04.11.26 17:36, Dmitry Baryshkov wrote:
> > The comment describing the QC10C buffer layout calls it a compressed
> > P010. It is not:
>
> If I'm not mistaken the display engine / the DRM side (including Mesa)
> describes it as P010+QCOM_COMPRESSED as well, and so does my pending
> Gstreamer MR [1] . So if we can't pretend that QC10C =3D=3D
> P010+QCOM_COMPRESSED, then we probably need a DRM_FORMAT_TP10, wire that
> up everywhere etc. OTOH if we want to keep the DRM side as is, then the
> comment should reflect that, IMO.

IMHO we need DRM_FORMAT_TP10.. on the GPU side, we have TP10 and P010
as distinct formats, both with and without UBWC.  I'm not sure if the
same is true on video side but P010+UBWC was never exposed, or if it
truely only supports linear P010 and UBWC TP10.

BR,
-R

> Best regards,
>
> Robert
>
> 1: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/81=
95
>
> > P010 stores each sample in 16 bits, QC10C packs three
> > 10-bit samples in each 32-bit word, which is what the stride computed
> > below (width * 4 / 3) assumes. Name the format correctly.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/iris/iris_buffer.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/m=
edia/platform/qcom/iris/iris_buffer.c
> > index eb8de60c1177..ec2bf2a2d953 100644
> > --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> > +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> > @@ -266,7 +266,7 @@ static u32 iris_yuv_buffer_size_qc08c(struct iris_i=
nst *inst)
> >
> >   /*
> >    * QC10C:
> > - * UBWC-compressed format for P010.
> > + * UBWC-compressed TP10, YUV 4:2:0 with three 10 bit samples packed in=
 32 bits.
> >    * Contains 4 planes in the following order -
> >    * (A) Y_Meta_Plane
> >    * (B) Y_UBWC_Plane
> >
