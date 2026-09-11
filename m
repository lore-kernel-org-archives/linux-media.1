Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B052F6565
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 14:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135566; cv=none; b=FqLoiTRxnKGZLl+3ZUR2KmX6IVbLY0rBZ1+k12T8VzIaXBQ45bKJSYM7O19dpqGYLwhlA257IAmp8EukeCmm04Ajm1kOtsfpcDCf11HzzfFIu6pYKR4LjhxnGmKICdoS5S+SS783sZJw/iFXVrsjv2usKeQ8c7UPauMePtLEZIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135566; c=relaxed/simple;
	bh=ulbryzlRrQTqkJ1z6/JkfO6tU92hSZWWHgey+fY17PM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q2XjeLpQp465od/wwhSBKX0ufvHKzbaAyTBL5hzZyDNgRXz1NL9J335K96p+jNQ/GiftvMxqn1176h2vvkxEL2ahN8aS3LHXcqEY6evhHLvM4FqWdBYHXSnm4z7wt0ecKHpoV02MtW9I/chUDFPzJdKhUNi5moCRuWMrXkYxono=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Etfthvb/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IVVfQ/gb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Etfthvb/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IVVfQ/gb"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCiV2E4187383
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 14:05:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BUKFOWdViEfGfisSzezZLfVxXxk5fHozrfLGvTM+b38=; b=Etfthvb/ZxyB6eug
	s83sTqDaAWRWtdVFzzuRqlXuMKhMcAni1B0AuI8c5otdPabxWGqfihXtPRd4ndm5
	WCX47iIngXgTQ0Ylo4w3Y8hHgrgLwrptCoB6bGTXocscatUTVbmSF8gAjbg5LlPa
	D9+jZSYAHy4W40fxUZp5ywS9yUvwQf1WiPAH5Mlig+D7omTEPSMHHm7J2EcNHtjL
	wGUYXU6geX8utol+NzYTK+/yD4NMGZcvTW/sAbRL8CQNWztonIVNhSFWh3pZvhT0
	d8b8yj/TM0rN3PBmJ54devJTwq3QDnq3866WTZ/amPiMt8XN4Nj26zx4KJP1x7X+
	6Y7YEw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd522fc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 14:05:58 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78d25a8ff32so213056137.2
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 07:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789135557; x=1789740357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BUKFOWdViEfGfisSzezZLfVxXxk5fHozrfLGvTM+b38=;
        b=IVVfQ/gbng6trKutfdbMtaEEk5Z4rfKM3ldJjqRFtkcQzphayyZ5nlVlau8Osq1JO9
         cUj+duEAE2a9a/TmQYnNj56tosFihYmZimxJRbltbNnfxPkNe1h/OAZ7CVGzp/iWRRc+
         bN/eMGDm+T0mKEX3NJIKWckTTiZrorzZbCemvJTMdpeN0ESem5JMirNA3nTTJ4GC8FzQ
         LED+6efFfLb+rhgbs5bgNgIJavZKzb7eEj4AqystcCvXYZlDEF3bkTtJd1w+9riAyrDR
         Zdh+8tA6hAiKHXbuv3HFGMYroNCjNdG3S27y5OWGGbgva8jRlUbK8YqEfFNuWZVBLCTh
         8ngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135557; x=1789740357;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BUKFOWdViEfGfisSzezZLfVxXxk5fHozrfLGvTM+b38=;
        b=pT2KgXtmSCq2ty3JA0JrFBNiCxnVEsZlkJTvAtzMHDHMSpZytjnRpvG0uJyceEu/2i
         Gdh6XBHs1qcARHokXR3oTzcOhPZ16HxaxmSLOsqfYfI3UClmLCZyF9DOcUL/VEgLyEPd
         gKQSE7jAjXYvWu6e2nto48wr65iQ11KGi9n5kBBVcOnqBK+mzkMryTJTBPpwxCdgP9NX
         e/FoD8gPA9IIuoUY+asEI1mehJS5XzFOQHvyi0TOXImsZdZaLIFLgJywdZzug7wxqRx7
         2fWH/wP7YHNhritonXSAjkNDcwhbxi/ciCmHeDNA4b49OREYFrb1pKV9b20CMBxQHBoJ
         4g8w==
