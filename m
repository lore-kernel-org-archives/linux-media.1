Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204623;
	b=dJ4icCsoUnsFthwWzcHJrl9EEliOb365fuIgf404VOnhwIf9MwzCJ+5uoiChdPvj3XRo
	 MIwq4f6YaDOmQQLi/5jZCJTu22Z87gW8j/bBTVD4YjMKpFRWX+IWC8XKhiktV3f7nKph8
	 RawsZ3UJYL9+ysGcFfUPMuS9QAJo2l59QECswlmU4Q0RBW9jFsfCeBwQANU69qkKwaEwC
	 9L0TFVv+P5yxCPYoHaFnzqHt/gbPkU8xiRQt3X4etg8tIpFJLucfBegYzabUlxym5VXX9
	 apuCDgZUJMECLAzcCKp01RSdtfSSBZHJLEbwgH15zl+l8pGzzS+2oeOIB+0vbTwW51A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204623;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MthzqvtkXetI+N7nP0vkl00pvKXnxIc0KKTtSHEGYK0=;
	b=apatrBvR26qJqk/IORPhyX7O20wul78GGejkScrtqJKjrSvW5xe7YoOOi8WbJ/0WJBvx
	 h/k17rEqQO3nr4sLr29Xx8EOeTLZShYvROJfw2Ov03GKQ0wNPMQsVwIxKrf8Un6lWr2Ja
	 d6Jnc0tQfBVrU2aejo7hN4YmZMbqroU0gQs7PR3/vtPX01NviIGbas0f8X6cifhkqi9MQ
	 bx6/Cy3qYbG9i5AdC0AdNbIDC53ZjahOX8yGWzHUdleqrETz8RCeMMcirYY5zNikacspW
	 GdH9Hshs1ZIjvbnUWwRGR4IoeOOnSye9+anIJ6QFcRVp+lkgPT+P5E4cUcDjrFfJjEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xj266ZfJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DvirZqh4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B606606A6FA
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 19:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B606606A6FA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xj266ZfJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DvirZqh4
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKI1c5P1507154
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 19:56:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MthzqvtkXetI+N7nP0vkl00pvKXnxIc0KKTtSHEGYK0=; b=Xj266ZfJLd40v70+
	eq0zNjJ28gCcJlYHXdGJYR1AYcqnIbx0euoFjL72ScHTfoRVGhxuBRoWeyTpKviJ
	0Ro4QsdnAUg42XCH7/HDlWoPfDtvIiZduCia862IV12EOJjSPx5PokQJ90mCi2Oo
	UGD73abKRP9IxbjAZfx8ItTgXBa6XmT72b7eoSXeNwvgCdoeYUIh78Q1ED5uP+e6
	ih132fa/HxljD1WTMz9YJD4Lg0gtQgoNgA/y7ZynS5+ZlhqXs0znv/A9JjdXVtse
	4INF5YAtjJAo/zdV4pIEp9IPJK6zXLlXOO8EqjRiW2/tD+4C6T7jzJGZkdqjuvZ9
	o8XhuQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2u4frftx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 19:56:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-949b0d3232fso199810785a.1
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795204611; x=1795809411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MthzqvtkXetI+N7nP0vkl00pvKXnxIc0KKTtSHEGYK0=;
        b=DvirZqh4XxewWpgght6VLlQJ9L390SZCtw7vZBQiq+44TmBmw3VNbkeVk49Mpd6GyD
         RWuZ9cOWO2BJObZQsLf1iUH7bAtn+lSKDad44ru6jJd3rWPncGg6J3xVrkEzseAeseYT
         /W1bIKxCn+U2yNvtjqyJNMia24nAYbqFYbWgEodIX3mdU++YrP9xXNPijp8Lfbegygp4
         QZHQKi4Cfa8u0dY+ME7aCwEdEPPfg6//74sPXK4yM7imwZHKeJn1HjCrBGvZG3WbrJ8Q
         Sc0iVNIvj/Oq23/RZ9MvnEC7PrUkoewvcodZ3MIDpKrSk8yiDcyH6680Q6OOyJsxJWOy
         2dVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204611; x=1795809411;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MthzqvtkXetI+N7nP0vkl00pvKXnxIc0KKTtSHEGYK0=;
        b=YVmJ/7Ykm0VPgWCex2FGx/BIAuKcbzbQZhkD0jJUuq6gw+tr8Gfs6XH3DP1iEuna5S
         KvgonzQUqrvTWjXlpWDj7EwOilp396y9fU5ohUb5DNfG5o6y99O0Vo1j+Dmyuqjpr35d
         Qo01JclSFIjh6UWZD+1b3Ek8wkA6keUJ0fTAGmDIWlVXwMz+7Ca7AedtQe63Bt4gbVSH
         vkp6q1yXzjSdj8l+YYfLbOI0wdyZBTKBo4LJi+putMqKjPO5jRatCTT+hCZd/kCy7p9M
         8BdCPzKSpgrXRm0H4MjqGdc8Q9o83BP00qEzY0k2wnIY6hMhtXnvou/v0PEMfRW7P49D
         cp+g==
