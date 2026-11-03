Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698953;
	b=Mlv8OrOa0b5QCDkQ1mkb4WkpHcMInOr8eZe3urSLKsAD49W/xc9UkEHJQMJfL/VlmPgm
	 tqn3nmDWMrowYCRDUK8svmOfpFg93xPfyW5/a/YfX9Zcr/ojxKCveUp0juRMy9ye6YWqY
	 vCV2BruUfpvn0Mq/u98liG4uLurpeE100/t59/TqRCliEfexKFNSo2vfC0G6r0DhTy+y6
	 4sIPFZVr6ifYmncuoy5lwlhMhD5K3zBaoq9Zcoydmdfv/047jj6ALH66o1uzE9gqBfj7h
	 acPl6dNV/gjfdivSXBufLxM9aHc34fnGmnLWtxvHcZHVczws9bMVKKtumIEQVBpsrDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698953;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dQ3IlFmsPSWggRQ/22Hknd+F71Cojm8gDMGFW3Wmerk=;
	b=N7slGwfCrezULqVifdTYlxUIJ/Ojf7jsWVM/0gz+Qvxrg545v/aqGXVkrH995tpIiXl0
	 koZg+laVVsP41O/DktlPJpOIDsdV/7bDfN4vHhgg5o3c8e17Uephkp5nCHEwIMw7y1Auz
	 Ked/vUFCbcpLvb6ex2jMHXctW7PMv6scVfgqTBDtVWP5tk5bVHbvueFO7qmytFK1A/e0L
	 Bf/96tzYcl02Y5u+1iqtvDHzdgO8f4f5e5PXaXbbGmcVZnzklyZypC1PTfbVTanqMg83Y
	 7SgV6eSHd0uXe7hq0Kjqsof66F2XzTZX2l8e5/we9Ectco1HbJdDJZmGEy27wpwdcOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a782sjAF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U8ufsOlY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4E9606A33D
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 09:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD4E9606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a782sjAF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U8ufsOlY
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A37wiYe2402921
	for <linux-media@vger.kernel.org>; Tue, 3 Nov 2026 09:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dQ3IlFmsPSWggRQ/22Hknd+F71Cojm8gDMGFW3Wmerk=; b=a782sjAFS4L1j+hu
	Z1tVUHZeSvfCskxsoiPmCFruD5xEsPWq6LKxMLkLcPk0YSUnlRwgQ2ZfxWN6P0S+
	BiHYhaT6ThKsOuDedIXFH6A9yYBKCH7mVRdaZz7ercDo3ayCyZV91j7iQNK5FVFn
	6Sz6njBwkw3ghKLIcGOKAOmXl4PGbjfRp5vTvZTlidGZ144O7F+Dm4DNW7LGwyC3
	li2AFpo6Z9IbOOi4kPW02sl6SHOLkgrbfVABAhEdeixFzFKjb0Lqnffv3f+HtHTc
	fBZa00qqp845F27Yts6nMDaVl4uvGe3SbFPs87wFZ5y16pdSaB/g7RqVhHzjKHWb
	ocVQDQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq3uy27kw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 09:42:32 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-988d5a1080eso3174446241.0
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 01:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793698951; x=1794303751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dQ3IlFmsPSWggRQ/22Hknd+F71Cojm8gDMGFW3Wmerk=;
        b=U8ufsOlYO0BQZUDrBNzSIZ2hEkTT3JvSQCGpK596x/fAij07xD9IBmJpfz3Viszxow
         WMfIsUOA9q/jlLwxT1CBDrPIi6AYcHagBPDhTDOQIzVdQ6/ZSpCONuTyu49v3RuCwfQo
         4ZmD3UmlvOPZzg7gXrVstY/o8KR+YgHPqPWMd9qswSSfCJOyjJlIUZsh4r6RHZQwRFX6
         lo9Hqod+kdefMYcm5GJLsAtzKyDJS8dSgCgxqmH49Zwsnfr80xfByevDFDSLoWuTSnXK
         /uTyMrlQpu+zcAfR5WrY4fkYWbfHxYeoQ1gfaZpYcE9ucW2pt0bnC7CeVaBR2gIiPHVw
         Lf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698951; x=1794303751;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dQ3IlFmsPSWggRQ/22Hknd+F71Cojm8gDMGFW3Wmerk=;
        b=rmzIWnAGiwHVeGOea8MnZxlveUUwAB21foSf0+d8A6yQJ/5vg+dSHdUSZGxzg7MN7+
         fBLFsEWFSvAMpbUNF3zDz/MO80Ulp5J8uB4RI43xjNl6edy8SUs0M6EVTNHJuDEAh4Qn
         k6UQul7B3ktGChgqwxaa9lUZI0z1lOS7Bp5uusp1nEAiNyswenKsK/0a4+F8WAffS+Br
         B81dY+PXMFA1pyflldXT6bqgmOypI4pIGKYRuOp9mbp0WQfJWhrv2Swmbj27+PIAo8Db
         GChQvDkLaHqH+SPuW+W8U/ERQmpq+8l0X4RP9wuUy4SdJXKGpyh2ylqpXrBhXHy5FBT2
         82Dg==
