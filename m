Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42394D8DAA
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 15:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784646307; cv=pass; b=QPNgLpnHTvdwKs7kOsv29fr3fBSjmoA/N+S5kWv10KyyY8Ttv3yBiviKj1qzvdrHY7LYUJvMHBMOphafM54cyO1PDtvjrHd1rKDOyzAXKok8892KHSscEPDYzES+il4/ihhs84wjvHQh0t3yoWPrNHhGF2o2vuRWm0NquiFqGzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784646307; c=relaxed/simple;
	bh=dOYdRLtajuKWeq7l0EZ1y1y7lhVrzrmKGXF1xfK4b9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iN+/tFYzSX4RhbnHa+CfybXUMlrtNUQ67Fq4NYmLrLYAXnRxjD8mI5wLg6nqcB7bBxtEZZxMVTGjXMTlJWYuGnU2w0qb80LeIuysccTm9FQrz3s4FyD582p+/QqFrFWLrU5bTckBl3JQSm8BXAO9mu5NpnRMvjR2Nos6FS6qkfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CS6aIioT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IZkmjR2Y; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CS6aIioT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IZkmjR2Y"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg2F71841395
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 15:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YByahmNJG5MKZSzb3gPGLiRR
	hG+aYD8P8HIDb4kdTjY=; b=CS6aIioTR973cYCLaauCSIZlyfJI2S/TPTd0EGPW
	uIDAnPcIcRETTrXuIVm/T/75MlIOaJXEhbSNbRlv7YATib45jPIiv6n4hL/O33a7
	BZo6IoCc83VTGOOiDFppnbW6HX9jUQaY6GkPnIhdgPqRfIFCuSW3uRGAEnf8cjJa
	7ujnWiiU8PdyM/mk+E9PyfTphY1Q33Boz5PfQi3NOhsIrzJUUldRZguqQZzUKrWp
	n0JdVQxPmmNJhAId1j3uGpHUhEFrzaY4wii/LbIXgebHmdpE/mP2s4yYJFWaIlqz
	qror97C+O//TyHpAcCyJvuX+sAnVWU1BAd5uGuiQWPXkTw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1se2wc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 15:05:04 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e086f8e0dso1109143b3a.2
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 08:05:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784646304; cv=none;
        d=google.com; s=arc-20260327;
        b=rt7gWK2m8/ccpl45JK5upXolcCXGmhTr6wpRI4bn4c158vNamKN95F5hA6K3bC+Ckn
         lnB+yCZWiKdQT86DZSnM9M2+iwnT27iXFLigvn8lcCs/7VZDJLADUw6CwpWcOBNtkI/V
         l9+HItSa2O5USJEOZIngyPsKIdrNJAfbnvV8xoEkbEIxTMMlPDO5nGWrcZr0Wslhq+rb
         4Zl4uWuS/zbr6xr8XOOrgQbB5fBQ5IprKUloalJVOgaczpoc1wBej2tfVAaQORBeOsL6
         IcT603PuQVKSgzkIW2KkChYhJtGTiCERypDd0pg6TA5q5/6altGRo13m4jFwN5+fPeHz
         gjHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YByahmNJG5MKZSzb3gPGLiRRhG+aYD8P8HIDb4kdTjY=;
        fh=ToUO/0q0cU+rfKgEAWSligzvirMJ7Gnm0AlwNsFxrQs=;
        b=OEw7GXj7c4Qbnkr/GyQX6VFnVN0T+lVj6NfqzGFhhBBKT/V1j7jqbUp8EPuIjTSlRy
         XICS1IPwBcF9KKTioThFwO6bgvnY8RaZEcbe4AMXvw7HligETmJy/loneQEFS9icco5o
         n4GkFPeEVPj0zGP5hOkW4OEZ83ECZMVTAN+5dH+0BcqLIcXNj/P+XAsrMTMvgMbmmK2c
         /kdpb2ju62WSzBnY0b/IlXzIFEqaVdgp1QMVWBcbiok/bpr+5P0rgdtpUluNiQ1QZovS
         Ms/NtDwkGYDRMq4ubHvf25+CWOdAlp0eStT1eDkrLDwE4sEdAUBzOugrFaQ/B8ChQlU3
         +jmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784646304; x=1785251104; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YByahmNJG5MKZSzb3gPGLiRRhG+aYD8P8HIDb4kdTjY=;
        b=IZkmjR2Y6S9/bW8M8twm6XCeW4tHN6YjVXO2v679NFMtLxvMTdhQisF53ERLYrZ8IA
         I51QgzIKfyUyXUiyo9pfgzXtz9ysuK6qpRUT238gvckoenFF7LUUjuYze6yoOjdNJL0b
         vlo+ePVt+wtW9e4qS7QEZjy+5yiLekxgp5Dqe/wcx708bV6R0hqO6w4sf4+YYZxUt5Dy
         ijlOGUtf9SQF837cLsUagCBEDdLXurWwh4FGyYhxggi5IkRZs+tRSLlgMkcEyij2haIn
         aNdrg3/l6AbJzMCHMRDpjupJJv/yjUD5oKqnYgJHIcdtnY75nmAbLLSZjHZF+cPUYV+T
         W96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784646304; x=1785251104;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YByahmNJG5MKZSzb3gPGLiRRhG+aYD8P8HIDb4kdTjY=;
        b=Q6UqQxrsQzfK59XPzVCEIESAps4/qFGUSQBd0N9sXyVjsb70Wo5IaWiTMuBwBvAL59
         5WE7A9Vk7fxxjCfH4VbLmNIx5SQ6hdIoXoHelmS73DiMBFY7UHaW/tKD4xaQO3BpZcmw
         dyaAoQRGMUefZOKi4JnTb7yG8uvnycR6GpXxFEwsYssoON/GKovtgDZy9WAGefwcwgee
         71PLHoIn1AsaeN3+BcDpEiQmFxiLlPFtq07v0jEX3fv5iFDU2VcqUb5CcmalJgpaPI/9
         ITsyHcXR53KZ0c0r19/5hqjvAyfj/aC8mZ65fGEk1Qzm0iN/UEiqS1UyS1gHHJF1YU0B
         3eoQ==
