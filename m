Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769370;
	b=GVSLICmMeoVLqengjSWHYd3OQ+RN/2NwhKXV6sY1+s2xw9UB85StfY0F3P1eob++xo0c
	 LYfSOBcj7HvonfAugN4iK31nU0x54+QwshEEv9+WfllITsA9WCtPUpJkH/vx0+FZIc+jm
	 szU8lqy4VME5+SOsyMzJLLPn/xq872oSIHsykVzgye0J+AV6k/9h6lCBqxZUSU1zpzqr/
	 JS98OL6YbXa+G2okSlH7c2yrdJj9ij/tP/4OeP2Ak4E44kgeN5XkjE0U2+3+yI0Kt7swJ
	 rNz/C9TWkp1/VKIrRWgm7XIfyjPKtT0CvAORDeS7O3MSHPmNoBLLoX3s+Dja6c767HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769370;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Message-ID:Date:
	 MIME-Version:User-Agent:Reply-To:Subject:To:Cc:References:From:
	 Organization:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=Wwoqopybt2NkQoUUX4NVoj5SPusPRcp6x5MKRWSnaYo=;
	b=v9GpErl+xwES96bqTAweK2ls+mS9a3CLmcClGsTINBJLXYvB4QvLqH5KpmBEo4r1TDD/
	 9SuIYxRBEJK2DNhCNO81s5qpibhr9C2kSbwhAWsH3AS0qyPOEZP2+JcguKn3Sud+ddXSs
	 nhCbFlinN7GCWrKcdq8GTHjRMsASnB2j3YvbCBEWpYgA1vlgWBTlSYR0gNj0WlOzUn9ev
	 OF+WD5LqVsFICfoNUL3EJtDSyGIad+UDObE+TEWlNWjQ4a/P04RSvZvB4s1iECuxbtvrw
	 P2fDNrdWjrelJkJVB6zvTv5fqRuQ34Z1LyOAiEqj7oasccMV//PiLHq+GLDpfxVxdyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=radxa.com;
	spf=pass smtp.mailfrom=radxa.com;
	arc=none smtp.remote-ip=54.204.34.129
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FB8606A334;
	Fri, 27 Nov 2026 08:49:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97FB8606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1795769339t6a52fd24
X-QQ-Originating-IP: sFjkWrNCksvxt1xzmVjQ45eWjno04DA8p5gSSaqrrRc=
Received: from [127.0.0.1] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 27 Nov 2026 16:48:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2061607346592919020
EX-QQ-RecipientCnt: 17
Message-ID: <7D55C8EF5D49B457+c68b044f-b636-4a4d-8f6f-eb4a3c333e7b@radxa.com>
Date: Fri, 27 Nov 2026 16:48:56 +0800
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
Subject: Re: [PATCH 2/5] media: iris: allow larger capture buffer pools on HFI
 gen2
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
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
 <20261029-iris-va-fixes-v1-2-44a2783f782b@radxa.com>
 <456a7ad925afe7caf52d39ff300089c8ec79e4e8.camel@ndufresne.ca>
From: Xilin Wu <sophon@radxa.com>
Organization: Radxa Computer (Shenzhen) Co., Ltd
In-Reply-To: <456a7ad925afe7caf52d39ff300089c8ec79e4e8.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NWujniBqiFoNlZ+4V+Wrw+yx0aQq+LaC1FCxLB0YMWYpV3LPruOxLYII
	9ecBp7J1rAcSqPhWUJVDeorhzRHJnWAekhdulGFPVJ8TmmxAu90aXKB4sYm8jsnsY1ekYmI
	Qp91qsl2Th9TzsYcfjDGAcSnn+ZdG5slXVu42dj38ZnspIXAtNAukHvlg/R6jD/WuMvxXG4
	O0LJTVGQF1LFk7ZARhwoxtLj9dR6Q4hcdirnU5JLqvMKzN+4DT31vPQM09pVXPOVgLBumZp
	Y5KEtM/T1cvk9vVZ4hTZ1ENsayfvYIHYplwrraSsVakbqoiDaaZCns1bbw5901A2/AOJvPq
	yJhI42aeFP81slEk9L26qV2rKr/ZSECDpPVs3jW5eFhbALKOPzJRTkP+fWHzAWalH0m5rVA
	+1mMSf39sFL5pa5H5jbYhDkiO2fkwtA9QLF5mJCZAkwSSKZXHO4WdhFV9LfBXy22ehg0LnY
	HAmBnnEgguRoFN/7G1LgiojPOBbtLB4dsqZfHLC7/SmTJ4XlhwkT/FKdT5+EaHjxhSBBeKf
	7I5Z0sNr4fmZQdgVco8UEQWdau0Z2Li4xmo9BbxmMynidhejAawdOwDCQguMALiyQCV5Txn
	Xi7XOZrmpW3enx+zOO1Ab2bUGqWZMJOrzUdS2UCHLZqsRT8+eQKqpvfoXiRAOEq9pHi4NTU
	BXhQ2KOPf40WoVjwU0D/Xlvzpuam5OSWir+t2DPkgxaW0y4c+ia6caQAziWdO2FOwIsqqxd
	Ve7FVNJo3+Bwnxi/AkuGrYi9zVgllIWwyCYQh+9+hJnzdmrUcqBixj6ZmG/vzKpkrz8kDGg
	n5ozA+IJiCPAto8Vs0T7mKC6fE1QcpegxTp73Gahp0P6zRstDyKRktVgEtaVvLnpoemp19o
	EXXifwD2GZTrogKHbShWENaLT2f2nGNk/9LW44Qq0gyloAIXqWylqI+2agnIjzhlxayktPp
	baAvUxVr4DZ0OIrBvXhQG6NTHSpLDh4q2OuZB2d8IkXookNosoHjfdOvX31fWwOsxKwQCRD
	tbatTuNdf3J0cdI6X8KTyKiqmwMVjElgaIh3p6oJjg025/ED++
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

On 11/4/2026 6:20 AM, Nicolas Dufresne wrote:
> Le jeudi 29 octobre 2026 à 11:58 +0800, Xilin Wu a écrit :
>> VLC with VA-API frame threading can require more than the default vb2
>> limit of 32 CAPTURE buffers.
>>
>> Raise the HFI gen2 decoder CAPTURE queue limit to 64 buffers.
>>
>> Signed-off-by: Xilin Wu <sophon@radxa.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_vidc.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
>> index 05aab6e3005d..8c96b007b391 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
>> @@ -140,6 +140,9 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
>>   	dst_vq->drv_priv = inst;
>>   	dst_vq->buf_struct_size = sizeof(struct iris_buffer);
>>   	dst_vq->min_reqbufs_allocation = MIN_BUFFERS;
>> +	if (inst->domain == DECODER &&
>> +	    inst->core->iris_firmware_data == &iris_hfi_gen2_data)
>> +		dst_vq->max_num_buffers = DEFAULT_MAX_HOST_BUF_COUNT;
> 
> Why is this limited to decoders? Also, why not move the max into the firmware
> data, so this code path can stay idiomatic.
> 
> Nicolas
> 
The limit comes from the firmware: HFI gen2 decoders advertise 
OUTPUT_BUF_HOST_MAX_COUNT (HFI_PROP_BUFFER_HOST_MAX_COUNT = 64) on the 
CAPTURE port, while gen1 has no such property and the gen2 encoder caps 
only define it for the OUTPUT queue. In v2 I'll derive max_num_buffers 
from that capability when the platform provides it, instead of checking 
the firmware data pointer.

-- 
Best regards,
Xilin Wu <sophon@radxa.com>

