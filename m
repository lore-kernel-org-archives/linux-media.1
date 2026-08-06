Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB02F43B481
	for <linux-media@vger.kernel.org>; Thu,  6 Aug 2026 10:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786010918; cv=none; b=kzwiqgYR5rm82HQcc36GZkP446pptbHIMWrz8+LglhNJjnG1JoOlSGcmLdOHY49KGYtN1CEGmzgCcqcSClbdpyjk999xNTkf70+EXDDRaze/5EJhtQC7i1gkJEDXI0i6PMjnw+k6wpe34+ZnIhHp0GvoGYCJHxqlbGhEPXPJbJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786010918; c=relaxed/simple;
	bh=xCxUMghW2Xyi8faCH5QpwDEU1W4G+MMm2rfwWySl39Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L1HOzzTBnPQQDahBNqaqCzBVUdVrp1vOEFF6zafuKZamQj9f2u/FAAF4Oa9l4duiTKwaLpjah8qwo3MvRoFyskN1ZvymL6O7lYgk5uS/LseGhw45YPeilDzryv1g25s6QVf9zP7jASIyTr+VDXn2d0t+Lw+a7LoBObOMS0DHoL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uw0BfDb3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HgNbhRBy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uw0BfDb3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HgNbhRBy"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nv9d2725115
	for <linux-media@vger.kernel.org>; Thu, 6 Aug 2026 10:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iyOUQx3uVZC2rm7J8gJxSev+lJA8+WSrUOAuZsrWWxg=; b=Uw0BfDb3WPVliKgP
	JCWmPWixkfJdB0Ste3TtPH0VXlkVC41xuBL49//2EweTIOuqqEahmsE0FH+XIzjm
	+LTB7/wQxHv286yx/L6TwXq1Xg7PP7xqlMPt4kKSCHDdLmqhjgeKqElzLogUiTdG
	lztSsFVqQBSMQ5bng9x54SgDeg44CIcPPF7sgBnmBdiWg0dbhh7ZLXJakC7JJyUb
	FYPJ6C2EmyJ5dGPc7Z1x4xi6hT+k0JwVK6KbmXPNgHHy+38Z/njaot4+kLm30IF0
	Ru4HK4kBhpAeKQmc7ZbzvLMh7b5JfSjDyzK+gBOLDJ/q67WkG/sNK3rIeHAH75nM
	NgnDJw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv9dmkmm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 10:08:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso2925140a91.1
        for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 03:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786010910; x=1786615710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iyOUQx3uVZC2rm7J8gJxSev+lJA8+WSrUOAuZsrWWxg=;
        b=HgNbhRBydknmn2D5rakUwb1VEuUd9TFwuMT4RncEgjukG/0nqBQ5TEpZNphli7veP9
         aLT/yE6oEGBW44Ld84u0iLytS0ILudC5AVmgAXHXJaUC1x4vKyhrjLyM+7Av++JBjw1L
         aaSq8Pj5YcxAHv4k+mTGG8u5BFAoNqqMDQa5/N68NTFlKcYR4xSLH4gDyJAxfy2WfUqc
         H8g2pv1YUrgElb4YP13Iw8hS/zNSyN+YhPBGkM2m51pCxo5gTdSeuunKewdQnPOgyQBb
         1makiimTrUwofHyoAmcSlz/sNcfU2bgTNnzuukyMXzThZtQLtK5oQVvG7RmYXJ9EtZFL
         ePxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786010910; x=1786615710;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iyOUQx3uVZC2rm7J8gJxSev+lJA8+WSrUOAuZsrWWxg=;
        b=rYvRRsYFXL4lAOCBoRBrpPA38dOlwNV8K5xzyvL5wPc5fxpLsYAFvkwiHwCeMJqh0O
         LpLLEJwGA7P3kvRBJi6oZ1EHFljoAMLky9yjK3PVeb/Ajb6S+AuLsf1gwRZcoL8RdFQW
         h53VyuQrUx0nV1U/9a5bDZAfP/rMHliOfr+WJIhmH8CDn+0WVT2dpGuAc0eqJzpId5Aa
         QHQ+nbPHLI1xfBlVxrLQou31qaFUiY0WXG7F1a4n36Rw2+Jy7cOZYFFhUWbiPzVlZc5z
         XSwIqm0z0BvAE61C0z5Z3AqcRtbohOXizAYXxQZR8lk8dHpuwh8F0uMnc1gjfvDdFEHL
         1ViA==
X-Forwarded-Encrypted: i=1; AHgh+RqT9EUIf057q9yVcTgFDDbLdYptVIRjAs1ndxycoZPfjn4X4lXqzXL4yQhHaQ27+PfEfhC1MEM3zjNyHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLzfc+FNVwiV/wREAhVTg1G4iwAOTkH6voLqdUJ+RzSy7gZ2bA
	nuXqjdF02dpstUtxhNp8UFIVAB7mo6f9SMgUBzHKVK/R0jt90AMJactxPm5BFcgDq6OXN6nbjoz
	Mu3fAuLeskzGYsrwLqaMbaRoPWa/ZAMQKGcXqq+VGTW8B/UD3D1G+Y3V5pMqDjlhqpA==
