Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794209127;
	b=flhmDtL6soo4o/wi2RrLRVZG02PFjFavBuTiJOODNTr63OR6QVLqmSpcphqAvaWclI4K
	 aBGNrBLj2BMc9qA47n4EyniTHnKvB8FyUfcpVes2o3NfA89AI+MrS7RtcGjLdVYaZzlMM
	 xmUh0m7dnmU3ueZGFeM96K+RhjtVW7B5Z31vp5s6sgAIR5F0otG6pQ2tbbH34lLQz6uki
	 QX3+1SWrprwg5vQ9zUkmIczdWsXO3ZWsxnItAxYe53aHSuL60dO8nQgPCwHWpDl5F/846
	 zgOf1vBzduawuSjWfeZzygu1sroeVwKYrJP0IG96qEPMqyVGzqnWwaIcVb3gmS98syA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794209127;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0nDnq4cvLaTvdqNRvbn031d0/DpRXR/V3IIurH9/49U=;
	b=eOszVASxcjflI+FlDWaU1Aua18Uh6cxMRdjoWCzSKvaIBqQ9X0GlFuZF3n9PWvHvLWgs
	 iXdV0/Aem3gvdf5HyuZWIQczTOwEQbeodT8C2hts8KWRndOg/WtqdKycWjSEOPigklq+6
	 /mYrYei9Up1JN8tIf27jFkG8Ck0eAuMuYqiZBwWM1Ogf82fZhNJb4FVRXf00pN4yXwbs2
	 IaAci5NExt1sIe5Qh7acKyEYnfzeDJoRUETVv/pDb30SRqEivFhX//tHMqjW2gaH06Fj3
	 Y0B1O0E0XYLUM/dtx5OJGFfGS8E9A/oo3fDM86HGc8G7l/dWtTI2LqAIW/e1cP/Gpew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mpEWArZF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZKZx0Xp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7125606A330
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 07:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7125606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mpEWArZF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZKZx0Xp
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A23D055958
	for <linux-media@vger.kernel.org>; Mon, 9 Nov 2026 07:25:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0nDnq4cvLaTvdqNRvbn031d0/DpRXR/V3IIurH9/49U=; b=mpEWArZFeN3e9wgf
	cvYc9o3ZD4iSHZb4DUnC9ZwwuT+bTjlktay2CcSD5pFS+m8zRJNpeNWVQRdcieig
	+Ue5bupEGNGqEgzDn4alqvAWOlYnx8WmZMWtN6ANFZVNZDP0EHc5JE5Ejs1JBsTK
	q9Im0jNzTlLgWlmp65v1Vgqmce6QHLFW/IRQLU6nsumubOPZf8Ya9hSQCtNozFu1
	xObmQgpXkHfYEfNj5g5nFuvDOd+MHgUyVTJadmkTec4b3drHJBfTatweEzkrJlCQ
	KvULXB0+tnOujSfWsU8/207O+ZjpQzJjGz1RGqJp9bvbLOW1F8MxFWtlKDekxgIQ
	04kimg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm22kt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 07:25:25 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a2b6fab7a6so379535c88.1
        for <linux-media@vger.kernel.org>; Sun, 08 Nov 2026 23:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794209124; x=1794813924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0nDnq4cvLaTvdqNRvbn031d0/DpRXR/V3IIurH9/49U=;
        b=bZKZx0XpObZPpCcrdNWT7vU2wY+gtU2/E44vgYIExWqQSkiFgqO4Q2eoR2h3wMeVJF
         nn8MGaja5XrQA9gV3ayIv/gp6X2iAWaoQcendUYOWLRRhavbtPHJmQj5GejxBpmYg7CZ
         yn5VrbkZL19B3jieI+c7EX4C3mPsWRg2KDMqDWkbamkBbIQ1j9PTpFsC8zOPTnrpotKH
         t9x6PzF0Ghy6Ps+GYGZLSDya4I2DGW6M5/0EnIadJVgrQ1oAt+vY0fvNuYMbJqXx93XO
         SboSSEDJRGnIpck1SuvpGhlKqgyKJ0jbzjNoWZJo7es+uVi6quLE2yJ+i7IgUZEq7blB
         +Rng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794209124; x=1794813924;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0nDnq4cvLaTvdqNRvbn031d0/DpRXR/V3IIurH9/49U=;
        b=SYbkvPhZAsInLE6H7tF3jF7gJsqSwmejwXv0a7afOkFcaW/NGB6c4mz7Zawj9iyep2
         m/nsNDoEtTgsQh/WigECJDDvC2ApS4DzSSd0CFIHzRJm9Q3CGvO+Lyb7TAJbn1ICA7L/
         P4YnZUke9qx22MYoWo3r1+KBjxGs8vUAR0GEy/pGB8soDFBZoqosJxCTyX277O46ZNBN
         7n/uUr2mOKXzqRyfLohdMKyffamPWMjPy17Ue+7uh7wbaMHxCtg5TGMK63RLTWaEZyxu
         gJAjvN2DDyyID4KmmucFzL/GxEkhFUwh/DcsOQ/r6fsB666jKY6fxZ5ETTfbIoVjtmdG
         sgWw==
