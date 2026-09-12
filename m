Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13EA375F95
	for <linux-media@vger.kernel.org>; Sat, 12 Sep 2026 05:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789191277; cv=none; b=Qqr80QTPm9hUtpI1tFcCeMbyYdsr77SrRiblKmzvcOwLqCQFtxmHK/WjyFKrkfancz0dmO+DIemp2rob5+UUl2+1/uHgUm52T/J5TJr0Z8dfWsRH8shiBRUM+4sb9IlU0fBzgNZDva0axJfQCRTU0Dm1q4aOTjmfbmbDoLluXpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789191277; c=relaxed/simple;
	bh=sJo34rQVqEpNknLIgZe57oTNIiOHak2toH2+M+rhl/c=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=UKC4UlU0CVSQunDifDgjM99CiBbI3feXNXde490rSYaIlR3MaGiPVBq9nYZn8C1uaHwbvsCJUJszAKReO+ORjj7sFnu0MFeA0n0NSuVgKlxhmdaQQZ84qTixu+dor/zvh+Ji3xq87MaKu1UmGbncaTSwXHt5OYrbS6/RosWPhm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TXsNZ1C8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UsUzwWs8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TXsNZ1C8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UsUzwWs8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68C4V4VC2226630
	for <linux-media@vger.kernel.org>; Sat, 12 Sep 2026 05:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5iF7h3QVjHnRytjjjc/3dTT/X64vIbM+wfEJdjbcWWE=; b=TXsNZ1C85kfGa4Fa
	Kfh7VpGMDJUWnCJcTNwFBWtiPCf2cKMGiaYFpFtImLn+9XJKncI01crLY4TqQNcw
	oWQ6eUWiw7ANuHGXPvhoY5aEAUdm0v+WDpNk6eoaRWkCHt5KtNq/7P3YHSmibFF1
	GFhcES+MiZs/VHzqhAjVYZA9uq7AFM2egctf7Jixt3tg02kaRmRtMK/lFg7u6+jc
	6eNdy0Or+PJqf4A+FbQ2zKIMKnzyNwyCXcwxPTqUoYZwlL70TISJ5pZ5YP6Pjt7M
	Oz6T0UqsnX7+cgJBoXWOuIAUIL1YARxLVrCRKnWPXBQgsnoRTHCUMrMnUa2ubRgL
	4ruRJA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c85e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 12 Sep 2026 05:34:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f3426a7cso214641585a.0
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 22:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789191274; x=1789796074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5iF7h3QVjHnRytjjjc/3dTT/X64vIbM+wfEJdjbcWWE=;
        b=UsUzwWs8smCSBTPViQdvbo4yr+yr03td3xF/yB6GyySpJ2TjYNJfJWzAFJyxDnyQXu
         76hXij7pgxhuZcs0IQqUoY8cI3TXzqkwqEhfNUW9v/uZJaWmi6H0bnU23jRB674zbw0w
         Gtwn+8jkEwYSj8MYuxpYOdZKWAN9pn5b272iNAbobiUo8ZpozbXRbrWK4fwdO8iRoyph
         U9TZqwvpT+gOoUi0M4OdtygmTDqfsykYMXq6t3dUG5p2q41Ezljbn3OFBbI5KKZpynDU
         NmFzNS2AxUG7ymA+8t/EyJdOfPjfbrjISfVBBA/TNIvwv6AUxiG97NCKWuoMrOOh5nXX
         DI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789191274; x=1789796074;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5iF7h3QVjHnRytjjjc/3dTT/X64vIbM+wfEJdjbcWWE=;
        b=WKLRucHZhmAhUco5TkME8M3cJzuUfnIgUx5ZRfLZJHCGH3xy+ByACEGKpICNW1qvjh
         RmbnpFfqhVJNVXS1AuzN1gfefGKs6Qp/dNa6bWD3HpzvLS57dczt1az9YagHFYTEipEv
         e+7OWW0ObaAlJ6oQidOx8WeKP/G5/TgUi+ZrL8iAVNmSiBiJRcUMVvaL6jmUccRNdgEW
         je3wZC3KRzz1sfpJi2FrkduHUliw4QlK+MatVB1N7laNGKx7RXgXf+AfubTUrcAS5jzu
         tr5tKxPIX64lmqjrZCKvZ2vLqlgYq2N3V+6r+QrBaOhAscPnTQdsHNkZZTh2hQn8/1Yz
         Jr1w==