X-Forwarded-Encrypted: i=1; AKwUvByHIbI5InBi/1LnxxwFVJXHw28DCgn9zN8M7acEfYgCv6rEv9a0YicLiIZ7vbBnZfm3zrxf5YHjeYRnjA==@vger.kernel.org
X-Gm-Message-State: AFuF++moB6cmRA4tw4QGaJnyfyL/dxvyYUgwTgZnbd0YEx+kazLv7KC+
	KJ1ZWvIRU2SYOJ1OGyS4MSXClxzMKOE0600Fixur7aM17mjqsf6QPEwkzmIVwN02TeGAFKG0RsJ
	yiy6yN8Ccjp8z9uGR32PmDtsi/cZ6FS/kmqgAtWtfsKivsEiJnEh/98USt09poGfZvQ==
X-Gm-Gg: AYBFou1MFqBZtP1AIFUvydN3lLszVclwHTPD9vMBtPTmnoxzNhI87eJDSaydCDyXdpB
	TGUhv/Wsg/iK6s0ix0Cu1f0TmpKHNi+zTWza2gItKJ/kBoGDvJBdZjvhUw7mzdCCzEst23bCuvp
	TGG5zYFMuTAalR3iNHQxfohAwH52meuPbjLeAS5S1rcaNdzNakiexsz/Wiad57UoGAqS1oKVqlD
	KOFp+XrU+z9IJRbXhjNOeA56MBYSskfLl4fs1GtuPs5xe4e2a56aCct8C0tVrVctSJrur1ExXG3
	mZpfAUNKFIeDF/2Tzv0OijOHn7eVtXrIf5JS4xgUy2D2VO4qD//PLBGbivyK/jZ6TEpoS5ecNKJ
	giAjJr6zYGzqQzA7YraueSQTWGo4A22vs+h2lRcSS
X-Received: by 2002:a05:6102:55d1:b0:781:210d:28aa with SMTP id ada2fe7eead31-792a50c100dmr3782354137.2.1789135557520;
        Fri, 11 Sep 2026 07:05:57 -0700 (PDT)
X-Received: by 2002:a05:6102:55d1:b0:781:210d:28aa with SMTP id ada2fe7eead31-792a50c100dmr3782252137.2.1789135557001;
        Fri, 11 Sep 2026 07:05:57 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a81943sm48067045e9.1.2026.09.11.07.05.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 07:05:56 -0700 (PDT)
Message-ID: <d9201e3c-45e7-423b-b81d-4d817fd8c8bc@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:05:52 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] media: qcom: camss: Add streams API hw_ops to CSID
 interface
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20260911062213.195007-3-gjorgji.rosikopulos@oss.qualcomm.com>
 <87e34805-e56c-45b8-a3d8-458ef17b92cc@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <87e34805-e56c-45b8-a3d8-458ef17b92cc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GZ6q8fWS-ON8J1HasKTo212J6CRckzTw
X-Proofpoint-ORIG-GUID: GZ6q8fWS-ON8J1HasKTo212J6CRckzTw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE5NiBTYWx0ZWRfXwBYYWX9Q8hjF
 1eWZBsTV9bn6VZOjWrXQxRbpRD8yxNC40oOcC6lYlg9fU6aVE9c77S/5wSOnErV7jxA74ahJT7r
 5O3hfgqc3es7HeeOKksFb0APqE2MTPY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE5NiBTYWx0ZWRfXxvn+cy44726X
 YrSC26gCSseKSkEDIOvf9fJ4wKzxXf9lHAPks5kAIswowCOVasS+WYwOFoSkM1xTV0d9kkrJZip
 kuq5gtRJQxEx/hB5lslrPCb21ALYjSfKJ3+tSVgY3nmuz7xY78dBeWXISrko6gDgiw8xsFjk1Zb
 V/6+Fdww+e3DjvrVNfDBEWS6UZHCmCWOZQ0BKoD8BgqEg9dsgTNunpzGIxLwSdGrfVLl0XixwyB
 09EVvAm0b1ZZ9Q4WILalAXq+Xo1bjDcCuds/2wQj3hGtCf8zEYvPcZedeTaDEUuP3js3CC0vhqz
 RfTGmA9+DeYjWpONeofrG+Se7l38sWqsYrnwEA800/bCSggsE/QL/dtkR8MsXcnJc3Ry8tyQVfV
 P9sSQcc46xmL8spF1Wy+oiaLuG5/Ph5V5wuU3P8zux1VV8WmOTmQaZWz1wJL5u8Fn+0HqYFtugs
 Z3iGdkYRyqXhjMDMMdQ==
