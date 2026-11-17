Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915940;
	b=Kyu0EGcYaKsyWhXmTAzwuVGGLZoCOO622zKqKU5VQMkEN6Qj98iewU39JKXt/54agCxl
	 LKxcanmJZioZHgG2wU3YlqwgqI0ldbqpNAe30D8STfHa0zMv29bPtPq2Mxci2SVGqqbi9
	 ynAatteyAKHPW4wezlBJ35HV518AyDyrtp92NHwNdYRoig2uuKd8ZfdB4iMj3r2xSZTun
	 dyShCWUO6MLAq+Us+lg+ZGP3Hx5RdJDoRygd2G4dZOIP44xAJmfkjY3Ftx2Mf11qd1E/+
	 Pegt0mAVTeGn6luzw99eoO98lvRJC9+EWZJuE2si0lM89QcZbMa61E8u+6BTESoAoug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915940;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZuldvTFGqvoThScV3eP1J10a3bvY6Jb5DSXjzpU3950=;
	b=Q+3yspxF/9CKnp7bkSvIZCRXdoivgKAeBUVvxczwOT0r3OJPKxZkPQ1Z8kvMeppgrer+
	 Zt3zAri6p4nKLHOBS5DfNgVtAYIDmjQDUlIbZxvdmj57JjmqrxgM/KB/GQOsfcMyf2V52
	 54Wd9eJTiCUUYflkaO6S4JdzOJzM98BXG3MjzGVzk1epFHct1XGzNSIHyy6xSNPbg+4fp
	 Q5AmWqBWw2pWh9afiDLPz6aN8C51f38CKbwT5CaywBc1fkrXtEggXqxjB2ppyF9oyrapB
	 OtxZrMlkGeecCXj2Bj1DEf5fADqOAkJc51p1d2xQMw+belgqfXMXtO71s4SPCZaOwNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ef6CtlAd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DKGNStEw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CBF606A32C
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 11:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61CBF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ef6CtlAd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DKGNStEw
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHA4sIc2790444
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 11:45:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZuldvTFGqvoThScV3eP1J10a3bvY6Jb5DSXjzpU3950=; b=ef6CtlAdlzQsPznc
	1LfAdj7bPyn+8o1f88i9Yc6QEnL+vdNkcUSHPCOfDxcRGMTo9SYel6SL9eOJ/8rB
	3vhtc5sgq66Fdpbr/FiOqYtn/m6U/c46m/qPYuMYAybAciMR9iKfo2PrEVbLl2Am
	2ouCOYRzSEOk/8sDVIJ/zwKklVDMkTGhRn+/rcr6SO/yvRK4MfICEWh0q3U9PKVr
	Himln70OmQiqFzUIHnWY/Kd/AvKNOXNzQMtxlLyirG1MAxzUCOA1QW5ZrUBuKWfR
	lf9+yGmeeh2l93c87dtbZQck8oEwRXbqQ/upslIidr7qQ3AAFz+ZVhl2em+Ht6q2
	ogUOFA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0mv10cbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 11:45:39 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b53bfc9534so226597c88.0
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 03:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794915939; x=1795520739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZuldvTFGqvoThScV3eP1J10a3bvY6Jb5DSXjzpU3950=;
        b=DKGNStEw0OOdlx4fL2M+MTRytbVB85jjL9m5pkqJHqf0a8e3q7nmE/JiYpVp2jXGKk
         8YOThlJKCbCSGcznv0W5EJd+gs4fhPlIKxOcbH6jlmjT34NlgCVLNkMCvC4gEuxuNeHb
         OfjLash39isBTiJvU2RDHw56tUOCzAC4MdDWO/qSlc43anTMjgZvgkKoxPSGuPbntCmV
         6SiMT8Md1WKUhAvCdDTvpfmTE3VHCvSN1LpJovCYRUqUVWayKn+3M1eaA2qUpnsCBrFy
         WgPFhEDvKa0ipS2qf0O1opHNm0Lojo8r2CJJtHxsx5xbukFtEnaA5IVTSgJRPmZ+guhS
         0j4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915939; x=1795520739;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZuldvTFGqvoThScV3eP1J10a3bvY6Jb5DSXjzpU3950=;
        b=hTFC6YZmIfNHgAhB0mklqlqPdOcGEyjJ8kMVvxUjujheWPYXKfUydldijnSyKODT+J
         YNtu1/Y2yB1BbSQ849f0+3GK70wZ4U7f+iL8Izk8jqXzeJK1faODvgLeH+SaHArkeYp4
         zkaYNO1AuY2PGe7nbxTsDzrc4pS6bX8kZ/R02TAiecnhyh7n/KrnD9C5wlarUMl6MbLg
         djIy/0c/V9xjnhPZfMl01qzap/OVyq629Azlo1Us/2wfoyYIsdnf1xySXRwQJaUXmepZ
         HusFl27YqNynmuEyg6DnFyHyESuw0kqLSTukSf/tLuzqVyn5f3Jmmfij7Snn9TnUM7/V
         T3Iw==
