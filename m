Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDFA3515CB
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 14:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136240; cv=none; b=vF3MjKmiHnhzsDyj6xMUSNhHO4VWjzUCdlx8fghU8huXvIZtgX9qWut2TFMc/Rwo6w1Fvz4O2zk63nPw5Jx9V5zirRyp52lKgiVUejYbBAYJrBoVQ/gwfsUsoZo/QYWBXC6OYE+PinC0gZsEDL/2AAlc0pomvzruIeUsW0pcu5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136240; c=relaxed/simple;
	bh=PdUThxGT2s2FT2q3FWPuvhvZa7Myac50FYCC25nfC88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I78CsnZ7GHv7n0sWUd1aOqN3B83C68K1zLZMntzBeEj5mQZeQvYBnKOIpku9fkX9bAuB0i6Gjps10A13xjfm050uIyff0xo+se3h7lMoamxOgJx+lJ8osWcntn5A0/X/I1K19AY0DLGwDtP53JEexz6b1L1h/uIAuqS3ZLrYP6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j4RLqJvh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R7gabSzW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j4RLqJvh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R7gabSzW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCiTwM815072
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 14:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7vOdWM4x7tWb8pGfXz6ppZ73GwTF8uMM71InxBYAyQY=; b=j4RLqJvhcX4IcxuG
	WjvrwDfZ6upeNkpQuwG8cKwYk2XajN3wrIKcCmidK9S8QMvH5boSOSwwOFB2Bd7P
	wNDLKeipmBqut4PVzoFhOlgyxemzrrLjSgS6w0axvwAn1f3iNmgaGN02byFKKSlu
	NubByTBDPe51KzoNx7HI6kFyIvEKiO0vcLzYcdA0fZzKELlIXTJLXyrVKvkqOiBl
	cEl0lB0HJAm2U7CG8aA9VgceyBSSX1rNyX+JRdrxw43EOg6662i7lZKZZYlFfH3z
	SwXqR8dxT9O52tCahYfTQ+VxoNa+RaNG4lhvYit6+gsTTJrW0pu5PG+Lu6TlCHVX
	TcBVjg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd3a4wv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 14:17:17 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78fb21aaad9so825209137.0
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 07:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789136236; x=1789741036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7vOdWM4x7tWb8pGfXz6ppZ73GwTF8uMM71InxBYAyQY=;
        b=R7gabSzWRB4MrfpAvODAQMp0UM6iCafNFpbhJ0kbIcV0TZ5DuGQl06+2Eqc4l9XONP
         +rKOIRzf+svOlj9ku2RYxn8UMdxgSQ0DEby4NVjZmYfiEBEvHnLtf30laelW0XBc6p1x
         F/w6bTC15ftkZJ1yPjKI+E/GIE4phJe+wFNXAmsFzaR33dAuHcKDFyLuvac2afBH8oEI
         rrcNEQ3/cUbnh8GCoACbU60dYjmYrr0BH5RrpSor8bQnu8QwMgnkd0YPj4TZrn6/LAHN
         SsnCIv70OJw8m7yuGdFhZfNynZpalklxMXnZwQ/we+JVCaP5Al6Fm6HgGQ57HsUpH46X
         ahcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136236; x=1789741036;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7vOdWM4x7tWb8pGfXz6ppZ73GwTF8uMM71InxBYAyQY=;
        b=MdL4SiniXzLwxYkTHtYuw9TcI9q6UH1mOK+rAesYLPfiOTRjBzFXIOk5edMsLjwENK
         aQZy9yq5aYSM/l+5s7bjtESAI+zMzmmEvktk5O8+NPm4lUhA4dtS6lLQuRLX8iz5aM+C
         7lur+mIOjxtn5WJQldLU0pkufKUugejphEle862dNTXvcK9Cu6q0eXSSBpXoI0ICd54L
         i1IpGPp5cnZQ6hy1e44I91sUQVBdpHBN628E7/cs/moppuuTuPrw0D7/BxDlhN7167TH
         2mLVx47bj21HU9rr+yJX/8pRJBDSs8So5glkuUYeDSSdd7i7zh6xl+GEQcY2swlmEUd2
         +XNg==
X-Forwarded-Encrypted: i=1; AKwUvBzTOfGEKA2vAJk90aer0rQLJZy2aHdQ61QKMWLv/4egwaYS9dVXb6u9PQHSb32GaYyB2hXokFqns459Dw==@vger.kernel.org
X-Gm-Message-State: AFuF++lxPoADB5I0SQUdRWNyXGeZNtU+kcDwwmvP3I0D8V4OQo6lRKXo
	Yr4128yjvXf2M2ZuXWx+hJMDPBSZlrS6ScVNytrXzjLEJrZh2pE73/Z0NcpBfDwHyk9BwdgEfRe
	BIAmsJZZOHg/lZxy8u6q/Vn6bb/HbAVNaULSlyvS0jPt2Ht7GmjPq4c3Qbz/gYjJtOQ==
