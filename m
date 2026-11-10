Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292717;
	b=mmHFh8+r6JBoHpAhGLwbFj5N8YLmuMX+g38bb2sCmBJ58YecusnvGXQgwTeykf5n8knb
	 Cm1duFcxdL4YF+hNDLPV2pgF4psdUwYISEt4+bE3sxq+nlIrUNr0uMdrfrLKNE9EWWJqp
	 ihl48VO6WMYokQHwTmGjx9gJvZ1DDsLeMCfhdMf2qiwpNlSrYkLKtNfvZPD9DU0gE8uVt
	 4qzR35qlYnkiTbUNnWl4SDiRAztkPTO5TgYermEsV3p2n1QCWDhD3KDsjXVnMvINe44Lz
	 OW4ekOSaETcZoZ6BjbmWojCuW6j0S5rVKzgqYRDlD6FRKxK684D4PGyfRaN1UyS4xhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292717;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NGNco0OHUqDONf+FWw3Lj2FmESbwxLF4Nd7bMEWkk1k=;
	b=I9W9ynL9aVzh+B6fEqIAOboheaTR/Bw3lR1MzPlUg22b/VGXHxywzKoAV7LJ2c0rhcsV
	 T1uC19AhEmS3PTy/flhmiCMkeViNnwu1TKz6b2GClp8S/yhkcrxv9lTaQ8o0iKlV3lCkr
	 8ZHMSaiIUMxomjwEIU1g5dh2kyeawyWE9+UtIKdhZN00Ckeg0hgczp/6mbxA2P2edC1KP
	 p8A8nYr7o194Wg4RNi4uRMMPKmIhTMvCJdhqpyVezmobK2V+Wb+aLk9+m8aGBL0CxFxFq
	 8fEbMWjTOBTgy+9TngEzaIZ25P18Lgkuajc6BkV3GYKCVjjUEVMGHcktvsM0ppLkuUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PwpPArxh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="W5QAz/oK";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938B5606A32E
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 06:38:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 938B5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PwpPArxh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W5QAz/oK
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A2hn1207369
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 06:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NGNco0OHUqDONf+FWw3Lj2FmESbwxLF4Nd7bMEWkk1k=; b=PwpPArxhS0AqtHRs
	J1qFuiqTyWom642rbBgdiYAy5XDRGXL7aaJRC0CGkDixs/jb/07yTnhN3Pte1gcX
	NCDMDS3hfAqiNN5gzJt+VgyhiPQV0DP8YjFQ7vGwzJ6eydbiQy6QjL0lESTYhxp+
	E8rCJ6eR/+TEvZEDcjuoj92pa8jNToiULCFsPNMF9GIkRpFfmJ4i5XxsVqIZ7AQC
	UKN8SjaQ+4+TFHSQtq6Mpf6roBARVDClZ5vwcwGfalUMeWkxxaMgsJfdZxwoB67l
	E2hy3juy3iz/+H8aLqNpsqlNHl/RYVQJlyDuitbyFGdKGe3L9vIma9ITSI4UCMBl
	ANEYSQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkhusr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 06:38:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so374302585a.1
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 22:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794292715; x=1794897515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NGNco0OHUqDONf+FWw3Lj2FmESbwxLF4Nd7bMEWkk1k=;
        b=W5QAz/oKzxuUjMb+x07rsIMWxu6TyYrLO/GKiTe58rxPHmKj0io0nmBKggb0N5WsjR
         GdIJqZgH70E2WuBsbh2/i0hngVlzgAUShTsFT6ENHdDfPSlLFT3Hldq0U2xa3Zska1Vd
         aJVKw275xP8/j4thA6a0OssHI1+j4jwWv1OyOAoUFvqUcJlOE14oGen0PKjdMkqvFDG3
         r9aOc+vbBh8uyCk44EKyEqsS/2jsg+i/36R0aRU036Ls0vpjLdhbkfPHtrQB/dhpvW5F
         LgYJfhyW1kG0hkMRZNsHShPlkm3Hexcp9M68DmcNGGKmYPti78ClqAXPg8TuynVrb0/u
         VHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292715; x=1794897515;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NGNco0OHUqDONf+FWw3Lj2FmESbwxLF4Nd7bMEWkk1k=;
        b=hjI+ie5mxnpvsHnBXvVtUEU+x0fb3+uOMmA9N2KzX4BAFCxP0O78kh7M4JCF3KMfGF
         cYZ92hbBPC49ljOyF4jkW7l/QqBidq/NWw5qUwYF3uIqfcQzMOELuLwKQPCHqwxkOqWR
         OjWBZF5XVw2APk5bnPOy3uE6GVwVaS1sWWDoqrG5S7jF8QxyjFqot5YzmR/bonn0ipX7
         5O2zf/ucy1NAW1cblrJJPhl+vekZ/oUCRf7iMMDnebdn/gaBygINQoz+BFFWtP1xQRYS
         E0HIlnky/EAopy6V9VoZ1Rh9KS0HGacCA5VvKlsuRd8q5g4+8SomLLuTURUauS8edafd
         Vzrw==