X-Forwarded-Encrypted: i=1; AKwUvBzQ0veKo9MxamGR+gs2wQqqknhafQauYlIQQJT99JtzkCqCoZonux5ka9Z0NK3PW8qG1e8JrgyaaIQQDg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+FpQZXdxCaK3gCrd9zNWh6QHHg/xkCdPc1WeWDjgFADITXOqdE
	majro5CetAttUiUOYsHrJuon6p96APqF/iQQCBVKD7vknCEa68qkP0LgCN0zffYoSiYhZjFh2Z8
	vhtdD7FiM8WIgh98MfF1Grkad0tGhGq3G8U6jyuBSTRGic9obeW624LxnE/zo9mosdw==
X-Gm-Gg: AYBFou0m79chvCnEY0tajBUcJhSTy8xGG8lnpkcQrNqJ4KgxKIWcBBfBz9TDAKGnj86
	8LmjhE4mT1qLvbeKKZTW91PTc/7+8BuFDK6s6ZGPg9qZen9xPZwfaNfo2S3sdovbHMK9gR7f64r
	29cSxAKzf/t/nNXYyoO52qD1ODe/PpwzaMRq1A4bOUyPZl8Fhi68JR2iFME0pGa7THZBe3r9CxF
	sdRg2VdIgNeQeTNUePbK2h1zHZoOCliB8+T0TqDGUyfTLmAx308fNUfJGLlKC2pKkFBkhTm4zvk
	z06oxphED20r7JXN5ruzQnIzFM+IV0Hv753Q2/8sqF0eVpw1B+CHbZnXcDbq5Lf/Ndr4w7cf67o
	fmUngf8/DKWvZb3Z6BnTgEoHUkKG/gmn+6siRE9UdVrKr5nhAK5UP+WCrKFDGdc6k2ku+zn0DZV
	cW0zc9wk6c2/RX
X-Received: by 2002:a05:6102:578e:b0:7cc:2fd1:7122 with SMTP id ada2fe7eead31-7d072c3295cmr5232514137.18.1793698950986;
        Tue, 03 Nov 2026 01:42:30 -0800 (PST)
X-Received: by 2002:a05:6102:578e:b0:7cc:2fd1:7122 with SMTP id ada2fe7eead31-7d072c3295cmr5232505137.18.1793698950432;
        Tue, 03 Nov 2026 01:42:30 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b725b8sm24165306f8f.20.2026.11.03.01.42.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 01:42:29 -0800 (PST)
