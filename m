Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367529;
	b=W4foR+K8pTADKow2GgW9CyeJQqrM53o0qGYkWPDeHEAVYwaabpPhqEMovu35iHzu2scO
	 0cjK8izZPwXofRcXGyBNOl00dQuc4xhQBGHQMZ1n0JZic4s8ksrJyXbvJZv2hkktIf6RP
	 HG2BKwObfuIRFN3USrQHlC0lPw1VBd0RhM7kCeWeYDmBSVB0rm7DXxxcFt65hBC9TQUl4
	 uDGBEKfdehQxAtMB5ROIVO4SUbZGsNxftOx97+bAN3sK//oCgOjQmlDDA8XQlLmTWCo/e
	 Ub+yhZYFwA5ioAETZy55o8wnHwoumqSkxxZQV1JWQfmYBERvOPkbGkURxeh8r62bgvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367529;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AomCtOWxOdmlR0sUoqk220RU7FjG0HPHL1G9AKXfbu4=;
	b=MfrT270lOnl4veo2uNblDHiz08RAN+6icLpeKWnpoUAJWJfzSWNciWPkOYutEVs6qSUT
	 sNSKWkHUOfxiiLRQYK/ND2xe7OHU0Snm25/pnOL1NCbV3OufPfaZTqoZdhZMttce4qZGp
	 eeuL5M0DLmJcpqhxn6VQVvdW2RRKNiYCxGXdE322Au1ckRH5DtlnVAn5mf6svsawpVgI6
	 NR1idSMjudkYFysrTfLZLzlfQJUu90NKv7hssGID7jingmPtyFMAJ878OPnsvU2fU1qWX
	 Dijo8VfuAluqdqgYSc5UAUtdGaoQjM/3bQ5Lhym3+3UJnOQ1L9TWfh+z5vDwIAQ2Rww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fb2KX2wd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OtZCG2fg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C784606A327
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 03:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C784606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fb2KX2wd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OtZCG2fg
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB1tcPg4169159
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 03:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AomCtOWxOdmlR0sUoqk220RU7FjG0HPHL1G9AKXfbu4=; b=fb2KX2wdfJiGUbio
	yo0qBEH0nfT476LGmDRJqeyj27F88zaeuEPSAD6EICAl73s5DeOo3s5UHciGejLg
	p3yD6JpZxhTa7M0WWrPWx7ZAOJnznldjCpmo1hjJQ1W5zewJVvGuyXaEgDsi9SFw
	UPVhOjYbBJuutWRklCfXt+pMJsiGFXkwQaQuE702RFtZrkaSWNFl4szxoq6dfQGu
	A33evsCYMxR5lTxjRVkASgxaiS/WvblIFxI8B5jujsZ1SsdMY1WwSDQwQkLYmORJ
	hPDiRuitXJdbNAcK3ruijNkKV7F60gczmbNv2LrN9s4PBZUpe6ZFpF3tJb6RYwV5
	vwcu8w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyw4c3cg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 03:25:27 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-375f0fd31f4so1496162eec.0
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 19:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794367527; x=1794972327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AomCtOWxOdmlR0sUoqk220RU7FjG0HPHL1G9AKXfbu4=;
        b=OtZCG2fgn0UcbGMApCWXw0tou4eHe2j6hlP58WEU6Z6wZjWWPnvwyONvVzI6S6yFdb
         IaHPdVDsPAGb7dU68pZF9PaOW2feDML2JdORWPmVszLzyu4DIzbO01pXxc7IACK0tYVg
         nP/ZBka405mEoo3xftdNu5Bb0bbvJ/l3z95HwxZTV5D789IlO82/x+aGew5JcbjzUVPC
         s+neuq9zCHPCGvJSE+Z20tdKVaPMvMCbifPquuLl/6MG+BAzZW/qOtNbHhe7jllL4Cg+
         J2vkW/XBXFOnon0CTZIifuk2pceP+GHWPUIrzmz7lYyexq+pWiaUP441ourHC35XqpQZ
         0Img==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794367527; x=1794972327;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AomCtOWxOdmlR0sUoqk220RU7FjG0HPHL1G9AKXfbu4=;
        b=n9y7lVCbQT+x3aofCg7h/pKj1PJgHiIZfnRfNT4QeTnN4Zz6Kf36xWvtKS8oeG2esX
         OignTB84TcQFVkvasRysL2JtCGP7k1TO/dLVmr9UOJMHcYGoDe5mlTP/eEiV9IMspHh1
         gKNveo/7OLX6jtpzyihbNExuemA+QaJ0D9xvviv2qvxyvea391FYLo1AtKf68GX+2Ecc
         IVBX/ALKMPdIxM8WR1xQWricZiJI03e9/W15EP50Pc8sne1pBaTVDD6jyd+Pu98UNq97
         TJefqXarTDu/ipJJR41TDTXXo+XUjgJqld16eRWllsLTIxcB0n4axb8KpdEPCsgdKBSr
         bYTg==