X-Forwarded-Encrypted: i=1; AL+hErEvN2u1F1GP1qHbTGfdSwRUAM8VmyIe96hbNj41DOSOh8sGvPeMyPSLqRcJlP1Pl+2Yu/8ep+WWJY9HMA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/SaDiY/rI4OvvWUHZY3cn6LbH9OvxBcFRoUhMn/RbkeySsVRm/
	iXegJSztYrkTcWorVEEkr87SUQiFQos7vYv3z5oOid5a8+V5d7ONMTZDFIseqKUCu4jP1En+GXZ
	C108huNyT2X6VOL9uj/tivWwy5h8TialAE/CuvxuF5AwuDXMkr0vu9J+sInxjUSSQ0A==
X-Gm-Gg: AYBFou3gy4PGC1JdxIxWHUcaMRQIETXZYf0TfJzR2C4Lln1jK70AOi6ObM4+FY6Vmnz
	DPNua9Cbo857aJHJWVyQ2quYT3A18YxAm4oWLanu8FUct8ogE0hRFQj4BCuDQvMP9+9vo8IQFiX
	78y8GeNMpZJx9Bon7lGtFnmsV7frRh69c27adHS11PNz1WsDGDdBLjDArZKjkbgQzN3DQfcMhGu
	fKzty7d9EzOqIL3dEWtSxsF2h64dje8VYkazXbJ8RqqCq7EMXbHQ4J64yy8ILtxYxwdgm08bkWK
	peeGnGXylo5i47DVGjpsrK+bSTaiKFWcrqQgMVHqy8SJdLjVJVd54xgb9AHC8y9bM+/ZBOj8zMD
	DIS7xB4OyQEQzjthx0lkE6Zdb6HoMHWpSBAzp5l9HLNKfLUXncCmYR2Wh5g4CWsyJbRE2U1lwcG
	yuO5J8I3+khUU8
X-Received: by 2002:a05:620a:489a:b0:93f:309a:ba5 with SMTP id af79cd13be357-949bab3085dmr756600585a.47.1795204610614;
        Fri, 20 Nov 2026 11:56:50 -0800 (PST)
X-Received: by 2002:a05:620a:489a:b0:93f:309a:ba5 with SMTP id af79cd13be357-949bab3085dmr756597585a.47.1795204610127;
        Fri, 20 Nov 2026 11:56:50 -0800 (PST)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm6891792f8f.20.2026.11.20.11.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:56:49 -0800 (PST)
Message-ID: <313d44f4-d4fb-4239-8bd0-66547bd5b270@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 21:56:47 +0200
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
Subject: Re: [PATCH 2/2] media: qcom: camss: Map each CSID to the VFE it feeds
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jesse Casco <jesse.casco@gmail.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Allan Siriani <allan@fatecpompeia.edu.br>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <cover.1795196107.git.jesse.casco@gmail.com>
 <9e5bee0dbc1c116672ba0020013ef0a346385c29.1795196107.git.jesse.casco@gmail.com>
 <CAFEp6-3cQXygekbk0wG8AcxqkW8NgbqHq80SjvPF5XnWhXMRyw@mail.gmail.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <CAFEp6-3cQXygekbk0wG8AcxqkW8NgbqHq80SjvPF5XnWhXMRyw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VJBIDNPX c=1 sm=1 tr=0 ts=6b00a603 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=fNfHNqqOajbSGWci9-sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Ihfphefpi9N32rxDK94KXIInl7LJeJHK