X-Forwarded-Encrypted: i=1; AL+hErHqXjEVqwZAR02FKTJ7YabDxKaHTodYNslRylG3oLKWvFqJMLu4aHnd/nwCbVfv6S1iHJntZ/MQlP4mFA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9PIpo5Ebf+FqzAhfECxmcdmbEUr/lfMq3hiIEKC69dwV8piXPK
	HM3CK1IPwb5QOTRmGbUKPMATUIukcWhk7DIpEpdVXLSi51JVSOn56QNIMmp01yAUPEJHqHVUly3
	GRCBWEwBoK+7yd/adyo6ryNX1ZVjUUOHwR7DDdXYXg8//laokGwEKavKNNTG6tn9EHg==
X-Gm-Gg: AYBFou3N7ZKJsXhxhgnmrANWm9yJBPemQRS09xb4OtZgCUnpDeLzZNGZmrKGDsw2otC
	EL82SWI0wmDjOVjEjYCG/I/WN5/+cscrgSRAOH7HCFOACv9oyrD2ekW5ti5KAf6JtPi3mvCK54y
	Y4igCROUBumMaxlfQ3B4ZmGzAAaPyd7rinvn17pN5RTWky0i1GSqmwgPBhFWu0OwnORiyfMBAYo
	lLRbfWij2bcWU/usyHMQlIMdAXnp9XDLPoNKAGPZhySZq4HQ/ezYRb/LmDSotl8TJPks1PWQY6+
	TTwDPkYwKTdN46Ksni0kdBL6nE5wG8zvEov6dlMfnI8tsss0o+dETQGSc+jlhNyGaDBabNtgv/o
	1YCwGQDP6NI96JVlS9YXTljGIAWvgQ654YKMNEvCJq4GX9CjHwuYkGnD4A975Qxgy85myw8uCjP
	vj8pM=
X-Received: by 2002:a05:7022:2513:b0:1ad:1574:aa9d with SMTP id a92af1059eb24-1b39fdad8a3mr6750742c88.0.1794209124232;
        Sun, 08 Nov 2026 23:25:24 -0800 (PST)
X-Received: by 2002:a05:7022:2513:b0:1ad:1574:aa9d with SMTP id a92af1059eb24-1b39fdad8a3mr6750694c88.0.1794209123584;
        Sun, 08 Nov 2026 23:25:23 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e936bsm13400998c88.6.2026.11.08.23.25.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 23:25:22 -0800 (PST)
Message-ID: <1ceec27d-c7b2-91ae-1cce-82e403289ef1@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 12:55:18 +0530
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
Subject: Re: [PATCH 2/3] media: qcom: iris: add error and status details to
 diagnostics