X-Forwarded-Encrypted: i=1; AL+hErEkAI0Sg0ybqhsxBy3ZStqJGAxejWgTKEVoCXw8HszOPCY2j+q+2NO6jDABWZFvil0yZrtnPgqUNDmQxA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/9TjxrFuAkeT+X7KqjDkH1JOy1wuKBKBoOmc8L8txfIhsql1ZK
	M/b5OlwUNzjY5n+4QDtIHgjNrMpGY+maWIpg5vlSzoeffJxTxpbjVEgg90XYnxEEs99jSwGfI69
	4w7em7pOEVrEl7VqpuBzDB908YOfpY8Q6PbCwzOF2ewfa8Y+0aURXeLpYyffqtvmnMA==
X-Gm-Gg: AYBFou1HHIiqmuik4n+4RQR5iUHizQL4OZYcE5GhP4hg2LLLv1a1Kln1aQmEjuizkV5
	nucAXGGqoyzTMeFmi+yNnP0vwFZEQ8b3QhciIsqoHM7QVG4K1Zcmz9ztRNjBD0+Nd9wAU2nPlGU
	xNt7Rrmp9tk4xwfGJoDKcJ398rmfPBH+YYMShJ6+hPacvNOXlH7lZmoLTq+2h7ZLFPlqKFOt8pu
	4JtX55mmw5Ou6dFkTFO5tJLjh1e2H/FO4pRbOdR6ZNvwizLv9BEPvoUOzfqxGPoAlWNnhP9X4U1
	d8jOEZ4T/t1qzhD2MeD85nL+132xX4o0F+O2i9nFGyFvd+opzHftngzrn4btMx+eP0LTxSlG202
	RWvpxiXrGMIyEtFH/dTshm6fNlAEB0BFgAuBH56UuzqFDyvTFNohYApvUDfLD/Vf/tPL0RWjvwK
	NOoeY82bOZv2W3
X-Received: by 2002:a05:620a:44c9:b0:93f:35a7:cd4 with SMTP id af79cd13be357-9479f3c7b8emr281225585a.67.1794292714764;
        Mon, 09 Nov 2026 22:38:34 -0800 (PST)
X-Received: by 2002:a05:620a:44c9:b0:93f:35a7:cd4 with SMTP id af79cd13be357-9479f3c7b8emr281223185a.67.1794292714280;
        Mon, 09 Nov 2026 22:38:34 -0800 (PST)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02345d22sm48886375e9.1.2026.11.09.22.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 22:38:33 -0800 (PST)
Message-ID: <1f09c9ee-393b-4660-945d-8176f823b8f1@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 08:38:31 +0200
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/11] media: qcom: camss: Switch on frame_sync_en
 logic for csid-gen3.
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
 <20261107-v4l2-frame-sync-v3-8-e5bf7073a35d@kernel.org>
 <CAFEp6-0t_r7yH3hGRFH6amgfNUK7sTMe68HXQ2WEuUffHMQF2A@mail.gmail.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <CAFEp6-0t_r7yH3hGRFH6amgfNUK7sTMe68HXQ2WEuUffHMQF2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0TL83RBvfQ8_dM3qlY-OQOJvoFvcwIoj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX1CIoqLd35rXH
 I3J8WlnCH5VZjS5B1B5h7g3WGgwT3yAPK/pYeQ5yI+Vhs7bHbn2hrLMu/Xs5lzvVN9otCRQarFa
 H4etgcHMpptn5SrxLz9/Qx3IS/DPjCA=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af2bbeb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CtbmM4eJ-fP_3bz2-A8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 0TL83RBvfQ8_dM3qlY-OQOJvoFvcwIoj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX76YYaE5Ca/uz
 1qe6vnRbuumfW4dhlvJ7+Yk50PJMuA5aRX3oWeGgs6L9+Nahg7texhGY+u/ATB04KiZotl4FVl0
 681DIbIoKjakQtVwSFo4YCMUHfuMD3lcvtMSZcA5og3Kz4MIXwBG5MolgzVqT4Bks14fQ+DZrOR
 rxgPAUIdjL6UdwoNVjlc6K1+PqmpqVFCP6kBeZpa3aJ3BvyMLL4KeNry6OP2lNbWDF0quSZCWSp
 je2kVdeD2GrLCYUCh56hxErWbfD5Sr7Y85FUfD4/m+BvPZCg6D32K531m0b0ei+fZ9RpN+2yHTe
 K+E7Y7Rm8gP5iqLv7kGU9VHLMTF8SnRbJ1YHRMQ0lAk6e9Eqd3WApCL9yrb2LQWgCeeJ09pDILQ
 6eGYyCrDhPS6xUhUFH3a2uDEBbx+ZQ3btxXKB00z35F+oRri+yR9M9VySg8S5lSyO0UQrWUlZpz
 u7OPwoeMwcKMmLgXjdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100026

Hi Loic, Bryan,