X-Gm-Gg: AYBFou3rY6YUMQRcvCKMltud77dbDXtGCxxYpWW2/X/tUQPHPKc/0Z60zWVE+Wctkpr
	748P8DYjzmfCcvHjiBbzp3ck7qfUWFSrsMzNrq1g5YhpK646Oc/891e/fJ81JUjuQo4xA8PVOFp
	g878QkwgXFKHOaYsKcvpXU04+iBPhyUNOnvFH4cy+gjKUu3laks9IzLCvtNYSFyVK1dy9ihR0gV
	7r6pwh2ndNZ2/2zPgwUolAZPTp7pUmfFvxV7gr8GU87q4gsDg1H/l8Nwj2R6mncYuFFrWj4lNd9
	UgtinMZj8BsuWGhbbmYcsMV159fkgETgZCrIiTtRNixoPLeCVAtvPn9+LIOvfHqxIiam+TawK/+
	3S2Jlh1hCh4KGldQm51NAkj51xupugSXbKo8kNDq8
X-Received: by 2002:a05:6102:2410:b0:78a:5bc0:4b7b with SMTP id ada2fe7eead31-790db5f66f5mr4008679137.21.1789136231579;
        Fri, 11 Sep 2026 07:17:11 -0700 (PDT)
X-Received: by 2002:a05:6102:2410:b0:78a:5bc0:4b7b with SMTP id ada2fe7eead31-790db5f66f5mr4008643137.21.1789136231130;
        Fri, 11 Sep 2026 07:17:11 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6687a1basm33854135e9.12.2026.09.11.07.17.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 07:17:10 -0700 (PDT)
Message-ID: <f8601f35-75ce-4419-b4e0-4b2dc162f3fb@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:17:07 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] media: qcom: camss: Implement CSID streams API hw_ops
 for gen2
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20260911062213.195007-4-gjorgji.rosikopulos@oss.qualcomm.com>
 <CAFEp6-1+g+kpevwUyXb2+0M4H5NPtz=2bc-CRfzyhOukRAn7VQ@mail.gmail.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <CAFEp6-1+g+kpevwUyXb2+0M4H5NPtz=2bc-CRfzyhOukRAn7VQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Bv8IUoX5 c=1 sm=1 tr=0 ts=6aa40d6d cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=JnRjegRK6RYr0dtFBawA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: A6jn49ZT5uVtc12RrPb6Q9AwSehOjlbz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIwMCBTYWx0ZWRfX+MYkjfKCYK/d
 HwG1R6ynMxzr9vSNqUWPHrPCqC2KLaUiJ6CVE/hyCsqqw03IDCQrELLC/E8inECAHT48w7pQNtn
 c/240LWkaPSrOFCDkPYZ/HHm35pguD0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIwMCBTYWx0ZWRfX1lhGH613IPGv
 fp+HseyUYtUHq6csQo+zkHiMNPziribQ/xCei2G8RgaKuM8UoYLpK+C2h2pB94soMPLrJaBYh64
 RiHrrZ2TX9JoiHujE7mQw6fujbH6h/88WuErE+gAS7tddJ+yUWKvLVpPmQW8AC84RzsuUti7hMc
 nKI2AQ74COse2Oehyc9F9NsB+I7FRoV+hEXubiL6FxM4aS3rPpoCG0TojqxpafRrvfxtugaQE1a
 es4HxSS9FY5pEDFhysxxHrPNK+yJwH+9uj8MbAaKBuOip/EMOkfjg0Z+Bs6P0WSDtgZuy4Zw2P8
 QqWn2MjOMrNNR5nb5Y8YzN1lAOUNQTq7BKdxi3Zi4UWt4sLYZS5VwEQFUUtISp/gVANTuhyCoV+
 btrNESobHoT6/TwiqX4v928UlOA6wRMGujRIfxwIU0IJkeCCtKvbSJnoqxrIQ+bnINj+TsrzRYU
 zoqhG1rywWGSXG4ACzA==
X-Proofpoint-ORIG-GUID: A6jn49ZT5uVtc12RrPb6Q9AwSehOjlbz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110200

Hi Loic, 

Thanks for the review,

