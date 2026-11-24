Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795490090;
	b=3gaBMfGqZ+xL2Po0AsCHTwXXkdnyo9OAGfOW4J6WuaOoT5tiKWIwbwRMr5uAzG8La0V5
	 I/g5Eh+uEMUfUrX/iT2iSvigfQkAiYJ7Rc7kMxVr+OdVpmwJ9EJT9mMO0aN+2hAJt7MQ2
	 wA2HOG/00eL7rIlopd532EW/arebR0YZa3fe1zTgR9txP+vXXRfyuWtcvFqugAjB2QSZy
	 0WQrNwFFrUAsVwY/rTYg90gzRoG/hrjIm+liu0JAdcLiCJD5uWymdy+uPmqOv5YkykEfP
	 JEx3d4KHjKFcAIfJx8wQTEcF4deMLxD8wG4/yDxn1X1pbmeRup8C3DgGhjcYUvsgSlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795490090;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kNUsFTA/+rFt0nSFuj90/JPHp5b0lPSf8zxAPCksYKo=;
	b=Z9sQxQkLoaF507iAEh2jPZSCTx/Fkw9VGwZhDq1VywBASxaZ6KB4IAx+1BMkWHjqpDcU
	 kkcx5aB7kb/ZMClKkgk/jdGRynHhgCMLA1LWS/SGgtKBdZdnTPnflx/qnP5sHHbnBguYr
	 1hU9hQ48seIEr7YfgsQ+tubbTW27NB80v5Cu7F9jEuGOSViejp6ySMWHM02hL5DB0D7Qr
	 2qTDk5vQI7n3EQgHLXEBSEgjEuYf3DPrpvGPREY2zaSDp/uMjkXt7iuY6gyHbRK0UNTap
	 wZi08slVwJ7KlFC0mg81t7TU3tr6IDH7zJzaXBzyPdcHENIuC8zdNIXg5qx95XEIM0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nrsbhk3K;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kvgtSbRU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FE6606A31E
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 03:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73FE6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nrsbhk3K;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kvgtSbRU
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2k6Pp3225398
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 03:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kNUsFTA/+rFt0nSFuj90/JPHp5b0lPSf8zxAPCksYKo=; b=nrsbhk3K+FF5KSBX
	GIcsHunAGylqzXpdILRnF7MlHSHapypkIbvKfRqXolyM0J/E6UF4xCQKJ2IyWQei
	GYwXM8zVRiBwDhNMox0rd/fbbuMzXtex9Oqmke3Z1bvSn5Iv3cD59Cdm08DKnK+H
	ZPRQcviJ1wBeMmcuEi9Iq6c+FnhoBz5DxtdEqn5syEvBiyENpC1TbK6Ddjrsf/p7
	XLNJzRzwjopiqLqnXCJHPA+biVEAM0yDBzPowlCWmh7JcGEn0aBFmRJLICA8wz/Z
	yi9oECBmC5uhvdL0aa0KlOWZmMZ5WWP6jfAiP/3pxuwJzp3akCX6E0+63nq/Vu9z
	Zx2S8w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4x8f0u50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 03:14:48 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3869865a304so2702572eec.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 19:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795490088; x=1796094888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kNUsFTA/+rFt0nSFuj90/JPHp5b0lPSf8zxAPCksYKo=;
        b=kvgtSbRUJAXoyapQdFzjcBbbdN/99okoagPrwU+yE4fQz1LqNsSXxXqOAm6NwXotUi
         U/0WR1nb64BwjrNLzy8p4WGoiPWgkceF41pvAMnyX/Qxm0gLyjSZlvYCXorhy3hAbWxf
         a6PpGEzz2otkxfkxxW+cMdSZAwWEHWZyWCmmb5u0wzsNuM1EGmpANpxR4sbnoGvmFP/7
         bIbToDmGrhzsNoy2fvppoUOpbLNLIsRolGnDucXjXc68/W1cyRhmpwNy/SSJ1QdTT78f
         LkLhVChuYHlO02SxLj17bul93VWqya5U9GoK3CxLDMWx9h0iJwoqFgq97Ht+i9MftCMj
         7rzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795490088; x=1796094888;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kNUsFTA/+rFt0nSFuj90/JPHp5b0lPSf8zxAPCksYKo=;
        b=Qc3NOyJjnrB666Yp9pAhIHqlau4qKEb8c+Q8oA6koSpj4fq4T+q0JVPtMEkmXTFHqa
         R3hFRRW5oLidFrm7fFgcste9e77O/D8QdMchHNR/OKu4Wzhc+zZI4808siLyvX/3mvyz
         Xb3R2sE25MyF63zRmecIsPuBUjnzZpJWrZ52cTsT21kgBIqeLa/JG62cmgO51iNZeFmJ
         Mgf308lgxEDGwYvBTu9VcbH0xfI1pvMdJ/KbS28h9INeUgFqa0VqdUfHQzO7jiZ94TYX
         a15ApXlE6a7PIsWk/ILshPxRXRSu/TEiIit0DwBxlJHkUx207DwjoMn65FytLFD/ceCd
         DyHA==