X-Proofpoint-ORIG-GUID: Ihfphefpi9N32rxDK94KXIInl7LJeJHK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3OSBTYWx0ZWRfX5/LXrRtOOkI2
 zTpIIzBcvF2Fm1wPGqqwQIoFrSSJ1sCMNRIYJjCJAwcpsn/s6TtqIWz7Ws8cc0z97zrG+Bpxe7M
 4sOP4sn989rdbV6QHdOx4SajAREuSH8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3OSBTYWx0ZWRfX6OaTNzHOpHic
 f+ER4h4IlI/Hta1zIxvDTEQsVo1H4F2wIsrxdMivA/SUQoVCpvdPI+Rq+cl/z0T32gvWSEAn4XZ
 zWBXNMi11/Sb+9HZfl5Ag3RaWCqb6dmOiycG2pQfaMXxL7LAru0kExEUkIBQjNMIgtJsjds3d8E
 jABf3M2J1ZjLab7lNZZeX/wj3BZFljM1Ks0tT/7i6s2h4OVYMUMcR7AP6mJ+ApeaPgcEPKemoTo
 jYIXkXcXRkfUAZrhZhSdS1tlbmWMA2tV4zdDr7I7NPphRyj41T9NMM7bk0KGtTAryqQd2PWuoW8
 y9jYK8qmco3vKlF0HHDqpezMLPAcvYZD+tIK7lDeKGA9BtIbSPfsqHOo9t3MtkxquACnOrvHbCS
 rlWxFtLirVrytmgx90376p2H04vwFYG+gLhVg+X+cbm2UUdur3Ort0l3285MOVLo9SG6kIUrX0+
 xRk+5JgGr5pz8C9NyBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200079

Hi Loic,

On 11/20/2026 9:39 PM, Loic Poulain wrote:
> Hi Jesse,
> 
> On Fri, Nov 20, 2026 at 6:40 PM Jesse Casco <jesse.casco@gmail.com> wrote:
>>
>> CAMSS assumes that CSID n feeds VFE n: csid_set_power() powers the VFE
>> with the CSID's index through parent_dev_ops, camss_buf_done() is passed
>> a CSID index and completes the buffer on the VFE of that index, and
>> camss_reg_update() is passed a VFE index and updates the CSID of that
>> index.
>>
>> That holds as long as a SoC has the same number of full CSIDs and full
>> VFEs, with the lite blocks after them. X1E80100 has three full CSIDs but
>> only two full VFEs:
>>
>>   CSID:  0, 1, 2, LITE0 (3), LITE1 (4)
>>   VFE:   0, 1, LITE0 (2), LITE1 (3)
>>
>> so CSID2 powers VFE_LITE0, CSID_LITE0 powers VFE_LITE1, and CSID_LITE1
>> fails to stream with "Failed to power up pipeline: -22" because there is
>> no VFE 4.
>>
>> Look the VFE up instead: a full CSID feeds the full VFE with the same
>> index, and the n-th lite CSID feeds the n-th lite VFE. CSID2 has no VFE.
>> This gives the same mapping as before on every other SoC.
> 
> Can you also check there is no possible link in the media graph
> between LITE and FULL CSID/VFE blocks,

For the current state of the driver maybe make sense because "v4l2_pipeline_pm_get"
is called in prepare_streaming in camss_video, with previous state of the driver
this call was done on video_open. 
I think that from sub-device api point of view it is not correct s_power to fail if link is 
not enabled, but if there is consensus for that logic i think i am also ok...

~Gjorgji