X-Gm-Message-State: APuU4Z+jOW2yicwiApp3wcyb+xr39vU5mpcUxOZC1t6tZ82iL4JqyqNs
	Y2tnUutYIFxiYSh4ujeAg/S7d/wZcT+SwseWfTNWoAAdlcTqzVxuQVxdKiFBci1u+FcUZQMbUD6
	Ry955RZhNJmNdU4PmKaiADUvWqFrdkklozJrn74VGl77kYMPcnQXglkoVVPjBf5LjLw==
X-Gm-Gg: AYBFou1zbq5xFrHCUPj2OHKX1xi0ZmsTax6fjqLy19dw75Tbzqa9pubWNXINDfXL6Mh
	9Vk3olVz8ac2DtHWqZP3zcg8PKDWRTTKCr4tSz4d3+6skGdMuBjPO5D/YeJQf3EMXZes12d06MT
	b1y8oHXBV/nU39aOPpeEGiBfLUT9HpL/K93BfWWXqSlZJiQ4cmah2jCdQvPBn/+bqZ9uzOKXRu4
	qoiuEL/JbCQ3OrUQkac48jYQCM+DKolMeRde0P8F9SP8VdfXy0sTlJG4KpPhDPdhuHTzgz3gmbr
	Jf/8kAu1SVwNAHhHQ6KeCIka8Oh9+02OZXB5IzONbJH72yLxR2At5wdK/XJh2LfQdXQBOB1Kclz
	2arJ7qeT3q4dFEuibIMoOxCqvJ9jWWTO5+GayfRFbsezc7arWVJ7tjLbmRji/M3P+Vos+X8rrIl
	8C04W+
X-Received: by 2002:a05:7301:77c7:b0:376:ce6a:a499 with SMTP id 5a478bee46e88-376ce6aa7b1mr857778eec.36.1794367526799;
        Tue, 10 Nov 2026 19:25:26 -0800 (PST)
X-Received: by 2002:a05:7301:77c7:b0:376:ce6a:a499 with SMTP id 5a478bee46e88-376ce6aa7b1mr857749eec.36.1794367526185;
        Tue, 10 Nov 2026 19:25:26 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfe29fsm12427852eec.21.2026.11.10.19.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 19:25:25 -0800 (PST)
Message-ID: <6eda82b7-c617-fdbb-9fe8-adb0f1206acd@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 08:55:19 +0530
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
Subject: Re: [PATCH v2 3/5] media: iris: Fix use-after-free on unbind with
 open sessions
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, sashiko-bot <sashiko-bot@kernel.org>,
        stable@vger.kernel.org
