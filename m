Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116752;
	b=h9Zp7LSmUBaN6FHgIlZI9LnzwDilKTmuGf9eNDLCZYC9dmF+LKh7sg4Xki0g8tZN04op
	 iU0QBnm4Jl/P5jDLVvkhtwB4v1JJaCLxbKqB93fmcbeZfGW0qrYvuFJVBciw4VDjW+f5S
	 3WuR5l72NUHEjkN6YFi8ZcM9D9Gn5eFGdDuDXqt9ReXJ5IpHT5Xfd66Loiv6HHOQMuGnI
	 8WN+ScLH4uANtUQGzqYKA3fy3ygs0D7vIZscZtnAIeAXMkIePlbg0ISwW2h2TxmBMhHkC
	 c9aFOoszyOMXnr+vZ5SmgKIQNNmokjVZNqSjWj+l6m96MCU6gcZ2jTq0VWrKGKHVbSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116752;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GMN+ruGYxORaH9Ni1nvqyO3bP8xaG+U6mlmhg6vR8Ag=;
	b=mJAzTe0I4bXwyHYFi1j1up9echxE5SMdwd5RV5yfUSWEXZMC1nEan6IElWG+uWMJwFL5
	 MOIfcUFp+UOj7PcZXBrYrcPLhKn9fZWCwMle8ZSD4sZ8aUcZoEKXBIZJDI0EAzSUI9k6M
	 rGzRg5/muZk4ThQU5ECiFXlUNGFPS2ATaK1JhZWxFOWSy05GrS09IDXIT9Y08GlCGQ2cD
	 FIO9eEENK4i6Mn9fdUFcBqdZLhVztwgyHK4kSLjtXkPrg0/cFG9Lf9x85n+doHoTPR1w+
	 c2igz2YNClnR09R1Cmt77uwk/gQnkaVCe91T2DEqr6t9m1Hov58f3aPAxoLbS8bGd9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I4phRJnz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RYBFzOY2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2313B606A326
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 15:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2313B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I4phRJnz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RYBFzOY2
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFL0j13153182
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 15:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GMN+ruGYxORaH9Ni1nvqyO3bP8xaG+U6mlmhg6vR8Ag=; b=I4phRJnzrUKYK7Br
	ACWx3OOv3j4NjeHcrYd6Xi6dk33MBsrOIp0fJlH/lEz1JMsJ2XXmV+omiIQjxpcq
	8oTNs7g0NG5bPoEQfOUwDUrBmAqZBbrLX+9N9UVK7IAxd7MpuKfy7xIbw9pgbw2G
	XtWbmpc++GA5r9ExITJBbVU8C4EdTRCxX/yxEof8+5bDfEpKfDLaU6ZM9T9VxrMB
	IC4DuXNZCpyd/4LQ+o3i5v4iS7wjk0gLWo1HHEkJDq1UW1yNkedYyn89C3jgEQnX
	KL8MtAYw7rW9G5V6R5kIsnUWCQqTwq8Abh8XtFima3Zg9QQ9yuROAvyYMYrqyzHc
	kzzJXA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw2201c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 15:59:10 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73a1cf1638fso83582137.1
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 08:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793116749; x=1793721549; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GMN+ruGYxORaH9Ni1nvqyO3bP8xaG+U6mlmhg6vR8Ag=;
        b=RYBFzOY2femEOpAp/VinqOCHifwaLHqsGb/uVhBOAt4F0SGP6MRbCZaejX3XMvO76O
         ObHqoywn2wAsC89gvb4uMbRrAH1ThcPeX3/TvINmAWP1ugOln0KAE7CJU9VbmqEIDT71
         oVzfGFTYJZkAs+APukcSUFRM1L1ecME2Ppi1IoF2eNm3MAT210cufuJcyvwFreuAP2Q7
         cMiLBEo6kJPv63s7K4FqjGbHvlYzWtvl/SUPwVdE7/dOt8lK8Yz+g4N7JrNmpqJOyBWx
         TNpVLXjeDAFrrnamUy6GIF924ftx6ClEugDYU8asNwdALMnmjskfhM4lpwqHgXxId24c
         htnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116749; x=1793721549;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GMN+ruGYxORaH9Ni1nvqyO3bP8xaG+U6mlmhg6vR8Ag=;
        b=sYwgd2s7B9r+ByF7nN7kJiCrlnkdKA834p0mveFlK4JPsZDQ8Sqzc8p/Hv/rhqhXRD
         yhEww+2wjokvxr6ewmKUnsIwCFjBDTBgSUGP8ZU2sfe+haInOfzgs4kisboj35bXlqBP
         +PKJIj0SDVybUMbbH2qMVKIavJE/zQ3+oHJr1jNdZOVwhtaNN58Ofeir2mm96IbPuvzO
         Wei6OJuseQ6720LwgGN4AMBUtD7qwc7V/6mE/RiopGwBnJlFewBMNLeLjeWMZctW3hRo
         7VnIFArMwRfWBpvRO6jwQaEFM+b8iY16+j0UJ9m/RqSCJU6tl0UEJTXgILyf5oOQPSaG
         eQ4A==
