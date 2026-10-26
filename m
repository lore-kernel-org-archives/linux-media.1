Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793018682;
	b=HeZzGnZAjj13yKAUhVydxfD2sOA8gqnR1DXP2Z49EVES8T/m3t93tYpV8Q/ZIQwg47tu
	 IL+S34QX+W72UxiRBnUcbi36Xs71jgjQzMsdhpV/wYZ3hkfxoEMiGgJRxFTW7PwuGfGcj
	 uE0JGQ9Ey6S0K+LWjqOaJIua24sCZXXZHezIF+D01IuMBAt6TTnEUKcmzN+OrYoP/TtIB
	 BOSumlpQvQOVbfMZjL/e+SLlGuONYk02nib3zxTqyevzROW5XwfjC7yQ6uAnhjDr5w7bX
	 mOeI8jBPTsVKxybWlXuEOz7hSg1d/KfIBTWxM29yQWGiWkVMdavrHBisnvTqZ4I0wcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018682;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=005Thyq9qrJBejm2la/InYlIeabB0AN+HhsspFti4SM=;
	b=ETVVLjxOIXToZQXnOHsP4ArikzT9EDYwQSfkXyD7ccxJ3652VpyMEDMdOJfusTzpMys7
	 LCujqN+uyW/BIR7PgM9182KqNHx0RkuxMPJ169eUR4YWTTDs6maGyAVucX6xQDt3hSzt2
	 2xO6MwBP4fWcg84CV/xGc1nALHnPimdn6MAXWhOJM83rUQaizlFow1/hBobiyNTS9rMQ2
	 IOwMuvUy5BNTTsxgGpATYazeY7YmDq/q9XXfCYBpT0UD9Loh6599LTo0XdtUSLW8XaeN9
	 Pf2RzcRMD8IocZii9553Lqf84Gb0GtsxYFQZzaqHWhZowzfgn2cgebVtndk5vJ4w45A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="E6qRV9x/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NP85lmLh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A8E606A322
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 12:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46A8E606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E6qRV9x/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NP85lmLh
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtMq22009905
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 12:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	005Thyq9qrJBejm2la/InYlIeabB0AN+HhsspFti4SM=; b=E6qRV9x/eE2Fi0yy
	1OvFNuN0nUHooQFKkiHdYWd1HhCrRBTAdNZlnrcnnzwFMSO0mnuQpIC/FLlbBcgS
	ZiQ8JcY9IXyFjEqNFO7uiP8e4/q+561D8FWB2C6xSPifbDVrhTfe1uk4zm5v+9Ea
	Q17yIQMoSgcfpPjEJlzL5Xr8JMkoz/0rir0KE6NdAuVXdFuvcAiuy07D6UpsFxqE
	AYjneMm382JNDfQuIkRx8vJNB355Tu8EkmBe/Oc1WzR39DGb5yRL+BuED416RUek
	/ouIuEOLFWiwHXLS0Ko1gOyp34m2aItPD5JU35mlVIu4SZBNAZGVo401vknqCtm/
	a/xagQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27xdyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 12:44:41 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c96bf59c31so401283e0c.3
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 05:44:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793018680; cv=none;
        d=google.com; s=arc-20260327;
        b=ON4cHJpSVwKIn+LvyZX0ozAqu06u0lL9ZgIuxkzqKVU0G07pf8KpRGOIHYuT8UXAD6
         xNYG2+lKClsWO9JlkgEUUi6BV2yNtql5Ybbljk9zNeoJtiajs13WTL4FEt87YBk7KROJ
         szoawbdWHlCCAjKBxMtTPNmIuhdjzVgRDFFsYg+Gegrp5ZVwpIGVbz6YWrAQ3CCqYVDy
         Nd/jej/3M2BpNd+QXn90MGCz1kerzQCGL7ak/32sFjS43JuaHj19/7daEMNjqutZUfoe
         4BmzWB8A18bvlsxWA1fuQYlo/0mb4AUpLNf9oBT5UZfNQTMO+f/kEJJSZbBx8HAQ18Ff
         unNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=005Thyq9qrJBejm2la/InYlIeabB0AN+HhsspFti4SM=;
        fh=OgByeRUZVRUX82eh99kyMPxyTsMO7VtbSQcUo3Va7l0=;
        b=Vt1K23HGj0d3YRAiYgbrXuV7moRCowhV7gK81Tm6fi31uaBp0aVLWXTdukmSkA1ZMu
         sSJrtGJhYaZdW/Q5ZPpDGpGFGSm5G7PTE6iBjJEVbHf5LsdtWeelLJlZUESvYDNarYBH
         vMr2oWyFan3y60TslegQx3gFyTMG725uCqcg9GkxplUDrz8QN01PQuAqUt8Xv6yJYGG+
         raW8TV7m+njGCybYIPYwB32G8eEEZPMtZWyRcg8V7OMaz5sSIKn04fJcyPiYAYEH6RCU
         dt2f9fiyhCGDhawVCqaBJ4lK4gigp+gxv/02fD3MCD5+XJa3b3DoHLuFqxCxsLM74Qs1
         Hc0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793018680; x=1793623480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=005Thyq9qrJBejm2la/InYlIeabB0AN+HhsspFti4SM=;
        b=NP85lmLhzodp3skdsw4qqH7atrNatpbJ94hZ2Wgw4OWFykzsv5hfHpuyabNNt0U6Ln
         H1w5xbZyxr9oq10Okv68X32AIRDnWYETW1b9JudVoSMjKWZgiZqM844RdlPo3fZJ/IL4
         jOm8kLcqaQU5wAWEjZNWhfnuUhm2qM7htVtbaX5E9VnagQqwZzkgvSIvT0M46kI1+PM4
         vbwZQm0WNmw5Y2oHbfOTKKj+MXNxiCSbxumNyal5gnqM8AjA7p5uFe5Vl2jWwIqZYnZW
         68X/xLabakWLP/Ocs4ZX7t3TgSguREeeQWo1CUvu9o7qOGDtg0ibndYa0B7NwSi+Av8a
         Kb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793018680; x=1793623480;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=005Thyq9qrJBejm2la/InYlIeabB0AN+HhsspFti4SM=;
        b=yR+qbnGBARGWG3xOVJWawZXqIL2f87PpixX7VTI/vBvs6HR/1kr/MLR/4m82t7Sa2X
         uadkZRfL0rPVFQuIa32nhy8h1RgUNleYXfLBOCbMb9uokMBMJfUr5P2W7vinuXOflDgz
         HVhWxlSwbPHhVsUfrqGybPVNhKkIqrDq2RdLxLHfHs9kkfcoggHcfWK1t/hFx8pEoPKF
         lhURtydziAGXZUAhnsD5LX7uFeSWVNOZ2BUfz0byD7GUGylbU1VBBW/UyWaMhaNMMXLZ
         1O1dV77lPz8NV5I7p8aDFGPduCZcj7foLWlS0rmHDDp3Ie3O8wQdCDp56E53mAllHs1T
         lZiQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHimC7r8hYIiplIjhZ8G9OYHSUyjuHVPK9WVYXViReBf0I9lPc5HILS8FTuKlHcVWNzduHV3oIEeuYww==@vger.kernel.org