X-Forwarded-Encrypted: i=1; AKwUvBxROzVX9+hiwrpW1kt0tGLDFmuR8nEtmVOx9yHTIAL0/+cNetp4KW7Vfw83THBHgLENRVDqDvB2UWpBLg==@vger.kernel.org
X-Gm-Message-State: AFuF++kbGIBwonKFb/rgM6gbSkL7gHlkLxm2iEgQzDYHiyfdfLa+OYxe
	vkYyBiVP0yNyuF0dbUcMGrHObud3e4NA8IoQUISPju+nb76LbA8d/rWz+9p8LVXTZGMxtlsOh+G
	4/JXLPgjrHse73+djIVJItQGZj93lVRhd8jZ9qbw+i3FW2ORRk+0ZQcoOisUw/zzYxg==
X-Gm-Gg: AYBFou38HBYsmcb8A7AAxJwGrRH8d/kPTcVCGiiORg9Md2pdVeIgyyIzSErHplQEwnf
	nX8lbAuG8JSn/+HsL535zAQ2QYSwfGwB/YRyexeVrGBi5T7OkRSVew7CDc3FUwvDMmCctAwNX8O
	oEarviqYYYMVAWw+MWMTZQTP9OUI8s2YtPNKmj1TGwgdLSUCfyCXh69rfy7O9S0eccpnWGTGwG5
	ou8wKDiACRGJ9wPciLwjiAvkcadWSmwPqzICT+jD7jI8fwuhPzhKP0GV4cNTwAl62zu/ERIvH0R
	Q9SI91sSH6Mzre322QKrSnNzWMhSomWdl/premEGrAwNifUh227Ckb92MQN/ffBKrE0kOLhCcE+
	G89kesd5Jc/wEoa7XLswuIZUIq9x5B+F5MuP3j1vH
X-Received: by 2002:a05:620a:288a:b0:939:ede4:a499 with SMTP id af79cd13be357-93a035f328dmr214129085a.5.1789191273966;
        Fri, 11 Sep 2026 22:34:33 -0700 (PDT)
X-Received: by 2002:a05:620a:288a:b0:939:ede4:a499 with SMTP id af79cd13be357-93a035f328dmr214102585a.5.1789191268738;
        Fri, 11 Sep 2026 22:34:28 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm186614475e9.14.2026.09.11.22.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 22:34:27 -0700 (PDT)
Message-ID: <58ca2ad9-cfc8-46e9-bbd6-4640b5edd69c@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 08:34:25 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] media: qcom: camss: Implement CSID streams API hw_ops
 for gen2
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
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
 <f8601f35-75ce-4419-b4e0-4b2dc162f3fb@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f8601f35-75ce-4419-b4e0-4b2dc162f3fb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=e+mT2qp/ c=1 sm=1 tr=0 ts=6aa4e46a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=F_M2Yv-rfSBzxpAF3TcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDA3NyBTYWx0ZWRfX4WDuJY6fkDEk
 cgvfpukdrnedKJk9LoNG32UtI0qoYp3ovuVBAvKNAq2UQErcU6Myq9+pdkOxMSO7IRj41l3NQas
 Iw5OIygRWnuSVoNOnNfIM4asTTEZOZc=