X-Forwarded-Encrypted: i=1; AKwUvByvM3Ggt0UwyutuGEbCZkTwZ1lVpxYuLpZkfUoIP2Z8RB3vWq+PJoOm6Rf0uriWacZrwTJyuuadX8UcqA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJtBAUGxfSvuDoaTFhFd4JJULwSeL7MtFWaOLTYtBwkw1ANBEBX
	bnAUagjrXE+CyZKBWvqi8sl2qTdKyZ3X/fIMYq734vPsMoMplm8XbVx1w5GSOTol8EqHxmak05x
	vTrNkucnppWG0qX0ryA1wVyVxTOePDBK2uByaU90tHIJg7bH0MqtOQi3GZSbtfupD9Y7I9bIXMg
	==
X-Gm-Gg: AYBFou3PD1NyZLM7VxZyefXAwOG85PJUc5EB/KLDwMXVn1lTH8QiMD777denZv9dgpF
	yTdj4uz9ag6C2/hpb+2romDKkRf0vKYddOXkLTABK/8Kn7HSzeb4xRv+Jdz66frN6ZEjQiALvli
	sNFB95tDXav1C3UpzBUYtd9bcImfbxZu6WQchzXw1qC/60m2Q8Lqrlfig1npxdCW2qziTF9mEgw
	prkUSH2O4FS6oTyFz6XekK8AvRPV3MCLos1G6g5G7vSvhmMzCbqS4goAgK4O/d8dV6CIrQqEDj/
	Lntcm9s7Eia73fl6gf32c0onmgkKuzEd4tVu9oevTZeuoRd1iMuZ72M9LUusenUYjINkhZSILSJ
	BXsLibxrSJpY8iDctGQRXEg==
X-Received: by 2002:a05:6102:a1d8:20b0:7cc:22a0:de89 with SMTP id ada2fe7eead31-7ce5ccbc119mr3653043137.3.1793116749497;
        Tue, 27 Oct 2026 08:59:09 -0700 (PDT)
X-Received: by 2002:a05:6102:a1d8:20b0:7cc:22a0:de89 with SMTP id ada2fe7eead31-7ce5ccbc119mr3653024137.3.1793116748950;
        Tue, 27 Oct 2026 08:59:08 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b49807e07fsm148356a12.25.2026.10.27.08.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 08:59:07 -0700 (PDT)
Message-ID: <f6018fd7-8ae1-46cc-94a1-cca06ae318f1@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 16:59:03 +0100
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
Subject: Re: [PATCH v2 2/3] media: qcom: Use PAS API for video memory
 protection
To: Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20261027-pas-video-v2-0-5b52bca5add6@oss.qualcomm.com>
 <20261027-pas-video-v2-2-5b52bca5add6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-pas-video-v2-2-5b52bca5add6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MyBTYWx0ZWRfXwCHot2IY7bKM
 DYJk2304263odIHIvIsRIsLgC8TX3hMRwj0wtPQdvNyo3MoO764mUKeT9gVMWtwqGRkZwLjDa2g
 TtvBnTkJnUNDvGLKt8lnek12WvdMvUzDLILj4UwlJRTBcpV+YIQHVP9xffh6Ip4F8+PNSH/4Ffu
 7UKQj3toeGIV9gj8mGLohHo8SalJ93qkLhJdwg+dW26wz2e/68heIYIIapdQIDNRnCvbiDm217B
 HHlrah4cVg2GuhO75KOHmFqJOnGBXGb/I5Paut8hbZ9kimyvuPSVS20sCNHSCoZcEE2YjId7FGr
 SWQCg6ivqddvGa9ocROG0rtKUxBUI7aHXz1MLn2mrD2utpjLg9P9K1jNmk3ncNVoww3XVgWP3wg
 7IGfjEnmYbj6Ux3IaRclvp9+qnYulTi6lJvZU3Dxwc+lpjtW1MX65592JmBMQqDdFY/uF/lbO8d
 dv2uCSUlp3TG4LizUQw==
X-Proofpoint-GUID: MgzoweNUhdYDbLogCJCjaNrlZ_Ym4tsv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MyBTYWx0ZWRfX9+WqfcqJjWa/
 8IomkbCSyIdkPR0YJsVeCc7WjuZIxygRnMXXgiD9T9aMcKonpbxhVWY1aW28YMTJo4p2wtsAkDI
 HfIUR7b5Lw9U968YencyflupX3rr1Qo=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae0ca4e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ws2DSkxJg1jgmxyaqeMA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: MgzoweNUhdYDbLogCJCjaNrlZ_Ym4tsv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270063

On 10/27/26 1:39 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Replace the direct qcom_scm_mem_protect_video_var() calls in venus and
> iris with qcom_pas_mem_protect_video_var(), so that the call is only
> issued when the active PAS backend needs it. This allows the video
> codecs to bring up firmware with the OP-TEE PAS backend as well, with
> no functional change for the SCM backend.
> 
> As the video drivers no longer call into SCM directly, also drop their
> Kconfig selection of QCOM_SCM.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