References: <20261110-iris-handle-unbind-v2-0-86d5f6f1dea8@oss.qualcomm.com>
 <20261110-iris-handle-unbind-v2-3-86d5f6f1dea8@oss.qualcomm.com>
 <ee2aedde-6688-4cfd-9f92-3703b081247d@linaro.org>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <ee2aedde-6688-4cfd-9f92-3703b081247d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxMyBTYWx0ZWRfX2tXhUmTf4g05
 vsZCoEOXt3H3NPYtCjSKSS+hA3zrdZ2SvdYgmp8nOfNbBUeSB3FH6KDZQLfE0vPlL9Sl6uDaQ3Y
 v1wYMkHfFpiswRVYjVjpmm4GCGc4qdTMzxX6OmjQUYUhYdIHkKe2m1RhHvnc4qXlqySf/A6hvK3
 T+J22XkdlvZkoBnuU4Gj8BHJIDuy2HkpToMPszPOJzVevIqRIN1SEs8DIm5OVx423cWI6nX6Lzl
 qQ2Oz4MEowVpE9TJF7Wms705BJiaPs4bcxzvda90AQYEeoJ0TU5sld7dx9C4xOGgYpZCpWGt8YH
 CIDJF98KgK0tSVxdUJfcizkTOKjhnHUGaUQ2UDY3dDfkDC3Jqrw1Aqx9RuDU65+EQv18TQG+hfw
 NTbv3t+987oYpx1x+Vq2yHtUYqpTr/Xw3m0IbrY5XU1qDwfoRxe24A3RIiJ3/jfwsKZxt0vYhk4
 Zh3UN3VEBX/El0LdT/A==
X-Authority-Analysis: v=2.4 cv=Ee1d0/mC c=1 sm=1 tr=0 ts=6af3e027 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OCzWoR2KFpuGU18DyrAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxMyBTYWx0ZWRfXxLPDYQJmuwEK
 NdeFD2JzvsitzqoILz95GD42izmW4J9s165cfOBEumBvHFDhu6A7gIZvY+kq4I+SMkGv8GRbVed
 kb5pJBEZyv+FnhI1lrA4W1ujTTomoCg=
X-Proofpoint-GUID: knrHWLG53iGcG02Zw3JQhkyATu9QV_me
X-Proofpoint-ORIG-GUID: knrHWLG53iGcG02Zw3JQhkyATu9QV_me
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110013


