Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768968;
	b=Sa/CyfkqVoPHeRDy7YnNxfe4Klos8fQbLq74tObwEa7ZQH/mjmWy/dVNsEnLnETmJGDc
	 okypL1qS+kSMSIdauBAOx1UEjjS6ENyKjOvjWxGkO02FjvaZifXHoc1nmDIDd8oXpoM+J
	 D+6Mzq/m4TNF18DveZdpVf+jF157a54CVZDeMPX6vN3wR7P2JfQiBbRVceSP/Xb3oDj9Z
	 JxFh93H57OydpqyDX2IlZ10hDNUREMiOvALfDg8F3USDsnSiixBBEipNb483a2V0w5nnm
	 4e/kM4/V3KMWmibBpf7FcqKyrOaZLzAR0lGs3c3IXwUGwHbEGu2u0T/HsAfthBuoRCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768968;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Message-ID:Date:
	 MIME-Version:User-Agent:Reply-To:Subject:To:Cc:References:From:
	 Organization:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=4FnYJW1DPJjX4jPtSHB2i74s076SheDm+5hyf+IKxfA=;
	b=Zkor5z98DGZKcbf9HvjuRxhupoaiGjqsQff6mBHfm7iItjLJC+NB42waAFMX9pbAZI8M
	 uf1x5SiEIzwKqTF5dJHnG50H8VoecIuMPlRlM4L5gfH5TAyQiZRCGsF+dHBh2K7e28a2n
	 yRUXVHzqJuMHHscBTQo8OFE242gsFGJ351Ex+gSMlKwtj/tp+3mQszghwNaUj6qPqggNN
	 nBk+xtRTda2Os+pzCVHY4oBhYByfNWAvDAdV60e0m4hLfkMlRnTDIzcWQFq750fF5jOzS
	 MJZMi0fruCdpmRsNBZrI9ba3k9kBwWgVsf4JFIn1EkewJ50PmeZHT/vg4826KATUnLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=radxa.com;
	spf=pass smtp.mailfrom=radxa.com;
	arc=none smtp.remote-ip=54.254.200.92
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFED606A31E;
	Fri, 27 Nov 2026 08:42:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDFED606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1795768939taac8949c
X-QQ-Originating-IP: yOznF08R1rFA6Y4T4luMi+Y7RHcB0aBt05JbRxlOfqw=
Received: from [127.0.0.1] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 27 Nov 2026 16:42:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 866279736126215831
EX-QQ-RecipientCnt: 17
Message-ID: <62737947777C3158+30286ee0-92e3-4085-8f7a-f7f08778cf0c@radxa.com>
Date: Fri, 27 Nov 2026 16:42:16 +0800
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
Reply-To: sophon@radxa.com
Subject: Re: [PATCH 1/5] media: iris: support decode-order output on HFI gen2
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 dragon@radxa.com, Chris Obbard <chris.obbard@oss.qualcomm.com>,
 Deepak Sikri <sikrid@qti.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Loic Minier <loic.minier@oss.qualcomm.com>,
 Jason Pettit <jason.pettit@oss.qualcomm.com>
References: <20261029-iris-va-fixes-v1-0-44a2783f782b@radxa.com>
 <20261029-iris-va-fixes-v1-1-44a2783f782b@radxa.com>
 <2e4fcb24-aff0-e93c-d702-b01bfe7c17ca@oss.qualcomm.com>