X-Proofpoint-ORIG-GUID: RjolsqlNcCvKBaz3yLQuLkxP3aS8UaQh
X-Proofpoint-GUID: RjolsqlNcCvKBaz3yLQuLkxP3aS8UaQh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDA3NyBTYWx0ZWRfX1DFMthKWwUJA
 X2fYUcWPofMcfEnyBV/ZBSyhj/sZVyWjELfJJqfgGCOc2yR1vUDac90X6W2bPvVnYIV1hYWF4dR
 RxdwY8V3ED009KjH7PK1/k3fEZvhgSqWXIZJx5+mvMV+X0ARBCpzdcAIT0g5y/4HzKUvpqULtSc
 EmFQxvO5WhkuzD9By+lND0ROgO8bGYd/n7z4WWCVsd44BM8vnGfsLxvqsCAM0qxPekFor4mFVkT
 np2uHVA3e4D8f+FDbeNdhGJzphgnARPbbBfc/R6sKQdEmss4dhLaCvyEtXNVSzpwysdCP2h8Hgn
 n5PXMD5JUhtSQ0SP4KJ34GPyWsgbUgHJpfus0MiB5jHGMEf3zpu48xUFOHIsFt/t0f8eiqSIWeH
 g0JSttwByf5570SQuIt4ryyWFDvkfn+AfsxXTqDKa7UJInctNhqTCHPF0Izc0MVCWg/vhQjMwRP
 It6ExqgQmy0r77FZRzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_02,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120077