Message-ID: <95d29a93-fcd1-4aad-a6a9-711c8adf3854@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 11:42:27 +0200
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
Subject: Re: [PATCH v2 2/9] media: qcom: camss: Introduce SOF sequence
 tracking
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
 <20261102-v4l2-frame-sync-v2-2-25cbed7a772f@kernel.org>
 <8196a664-f73b-4da1-aea0-0ea49676a4eb@oss.qualcomm.com>
 <CAFEp6-25K=DURpYM96o8vMO8pkVr8uf=r2RAP-kcM=Rme=8JgQ@mail.gmail.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <CAFEp6-25K=DURpYM96o8vMO8pkVr8uf=r2RAP-kcM=Rme=8JgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: c6VQuVFaKC7uEVGxsW9HvrbrhzedOH9P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOCBTYWx0ZWRfXxNpXZ93vJ/pk
 U1oUFS19cnI2OWIPggTeUJUJhw7bTCfHnIxt4p+518AO+8zG/ErB2Mh7/YN9vuBzJ3wSJj3ZN7k
 6S9VAe3C/kh3OGk4aT0Xw0JJR5/wJpDF9Upc98H1CSfYNdNRTkrcRh6IwvikHfsvNSfUH5zCQIj
 p3OdJnVeG2f6XXs9lPgDWuv7AAAHF4gMHUVGkckQRgCsn8bTIToTF9MKFp1Ryn4jQ8e48ZLXkCq
 glm0YAG4SP1DsZcc2v7C+A2FB5J6n0550zf1R361ijDnbjhD3nkuBxA0c961pN6DlxsmGFGQ2O0
 8SoEYpr/ncuUPJ0HJdKaxCqb0t3ONrSyx0PDir7WJHz/oVn9s+zOw63h8FeIjgl0ew2XjPVfidr
 fByljmm4ArST7yKGDN/w8PYQoem+ddt/ZRtSTDk4K6X4E31Ms0ALgjIro+8TQoUrAfnKOHweeDE
 FUBJ3k6O2/nvnCwmTHQ==
X-Authority-Analysis: v=2.4 cv=VoG2kO2n c=1 sm=1 tr=0 ts=6ae9ac88 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=NJZkfsSwHKMJFq9xQC0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: c6VQuVFaKC7uEVGxsW9HvrbrhzedOH9P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOCBTYWx0ZWRfX67uQ5fx/g4Vc
 w1CLMXLGt0bYjR10HVxCq8/wILur1ni2de169Wwj1LE6LrNTc0dvN6p3gByvKipZ3qcV0g8eNNg
 eyPsdsfNej81imnmBZSNNS8LoNUL13A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030038

Hi Loic,