X-Gm-Message-State: AFq9FYKsRHE7WSmdsGQgOoacpDxD1m59Ylg5Ny02+otczPPei3FVYoTp
	RJOaBBsJGJBrfsYCiS70v0RJ3Gfs3w55gpm7ys8GM1EaMBt/cI97+Qi2Ld4z2+Oc2ZsFkUrQ88q
	pUb+cucUGRRpQr8yzMZ9obr+vIvPVh2/ByZ2ZXyEqJwenMWdI073qGxasOXkgXSIoOPKfYu9fET
	TN52QtiHmGvgiVQZPyi0efo5F+84cHmFeE1YvLe2mt
X-Gm-Gg: AYBFou3qgtV6S4bFHfkIRVt3AGmdo5vCTRlbpMyUo8Dr067VBJZGJ0An5VK2tmCFVX2
	YPjkLh0iu7TLAS+8aGIFHnjNYyM5deteN7sdWaGT55wrb1bL4SzWQ8DM9yZfeGpFKPvHj9281mU
	VKIrKLRiKpHgei1wCgeslXXaKNUJvcn0c/njJmkRhogl6UssDQEVIazok6BUc4vHTQ2w3vNWgp7
	R3w3YHBtkO2G/kjrA==
X-Received: by 2002:a05:6122:78c:b0:5ea:9218:eac1 with SMTP id 71dfb90a1353d-5ec232ff8abmr2049997e0c.20.1793018680322;
        Mon, 26 Oct 2026 05:44:40 -0700 (PDT)
X-Received: by 2002:a05:6122:78c:b0:5ea:9218:eac1 with SMTP id
 71dfb90a1353d-5ec232ff8abmr2049976e0c.20.1793018679853; Mon, 26 Oct 2026
 05:44:39 -0700 (PDT)
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
 <20261024-kaanapali-camss-v22-8-7da3ea49c8a1@oss.qualcomm.com> <CAFEp6-3kJA+yct3GbWzs+NG=xFv_OGZj6OgToOnfcPkb9H=BuA@mail.gmail.com>