X-Forwarded-Encrypted: i=1; AHgh+RrxERi+jw+k+1uqJrcfToVHd6GQ0sM/xtaGnmsmUEoLQ982Ez//hrMP4nQwzZFgfxGQyjrVZRAxmLyrTg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6gADIOobaM1B96/yPo44c6XgVvlC+rbprHODPAe5qbEwFBIr5
	GtZEFTQqQ5MlAcqy/A2ucReLuMLTgYG1GM2iNxiqSL2+ndBgRs29Z6FiwU045gT4hmgQzfrNAsl
	QCc+riCUNUBZ5Ej0w9HLxQmJANHVgeKZwkrZjalkIVKjt1MVzp0voN425Uf3Y5J24xU5VS8/FYK
	e/X7xShzbWSk65x8vED+76eoIXOu97NH8GHEP/kzOI
X-Gm-Gg: AR+sD11klMf6TN4PmyFnWf8oA3cMxgpvIvghO0WEyE2fHhWFxSLKv9KFnUp6ErIvvVG
	dOrGpC8tajgBHLaHoG7OGRkv5Si26OrFs7MRlX0DHgcQNdGjD4SxIwhDJ/9jAhKY2QIIFe9l+mm
	FVesz5WoM/eeKEfaU5vAGkZCVbpUp5atpWdPiZjnd0CL0SjsWL35Rt0zAQNbMB6VLZo6hZKBA=
X-Received: by 2002:a05:6a00:1748:b0:845:363e:12d9 with SMTP id d2e1a72fcca58-84c292a0e86mr17652268b3a.3.1784646303372;
        Tue, 21 Jul 2026 08:05:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:1748:b0:845:363e:12d9 with SMTP id
 d2e1a72fcca58-84c292a0e86mr17652128b3a.3.1784646302052; Tue, 21 Jul 2026
 08:05:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
 <20260709-iris-ar50lt-v7-4-76af9dd4d1f6@oss.qualcomm.com> <5d213d08-8e00-4e7e-93ae-ba05f22f09e7@oss.qualcomm.com>
In-Reply-To: <5d213d08-8e00-4e7e-93ae-ba05f22f09e7@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 18:04:50 +0300
X-Gm-Features: AUfX_mwnWEBpQLukUwR7S931rfRJyPKDW_MoN2K5bzRez7pKe6ZY8ZSVeWlcMgU
Message-ID: <CAO9ioeW3y0ck2k3H2XK4W7z6YCFO6nuENN6=SmKxjQjNUNKWPw@mail.gmail.com>
Subject: Re: [PATCH v7 04/18] media: iris: Filter UBWC raw formats based on
 hardware capabilities
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: xXqGaQV0w_pAAK_SrZw10aQLr7Cr0wAt
X-Authority-Analysis: v=2.4 cv=TIZ1jVla c=1 sm=1 tr=0 ts=6a5f8aa0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=UDfdo8XgODCBNK5t2fMA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1OSBTYWx0ZWRfX5DYMm7iXljii
 InFO1++Sexn5R/1wsrGDl3F+0jM1brp69nmwp19INexmI1epahJooYN4HS9vRmBJDwHMzzGMZKN
 xsWChQnns4FqpUJdKnsaOVDw2b9EYVs=