On 11/10/2026 8:12 PM, Bryan O'Donoghue wrote:
> On 10/11/2026 14:09, Vishnu Reddy wrote:
>> The driver can be unbound through sysfs while a client has a video
>> session open. The core is devm allocated and freed when remove()
>> returns, so the open sessions then use freed memory.
>>
>> Only the core structure needs to outlive remove(), because it is the
>> only thing the file operations of an open session still use. Allocate
>> it with kzalloc and tie it to the reference count of its v4l2_device,
>> which every registered video device holds. It is freed when the last
>> file descriptor is closed. The other devm resources (register mapping,
>> response packet, clocks, power domains, interconnects) are only used by
>> the power on/off sequence, the clock and bandwidth votes and the
>> interrupt handler. All of them are released with the unbind, after the
>> core is shut down.
>>
>> To make sure nothing uses them afterwards, set a removing flag at the
>> start of iris_remove(). It makes core init, new sessions, command
>> writes and the clock and interconnect votes fail with -ENODEV, so a
>> client still holding a file descriptor cannot power the hardware on or
>> vote for resources that are gone. A client waiting for the firmware
>> only times out and returns an error without touching them. Runtime PM
>> is also disabled explicitly in iris_remove() instead of with devm,
>> because its callbacks use the core.
>>
>> Fixes: 38506cb7e8d2 ("media: iris: add platform driver for iris video device")
>> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
>> Closes: https://lore.kernel.org/all/20260926064921.976721F000FF@smtp.kernel.org
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_core.c      | 10 +++++-
>>   drivers/media/platform/qcom/iris/iris_core.h      |  2 ++
>>   drivers/media/platform/qcom/iris/iris_hfi_queue.c | 15 +++++++-
>>   drivers/media/platform/qcom/iris/iris_power.c     | 13 +++++++
>>   drivers/media/platform/qcom/iris/iris_probe.c     | 44 ++++++++++++++++++-----
>>   drivers/media/platform/qcom/iris/iris_vidc.c      |  3 ++
>>   6 files changed, 76 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_core.c
>> b/drivers/media/platform/qcom/iris/iris_core.c
>> index d558475986ff0..bdac6b8c98e44 100644
>> --- a/drivers/media/platform/qcom/iris/iris_core.c
>> +++ b/drivers/media/platform/qcom/iris/iris_core.c
>> @@ -43,7 +43,10 @@ static int iris_wait_for_system_response(struct iris_core
>> *core)
>>       ret = wait_for_completion_timeout(&core->core_init_done,
>>                         msecs_to_jiffies(HW_RESPONSE_TIMEOUT_VALUE));
>>       if (!ret) {
>> -        core->state = IRIS_CORE_ERROR;
>> +        mutex_lock(&core->lock);
>> +        if (!core->removing)
>> +            core->state = IRIS_CORE_ERROR;
>> +        mutex_unlock(&core->lock);
>>           return -ETIMEDOUT;
>>       }
>>   @@ -56,6 +59,11 @@ int iris_core_init(struct iris_core *core)
>>       int ret;
>>         mutex_lock(&core->lock);
>> +    if (core->removing) {
>> +        ret = -ENODEV;
>> +        goto exit;
>> +    }
>> +
>>       if (core->state == IRIS_CORE_INIT) {
>>           ret = 0;
>>           goto exit;
>> diff --git a/drivers/media/platform/qcom/iris/iris_core.h
>> b/drivers/media/platform/qcom/iris/iris_core.h
>> index 3e4cf652bf39a..379f0666a42cb 100644
>> --- a/drivers/media/platform/qcom/iris/iris_core.h
>> +++ b/drivers/media/platform/qcom/iris/iris_core.h
>> @@ -62,6 +62,7 @@ struct qcom_ubwc_cfg_data;
>>    * @iris_firmware_desc: a pointer to the firmware-specific descriptive data
>>    * @ubwc_cfg: UBWC configuration for the platform
>>    * @state: current state of core
>> + * @removing: set when driver removal starts, blocks core init and resource
>> votes
>>    * @iface_q_table_daddr: device address for interface queue table memory
>>    * @sfr_daddr: device address for SFR (Sub System Failure Reason) register
>> memory
>>    * @iface_q_table_vaddr: virtual address for interface queue table memory
>> @@ -108,6 +109,7 @@ struct iris_core {
>>       const struct iris_firmware_desc        *iris_firmware_desc;
>>       const struct qcom_ubwc_cfg_data        *ubwc_cfg;
>>       enum iris_core_state            state;
>> +    bool                    removing;
>>       dma_addr_t                iface_q_table_daddr;
>>       dma_addr_t                sfr_daddr;
>>       void                    *iface_q_table_vaddr;
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
>> b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
>> index 545bbe75e1740..e0cfa5107d1d9 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
>> @@ -128,13 +128,26 @@ int iris_hfi_queue_cmd_write_locked(struct iris_core
>> *core, void *pkt, u32 pkt_s
>>     int iris_hfi_queue_cmd_write(struct iris_core *core, void *pkt, u32
>> pkt_size)
>>   {
>> -    int ret;
>> +    int ret = 0;
>> +
>> +    mutex_lock(&core->lock);
>> +    if (core->removing)
>> +        ret = -ENODEV;
>> +    mutex_unlock(&core->lock);
>> +    if (ret)
>> +        return ret;
>>         ret = pm_runtime_resume_and_get(core->dev);
>>       if (ret < 0)
>>           return ret;
>>         mutex_lock(&core->lock);
>> +    if (core->removing) {
>> +        mutex_unlock(&core->lock);
>> +        ret = -ENODEV;
>> +        goto exit;
>> +    }
>> +
>
> This locking scheme is looks racy, what's the point of this granularity ?

The first check is an early reject when removal is already in progress.
The second re-validates the state after resume, since iris_remove() can
start while pm_runtime_resume_and_get() is in progress. Without the second
check, a command could be issued after teardown has started. Also, core->lock
cannot be held across the entire function because iris_resume() also acquires
core->lock.

>
> ---
> bod
