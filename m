Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772783;
	b=p/en/JDSOTVgxd6buMf3UPOPk8etWgZioFT+gGtKKmNxAy+I177JH9QXiAOYEZiCfpwb
	 UNnOtI0kG0rH1oiGcWdTBX0HyqvOiuWSq7ajw2KPYNuOG5RuVntbeJe68q04N/pVdMrII
	 2if+7jXnlzYisEcOml0fRtec7Xuq1q4CzmnNm1X4DDDkG7rTcApN3PypQB9yeCYGwTQHf
	 PUb+T0dMc5g+mSn3J5PRplRORGSYOqAFVtxL2neziKuRa5/W0R0GZcnM2rmhc96e62wdN
	 N7dUQp5XbMVRdLZQtMAgmkeMISclQqOr6Hk2orjGBMpYKqOQqLU7houkgF1U8E59G9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772783;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YxKSlO+moGy/0VDy261jO9fGPMmC050avn3F2JluBAA=;
	b=DKeNYQNg3xjHNpiiMRgAkMlsH6L0670sc9PwzUX7a5CQttP32bvj2RQHx3CIS4IfqrNA
	 uE+4PFLJTAAuUndjvfcvzDs1s4NKJ4qasJ63/fC+7EtPUQo4EXLbAdcaTD74bveU3EwG4
	 vyIzZOKIaCMl+tXD6Kxcv1Q8X6+uTSRvoUZQ7DzDlxoVML4kpjKfFGGjeax/c94WtFT1f
	 e5urY4rQPdt60kSlZ5oX/j06AKfWvCy6lpTvF9vdO5w2VFpHfZ796O3YyZ6aU96/ctpJZ
	 pmINLJ+dF/fbSfx4W+Pbht+TU4A6+XAE2jTVqnGcICmXOQA5+cOC+Vs0LdMV+0NBaBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TqgV4653;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FSUWuVEY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AA5606A31E
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 09:46:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48AA5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TqgV4653;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FSUWuVEY
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7H1Te1076480
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 09:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YxKSlO+moGy/0VDy261jO9fGPMmC050avn3F2JluBAA=; b=TqgV4653DkLm6qkz
	RlPLfQBpnyFjhT3TU+1XMh9kPuI+jN3rszvdilnmyVAVaah5E85sngPVHehl6kiN
	EB0YWygwrJON462cztZYudwLWboBJCWeTTfZUlLOhRSahJjp//V4jbnZrWKKqU/n
	Ta1mIJhLmKi/uf3FyrOD9+vZx7tjtpg+CUUWnu7AGpbCf4A5GSyVF1DV08goR0gP
	rmuq1VmWqUOoWu8xEtRrywr3teSbzl/QTHLq/RuSJtMLu2xf1QUv1wKPj43+fk1j
	Qb1nt1EllfZjGevExiaZxtEYu3mXgwzmW7MuMbVvj2xCgPL7VzaYlrh0kUy8WEab
	w3VyYA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55t9yg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 09:46:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386b8624cf7so6680599eec.1
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 01:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795772781; x=1796377581; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YxKSlO+moGy/0VDy261jO9fGPMmC050avn3F2JluBAA=;
        b=FSUWuVEYy2Z3A4FjS3mYNm51kUraX0wPp8a/BGuYCrlvu5tVXuDj1fl9soR3mvEKZT
         EJs91zKwnRd3uVtbL+z3b/yequfp5+YF31Hz3i1gW5VA5jbbnR/3yZ6ibBIkIXN8C2Z2
         ik1zeLyoknkaXy8I9P94vIDcvT6L41D8KK4g5ZXDybqoJhNlz2GIq3RoEgELu6n+Bn35
         9lMZ/c9ZjD9mKSDpMSaWok+aSv0cIbN5cWTkg/w5JvW/ha24xYXNo0bOcKABAngbGJPs
         36apGIaqjdIEUUS6fKPadbrmaDBMkXSyAQMN5Y2k3J5vjFXcRi7bDBzYHW6oR5bQMj1M
         mq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772781; x=1796377581;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YxKSlO+moGy/0VDy261jO9fGPMmC050avn3F2JluBAA=;
        b=pklp+3J1dRxEHkSpTaYBrLJdQV4Fe2I8eLRy1XrnBRboW8im2816svOzjJH/GDr0mb
         HCtei9zpZT/uwFiJN+NIlGOfGipZbqeb+uNy/Ry3AMvmmGOhzZLQU2Bl0KNbjL3dp5NI
         Rj2QyZ5HFnz4eYWMFX7ZC/WUhO0Agc1INI21EsMZwnFCpxwdlF7G2M8Onur/MR7cUeBd
         8egMTFWJydc6dvvVG6SULCew/EnoQ7wScfbWLx51GLRCCKz/Ym7E7sNdDLm83L0Hgqvw
         XdhVHWBhlIZGRek3MQnRgV0WDV9l3q7Mnt4QwWNZTqp3GYGQn9P4IsvXpYULvG7R/Shj
         lCKg==
X-Gm-Message-State: APuU4Z///nnxRsXRTM6CzMbGdd76QdstlM96DqpCX7kiYnvJIMksoVxR
	jkzj1FgcDCfh0DRvi4XFPWJ3W+AoozokhRhbJ2fwk7eDPVxbD0qpKQa7rzxFhId8cRUK1UibJi1
	VK2CmytXHCLZdHaoOKuL32me5+l+9M2GQQhjokG2Bko/hCfnrIzWMKFByizwNNJ3eDw==