X-Gm-Message-State: APuU4Z9G1K6c6v2YDJjorVsAms8w2Ybr6C9VQUnUV7RBazVDSCwqUiYA
	zav7aw42PkcTQwe80uKiXeohz1w1ciN7kIksN/dQ2VNBTgrGO3HB4EU8dqVBrL3vDiE4kMeJivQ
	yS8UwbUonYcA5sGXubXi52F4IRHj2X0I0VKGNoWcqzFmhIJfmzHVYbnA6WK7sVvHgq40KMQQsXg
	==
X-Gm-Gg: AYBFou07hJ9VOxw8dbcUs8J70NrQEnUZp40thQ/4ZIkNAQW8Xscn2pVTSxLifTd88WT
	jQ0Kzg2z8cVItgxZagMu4B6wWl+JgR4mPTPN1Rpmkn7fARnDSS+yJMYnJrhYc2Ic26z1CjQCsEr
	VYUlKf6QFdIItqWuhoHlLXSXfgMLIctjRfKv7Y1IAVemcibYOFEq5NnTIk0bVWB4JXGTMhRtpGY
	XjsEeLnhVGqrJHKv/ZXgaqWt2evQ+W9qKSxu4eb/bEfT3moZvvrwYK8C1RCdlncUv0Vh0Z+7Al/
	Dvrfaq/dOrs5fcToSnJ0jAooZP4h9Xj5/yQkf74LKGx+GT+b0orX8MKPsh4tVbAGmOHDEGB4qhn
	qgWu2/cKvoV55sL607W0+DmGCecH4jfJVXNfoBFy1IhSGkjb671UmzikjVfwxOwYF6a5YDi/JQK
	8vwRAC
X-Received: by 2002:a05:701b:424b:20b0:1ab:6b10:461 with SMTP id a92af1059eb24-1b50310fab8mr12608203c88.45.1794915938594;
        Tue, 17 Nov 2026 03:45:38 -0800 (PST)
X-Received: by 2002:a05:701b:424b:20b0:1ab:6b10:461 with SMTP id a92af1059eb24-1b50310fab8mr12608167c88.45.1794915937985;
        Tue, 17 Nov 2026 03:45:37 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm46094903c88.8.2026.11.17.03.45.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 03:45:37 -0800 (PST)
Message-ID: <f8e072d3-3fe4-2538-d88f-26bfd3fb075c@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 17:15:32 +0530
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: iris: Fix out-of-bounds read in timestamp metadata
 fallback
Content-Language: en-US
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <MHYjgQwKyl4g6PykXAKsc_qby-VHmaZ8ZyKEoTM1Fpmve-Cg_dUJaQT0a2MReqplHxr4JLS7xunPQ6qB5AlxVg==@protonmail.internalid>
 <20261017-fix-oob-tss-v1-1-fb86f4cabf65@oss.qualcomm.com>
 <c81473c3-e735-44ba-b9b3-ef71a206e4c9@kernel.org>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <c81473c3-e735-44ba-b9b3-ef71a206e4c9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gohrvUXVqDjVjnl2W1RfCi4BOwS7F5M7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0NiBTYWx0ZWRfX9J6FtMTv60el
 2t65u02UTwP05BzvcIIVaO8rjN9vaTxDASC5tDI4A9GUPzIsCc+K7AvjsJupW4BVai1+5cTzaDT
 CIJAZqyXl+wP935yywLX9zs2ARydhbs=
X-Proofpoint-ORIG-GUID: gohrvUXVqDjVjnl2W1RfCi4BOwS7F5M7
X-Authority-Analysis: v=2.4 cv=Cuwq4X4D c=1 sm=1 tr=0 ts=6afc3e63 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=l-SxXqRTaWQHASsAo6AA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0NiBTYWx0ZWRfXwWxO7xEQ6E2a
 uFPFPkPFbamSxSkedqHis/XISqAPG7lDW38W+jmurcMsL8QU+zqJLYaSeaLfYObFPSNOhp2Q48Q
 os28sWcj/EREkHWXoIra2PTxyi0ekY80c6x+OiukQDJ3RLjsu+5701o1Sm9Wy0Q1HxZtYmbHgFk
 kDaDB9bZbE95alI/t0voRUmt5mvM29A6lHfOPQSL6BLZgbVHkqCa+YifGFAzQrccGxN/hNUXHxT
 6VNvqcGNC6gR9dpyc/MW7OPT/+3ziaggnzd0C6nv4/Imapmiy9eyHLTxB5mQK5khIBnGcS4csEr
 j7MQA3CE2pH/VTd/l6X8rWfSGX/gu4to0kFohWATu5WuVs3eA0qfhf+FSc1Hq868LxY5JYxZwBW
 Il/wgl0XUkN/3C2G1EFCD2DmbCPU5qPNYB56qTEoiTjz0w9P1lt3qS4XkEdpQGI8+FhczASVeez
 tPyv94XE8TPmpk5JGgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170046