X-Proofpoint-GUID: xXqGaQV0w_pAAK_SrZw10aQLr7Cr0wAt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1OSBTYWx0ZWRfXxfWePM0QJMp9
 yWdJZhPZC38UQ1/ANMnAAXqQmVOfKTg8ecRfkntlft5BN2NPLcis4zCSImDysex3m3d9xzhtEIq
 hK5vx1r/OrYdjNRtdr1FxBRth5V91aINJGmRxX9mLhXdP2uVMeE30Y1oN6F5M+Wrl4+yHGlsIlg
 VvS5kigkvxbzuIvyXatr16xOFxzMhv2jTRKKxUMi+qVcuErcfj3DzjEoS9CLyUVEw/dgf3RDZcn
 g9tIOCY8szdLgkNYmc5wzQ5sr31Ogbf8jENpvWgZX57HCUVhPEwr3yXyyKFglV/XI6zvh1drINE
 Az3l5iM1Rxr2uG7vvfxJbLGihsrLM7hJDp1D3hu8lcmTszPFUg4DExW/5+W77gwmH/aCd5zzGz9
 7rbtHJV7CHTCC67FSuSwoQ+EO/1eKYs1qqccxCxWvJJoFDezuhRZnauHIHYU6iWwzsFn91D/nqv
 Lr8ZyzQoQ5q31NH9cNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210159

On Tue, 21 Jul 2026 at 17:08, Vikash Garodia
<vikash.garodia@oss.qualcomm.com> wrote:
>
>
> On 7/9/2026 7:11 PM, Dmitry Baryshkov wrote:
> > From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> >
> > The raw formats supported by Iris were previously advertised
> > unconditionally, assuming UBWC support on all platforms. However, some
> > platforms do not support UBWC which results in incorrect format
> > capability exposure.
> >
> > Use the UBWC configuration provided by the platform to dynamically
> > filter raw formats at runtime. If UBWC is not supported, UBWC-based
> > formats are omitted from the advertised capability list, while linear
> > formats remain available.
> >
> > Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/iris/iris_vdec.c | 26 ++++++++++++++++++++++----
> >   drivers/media/platform/qcom/iris/iris_venc.c | 25 +++++++++++++++++++++----
> >   2 files changed, 43 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> > index 4c8bc7aac135..9fee5f28097d 100644
> > --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> > +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> > @@ -3,6 +3,7 @@
> >    * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> >    */
> >
> > +#include <linux/soc/qcom/ubwc.h>
> >   #include <media/v4l2-event.h>
> >   #include <media/v4l2-mem2mem.h>
> >
> > @@ -69,8 +70,14 @@ static const u32 iris_vdec_formats_cap[] = {
> >       V4L2_PIX_FMT_QC10C,
> >   };
> >
> > +static const u32 iris_vdec_formats_noubwc_cap[] = {
> > +     V4L2_PIX_FMT_NV12,
> > +     V4L2_PIX_FMT_P010,
> > +};
> > +
> >   static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
> >   {
> > +     const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
> >       unsigned int size, i;
> >       const u32 *fmt;
> >
> > @@ -80,8 +87,13 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
> >               size = inst->core->iris_platform_data->inst_iris_fmts_size;
> >               break;
> >       case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> > -             fmt = iris_vdec_formats_cap;
> > -             size = ARRAY_SIZE(iris_vdec_formats_cap);
> > +             if (ubwc->ubwc_enc_version) {
>
> Do you see a possibility that ubwc is enabled for a SOC while VPU
> hardware does not support UBWC. IP document for qcom,qcm2290 lists some
> UBWC configuration, while VPU does not support UBWC. Not sure at this
> point if other blocks indeed support UBWC for qcom,qcm2290.

No, QCM2290 doesn't really support UBWC between the IP cores (as such
it has ubwc_enc_version = 0).
Currently the database defines a least common denominator for all IP
cores. If we ever get to a point where we want to define UBWC params
per the core, we will need to restructure the database.

-- 
With best wishes
Dmitry