X-Gm-Gg: AZFdTZcpnmdxa8WuxzUlc4IzPV75XJcnOavt3l/NXov5W3hBdv5A/zJqIXUfzdZQJJm
	Wj/NQIqZk3NzsptlTsd7KKJoW/55y+X/F0VHug2bdHfNY35fp4hHcqrg6n/euEZg4ryka16tmXm
	3d1B0OF6znX/qhx06F6+XDG5bH6q+Asj0DzX085ztGy1rIj5geDnAOXLVvrmvqoUGQIhHzBcqrt
	JaoyaaHErkLv12VYe/H8lccDdpXX/nnmMlG+ppVQRILfoAT5bDml/Vg7UU9hteMiWmap8CMfLp6
	lXKv13nbI489yvhYVsC17eZgIqRHyVN9QQNWR0LsM65yUsWOuhRPsziJ15OIOh7rVZFqordunsL
	wfs/pDi/t9UL347S/ebzBGGoJnpb+crIuRJ29o4IgddAi3Qiysjv7VSc9BWEN97s0SVWXuNoSzp
	QA6dEf
X-Received: by 2002:a05:7301:dc3:b0:386:ce5a:41aa with SMTP id 5a478bee46e88-386ce5a47f9mr7306860eec.13.1795772780920;
        Fri, 27 Nov 2026 01:46:20 -0800 (PST)
X-Received: by 2002:a05:7301:dc3:b0:386:ce5a:41aa with SMTP id 5a478bee46e88-386ce5a47f9mr7306841eec.13.1795772780452;
        Fri, 27 Nov 2026 01:46:20 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm66869920eec.16.2026.11.27.01.46.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:46:19 -0800 (PST)
Message-ID: <6ca6b0f2-575a-6c1c-5b97-73f22d369438@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:16:12 +0530
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
Subject: Re: [PATCH 4/5] media: iris: Preserve timestamps on error buffers
Content-Language: en-US
To: Xilin Wu <sophon@radxa.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, dragon@radxa.com,
        Chris Obbard <chris.obbard@oss.qualcomm.com>,
        Deepak Sikri <sikrid@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Loic Minier <loic.minier@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>
References: <20261029-iris-va-fixes-v1-0-44a2783f782b@radxa.com>
 <20261029-iris-va-fixes-v1-4-44a2783f782b@radxa.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20261029-iris-va-fixes-v1-4-44a2783f782b@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX924oPpjyq52x
 e2IxUNfI4pz3dw8kRQb94JZgqvXUHgslFuistEOeMMZL+eomnzoi/W1pnmLnEFb09O9j3DewRiL
 zxBlYkYMttqJf+MC7+w2fiTqlFC41p8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX3mv0mIEpK546
 XBZP9iTqv4iEd0siZn54U1iPp97ZbA6MH0F0bQuz2nG+64cfb2EF/+BRqvjZ6D7OyY9yrIc2NU8
 qRG0D9Oy9faZ+HJzIW7R74aOA6+Qzby8MnhDvNQFh8M0+IVUfNYwNfLzIlkaIN+/poKvLaX5lAN
 Rze7NHkn8Tezc33/zo5q4XHhkkzHwZkTN22qsJ+OhQ8hr3PLKbk/5Yiq7jEysesAOzJ3sfKDyCe
 pYPQ5Qn1XRYQvU94I6jyyIheVO1leMLUeTLit6v9NAkzzJ1rNEC7YpuFjZJGgbEnr694YXC8bBf
 uuKBoz6coreZN8o+LyvzRbiCpnwJE8T3UA1SvH+MRbCRQfaa4BZZLTDdlbM1zrS8nk+98j94TKd
 NuOjNJYSUuhgv2QtCmczzITwesuILtrh6nusdwD6rUMPr8LqwZcceYtEMaAoCT78u3UGFX0wo42
 iPROXx9uD/GzqIwkfWg==
X-Proofpoint-ORIG-GUID: EDSptCM-H6OBtpCJlKisEVjfJ8-52a7C
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b09516e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=pyson8MKFhwrqUQxeQwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: EDSptCM-H6OBtpCJlKisEVjfJ8-52a7C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270038


On 10/29/2026 9:28 AM, Xilin Wu wrote:
> Clearing timestamps on error buffers prevents clients such as libva-v4l2
> from identifying the failed picture and can cause synchronization timeouts.
>
> Preserve the firmware-provided timestamp when returning an error buffer.
>
> Fixes: b791dcfcba3a ("media: iris: Add handling for corrupt and drop frames")
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index eb8de60c1177..f790483d13d4 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -899,7 +899,8 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
>  	if (buf->flags & V4L2_BUF_FLAG_ERROR) {
>  		state = VB2_BUF_STATE_ERROR;
>  		vb2_set_plane_payload(vb2, 0, 0);
> -		vb2->timestamp = 0;
> +		/* Allow userspace to associate the error with the input frame. */
> +		vb2->timestamp = buf->timestamp;
>  		v4l2_m2m_buf_done(vbuf, state);
>  		return 0;
>  	}

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