Content-Language: en-US
To: Dipayaan Roy <dipayaan.roy@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org,
        p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261106153126.120858-1-dipayaan.roy@oss.qualcomm.com>
 <20261106153126.120858-3-dipayaan.roy@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20261106153126.120858-3-dipayaan.roy@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyOSBTYWx0ZWRfX2D5hi0bIiCwk
 j/US3rqbabAbMYzGdbAtgyfMkEwRgiUjF8xSRe1MmM4Qo25/b2TPIpC5B5JT93l5YyP9uP8kyFi
 wn9bKrpGFQDq+cFqdXdhksqitbO8hro=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyOSBTYWx0ZWRfX67ZDvgF9DkIL
 dAXYa94ADy4U25GivXDdNQwatUIz0Y7XMNmXjUQYJvFOpESGhF2CG6UvPuluFocPzOUZaCf2qkm
 ZAB+ThxmBS56FhXjoBEbfijVBAiWsX1ZEjE4/EA8dm4tyMtbH2Ss6l6QNaSJs6qdJG5fC4VAJr6
 ZXtSbzPObw9KkKngxgK2yeOfMk3xN2SPFYG+00u3YgwqVLsKShZGCWz88B/k7/mGosTXFvco65d
 pqz4NN9a4sg8SU7mQ/ajvxbJiKy7+tolgg26fZGX5NsKfFr44cjEJO8PjafG5VpdgCIhXWVIeHO
 ilc6CDHWCoOuYnUNXKnAFJ2mMYkDY4ChM99ketd5I1mMLrXGxu+IeGXDyRrKtDR55uSBIaNUkzl
 VIx5z2WGkivk/d5Il6oTjzBnA7LsDOmLsSm2EImdUe6vdUGl00GSCztARKmfQFNlu849rlunAq4
 jdHQ7poadtYFItZr5jg==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af17565 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=95NKR_oHzG1gkGuYyBYA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: Dt_jKOYSzkQiKLGJjI67lERSJ9Y2Lqh5
X-Proofpoint-ORIG-GUID: Dt_jKOYSzkQiKLGJjI67lERSJ9Y2Lqh5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090029