X-Forwarded-Encrypted: i=1; AL+hErFRlmYPllDqjGwUZwYoh0xD+h2mV7TNI9MdS4eaiR0uH0ZxkB1MXJXRlA8xa2nrioFyfVaDS9rleob/ng==@vger.kernel.org
X-Gm-Message-State: APuU4Z8xH8dhp12+iYgAF0ChaE6QRzqClgZPbnkSxEZASJO20P9Y0YDL
	KjaLP4ldaynaavseMf2O+PR1E8vSS4cGoEWysufUKXvf1NziZFhOoCWA7680vtairwDqlyOvErF
	2QrZZ/eaAOAGSa8hasJESFJST58ihbwAzNahGkB0ZOPg11nk/+pOpz/3MbdQCFY2RQg==
X-Gm-Gg: AZFdTZddp4f81H7iD01nJ0qnDjCkCxkpaU3cq2NtNkSOGLSq3zm8SlsdY8hNN5tyeCC
	mPkEWNPu2y70VUXPmO1ckGnnpzZBxUzxjgyjcxQkKLCf0OUoFyC2c8XNvL/onaTjJmjLWDhUyex
	mri/eAw3lwN5WA62IijAIO+twbW9iyFL9YKCN2X5bPNELCnd3Fe6nTSHSg/F/VzEbXHCZkUkKI9
	O61ooHsJsJ2ss1eNKlEiGSxPpL3Ajb1wjkAtzDDHjHIUx4+NCyPdxQjZWcpKBIWTR007aZPSlEK
	nNqXdP5wxpAXlIqYJKso9Mu+N9BEfauS5hdpK71J75tBKYjdqhd9UcSYSTr9ZZB5a7VWaXFhRc1
	UzOtabitZPN3eEcLVUEcAt30CiShNtcaXlYl3QODfBEqdmHzs3Uc0Xy+3M4iSSmU8xKZvSFZ5UV
	9phll4lQ==
X-Received: by 2002:a05:7301:e0cd:b0:375:dbeb:b363 with SMTP id 5a478bee46e88-38570f221dcmr14525349eec.28.1795490087846;
        Mon, 23 Nov 2026 19:14:47 -0800 (PST)
X-Received: by 2002:a05:7301:e0cd:b0:375:dbeb:b363 with SMTP id 5a478bee46e88-38570f221dcmr14525321eec.28.1795490087361;
        Mon, 23 Nov 2026 19:14:47 -0800 (PST)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm28956772eec.1.2026.11.23.19.14.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 19:14:46 -0800 (PST)
Message-ID: <18b59d4f-8f99-3ef6-9e89-73816d9b3bb7@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 08:44:39 +0530
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
Subject: Re: [PATCH 3/3] media: iris: Use firmware reported count for output
 buffers