X-Authority-Analysis: v=2.4 cv=db0VTnXe c=1 sm=1 tr=0 ts=6aa40ac6 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=FXOfda06WdeUfy0AeUkA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110196

Hi Bryan,

Thanks for the review,

On 9/11/2026 1:43 PM, Bryan O'Donoghue wrote:
> On 11/09/2026 07:22, 
> Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
>> From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
>>
>> Add configure_rx/enable_stream/disable_stream to struct csid_hw_ops:
>> per-stream hardware operations needed to support the V4L2 subdev
>> streams API, where the CSID Rx front-end is configured once
>> independently of the per-stream RDI programming.
>>
>> No functional change: these are new optional hw_ops entries, not yet
>> implemented by any backend or called by any code path.
>>
>> Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
>> ---
>>   .../media/platform/qcom/camss/camss-csid.h    | 43 +++++++++++++++++++
>>   1 file changed, 43 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
>> index 5296b10f6bac..90ee611b9092 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid.h
>> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
>> @@ -74,6 +74,25 @@ struct csid_phy_config {
>>   
>>   struct csid_device;
>>   
>> +/*
>> + * struct csid_hw_ops - CSID hardware version specific operations
>> + *
>> + * configure_stream() is the legacy (non-streams-API) path and is mutually
>> + * exclusive with enable_stream()/disable_stream() - a given CSID instance
>> + * uses one family or the other, chosen by streams_enable.
>> + *
>> + * stream_id, as passed to enable_stream()/disable_stream(), is a hardware
>> + * RDI/PIX port index in [0, MSM_CSID_MAX_SRC_STREAMS). It is currently
>> + * always equal to pad - MSM_CSID_PAD_FIRST_SRC (multi-pad, 1:1
>> + * pad-to-port mapping).
> 
> Lets not mix and match names. There has historically been a huge amount 
> of sin and liberty taken, not the good kind unfortunately - with port_id 
> and write-master.
> 
> port I believe is the misnomer we are currently stuck with - so lets 
> continue to use it until a more crisp naming convention happens.

I agree will switch to port until we have better name and change it everywhere.

> 
>> + *
>> + * configure_rx() is called once, on the transition from zero to non-zero
>> + * active sink streams, strictly before the first enable_stream() call.
>> + * enable_stream()/disable_stream() calls are always made under the
>> + * subdev's active-state lock (core-enforced via
>> + * v4l2_subdev_enable_streams()/disable_streams()), so hw_ops
>> + * implementations don't need their own serialization.
>> + */
>>   struct csid_hw_ops {
>>   	/*
>>   	 * configure_stream - Configures and starts CSID input stream
>> @@ -81,6 +100,30 @@ struct csid_hw_ops {
>>   	 */
>>   	void (*configure_stream)(struct csid_device *csid, u8 enable);
>>   
>> +	/*
>> +	 * configure_rx - Configure the CSID Rx front-end
>> +	 * @csid: CSID device
>> +	 *
>> +	 * Called once, when the first stream is enabled.
>> +	 */
>> +	void (*configure_rx)(struct csid_device *csid);
>> +
>> +	/*
>> +	 * enable_stream - Enable a single CSID output stream
>> +	 * @csid: CSID device
>> +	 * @stream_id: stream id to enable
>> +	 * @vc: virtual channel to program
>> +	 * @dt: data type to program
>> +	 */
>> +	void (*enable_stream)(struct csid_device *csid, u32 stream_id, u8 vc, u8 dt);
>> +
>> +	/*
>> +	 * disable_stream - Disable a single CSID output stream
>> +	 * @csid: CSID device
>> +	 * @stream_id: stream id to disable
>> +	 */
>> +	void (*disable_stream)(struct csid_device *csid, u32 stream_id);
>> +
> 
> Seems odd that none of these have integer return types to propagate errors.

Well initially they were int indeed, but i get some internal review comments to switch 
them to void, currently the implementation is writing only to the registers. 
So i am ok to switch to int return type, other option is to leave them as they are
and if needed in future to switch to int return type.

> 
>>   	/*
>>   	 * configure_testgen_pattern - Validates and configures output pattern mode
>>   	 * of test pattern generator
> 