On 11/6/2026 9:01 PM, Dipayaan Roy wrote:
> Several Iris error messages identify a failed operation without showing
> the return code or state that caused it, making failures difficult to
> diagnose.
>
> Include available return codes, hardware status, queue positions, and
> packet or session identifiers in these messages. Also report the header
> details when an HFI response fails validation.
>
> Error handling remains unchanged.
>
> Signed-off-by: Dipayaan Roy <dipayaan.roy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_common.c |  4 ++--
>  .../platform/qcom/iris/iris_hfi_gen1_response.c    |  9 ++++++---
>  .../platform/qcom/iris/iris_hfi_gen2_response.c    |  5 ++++-
>  drivers/media/platform/qcom/iris/iris_hfi_queue.c  | 14 +++++++++----
>  drivers/media/platform/qcom/iris/iris_vb2.c        |  2 +-
>  drivers/media/platform/qcom/iris/iris_vdec.c       |  3 ++-
>  drivers/media/platform/qcom/iris/iris_venc.c       |  3 ++-
>  drivers/media/platform/qcom/iris/iris_vidc.c       |  2 +-
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 23 +++++++++++-----------
>  drivers/media/platform/qcom/iris/iris_vpu4x.c      |  6 ++++--
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 15 ++++++++------
>  11 files changed, 53 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
> index dad906d03fdc..1fd4cecd7956 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
> @@ -138,7 +138,7 @@ int iris_hfi_pm_suspend(struct iris_core *core)
>  	return 0;
>  
>  error:
> -	dev_err(core->dev, "failed to suspend\n");
> +	dev_err(core->dev, "failed to suspend: %d\n", ret);
>  
>  	return ret;
>  }
> @@ -179,7 +179,7 @@ int iris_hfi_pm_resume(struct iris_core *core)
>  err_power_off:
>  	iris_vpu_power_off(core);
>  error:
> -	dev_err(core->dev, "failed to resume\n");
> +	dev_err(core->dev, "failed to resume: %d\n", ret);
>  
>  	return -EBUSY;
>  }
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> index ffa98139f0eb..1ce7f97d4087 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> @@ -301,7 +301,8 @@ iris_hfi_gen1_sys_get_prop_image_version(struct iris_core *core,
>  	u32 i;
>  
>  	if (req_bytes < IRIS_FW_VERSION_LENGTH - 1 || !pkt->data[0] || pkt->num_properties > 1) {
> -		dev_err(core->dev, "bad packet\n");
> +		dev_err(core->dev, "invalid firmware version packet (size %u, properties %u)\n",
> +			pkt->hdr.size, pkt->num_properties);
>  		return;
>  	}
>  
> @@ -382,7 +383,8 @@ static void iris_hfi_gen1_session_etb_done(struct iris_inst *inst, void *packet)
>  
>  error:
>  	iris_inst_change_state(inst, IRIS_INST_ERROR);
> -	dev_err(inst->core->dev, "error in etb done\n");
> +	dev_err(inst->core->dev, "ETB done without input buffer (session %#x, tag %u)\n",
> +		inst->session_id, pkt->input_tag);
>  }
>  
>  static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
> @@ -530,7 +532,8 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
>  
>  error:
>  	iris_inst_change_state(inst, IRIS_INST_ERROR);
> -	dev_err(core->dev, "error in ftb done\n");
> +	dev_err(core->dev, "FTB done without output buffer (session %#x, tag %u, offset %u)\n",
> +		inst->session_id, output_tag, offset);
>  }
>  
>  static enum iris_buffer_type iris_hfi_gen1_buf_type(struct iris_inst *inst, u32 type)
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index f0782c4b1e6e..b82f50458fe1 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -980,8 +980,11 @@ static int iris_hfi_gen2_handle_response(struct iris_core *core, void *response)
>  	int ret;
>  
>  	ret = iris_hfi_gen2_validate_hdr_packet(core, hdr);
> -	if (ret)
> +	if (ret) {
> +		dev_err(core->dev, "invalid HFI response (size %u, packets %u): %d\n",
> +			hdr->size, hdr->num_packets, ret);
>  		return iris_hfi_gen2_handle_system_error(core, NULL);
> +	}
>  
>  	if (!hdr->session_id)
>  		return iris_hfi_gen2_handle_system_response(core, hdr);
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> index bf6db23b53e2..ef556e54f6f1 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> @@ -112,14 +112,18 @@ static int iris_hfi_queue_read(struct iris_iface_q_info *qinfo, void *packet)
>  int iris_hfi_queue_cmd_write_locked(struct iris_core *core, void *pkt, u32 pkt_size)
>  {
>  	struct iris_iface_q_info *q_info = &core->command_queue;
> +	int ret;
>  
>  	if (core->state == IRIS_CORE_ERROR || core->state == IRIS_CORE_DEINIT)
>  		return -EINVAL;
>  
> -	if (!iris_hfi_queue_write(q_info, pkt, pkt_size)) {
> +	ret = iris_hfi_queue_write(q_info, pkt, pkt_size);
> +	if (!ret) {
>  		iris_vpu_raise_interrupt(core);
>  	} else {
> -		dev_err(core->dev, "queue full\n");
> +		dev_err(core->dev, "command queue write failed: %d (size %u, read %u, write %u)\n",
> +			ret, pkt_size, q_info->qhdr->read_idx,
> +			q_info->qhdr->write_idx);
>  		return -ENODATA;
>  	}
>  
> @@ -254,7 +258,8 @@ int iris_hfi_queues_init(struct iris_core *core)
>  						    &core->iface_q_table_daddr,
>  						    GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
>  	if (!core->iface_q_table_vaddr) {
> -		dev_err(core->dev, "queues alloc and map failed\n");
> +		dev_err(core->dev, "failed to allocate HFI queues (%u bytes)\n",
> +			queue_size);
>  		return -ENOMEM;
>  	}
>  
> @@ -262,7 +267,8 @@ int iris_hfi_queues_init(struct iris_core *core)
>  					  &core->sfr_daddr,
>  					  GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
>  	if (!core->sfr_vaddr) {
> -		dev_err(core->dev, "sfr alloc and map failed\n");
> +		dev_err(core->dev, "failed to allocate SFR (%u bytes)\n",
> +			(unsigned int)SFR_SIZE);
>  		dma_free_attrs(core->dev, queue_size, core->iface_q_table_vaddr,
>  			       core->iface_q_table_daddr, DMA_ATTR_WRITE_COMBINE);
>  		return -ENOMEM;
> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
> index 8faf709c26c1..b770cd5349b6 100644
> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
> @@ -135,8 +135,8 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
>  
>  		ret = inst->hfi_session_ops->session_open(inst);
>  		if (ret) {
> +			dev_err(core->dev, "session open failed: %d\n", ret);
>  			ret = -EINVAL;
> -			dev_err(core->dev, "session open failed\n");
>  			goto unlock;
>  		}
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 0dd33ff447bb..d359d3716ba1 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -529,7 +529,8 @@ int iris_vdec_start_cmd(struct iris_inst *inst)
>  			clear_sub_state |= IRIS_INST_SUB_OUTPUT_PAUSE;
>  		}
>  	} else {
> -		dev_err(inst->core->dev, "start called before receiving last_flag\n");
> +		dev_err(inst->core->dev, "start before last buffer (sub-state %#x)\n",
> +			inst->sub_state);
>  		iris_inst_change_state(inst, IRIS_INST_ERROR);
>  		return -EBUSY;
>  	}
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 2f2c56bf9122..a7a0f14a78d1 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -602,7 +602,8 @@ int iris_venc_start_cmd(struct iris_inst *inst)
>  			clear_sub_state |= IRIS_INST_SUB_OUTPUT_PAUSE;
>  		}
>  	} else {
> -		dev_err(inst->core->dev, "start called before receiving last_flag\n");
> +		dev_err(inst->core->dev, "start before last buffer (sub-state %#x)\n",
> +			inst->sub_state);
>  		iris_inst_change_state(inst, IRIS_INST_ERROR);
>  		return -EBUSY;
>  	}
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index 05aab6e3005d..80f0a56712bf 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -168,7 +168,7 @@ int iris_open(struct file *filp)
>  
>  	ret = iris_core_init(core);
>  	if (ret) {
> -		dev_err(core->dev, "core init failed\n");
> +		dev_err(core->dev, "core init failed: %d\n", ret);
>  		pm_runtime_put_sync(core->dev);
>  		return ret;
>  	}
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index c3b760730c98..cd22534c0904 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -17,14 +17,12 @@
>  #define NOC_HALT				BIT(0)
>  #define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
>  
> -static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
> +static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core,
> +					  u32 *power_status)
>  {
> -	u32 value, pwr_status;
> +	*power_status = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
>  
> -	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
> -	pwr_status = value & BIT(1);
> -
> -	return pwr_status ? false : true;
> +	return !(*power_status & BIT(1));
>  }
>  
>  static void iris_vpu3_power_off_hardware(struct iris_core *core)
> @@ -32,10 +30,11 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
>  	u32 reg_val = 0, value, i;
>  	int ret;
>  
> -	if (iris_vpu3x_hw_power_collapsed(core))
> +	if (iris_vpu3x_hw_power_collapsed(core, &value))
>  		goto disable_power;
>  
> -	dev_err(core->dev, "video hw is power on\n");
> +	dev_err(core->dev, "video hardware still powered on (status %#x)\n",
> +		value);
>  
>  	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
>  	if (value)
> @@ -78,10 +77,11 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
>  	u32 count = 0;
>  	int ret;
>  
> -	if (iris_vpu3x_hw_power_collapsed(core))
> +	if (iris_vpu3x_hw_power_collapsed(core, &value))
>  		goto disable_power;
>  
> -	dev_err(core->dev, "video hw is power on\n");
> +	dev_err(core->dev, "video hardware still powered on (status %#x)\n",
> +		value);
>  
>  	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
>  	if (value)
> @@ -116,7 +116,8 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
>  	} while (++count < 1000);
>  
>  	if (!handshake_done && handshake_busy)
> -		dev_err(core->dev, "LPI handshake timeout\n");
> +		dev_err(core->dev, "LPI handshake timeout (status %#x)\n",
> +			value);
>  
>  	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
>  				 reg_val, reg_val & BIT(0), 200, 2000);
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
> index 90ccdc0d2a07..0369f2497f76 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
> @@ -117,7 +117,8 @@ static void iris_vpu4x_power_off_apv(struct iris_core *core)
>  	} while (++count < 1000);
>  
>  	if (!handshake_done && handshake_busy)
> -		dev_err(core->dev, "LPI handshake timeout\n");
> +		dev_err(core->dev, "APV LPI handshake timeout (status %#x)\n",
> +			value);
>  
>  	writel(0x080200, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
>  	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
> @@ -314,7 +315,8 @@ static void iris_vpu4x_power_off_hardware(struct iris_core *core)
>  	} while (++count < 1000);
>  
>  	if (!handshake_done && handshake_busy)
> -		dev_err(core->dev, "LPI handshake timeout\n");
> +		dev_err(core->dev, "hardware LPI handshake timeout (status %#x)\n",
> +			value);
>  
>  	writel(MVP_NOC_RESET_REQ_MASK, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
>  	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 243bd845349f..4a56856a8df5 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -83,7 +83,8 @@ int iris_vpu_boot_firmware(struct iris_core *core)
>  	while (!ctrl_status && count < max_tries) {
>  		ctrl_status = readl(core->reg_base + CTRL_STATUS);
>  		if ((ctrl_status & CTRL_ERROR_STATUS__M) == 0x4) {
> -			dev_err(core->dev, "invalid setting for uc_region\n");
> +			dev_err(core->dev, "invalid UC region setting (CTRL_STATUS %#x)\n",
> +				ctrl_status);
>  			return -EINVAL;
>  		}
>  
> @@ -92,7 +93,8 @@ int iris_vpu_boot_firmware(struct iris_core *core)
>  	}
>  
>  	if (count >= max_tries) {
> -		dev_err(core->dev, "error booting up iris firmware\n");
> +		dev_err(core->dev, "firmware boot timed out (CTRL_STATUS %#x)\n",
> +			ctrl_status);
>  		return -ETIME;
>  	}
>  
> @@ -128,7 +130,8 @@ int iris_vpu_watchdog(struct iris_core *core, u32 intr_status)
>  	u32 wd_intr_mask = core->iris_platform_data->wd_intr_mask;
>  
>  	if (intr_status & wd_intr_mask) {
> -		dev_err(core->dev, "received watchdog interrupt\n");
> +		dev_err(core->dev, "received watchdog interrupt (status %#x)\n",
> +			intr_status);
>  		return -ETIME;
>  	}
>  
> @@ -172,7 +175,7 @@ int iris_vpu_prepare_pc(struct iris_core *core)
>  	ctrl_status = readl(core->reg_base + CTRL_STATUS);
>  	wfi_status = readl(core->reg_base + WRAPPER_TZ_CPU_STATUS);
>  	wfi_status &= BIT(0);
> -	dev_err(core->dev, "skip power collapse, wfi=%#x, idle=%#x, pcr=%#x, ctrl=%#x)\n",
> +	dev_err(core->dev, "skip power collapse (wfi=%#x, idle=%#x, pcr=%#x, ctrl=%#x)\n",
>  		wfi_status, idle_status, pc_ready, ctrl_status);
>  
>  	return -EAGAIN;
> @@ -365,7 +368,7 @@ int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core)
>  	} while (++count < 1000);
>  
>  	if (!handshake_done && handshake_busy)
> -		dev_err(core->dev, "LPI handshake timeout\n");
> +		dev_err(core->dev, "LPI handshake timeout (status %#x)\n", val);
>  
>  	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS,
>  				 val, val & BIT(0), 200, 2000);
> @@ -530,7 +533,7 @@ int iris_vpu_power_on(struct iris_core *core)
>  err_unvote_icc:
>  	iris_unset_icc_bw(core);
>  err:
> -	dev_err(core->dev, "power on failed\n");
> +	dev_err(core->dev, "power on failed: %d\n", ret);
>  
>  	return ret;
>  }

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