In-Reply-To: <CAFEp6-3kJA+yct3GbWzs+NG=xFv_OGZj6OgToOnfcPkb9H=BuA@mail.gmail.com>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 20:44:28 +0800
X-Gm-Features: AclHuK_vZzSvUBbKv5qcRkDMeSvQ89XyxhHhnpT2JBNskNEMoXl_hPb8JdddQ0U
Message-ID: <CACbMrhoE2fcqGL-CSYPzacftuT=x+pVWAkkVvBXnkHuN+HzcBA@mail.gmail.com>
Subject: Re: [PATCH v22 08/14] media: qcom: camss: csid: Add support for CSID 1080
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
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6adf4b39 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yJPWxEu-MHjwpVTia4UA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: RxkODwBsws5lx-2jBZU7OxtxmuxEVRZr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfX7i8Jof3SFQvW
 lOlB8vc5tDeeJL70WMUXc2NoCm9tMnZgdlbo71o18AmIgVkYecQUKK6Gc6q0heqI2rsPbrtQiee
 YG1lViYMqfUpC5Jm7kA2E51LQNXzz+g=
X-Proofpoint-GUID: RxkODwBsws5lx-2jBZU7OxtxmuxEVRZr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfX6t0Kmo9DrZnt
 OEHkMQW42FZprdePkK4aVc6wO3uBuSahDBabqKwNrAoFVTpfbXfaKjYcDETOpC/WvByNfiAmks6
 2nnZBd6P+eSQWTxEc/kx64DvIxSh9AWViI6wz5hLTSI2dym5KYfzyerdSIuHPmNH1Q/R4UvymR+
 lcILawwpRORbex9jRHyvryNU3XeBeSPoeyReTG6cW6Z/hR25hkCGqjFeTJ5Q+08KG3FgpStQi7f
 xyULzt88TyeNpFvoIKHdQz2lWE/7Xzu6xRIR9Zv9CTC45IsbZ4QOicXoUmai8vnK1lNsNiScOky
 1RWrmYa6r9LrflnfWGOXoziMVnKf/drbBAuj90FRZawU4WTyNoAqXXVMfGzsIWzwSkvbWZdZB2W
 7fzX2jse1H322A/bOhvyamyEj37H8oPrq88Uk3jyt419b+mMmf1dRTvU14Kw+TlQDCf+bedan3V
 9X+I0RCMULtEWSEC5tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260050

On 10/26/2026 6:49 PM, Loic Poulain wrote:
> On Sun, Oct 25, 2026 at 4:17=E2=80=AFAM Hangxiang Ma
> <hangxiang.ma@oss.qualcomm.com> wrote:
>>
>> Add support for the CSID 1080 hardware found on the Kaanapali SoC.
>>
[...]>> +static void csid_configure_stream(struct csid_device *csid, u8
enable)
>> +{
>> +       u8 i, k;
>> +
>> +       __csid_configure_rx(csid, &csid->phy);
>> +
>> +       for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
>> +               if (csid->phy.en_vc & BIT(i)) {
>> +                       __csid_configure_rdi_stream(csid, enable, i, 0);
>> +                       __csid_configure_rx_vc(csid, 0);
>> +
>> +                       for (k =3D 0; k < CAMSS_INIT_BUF_COUNT; k++)
>> +                               __csid_addr_update(csid, i);
>
> Do we really need to trigger the same AUP several times (one per
> buffer in the FIFO)? could we have a small comment on why?
> Isn't this already done from the vfe_enable_output helper?
>
Yes, this is required. In v2 we hit an AUP-related issue where one
buffer was missed and capture got stuck on the last frame of the stream.
Vijay explained the details in this thread:

<https://lore.kernel.org/all/662a21a3-de8b-406f-a15d-b8a572aa79ab@oss.qualc=
omm.com/>

In short, since the split design was introduced on the 980 platform, the
CSID has to be configured after the VFE. Otherwise, rup_done or buf_done
IRQs can be missed. Also, each buffer queued in the FIFO needs its own
AUP. If only one AUP is triggered, the last buffer is never processed,
and the pipeline stalls waiting for a buf_done that never arrives.

That is the underlying story of the 04/14 patch and explains why it is
introduced to handle the platform hardware differences. Thanks.

<https://lore.kernel.org/all/20261024-kaanapali-camss-v22-4-7da3ea49c8a1@os=
s.qualcomm.com/>

[...]
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/me=
dia/platform/qcom/camss/camss-csid.h
>> index 2f7e593defed..603621c16315 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid.h
>> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
>> @@ -162,7 +162,13 @@ struct csid_device {
>>          void __iomem *base;
>>          u32 irq;
>>          char irq_name[30];
>> -       u32 reg_update;
>> +       union {
>> +               u32 reg_update;
>> +               struct {
>> +                       u32 rup_update;
>> +                       u32 aup_update;
>
> I would say keep it simple and just add addr_update field after reg_updat=
e.
>
>
Ack. Thanks.

---
Best Regards,
Hangxiang