> 
>>
>> Fixes: 1830cf0f56c3 ("media: qcom: camss: Add x1e80100 specific support")
>> Signed-off-by: Jesse Casco <jesse.casco@gmail.com>
>> ---
>>  drivers/media/platform/qcom/camss/camss.c | 46 ++++++++++++++++++++---
>>  1 file changed, 41 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index 7d9622097..8020b675c 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -4629,11 +4629,39 @@ static int camss_read_version(struct camss *camss)
>>         return 0;
>>  }
>>
>> +/*
>> + * Return the index of the VFE fed by CSID @csid_id, or -EINVAL if it feeds
>> + * none. A full CSID feeds the full VFE with the same index and the n-th lite
>> + * CSID feeds the n-th lite VFE. The two only differ when a SoC has more full
>> + * CSIDs than full VFEs, as X1E80100 does (three full CSIDs, two full VFEs).
>> + */
>> +static int camss_csid_to_vfe(struct camss *camss, int csid_id)
>> +{
>> +       const struct camss_resources *res = camss->res;
>> +       int i, n = 0;
>> +
>> +       if (!res->csid_res[csid_id].csid.is_lite) {
>> +               if (csid_id < res->vfe_num && !res->vfe_res[csid_id].vfe.is_lite)
>> +                       return csid_id;
>> +               return -EINVAL;
>> +       }
>> +
>> +       for (i = 0; i < csid_id; i++)
>> +               n += res->csid_res[i].csid.is_lite;
>> +
>> +       for (i = 0; i < res->vfe_num; i++)
>> +               if (res->vfe_res[i].vfe.is_lite && n-- == 0)
>> +                       return i;
>> +
>> +       return -EINVAL;
>> +}
>> +
>>  static int vfe_parent_dev_ops_get(struct camss *camss, int id)
>>  {
>>         int ret = -EINVAL;
>>
>> -       if (id < camss->res->vfe_num) {
>> +       id = camss_csid_to_vfe(camss, id);
>> +       if (id >= 0 && id < camss->res->vfe_num) {
>>                 struct vfe_device *vfe = &camss->vfe[id];
>>
>>                 ret = vfe_get(vfe);
>> @@ -4644,7 +4672,8 @@ static int vfe_parent_dev_ops_get(struct camss *camss, int id)
>>
>>  static int vfe_parent_dev_ops_put(struct camss *camss, int id)
>>  {
>> -       if (id < camss->res->vfe_num) {
>> +       id = camss_csid_to_vfe(camss, id);
>> +       if (id >= 0 && id < camss->res->vfe_num) {
>>                 struct vfe_device *vfe = &camss->vfe[id];
>>
>>                 vfe_put(vfe);
>> @@ -5043,11 +5072,16 @@ static int camss_link_entities(struct camss *camss)
>>  void camss_reg_update(struct camss *camss, int hw_id, int port_id, bool is_clear)
>>  {
>>         struct csid_device *csid;
>> +       int i;
>>
>> -       if (hw_id < camss->res->csid_num) {
>> -               csid = &camss->csid[hw_id];
>> +       /* hw_id is a VFE index; update the CSID that feeds that VFE */
>> +       for (i = 0; i < camss->res->csid_num; i++) {
>> +               if (camss_csid_to_vfe(camss, i) != hw_id)
>> +                       continue;
>>
>> +               csid = &camss->csid[i];
>>                 csid->res->hw_ops->reg_update(csid, port_id, is_clear);
>> +               return;
>>         }
>>  }
>>
>> @@ -5055,7 +5089,9 @@ void camss_buf_done(struct camss *camss, int hw_id, int port_id)
>>  {
>>         struct vfe_device *vfe;
>>
>> -       if (hw_id < camss->res->vfe_num) {
>> +       /* hw_id is a CSID index; complete the buffer on the VFE it feeds */
>> +       hw_id = camss_csid_to_vfe(camss, hw_id);
>> +       if (hw_id >= 0 && hw_id < camss->res->vfe_num) {
>>                 vfe = &camss->vfe[hw_id];
>>
>>                 vfe->res->hw_ops->vfe_buf_done(vfe, port_id);
>> --
>> 2.56.1
>>
> 