On 11/3/2026 11:33 AM, Loic Poulain wrote:
> On Tue, Nov 3, 2026 at 8:11 AM Gjorgji Rosikopulos (Consultant)
> <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>>
>> Hi Bryan,
>>
>> On 11/2/2026 3:56 PM, bryan.odonoghue@linaro.org wrote:
>>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>
>>> In order to communicate to user-space CSI2 SOF events we will need to hook
>>> into and control v4l2_ctrl_subdev_subscribe_event. In-line with other
>>> implementations of FRAME_SYNC have CSI decoders which support the event
>>> always generate it in our case if and only if an atomic user count
>>> indicates it should be so.
>>>
>>> A flag in the CSID descriptor indicates if frame_sync_en is supported so
>>> for each SoC that supports it this flag should be true. Since bool is false
>>> by default no negative enumeration of existing or in-flight CSID is
>>> required.
>>>
>>> Subsequent patches will enable on a per-CSID basis.
>>>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>>>  drivers/media/platform/qcom/camss/camss-csid.c | 54 +++++++++++++++++++++++++-
>>>  drivers/media/platform/qcom/camss/camss-csid.h | 12 ++++++
>>>  2 files changed, 65 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
>>> index a00791b00feb7..e9b399fcb9c7a 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-csid.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
>>> @@ -760,6 +760,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
>>>  static int csid_set_stream(struct v4l2_subdev *sd, int enable)
>>>  {
>>>       struct csid_device *csid = v4l2_get_subdevdata(sd);
>>> +     unsigned int i;
>>>       int ret;
>>>
>>>       if (enable) {
>>> @@ -778,6 +779,9 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
>>>       }
>>>
>>>       if (csid->phy.need_vc_update) {
>>> +             for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
>>> +                     atomic_set(&csid->sof_seq[i], -1);
>>> +
>>>               csid->res->hw_ops->configure_stream(csid, enable);
>>>               csid->phy.need_vc_update = false;
>>>       }
>>> @@ -1316,9 +1320,57 @@ static int csid_link_setup(struct media_entity *entity,
>>>       return 0;
>>>  }
>>>
>>> +static int csid_frame_sync_add(struct v4l2_subscribed_event *sev, unsigned int elems)
>>> +{
>>> +     struct csid_device *csid = v4l2_get_subdevdata(vdev_to_v4l2_subdev(sev->fh->vdev));
>>> +
>>> +     atomic_inc(&csid->frame_sync_users[sev->id]);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static void csid_frame_sync_del(struct v4l2_subscribed_event *sev)
>>> +{
>>> +     struct csid_device *csid = v4l2_get_subdevdata(vdev_to_v4l2_subdev(sev->fh->vdev));
>>> +
>>> +     atomic_dec(&csid->frame_sync_users[sev->id]);
>>> +}
>>> +
>>> +static const struct v4l2_subscribed_event_ops csid_frame_sync_ops = {
>>> +     .add = csid_frame_sync_add,
>>> +     .del = csid_frame_sync_del,
>>> +};
>>> +
>>> +static int csid_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
>>> +                             struct v4l2_event_subscription *sub)
>>> +{
>>> +     struct csid_device *csid = v4l2_get_subdevdata(sd);
>>> +
>>> +     if (sub->type != V4L2_EVENT_FRAME_SYNC)
>>> +             return v4l2_ctrl_subdev_subscribe_event(sd, fh, sub);
>>> +
>>> +     if (sub->id >= MSM_CSID_MAX_SRC_STREAMS || !csid->res->frame_sync_en)
>>> +             return -EINVAL;
>>> +
>>> +     return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops);
>>> +}
>>> +
>>> +void csid_sof_event(struct csid_device *csid, unsigned int id)
>>> +{
>>> +     struct v4l2_event event = {
>>> +             .type = V4L2_EVENT_FRAME_SYNC,
>>> +             .id = id,
>>> +             .u.frame_sync.frame_sequence =
>>> +                     atomic_inc_return(&csid->sof_seq[id]),
>>> +     };
>>
>> On first look this was looking strange because the id is used for the
>> control id events not for frame sync. But on second thought it may make
>> sense, but the question is how the userspace should interpret those ids?
>> As of today userspace does not have any info for the VC and csid internal
>> pipelines (so called lines). So with the current state of the code
>> the id is VC which makes sense becouse the SOF/EOF packets are recieved
>> based on VC. So i am thinking of two options:
>>
>> 1. Move SOF event in vfe (rdi/pix sub-devs) we have per line sub-device
>>    and will be well known to userspace for which line is reported.
>>
>> 2. Add and propose extension of videodev2 documentation that
>>    id of frame_sync event types represents SOF per virtual channel.
>>
>> Personally i votoe for (1) because it will well fit with stream-api
>> support and usespace will have clear understanding of the SOF to which
>> stream belongs.
>>
>> Given this in mind it will be good to open discussion with Laurent, Sakari
>> regarding SOF event with stream api and GMSL cameras.
> 
> I think both approaches can be applied independently, forwarding the
> event through the VFE as event proxy would likely be a straightforward
> addition.

Yes i agree as well, but the first need broader audience and agreement what
should contain this id.

> 
> Note that the id here represents the interface index. While it
> currently happens to be associated with a VC, that is not necessarily
> what we want. Ultimately, multiple interfaces can be configured for
> the same VC.

Yes and that is changed with stream api implementation, and the
following question: what should be the ID when streams with same VC
are routed in more lines (hw pipelines).
But that depends on what this id should represent.

~Gjorgji

> 
> Regards,
> Loic