On 9/11/2026 4:30 PM, Loic Poulain wrote:
> Hi Gjorgji,
> 
> On Fri, Sep 11, 2026 at 8:22 AM Gjorgji Rosikopulos
> <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>>
>> From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
>>
>> Implement the configure_rx/enable_stream/disable_stream hw_ops added to
>> struct csid_hw_ops, for the gen2 CSID hardware backend used by SM8250.
>>
>> __csid_configure_rdi_stream() now takes an explicit data type parameter
>> instead of deriving it from the CSID source pad's format, since the
>> streams API keys each stream by stream_id rather than by pad. The
>> existing configure_stream() path is updated to pass its per-port format
>> lookup through to this parameter, preserving current behavior.
>>
>> Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
>> ---
>>  .../platform/qcom/camss/camss-csid-gen2.c     | 59 ++++++++++++++++---
>>  1 file changed, 51 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
>> index eadcb2f7e3aa..2512cdb16d94 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
>> @@ -253,13 +253,8 @@ static void __csid_configure_testgen(struct csid_device *csid, u8 enable, u8 por
>>         writel_relaxed(val, csid->base + CSID_TPG_CTRL);
>>  }
>>
>> -static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
>> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc, u8 dt)
>>  {
>> -       /* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, Pad 2 -> RDI1, etc. */
>> -       struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
>> -       const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
>> -                                                                  csid->res->formats->nformats,
>> -                                                                  input_format->code);
>>         u32 val;
>>
>>         /*
>> @@ -281,7 +276,7 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
>>         val |= 1 << RDI_CFG0_TIMESTAMP_EN;
>>         /* note: for non-RDI path, this should be format->decode_format */
>>         val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
>> -       val |= format->data_type << RDI_CFG0_DATA_TYPE;
>> +       val |= dt << RDI_CFG0_DATA_TYPE;
>>         val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
>>         val |= dt_id << RDI_CFG0_DT_ID;
>>         writel_relaxed(val, csid->base + CSID_RDI_CFG0(port));
>> @@ -330,15 +325,60 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>>         /* Loop through all enabled ports and configure a stream for each */
>>         for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
>>                 if (csid->phy.en_vc & BIT(i)) {
>> +                       /* Source pads match RDI channels: pad 1 -> RDI0, pad 2 -> RDI1, etc. */
>> +                       struct v4l2_mbus_framefmt *input_format =
>> +                               &csid->fmt[MSM_CSID_PAD_FIRST_SRC + i];
>> +                       const struct csid_format_info *format =
>> +                               csid_get_fmt_entry(csid->res->formats->formats,
>> +                                                  csid->res->formats->nformats,
>> +                                                  input_format->code);
>> +                       u8 vc = 0;
>> +
>>                         if (tg->enabled)
>>                                 __csid_configure_testgen(csid, enable, i, 0);
>>
>> -                       __csid_configure_rdi_stream(csid, enable, i, 0);
>> +                       __csid_configure_rdi_stream(csid, enable, i, vc, format->data_type);
>>                         __csid_configure_rx(csid, &csid->phy, 0);
>>                         __csid_ctrl_rdi(csid, enable, i);
>>                 }
>>  }
>>
>> +/*
>> + * configure_rx - Configure the CSID Rx front-end
>> + */
>> +static void csid_configure_rx(struct csid_device *csid)
>> +{
>> +       __csid_configure_rx(csid, &csid->phy, 0);
>> +}
>> +
>> +/*
>> + * stream_id is used directly as the hardware RDI port index below. This
>> + * assumes a 1:1 stream-to-port mapping and should be revisited once
>> + * per-platform src_streams data (stream id -> hw pipe) is added.
>> + */
>> +static void csid_enable_stream(struct csid_device *csid, u32 stream_id, u8 vc, u8 dt)
>> +{
>> +       struct csid_testgen_config *tg = &csid->testgen;
>> +
>> +       if (tg->enabled)
>> +               __csid_configure_testgen(csid, 1, stream_id, vc);
>> +
>> +       __csid_configure_rdi_stream(csid, 1, stream_id, vc, dt);
>> +       __csid_ctrl_rdi(csid, 1, stream_id);
>> +}
>> +
>> +static void csid_disable_stream(struct csid_device *csid, u32 stream_id)
>> +{
>> +       struct csid_testgen_config *tg = &csid->testgen;
>> +
>> +       __csid_ctrl_rdi(csid, 0, stream_id);
>> +
>> +       if (tg->enabled)
>> +               __csid_configure_testgen(csid, 0, stream_id, 0);
>> +
>> +       __csid_configure_rdi_stream(csid, 0, stream_id, 0, 0);
>> +}
>> +
>>  static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
>>  {
>>         if (val > 0 && val <= csid->testgen.nmodes)
>> @@ -425,6 +465,9 @@ static void csid_subdev_init(struct csid_device *csid)
>>  const struct csid_hw_ops csid_ops_gen2 = {
>>         .configure_stream = csid_configure_stream,
>>         .configure_testgen_pattern = csid_configure_testgen_pattern,
>> +       .configure_rx = csid_configure_rx,
>> +       .enable_stream = csid_enable_stream,
>> +       .disable_stream = csid_disable_stream,
> 
> Would it be possible to leverage the existing CSID configure_stream()
> callback to implement the stream API? This would likely require
> reconfiguring all CSID ports whenever a stream is started/stopped, but
> if the configuration remains unchanged, I do not think that would be
> problematic. That said, we probably need to address the current
> ambiguity between the concepts of "VC" and "PORT" in the existing
> drivers first.

I have experimented with something similar, we know in advance which
streams will be routed and active using stream routes, we can enable
them in advance. The drawback of that was that all the streams (even inactive)
will be enabled when first stream is enabled, but that is the case even today.

What you propose is something different, but that will require changing of the existing
api and verification of all csid implementations, i am ok with the proposal 
if someone can help with the verification of other devices.

~Gjorgji