From: Xilin Wu <sophon@radxa.com>
Organization: Radxa Computer (Shenzhen) Co., Ltd
In-Reply-To: <2e4fcb24-aff0-e93c-d702-b01bfe7c17ca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OdMVesvGDMqZn9TkyY4mhFGyLO3yiFMQEMKJFi7lVhibnk15jbPggmGO
	tWwS7kC00q4oI1K7XA6m4V+sstu8FoWTQM9uMrfteVYs5P3ETAfSgsp7F1Ml7MA88Nz8g1w
	qq0pSa6O6vjDLnXCzmiBa4YqExJW4+CtsF+g8lFcCjVnpGxOXPcPnXKeV/9z0ZbYYqXQyyu
	2OUE4ZhFc480uSVQ2fhKwxqCi4mb7H6qAIcxLnk4+nefhL4ZiA6vz/Fg1moDwjW3IuzYKJb
	oekl5uBwm96ewfN1TwPQTBMwo03Zf9V1TSigjzJrEwBQ8LYXKV3WM8POTFElMPeyIlCubHI
	mzA8H7lXEs2QfEUtXvGAsPdAukgNWrHEW+gdC8Hc8T1ChuvWhxiVC9OMK/kHewCFA2mSlh6
	bVC/WbRpr7nuLXL7F2RiM6veDdR4Jc/3h+GyWTltPFuwYYmXdpk12iVQKcqAtSsxh26sz93
	QNQ3+6zbb1fCEog+THT0e302pcW61PK9ETmKSujEUAtL+PsZc0ruYj2Tjho3q5ttn6pv1AH
	qr5XaFBu3hzVYG/w3HbUHvYkg06gXzIteCxcWqCAE+DjARUoIoXhyXjoeVeNvpsTyN4HlrF
	B3u5b4DdnUESmGBpU7xCXzuGre86i1krG1BfwrPtkntEd6y4jHVrGYO0sI2A7XQBVuWqjts
	DkAsRuAQ48OHxQCbd0IWwpyTno33ulasmjSh/tFNke6zUoGlE48gRerFIU2IMdPpwdXptM+
	Gvwh0aTiwyV6sOsKy2wes1lvGcGpFJe+KITrDVJoa1S3QQL0WCb130VmG1TW75a/kMAVQLM
	BzqxuwTe8DsolaT3FIks7hPEcHToCjVFTRRiIys1swxQgcV1zBVxTCLogAeNjQL2HuuIZ/s
	oJ8SEbB6+VMDbBzl7C3AQru5RGM/jyp/k4zg4r/SJqR/tRM7ZjFSw6Epwgdn+jsJ4HaHVvI
	xKRhIKWzPVgnwWyRoTsLxwJsUemlYAyRqgVFZN3GpnMmbwthnzWE2hVVKfbozlg+QGfR4xb
	2RisWsnIZKB/90zAE1LXPa8vZTAklSVW4zAAtvsHdY90AZ0vWbVI84vQ1PvC2+16nlNR13+
	T1PhMD9kRspSDOLwsMdGj7P4+Q4Ae0eiLA7n5niXkIvfl48aAisGJ0=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

On 11/27/2026 2:24 PM, Vishnu Reddy wrote:
> 
> On 10/29/2026 9:28 AM, Xilin Wu wrote:
>> Synchronous per-picture clients such as VA-API can stall when firmware
>> holds decoded pictures for display reordering while the client waits for
>> the current picture before submitting more input.
>>
>> Expose the decoder display-delay controls on HFI gen2, with a zero delay
>> selecting decode-order output. Keep display-order output as the default.
>>
>> Signed-off-by: Xilin Wu <sophon@radxa.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_ctrls.c        |  8 ++++++++
>>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c     | 20 ++++++++++++++++++++
>>   .../media/platform/qcom/iris/iris_hfi_gen2_command.c | 18 ++++++++++++++++++
>>   .../media/platform/qcom/iris/iris_hfi_gen2_defines.h |  1 +
>>   .../media/platform/qcom/iris/iris_platform_common.h  |  2 ++
>>   5 files changed, 49 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
>> index 4f2633bbb49f..1dbea37c93c3 100644
>> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
>> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
>> @@ -155,6 +155,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>>   		return LAYER4_BITRATE_HEVC;
>>   	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:
>>   		return LAYER5_BITRATE_HEVC;
>> +	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE:
>> +		return DISPLAY_DELAY_ENABLE;
>> +	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY:
>> +		return DISPLAY_DELAY;
>>   	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
>>   		return REQUEST_SYNC_FRAME;
>>   	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
>> @@ -306,6 +310,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>>   		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR;
>>   	case LAYER5_BITRATE_HEVC:
>>   		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
>> +	case DISPLAY_DELAY_ENABLE:
>> +		return V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE;
>> +	case DISPLAY_DELAY:
>> +		return V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY;
>>   	case REQUEST_SYNC_FRAME:
>>   		return V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME;
>>   	case SLICE_MODE:
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
>> index 79bbd06ef8d2..65af61b63a29 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
>> @@ -842,6 +842,22 @@ static const struct platform_inst_fw_cap inst_fw_cap_milos_enc[] = {
>>   };
>>   
>>   static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>> +	{
>> +		.cap_id = DISPLAY_DELAY_ENABLE,
>> +		.min = 0,
>> +		.max = 1,
>> +		.step_or_mask = 1,
>> +		.value = 0,
>> +		.hfi_id = HFI_PROP_DECODE_ORDER_OUTPUT,
>> +		.flags = CAP_FLAG_INPUT_PORT,
>> +	},
>> +	{
>> +		.cap_id = DISPLAY_DELAY,
>> +		.min = 0,
>> +		.max = 0,
>> +		.step_or_mask = 1,
>> +		.value = 0,
>> +	},
> 
> Nit: Since DISPLAY_DELAY_ENABLE and DISPLAY_DELAY were added at the end of
> enum platform_inst_fw_cap_type, it may be cleaner to place this capability
> entries at the end of this table as well for consistency. Same consistency
> comment applies to the iris_get_cap_id() and iris_get_v4l2_id() additions
> above as well.
> 

Sure, I'll move the new entries to the end of the table and of both 
switch statements in v2.

-- 
Best regards,
Xilin Wu <sophon@radxa.com>