X-Gm-Gg: AR+sD10iIj+LnUin2RFS47S9WP6xZGAjUD24dsWxaP/UJeHsF2awDoMSY1B9nPJfvx1
	2vth7SnacN5T4x/MR8N1sKS4jIpyFY2lwZsjkDfPExzUjQ6l7EuQrt6Glt3XRkfSVh8zlH4sbOl
	IZhj6pOzarkUBO1BG4k78gr/8cg/INpgxC+dvcHqvpmkpyGc5QSyWqlTqBFCbnbIX/DymoMpH5H
	mT10FHYdP4mk6W0vnQoNQnSEGqcCwAyVd1lrP1M9C3R4oo0EhbkygJPixiGo2NUe8Orw+J9Xf6q
	/49q6QmspDdOQFpxXFgPtAPvWC+NtREKiLXp6CbuXdxIO6E3cpObf529R7tKv/u2mPM8XHpKT0s
	P+DcdQignjvsAXFsoJI9FAYM+K5r6XOfs8uo=
X-Received: by 2002:a17:90b:5203:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-3903c598ce5mr14953606a91.7.1786010909518;
        Thu, 06 Aug 2026 03:08:29 -0700 (PDT)
X-Received: by 2002:a17:90b:5203:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-3903c598ce5mr14953531a91.7.1786010909098;
        Thu, 06 Aug 2026 03:08:29 -0700 (PDT)
Received: from [192.168.0.173] ([183.83.142.146])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315863b761asm38533481eec.1.2026.08.06.03.08.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 03:08:28 -0700 (PDT)
Message-ID: <36b53e0d-82e2-4fbb-a2b6-3fd7b9c98663@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 15:38:20 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] media: iris: Add helper to create a context bank
 device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        stable@vger.kernel.org, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <20260731-vpu_iommu_iova_handling-v2-4-da52b5228dbd@oss.qualcomm.com>
 <o6s5kezlsbe6z53jbsezeixp2wfrmwmvwda67t6chf57jnbm3x@ta5hktzs7mdf>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <o6s5kezlsbe6z53jbsezeixp2wfrmwmvwda67t6chf57jnbm3x@ta5hktzs7mdf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TJR1jVla c=1 sm=1 tr=0 ts=6a745d1e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=eVbXwf39F0J6/s7D6zfB/A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8 a=4qxhn-3g-SBwpGBp1HsA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-GUID: X1JMQUI2r6IwM5YhHRyslb6o3xgP2A5l
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3OSBTYWx0ZWRfXzIauSKgqUuaX
 /lMqsHprhpGDx1VwplEVdJ/8MPuGF1gNXKf1+scgBPw3zSlKLUhOX1TW0CiekoLnzptvKGn3PML
 zNS563KjN8cQU2hGIaq4reLeaClEok4=
X-Proofpoint-ORIG-GUID: X1JMQUI2r6IwM5YhHRyslb6o3xgP2A5l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3OSBTYWx0ZWRfX4Vc9Tp3T/gNe
 dSyez9+jRefPC5azvHB+38+pCb2qAvpyMGV8lv2p44IZ8/Ygy+SJiiG129A2kYqkszcfBamuGha
 NMAyQvSKIaAzvIKNj0jsH9nN21MceOOKhOMVXRZ9bp5UBTuX/9JzUw3NkZqBHegCa3hrx+m4uUK
 yIdR79wAu2Zh6JVfiFcaca1ntd3nbBk4YjImp6GRP0yJP95nJDg5M7FO4gGBa3mQiqaN+HZds1N
 VjRZIvhgM9pi5AfuKnhspfJlDuJkZxk8K6Pvhi7GQ+Ze35CZH4RSLOCLoks3WEmSFUh0npgf+m4
 gwVxmXlomufIFdI7Fo8kK+rrWkKkL2/UL9X0Wppa2j6YDYmnjczM3GjrXYaFnj6m/pjOAZKc+gp
 jV8Y6JZDBgHZtOibTLTuJfgcCHRG/Ava6xxfY2FexM7IvJkvaLtkT4DjYYgioc9B8chikD6K0pu
 geZnJtVudTdS6DulnHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060079



On 8/6/2026 2:27 PM, Dmitry Baryshkov wrote:
> On Fri, Jul 31, 2026 at 11:52:19PM +0530, Vikash Garodia wrote:
>> The VPU issues DMA through several SMMU streams, and the hardware does
>> not give every stream the same addressable range. The non-pixel stream
>> is restricted to use 0-600MB of IOVA space, while the pixel stream can
>> address the full range. A stream can only be confined to its range if it
>> has an IOMMU domain of its own, and the IOMMU core attaches a domain per
>> struct device, so each stream needs its own device.
>> Add iris_create_cb_dev(), which looks up a named child of the iris node
>> and registers it as a platform device parented to the iris core. The
>> child's fwnode is handed to platform_device_register_full() so the OF
>> core applies that subnode's "iommus" property and the new device gets
>> its own IOMMU domain. The DMA mask comes from platform data, and the
>> segment size and boundary are capped at 32 bits to match the addressing
>> the VPU performs.
>> Return NULL when the named child is absent, so callers can treat a
>> device tree without context bank subnodes as a supported configuration
>> rather than an error.
>> Backports are intended since the first DTS of 8550 binding schema.
> 
> What does this mean in the commit message?
> 
>>
>> Fixes: 41661853ae8e ("arm64: dts: qcom: sm8550: add iris DT node")
> 
> How can driver fix the DT?
> 

The idea is to backport the driver fixes till the kernels when the first 
DTS landed. Ideally the fixes tags the commit which introduced the bug, 
while in this case, was thinking to keep it for DTS.

>> Cc: stable@vger.kernel.org
>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Tested-by: Daniel J Blueman <daniel@quora.org>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_resources.c | 28 +++++++++++++++++++++++
>>   drivers/media/platform/qcom/iris/iris_resources.h |  1 +
>>   2 files changed, 29 insertions(+)
>>
> 