Content-Language: en-US
To: bod@kernel.org
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
References: <20261031-fix_dec_seek-v1-0-cfedf0c267ee@oss.qualcomm.com>
 <20261031-fix_dec_seek-v1-3-cfedf0c267ee@oss.qualcomm.com>
 <179501763210.2846709.2834027862962422789.b4-reply@b4>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <179501763210.2846709.2834027862962422789.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAxMSBTYWx0ZWRfX6S2+MVtOSPdv
 tmiV6Jl/qbqxgFFHCHop17nYJcLFgKAtC6gmLN/06esKX2s1QvP/qxrjFRYf9PMTGVAe9+qhJOl
 pmjC2I7eXfBg7pspmwTfOVSpVTA7h3o=
X-Authority-Analysis: v=2.4 cv=JbgpPkKV c=1 sm=1 tr=0 ts=6b050128 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TiF8m7coz-ZBskysaL4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: IbOgBcjZgmZIIQ_eUkdyqSbA-lYK5S-A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAxMSBTYWx0ZWRfX1EFeMx8IkJEp
 9Mc2LICBGXGEqmlDLvI3X8dsQkzS9riPJMzYOuu3qfvH95+583U2jn2DdMb+q5a67Vt19N2U+QG
 g3ZaT671yJ+NIqKIe1+wwZPeu7YBo0aD6UdryP83VDX2U0COWQ9KILc/6MDU6QTVyfpaW6ZBWqV
 ifwTtwjAss+bEuUrwZOzNiRcoZ8ql+4/Z1k5zK1M563xmftaB9y80Fkn9OVu8ayJdPxEfhgUX9d
 24+MQP5Q3QTiyVvTtI7O/Bao96DpgVpxbUDZ608AL1tChDzB6A/CscLmz+zySZsvxxrgPvBdH8j
 eYaUWgcQ7himFIvGm/Hui0gnGslJAFaI1r0kg9yPkCmYEGHmvvxE64/KKJlU6cwhrI/s23XwGn4
 OoWqe0pAfhoFUBpb3wjqbIp6/O9I2epPZBYnJjChycYI4nQNQWilOE61O5oknJP210ULuK/QXXL
 RXTbFpIf1nVxrLsB0Gg==
X-Proofpoint-ORIG-GUID: IbOgBcjZgmZIIQ_eUkdyqSbA-lYK5S-A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240011


On 11/18/2026 9:30 PM, bod@kernel.org wrote:
> On 2026-10-31 01:49 +0530, Vishnu Reddy wrote:
>> Once the firmware reports its minimum output buffer count, the driver
>> still caps it to 4 for VP9 and AV1 when split mode is enabled. After a
>> seek, the output buffer count can be lower than the minimum required by
>> the firmware for VP9 streams. This causes the firmware to report
>> insufficient output buffers and the seek operation can fail.
>>
>> Use the firmware reported minimum count as is. The driver calculated
>> count is only used until the firmware reports its own requirement.
>>
>> Fixes: e1f5d32608ec ("media: iris: Add internal buffer calculation for HEVC and VP9 decoders")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 10 ++--------
>>  1 file changed, 2 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> index a8170e5fa9e6..57467c952f42 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> @@ -2375,14 +2375,8 @@ static int output_min_count(struct iris_inst *inst)
>>  	int output_min_count = 4;
>>  
>>  	/* fw_min_count > 0 indicates reconfig event has already arrived */
>> -	if (inst->fw_min_count) {
>> -		if (iris_split_mode_enabled(inst) &&
>> -		    (inst->codec == V4L2_PIX_FMT_VP9 ||
>> -		     inst->codec == V4L2_PIX_FMT_AV1))
>> -			return min_t(u32, 4, inst->fw_min_count);
>> -		else
>> -			return inst->fw_min_count;
>> -	}
> Quite a few questions here. Why is the minimum count currently set to four
> ? Why do we use a hard-coded value of four more than once, why not define a
> different minimum count ?

These are the minimum output buffers the firmware expects at the start
of a session, before it reports its own requirement. Once the firmware
reports its count, the driver must use that value from then on, which
is what this patch does. The hard-coded 4 in the min_t() cap is removed
by this patch.

> ---
> bod
>
>