On 11/15/2026 6:24 PM, Bryan O'Donoghue wrote:
> On 17/10/2026 04:25, Vishnu Reddy wrote:
>> inst->tss[] has VIDEO_MAX_FRAME (32) entries, so valid indexes are 0
>> through 31. iris_set_ts_metadata() writes at metadata_idx and then
>> increments it. After the 32nd input buffer, metadata_idx is 32 until
>> the next input buffer is queued.
>>
>> If iris_get_ts_metadata() finds no matching timestamp in that window,
>> its fallback reads inst->tss[32], one entry past the end of the array.
>> UBSAN (Undefined Behavior Sanity Checker) reports this as an
>> array-index-out-of-bounds error.
>>
>> Use the last written entry, metadata_idx - 1, in the fallback instead.
>> Fall back to slot 0 if nothing has been written yet. Even if stream off
>> and stream on happen multiple times on the same session, the fallback
>> always uses the latest metadata received.
>>
>> Fixes: 17f2a485ca67 ("media: iris: implement vb2 ops for buf_queue and
>> firmware response")
>> Cc:stable@vger.kernel.org
>> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_buffer.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c
>> b/drivers/media/platform/qcom/iris/iris_buffer.c
>> index eb8de60c1177f..31cba99a665c1 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
>> @@ -865,9 +865,11 @@ static void iris_get_ts_metadata(struct iris_inst *inst,
>> u64 timestamp_ns,
>>           return;
>>       }
>>
>> +    i = inst->metadata_idx ? inst->metadata_idx - 1 : 0;
>> +
>>       vbuf->flags &= ~mask;
>> -    vbuf->flags |= inst->tss[inst->metadata_idx].flags;
>> -    vbuf->timecode = inst->tss[inst->metadata_idx].tc;
>> +    vbuf->flags |= inst->tss[i].flags;
>> +    vbuf->timecode = inst->tss[i].tc;
>>   }
>>
>>   int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
>>
>> ---
>> base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
>> change-id: 20261013-fix-oob-tss-7d317d612cf0
>>
>> Best regards,
>> -- 
>> Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
>
> Just control the variable where it is owned/assigned - the index should never
> run outside of bounds - dealing with that out-of-bounds is a fixup that
> shouldn't have to be done.
>
> Don't let the index overrun at all. That way the next function that reads the
> index, doesn't have to know or care that the index might run.
>
> [0] % git diff
> diff --git a/drivers/media/platform/qcom/iris/iris_common.c
> b/drivers/media/platform/qcom/iris/iris_common.c
> index 25836561bcf3e..b2b9349c38ea9 100644
> --- a/drivers/media/platform/qcom/iris/iris_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_common.c
> @@ -33,9 +33,6 @@ void iris_set_ts_metadata(struct iris_inst *inst, struct
> vb2_v4l2_buffer *vbuf)
>         struct vb2_buffer *vb = &vbuf->vb2_buf;
>         u64 ts_us = vb->timestamp;
>
> -       if (inst->metadata_idx >= ARRAY_SIZE(inst->tss))
> -               inst->metadata_idx = 0;
> -
>         do_div(ts_us, NSEC_PER_USEC);
>
>         inst->tss[inst->metadata_idx].flags = vbuf->flags & mask;
> @@ -43,7 +40,10 @@ void iris_set_ts_metadata(struct iris_inst *inst, struct
> vb2_v4l2_buffer *vbuf)
>         inst->tss[inst->metadata_idx].ts_us = ts_us;
>         inst->tss[inst->metadata_idx].ts_ns = vb->timestamp;
>
> -       inst->metadata_idx++;
> +       if (inst->metadata_idx + 1 >= ARRAY_SIZE(inst->tss))
> +               inst->metadata_idx = 0;
> +       else
> +               inst->metadata_idx++;

Thanks for the review. The issue with wrapping after the write is that
metadata_idx then points at the next slot to be written, not the last
one. After the write to slot 31 the index becomes 0, so the fallback in
iris_get_ts_metadata() reads tss[0], the oldest entry, instead of the
latest. For v2 I advance and wrap the index before the write, so it
always points at the last written entry and is never out of range.

>  }
>
>  int iris_process_streamon_input(struct iris_inst *inst)
>
> There should exist no window in time where the index is invalid.
>
> ---
> bod
>