On 11/9/2026 11:56 AM, Loic Poulain wrote:
> On Sat, Nov 7, 2026 at 2:02 AM <bryan.odonoghue@linaro.org> wrote:
>>
>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>
>> Switch frame_sync_en to true to track and consume SOF/EOF data.
>>
>> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # sm8650-hdk
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> 
> I would have preferred this to be defined directly in the
> corresponding CSID implementations rather than in the resource
> descriptors, so that the component implementing frame synchronization
> is also the one advertising support for it. In other words, something
> along the lines of a csid_hw_ops.features flag or a dedicated
> csid_hw_ops.has_frame_sync callback/field. That said, this is more of
> a design preference than a blocking concern for me, so:

I double that. It make more sense to introduce capability field, only drawback is
that as of today once the feature is validated for the SoC (which may contain
same csid or vfe version) is marked as supported which may not be the case
with caps, however the risk of breaking something is low.
Note that in multistream support we are introducing new field per SoC stream api
which also can be taken based on the caps. 

~Gjorgji

> 
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> 
>> ---
>>  drivers/media/platform/qcom/camss/camss.c | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index 52bb19f5fbf3b..b7821019241d7 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -3120,6 +3120,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
>>                 .reg = { "csid0" },
>>                 .interrupt = { "csid0" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .is_lite = false,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>>                         .hw_ops = &csid_ops_gen3,
>> @@ -3135,6 +3136,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
>>                 .reg = { "csid1" },
>>                 .interrupt = { "csid1" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .is_lite = false,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>>                         .hw_ops = &csid_ops_gen3,
>> @@ -3150,6 +3152,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
>>                 .reg = { "csid2" },
>>                 .interrupt = { "csid2" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .is_lite = false,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>>                         .hw_ops = &csid_ops_gen3,
>> @@ -3165,6 +3168,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
>>                 .reg = { "csid_lite0" },
>>                 .interrupt = { "csid_lite0" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .is_lite = true,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>>                         .hw_ops = &csid_ops_gen3,
>> @@ -3180,6 +3184,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
>>                 .reg = { "csid_lite1" },
>>                 .interrupt = { "csid_lite1" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .is_lite = true,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>>                         .hw_ops = &csid_ops_gen3,
>> @@ -3433,6 +3438,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
>>                 .reg = { "csid0" },
>>                 .interrupt = { "csid0" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>>                         .hw_ops = &csid_ops_gen3,
>>                         .formats = &csid_formats_gen2,
>> @@ -3447,6 +3453,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
>>                 .reg = { "csid1" },
>>                 .interrupt = { "csid1" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>>                         .hw_ops = &csid_ops_gen3,
>>                         .formats = &csid_formats_gen2,
>> @@ -3461,6 +3468,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
>>                 .reg = { "csid2" },
>>                 .interrupt = { "csid2" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>>                         .hw_ops = &csid_ops_gen3,
>>                         .formats = &csid_formats_gen2,
>> @@ -3476,6 +3484,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
>>                 .reg = { "csid_lite0" },
>>                 .interrupt = { "csid_lite0" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .is_lite = true,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>>                         .hw_ops = &csid_ops_gen3,
>> @@ -3492,6 +3501,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
>>                 .reg = { "csid_lite1" },
>>                 .interrupt = { "csid_lite1" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .is_lite = true,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>>                         .hw_ops = &csid_ops_gen3,
>> @@ -3790,6 +3800,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
>>                 .reg = { "csid0" },
>>                 .interrupt = { "csid0" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .is_lite = false,
>>                         .hw_ops = &csid_ops_gen3,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>> @@ -3807,6 +3818,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
>>                 .reg = { "csid1" },
>>                 .interrupt = { "csid1" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .is_lite = false,
>>                         .hw_ops = &csid_ops_gen3,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>> @@ -3825,6 +3837,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
>>                 .reg = { "csid_lite0" },
>>                 .interrupt = { "csid_lite0" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .is_lite = true,
>>                         .hw_ops = &csid_ops_gen3,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>> @@ -3842,6 +3855,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
>>                 .reg = { "csid_lite1" },
>>                 .interrupt = { "csid_lite1" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .is_lite = true,
>>                         .hw_ops = &csid_ops_gen3,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>> @@ -3859,6 +3873,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
>>                 .reg = { "csid_lite2" },
>>                 .interrupt = { "csid_lite2" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .is_lite = true,
>>                         .hw_ops = &csid_ops_gen3,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>> @@ -3876,6 +3891,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
>>                 .reg = { "csid_lite3" },
>>                 .interrupt = { "csid_lite3" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .is_lite = true,
>>                         .hw_ops = &csid_ops_gen3,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>> @@ -3893,6 +3909,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
>>                 .reg = { "csid_lite4" },
>>                 .interrupt = { "csid_lite4" },
>>                 .csid = {
>> +                       .frame_sync_en = true,
>>                         .is_lite = true,
>>                         .hw_ops = &csid_ops_gen3,
>>                         .parent_dev_ops = &vfe_parent_dev_ops,
>>
>> --
>> 2.56.0
>>
> 