On 9/11/2026 5:17 PM, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Loic, 
> 
> Thanks for the review,
> 
> On 9/11/2026 4:30 PM, Loic Poulain wrote:
>> Hi Gjorgji,
>>
>> On Fri, Sep 11, 2026 at 8:22 AM Gjorgji Rosikopulos
>> <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>>>
>>> From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
>>>
>>> Implement the configure_rx/enable_stream/disable_stream hw_ops added to
>>> struct csid_hw_ops, for the gen2 CSID hardware backend used by SM8250.
>>>
>>> __csid_configure_rdi_stream() now takes an explicit data type parameter
>>> instead of deriving it from the CSID source pad's format, since the
>>> streams API keys each stream by stream_id rather than by pad. The
>>> existing configure_stream() path is updated to pass its per-port format
>>> lookup through to this parameter, preserving current behavior.
>>>
>>> Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
>>> ---
>>>  .../platform/qcom/camss/camss-csid-gen2.c     | 59 ++++++++++++++++---
>>>  1 file changed, 51 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
>>> index eadcb2f7e3aa..2512cdb16d94 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
>>> @@ -253,13 +253,8 @@ static void __csid_configure_testgen(struct csid_device *csid, u8 enable, u8 por
>>>         writel_relaxed(val, csid->base + CSID_TPG_CTRL);
>>>  }
>>>
>>> -static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
>>> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc, u8 dt)
>>>  {
>>> -       /* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, Pad 2 -> RDI1, etc. */
>>> -       struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
>>> -       const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
>>> -                                                                  csid->res->formats->nformats,
>>> -                                                                  input_format->code);
>>>         u32 val;
>>>
>>>         /*
>>> @@ -281,7 +276,7 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
>>>         val |= 1 << RDI_CFG0_TIMESTAMP_EN;
>>>         /* note: for non-RDI path, this should be format->decode_format */
>>>         val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
>>> -       val |= format->data_type << RDI_CFG0_DATA_TYPE;
>>> +       val |= dt << RDI_CFG0_DATA_TYPE;
>>>         val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
>>>         val |= dt_id << RDI_CFG0_DT_ID;
>>>         writel_relaxed(val, csid->base + CSID_RDI_CFG0(port));
>>> @@ -330,15 +325,60 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>>>         /* Loop through all enabled ports and configure a stream for each */
>>>         for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
>>>                 if (csid->phy.en_vc & BIT(i)) {
>>> +                       /* Source pads match RDI channels: pad 1 -> RDI0, pad 2 -> RDI1, etc. */
>>> +                       struct v4l2_mbus_framefmt *input_format =
>>> +                               &csid->fmt[MSM_CSID_PAD_FIRST_SRC + i];
>>> +                       const struct csid_format_info *format =
>>> +                               csid_get_fmt_entry(csid->res->formats->formats,
>>> +                                                  csid->res->formats->nformats,
>>> +                                                  input_format->code);
>>> +                       u8 vc = 0;
>>> +
>>>                         if (tg->enabled)
>>>                                 __csid_configure_testgen(csid, enable, i, 0);
>>>
>>> -                       __csid_configure_rdi_stream(csid, enable, i, 0);
>>> +                       __csid_configure_rdi_stream(csid, enable, i, vc, format->data_type);
>>>                         __csid_configure_rx(csid, &csid->phy, 0);
>>>                         __csid_ctrl_rdi(csid, enable, i);
>>>                 }
>>>  }
>>>
>>> +/*
>>> + * configure_rx - Configure the CSID Rx front-end
>>> + */
>>> +static void csid_configure_rx(struct csid_device *csid)
>>> +{
>>> +       __csid_configure_rx(csid, &csid->phy, 0);
>>> +}
>>> +
>>> +/*
>>> + * stream_id is used directly as the hardware RDI port index below. This
>>> + * assumes a 1:1 stream-to-port mapping and should be revisited once
>>> + * per-platform src_streams data (stream id -> hw pipe) is added.
>>> + */
>>> +static void csid_enable_stream(struct csid_device *csid, u32 stream_id, u8 vc, u8 dt)
>>> +{
>>> +       struct csid_testgen_config *tg = &csid->testgen;
>>> +
>>> +       if (tg->enabled)
>>> +               __csid_configure_testgen(csid, 1, stream_id, vc);
>>> +
>>> +       __csid_configure_rdi_stream(csid, 1, stream_id, vc, dt);
>>> +       __csid_ctrl_rdi(csid, 1, stream_id);
>>> +}
>>> +
>>> +static void csid_disable_stream(struct csid_device *csid, u32 stream_id)
>>> +{
>>> +       struct csid_testgen_config *tg = &csid->testgen;
>>> +
>>> +       __csid_ctrl_rdi(csid, 0, stream_id);
>>> +
>>> +       if (tg->enabled)
>>> +               __csid_configure_testgen(csid, 0, stream_id, 0);
>>> +
>>> +       __csid_configure_rdi_stream(csid, 0, stream_id, 0, 0);
>>> +}
>>> +
>>>  static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
>>>  {
>>>         if (val > 0 && val <= csid->testgen.nmodes)
>>> @@ -425,6 +465,9 @@ static void csid_subdev_init(struct csid_device *csid)
>>>  const struct csid_hw_ops csid_ops_gen2 = {
>>>         .configure_stream = csid_configure_stream,
>>>         .configure_testgen_pattern = csid_configure_testgen_pattern,
>>> +       .configure_rx = csid_configure_rx,
>>> +       .enable_stream = csid_enable_stream,
>>> +       .disable_stream = csid_disable_stream,
>>
>> Would it be possible to leverage the existing CSID configure_stream()
>> callback to implement the stream API? This would likely require
>> reconfiguring all CSID ports whenever a stream is started/stopped, but
>> if the configuration remains unchanged, I do not think that would be
>> problematic. That said, we probably need to address the current
>> ambiguity between the concepts of "VC" and "PORT" in the existing
>> drivers first.
> 
> I have experimented with something similar, we know in advance which
> streams will be routed and active using stream routes, we can enable
> them in advance. The drawback of that was that all the streams (even inactive)
> will be enabled when first stream is enabled, but that is the case even today.
> 
> What you propose is something different, but that will require changing of the existing
> api and verification of all csid implementations, i am ok with the proposal 
> if someone can help with the verification of other devices.

In addition using configure_stream and one api for multiple streams will make the interface
more complex. We need to extend the interface with stream id's and pass vc/dt for each stream.
I think that current enable/disable stream is more simple for this implementation.

~Gjorgji

